import React, { useEffect, useState } from 'react';
import { toast } from 'react-toastify';
import { adminApi, adminData, adminError, adminPage } from '../../../api/admin/admin-api-service';
import { billingApi } from '../../../api/billing/billing-api-service';
import ListPagination, { DEFAULT_PAGE_SIZE } from '../../components/ListPagination';
import { BillDetail, BillDetailView } from '../account-reports/BillDetailModal';
import '../BillingPage.css';
import '../master/Master.css';

type Row = {
  id: number;
  billId: number;
  billNo: string;
  action: string;
  details: string;
  date: string;
  time: string;
  userName: string;
};

type AdminBill = {
  billNo: string;
  date: string;
  total: number;
  prodDisc: number;
  extraDisc: number;
  payable: number;
  paid: number;
  cash: number;
  bank: number;
  balance: number;
  lines: { productName: string; qty: number; price: number; disc: number; total: number }[];
};

const today = () => new Date().toISOString().slice(0, 10);

const actionLabel = (action?: string) => {
  const value = (action || '').toUpperCase();
  if (value === 'EDIT') return 'Edited';
  if (value === 'CANCEL') return 'Cancelled';
  if (value === 'DATE_CHANGE') return 'Date changed';
  if (value === 'PAYMENT_CHANGE') return 'Payment changed';
  return action || '-';
};

const fromAdminBill = (data: AdminBill): BillDetail => ({
  billDisplay: data.billNo,
  date: data.date,
  time: '',
  priceTotal: Number(data.total || 0),
  productDiscount: Number(data.prodDisc || 0),
  extraDiscount: Number(data.extraDisc || 0),
  payable: Number(data.payable || 0),
  paid: Number(data.paid || 0),
  balance: Number(data.balance || 0),
  cashPaid: Number(data.cash || 0),
  bankPaid: Number(data.bank || 0),
  items: (data.lines || []).map((line) => ({
    name: line.productName,
    qty: Number(line.qty || 0),
    price: Number(line.price || 0),
    discount: Number(line.disc || 0),
    total: Number(line.total || 0),
    gst: 0,
  })),
  payments: [],
});

const EditLogDetailModal: React.FC<{ row: Row; onClose: () => void }> = ({ row, onClose }) => {
  const [bill, setBill] = useState<BillDetail | null>(null);
  const [loading, setLoading] = useState(true);
  const [missing, setMissing] = useState('');

  useEffect(() => {
    let live = true;
    const load = async () => {
      setLoading(true);
      setBill(null);
      setMissing('');
      const cancelled = (row.action || '').toUpperCase() === 'CANCEL';
      if (!cancelled && row.billNo) {
        try {
          const res: any = await billingApi.printBill(row.billNo);
          if (!live) return;
          if (res?.success && res.data) {
            setBill(res.data);
            return;
          }
        } catch {
          // cancelled or missing bills fall back to admin detail
        }
      }
      if (row.billId) {
        try {
          const data = adminData<AdminBill>(await adminApi.billDetail(row.billId));
          if (!live) return;
          setBill(fromAdminBill(data));
          return;
        } catch {
          // still show the edit log even if the bill is gone
        }
      }
      if (live) setMissing('Bill not found or no longer available.');
    };
    load().finally(() => {
      if (live) setLoading(false);
    });
    return () => { live = false; };
  }, [row]);

  return (
    <div className="pos-modal-back" onClick={onClose}>
      <div className="pos-modal" style={{ width: 'min(960px, 100%)', maxHeight: '88vh' }} onClick={(e) => e.stopPropagation()}>
        <div className="pos-modal-head">
          <h4>Edit details — {row.billNo || 'Bill'}</h4>
          <button className="pos-btn pos-btn-outline" type="button" onClick={onClose}>Close</button>
        </div>
        <div className="mst-form" style={{ marginBottom: 16 }}>
          <div className="mst-fg"><label>Bill No</label><input className="mst-inp" readOnly value={row.billNo || '-'} /></div>
          <div className="mst-fg"><label>Action</label><input className="mst-inp" readOnly value={actionLabel(row.action)} /></div>
          <div className="mst-fg"><label>Date</label><input className="mst-inp" readOnly value={row.date || '-'} /></div>
          <div className="mst-fg"><label>Time</label><input className="mst-inp" readOnly value={row.time || '-'} /></div>
          <div className="mst-fg"><label>User</label><input className="mst-inp" readOnly value={row.userName || '-'} /></div>
          <div className="mst-fg span-2">
            <label>Full edit details</label>
            <div className="el-full-details">{row.details || 'No extra details recorded.'}</div>
          </div>
        </div>
        <div className="mst-card-h" style={{ margin: '0 0 10px', paddingLeft: 0 }}>Bill details</div>
        {loading ? (
          <div className="mst-empty">Loading bill…</div>
        ) : bill ? (
          <BillDetailView bill={bill} />
        ) : (
          <div className="mst-empty">{missing}</div>
        )}
      </div>
    </div>
  );
};

const EditLogPage: React.FC = () => {
  const [from, setFrom] = useState(today());
  const [to, setTo] = useState(today());
  const [rows, setRows] = useState<Row[] | null>(null);
  const [total, setTotal] = useState(0);
  const [page, setPage] = useState(0);
  const [selected, setSelected] = useState<Row | null>(null);

  const search = async (p = 0) => {
    try {
      const pg = adminPage<Row>(await adminApi.editLog(from, to, p, DEFAULT_PAGE_SIZE));
      setRows(pg.items);
      setTotal(pg.total);
      setPage(p);
    } catch (err) {
      toast.error(adminError(err, 'Could not load edit log'));
    }
  };

  return (
    <div className="mst-page">
      <h2 className="mst-title"><i className="fas fa-history" /> Edit Log</h2>
      <div className="mst-card" style={{ marginBottom: 12 }}>
        <div className="mst-card-b mst-form">
          <div className="mst-fg"><label>From Date</label><input className="mst-inp" type="date" value={from} onChange={(e) => setFrom(e.target.value)} /></div>
          <div className="mst-fg"><label>To Date</label><input className="mst-inp" type="date" value={to} onChange={(e) => setTo(e.target.value)} /></div>
          <div className="mst-actions">
            <button className="mst-btn mst-btn-primary" type="button" onClick={() => search(0)}>Generate</button>
          </div>
        </div>
      </div>
      {rows && (
        <div className="mst-card">
          <div className="mst-card-h">Edits and cancellations from {from} to {to} ({total})</div>
          <div className="mst-table-wrap">
            <table className="mst-table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Bill No</th>
                  <th>Action</th>
                  <th>Details</th>
                  <th>Date</th>
                  <th>Time</th>
                  <th>User</th>
                </tr>
              </thead>
              <tbody>
                {rows.length === 0 && <tr><td colSpan={7} className="mst-empty">No edits or cancellations in this period.</td></tr>}
                {rows.map((row, i) => (
                  <tr
                    key={row.id || `${row.billNo}-${i}`}
                    className="mst-click-row"
                    title="Click to view full edit and bill details"
                    onClick={() => setSelected(row)}
                  >
                    <td>{page * DEFAULT_PAGE_SIZE + i + 1}</td>
                    <td>{row.billNo}</td>
                    <td>{actionLabel(row.action)}</td>
                    <td title={row.details}>{row.details}</td>
                    <td>{row.date}</td>
                    <td>{row.time}</td>
                    <td>{row.userName}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          <ListPagination page={page} size={DEFAULT_PAGE_SIZE} total={total} onChange={(p) => search(p)} />
        </div>
      )}
      {selected && <EditLogDetailModal row={selected} onClose={() => setSelected(null)} />}
    </div>
  );
};

export default EditLogPage;

select l.loan_id, l.status, count(distinct t.trans_id) as nooftrans, (981231-a.date) as ageofaccount, 
d.A12 as 95unemp, d.A13 as 96unemp, dp.type,
l.amount as loanamount, c.birth_number, d.A15 as crime95, d.A16 as crime96,
round((l.amount-l.payments)/l.amount,2) as ratiopaid
from loan l
left join trans t
using(account_id)
left join account a
using(account_id)
left join district d
on a.district_id = d.A1
left join disp dp
on a.account_id= dp.account_id 
left join client c
using(client_id)
group by loan_id, l.amount, status, d.A12, d.A13, c.birth_number, d.A15, d.A16, (981231-a.date),
 dp.type, round((l.amount-l.payments)/l.amount,2)

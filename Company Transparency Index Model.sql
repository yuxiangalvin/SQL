#Legal_Illegal_Record with Company_Transparency
#Before Improvement

select case when score>=0.8 then 'high'
            when  score>=0.6 and score <0.8  then 'mid'
              else 'low' 
                end Transparency_Level,
       case when t.pripid in
                             (select distinct l.pripid
                              from da_transparency_analysis t join sichuan_source.e_baseinfo a on a.pripid=t.pripid 
                              join 
                              (
                              (select f.caseid, g.pripid from sichuan_source.case_cf_baseinfo f join sichuan_source.case_cf_partyinfo g
                              on f.caseid=g.caseid)
                              /*union all
                              (select h.caseid, k.pripid from sichuan_source.case_se_baseinfo h join sichuan_source.case_se_partyinfo k
                              on h.caseid=k.caseid)*/
                              ) l on a.pripid=l.pripid
                              where a.enttype not like '9%'
                              )
            then 'Illegal'
            else 'Legal'
            end Legal_Record,
       t.*
from da_transparency_analysis t 
order by Transparency_Level

-----------------------------------------

#After Improvement:

select case when score>=0.8 then 'high'
            when  score>=0.6 and score <0.8  then 'mid'
              else 'low' 
                end Transparency_Level,
       case when l.caseID is null 
            then 'Legal'
            else 'Illegal'
            end Legal_Record,      
            t.pripid, t.score, 
            T0101,T0102,T0201,T0202,T0203,T0204,T0205,T0206,T0207,T0208,T0209,T0210,T0211,T0212,T0213,
T0301,T0302,T0303,T0304,T0305,T0306,T0307,T0308,T0309
                         
from da_transparency_analysis t join sichuan_source.e_baseinfo a on a.pripid=t.pripid 
left join 
(
(select f.caseid, g.pripid from sichuan_source.case_cf_baseinfo f join sichuan_source.case_cf_partyinfo g
on f.caseid=g.caseid)
/*union all
(select h.caseid, k.pripid from sichuan_source.case_se_baseinfo h join sichuan_source.case_se_partyinfo k
on h.caseid=k.caseid)*/
) l on a.pripid=l.pripid
where a.enttype not like '9%'

----------------------------------------

#Operation_Normality with Company_Transparency


select case when score>=0.8 then 'high'
            when  score>=0.6 and score <0.8  then 'mid'
              else 'low' 
                end Transparency_Level,
       case when l.pripid is null 
            then 'Normal'
            else 'Abnormal'
            end Operation_Normality,
            t.pripid, t.score, 
            T0101,T0102,T0201,T0202,T0203,T0204,T0205,T0206,T0207,T0208,T0209,T0210,T0211,T0212,T0213,
T0301,T0302,T0303,T0304,T0305,T0306,T0307,T0308,T0309
                         
from da_transparency_analysis t join sichuan_source.e_baseinfo a on a.pripid=t.pripid 
left join 
(
select n.busexclist, n.pripid, n.remdate from sichuan_source.ao_opa_detail n
) l on a.pripid=l.pripid
where a.enttype not like '9%'
and l.remdate is null

--------------------------------------

#Random_Inspection_Result with Comapny_Transparency

select distinct case when score>=0.8 then 'high'
            when  score>=0.6 and score <0.8  then 'mid'
              else 'low' 
                end Transparency_Level,
       case when l2.pripid is null 
            then 'Normal'
            else 'Abnormal'
            end Random_Inspection,
            t.pripid, t.score, 
            T0101,T0102,T0201,T0202,T0203,T0204,T0205,T0206,T0207,T0208,T0209,T0210,T0211,T0212,T0213,
T0301,T0302,T0303,T0304,T0305,T0306,T0307,T0308,T0309
                         
from da_transparency_analysis t join sichuan_source.e_baseinfo a on a.pripid=t.pripid 
right join 
(
select distinct r.pripid, r.insdate, r.raninscheckres from sichuan_source.dr_raninsres r
/*where r.raninscheckres not in ('1','7') and r.insdate<=to_date('2017', 'yyyy')*/
) l1 on a.pripid=l1.pripid

left join
(
select distinct r.pripid, r.insdate, r.raninscheckres from sichuan_source.dr_raninsres r
where r.raninscheckres not in ('1','7') and r.raninscheckres is not null  /*and r.insdate<=to_date('2017-06-30', 'yyyy-mm-dd')*/
) l2 on a.pripid=l2.pripid

where a.enttype not like '9%'
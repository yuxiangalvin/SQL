-----------------------------------透明度与行政执法案件关联分析-----------------------------
-------------------------------------------------------------------------------------------

------与行政执法案件关联后，透明度等级
select level1, count(distinct pripid) total from 
(
select case when score>=0.8 then 'high'
            when  score>=0.6 and score <0.8  then 'mid'
              else 'low' 
                end level1, t.pripid
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
group by level1

------与简易程序案件关联后
select level1, count(distinct pripid) total from 
(
select case when score>=0.8 then 'high'
            when  score>=0.6 and score <0.8  then 'mid'
              else 'low' 
                end level1, t.pripid
from da_transparency_analysis t join sichuan_source.e_baseinfo a on a.pripid=t.pripid 
join 
(

(select h.caseid, k.pripid from sichuan_source.case_se_baseinfo h join sichuan_source.case_se_partyinfo k
on h.caseid=k.caseid)
) l on a.pripid=l.pripid
where a.enttype not like '9%'
)
group by level1
--------------------------------透明度与异常名录关联分析-------------------------------------------
---------------------------------------------------------------------------------------------------------

--------与经营异常名录关联后透明度等级
select level1, count(distinct pripid) total from 
(
select case when score>=0.8 then 'high'
            when  score>=0.6 and score <0.8  then 'mid'
              else 'low' 
                end level1, t.pripid
from da_transparency_analysis t join sichuan_source.e_baseinfo a on a.pripid=t.pripid 
join 
(
select n.busexclist, n.pripid from sichuan_source.ao_opa_detail n

) l on a.pripid=l.pripid
where a.enttype not like '9%'
)
group by level1

--------仍在异常名录中的
select level1, count(distinct pripid) total from 
(
select case when score>=0.8 then 'high'
            when  score>=0.6 and score <0.8  then 'mid'
              else 'low' 
                end level1, t.pripid
from da_transparency_analysis t join sichuan_source.e_baseinfo a on a.pripid=t.pripid 
join 
(
select n.busexclist, n.pripid, n.specause from sichuan_source.ao_opa_detail n
where /*n.ismove='2'and*/ n.specause not in ('1','3','2')

) l on a.pripid=l.pripid
where a.enttype not like '9%'
)
group by level1
----------------透明度和抽查关联分析---------------------------------
------------------------------------------------------------------------------
-------抽查发现问题企业透明度等级
select level1, count(distinct pripid) total from 
(
select case when score>=0.8 then 'high'
            when  score>=0.6 and score <0.8  then 'mid'
              else 'low' 
                end level1, t.pripid
from da_transparency_analysis t join sichuan_source.e_baseinfo a on a.pripid=t.pripid 
join 
(
select r.pripid, r.insdate, r.raninscheckres from sichuan_source.dr_raninsres r
where r.raninscheckres not in ('1','7') and r.raninscheckres is not null  /*and r.insdate<=to_date('2017-06-30', 'yyyy-mm-dd')*/

) l on a.pripid=l.pripid
where a.enttype not like '9%'
)
group by level1

-----抽查完成户数
select level1, count(distinct pripid) total from 
(
select case when score>=0.8 then 'high'
            when  score>=0.6 and score <0.8  then 'mid'
              else 'low' 
                end level1, t.pripid
from da_transparency_analysis t join sichuan_source.e_baseinfo a on a.pripid=t.pripid 
join 
(
select r.pripid, r.insdate, r.raninscheckres from sichuan_source.dr_raninsres r
where /*r.raninscheckres not in ('1','7') and*/ r.insdate<=to_date('2017', 'yyyy')

) l on a.pripid=l.pripid
where a.enttype not like '9%'
)
group by level1


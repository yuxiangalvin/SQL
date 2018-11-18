select *  from gs_ecps_entyearexaminfo t1 join enterprisebaseinfocollect t2 on t1.marprid=t2.pripid
where t2.enttype not like '9%'

select *  from gs_ecps_entyearexaminfo t1 join gs_ecps_entass t2 on t1.id=t2.yearid

select *  gs_ecps_entyearexaminfo t1 
 join  biz_gs_marpripinfo t2 on t1.marprid=t2.id
 join gs_ecps_entass t3 on t3.yearid = t1.id
 where t2.enttype not like '9%'

select *  from gs_ecps_entyearexaminfo t1 
 join  biz_gs_marpripinfo t2 on t1.marprid=t2.id
 join gs_ecps_entass t3 on t3.yearid = t1.id
 where t2.enttype like '9%' and t1.entname like '%������'

select *  from gs_ecps_entyearexaminfo t1 
 join  biz_gs_marpripinfo t2 on t1.marprid=t2.id
 join gs_ecps_entass t3 on t3.yearid = t1.id
 where t2.enttype like '9%' and t1.entname not like '%������'

select * from biz_gs_operabnormallist t1
       JOIN biz_gs_marpripinfo t2
       on t1.marprid = t2.id
       WHERE t2.enttype not like '9%'


--------------------------------------------------------
select count(*), ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.MARPRID = B.id
where B.Enttypegb < '7000'
and B.enttypegb not in ('5830', '6830')
group by ancheyear
order by ancheyear

select count(distinct A.marprid), A.ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.MARPRID = B.id
where B.Enttypegb like '91%'
group by A.ancheyear
order by A.ancheyear

select count(distinct A.marprid), A.ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.MARPRID = B.id
where B.Enttypegb like '96%'
group by A.ancheyear
order by A.ancheyear

select count(*) from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.MARPRID = B.id
where B.enttype < '7000'
and B.enttype not in ('5830', '6830')

---------------------------------------------------
select count(*),ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.MARPRID = B.id
where (B.enttype in ('2110','2121','2122','2123','2140','2153','2211','2213','2221','2223','4310','4320','4330','4340','4110','4410','4220','4120','4420','2190','2219','2229', '2130','2151','2152','2212','2222','4551','4552','4553','4560')
or B.enttype like '58%' or B.ENTTYPE like '68%' or B.ENTTYPE like '73%')
group by ancheyear

-------------------------------------------------
-------------------------------------------------
select sum(value) ��Ӫ��Ϣ��ʾ����, sum(value1)�ܻ���, sum(value)/sum(value1) ��Ӫ��Ϣ��ʾ�ʣ� Ancheyear ��� from (

select count(*) value,0 value1, ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.MARPRID = B.id
join gs_ecps_entass C
on A.ID = C.YEARID
where (A.Empnumsign = 1 or C.Assgrosign = 1 or C.Liagrosign = 1 or C.vendincsign = 1 or C.MAIBUSINCSIGN = 1 or C.Progrosign = 1 or C.Netincsign = 1 or C.RATGROSIGN = 1 or C.totequsign = 1)
and (B.enttypeGB in ('2110','2121','2122','2123','2140','2153','2211','2213','2221','2223','4310','4320','4330','4340','4110','4410','4220','4120','4420','2190','2219','2229', '2130','2151','2152','2212','2222','4551','4552','4553','4560')
    or B.enttypeGB like '58%' 
    or B.ENTTYPEGB like '68%' 
    or B.ENTTYPEGB like '73%')
group by ancheyear

union all

select 0 value,count(*) value1, ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.MARPRID = B.id
join gs_ecps_entass C
on A.ID = C.YEARID

where (B.enttypeGB in ('2110','2121','2122','2123','2140','2153','2211','2213','2221','2223','4310','4320','4330','4340','4110','4410','4220','4120','4420','2190','2219','2229', '2130','2151','2152','2212','2222','4551','4552','4553','4560')
    or B.enttypeGB like '58%' 
    or B.ENTTYPEGB like '68%' 
    or B.ENTTYPEGB like '73%')
group by ancheyear 
)
group by ancheyear
order by ancheyear

-------------------------------------------------------

select sum(value) ��ҵ������ʾ����, sum(value1)�ܻ���, sum(value)/sum(value1) ��ҵ������ʾ�ʣ� Ancheyear ��� from (

select count(*) value,0 value1, ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.MARPRID = B.id
where A.Empnumsign = 1
and (B.enttypegb in ('2110','2121','2122','2123','2140','2153','2211','2213','2221','2223','4310','4320','4330','4340','4110','4410','4220','4120','4420','2190','2219','2229', '2130','2151','2152','2212','2222','4551','4552','4553','4560')
    or B.enttypegb like '58%' 
    or B.ENTTYPEgb like '68%' 
    or B.ENTTYPEgb like '73%')
group by ancheyear

union all

select 0 value,count(*) value1, ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.MARPRID = B.id

where (B.enttypegb in ('2110','2121','2122','2123','2140','2153','2211','2213','2221','2223','4310','4320','4330','4340','4110','4410','4220','4120','4420','2190','2219','2229', '2130','2151','2152','2212','2222','4551','4552','4553','4560')
    or B.enttypegb like '58%' 
    or B.ENTTYPEgb like '68%' 
    or B.ENTTYPEgb like '73%')
group by ancheyear 
)
group by ancheyear
order by ancheyear

----------------------------------------------------

select sum(value) ������Ȩ�湫ʾ����, sum(value1)�ܻ���, sum(value)/sum(value1) ������Ȩ�湫ʾ�ʣ� Ancheyear ��� from (

select count(*) value,0 value1, ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.MARPRID = B.id
join gs_ecps_entass C
on A.ID = C.YEARID
where C.totequsign = 1
and (B.enttypegb in ('2110','2121','2122','2123','2140','2153','2211','2213','2221','2223','4310','4320','4330','4340','4110','4410','4220','4120','4420','2190','2219','2229', '2130','2151','2152','2212','2222','4551','4552','4553','4560')
    or B.enttypegb like '58%' 
    or B.ENTTYPEgb like '68%' 
    or B.ENTTYPEgb like '73%')
group by ancheyear

union all

select 0 value,count(*) value1, ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.MARPRID = B.id
join gs_ecps_entass C
on A.ID = C.YEARID

where (B.enttypegb in ('2110','2121','2122','2123','2140','2153','2211','2213','2221','2223','4310','4320','4330','4340','4110','4410','4220','4120','4420','2190','2219','2229', '2130','2151','2152','2212','2222','4551','4552','4553','4560')
    or B.enttypegb like '58%' 
    or B.ENTTYPEgb like '68%' 
    or B.ENTTYPEgb like '73%')
group by ancheyear 
)
group by ancheyear
order by ancheyear

-----------------------------------------------------
-----------------------------------------------------
select sum(value0) ����, sum(value1) ����, sum(value0)/sum(value1) ����ռ��, Ancheyear ��� from
(
select count(distinct A.MARPRID) value0, 0 value1, A.Ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.Marprid = B.id
join gs_ecps_entass C
on A.ID = C.YEARID
where B.Enttype not like '9%'
      and C.Progro > 0
Group by A.Ancheyear

union all

select 0 value0, count(distinct A.MARPRID) value1, A.Ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.Marprid = B.id
join gs_ecps_entass C
on A.ID = C.YEARID
where B.Enttype not like '9%'
Group by A.Ancheyear
)
Group by Ancheyear
Order by Ancheyear
   
------------------------------------------------------------------ 

select sum(value0) ����, sum(value1) ����, sum(value0)/sum(value1) ����ռ��, Ancheyear ��� from
(
select count(distinct A.MARPRID) value0, 0 value1, A.Ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.Marprid = B.id
join gs_ecps_entass C
on A.ID = C.YEARID
where B.Enttype not like '9%'
      and C.Progro = 0
      and C.Vendinc <> 0
      and C.Vendinc is not null
Group by A.Ancheyear

union all

select 0 value0, count(distinct A.MARPRID) value1, A.Ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.Marprid = B.id
join gs_ecps_entass C
on A.ID = C.YEARID
where B.Enttype not like '9%'
Group by A.Ancheyear
)
Group by Ancheyear
Order by Ancheyear

-------------------------------------------------------------------

select sum(value0) ����, sum(value1) ����, sum(value0)/sum(value1) ����ռ��, Ancheyear ��� from
(
select count(distinct A.MARPRID) value0, 0 value1, A.Ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.Marprid = B.id
join gs_ecps_entass C
on A.ID = C.YEARID
where B.Enttype not like '9%'
      and C.Vendinc = 0
      and A.Empnum = 0
Group by A.Ancheyear

union all

select 0 value0, count(distinct A.MARPRID) value1, A.Ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.Marprid = B.id
join gs_ecps_entass C
on A.ID = C.YEARID
where B.Enttype not like '9%'
Group by A.Ancheyear
)
Group by Ancheyear
Order by Ancheyear

----------------------------------------------------------------

Select COUNT(DISTINCT A.marprid) �Ͻ���ҵ��, A.ANCHEYEAR ���
from gs_ecps_entyearexaminfo A 
join biz_gs_marpripinfo B 
on A.Marprid=B.id
WHERE (B.enttypegb like '1%' or substr(B.enttypegb, 1, 2) in ('51', '52', '61', '62')) 
      and B.enttypegb not in ('5190', '6190') 
      AND exists (select 1 
                    from gs_ecps_invcapinfo C 
                    where A.MARPRID=C.MARPRID
                          )
GROUP BY A.ANCHEYEAR
order by A.ANCHEYEAR

------------------------------------------------------

select count(distinct A.MARPRID) ��˰����, A.ANCHEYEAR ���
from gs_ecps_entyearexaminfo A
join gs_ecps_entass B
on A.ID = B.YEARID
where B.Ratgro>0
group by A.ancheyear
order by A.ancheyear

---------------------------------------------------

select sum(B.ratgro)/10000 ��˰�ܶ�, A.ANCHEYEAR ���
from gs_ecps_entyearexaminfo A
join gs_ecps_entass B
on A.ID = B.YEARID
where B.RATGRO > 0
group by A.ancheyear
order by A.ancheyear

--------------------------------------------------------

select count(distinct A.MARPRID) ��˰��ʾ����, A.ANCHEYEAR ���
from gs_ecps_entyearexaminfo A
join gs_ecps_entass B
on A.ID = B.YEARID
where B.RATGRO > 0
      and B.Ratgrosign = 1
group by A.ancheyear
order by A.ancheyear

-----------------------------------------------------

select count(distinct A.MARPRID) ��˰δ��ʾ����, A.ANCHEYEAR ���
from gs_ecps_entyearexaminfo A
join gs_ecps_entass B
on A.ID = B.YEARID
where B.RATGRO > 0
      and B.Ratgrosign = 2
group by A.ancheyear
order by A.ancheyear

-----------------------------------------------------

select count(distinct A.MARPRID) ����������˰����, A.ANCHEYEAR ���
from gs_ecps_entyearexaminfo A
join gs_ecps_entass B
on A.ID = B.YEARID
where B.RATGRO = 0
      and B.PROGRO > 0
group by A.ancheyear
order by A.ancheyear

------------------------------------------

select count(*) ��������δ��˰���� from(
       select count(B.ID)
       from gs_ecps_entyearexaminfo A
            join biz_gs_marpripinfo B
                 ON A.MARPRID = B.ID
            join gs_ecps_entass C
                 on A.ID = C.YEARID
                 AND A.Ancheyear <= '2015'
                 and A.Ancheyear >= '2013'
                 and C.ratgro = 0
       Group by B.ID
             Having count(B.ID) = 3)
               

--------------------------------------

Select
case when REGCAP = 0 then 'ע���ʱ�Ϊ0'    
    when  subconam_total/REGCAP=1 
           or (((abs(subconam_total-REGCAP)<2 
                and abs(subconam_total-REGCAP)>1 and REGCAP>30)) 
                or  ((abs(subconam_total-REGCAP)<1 
                      and abs(subconam_total-REGCAP)>0 and REGCAP>10))) 
     then '�Ͻɳ����ܶ����ע���ʱ�'
     when subconam_total/REGCAP>1  then '�Ͻɳ����ܶ����ע���ʱ�'
     when subconam_total/REGCAP<1  then '�Ͻɳ����ܶ�С��ע���ʱ�'
     else '����'
     end ����׼ȷ��,
count(1) ��ҵ�� from
(
select distinct(marprid), B.REGCAP REGCAP,
SUM(nvl(C.subconam, 0)) over(partition by marprid) as subconam_total
from biz_gs_marpripinfo B
join gs_ecps_invcapinfo C
on B.id = C.MARPRID 
where B.enttypegb in ('1153','1110','1121','1122','1123','1140','1190','1151','1152','1130','5110','6110','5120','6120','5130','5140','5150','5160','6130','6140','6150','6160','6170')
)
group by case when REGCAP = 0 then 'ע���ʱ�Ϊ0' 
              when  subconam_total/REGCAP=1 
                    or (((abs(subconam_total-REGCAP)<2 
                    and abs(subconam_total-REGCAP)>1 and REGCAP>30)) 
                    or  ((abs(subconam_total-REGCAP)<1 
                      and abs(subconam_total-REGCAP)>0 and REGCAP>10))) 
                       then '�Ͻɳ����ܶ����ע���ʱ�'
                        when subconam_total/REGCAP>1  then '�Ͻɳ����ܶ����ע���ʱ�'
                        when subconam_total/REGCAP<1  then '�Ͻɳ����ܶ�С��ע���ʱ�'
                        else '����'
                        end

------------------------------------------------

select
case when Busst = 1 then '��ҵ'
     when Busst = 4 then 'ͣҵ'
     when Busst = 5 then '����'
     when Busst is null then '�޾�Ӫ״̬��Ϣ'
     else '��Ч��Ӫ״̬��Ϣ'
     end ��Ӫ״̬,
count(1) ��ҵ�� from
(
select distinct A.ID AnCheID, A.Busst Busst
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.Marprid = B.ID
where B.ENTTYPE not like '9%'
and A.Ancheyear = 2013
)
group by case when Busst = 1 then '��ҵ'
     when Busst = 4 then 'ͣҵ'
     when Busst = 5 then '����'
     when Busst is null then '�޾�Ӫ״̬��Ϣ'
     else '��Ч��Ӫ״̬��Ϣ'
     end

-----------------------------------------------------------
Select
case    when REGCAP = 0 then 'ע���ʱ�Ϊ0'
        when subconam_total/REGCAP=1 or ((abs(subconam_total-REGCAP)<2 
        and abs(subconam_total-REGCAP)>1) and REGCAP>30) then '100%'
        when subconam_total/REGCAP=0 then '0'
        when subconam_total/REGCAP>0 and subconam_total/REGCAP<0.3 then '0-30%'
         when subconam_total/REGCAP>=0.3 and subconam_total/REGCAP<0.6 then '30%-60%'
         when subconam_total/REGCAP>=0.6 and subconam_total/REGCAP<1 then '60%-100%'
         else '����100%'
         end ����ռ��,

count(1) ��ҵ�� from
(
select distinct(marprid), B.REGCAP REGCAP,
SUM(nvl(C.subconam, 0)) over(partition by marprid) as subconam_total
from biz_gs_marpripinfo B
join gs_ecps_invcapinfo C
on B.id = C.MARPRID 
)
group by case when REGCAP = 0 then 'ע���ʱ�Ϊ0'
        when subconam_total/REGCAP=1 or ((abs(subconam_total-REGCAP)<2 
        and abs(subconam_total-REGCAP)>1) and REGCAP>30) then '100%'
        when subconam_total/REGCAP=0 then '0'
        when subconam_total/REGCAP>0 and subconam_total/REGCAP<0.3 then '0-30%'
         when subconam_total/REGCAP>=0.3 and subconam_total/REGCAP<0.6 then '30%-60%'
         when subconam_total/REGCAP>=0.6 and subconam_total/REGCAP<1 then '60%-100%'
         else '����100%'
         end

--------------------------------------------------------------

case when B.EmpNumDis='1' and AssGroSign='1' and LiaGroSign='1'  and VendIncSign='1'  and ProGroSign='1' and NetIncSign='1'  and RatGroSign='1' and TotEquSign='1' then 'ȫ����ʾ'
     when B.EmpNumSign='2' and AssGroSign='2' and LiaGroSign='2'  and VendIncSign='2'  and ProGroSign='2'  and NetIncSign='2'  and RatGroSign='2' and TotEquSign='2' then 'ȫ������ʾ'
     else '���ֹ�ʾ'

--------------------------------------------------------

select count(distinct B.Id) Ӧ�걨��ҵ��
from biz_gs_marpripinfo B
left join gs_reg_marpripcancel C
on B.id = C.MARPRID
where B.estdate <= to_timestamp('131231','yymmdd') --�����Ŀ����ݸı�
--and (ENTSTATUS='1'or (ENTSTATUS in('2','3') �޴�����
and (C.pubdate >= to_timestamp('20140701','yyyymmdd')
    or C.pubdate is null) --�����Ŀ����ݸı�
and (C.regdate >= to_timestamp('20140701','yyyymmdd')
    or C.regdate is null) --�����Ŀ����ݸı�
and B.Enttype < '7000'
and B.enttypegb not in ('5830', '6830')


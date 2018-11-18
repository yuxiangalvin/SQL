�걨�ʣ���ҵΪ�������������enttype����

���걨

select count(distinct A.marprid) �ѹ�ʾ��ҵ��, ancheyear ���
from GS_ECPS_ENTYEAREXAMINFO A
join biz_gs_marpripinfo B
on A.Marprid = B.id
where B.Enttype < 7000
and B.enttypegb not in (5830, 6830)
group by ancheyear
order by ancheyear

-------------------------------------

Ӧ�걨

select count(*)  from

(select distinct B.id 
from biz_gs_marpripinfo B
LEFT join biz_reg_marpripcancel C
on B.ID = C.marprid
LEFT join biz_reg_marpripcanauditinfo D
on C.ID = D.ENTCANCELID
where B.Estdate <= to_timestamp('161231', 'yymmdd')
      and (B.State = 06
           or (B.state = 11
               and D.APPRDATE >= to_timestamp('170701', 'yymmdd')))
      and (B.enttype < 7000 and B.enttypegb not in ('5830', '6830')) 
) should_pub

full join

(select distinct A.Marprid, B.entname, B.enttype, B.state
from GS_ECPS_ENTYEAREXAMINFO A
join biz_gs_marpripinfo B
on A.Marprid = B.id
where (B.enttype < 7000 and B.enttypegb not in ('5830', '6830')) 
and A.ancheyear = 2016
) real_pub

on should_pub.id = real_pub.marprid

-----------------------------------------------------------------------------------------------
�걨�ʣ�ά�� - ������

���걨

select count(distinct A.marprid),
       case when (B.regno like '340202%'
                 or B.orgid like '340202%'
                 or B.superorgid like '340202%'
                 or B.priorgid like '340202%'
                 or B.superpriorgid like '340202%'
                 or B.dom like '%������%')
            then '������'
            when (B.regno like '340203%'
                 or B.orgid like '340203%'
                 or B.superorgid like '340203%'
                 or B.priorgid like '340203%'
                 or B.superpriorgid like '340203%'
                 or B.dom like '%߮����%')
            then '߮����'
            when (B.regno like '340206%'
                 or B.orgid like '340206%'
                 or B.superorgid like '340206%'
                 or B.priorgid like '340206%'
                 or B.superpriorgid like '340206%'
                 or B.orgid like '340208%'
                 or B.dom like '%��ɽ��%')
            then '��ɽ��'
            when (B.regno like '340221%'
                 or B.orgid like '340221%'
                 or B.superorgid like '340221%'
                 or B.priorgid like '340221%'
                 or B.superpriorgid like '340221%'
                 or B.dom like '%�ߺ���%')
            then '�ߺ���'
            when (B.regno like '340222%'
                 or B.orgid like '340222%'
                 or B.superorgid like '340222%'
                 or B.priorgid like '340222%'
                 or B.superpriorgid like '340222%'
                 or B.dom like '%������%')
            then '������'
            when (B.regno like '340223%'
                 or B.orgid like '340223%'
                 or B.superorgid like '340223%'
                 or B.priorgid like '340223%'
                 or B.superpriorgid like '340223%'
                 or B.dom like '%������%')
            then '������'
            when (B.regno like '340224%'
                 or B.regno like '341422%'
                 or B.superpriorgid like '34020000000011%'
                 or B.dom like '%��Ϊ��%')
            then '��Ϊ��'
            when (B.regno like '340293%'
                 or B.regno like '340294%'
                 or B.superpriorgid like '3402001700%'
                 or B.priorgid like '3402001700%'
                 or B.superpriorgid like '3402001800%'
                 or B.priorgid like '3402001800%')
            then '���������ۺϾ��ÿ�����'
            when (B.regno like '340207%'
                 or B.orgid like '340207%'
                 or B.superorgid like '340207%'
                 or B.priorgid like '340207%'
                 or B.superpriorgid like '340207%' 
                 or B.dom like '%𯽭��%')
            then '𯽭��'
            else '�޷�ȷ����������'
            end as ����
                             
from Biz_Gs_Marpripinfo B
join gs_ecps_entyearexaminfo A
on B.id = A.marprid
where A.ancheyear = 2016
and ((B.enttype < '7000' and B.enttypegb not in ('5830', '6830'))
     or B.enttype in ('9100', '9200')
     or B.enttype = '9600'
     )
group by 
         case when (B.regno like '340202%'
                 or B.orgid like '340202%'
                 or B.superorgid like '340202%'
                 or B.priorgid like '340202%'
                 or B.superpriorgid like '340202%'
                 or B.dom like '%������%')
            then '������'
            when (B.regno like '340203%'
                 or B.orgid like '340203%'
                 or B.superorgid like '340203%'
                 or B.priorgid like '340203%'
                 or B.superpriorgid like '340203%'
                 or B.dom like '%߮����%')
            then '߮����'
            when (B.regno like '340206%'
                 or B.orgid like '340206%'
                 or B.superorgid like '340206%'
                 or B.priorgid like '340206%'
                 or B.superpriorgid like '340206%'
                 or B.orgid like '340208%'
                 or B.dom like '%��ɽ��%')
            then '��ɽ��'
            when (B.regno like '340221%'
                 or B.orgid like '340221%'
                 or B.superorgid like '340221%'
                 or B.priorgid like '340221%'
                 or B.superpriorgid like '340221%'
                 or B.dom like '%�ߺ���%')
            then '�ߺ���'
            when (B.regno like '340222%'
                 or B.orgid like '340222%'
                 or B.superorgid like '340222%'
                 or B.priorgid like '340222%'
                 or B.superpriorgid like '340222%'
                 or B.dom like '%������%')
            then '������'
            when (B.regno like '340223%'
                 or B.orgid like '340223%'
                 or B.superorgid like '340223%'
                 or B.priorgid like '340223%'
                 or B.superpriorgid like '340223%'
                 or B.dom like '%������%')
            then '������'
            when (B.regno like '340224%'
                 or B.regno like '341422%'
                 or B.superpriorgid like '34020000000011%'
                 or B.dom like '%��Ϊ��%')
            then '��Ϊ��'
            when (B.regno like '340293%'
                 or B.regno like '340294%'
                 or B.superpriorgid like '3402001700%'
                 or B.priorgid like '3402001700%'
                 or B.superpriorgid like '3402001800%'
                 or B.priorgid like '3402001800%')
            then '���������ۺϾ��ÿ�����'
            when (B.regno like '340207%'
                 or B.orgid like '340207%'
                 or B.superorgid like '340207%'
                 or B.priorgid like '340207%'
                 or B.superpriorgid like '340207%' 
                 or B.dom like '%𯽭��%')
            then '𯽭��'
            else '�޷�ȷ����������'
            end

-------------------------------------------------------------

Ӧ�걨

select count(*), case when (should_pub.regno like '340202%'
                 or should_pub.orgid like '340202%'
                 or should_pub.superorgid like '340202%'
                 or should_pub.priorgid like '340202%'
                 or should_pub.superpriorgid like '340202%'
                 or should_pub.dom like '%������%'
                 or real_pub.regno like '340202%'
                 or real_pub.orgid like '340202%'
                 or real_pub.superorgid like '340202%'
                 or real_pub.priorgid like '340202%'
                 or real_pub.superpriorgid like '340202%'
                 or real_pub.dom like '%������%')
            then '������'
            when (should_pub.regno like '340203%'
                 or should_pub.orgid like '340203%'
                 or should_pub.superorgid like '340203%'
                 or should_pub.priorgid like '340203%'
                 or should_pub.superpriorgid like '340203%'
                 or should_pub.dom like '%߮����%'
                 or real_pub.regno like '340203%'
                 or real_pub.orgid like '340203%'
                 or real_pub.superorgid like '340203%'
                 or real_pub.priorgid like '340203%'
                 or real_pub.superpriorgid like '340203%'
                 or real_pub.dom like '%߮����%')
            then '߮����'
            when (should_pub.regno like '340206%'
                 or should_pub.orgid like '340206%'
                 or should_pub.superorgid like '340206%'
                 or should_pub.priorgid like '340206%'
                 or should_pub.superpriorgid like '340206%'
                 or should_pub.orgid like '340208%'
                 or should_pub.dom like '%��ɽ��%'
                 or real_pub.regno like '340206%'
                 or real_pub.orgid like '340206%'
                 or real_pub.superorgid like '340206%'
                 or real_pub.priorgid like '340206%'
                 or real_pub.superpriorgid like '340206%'
                 or real_pub.orgid like '340208%'
                 or real_pub.dom like '%��ɽ��%')
            then '��ɽ��'
            when (should_pub.regno like '340221%'
                 or should_pub.orgid like '340221%'
                 or should_pub.superorgid like '340221%'
                 or should_pub.priorgid like '340221%'
                 or should_pub.superpriorgid like '340221%'
                 or should_pub.dom like '%�ߺ���%'
                 or real_pub.regno like '340221%'
                 or real_pub.orgid like '340221%'
                 or real_pub.superorgid like '340221%'
                 or real_pub.priorgid like '340221%'
                 or real_pub.superpriorgid like '340221%'
                 or real_pub.dom like '%�ߺ���%')
            then '�ߺ���'
            when (should_pub.regno like '340222%'
                 or should_pub.orgid like '340222%'
                 or should_pub.superorgid like '340222%'
                 or should_pub.priorgid like '340222%'
                 or should_pub.superpriorgid like '340222%'
                 or should_pub.dom like '%������%'
                 or real_pub.regno like '340222%'
                 or real_pub.orgid like '340222%'
                 or real_pub.superorgid like '340222%'
                 or real_pub.priorgid like '340222%'
                 or real_pub.superpriorgid like '340222%'
                 or real_pub.dom like '%������%')
            then '������'
            when (should_pub.regno like '340223%'
                 or should_pub.orgid like '340223%'
                 or should_pub.superorgid like '340223%'
                 or should_pub.priorgid like '340223%'
                 or should_pub.superpriorgid like '340223%'
                 or should_pub.dom like '%������%'
                 or real_pub.regno like '340223%'
                 or real_pub.orgid like '340223%'
                 or real_pub.superorgid like '340223%'
                 or real_pub.priorgid like '340223%'
                 or real_pub.superpriorgid like '340223%'
                 or real_pub.dom like '%������%')
            then '������'
            when (should_pub.regno like '340224%'
                 or should_pub.regno like '341422%'
                 or should_pub.superpriorgid like '34020000000011%'
                 or should_pub.dom like '%��Ϊ��%'
                 or real_pub.regno like '340224%'
                 or real_pub.regno like '341422%'
                 or real_pub.superpriorgid like '34020000000011%'
                 or real_pub.dom like '%��Ϊ��%')
            then '��Ϊ��'
            when (should_pub.regno like '340293%'
                 or should_pub.regno like '340294%'
                 or should_pub.superpriorgid like '3402001700%'
                 or should_pub.priorgid like '3402001700%'
                 or should_pub.superpriorgid like '3402001800%'
                 or should_pub.priorgid like '3402001800%'
                 or real_pub.regno like '340293%'
                 or real_pub.regno like '340294%'
                 or real_pub.superpriorgid like '3402001700%'
                 or real_pub.priorgid like '3402001700%'
                 or real_pub.superpriorgid like '3402001800%'
                 or real_pub.priorgid like '3402001800%')
            then '���������ۺϾ��ÿ�����'
            when (should_pub.regno like '340207%'
                 or should_pub.orgid like '340207%'
                 or should_pub.superorgid like '340207%'
                 or should_pub.priorgid like '340207%'
                 or should_pub.superpriorgid like '340207%' 
                 or should_pub.dom like '%𯽭��%'
                 or real_pub.regno like '340207%'
                 or real_pub.orgid like '340207%'
                 or real_pub.superorgid like '340207%'
                 or real_pub.priorgid like '340207%'
                 or real_pub.superpriorgid like '340207%' 
                 or real_pub.dom like '%𯽭��%')
            then '𯽭��'
            else '�޷�ȷ����������'
            end as ����
from
(
select distinct B.*
from Biz_Gs_Marpripinfo B
LEFT join biz_reg_marpripcancel C
on B.ID = C.marprid
LEFT join biz_reg_marpripcanauditinfo D
on C.ID = D.ENTCANCELID
where B.Estdate <= to_timestamp('161231', 'yymmdd')
      and (B.State = 06
           or (B.state = 11
               and D.APPRDATE >= to_timestamp('170701', 'yymmdd'))) 
and ((B.enttype < '7000' and B.enttypegb not in ('5830', '6830'))
     or B.enttype in ('9100', '9200')
     or B.enttype = '9600'
     )
) should_pub


full join

(
select distinct A.marprid, B.*
from Biz_Gs_Marpripinfo B
join gs_ecps_entyearexaminfo A
on B.id = A.marprid
where A.ancheyear = 2016
and ((B.enttype < '7000' and B.enttypegb not in ('5830', '6830'))
     or B.enttype in ('9100', '9200')
     or B.enttype = '9600'
     )
) real_pub

on should_pub.id = real_pub.marprid

group by case when (should_pub.regno like '340202%'
                 or should_pub.orgid like '340202%'
                 or should_pub.superorgid like '340202%'
                 or should_pub.priorgid like '340202%'
                 or should_pub.superpriorgid like '340202%'
                 or should_pub.dom like '%������%'
                 or real_pub.regno like '340202%'
                 or real_pub.orgid like '340202%'
                 or real_pub.superorgid like '340202%'
                 or real_pub.priorgid like '340202%'
                 or real_pub.superpriorgid like '340202%'
                 or real_pub.dom like '%������%')
            then '������'
            when (should_pub.regno like '340203%'
                 or should_pub.orgid like '340203%'
                 or should_pub.superorgid like '340203%'
                 or should_pub.priorgid like '340203%'
                 or should_pub.superpriorgid like '340203%'
                 or should_pub.dom like '%߮����%'
                 or real_pub.regno like '340203%'
                 or real_pub.orgid like '340203%'
                 or real_pub.superorgid like '340203%'
                 or real_pub.priorgid like '340203%'
                 or real_pub.superpriorgid like '340203%'
                 or real_pub.dom like '%߮����%')
            then '߮����'
            when (should_pub.regno like '340206%'
                 or should_pub.orgid like '340206%'
                 or should_pub.superorgid like '340206%'
                 or should_pub.priorgid like '340206%'
                 or should_pub.superpriorgid like '340206%'
                 or should_pub.orgid like '340208%'
                 or should_pub.dom like '%��ɽ��%'
                 or real_pub.regno like '340206%'
                 or real_pub.orgid like '340206%'
                 or real_pub.superorgid like '340206%'
                 or real_pub.priorgid like '340206%'
                 or real_pub.superpriorgid like '340206%'
                 or real_pub.orgid like '340208%'
                 or real_pub.dom like '%��ɽ��%')
            then '��ɽ��'
            when (should_pub.regno like '340221%'
                 or should_pub.orgid like '340221%'
                 or should_pub.superorgid like '340221%'
                 or should_pub.priorgid like '340221%'
                 or should_pub.superpriorgid like '340221%'
                 or should_pub.dom like '%�ߺ���%'
                 or real_pub.regno like '340221%'
                 or real_pub.orgid like '340221%'
                 or real_pub.superorgid like '340221%'
                 or real_pub.priorgid like '340221%'
                 or real_pub.superpriorgid like '340221%'
                 or real_pub.dom like '%�ߺ���%')
            then '�ߺ���'
            when (should_pub.regno like '340222%'
                 or should_pub.orgid like '340222%'
                 or should_pub.superorgid like '340222%'
                 or should_pub.priorgid like '340222%'
                 or should_pub.superpriorgid like '340222%'
                 or should_pub.dom like '%������%'
                 or real_pub.regno like '340222%'
                 or real_pub.orgid like '340222%'
                 or real_pub.superorgid like '340222%'
                 or real_pub.priorgid like '340222%'
                 or real_pub.superpriorgid like '340222%'
                 or real_pub.dom like '%������%')
            then '������'
            when (should_pub.regno like '340223%'
                 or should_pub.orgid like '340223%'
                 or should_pub.superorgid like '340223%'
                 or should_pub.priorgid like '340223%'
                 or should_pub.superpriorgid like '340223%'
                 or should_pub.dom like '%������%'
                 or real_pub.regno like '340223%'
                 or real_pub.orgid like '340223%'
                 or real_pub.superorgid like '340223%'
                 or real_pub.priorgid like '340223%'
                 or real_pub.superpriorgid like '340223%'
                 or real_pub.dom like '%������%')
            then '������'
            when (should_pub.regno like '340224%'
                 or should_pub.regno like '341422%'
                 or should_pub.superpriorgid like '34020000000011%'
                 or should_pub.dom like '%��Ϊ��%'
                 or real_pub.regno like '340224%'
                 or real_pub.regno like '341422%'
                 or real_pub.superpriorgid like '34020000000011%'
                 or real_pub.dom like '%��Ϊ��%')
            then '��Ϊ��'
            when (should_pub.regno like '340293%'
                 or should_pub.regno like '340294%'
                 or should_pub.superpriorgid like '3402001700%'
                 or should_pub.priorgid like '3402001700%'
                 or should_pub.superpriorgid like '3402001800%'
                 or should_pub.priorgid like '3402001800%'
                 or real_pub.regno like '340293%'
                 or real_pub.regno like '340294%'
                 or real_pub.superpriorgid like '3402001700%'
                 or real_pub.priorgid like '3402001700%'
                 or real_pub.superpriorgid like '3402001800%'
                 or real_pub.priorgid like '3402001800%')
            then '���������ۺϾ��ÿ�����'
            when (should_pub.regno like '340207%'
                 or should_pub.orgid like '340207%'
                 or should_pub.superorgid like '340207%'
                 or should_pub.priorgid like '340207%'
                 or should_pub.superpriorgid like '340207%' 
                 or should_pub.dom like '%𯽭��%'
                 or real_pub.regno like '340207%'
                 or real_pub.orgid like '340207%'
                 or real_pub.superorgid like '340207%'
                 or real_pub.priorgid like '340207%'
                 or real_pub.superpriorgid like '340207%' 
                 or real_pub.dom like '%𯽭��%')
            then '𯽭��'
            else '�޷�ȷ����������'
            end

------------------------------------------------------------------------------------------------
��ҵ��Ӫ��Ϣ ����ͬ��Ӫ��Ϣ��һ��ɸѡ�������ɣ�


select sum(value0) ����, sum(value1) ����, sum(value0)/sum(value1) ����ռ��, Ancheyear ��� 
from
(
select count(distinct A.MARPRID) value0, 0 value1, A.Ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.Marprid = B.id
join gs_ecps_entass C
on A.ID = C.YEARID
where (B.Enttype < '7000' and B.enttypegb not in ('5830', '6830'))
      and C.vendinc = 0 and a.empnum = 0--������ɸѡ��׼�޸ĺ�ɫ���֣�
Group by A.Ancheyear

union all

select 0 value0, count(distinct A.MARPRID) value1, A.Ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.Marprid = B.id
join gs_ecps_entass C
on A.ID = C.YEARID
where (B.Enttype < '7000' and B.enttypegb not in ('5830', '6830'))
      and C.vendinc is not null and a.empnum is not null --������ɸѡ��׼�޸ĺ�ɫ���֣�
Group by A.Ancheyear
)
Group by Ancheyear
Order by Ancheyear

 


------------------------------------------------------------------------------------------------

�걨�ʣ�ά�� - ע���ʱ���

���걨��

Select 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end AS ע���ʱ���,

count (DISTINCT A.marprid)  �걨��ҵ��

from biz_gs_marpripinfo B
join gs_ecps_entyearexaminfo A
on A.MARPRID = B.Id
where (B.enttypeGB like '1%' 
                   or (substr(B.enttypeGB, 1, 2) in ('51', '52', '61', '62') 
                   and B.enttypeGB not in ('5190', '6190')))
      and B.regcap is not null
      AND A.ANCHEYEAR = 2016

GROUP BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end
ORDER BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end

------------------------------------------------------------------------

Ӧ�걨��

Select 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end AS ע���ʱ���,

count(*) �걨��ҵ�� from
(
Select 
case when nvl(regcap_should,0)='0' 
            then regcap_real
            else REGCAP_should
            end AS REGCAP
FROM
(
select distinct B.id, B.REGCAP REGCAP_should
from biz_gs_marpripinfo B
LEFT join biz_reg_marpripcancel C
on B.ID = C.marprid
LEFT join biz_reg_marpripcanauditinfo D
on C.ID = D.ENTCANCELID
where (B.enttypeGB like '1%' 
                   or (substr(B.enttypeGB, 1, 2) in ('51', '52', '61', '62') 
                   and B.enttypeGB not in ('5190', '6190')))
      and B.regcap is not null
      AND B.Estdate <= to_timestamp('161231', 'yymmdd')
      and (B.State = 06
           or (B.state = 11
               and D.APPRDATE >= to_timestamp('170701', 'yymmdd')))
) should_pub

full join

(
select distinct A.marprid, B.REGCAP REGCAP_real
from biz_gs_marpripinfo B
join gs_ecps_entyearexaminfo A
on A.MARPRID = B.Id
where (B.enttypeGB like '1%' 
                   or (substr(B.enttypeGB, 1, 2) in ('51', '52', '61', '62') 
                   and B.enttypeGB not in ('5190', '6190')))
      and B.regcap is not null
      AND A.ANCHEYEAR = 2016
) real_pub

on should_pub.id = real_pub.marprid
)

GROUP BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end
ORDER BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end

----------------------------------------------------------------------------------------------------------------

ӯ��ռ�ȣ�ά�� - ע���ʱ���

ӯ��������

Select 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end AS ע���ʱ���,

count (DISTINCT A.marprid)  ӯ����ҵ��

from biz_gs_marpripinfo B
join gs_ecps_entyearexaminfo A
on A.MARPRID = B.Id
join gs_ecps_entass C
on C.YEARID = A.id
where (B.enttype < 7000 and B.enttypegb not in ('5830', '6830'))
      and C.PROGRO > 0
      AND A.ANCHEYEAR = 2016

GROUP BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end
ORDER BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end

----------------------------------------------------------------------

��ӯ����Ϣ����

Select 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end AS ע���ʱ���,

count (DISTINCT A.marprid)  ӯ����ҵ��

from biz_gs_marpripinfo B
join gs_ecps_entyearexaminfo A
on A.MARPRID = B.Id
join gs_ecps_entass C
on C.YEARID = A.id
where (B.enttype < 7000 and B.enttypegb not in ('5830', '6830'))
      and C.PROGRO is not null
      AND A.ANCHEYEAR = 2016

------------------------------------------------------------------------------------------------

��ҵ��Ӫ�ʣ�ά��- ע���ʱ���

��ҵ��Ӫ����

Select 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end AS ע���ʱ���,

count (DISTINCT A.marprid)  ӯ����ҵ��

from biz_gs_marpripinfo B
join gs_ecps_entyearexaminfo A
on A.MARPRID = B.Id
where (B.enttype < 7000 and B.enttypegb not in ('5830', '6830'))
      and B.state = 06
      AND A.ANCHEYEAR = 2016

GROUP BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end
ORDER BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end

----------------------------------------------------------------------

��Ӫҵ״̬��Ϣ��ҵ

Select 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end AS ע���ʱ���,

count (DISTINCT A.marprid)  ӯ����ҵ��

from biz_gs_marpripinfo B
join gs_ecps_entyearexaminfo A
on A.MARPRID = B.Id
where  (B.enttypeGB like '1%' 
                   or (substr(B.enttypeGB, 1, 2) in ('51', '52', '61', '62') 
                   and B.enttypeGB not in ('5190', '6190')))
      and B.state is not null
      AND A.ANCHEYEAR = 2016

GROUP BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end
ORDER BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '��ע���ʱ���Ϣ'
        when REGCAP > 0 and REGCAP <= 100 then '1-100��'
        when REGCAP > 100 and REGCAP <= 500 then '101-500��'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000��'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000��'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001�� - 1��'
         when REGCAP > 10000 then '1������'
         else 'ע���ʱ���Ϣ��Ч'
         end

-------------------------------------------------------------------------------------------------------
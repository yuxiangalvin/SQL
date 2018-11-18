年报率（企业为例，其他主体改enttype条件

已年报

select count(distinct A.marprid) 已公示企业数, ancheyear 年份
from GS_ECPS_ENTYEAREXAMINFO A
join biz_gs_marpripinfo B
on A.Marprid = B.id
where B.Enttype < 7000
and B.enttypegb not in (5830, 6830)
group by ancheyear
order by ancheyear

-------------------------------------

应年报

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
年报率（维度 - 地区）

已年报

select count(distinct A.marprid),
       case when (B.regno like '340202%'
                 or B.orgid like '340202%'
                 or B.superorgid like '340202%'
                 or B.priorgid like '340202%'
                 or B.superpriorgid like '340202%'
                 or B.dom like '%镜湖区%')
            then '镜湖区'
            when (B.regno like '340203%'
                 or B.orgid like '340203%'
                 or B.superorgid like '340203%'
                 or B.priorgid like '340203%'
                 or B.superpriorgid like '340203%'
                 or B.dom like '%弋江区%')
            then '弋江区'
            when (B.regno like '340206%'
                 or B.orgid like '340206%'
                 or B.superorgid like '340206%'
                 or B.priorgid like '340206%'
                 or B.superpriorgid like '340206%'
                 or B.orgid like '340208%'
                 or B.dom like '%三山区%')
            then '三山区'
            when (B.regno like '340221%'
                 or B.orgid like '340221%'
                 or B.superorgid like '340221%'
                 or B.priorgid like '340221%'
                 or B.superpriorgid like '340221%'
                 or B.dom like '%芜湖县%')
            then '芜湖县'
            when (B.regno like '340222%'
                 or B.orgid like '340222%'
                 or B.superorgid like '340222%'
                 or B.priorgid like '340222%'
                 or B.superpriorgid like '340222%'
                 or B.dom like '%繁昌县%')
            then '繁昌县'
            when (B.regno like '340223%'
                 or B.orgid like '340223%'
                 or B.superorgid like '340223%'
                 or B.priorgid like '340223%'
                 or B.superpriorgid like '340223%'
                 or B.dom like '%南陵县%')
            then '南陵县'
            when (B.regno like '340224%'
                 or B.regno like '341422%'
                 or B.superpriorgid like '34020000000011%'
                 or B.dom like '%无为县%')
            then '无为县'
            when (B.regno like '340293%'
                 or B.regno like '340294%'
                 or B.superpriorgid like '3402001700%'
                 or B.priorgid like '3402001700%'
                 or B.superpriorgid like '3402001800%'
                 or B.priorgid like '3402001800%')
            then '长江大桥综合经济开发区'
            when (B.regno like '340207%'
                 or B.orgid like '340207%'
                 or B.superorgid like '340207%'
                 or B.priorgid like '340207%'
                 or B.superpriorgid like '340207%' 
                 or B.dom like '%鸠江区%')
            then '鸠江区'
            else '无法确认所属地区'
            end as 地区
                             
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
                 or B.dom like '%镜湖区%')
            then '镜湖区'
            when (B.regno like '340203%'
                 or B.orgid like '340203%'
                 or B.superorgid like '340203%'
                 or B.priorgid like '340203%'
                 or B.superpriorgid like '340203%'
                 or B.dom like '%弋江区%')
            then '弋江区'
            when (B.regno like '340206%'
                 or B.orgid like '340206%'
                 or B.superorgid like '340206%'
                 or B.priorgid like '340206%'
                 or B.superpriorgid like '340206%'
                 or B.orgid like '340208%'
                 or B.dom like '%三山区%')
            then '三山区'
            when (B.regno like '340221%'
                 or B.orgid like '340221%'
                 or B.superorgid like '340221%'
                 or B.priorgid like '340221%'
                 or B.superpriorgid like '340221%'
                 or B.dom like '%芜湖县%')
            then '芜湖县'
            when (B.regno like '340222%'
                 or B.orgid like '340222%'
                 or B.superorgid like '340222%'
                 or B.priorgid like '340222%'
                 or B.superpriorgid like '340222%'
                 or B.dom like '%繁昌县%')
            then '繁昌县'
            when (B.regno like '340223%'
                 or B.orgid like '340223%'
                 or B.superorgid like '340223%'
                 or B.priorgid like '340223%'
                 or B.superpriorgid like '340223%'
                 or B.dom like '%南陵县%')
            then '南陵县'
            when (B.regno like '340224%'
                 or B.regno like '341422%'
                 or B.superpriorgid like '34020000000011%'
                 or B.dom like '%无为县%')
            then '无为县'
            when (B.regno like '340293%'
                 or B.regno like '340294%'
                 or B.superpriorgid like '3402001700%'
                 or B.priorgid like '3402001700%'
                 or B.superpriorgid like '3402001800%'
                 or B.priorgid like '3402001800%')
            then '长江大桥综合经济开发区'
            when (B.regno like '340207%'
                 or B.orgid like '340207%'
                 or B.superorgid like '340207%'
                 or B.priorgid like '340207%'
                 or B.superpriorgid like '340207%' 
                 or B.dom like '%鸠江区%')
            then '鸠江区'
            else '无法确认所属地区'
            end

-------------------------------------------------------------

应年报

select count(*), case when (should_pub.regno like '340202%'
                 or should_pub.orgid like '340202%'
                 or should_pub.superorgid like '340202%'
                 or should_pub.priorgid like '340202%'
                 or should_pub.superpriorgid like '340202%'
                 or should_pub.dom like '%镜湖区%'
                 or real_pub.regno like '340202%'
                 or real_pub.orgid like '340202%'
                 or real_pub.superorgid like '340202%'
                 or real_pub.priorgid like '340202%'
                 or real_pub.superpriorgid like '340202%'
                 or real_pub.dom like '%镜湖区%')
            then '镜湖区'
            when (should_pub.regno like '340203%'
                 or should_pub.orgid like '340203%'
                 or should_pub.superorgid like '340203%'
                 or should_pub.priorgid like '340203%'
                 or should_pub.superpriorgid like '340203%'
                 or should_pub.dom like '%弋江区%'
                 or real_pub.regno like '340203%'
                 or real_pub.orgid like '340203%'
                 or real_pub.superorgid like '340203%'
                 or real_pub.priorgid like '340203%'
                 or real_pub.superpriorgid like '340203%'
                 or real_pub.dom like '%弋江区%')
            then '弋江区'
            when (should_pub.regno like '340206%'
                 or should_pub.orgid like '340206%'
                 or should_pub.superorgid like '340206%'
                 or should_pub.priorgid like '340206%'
                 or should_pub.superpriorgid like '340206%'
                 or should_pub.orgid like '340208%'
                 or should_pub.dom like '%三山区%'
                 or real_pub.regno like '340206%'
                 or real_pub.orgid like '340206%'
                 or real_pub.superorgid like '340206%'
                 or real_pub.priorgid like '340206%'
                 or real_pub.superpriorgid like '340206%'
                 or real_pub.orgid like '340208%'
                 or real_pub.dom like '%三山区%')
            then '三山区'
            when (should_pub.regno like '340221%'
                 or should_pub.orgid like '340221%'
                 or should_pub.superorgid like '340221%'
                 or should_pub.priorgid like '340221%'
                 or should_pub.superpriorgid like '340221%'
                 or should_pub.dom like '%芜湖县%'
                 or real_pub.regno like '340221%'
                 or real_pub.orgid like '340221%'
                 or real_pub.superorgid like '340221%'
                 or real_pub.priorgid like '340221%'
                 or real_pub.superpriorgid like '340221%'
                 or real_pub.dom like '%芜湖县%')
            then '芜湖县'
            when (should_pub.regno like '340222%'
                 or should_pub.orgid like '340222%'
                 or should_pub.superorgid like '340222%'
                 or should_pub.priorgid like '340222%'
                 or should_pub.superpriorgid like '340222%'
                 or should_pub.dom like '%繁昌县%'
                 or real_pub.regno like '340222%'
                 or real_pub.orgid like '340222%'
                 or real_pub.superorgid like '340222%'
                 or real_pub.priorgid like '340222%'
                 or real_pub.superpriorgid like '340222%'
                 or real_pub.dom like '%繁昌县%')
            then '繁昌县'
            when (should_pub.regno like '340223%'
                 or should_pub.orgid like '340223%'
                 or should_pub.superorgid like '340223%'
                 or should_pub.priorgid like '340223%'
                 or should_pub.superpriorgid like '340223%'
                 or should_pub.dom like '%南陵县%'
                 or real_pub.regno like '340223%'
                 or real_pub.orgid like '340223%'
                 or real_pub.superorgid like '340223%'
                 or real_pub.priorgid like '340223%'
                 or real_pub.superpriorgid like '340223%'
                 or real_pub.dom like '%南陵县%')
            then '南陵县'
            when (should_pub.regno like '340224%'
                 or should_pub.regno like '341422%'
                 or should_pub.superpriorgid like '34020000000011%'
                 or should_pub.dom like '%无为县%'
                 or real_pub.regno like '340224%'
                 or real_pub.regno like '341422%'
                 or real_pub.superpriorgid like '34020000000011%'
                 or real_pub.dom like '%无为县%')
            then '无为县'
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
            then '长江大桥综合经济开发区'
            when (should_pub.regno like '340207%'
                 or should_pub.orgid like '340207%'
                 or should_pub.superorgid like '340207%'
                 or should_pub.priorgid like '340207%'
                 or should_pub.superpriorgid like '340207%' 
                 or should_pub.dom like '%鸠江区%'
                 or real_pub.regno like '340207%'
                 or real_pub.orgid like '340207%'
                 or real_pub.superorgid like '340207%'
                 or real_pub.priorgid like '340207%'
                 or real_pub.superpriorgid like '340207%' 
                 or real_pub.dom like '%鸠江区%')
            then '鸠江区'
            else '无法确认所属地区'
            end as 地区
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
                 or should_pub.dom like '%镜湖区%'
                 or real_pub.regno like '340202%'
                 or real_pub.orgid like '340202%'
                 or real_pub.superorgid like '340202%'
                 or real_pub.priorgid like '340202%'
                 or real_pub.superpriorgid like '340202%'
                 or real_pub.dom like '%镜湖区%')
            then '镜湖区'
            when (should_pub.regno like '340203%'
                 or should_pub.orgid like '340203%'
                 or should_pub.superorgid like '340203%'
                 or should_pub.priorgid like '340203%'
                 or should_pub.superpriorgid like '340203%'
                 or should_pub.dom like '%弋江区%'
                 or real_pub.regno like '340203%'
                 or real_pub.orgid like '340203%'
                 or real_pub.superorgid like '340203%'
                 or real_pub.priorgid like '340203%'
                 or real_pub.superpriorgid like '340203%'
                 or real_pub.dom like '%弋江区%')
            then '弋江区'
            when (should_pub.regno like '340206%'
                 or should_pub.orgid like '340206%'
                 or should_pub.superorgid like '340206%'
                 or should_pub.priorgid like '340206%'
                 or should_pub.superpriorgid like '340206%'
                 or should_pub.orgid like '340208%'
                 or should_pub.dom like '%三山区%'
                 or real_pub.regno like '340206%'
                 or real_pub.orgid like '340206%'
                 or real_pub.superorgid like '340206%'
                 or real_pub.priorgid like '340206%'
                 or real_pub.superpriorgid like '340206%'
                 or real_pub.orgid like '340208%'
                 or real_pub.dom like '%三山区%')
            then '三山区'
            when (should_pub.regno like '340221%'
                 or should_pub.orgid like '340221%'
                 or should_pub.superorgid like '340221%'
                 or should_pub.priorgid like '340221%'
                 or should_pub.superpriorgid like '340221%'
                 or should_pub.dom like '%芜湖县%'
                 or real_pub.regno like '340221%'
                 or real_pub.orgid like '340221%'
                 or real_pub.superorgid like '340221%'
                 or real_pub.priorgid like '340221%'
                 or real_pub.superpriorgid like '340221%'
                 or real_pub.dom like '%芜湖县%')
            then '芜湖县'
            when (should_pub.regno like '340222%'
                 or should_pub.orgid like '340222%'
                 or should_pub.superorgid like '340222%'
                 or should_pub.priorgid like '340222%'
                 or should_pub.superpriorgid like '340222%'
                 or should_pub.dom like '%繁昌县%'
                 or real_pub.regno like '340222%'
                 or real_pub.orgid like '340222%'
                 or real_pub.superorgid like '340222%'
                 or real_pub.priorgid like '340222%'
                 or real_pub.superpriorgid like '340222%'
                 or real_pub.dom like '%繁昌县%')
            then '繁昌县'
            when (should_pub.regno like '340223%'
                 or should_pub.orgid like '340223%'
                 or should_pub.superorgid like '340223%'
                 or should_pub.priorgid like '340223%'
                 or should_pub.superpriorgid like '340223%'
                 or should_pub.dom like '%南陵县%'
                 or real_pub.regno like '340223%'
                 or real_pub.orgid like '340223%'
                 or real_pub.superorgid like '340223%'
                 or real_pub.priorgid like '340223%'
                 or real_pub.superpriorgid like '340223%'
                 or real_pub.dom like '%南陵县%')
            then '南陵县'
            when (should_pub.regno like '340224%'
                 or should_pub.regno like '341422%'
                 or should_pub.superpriorgid like '34020000000011%'
                 or should_pub.dom like '%无为县%'
                 or real_pub.regno like '340224%'
                 or real_pub.regno like '341422%'
                 or real_pub.superpriorgid like '34020000000011%'
                 or real_pub.dom like '%无为县%')
            then '无为县'
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
            then '长江大桥综合经济开发区'
            when (should_pub.regno like '340207%'
                 or should_pub.orgid like '340207%'
                 or should_pub.superorgid like '340207%'
                 or should_pub.priorgid like '340207%'
                 or should_pub.superpriorgid like '340207%' 
                 or should_pub.dom like '%鸠江区%'
                 or real_pub.regno like '340207%'
                 or real_pub.orgid like '340207%'
                 or real_pub.superorgid like '340207%'
                 or real_pub.priorgid like '340207%'
                 or real_pub.superpriorgid like '340207%' 
                 or real_pub.dom like '%鸠江区%')
            then '鸠江区'
            else '无法确认所属地区'
            end

------------------------------------------------------------------------------------------------
企业经营信息 （不同经营信息改一下筛选条件即可）


select sum(value0) 户数, sum(value1) 总数, sum(value0)/sum(value1) 户数占比, Ancheyear 年份 
from
(
select count(distinct A.MARPRID) value0, 0 value1, A.Ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.Marprid = B.id
join gs_ecps_entass C
on A.ID = C.YEARID
where (B.Enttype < '7000' and B.enttypegb not in ('5830', '6830'))
      and C.vendinc = 0 and a.empnum = 0--（根据筛选标准修改红色部分）
Group by A.Ancheyear

union all

select 0 value0, count(distinct A.MARPRID) value1, A.Ancheyear
from gs_ecps_entyearexaminfo A
join biz_gs_marpripinfo B
on A.Marprid = B.id
join gs_ecps_entass C
on A.ID = C.YEARID
where (B.Enttype < '7000' and B.enttypegb not in ('5830', '6830'))
      and C.vendinc is not null and a.empnum is not null --（根据筛选标准修改红色部分）
Group by A.Ancheyear
)
Group by Ancheyear
Order by Ancheyear

 


------------------------------------------------------------------------------------------------

年报率（维度 - 注册资本）

已年报：

Select 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end AS 注册资本额,

count (DISTINCT A.marprid)  年报企业数

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
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end
ORDER BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end

------------------------------------------------------------------------

应年报：

Select 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end AS 注册资本额,

count(*) 年报企业数 from
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
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end
ORDER BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end

----------------------------------------------------------------------------------------------------------------

盈利占比（维度 - 注册资本）

盈利户数：

Select 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end AS 注册资本额,

count (DISTINCT A.marprid)  盈利企业数

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
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end
ORDER BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end

----------------------------------------------------------------------

有盈利信息户数

Select 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end AS 注册资本额,

count (DISTINCT A.marprid)  盈利企业数

from biz_gs_marpripinfo B
join gs_ecps_entyearexaminfo A
on A.MARPRID = B.Id
join gs_ecps_entass C
on C.YEARID = A.id
where (B.enttype < 7000 and B.enttypegb not in ('5830', '6830'))
      and C.PROGRO is not null
      AND A.ANCHEYEAR = 2016

------------------------------------------------------------------------------------------------

开业在营率（维度- 注册资本）

开业在营户数

Select 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end AS 注册资本额,

count (DISTINCT A.marprid)  盈利企业数

from biz_gs_marpripinfo B
join gs_ecps_entyearexaminfo A
on A.MARPRID = B.Id
where (B.enttype < 7000 and B.enttypegb not in ('5830', '6830'))
      and B.state = 06
      AND A.ANCHEYEAR = 2016

GROUP BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end
ORDER BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end

----------------------------------------------------------------------

有营业状态信息企业

Select 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end AS 注册资本额,

count (DISTINCT A.marprid)  盈利企业数

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
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end
ORDER BY 
case    when REGCAP = 0 then '0'
        when REGCAP is null then '无注册资本信息'
        when REGCAP > 0 and REGCAP <= 100 then '1-100万'
        when REGCAP > 100 and REGCAP <= 500 then '101-500万'
         when REGCAP > 500 and REGCAP<= 1000 then '501-1000万'
         when  REGCAP > 1000 and REGCAP<= 5000 then '1001-5000万'
         when  REGCAP > 5000 and REGCAP<= 10000 then '5001万 - 1亿'
         when REGCAP > 10000 then '1亿以上'
         else '注册资本信息无效'
         end

-------------------------------------------------------------------------------------------------------
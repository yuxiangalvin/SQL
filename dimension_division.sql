指标 - 应年报户数

select count(distinct B.ID) 
from biz_gs_marpripinfo B
LEFT join biz_reg_marpripcancel C
on B.ID = C.marprid
LEFT join biz_reg_marpripcanauditinfo D
on C.ID = D.ENTCANCELID
where B.Estdate <= to_timestamp('161231', 'yymmdd')
      and (B.State = 06
           or (B.state = 11
               and D.APPRDATE >= to_timestamp('170701', 'yymmdd')))  --可继续增加语句按各维度分析


维度 - 五种企业类型

内资（非私营）企业
enttypegb in ('3100', '4310', '4110', '4410', '3200', '4220', '4320', '4120', '4420', '1153', '2153', '1110', '2110', '1121', '1122',
'1123', '1140', '1190', '2121', '2122', '2123', '2140', '2190', '1211', '1213', '1219', '2211',
 '2213', '2219', '1221', '1223', '1229', '2221', '2223', '2229', '3400', '4340', '3300', '3500', '4330', '4210', '4600', '4700' )

私营企业
enttypegb in ('4540', '4560', '4531', '4532', '4533', '4551', '4552', '4553', '1151', '2151', '1152', '2152', '1130', '2130', '1212', '1222', '2212', '2222')

外资企业
enttypegb in ('5110', '6110', '5120', '6120', '5310', '6310', '5130', '5140', '5150', '5160', '5320', '6130', '6140', '6150', '6160', '6170', '6320', '5220', '5240', '6220',
 '6240', '6260', '5210', '5230', '6210', '6230', '6250', '5290', '6290', '5410', '6410', '5420', '6420', '5430', '6430', '5190',
  '5390', '5490', '6190', '6390', '6490', '5810', '5820', '5840', '5890', '6810', '6820', '6840', '6890')

农专合作社
enttype in (9100, 9200)

个体工商户
enttype = 9600

企业总
enttype < 7000 and enttypegb not in ('5830', '6830')




维度 - 地区

select dom, orgid, superorgid, t.regno, priorgid, superpriorgid, oplocdistrict from biz_gs_marpripinfo t
where     orgid not like '340221%'
      and orgid not like '340222%'
      and orgid not like '340223%'
      and orgid not like '340224%'
      and orgid not like '340202%'
      and orgid not like '340203%'
      and orgid not like '340206%'
      and orgid not like '340207%'
      and superorgid not like '340221%'
      and superorgid not like '340222%'
      and superorgid not like '340223%'
      and superorgid not like '340224%'
      and superorgid not like '340202%'
      and superorgid not like '340203%'
      and superorgid not like '340206%'
      and superorgid not like '340207%'
      and priorgid not like '340221%'
      and priorgid not like '340222%'
      and priorgid not like '340223%'
      and priorgid not like '340224%'
      and priorgid not like '340202%'
      and priorgid not like '340203%'
      and priorgid not like '340206%'
      and priorgid not like '340207%'
      and superpriorgid not like '340221%'
      and superpriorgid not like '340222%'
      and superpriorgid not like '340223%'
      and superpriorgid not like '340224%'
      and superpriorgid not like '340202%'
      and superpriorgid not like '340203%'
      and superpriorgid not like '340206%'
      and superpriorgid not like '340207%'
      and regno not like '340221%'
      and regno not like '340222%'
      and regno not like '340223%'
      and regno not like '340224%'
      and regno not like '340202%'
      and regno not like '340203%'
      and regno not like '340206%'
      and regno not like '340207%'
      and regno not like '341422%' --  无为
      and regno not like '340293%' --  长江
      and superpriorgid not like '34020000000011%' --无为
      and superpriorgid not like '3402001700%' -- 长江
      and priorgid not like '3402001700%' -- 长江
      and superpriorgid not like '3402001800%' -- 长江
      and priorgid not like '3402001800%' -- 长江
      and (instr(t.dom,'无为县')= 0
         and instr(t.dom, '南陵县') = 0
         and instr(t.dom, '繁昌县') = 0
         and instr(t.dom, '芜湖县') =0
         and instr(t.dom, '镜湖区') = 0
         and instr(t.dom,'弋江区') = 0
         and instr(t.dom, '鸠江区') = 0
         and instr(t.dom, '三山区')  = 0)


维度 - 行业

select count(distinct A.MARPRID),  NVL(B.industryphy, 0) 行业代码
from biz_gs_marpripinfo B
join gs_ecps_entyearexaminfo A
on B.id = A.Marprid
where A.ancheyear = 2016
and ((B.enttype < '7000' and B.enttypegb not in ('5830', '6830'))
     or B.enttype in ('9100', '9200')
     or B.enttype = '9600'
     )
group by NVL(B.industryphy, 0)
order by NVL(B.industryphy, 0)
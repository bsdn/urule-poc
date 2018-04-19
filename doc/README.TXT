
=====登录用户
admin/123456

		String sql = "select product_name_ as productName, CUSTOMER_NO_ as customerNo, sum(if(right(date_,2)='01',packet_Number_,0)) as flowDireJan, sum(if(right(date_,2)='02',packet_Number_,0)) as flowDireFeb, sum(if(right(date_,2)='03',packet_Number_,0)) as flowDireMar, sum(if(right(date_,2)='04',packet_Number_,0)) as flowDireApr, sum(if(right(date_,2)='05',packet_Number_,0)) as flowDireMay, sum(if(right(date_,2)='06',packet_Number_,0)) as flowDireJun, sum(if(right(date_,2)='07',packet_Number_,0)) as flowDireJul, sum(if(right(date_,2)='08',packet_Number_,0)) as flowDireAug, sum(if(right(date_,2)='09',packet_Number_,0)) as flowDireSep, sum(if(right(date_,2)='10',packet_Number_,0)) as flowDireOct, sum(if(right(date_,2)='11',packet_Number_,0)) as flowDireNov, sum(if(right(date_,2)='12',packet_Number_,0)) as flowDireDec from POC_SEND_OUT where product_name_=:productName and CUSTOMER_NO_=:customerNo";

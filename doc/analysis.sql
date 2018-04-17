select product_name_ as productName, FIRST_CUSTOMER_NO_ as firstCustomerNo, sum(if(CLIENT_PROPERTY_='一级' && month_=1,packet_Number_,0)) as flowDireJan1, sum(if(CLIENT_PROPERTY_='二级'  && month_=1,packet_Number_,0)) as flowDireJan2, sum(if(CLIENT_PROPERTY_='一级' && month_=2,packet_Number_,0)) as flowDireFeb1, sum(if(CLIENT_PROPERTY_='二级'  && month_=2,packet_Number_,0)) as flowDireFeb2, sum(if(CLIENT_PROPERTY_='一级' && month_=3,packet_Number_,0)) as flowDireMar1, sum(if(CLIENT_PROPERTY_='二级'  && month_=3,packet_Number_,0)) as flowDireMar2, sum(if(CLIENT_PROPERTY_='一级' && month_=4,packet_Number_,0)) as flowDireApr1, sum(if(CLIENT_PROPERTY_='二级'  && month_=4,packet_Number_,0)) as flowDireApr2, sum(if(CLIENT_PROPERTY_='一级' && month_=5,packet_Number_,0)) as flowDireMay1, sum(if(CLIENT_PROPERTY_='二级'  && month_=5,packet_Number_,0)) as flowDireMay2, sum(if(CLIENT_PROPERTY_='一级' && month_=6,packet_Number_,0)) as flowDireJun1, sum(if(CLIENT_PROPERTY_='二级'  && month_=6,packet_Number_,0)) as flowDireJun2, sum(if(CLIENT_PROPERTY_='一级' && month_=7,packet_Number_,0)) as flowDireJul1, sum(if(CLIENT_PROPERTY_='二级'  && month_=7,packet_Number_,0)) as flowDireJul2, sum(if(CLIENT_PROPERTY_='一级' && month_=8,packet_Number_,0)) as flowDireAug1, sum(if(CLIENT_PROPERTY_='二级'  && month_=8,packet_Number_,0)) as flowDireAug2, sum(if(CLIENT_PROPERTY_='一级' && month_=9,packet_Number_,0)) as flowDireSep1, sum(if(CLIENT_PROPERTY_='二级'  && month_=9,packet_Number_,0)) as flowDireSep2, sum(if(CLIENT_PROPERTY_='一级' && month_=10,packet_Number_,0)) as flowDireOct1, sum(if(CLIENT_PROPERTY_='二级'  && month_=10,packet_Number_,0)) as flowDireOct2, sum(if(CLIENT_PROPERTY_='一级' && month_=11,packet_Number_,0)) as flowDireNov1, sum(if(CLIENT_PROPERTY_='二级'  && month_=11,packet_Number_,0)) as flowDireNov2, sum(if(CLIENT_PROPERTY_='一级' && month_=12,packet_Number_,0)) as flowDireDec12, sum(if(CLIENT_PROPERTY_='二级'  && month_=12,packet_Number_,0)) as flowDireDec2 from poc_flowdire where product_name_='通脉颗粒 4克*4袋*80盒' and FIRST_CUSTOMER_NO_='100000';
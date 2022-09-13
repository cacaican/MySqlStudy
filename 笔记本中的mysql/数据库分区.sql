partition by range (actualid)
(
  partition part_01 values less than(1000000000) tablespace ts1,
  partition part_02 values less than(2000000000) tablespace ts2,
  partition part_03 values less than(3000000000) tablespace ts3,
  partition part_04 values less than(4000000000) tablespace ts4,
  partition part_05 values less than(5000000000) tablespace ts5,
  partition part_06 values less than(6000000000) tablespace ts6,
  partition part_07 values less than(7000000000) tablespace ts7,
  partition part_08 values less than(8000000000) tablespace ts8,
  partition part_09 values less than(9000000000) tablespace ts9,
  partition part_10 values less than(10000000000) tablespace ts10,
  partition part_99 values less than(700000000000000) tablespace ts99,
  partition part_past01 values less than(728000000000000) tablespace ts_p01,
  partition part_past02 values less than(751000000000000) tablespace ts_p02,
  partition part_past03 values less than(772000000000000) tablespace ts_p03,
  partition part_past04 values less than(779000000000000) tablespace ts_p04,
  partition part_past05 values less than(780000000000000) tablespace ts_p05,
  partition part_past06 values less than(782000000000000) tablespace ts_p06,
  partition part_past07 values less than(793000000000000) tablespace ts_p07,
  partition part_past08 values less than(795000000000000) tablespace ts_p08,
  partition part_past09 values less than(902000000000000) tablespace ts_p09,
  partition part_past10 values less than(905000000000000) tablespace ts_p10,
  partition part_past11 values less than(907000000000000) tablespace ts_p11,
  partition part_past12 values less than(910000000000000) tablespace ts_p12,
  partition part_n99 values less than(MAXVALUE) tablespace ts_n99
);

    select * from POLICY_D01.ATL_ROLE;

select * from USER_TAB_PARTITIONS;

select count(*) from policy.plc_main@link_shengchan_policy;--518312732
select max(ACTUALID) from policy.plc_main@link_shengchan_policy;--738000302120122
select max(ACTUALID) from policy.plc_main@link_shengchan_policy where actualid like '737%';--738000302120122

select max(ACTUALID) from policy.plc_main@link_shengchan_policy where actualid <737000000000000;--738000302120122
select count(*) from policy.plc_main@link_shengchan_policy;--518312732
select * from policy.typ_codeDetail@link_shengchan_policy where basecodeid ='BankCode';--518312732
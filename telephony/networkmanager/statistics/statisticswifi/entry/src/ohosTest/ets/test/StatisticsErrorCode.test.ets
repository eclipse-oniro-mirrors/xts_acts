import { describe, it, expect,TestType, Size, Level } from '@ohos/hypium';
import { statistics } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};


export default function StatisticsErrorCodeTest() {
  describe('StatisticsErrorCodeTest', () => {

       /* *
        * @tc.number: SUB_NetworkMgr_Statistics_GetUidRxBytes_ErrCo_0100
        * @tc.name  : testNetworkMgrStatisticsGetUidRxBytesErrCo0100
        * @tc.desc  : Parameter error
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 3
        */
    it('testNetworkMgrStatisticsGetUidRxBytesErrCo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytesErrCo0100';
      console.info(`${caseName} test start`);
      try {
        statistics.getUidRxBytes(undefined, (error: BusinessError, stats: number) => {
          if(error){
            console.log(`${caseName} err in `,JSON.stringify(error));
            ExpectTrue(error.code == 401)
          }
          else{
            console.log(`${caseName} GetUidRxBytes success `,JSON.stringify(stats));
            ExpectTrue(false)
          }
          done();
        });
      }catch (err){
        console.info(`${caseName} try catch err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
    });

    /* *
        * @tc.number: SUB_NetworkMgr_Statistics_GetUidRxBytes_ErrCo_0200
        * @tc.name  : testNetworkMgrStatisticsGetUidRxBytesErrCo0200
        * @tc.desc  : Parameter error
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 3
        */
    it('testNetworkMgrStatisticsGetUidRxBytesErrCo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytesErrCo0200';
      console.info(`${caseName} test start`);
      try {
        statistics.getUidRxBytes(undefined).then((stats: number) => {
          console.log(`${caseName} get stats success`,JSON.stringify(stats));
          ExpectTrue(false);
        })
          .catch((err:BusinessError)=>{
            console.log(`${caseName} err in`,JSON.stringify(err));
            ExpectTrue(err.code == 401);
          })
        done();
      }catch (err){
        console.info(`${caseName} try catch err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
    });

    /* *
        * @tc.number: SUB_NetworkMgr_Statistics_GetUidTxBytes_ErrCo_0300
        * @tc.name  : testNetworkMgrStatisticsGetUidRxBytesErrCo0300
        * @tc.desc  : Parameter error
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 3
        */
    it('testNetworkMgrStatisticsGetUidRxBytesErrCo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytesErrCo0300';
      console.info(`${caseName} test start`);
      try {
        statistics.getUidTxBytes(undefined, (error: BusinessError, stats: number) => {
          if(error){
            console.log(`${caseName} err in `,JSON.stringify(error));
            ExpectTrue(error.code == 401)
          }
          else{
            console.log(`${caseName} GetUidRxBytes success `,JSON.stringify(stats));
            ExpectTrue(false)
          }
          done();
        });
      }catch (err){
        console.info(`${caseName} try catch err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
    });

    /* *
        * @tc.number: SUB_NetworkMgr_Statistics_GetUidTxBytes_ErrCo_0400
        * @tc.name  : testNetworkMgrStatisticsGetUidTxBytesErrCo0400
        * @tc.desc  : Parameter error
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 3
        */
    it('testNetworkMgrStatisticsGetUidTxBytesErrCo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidTxBytesErrCo0400';
      console.info(`${caseName} test start`);
      try {
        statistics.getUidTxBytes(undefined).then((stats: number) => {
          console.log(`${caseName} get stats success`,JSON.stringify(stats));
          ExpectTrue(false);
        })
          .catch((err:BusinessError)=>{
            console.log(`${caseName} err in`,JSON.stringify(err));
            ExpectTrue(err.code == 401);
          })
        done();
      }catch (err){
        console.info(`${caseName} try catch err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Statistics_getSockRxBytes_ErrCo_0500
     * @tc.name  : testNetworkMgrStatisticsgetSockRxBytesErrCo0500
     * @tc.desc  : Test getSockRxBytes property
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrStatisticsgetSockRxBytesErrCo0500",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName = "testNetworkMgrStatisticsgetSockRxBytesErrCo0500";
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdRxBytes(999999999999999999999999999999999999999999999, (err:BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} getSockRxBytes failed, err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 2100001)
            done();
          } else {
            console.log(`${caseName} getSockRxBytes success, data: ${JSON.stringify(data)}`);
            ExpectTrue(false)
            done();
          }
        });
      }
      catch (err){
        console.info(`${caseName} try catch err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Statistics_getSockRxBytes_ErrCo_0600
     * @tc.name  : testNetworkMgrStatisticsgetSockRxBytesErrCo0600
     * @tc.desc  : Test getSockRxBytes property
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrStatisticsgetSockRxBytesErrCo0600",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName = "testNetworkMgrStatisticsgetSockRxBytesErrCo0600";
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdRxBytes(999999999999999999999999999999999999999999999)
          .then((data: number)=>{
            console.log(`${caseName} getSockRxBytes success, data: ${JSON.stringify(data)}`);
            ExpectTrue(false)
            done();
          })
          .catch((err:BusinessError) =>{
            console.log(`${caseName} getSockRxBytes failed, err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 2100001)
            done();
          })
      }
      catch (err){
        console.info(`${caseName} try catch err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Statistics_getSockTxBytes_ErrCo_0700
     * @tc.name  : testNetworkMgrStatisticsgetSockTxBytesErrCo0700
     * @tc.desc  : Test	Invalid parameter value.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrStatisticsgetSockTxBytesErrCo0700",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName = "testNetworkMgrStatisticsgetSockTxBytesErrCo0700";
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdTxBytes(999999999999999999999999999999999999999999999, (err:BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} getSockRxBytes failed, err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 2100001)
            done();
          } else {
            console.log(`${caseName} getSockRxBytes success, data: ${JSON.stringify(data)}`);
            ExpectTrue(false)
            done();
          }
        });
      }
      catch (err){
        console.info(`${caseName} try catch err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        done();
      }
    });

    /**
     * @tc.number: SUB_NetworkMgr_Statistics_getSockTxBytes_ErrCo_0800
     * @tc.name  : testNetworkMgrStatisticsgetSockTxBytesErrCo0800
     * @tc.desc  : Test Invalid parameter value.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrStatisticsgetSockTxBytesErrCo0800",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName = "testNetworkMgrStatisticsgetSockTxBytesErrCo0800";
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdTxBytes(999999999999999999999999999999999999999999999)
          .then((data: number)=>{
            console.log(`${caseName} getSockRxBytes success, data: ${JSON.stringify(data)}`);
            ExpectTrue(false)
            done();
          })
          .catch((err:BusinessError) =>{
            console.log(`${caseName} getSockRxBytes failed, err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 2100001)
            done();
          })
      }
      catch (err){
        console.info(`${caseName} try catch err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2100001);
        done();
      }
    });


  })
}



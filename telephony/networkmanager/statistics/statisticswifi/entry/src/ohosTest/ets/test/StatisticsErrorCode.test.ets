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
const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}


export default function StatisticsErrorCodeTest() {
  describe('StatisticsErrorCodeTest', () => {

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidRxBytesErrCo0100
     * @tc.number SUB_NetworkMgr_Statistics_GetUidRxBytes_ErrCo_0100
     * @tc.desc   Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidRxBytesErrCo0200
     * @tc.number SUB_NetworkMgr_Statistics_GetUidRxBytes_ErrCo_0200
     * @tc.desc   Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidRxBytesErrCo0300
     * @tc.number SUB_NetworkMgr_Statistics_GetUidTxBytes_ErrCo_0300
     * @tc.desc   Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidTxBytesErrCo0400
     * @tc.number SUB_NetworkMgr_Statistics_GetUidTxBytes_ErrCo_0400
     * @tc.desc   Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testNetworkMgrStatisticsgetSockRxBytesErrCo0500
     * @tc.number SUB_NetworkMgr_Statistics_getSockRxBytes_ErrCo_0500
     * @tc.desc   Test getSockRxBytes property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testNetworkMgrStatisticsgetSockRxBytesErrCo0600
     * @tc.number SUB_NetworkMgr_Statistics_getSockRxBytes_ErrCo_0600
     * @tc.desc   Test getSockRxBytes property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testNetworkMgrStatisticsgetSockTxBytesErrCo0700
     * @tc.number SUB_NetworkMgr_Statistics_getSockTxBytes_ErrCo_0700
     * @tc.desc   Test	Invalid parameter value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testNetworkMgrStatisticsgetSockTxBytesErrCo0800
     * @tc.number SUB_NetworkMgr_Statistics_getSockTxBytes_ErrCo_0800
     * @tc.desc   Test Invalid parameter value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
    
      /**
       * @tc.name   testNetManagerStatisticsGetSockfdTxBytesCallBackErrCo0100
       * @tc.number SUB_NetManager_Statistics_GetSockfdTxBytes_CallBackErrCo_0100
       * @tc.desc   Function test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it("testNetManagerStatisticsGetSockfdTxBytesCallBackErrCo0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = "testNetManagerStatisticsGetSockfdTxBytesCallBackErrCo0100";
        console.info(`${caseName}---start`);
        try {
          statistics.getSockfdTxBytes(123456, (error, data) => {
            console.info(`${caseName} getSockfdTxBytes error is : ` + JSON.stringify(error)+ " data is :"+ data);
            if (error) {
              ExpectTrue(error.code == 2100002);
            } else {
              ExpectFail();
            }
            console.info(`${caseName}---End`);
            done();
          });
        } catch (error) {
          console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
          ExpectTrue(error.code == 2100002);
          console.info(`${caseName}---End`);
          done();
        }

      });
      /**
       * @tc.name   testNetManagerStatisticsGetSockfdTxBytesPromiseErrCo0200
       * @tc.number SUB_NetManager_Statistics_GetSockfdTxBytes_PromiseErrCo_0200
       * @tc.desc   Function test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it("testNetManagerStatisticsGetSockfdTxBytesPromiseErrCo0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = "testNetManagerStatisticsGetSockfdTxBytesPromiseErrCo0200";
        console.info(`${caseName}---start`);
        try {
          statistics.getSockfdTxBytes(123456).then((data)=>{
            console.log(`${caseName} getSockfdTxBytes success, data: ${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }).catch((err: BusinessError)=>{
            console.log(`${caseName} getSockfdTxBytes err is : ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 2100002);
            done();
          })
        } catch (error) {
          console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
          ExpectTrue(error.code == 2100002);
          console.info(`${caseName}---End`);
          done();
        }
      });

      /**
       * @tc.name   testNetManagerStatisticsGetSockfdTxBytesCallbackErrCo0300
       * @tc.number SUB_NetManager_Statistics_GetSockfdTxBytes_CallbackErrCo_0300
       * @tc.desc   Test getSockfdTxBytes property
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it("testNetManagerStatisticsGetSockfdTxBytesCallbackErrCo0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = "testNetManagerStatisticsGetSockfdTxBytesCallbackErrCo0300";
        console.info(`${caseName}---start`);
        try {
          statistics.getSockfdTxBytes(undefined, (err, data) => {
            if (err) {
              console.info(`${caseName} getSockfdTxBytes failed, err: ${JSON.stringify(err)}`);
              ExpectTrue(err.code == 401);
              done();
            } else {
              console.log(`${caseName} getSockfdTxBytes success, data: ${JSON.stringify(data)}`);
              ExpectFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
          expect(error.code == 401).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   testNetManagerStatisticsGetSockfdTxBytesPromiseErrCo0400
     * @tc.number SUB_NetManager_Statistics_GetSockfdTxBytes_PromiseErrCo_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetManagerStatisticsGetSockfdTxBytesPromiseErrCo0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = "testNetManagerStatisticsGetSockfdTxBytesPromiseErrCo0400";
      console.info(`${caseName}---start`);
      try {
        statistics.getSockfdTxBytes(undefined).then((data)=>{
          console.log(`${caseName} getSockfdTxBytes success, data: ${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError)=>{
          console.log(`${caseName} getSockfdTxBytes err is : ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          done();
        })
      } catch (error) {
        console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetManagerStatisticsGetSockfdTxBytesCallBackErrCo0500
     * @tc.number SUB_NetManager_Statistics_GetSockfdTxBytes_CallBackErrCo_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetManagerStatisticsGetSockfdTxBytesCallBackErrCo0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = "testNetManagerStatisticsGetSockfdTxBytesCallBackErrCo0500";
      console.info(`${caseName}---start`);
      try {
        statistics.getSockfdTxBytes(-1, (error, data) => {
          console.info(`${caseName} getSockfdTxBytes error is : ` + JSON.stringify(error)+ " data is :"+ data);
          if (error) {
            ExpectTrue(error.code == 2100001);
          } else {
            ExpectFail();
          }
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }

    });
    /**
     * @tc.name   testNetManagerStatisticsGetSockfdTxBytesPromiseErrCo0600
     * @tc.number SUB_NetManager_Statistics_GetSockfdTxBytes_PromiseErrCo_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetManagerStatisticsGetSockfdTxBytesPromiseErrCo0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = "testNetManagerStatisticsGetSockfdTxBytesPromiseErrCo0600";
      console.info(`${caseName}---start`);
      try {
        statistics.getSockfdTxBytes(-1).then((data)=>{
          console.log(`${caseName} getSockfdTxBytes success, data: ${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError)=>{
          console.log(`${caseName} getSockfdTxBytes err is : ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 2100001);
          done();
        })
      } catch (error) {
        console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetManagerStatisticsGetSockfdRxBytesCallBackErrCo0100
     * @tc.number SUB_NetManager_Statistics_GetSockfdRxBytes_CallBackErrCo_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetManagerStatisticsGetSockfdRxBytesCallBackErrCo0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = "testNetManagerStatisticsGetSockfdRxBytesCallBackErrCo0100";
      console.info(`${caseName}---start`);
      try {
        statistics.getSockfdRxBytes(123456, (error, data) => {
          console.info(`${caseName} getSockfdTxBytes error is : ` + JSON.stringify(error)+ " data is :"+ data);
          if (error) {
            ExpectTrue(error.code == 2100002);
          } else {
            ExpectFail();
          }
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 2100002);
        console.info(`${caseName}---End`);
        done();
      }

    });
    /**
     * @tc.name   testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo0200
     * @tc.number SUB_NetManager_Statistics_GetSockfdRxBytes_PromiseErrCo_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = "testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo0200";
      console.info(`${caseName}---start`);
      try {
        statistics.getSockfdRxBytes(123456).then((data)=>{
          console.log(`${caseName} getSockfdTxBytes success, data: ${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError)=>{
          console.log(`${caseName} getSockfdTxBytes err is : ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 2100002);
          done();
        })
      } catch (error) {
        console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 2100002);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetManagerStatisticsGetSockfdRxBytesCallbackErrCo0300
     * @tc.number SUB_NetManager_Statistics_GetSockfdRxBytes_CallbackErrCo_0300
     * @tc.desc   Test getSockfdTxBytes property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetManagerStatisticsGetSockfdRxBytesCallbackErrCo0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = "testNetManagerStatisticsGetSockfdRxBytesCallbackErrCo0300";
      console.info(`${caseName}---start`);
      try {
        statistics.getSockfdRxBytes(undefined, (err, data) => {
          if (err) {
            console.info(`${caseName} getSockfdTxBytes failed, err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            done();
          } else {
            console.log(`${caseName} getSockfdTxBytes success, data: ${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        expect(error.code == 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo0400
     * @tc.number SUB_NetManager_Statistics_GetSockfdRxBytes_PromiseErrCo_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = "testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo0400";
      console.info(`${caseName}---start`);
      try {
        statistics.getSockfdRxBytes(undefined).then((data)=>{
          console.log(`${caseName} getSockfdTxBytes success, data: ${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError)=>{
          console.log(`${caseName} getSockfdTxBytes err is : ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          done();
        })
      } catch (error) {
        console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 401);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetManagerStatisticsGetSockfdRxBytesCallBackErrCo0500
     * @tc.number SUB_NetManager_Statistics_GetSockfdRxBytes_CallBackErrCo_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetManagerStatisticsGetSockfdRxBytesCallBackErrCo0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = "testNetManagerStatisticsGetSockfdRxBytesCallBackErrCo0500";
      console.info(`${caseName}---start`);
      try {
        statistics.getSockfdRxBytes(-1, (error, data) => {
          console.info(`${caseName} getSockfdTxBytes error is : ` + JSON.stringify(error)+ " data is :"+ data);
          if (error) {
            ExpectTrue(error.code == 2100001);
          } else {
            ExpectFail();
          }
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }

    });
    /**
     * @tc.name   testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo0600
     * @tc.number SUB_NetManager_Statistics_GetSockfdRxBytes_PromiseErrCo_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = "testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo0600";
      console.info(`${caseName}---start`);
      try {
        statistics.getSockfdRxBytes(-1).then((data)=>{
          console.log(`${caseName} getSockfdTxBytes success, data: ${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError)=>{
          console.log(`${caseName} getSockfdTxBytes err is : ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 2100001);
          done();
        })
      } catch (error) {
        console.info(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      }
    });


  })
}



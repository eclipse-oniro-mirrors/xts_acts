import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ConnectionTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function ConnectionWithoutNetTest() {

  describe("ConnectionWithoutNetTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   testNetConnectionGetDefaultNetCallback_static_0400
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNet_Callback_0400
     * @tc.desc   test obtain the default activated data network and use the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetConnectionGetDefaultNetCallback_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetConnectionGetDefaultNetCallback_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet((err: BusinessError<void> |null, data: connection.NetHandle| undefined) => {
          console.info(`${caseName} getDefaultNet callback: err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            ExpectTrue(data?.netId == 0);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetConnectionGetDefaultNetPromise_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNet_Promise_0200
     * @tc.desc   test obtain the default activated data network and use Promise as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetConnectionGetDefaultNetPromise_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetConnectionGetDefaultNetPromise_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          hilog.info(domain, tag, '%{public}s', caseName +': getDefaultNet data ->'+JSON.stringify(data));
          ExpectTrue(data.netId == 0);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultNetSync_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNetSync_0200
     * @tc.desc   test use synchronization method to obtain default activated data network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetDefaultNetSync_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultNetSync_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        ExpectTrue(netHandle.netId == 0);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });


  })
}
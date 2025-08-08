import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import { BundleInfo } from 'bundleManager.BundleInfo';
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";

let domain: number = 0x0000;
let tag: string = 'testTag';
const BUNDLE_NAME = "com.bms.bundleManage2";
const VENDOR = "example";

export default function getBundleInfo() {
  describe('getBundleInfo', (): void => {

    /*
      * @tc.number: Sub_Bms_GetBundleInfoWithUserIdCallBack_static_17700001
      * @tc.name:  getBundleInfoTestWithUserIdCallBack17700001
      * @tc.desc: test errCode 17700001 when call getBundleInfo with userID
      */
    it('getBundleInfoTestWithUserIdCallBack17700001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfo("com.example.helloworld5", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100, (err: BusinessError<void> | null, data : BundleInfo | undefined) => {
          hilog.info(domain, tag,
            'getBundleInfoTestWithUserIdCallBack17700001 err ====> ' + JSON.stringify(err));
          if (err) {
            expect(err?.code).assertEqual(17700001);
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      })

    /*
      * @tc.number: Sub_Bms_GetBundleInfoWithUserIdCallBack_static_17700004
      * @tc.name:  getBundleInfoTestWithUserIdCallBack17700004
      * @tc.desc: test errCode 17700004 when call getBundleInfo with userID
      */
    it('getBundleInfoTestWithUserIdCallBack17700004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 1010, (err: BusinessError<void> | null, data : BundleInfo | undefined) => {
          hilog.info(domain, tag,
            'getBundleInfoTestWithUserIdCallBack17700004 err ====> ' + JSON.stringify(err));
          if (err) {
            expect(err?.code).assertEqual(17700004);
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      })

    /*
      * @tc.number: Sub_Bms_GetBundleInfoCallBack_static_17700001
      * @tc.name:  getBundleInfoTestCallBack17700001
      * @tc.desc: test errCode 17700001 when call getBundleInfo
      */
    it('getBundleInfoTestCallBack17700001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfo("com.example.helloworld5", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, (err: BusinessError<void> | null, data : BundleInfo | undefined) => {
          hilog.info(domain, tag,
            'getBundleInfoTestCallBack17700001 err ====> ' + JSON.stringify(err));
          if (err) {
            expect(err?.code).assertEqual(17700001);
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      })

    /*
     * @tc.number: Sub_Bms_GetBundleInfoWithUserId_static_17700001
     * @tc.name:  getBundleInfoTestWithUserIdPromise17700001
     * @tc.desc: test errCode 17700001 when call getBundleInfo
     */
    it('getBundleInfoTestWithUserIdPromise17700001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, 'getBundleInfoTestWithUserIdPromise17700001  ====> start');
        try {
          bundle.getBundleInfo("com.example.helloworld5", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100).then((data : BundleInfo) => {
            expect().assertFail();
            done();
          }).catch((err: BusinessError): void => {
            hilog.info(0x0000, tag, 'getBundleInfoTestWithUserIdPromise17700001 err1 ====> ' + JSON.stringify(err));
            expect(err.code).assertEqual(17700001);
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, 'getBundleInfoTestWithUserIdPromise17700001 err2 ====> ' + JSON.stringify(err));
          let message = (err as BusinessError).message;
          expect().assertFail();
          done();
        }
      });

    /*
     * @tc.number: Sub_Bms_GetBundleInfoWithUserId_static_17700004
     * @tc.name:  getBundleInfoTestWithUserIdPromise17700004
     * @tc.desc: test errCode 17700004 when call getBundleInfo
     */
    it('getBundleInfoTestWithUserIdPromise17700004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, 'getBundleInfoTestWithUserIdPromise17700004  ====> start');
        try {
          bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 1010).then((data : BundleInfo) => {
            expect().assertFail();
            done();
          }).catch((err: BusinessError): void => {
            hilog.info(0x0000, tag, 'getBundleInfoTestWithUserIdPromise17700004 err1 ====> ' + JSON.stringify(err));
            expect(err.code).assertEqual(17700004);
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, 'getBundleInfoTestWithUserIdPromise17700004 err2 ====> ' + JSON.stringify(err));
          let message = (err as BusinessError).message;
          expect().assertFail();
          done();
        }
      });

    /*
     * @tc.number: Sub_Bms_GetBundleInfoSync_static_17700001
     * @tc.name:  getBundleInfoTestSync17700001
     * @tc.desc: test errCode 17700001 when call getBundleInfoSync
     */
    it('getBundleInfoTestSync17700001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'getBundleInfoTestSync17700001  ====> Start');
        try{
          let data: bundle.BundleInfo =
            bundle.getBundleInfoSync("com.example.helloworld5", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
          hilog.info(domain, tag, 'getBundleInfoTestSync17700001 data ====>' + JSON.stringify(data));
          expect().assertFail();
          done();
        }catch (err) {
          hilog.info(0x0000, tag, 'getBundleInfoTestSync17700001 err2 ====> ' + JSON.stringify(err));
          let message = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          expect(code).assertEqual(17700001);
          done();
        }
        hilog.info(domain, tag, 'getBundleInfoTestSync17700001 end');
      })

    /*
     * @tc.number: Sub_Bms_GetBundleInfoSyncWithUserID_static_17700001
     * @tc.name:  getBundleInfoTestSyncWithUserID17700001
     * @tc.desc: test errCode 17700001 when call getBundleInfoSync with userID
     */
    it('getBundleInfoTestSyncWithUserID17700001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'getBundleInfoTestSyncWithUserID17700001  ====> Start');
        try{
          let data: bundle.BundleInfo =
            bundle.getBundleInfoSync("com.example.helloworld5", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100);
          hilog.info(domain, tag, 'getBundleInfoTestSyncWithUserID17700001 data ====>' + JSON.stringify(data));
          expect().assertFail();
          done();
        }catch (err) {
          hilog.info(0x0000, tag, 'getBundleInfoTestSyncWithUserID17700001 err2 ====> ' + JSON.stringify(err));
          let message = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          expect(code).assertEqual(17700001);
          done();
        }
        hilog.info(domain, tag, 'getBundleInfoTestSyncWithUserID17700001 end');
      })

    /*
     * @tc.number: Sub_Bms_GetBundleInfoSyncWithUserID_static_17700004
     * @tc.name:  getBundleInfoTestSyncWithUserID17700004
     * @tc.desc: test errCode 17700004 when call getBundleInfoSync with userID
     */
    it('getBundleInfoTestSyncWithUserID17700004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'getBundleInfoTestSyncWithUserID17700004  ====> Start');
        try{
          let data: bundle.BundleInfo =
            bundle.getBundleInfoSync(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 1010);
          hilog.info(domain, tag, 'getBundleInfoTestSyncWithUserID17700004 data ====>' + JSON.stringify(data));
          expect().assertFail();
          done();
        }catch (err) {
          hilog.info(0x0000, tag, 'getBundleInfoTestSyncWithUserID17700004 err2 ====> ' + JSON.stringify(err));
          let message = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          expect(code).assertEqual(17700004);
          done();
        }
        hilog.info(domain, tag, 'getBundleInfoTestSyncWithUserID17700004 end');
      })
  })
}


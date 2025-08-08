import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import { BundleInfo } from 'bundleManager.BundleInfo';
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";

let domain: number = 0x0000;
let tag: string = 'testTag';
const BUNDLE_NAME = "ohos.acts.bundle.stage.test.static";
const VENDOR = "example";

export default function getBundleInfo() {
  describe('getBundleInfo', (): void => {

    /*
      * @tc.number: Sub_Bms_GetBundleInfoWithUserIdCallBack_static_201
      * @tc.name:  getBundleInfoTestWithUserIdCallBack201
      * @tc.desc: test errCode 201 when call getBundleInfo with userID
      */
    it('getBundleInfoTestWithUserIdCallBack201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfo("com.example.helloworld5", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            if (err && err?.code !== 0) {
              hilog.info(domain, tag,
                'getBundleInfoTestWithUserIdCallBack201 err ====> ' + JSON.stringify(err));
              expect(err?.code).assertEqual(201);
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
      })

    /*
      * @tc.number: Sub_Bms_GetBundleInfoCallBack_static_201
      * @tc.name:  getBundleInfoTestCallBack201
      * @tc.desc: test errCode 201 when call getBundleInfo
      */
    it('getBundleInfoTestCallBack201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfo("com.example.helloworld5", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            if (err && err?.code !== 0) {
              hilog.info(domain, tag,
                'getBundleInfoTestCallBack201 err ====> ' + JSON.stringify(err));
              expect(err?.code).assertEqual(201);
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
      })

    /*
     * @tc.number: Sub_Bms_GetBundleInfoWithUserId_static_201
     * @tc.name:  getBundleInfoTestWithUserIdPromise201
     * @tc.desc: test errCode 201 when call getBundleInfo
     */
    it('getBundleInfoTestWithUserIdPromise201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, 'getBundleInfoTestWithUserIdPromise201  ====> start');
        try {
          bundle.getBundleInfo("com.example.helloworld5", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100)
            .then((data: BundleInfo) => {
              expect().assertFail();
              done();
            })
            .catch((err: BusinessError): void => {
              hilog.info(0x0000, tag, 'getBundleInfoTestWithUserIdPromise201 err1 ====> ' + JSON.stringify(err));
              expect(err.code).assertEqual(201);
              done();
            });
        } catch (err) {
          hilog.info(0x0000, tag, 'getBundleInfoTestWithUserIdPromise201 err2 ====> ' + JSON.stringify(err));
          let message = (err as BusinessError).message;
          expect().assertFail();
          done();
        }
      });

    /*
     * @tc.number: Sub_Bms_GetBundleInfoSync_static_201
     * @tc.name:  getBundleInfoTestSync201
     * @tc.desc: test errCode 201 when call getBundleInfoSync
     */
    it('getBundleInfoTestSync201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'getBundleInfoTestSync201  ====> Start');
        try {
          let data: bundle.BundleInfo =
            bundle.getBundleInfoSync("com.example.helloworld5", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
          hilog.info(domain, tag, 'getBundleInfoTestSync201 data ====>' + JSON.stringify(data));
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(0x0000, tag, 'getBundleInfoTestSync201 err2 ====> ' + JSON.stringify(err));
          let message = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          expect(code).assertEqual(201);
          done();
        }
        hilog.info(domain, tag, 'getBundleInfoTestSync201 end');
      })

    /*
     * @tc.number: Sub_Bms_GetBundleInfoSyncWithUserID_static_201
     * @tc.name:  getBundleInfoTestSyncWithUserID201
     * @tc.desc: test errCode 201 when call getBundleInfoSync with userID
     */
    it('getBundleInfoTestSyncWithUserID201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'getBundleInfoTestSyncWithUserID201  ====> Start');
        try {
          let data: bundle.BundleInfo =
            bundle.getBundleInfoSync("com.example.helloworld5", bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100);
          hilog.info(domain, tag, 'getBundleInfoTestSyncWithUserID201 data ====>' + JSON.stringify(data));
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(0x0000, tag, 'getBundleInfoTestSyncWithUserID201 err2 ====> ' + JSON.stringify(err));
          let message = (err as BusinessError).message;
          let code = (err as BusinessError).code;
          expect(code).assertEqual(201);
          done();
        }
        hilog.info(domain, tag, 'getBundleInfoTestSyncWithUserID201 end');
      })

  })
}


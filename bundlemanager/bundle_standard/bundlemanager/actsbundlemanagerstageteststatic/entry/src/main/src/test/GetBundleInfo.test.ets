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
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_1100
     * @tc.name: getBundleInfoCallbackDefault
     * @tc.desc: Test getBundleInfo with default flag(by callback).
     */
    it('getBundleInfoCallbackDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            hilog.info(domain, tag, 'getBundleInfoCallbackDefault  ====> start');
            if (err) {
              hilog.info(domain, tag, 'getBundleInfoCallbackDefault  ====> err' + JSON.stringify(err));
              expect().assertFail();
            } else if (data !== undefined) {
              hilog.info(domain, tag, 'getBundleInfoCallbackDefault  ====> data' + JSON.stringify(data));
              expect(data!.name).assertEqual(BUNDLE_NAME);
              expect(data!.vendor).assertEqual(VENDOR);
              expect(data!.versionCode + '').assertEqual('1000000');
              expect(data!.versionName).assertEqual("1.0.0");
              expect(data!.minCompatibleVersionCode + '').assertEqual('1000000');
              expect(data!.targetVersion + '').assertEqual('20');
              expect(data!.installTime).assertLarger(0.0);
              expect(data!.updateTime).assertLarger(0.0);
              expect(data!.firstInstallTime).assertLarger(0.0);
              expect(data!.appInfo).assertEqual(null);
              expect(data!.hapModulesInfo.length + '').assertEqual('0');
              expect(data!.reqPermissionDetails.length + '').assertEqual('0');
              expect(data!.permissionGrantStates.length + '').assertEqual('0');
            } else {
              hilog.info(domain, tag, 'getBundleInfoCallbackDefault  ====> Fail');
              expect().assertFail();
            }
            hilog.info(domain, tag, 'getBundleInfoCallbackDefault  ====> end');
            done();
          })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_1200
     * @tc.name: getBundleInfoCallbackDefaultUserID
     * @tc.desc: Test getBundleInfo with default flag and userID(by callback).
     */
    it('getBundleInfoCallbackDefaultUserID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            hilog.info(domain, tag, 'getBundleInfoCallbackDefaultUserID  ====> start');
            if (err) {
              hilog.info(domain, tag, 'getBundleInfoCallbackDefaultUserID   ====> err' + JSON.stringify(err));
              expect().assertFail();
            } else if (data !== undefined) {
              hilog.info(domain, tag, 'getBundleInfoCallbackDefaultUserID  ====> data' + JSON.stringify(data));
              expect(data!.name).assertEqual(BUNDLE_NAME);
              expect(data!.vendor).assertEqual(VENDOR);
              expect(data!.versionCode + '').assertEqual('1000000');
              expect(data!.versionName).assertEqual("1.0.0");
              expect(data!.minCompatibleVersionCode + '').assertEqual('1000000');
              expect(data!.targetVersion + '').assertEqual('20');
              expect(data!.installTime).assertLarger(0.0);
              expect(data!.updateTime).assertLarger(0.0);
              expect(data!.firstInstallTime).assertLarger(0.0);
              expect(data!.appInfo).assertEqual(null);
              expect(data!.hapModulesInfo.length + '').assertEqual('0');
              expect(data!.reqPermissionDetails.length + '').assertEqual('0');
              expect(data!.permissionGrantStates.length + '').assertEqual('0');
            } else {
              hilog.info(domain, tag, 'getBundleInfoCallbackDefaultUserID  ====> Fail');
              expect().assertFail();
            }
            hilog.info(domain, tag, 'getBundleInfoCallbackDefaultUserID  ====> end');
            done();
          })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_1300
     * @tc.name: getBundleInfoPromiseDefault
     * @tc.desc: Test getBundleInfo with default flag(by promise).
     */
    it('getBundleInfoPromiseDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100)
          .then((data: BundleInfo) => {
            hilog.info(domain, tag, 'getBundleInfoPromiseDefault  ====> start');
            expect(data.name).assertEqual(BUNDLE_NAME);
            expect(data.vendor).assertEqual(VENDOR);
            expect(data.versionCode + '').assertEqual('1000000');
            expect(data.versionName).assertEqual("1.0.0");
            expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
            expect(data.targetVersion + '').assertEqual('20');
            expect(data.installTime).assertLarger(0.0);
            expect(data.updateTime).assertLarger(0.0);
            expect(data.firstInstallTime).assertLarger(0.0);
            expect(data.appInfo).assertEqual(null);
            expect(data.hapModulesInfo.length + '').assertEqual('0');
            expect(data.reqPermissionDetails.length + '').assertEqual('0');
            expect(data.permissionGrantStates.length + '').assertEqual('0');
            hilog.info(domain, tag, 'getBundleInfoPromiseDefault  ====> end');
            done();
          })
          .catch(err => {
            hilog.info(domain, tag, 'getBundleInfoPromiseDefault  ====> err');
            expect(err).assertFail();
            done();
          })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_1400
     * @tc.name: getBundleInfoSyncDefault
     * @tc.desc: Test getBundleInfo with default flag(by sync).
     */
    it('getBundleInfoSyncDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'getBundleInfoSyncDefault  ====> Start');
        let data: bundle.BundleInfo =
          bundle.getBundleInfoSync(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
        hilog.info(domain, tag, 'getBundleInfoSyncDefault data ====>' + JSON.stringify(data));
        expect(data.name).assertEqual(BUNDLE_NAME);
        expect(data.vendor).assertEqual(VENDOR);
        expect(data.versionCode + '').assertEqual('1000000');
        expect(data.versionName).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
        expect(data.targetVersion + '').assertEqual('20');
        expect(data.installTime).assertLarger(0.0);
        expect(data.updateTime).assertLarger(0.0);
        expect(data.firstInstallTime).assertLarger(0.0);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length + '').assertEqual('0');
        expect(data.reqPermissionDetails.length + '').assertEqual('0');
        expect(data.permissionGrantStates.length + '').assertEqual('0');
        done();
        hilog.info(domain, tag, 'getBundleInfoSyncDefault end');
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_1500
     * @tc.name: getBundleInfoSyncDefaultUserID
     * @tc.desc: Test getBundleInfo with default flag and userID(by sync).
     */
    it('getBundleInfoSyncDefaultUserID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'getBundleInfoSyncDefaultUserID  ====> Start');
        let data: bundle.BundleInfo =
          bundle.getBundleInfoSync(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100);
        hilog.info(domain, tag, 'getBundleInfoSyncDefaultUserID data ====>' + JSON.stringify(data));
        expect(data.name).assertEqual(BUNDLE_NAME);
        expect(data.vendor).assertEqual(VENDOR);
        expect(data.versionCode + '').assertEqual('1000000');
        expect(data.versionName).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
        expect(data.targetVersion + '').assertEqual('20');
        expect(data.installTime).assertLarger(0.0);
        expect(data.updateTime).assertLarger(0.0);
        expect(data.firstInstallTime).assertLarger(0.0);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length + '').assertEqual('0');
        expect(data.reqPermissionDetails.length + '').assertEqual('0');
        expect(data.permissionGrantStates.length + '').assertEqual('0');
        done();
        hilog.info(domain, tag, 'getBundleInfoSyncDefaultUserID end');
      })
  })
}

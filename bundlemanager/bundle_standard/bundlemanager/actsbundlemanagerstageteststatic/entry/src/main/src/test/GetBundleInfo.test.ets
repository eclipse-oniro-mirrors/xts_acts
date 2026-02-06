/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import { BundleInfo } from 'bundleManager.BundleInfo';
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";

let domain: int = 0x0000;
let tag: string = 'testTag';
const BUNDLE_NAME = "ohos.acts.bundle.stage.test.static";
const VENDOR = "example";

export default function getBundleInfo() {
  describe('getBundleInfo', (): void => {

    /**
     * @tc.name   getBundleInfoCallbackDefault
     * @tc.number Sub_Bms_Framework_Query_AppInfo_static_1100
     * @tc.desc   Test getBundleInfo with default flag(by callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getBundleInfoCallbackDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            hilog.info(domain, tag, 'getBundleInfoCallbackDefault  ====> start');
            if (err) {
              hilog.info(domain, tag, 'getBundleInfoCallbackDefault  ====> err' + JSON.stringify(err));
              expect().assertFail();
              done();
            } else if (data !== undefined) {
              hilog.info(domain, tag, 'getBundleInfoCallbackDefault  ====> data' + JSON.stringify(data));
              expect(data!.name).assertEqual(BUNDLE_NAME);
              expect(data!.vendor).assertEqual(VENDOR);
              expect(data!.versionCode + '').assertEqual('1000000');
              expect(data!.versionName).assertEqual("1.0.0");
              expect(data!.buildVersion).assertEqual("1.0.0");
              expect(data!.minCompatibleVersionCode + '').assertEqual('1000000');
              expect(data!.targetVersion).assertLarger(22);
              expect(data!.installTime ).assertLarger(0.0);
              expect(data!.updateTime ).assertLarger(0.0);
              expect(data!.firstInstallTime ).assertLarger(0.0);
              expect(data!.appInfo).assertEqual(null);
              expect(data!.hapModulesInfo.length + '').assertEqual('0');
              expect(data!.reqPermissionDetails.length + '').assertEqual('0');
              expect(data!.permissionGrantStates.length + '').assertEqual('0');
              done();
            } else {
              hilog.info(domain, tag, 'getBundleInfoCallbackDefault  ====> Fail');
              expect().assertFail();
              done();
            }
            hilog.info(domain, tag, 'getBundleInfoCallbackDefault  ====> end');
            done();
          })
      })

    /**
     * @tc.name   getBundleInfoCallbackDefaultUserID
     * @tc.number Sub_Bms_Framework_Query_AppInfo_static_1200
     * @tc.desc   Test getBundleInfo with default flag and userID(by callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getBundleInfoCallbackDefaultUserID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            hilog.info(domain, tag, 'getBundleInfoCallbackDefaultUserID  ====> start');
            if (err) {
              hilog.info(domain, tag, 'getBundleInfoCallbackDefaultUserID   ====> err' + JSON.stringify(err));
              expect().assertFail();
              done();
            } else if (data !== undefined) {
              hilog.info(domain, tag, 'getBundleInfoCallbackDefaultUserID  ====> data' + JSON.stringify(data));
              expect(data!.name).assertEqual(BUNDLE_NAME);
              expect(data!.vendor).assertEqual(VENDOR);
              expect(data!.versionCode + '').assertEqual('1000000');
              expect(data!.versionName).assertEqual("1.0.0");
              expect(data!.buildVersion).assertEqual("1.0.0");
              expect(data!.minCompatibleVersionCode + '').assertEqual('1000000');
              expect(data!.targetVersion).assertLarger(22);
              expect(data!.installTime ).assertLarger(0.0);
              expect(data!.updateTime ).assertLarger(0.0);
              expect(data!.firstInstallTime ).assertLarger(0.0);
              expect(data!.appInfo).assertEqual(null);
              expect(data!.hapModulesInfo.length + '').assertEqual('0');
              expect(data!.reqPermissionDetails.length + '').assertEqual('0');
              expect(data!.permissionGrantStates.length + '').assertEqual('0');
              done();
            } else {
              hilog.info(domain, tag, 'getBundleInfoCallbackDefaultUserID  ====> Fail');
              expect().assertFail();
              done();
            }
            hilog.info(domain, tag, 'getBundleInfoCallbackDefaultUserID  ====> end');
            done();
          })
      })

    /**
     * @tc.name   getBundleInfoPromiseDefault
     * @tc.number Sub_Bms_Framework_Query_AppInfo_static_1300
     * @tc.desc   Test getBundleInfo with default flag(by promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
            expect(data.buildVersion).assertEqual("1.0.0");
            expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
            expect(data.targetVersion).assertLarger(22);
            expect(data.installTime ).assertLarger(0.0);
            expect(data.updateTime ).assertLarger(0.0);
            expect(data.firstInstallTime ).assertLarger(0.0);
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

    /**
     * @tc.name   getBundleInfoSyncDefault
     * @tc.number Sub_Bms_Framework_Query_AppInfo_static_1400
     * @tc.desc   Test getBundleInfo with default flag(by sync).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
        expect(data.buildVersion).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
        expect(data.targetVersion).assertLarger(22);
        expect(data.installTime ).assertLarger(0.0);
        expect(data.updateTime ).assertLarger(0.0);
        expect(data.firstInstallTime ).assertLarger(0.0);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length + '').assertEqual('0');
        expect(data.reqPermissionDetails.length + '').assertEqual('0');
        expect(data.permissionGrantStates.length + '').assertEqual('0');
        hilog.info(domain, tag, 'getBundleInfoSyncDefault end');
        done();
      })

    /**
     * @tc.name   getBundleInfoSyncDefaultUserID
     * @tc.number Sub_Bms_Framework_Query_AppInfo_static_1500
     * @tc.desc   Test getBundleInfo with default flag and userID(by sync).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
        expect(data.buildVersion).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
        expect(data.targetVersion).assertLarger(22);
        expect(data.installTime ).assertLarger(0.0);
        expect(data.updateTime ).assertLarger(0.0);
        expect(data.firstInstallTime ).assertLarger(0.0);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length + '').assertEqual('0');
        expect(data.reqPermissionDetails.length + '').assertEqual('0');
        expect(data.permissionGrantStates.length + '').assertEqual('0');
        hilog.info(domain, tag, 'getBundleInfoSyncDefaultUserID end');
        done();
      })
  })
}

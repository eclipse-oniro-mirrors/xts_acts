/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file expect in compliance with the License.
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
import hilog from '@ohos.hilog';
import launcherBundleManager from '@ohos.bundle.launcherBundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';
import { osAccount } from '@kit.BasicServicesKit';

const BUNDLE_NAME100 = 'ohos.acts.bms.getlauncherabilityinfo.test';
const BUNDLE_NAME101 = 'ohos.acts.bms.getlauncherabilityinfo.test101';
const BUNDLE_NAME401 = null;
const BUNDLE_NAME17700001 = 'ohos.acts.bms.getlauncherabilityinfo.test200';
const USER_ID100 = 100;
const USER_ID101 = 101;
const USER_ID401 = null;
const USER_ID17700004 = 999;
const SUCCESS = 0;
const ERROR_CODE201 = 201;
const ERROR_CODE401 = 401;
const ERROR_CODE17700001 = 17700001;
const ERROR_CODE17700004 = 17700004;
const ERROR_CODE801 = 801;
const DOMAIN: number = 0xFF00;
const PARAM_0 = 0;
const CODE_PATH = "/data/app/el1/bundle/public/ohos.acts.bms.getlauncherabilityinfo.test";
const URI = "/ohos.acts.bms.getlauncherabilityinfo.test/entry_test/TestAbility";

export default function actsGetLauncherAbilityInfoTest() {
  describe('ActsGetLauncherAbilityInfoTest', () => {
    /*
     * @tc.number: Sub_Bms_Framework_GetLauncherAbilityInfoSync_0100
     * @tc.name: Sub_Bms_Framework_GetLauncherAbilityInfoSync_0100
     * @tc.desc: Test getLauncherAbilityInfoSync with valid value.
     */
    it('Sub_Bms_Framework_GetLauncherAbilityInfoSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let osAccountManager = osAccount.getAccountManager();
      let code = SUCCESS;
      let userId = USER_ID100;
      osAccountManager.getOsAccountLocalId((err, localId) => {
        userId = localId;
      })
      try {
        let abilityInfos: Array<launcherBundleManager.LauncherAbilityInfo> =
          launcherBundleManager.getLauncherAbilityInfoSync(BUNDLE_NAME100, userId);
        expect(abilityInfos.length).assertLarger(PARAM_0);
        for (let index = 0; index < abilityInfos.length; index++) {
          expect(abilityInfos[index].labelId).assertLarger(PARAM_0);
          expect(abilityInfos[index].iconId).assertLarger(PARAM_0);
          expect(abilityInfos[index].userId).assertEqual(userId);
          expect(abilityInfos[index].installTime).assertLarger(PARAM_0);
          expect(abilityInfos[index].applicationInfo.name).assertEqual(BUNDLE_NAME100);
          expect(abilityInfos[index].applicationInfo.description).assertEqual("");
          expect(abilityInfos[index].applicationInfo.descriptionId).assertEqual(PARAM_0);
          expect(abilityInfos[index].applicationInfo.enabled).assertEqual(true);
          expect(abilityInfos[index].applicationInfo.label).assertEqual("$string:app_name");
          expect(abilityInfos[index].applicationInfo.labelId).assertLarger(PARAM_0);
          expect(abilityInfos[index].applicationInfo.icon).assertEqual("$media:app_icon");
          expect(abilityInfos[index].applicationInfo.iconId).assertLarger(PARAM_0);
          expect(abilityInfos[index].applicationInfo.process).assertEqual(BUNDLE_NAME100);
          expect(abilityInfos[index].applicationInfo.permissions.length).assertEqual(PARAM_0);
          expect(abilityInfos[index].applicationInfo.codePath).assertEqual(CODE_PATH);
          expect(abilityInfos[index].applicationInfo.metadataArray.length).assertEqual(PARAM_0);
          expect(abilityInfos[index].applicationInfo.removable).assertEqual(true);
          expect(abilityInfos[index].applicationInfo.accessTokenId).assertLarger(PARAM_0);
          expect(abilityInfos[index].applicationInfo.uid).assertLarger(PARAM_0);
          expect(abilityInfos[index].applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME100);
          expect(abilityInfos[index].applicationInfo.iconResource.moduleName).assertEqual("entry_test");
          expect(abilityInfos[index].applicationInfo.iconResource.id).assertLarger(PARAM_0);
          expect(abilityInfos[index].applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME100);
          expect(abilityInfos[index].applicationInfo.labelResource.moduleName).assertEqual("entry_test");
          expect(abilityInfos[index].applicationInfo.labelResource.id).assertLarger(PARAM_0);
          expect(abilityInfos[index].applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME100);
          expect(abilityInfos[index].applicationInfo.descriptionResource.moduleName).assertEqual("entry_test");
          expect(abilityInfos[index].applicationInfo.descriptionResource.id).assertEqual(PARAM_0);
          expect(abilityInfos[index].applicationInfo.appDistributionType).assertEqual("os_integration");
          expect(abilityInfos[index].applicationInfo.appProvisionType).assertEqual("release");
          expect(abilityInfos[index].applicationInfo.systemApp).assertEqual(true);
          expect(abilityInfos[index].applicationInfo.bundleType).assertEqual(PARAM_0);
          expect(abilityInfos[index].applicationInfo.debug).assertEqual(false);
          expect(abilityInfos[index].applicationInfo.dataUnclearable).assertEqual(false);
          expect(abilityInfos[index].applicationInfo.nativeLibraryPath).assertEqual("");
          expect(abilityInfos[index].applicationInfo.multiAppMode.multiAppModeType).assertEqual(PARAM_0);
          expect(abilityInfos[index].applicationInfo.multiAppMode.maxCount).assertEqual(PARAM_0);
          expect(abilityInfos[index].applicationInfo.appIndex).assertEqual(PARAM_0);
          expect(abilityInfos[index].applicationInfo.installSource).assertEqual("unknown");
          expect(abilityInfos[index].applicationInfo.releaseType.length).assertLarger(PARAM_0);
          expect(abilityInfos[index].applicationInfo.cloudFileSyncEnabled).assertEqual(false);
          expect(abilityInfos[index].applicationInfo.cloudStructuredDataSyncEnabled).assertEqual(false);
          expect(abilityInfos[index].elementName.deviceId).assertEqual("");
          expect(abilityInfos[index].elementName.bundleName).assertEqual(BUNDLE_NAME100);
          expect(abilityInfos[index].elementName.moduleName).assertEqual("entry_test");
          expect(abilityInfos[index].elementName.abilityName).assertEqual("TestAbility");
          expect(abilityInfos[index].elementName.uri).assertEqual(URI);
          expect(abilityInfos[index].elementName.shortName).assertEqual("");
        }
        done();
      }
      catch (errData) {
        let errMsg = (errData as BusinessError).message;
        code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetLauncherAbilityInfoSync_0100",
          `errData is errCode:${code} message:${errMsg}`);
        if (code === ERROR_CODE801) {
          expect(code).assertEqual(ERROR_CODE801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_GetLauncherAbilityInfoSync_2000
     * @tc.name: Sub_Bms_Framework_GetLauncherAbilityInfoSync_2000
     * @tc.desc: Test getLauncherAbilityInfoSync with parameter error return errcode 401.
     */
    it('Sub_Bms_Framework_GetLauncherAbilityInfoSync_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let code = SUCCESS;
      try {
        let abilityInfos: Array<launcherBundleManager.LauncherAbilityInfo> =
          launcherBundleManager.getLauncherAbilityInfoSync(BUNDLE_NAME401, USER_ID401);
        expect().assertFail();
        done();
      }
      catch (errData) {
        let errMsg = (errData as BusinessError).message;
        code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetLauncherAbilityInfoSync_2000",
          `errData is errCode:${code} message:${errMsg}`);
        if (code === ERROR_CODE801) {
          expect(code).assertEqual(ERROR_CODE801);
          done();
        } else {
          expect(code).assertEqual(ERROR_CODE401);
          done();
        }
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200
     * @tc.name: Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200
     * @tc.desc: Test getLauncherAbilityInfoSync with bundle name is not found return errcode 17700001.
     */
    it('Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let osAccountManager = osAccount.getAccountManager();
      let code = SUCCESS;
      let userId = USER_ID100;
      osAccountManager.getOsAccountLocalId((err, localId) => {
        userId = localId;
      })
      try {
        let abilityInfos: Array<launcherBundleManager.LauncherAbilityInfo> =
          launcherBundleManager.getLauncherAbilityInfoSync(BUNDLE_NAME17700001, userId);
        expect().assertFail();
        done();
      }
      catch (errData) {
        let errMsg = (errData as BusinessError).message;
        code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200",
          `errData is errCode:${code} message:${errMsg}`);
        if (code === ERROR_CODE801) {
          expect(code).assertEqual(ERROR_CODE801);
          done();
        } else {
          expect(code).assertEqual(ERROR_CODE17700001);
          done();
        }
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300
     * @tc.name: Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300
     * @tc.desc: Test getLauncherAbilityInfoSync with user ID is not found return errcode 17700004.
     */
    it('Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let code = SUCCESS;
      try {
        let abilityInfos: Array<launcherBundleManager.LauncherAbilityInfo> =
          launcherBundleManager.getLauncherAbilityInfoSync(BUNDLE_NAME100, USER_ID17700004);
        expect().assertFail();
      }
      catch (errData) {
        let errMsg = (errData as BusinessError).message;
        code = (errData as BusinessError).code;
        hilog.info(DOMAIN, "Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300",
          `errData is errCode:${code} message:${errMsg}`);
        if (code === ERROR_CODE801) {
          expect(code).assertEqual(ERROR_CODE801);
          done();
        } else {
          expect(code).assertEqual(ERROR_CODE17700004);
          done();
        }
      }
    })
  })
}
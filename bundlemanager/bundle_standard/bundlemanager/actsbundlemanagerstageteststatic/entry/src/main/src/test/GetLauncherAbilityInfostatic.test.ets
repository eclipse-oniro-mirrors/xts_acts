/*
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base'
import launcherBundleManager from '@ohos.bundle.launcherBundleManager';
import { ShortcutInfo } from 'bundleManager.ShortcutInfo';
import bundleManager from '@ohos.bundle.bundleManager';
import launcherBundleManager from '@ohos.bundle.launcherBundleManager';

let domain: int = 0x0000;
let tag: string = 'testTag';
let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
let BUNDLE_NAME100 = 'ohos.acts.bundle.stage.test.static';
let BUNDLE_NAME401 = null;
let USER_ID100 = 100;
let PARAM_0 = 16777219;
let APP_Index = 0
let MAX_COUNT = 0
let CODE_PATH = "/data/app/el1/bundle/public/ohos.acts.bundle.stage.test.static";
let URI = "/ohos.acts.bundle.stage.test.static/entry/EntryAbility";

export default function abilityTest() {
  describe("abilityTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100
     * @tc.number Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100
     * @tc.desc   Test getLauncherAbilityInfoSync with valid value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let userId = USER_ID100;
        let data = launcherBundleManager.getLauncherAbilityInfoSync(BUNDLE_NAME100, USER_ID100);
        expect(data.length>0).assertTrue();
        expect(data![0].userId).assertEqual(userId);
        expect(data![0].applicationInfo.name).assertEqual(BUNDLE_NAME100);
        expect(data![0].applicationInfo.description).assertEqual("$string:module_desc");
        expect(data![0].applicationInfo.enabled).assertEqual(true);
        expect(data![0].applicationInfo.label).assertEqual("$string:app_name");
        expect(data![0].applicationInfo.icon).assertEqual("$media:app_icon");
        expect(data![0].applicationInfo.process).assertEqual(BUNDLE_NAME100);
        expect(data![0].applicationInfo.codePath).assertEqual(CODE_PATH);
        expect(data![0].applicationInfo.removable).assertEqual(true);
        expect(data![0].applicationInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME100);
        expect(data![0].applicationInfo.iconResource.moduleName).assertEqual("entry");
        expect(data![0].applicationInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME100);
        expect(data![0].applicationInfo.labelResource.moduleName).assertEqual("entry");
        expect(data![0].applicationInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME100);
        expect(data![0].applicationInfo.descriptionResource.moduleName).assertEqual("entry");
        expect(data![0].applicationInfo.appDistributionType).assertEqual("os_integration");
        expect(data![0].applicationInfo.appProvisionType).assertEqual("release");
        expect(data![0].applicationInfo.systemApp).assertEqual(false);
        expect(data![0].applicationInfo.bundleType).assertEqual(MAX_COUNT);
        expect(data![0].applicationInfo.debug).assertEqual(true);
        expect(data![0].applicationInfo.dataUnclearable).assertEqual(false);
        expect(data![0].applicationInfo.nativeLibraryPath).assertEqual("");
        expect(data![0].applicationInfo.multiAppMode.multiAppModeType).assertEqual(MAX_COUNT);
        expect(data![0].applicationInfo.multiAppMode.maxCount).assertEqual(MAX_COUNT);
        expect(data![0].applicationInfo.appIndex).assertEqual(APP_Index);
        expect(data![0].applicationInfo.installSource).assertEqual("unknown");
        expect(data![0].applicationInfo.cloudFileSyncEnabled).assertEqual(false);
        expect(data![0].applicationInfo.cloudStructuredDataSyncEnabled).assertEqual(false);
        expect(data![0].applicationInfo.descriptionId).assertLarger(0);
        expect(data![0].applicationInfo.labelId).assertLarger(0);
        expect(data![0].applicationInfo.iconId).assertLarger(0);
        expect(data![0].applicationInfo.accessTokenId).assertLarger(0);
        expect(data![0].applicationInfo.uid).assertLarger(0);
        expect(data![0].elementName.deviceId).assertEqual("");
        expect(data![0].elementName.bundleName).assertEqual(BUNDLE_NAME100);
        expect(data![0].elementName.moduleName).assertEqual("entry");
        expect(data![0].elementName.abilityName).assertEqual("EntryAbility");
        expect(data![0].elementName.uri).assertEqual(URI);
        expect(data![0].elementName.shortName).assertEqual("");
        hilog.info(domain, tag,"data is " + JSON.stringify(data));
        done();
      } catch (errData) {
        let code = (errData as BusinessError).code;
        let message = (errData as BusinessError).message;
        hilog.info(domain, tag,`errData is errCode:${code}  message:${message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'abilityTest001 end');
    })
  })
}
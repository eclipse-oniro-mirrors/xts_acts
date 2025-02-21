/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect } from '@ohos/hypium'

export default function GetSecondModuleTest() {
  describe('getSecondModuleTest', function () {

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_5920
     * @tc.name GetSecondModuleTest
     * @tc.desc Test the bundleManager secondary module
     */
    it('GetSecondModuleTest', 0, async function (done) {
      let bundleInfo = await bundle.getBundleInfoForSelf(
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION)
      let applicationInfoTest: bundle.ApplicationInfo = bundleInfo.appInfo;
      expect(typeof (applicationInfoTest.name)).assertEqual('string');
      let metadataTest: bundle.Metadata = bundleInfo.hapModulesInfo[0].metadata[0];
      expect(typeof (metadataTest.name)).assertEqual('string');
      let bundleInfoTest: bundle.BundleInfo = bundleInfo;
      expect(typeof (bundleInfoTest.name)).assertEqual('string');
      let usedSceneTest: bundle.UsedScene = bundleInfo.reqPermissionDetails[0].usedScene
      expect(typeof (usedSceneTest.abilities[0])).assertEqual('string');
      let reqPermissionDetailsTest: bundle.ReqPermissionDetail = bundleInfo.reqPermissionDetails[0]
      expect(typeof (reqPermissionDetailsTest.name)).assertEqual('string');
      let signatureInfoTest: bundle.SignatureInfo = bundleInfo.signatureInfo;
      expect(typeof (signatureInfoTest.appId)).assertEqual('string');
      let hapModuleInfoTest: bundle.HapModuleInfo = bundleInfo.hapModulesInfo[0];
      expect(typeof (hapModuleInfoTest.name)).assertEqual('string');
      let abilityInfoTest: bundle.AbilityInfo = bundleInfo.hapModulesInfo[0].abilitiesInfo[0];
      expect(typeof (abilityInfoTest.bundleName)).assertEqual('string');
      let windowSizeTest: bundle.WindowSize = bundleInfo.hapModulesInfo[0].abilitiesInfo[0].windowSize;
      expect(windowSizeTest.maxWindowRatio).assertEqual(0);
      let extensionAbilityInfoTest: bundle.ExtensionAbilityInfo = bundleInfo.hapModulesInfo[0].extensionAbilitiesInfo[0];
      expect(typeof (extensionAbilityInfoTest.bundleName)).assertEqual('string');
      let elementNameExample = {
        deviceId: "123456789",
        bundleName: "bundleName",
        moduleName:"moduleName",
        abilityName: "abilityName",
        uri:"uri",
        shortName:"shortName"
      }
      let elementNameTest: bundle.ElementName = elementNameExample;
      expect(elementNameTest.deviceId).assertEqual("123456789");
      expect(elementNameTest.bundleName).assertEqual("bundleName");
      expect(elementNameTest.moduleName).assertEqual("moduleName");
      expect(elementNameTest.abilityName).assertEqual("abilityName");
      expect(elementNameTest.uri).assertEqual("uri");
      expect(elementNameTest.shortName).assertEqual("shortName");
      done();
    })
  })

}

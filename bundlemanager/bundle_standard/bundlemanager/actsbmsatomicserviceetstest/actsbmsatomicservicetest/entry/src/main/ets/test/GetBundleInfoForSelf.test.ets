/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bundle from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"

export default function getBundleInfoForSelf() {
  describe('getBundleInfoForSelf', () => {

    /**
     * @tc.name   getBundleInfoForSelfAtomicService
     * @tc.number SUB_BMS_SERVICE_SPLIT_0031
     * @tc.desc   Test getBundleInfoForSelf with AtomicService
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBundleInfoForSelfAtomicService', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
      bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE).then(data => {
        let preloadItemTest: bundle.PreloadItem = data.hapModulesInfo[2].preloads[0];
        expect(typeof (preloadItemTest.moduleName)).assertEqual('string');
        let dependencyTest: bundle.Dependency = data.hapModulesInfo[2].dependencies[0];
        expect(typeof (dependencyTest.moduleName)).assertEqual('string');
        console.info("getBundleInfoForSelfApplicationPro" + JSON.stringify(data.appInfo));
        for (let i = 0; i < data.hapModulesInfo.length; i++) {
          console.info("getBundleInfoForSelfApplicationPro : " + i + "  ==" + JSON.stringify(data.hapModulesInfo[i]));
        }
        expect(data.appInfo.bundleType).assertEqual(bundle.BundleType.ATOMIC_SERVICE);
        expect(bundle.ExtensionAbilityType.INSIGHT_INTENT_UI).assertEqual(22);
        expect(bundle.DisplayOrientation.AUTO_ROTATION_UNSPECIFIED).assertEqual(13);
        expect(bundle.DisplayOrientation.FOLLOW_DESKTOP).assertEqual(14);
        expect(data.appInfo.multiAppMode.multiAppModeType).assertEqual(bundle.MultiAppModeType.UNSPECIFIED);
        expect(bundle.MultiAppModeType.UNSPECIFIED).assertEqual(0);
        expect(bundle.MultiAppModeType.MULTI_INSTANCE).assertEqual(1);
        expect(bundle.MultiAppModeType.APP_CLONE).assertEqual(2);
        expect(data.appInfo.multiAppMode.maxCount).assertEqual(0);
        expect(data.hapModulesInfo[0].type).assertEqual(bundle.ModuleType.FEATURE);
        expect(data.hapModulesInfo[0].preloads.length).assertEqual(0);
        expect(data.hapModulesInfo[0].dependencies.length).assertEqual(0);
        expect(data.hapModulesInfo[1].type).assertEqual(bundle.ModuleType.SHARED);
        expect(data.hapModulesInfo[1].preloads.length).assertEqual(0);
        expect(data.hapModulesInfo[1].dependencies.length).assertEqual(0);
        expect(data.hapModulesInfo[2].type).assertEqual(bundle.ModuleType.ENTRY);
        expect(data.hapModulesInfo[2].preloads.length).assertEqual(2);
        expect(data.hapModulesInfo[2].preloads[0].moduleName).assertEqual("feature");
        expect(data.hapModulesInfo[2].preloads[1].moduleName).assertEqual("shared");
        expect(data.hapModulesInfo[2].dependencies.length).assertEqual(1);
        expect(data.hapModulesInfo[2].dependencies[0].moduleName).assertEqual("feature");
        expect(data.hapModulesInfo[2].dependencies[0].bundleName).assertEqual("");
        expect(data.hapModulesInfo[2].dependencies[0].versionCode).assertEqual(0);
        done();
      }).catch(err => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getBundleInfoForSelfSyncAtomicService
     * @tc.number SUB_BMS_APPINFO_SYNC_SELF_0012
     * @tc.desc   Test getBundleInfoForSelfSync with AtomicService
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getBundleInfoForSelfSyncAtomicService', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
      bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
      let preloadItemTest: bundle.PreloadItem = data.hapModulesInfo[2].preloads[0];
      expect(typeof (preloadItemTest.moduleName)).assertEqual('string');
      let dependencyTest: bundle.Dependency = data.hapModulesInfo[2].dependencies[0];
      expect(typeof (dependencyTest.moduleName)).assertEqual('string');
      console.info("getBundleInfoForSelfApplicationPro" + JSON.stringify(data.appInfo));
      for (let i = 0; i < data.hapModulesInfo.length; i++) {
        console.info("getBundleInfoForSelfApplicationPro : " + i + "  ==" + JSON.stringify(data.hapModulesInfo[i]));
      }
      expect(data.appInfo.bundleType).assertEqual(bundle.BundleType.ATOMIC_SERVICE);
      expect(data.hapModulesInfo[0].type).assertEqual(bundle.ModuleType.FEATURE);
      expect(data.hapModulesInfo[0].preloads.length).assertEqual(0);
      expect(data.hapModulesInfo[0].dependencies.length).assertEqual(0);
      expect(data.hapModulesInfo[1].type).assertEqual(bundle.ModuleType.SHARED);
      expect(data.hapModulesInfo[1].preloads.length).assertEqual(0);
      expect(data.hapModulesInfo[1].dependencies.length).assertEqual(0);
      expect(data.hapModulesInfo[2].type).assertEqual(bundle.ModuleType.ENTRY);
      expect(data.hapModulesInfo[2].preloads.length).assertEqual(2);
      expect(data.hapModulesInfo[2].preloads[0].moduleName).assertEqual("feature");
      expect(data.hapModulesInfo[2].preloads[1].moduleName).assertEqual("shared");
      expect(data.hapModulesInfo[2].dependencies.length).assertEqual(1);
      expect(data.hapModulesInfo[2].dependencies[0].moduleName).assertEqual("feature");
      done();
    })
  })
}
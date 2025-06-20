/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import bundleManager from '@ohos.bundle.bundleManager';
import base from '@ohos.base'

const TAG = '[Orientation]';
const DOMAIN = 0x0000;
const BUNDLE = 'Acts_OrientationTest_';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.number     : Acts_OrientationTest_001
     * @tc.name       : Query the orientation of the provided HAP
     * @tc.desc       : Query if the orientation value is FOLLOW_RECENT.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('Acts_OrientationTest_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + '001 begin');
      await bundleManager.getBundleInfoForSelf(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION
      ).then(data => {
        hilog.info(DOMAIN, TAG, BUNDLE + 'getBundleInfoForSelf : ' + JSON.stringify(data));
        hilog.info(DOMAIN, TAG, BUNDLE + 'getBundleInfoForSelf appInfo.nativeLibraryPath : ' + JSON.stringify(data.appInfo.nativeLibraryPath));
        hilog.info(DOMAIN, TAG, BUNDLE + 'getBundleInfoForSelf hapModulesInfo[0].nativeLibraryPath : ' + JSON.stringify(data.hapModulesInfo[0].nativeLibraryPath));
        expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation)
          .assertEqual(bundleManager.DisplayOrientation.FOLLOW_RECENT);
        expect(data.appInfo.nativeLibraryPath).assertEqual("");
        expect(data.hapModulesInfo[0].nativeLibraryPath).assertEqual("");
        done();
      }).catch((err: base.BusinessError) => {
        hilog.info(DOMAIN, TAG, BUNDLE + 'getBundleInfoForSelf fail' + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
      hilog.info(DOMAIN, TAG, BUNDLE + '001 end');
    })
  })
}
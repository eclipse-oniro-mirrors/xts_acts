/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import launcherBundleManager from '@ohos.bundle.launcherBundleManager';
import bundleManager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect ,TestType ,Size ,Level } from "../../../hypium/index";
import { BundleInfo } from 'bundleManager.BundleInfo';

let abilityFlags = bundleManager.AbilityFlag.GET_ABILITY_INFO_DEFAULT;
let abilityFlags1 = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_PERMISSION;
let abilityFlags2 = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_APPLICATION;
let abilityFlags3 = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_METADATA;
let abilityFlags4 = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_DISABLE;
let abilityFlags5 = bundleManager.AbilityFlag.GET_ABILITY_INFO_ONLY_SYSTEM_APP;
let abilityFlags6 = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_APP_LINKING;
let abilityFlags7 = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_APP_LINKING;
let abilityFlags8 = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_SKILL;

let userId = 100;
let want: Want = {
  bundleName: "com.example.orientationtest.static",
  abilityName: "EntryAbility"
};

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {

    /**
     * @tc.name   Acts_OrientationTest_static_001
     * @tc.number Acts_OrientationTest_static_001
     * @tc.desc   Query if the orientation value is FOLLOW_RECENT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Acts_OrientationTest_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            hilog.info(domain, tag, 'Acts_OrientationTest_static_001  ====> start');
            if (err) {
              hilog.info(domain, tag, 'Acts_OrientationTest_static_001  ====> err' + JSON.stringify(err));
              expect().assertFail();
              done();
            } else if (data !== undefined) {
              expect(data!.hapModulesInfo[0].abilitiesInfo[1].orientation).assertEqual(bundleManager.DisplayOrientation.UNSPECIFIED);
              expect(data!.hapModulesInfo[0].abilitiesInfo[2].orientation).assertEqual(bundleManager.DisplayOrientation.AUTO_ROTATION_LANDSCAPE_RESTRICTED);
              expect(data!.hapModulesInfo[0].abilitiesInfo[3].orientation).assertEqual(bundleManager.DisplayOrientation.AUTO_ROTATION_PORTRAIT_RESTRICTED);
              expect(data!.hapModulesInfo[0].abilitiesInfo[4].orientation).assertEqual(bundleManager.DisplayOrientation.LOCKED);
              expect(data!.hapModulesInfo[0].abilitiesInfo[5].orientation).assertEqual(bundleManager.DisplayOrientation.AUTO_ROTATION_UNSPECIFIED);
              expect(data!.hapModulesInfo[0].abilitiesInfo[6].orientation).assertEqual(bundleManager.DisplayOrientation.FOLLOW_DESKTOP);
              expect(data!.hapModulesInfo[0].abilitiesInfo[7].orientation).assertEqual(bundleManager.DisplayOrientation.LANDSCAPE);
              expect(data!.hapModulesInfo[0].abilitiesInfo[8].orientation).assertEqual(bundleManager.DisplayOrientation.FOLLOW_RECENT);
              expect(data!.hapModulesInfo[0].abilitiesInfo[9].orientation).assertEqual(bundleManager.DisplayOrientation.LANDSCAPE_INVERTED);
              expect(data!.hapModulesInfo[0].abilitiesInfo[10].orientation).assertEqual(bundleManager.DisplayOrientation.PORTRAIT_INVERTED);
              expect(data!.hapModulesInfo[0].abilitiesInfo[11].orientation).assertEqual(bundleManager.DisplayOrientation.AUTO_ROTATION);
              expect(data!.hapModulesInfo[0].abilitiesInfo[12].orientation).assertEqual(bundleManager.DisplayOrientation.AUTO_ROTATION_LANDSCAPE);
              expect(data!.hapModulesInfo[0].abilitiesInfo[13].orientation).assertEqual(bundleManager.DisplayOrientation.AUTO_ROTATION_PORTRAIT);
              expect(data!.hapModulesInfo[0].abilitiesInfo[14].orientation).assertEqual(bundleManager.DisplayOrientation.AUTO_ROTATION_RESTRICTED);
            } else {
              hilog.info(domain, tag, 'Acts_OrientationTest_static_001  ====> Fail');
              expect().assertFail();
              done();
            }
            hilog.info(domain, tag, 'Acts_OrientationTest_static_001  ====> end');
            done();
          })
      })

    /**
     * @tc.name   TestAbilityDisable_static_014
     * @tc.number TestAbilityDisable_static_014
     * @tc.desc   test enumeration bundleManager.AbilityFlag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestAbilityDisable_static_014', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        bundleManager.queryAbilityInfo(want, abilityFlags | abilityFlags1 | abilityFlags2 | abilityFlags3 |abilityFlags4
          | abilityFlags5 |abilityFlags6 |abilityFlags7 | abilityFlags8, userId, (err: BusinessError<void> | null, data) => {
          if (err) {
            hilog.error(domain, tag, 'TestAbilityDisable_static_014 failed: %{public}s', err?.message);
            expect(err.code).assertEqual(202);
            done();
          } else {
            hilog.info(domain, tag, 'TestAbilityDisable_static_014 successfully: %{public}s', JSON.stringify(data));
            expect(data).not().assertUndefined();
            expect(data != null).assertTrue();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, 'TestAbilityDisable_static_014 failed: %{public}s' + err.message);
        expect().assertFail();
        done();
      }
    });

  })
}
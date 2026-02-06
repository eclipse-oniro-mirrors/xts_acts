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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';

const TAG = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityTest';
let applicationContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();

export default function NdkApplicationContextGetVersionCode() {
  describe('NdkApplicationContextGetVersionCode', () => {
    beforeAll(() => {
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0100
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0100
     * @tc.desc   To verify use ApplicationContextGetVersionCode get right VersionCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0100', Level.LEVEL3, async (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkApplicationContextGetVersionCode_0100();
      let versionCodeJs = -1;
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
      await bundleManager.getBundleInfoForSelf(bundleFlags).then((data)=>{
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute getBundleInfoForSelf:` + data.versionCode);
        versionCodeJs = data.versionCode;
      }).catch((err:BusinessError)=>{
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute getBundleInfoForSelf fail:` + err.message);
      })
      expect(result).assertEqual(versionCodeJs);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0200
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0200
     * @tc.desc   To verify use ApplicationContextGetVersionCode with nullptr will return 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ApplicationContextGetVersionCode_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkApplicationContextGetVersionCode_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    });
  })
}
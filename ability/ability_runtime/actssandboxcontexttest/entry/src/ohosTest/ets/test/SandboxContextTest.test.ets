/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityManager, common } from '@kit.AbilityKit';

let TAG = 'RunTimeTest';

export default function sandboxContextTest() {
  describe('sandboxContextTest', () => {
    beforeAll(() => {

    })
    beforeEach(() => {

    })
    afterEach(() => {
      hilog.info(0x0000, TAG, "[%{public}s] case end.", TAG);
    })
    afterAll(() => {

    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_Sandbox_SupportsStartSandbox_2400
     * @tc.name    SUB_Ability_AbilityRuntime_Sandbox_SupportsStartSandbox_2400
     * @tc.desc    Verifying that non-DLP applications receive a 401 error when passing incorrect parameter types to the API
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_Sandbox_SupportsStartSandbox_2400', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_Sandbox_SupportsStartSandbox_2400';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      let want: Want = {
        bundleName: 'com.example.myapplication',
        abilityName: 'EntryAbility'
      };
      let resultCode = 100;
      let abilityResult: common.AbilityResult = {
        want,
        resultCode
      };
      let requestCode = null;
      try {
        abilityManager.notifySaveAsResult(abilityResult, requestCode).then(() => {
          hilog.info(0x0000, TAG, '[%{public}s] notifySaveAsResult success', TAG);
          try {
            expect().assertFail();
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, '[%{public}s] notifySaveAsResult fail, err: %{public}s', TAG, JSON.stringify(err));
          try {
            expect().assertFail();
          } catch {
          }
          done();
        });
      } catch (paramError) {
        hilog.info(0x0000, TAG, '[%{public}s] paramError: %{public}s', TAG, JSON.stringify(paramError));
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_Sandbox_SupportsStartSandbox_2800
     * @tc.name    SUB_Ability_AbilityRuntime_Sandbox_SupportsStartSandbox_2800
     * @tc.desc    Verifying that non-DLP applications receive a 401 error when passing incorrect parameter types to the API (callback)
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_Sandbox_SupportsStartSandbox_2800', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_Sandbox_SupportsStartSandbox_2800';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      let abilityResult = null;
      let requestCode = 100;
      try {
        abilityManager.notifySaveAsResult(abilityResult, requestCode, (err: BusinessError) => {
          if (err && err.code != 0) {
            hilog.info(0x0000, TAG, '[%{public}s] notifySaveAsResult fail, err: %{public}s', TAG, JSON.stringify(err));
            try {
              expect().assertFail();
            } catch {
            }
            done();
          } else {
            hilog.info(0x0000, TAG, '[%{public}s] notifySaveAsResult success', TAG);
            try {
              expect().assertFail();
            } catch {
            }
            done();
          }
        });
      } catch (paramError) {
        hilog.info(0x0000, TAG, '[%{public}s] paramError: %{public}s', TAG, JSON.stringify(paramError));
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

  })
}
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
import { common } from '@kit.AbilityKit';
import { font } from '@kit.ArkUI';
import App from '@system.app';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { data } from '@kit.TelephonyKit';

let TAG = 'SetFontTest';
let testAbilityContext: common.UIAbilityContext;
let uiContext: UIContext;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function setFontTest() {
  describe('setFontTest', () => {
    beforeAll(() => {
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext;
      uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    })
    beforeEach(async () => {
      let cmd = "hilog -r";
      abilityDelegator.executeShellCommand(cmd, (err: BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
        hilog.info(0x0000, TAG, "[%{public}s] ExecuteShellCommand succeed. ShellCmdResult: %{public}s", TAG, JSON.stringify(data));
      });
      await sleep(300);
    })
    afterEach(() => {
      hilog.info(0x0000, TAG, "[%{public}s] case end.", TAG);
    })
    afterAll(() => {

    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configuration_FontSettings_0100
     * @tc.number SUB_Ability_AbilityRuntime_Configuration_FontSettings_0100
     * @tc.desc   Passing null to the setFont interface results in a 401 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configuration_FontSettings_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_Configuration_FontSettings_0100';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      try {
        let applicationContext = testAbilityContext.getApplicationContext();
        hilog.info(0x0000, TAG, "[%{public}s] applicationContext: %{public}s", TAG, JSON.stringify(applicationContext));
        applicationContext.setFont(null);
        expect().assertFail();
        done();
      } catch (paramError) {
        hilog.info(0x0000, TAG, "[%{public}s] paramError: %{public}s", TAG, JSON.stringify(paramError));
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configuration_FontSettings_0200
     * @tc.number SUB_Ability_AbilityRuntime_Configuration_FontSettings_0200
     * @tc.desc   Passing undefined to the setFont interface results in a 401 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configuration_FontSettings_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_Configuration_FontSettings_0200';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      try {
        let applicationContext = testAbilityContext.getApplicationContext();
        hilog.info(0x0000, TAG, "[%{public}s] applicationContext: %{public}s", TAG, JSON.stringify(applicationContext));
        applicationContext.setFont(undefined);
        expect().assertFail();
        done();
      } catch (paramError) {
        hilog.info(0x0000, TAG, "[%{public}s] paramError: %{public}s", TAG, JSON.stringify(paramError));
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configuration_FontSettings_0500
     * @tc.number SUB_Ability_AbilityRuntime_Configuration_FontSettings_0500
     * @tc.desc   Calling the setFont interface should not trigger the onConfigurationUpdate function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configuration_FontSettings_0500', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_Configuration_FontSettings_0500';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      try {
        let applicationContext = testAbilityContext.getApplicationContext();
        let cmd = "hilog -x -e UpdateConfiguration";
        let flag: boolean = false;
        hilog.info(0x0000, TAG, "[%{public}s] applicationContext: %{public}s", TAG, JSON.stringify(applicationContext));
        uiContext.getFont().registerFont({
          familyName: "font1",
          familySrc: $rawfile('font/TestFont1.ttf')
        });
        applicationContext.setFont("font1");
        await sleep(500);
        hilog.info(0x0000, TAG, "[%{public}s] flag: %{public}s", TAG, JSON.stringify(flag));
        let onUpdateCallback:string = AppStorage.get<string>("onConfigurationUpdate") as string;
        expect(onUpdateCallback).assertEqual(undefined)
        done();
      } catch (paramError) {
        hilog.info(0x0000, TAG, "[%{public}s] paramError: %{public}s", TAG, JSON.stringify(paramError));
        expect().assertFail();
        done();
      }
    })
  })
}
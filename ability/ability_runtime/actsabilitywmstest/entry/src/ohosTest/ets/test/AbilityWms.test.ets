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
import { appManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@ohos.UiTest';

let context = getContext(this) as common.UIAbilityContext;

export default function abilityWMSTest() {
  describe('abilityWMSTest', () => {

    beforeAll(async() => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      context = globalThis.context;
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_AbilityWMS_0800
     * @tc.number SUB_Ability_AbilityRuntime_AMS_AbilityWMS_0800
     * @tc.desc   Stage model applications query their own application processes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_AMS_AbilityWMS_0800', Level.LEVEL3, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_AMS_AbilityWMS_0800`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it begin`);
      appManager.getRunningProcessInformation().then((data) => {
        hilog.info(0x0000, 'testTag', `The running process information is: ${JSON.stringify(data)}`);
        expect(data[0].processName).assertEqual("com.acts.actsabilitywmstest")
        expect(data[0].state).assertEqual(2)
        done();
      }).catch((error: BusinessError) => {
        hilog.info(0x0000, 'testTag', `error: ${JSON.stringify(error)}`);
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_AbilityWMS_0900
     * @tc.number SUB_Ability_AbilityRuntime_AMS_AbilityWMS_0900
     * @tc.desc   Stage model applications terminate their own application processes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_AMS_AbilityWMS_0900', Level.LEVEL3, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_AMS_AbilityWMS_0900`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it begin`);
      let result:boolean = false;
      try{
        let applicationContext = context.getApplicationContext();
        applicationContext.killAllProcesses();
        hilog.info(0x0000, 'testTag', '%{public}s', 'applicationContext.killAllProcesses success!');
        done();
      } catch (err){
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, 'testTag', '%{public}s', `applicationContext.killAllProcesses failed, error.code: ${code}, error.message: ${message}`);
        expect().assertFail()
        done();
      }
    });
  })
}
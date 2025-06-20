/*
 * Copyright (C) 2024 HiHope Open Source Organization.
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
import{ appManager, common, Want } from '@kit.AbilityKit';
import{ BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import{ data } from '@kit.TelephonyKit';
import { systemParameterEnhance } from '@kit.BasicServicesKit';
import { Driver, ON, Component, MatchPattern } from '@kit.TestKit';

const TAG: string = 'ProcessModel';
const DOMAIN_NUMBER: number = 0xFF00;

function sleep(time: number){
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('SUB_Ability_AbilityRuntime_deeplink', () => {
    let context: common.UIAbilityContext;
    beforeAll(() => {
      context = AppStorage.get<Context>('abilityContext') as common.UIAbilityContext;
    })
    beforeAll(() => {
    })
    beforeEach(() => {

        try {
        let info: string = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
        console.log('=====++++====',JSON.stringify(info));
      } catch(e) {
        console.log('getSync unexpected error1112: ' + e);
      }
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_deeplink_1100
     * @tc.name SUB_Ability_AbilityRuntime_deeplink_1100
     * @tc.desc The three-party app calls UIAbilityContext.startAbility to implicitly start the three-party app, only configuring the action, and the action contains special characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_deeplink_1100', Level.LEVEL0, async (done:Function) => {
      const  TAG = 'SUB_Ability_AbilityRuntime_deeplink_1100';
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_deeplink_1100';
      console.info('enter into test');
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  =========`);
      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['action1', 'EventAppSelectNotExist'],
      };
      let UnSubscribeInfoCallback = (err: BusinessError) => {
        console.info(TAG + " UnSubscribeInfoCallback called");
      }
      commonEventManager.createSubscriber(subscribeInfo, async (err: BusinessError, subscribedata: commonEventManager.CommonEventSubscriber) => {
        if (err) {
          hilog.error(DOMAIN_NUMBER, TAG, `Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
          return;
        }
        hilog.info(DOMAIN_NUMBER, TAG, 'Succeeded in creating subscriber.');
        subscriber = subscribedata;
        console .log('-+-+-+-',`${JSON.stringify(subscriber)}`);

          commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
            console .log('subscribe__'+JSON.stringify(data));

            if (err) {
              hilog.error(DOMAIN_NUMBER, TAG, `Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
              return;
            }
            if (data.event == 'EventAppSelectNotExist') {
              commonEventManager.unsubscribe(subscriber, UnSubscribeInfoCallback);
              done();
              return;
            }
            hilog.info(0x0000, 'this +++++++803', '%{public}s', data.data);
            expect(JSON.stringify('-~!@#$ %^&*')).assertEqual(JSON.stringify(data.data));
            done();
          })
        let want: Want = {
          deviceId: '',
          bundleName: 'com.example.appa',
          abilityName: 'SpecifedProcessAbility',
        };
        await sleep(500);
        context.startAbilityForResult(want).then((data)=>{
          hilog.info(DOMAIN_NUMBER, TAG, `success startAbilityForResult`);
        }).catch(()=>{
          hilog.error(DOMAIN_NUMBER, TAG, `Failed startAbilityForResult`);
        });
        const  driver =Driver.create();
        await driver.delayMs(1000);
        let Button: Component = await driver.findComponent(ON.id('TestCase4'));
        await Button.click();
        await driver.delayMs(1000);
        let Button2: Component = await driver.findComponent(ON.text('amsdialog', MatchPattern.CONTAINS));
        if(Button2){
          let Button3: Component = await driver.findComponent(ON.text('允许'));
          await Button3.click();
          await driver.delayMs(1000);
        }
        const  driver1 =Driver.create();
        await driver1.delayMs(1000);
        let Button1: Component = await driver1.findComponent(ON.text('label'));
        await Button1.click();
      })
    })
  })

}


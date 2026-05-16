/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import commonEventManager from '@ohos.commonEventManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import { BusinessError } from '@ohos.base';
import { Driver, ON, Component} from '@kit.TestKit';
let deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
let driver = Driver.create();
function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}
export default function UIContextWindowStageTest() {
  let TAG: string = '';
  let subscriber:commonEventManager.CommonEventSubscriber | undefined = undefined;
  let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

  describe('UIContextWindowStageTest', () => {
    beforeAll(async () => {
      let allowed: Component | undefined;
      try {
        allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      if (allowed) {
        await allowed.click();
      }
    })
    
    afterEach(async (done: Function) => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      if (subscriber) {
        await commonEventManager.unsubscribe(subscriber);
        subscriber = undefined;
      }
      done();
    })

    /**
     * @tc.name   ACTS_GetWindowStage_0100
     * @tc.number ACTS_GetWindowStage_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetWindowStage_0100', Level.LEVEL0, (done: Function) => {
      TAG = 'ACTS_GetWindowStage_0100';
      console.log(TAG + ' start.');
      let events = ['ACTS_GetWindowStage']
      commonEventManager.createSubscriber({
        events: events
      }).then((data) => {
        console.info(TAG + ' createSubscriber successful. ');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
      })
      let subscribeCallBack = (err: BusinessError, data:commonEventManager.CommonEventData) => {
        console.info(TAG + ' subscribeCallBack , data = ' + JSON.stringify(data));
        let parameters = data['parameters'];
        if (parameters) {
          console.info(TAG + ' subscribeCallBack , parameters = ' + JSON.stringify(parameters));
          expect(parameters['onCreateResult']).assertFalse();
          expect(parameters['onWindowStageCreateResult']).assertTrue();
          expect(parameters['onForegroundResult']).assertTrue();
          expect(parameters['onWindowStageDestroyResult']).assertFalse();
          expect(parameters['onDestroyResult']).assertFalse();
        } else {
          expect().assertFail();
        }
        done();
      }
      delegator.startAbility({
        bundleName: 'com.example.apicoverhaptest',
        abilityName: 'WindowStageOneAbility'
      })
    })

    /**
     * @tc.name   ACTS_GetWindowStage_0200
     * @tc.number ACTS_GetWindowStage_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetWindowStage_0200', Level.LEVEL0, (done: Function) => {
      TAG = 'ACTS_GetWindowStage_0200';
      console.log(TAG + ' start.');
      let events = ['ACTS_GetWindowStage']
      let twoStart: boolean = false;
      commonEventManager.createSubscriber({
        events: events
      }).then((data) => {
        console.info(TAG + ' createSubscriber successful. ');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
      })
      let subscribeCallBack = (err: BusinessError, data:commonEventManager.CommonEventData) => {
        console.info(TAG + ' subscribeCallBack , data = ' + JSON.stringify(data));
        let parameters = data['parameters'];
        if (parameters) {
          console.info(TAG + ' subscribeCallBack , parameters = ' + JSON.stringify(parameters));
          expect(parameters['onCreateResult']).assertFalse();
          expect(parameters['onWindowStageCreateResult']).assertTrue();
          expect(parameters['onForegroundResult']).assertTrue();
          expect(parameters['onWindowStageDestroyResult']).assertFalse();
          expect(parameters['onDestroyResult']).assertFalse();
          if (!twoStart) {
            console.info(TAG + ' start WindowStageOneAbility two ');
            delegator.startAbility({
              bundleName: 'com.example.apicoverhaptest',
              abilityName: 'WindowStageOneAbility'
            })
            twoStart = true;
          } else {
            console.info(TAG + ' ACTS_GetWindowStage_0200 end.');
            done();
          }
        } else {
          expect().assertFail();
          done();
        }
      }
      delegator.startAbility({
        bundleName: 'com.example.apicoverhaptest',
        abilityName: 'WindowStageOneAbility'
      })
    })

    /**
     * @tc.name   ACTS_GetWindowStage_onForeground_0100
     * @tc.number ACTS_GetWindowStage_onForeground_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetWindowStage_onForeground_0100', Level.LEVEL0, (done: Function) => {
      TAG = 'ACTS_GetWindowStage_onForeground_0100';
      console.log(TAG + ' start.');
      let events = ['ACTS_GetWindowStage', 'ACTS_GetWindowStage_onForeground', 'ACTS_GetWindowStage_onBackground']
      commonEventManager.createSubscriber({
        events: events
      }).then((data) => {
        console.info(TAG + ' createSubscriber successful. ');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
      })
      let onForegroundCount = 0;
      let ability: UIAbility | undefined = undefined;
      let subscribeCallBack = async (err: BusinessError, data:commonEventManager.CommonEventData) => {
        console.info(TAG + ' subscribeCallBack , data = ' + JSON.stringify(data));
        if (data.event === 'ACTS_GetWindowStage') {
          let parameters = data['parameters']
          if (parameters) {
            console.info(TAG + ' subscribeCallBack , parameters = ' + JSON.stringify(parameters));
            expect(parameters['onForegroundResult1']).assertTrue();
            expect(parameters['onForegroundResult2']).assertTrue();
            expect(parameters['onBackgroundResult']).assertTrue();
            await sleep(1000);
            done();
          } else {
            expect().assertFail();
            done();
          }
        } else if (data.event === 'ACTS_GetWindowStage_onForeground') {
          if (deviceSupport === 'false') {
            done();
            return;
          }
          if (onForegroundCount == 0) {
            onForegroundCount++;
            delegator.getCurrentTopAbility().then((data) => {
              ability = data;
              delegator.doAbilityBackground(ability);
            }).catch((error: BusinessError) => {
              console.info(TAG + ' getCurrentTopAbility , fail = ' + JSON.stringify(error));
              expect().assertFail();
              done();
            })
          } else {
            ability?.context?.terminateSelf();
          }
        } else if (data.event === 'ACTS_GetWindowStage_onBackground') {
          delegator.doAbilityForeground(ability);
        }
      }
      delegator.startAbility({
        bundleName: 'com.example.apicoverhaptest',
        abilityName: 'WindowStageTwoAbility'
      })
    })

    /**
     * @tc.name   ACTS_GetWindowStage_onNewWant_0100
     * @tc.number ACTS_GetWindowStage_onNewWant_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetWindowStage_onNewWant_0100', Level.LEVEL0, (done: Function) => {
      TAG = 'ACTS_GetWindowStage_onNewWant_0100';
      if (deviceSupport === 'false') {
        done();
        return;
      }
      console.log(TAG + ' start.');
      let events = ['ACTS_GetWindowStage', 'ACTS_GetWindowStage_onForeground', 'ACTS_GetWindowStage_onBackground']
      commonEventManager.createSubscriber({
        events: events
      }).then((data) => {
        console.info(TAG + ' createSubscriber successful. ');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
      })
      let onForegroundCount = 0;
      let ability: UIAbility | undefined = undefined;
      let subscribeCallBack = (err: BusinessError, data:commonEventManager.CommonEventData) => {
        console.info(TAG + ' subscribeCallBack , data = ' + JSON.stringify(data));
        if (data.event === 'ACTS_GetWindowStage') {
          let parameters = data['parameters']
          if (parameters) {
            console.info(TAG + ' subscribeCallBack , parameters = ' + JSON.stringify(parameters));
            expect(parameters['onNewWantResult']).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        } else if (data.event === 'ACTS_GetWindowStage_onForeground') {
          if (onForegroundCount == 0) {
            onForegroundCount++;
            delegator.getCurrentTopAbility().then((data) => {
              console.info(TAG + ' getCurrentTopAbility , success = ' + JSON.stringify(data));
              ability = data;
              delegator.doAbilityBackground(ability);
            }).catch((error: BusinessError) => {
              console.info(TAG + ' getCurrentTopAbility , fail = ' + JSON.stringify(error));
              expect().assertFail();
              done();
            })
          } else {
            ability?.context?.terminateSelf();
          }
        } else if (data.event === 'ACTS_GetWindowStage_onBackground') {
          delegator.startAbility({
            bundleName: 'com.example.apicoverhaptest',
            abilityName: 'WindowStageTwoAbility'
          })
        }
      }
      delegator.startAbility({
        bundleName: 'com.example.apicoverhaptest',
        abilityName: 'WindowStageTwoAbility'
      })
    })

    /**
     * @tc.name   ACTS_GetWindowStage_onWindowStageRestore_0100
     * @tc.number ACTS_GetWindowStage_onWindowStageRestore_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetWindowStage_onWindowStageRestore_0100', Level.LEVEL0, (done: Function) => {
      TAG = 'ACTS_GetWindowStage_onWindowStageRestore_0100';
      console.log(TAG + ' start.');
      let events = ['ACTS_GetWindowStage'];
      commonEventManager.createSubscriber({
        events: events
      }).then((data) => {
        console.info(TAG + ' createSubscriber successful. ');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
      })
      let subscribeCallBack = (err: BusinessError, data:commonEventManager.CommonEventData) => {
        console.info(TAG + ' subscribeCallBack , data = ' + JSON.stringify(data));
        let parameters = data['parameters']
        if (parameters) {
          console.info(TAG + ' subscribeCallBack , parameters = ' + JSON.stringify(parameters));
          expect(parameters['onWindowStageRestoreResult']).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      delegator.executeShellCommand('aa start -ca WindowStageThreeAbility -b com.example.apicoverhaptest', (err, data)=>{
        console.info(TAG + ' executeShellCommand , err = ' + JSON.stringify(err));
        console.info(TAG + ' executeShellCommand , data = ' + JSON.stringify(data));
      })
    })

  })
}
/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Component, Driver, UiWindow, ON, UiDriver } from '@ohos.UiTest';
import commonEventManager from '@ohos.commonEventManager';

let ACTS_VisbilityState = {
  events: ['visibilityState']
};

export default function abilityTest() {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let TAG = 'ActsWindowVisibilityTestTAG';
  let uiAbilityWantOne = {
    'bundleName': 'com.acts.windowvisibilitytest',
    'abilityName': 'EntryAbility'
  };
  let uiAbilityWantTwo = {
    'bundleName': 'com.acts.windowvisibilitytest',
    'abilityName': 'EntryAbility1'
  };
  let singleServiceAbilityWantOne = {
    'bundleName': 'com.acts.windowvisibilitytest',
    'abilityName': 'SingleServiceExtAbility'
  };
  let singleServiceAbilityWantTwo = {
    'bundleName': 'com.acts.windowvisibilitytest',
    'abilityName': 'SingleServiceExtAbility1'
  };
  let singleServiceAbilityWantThree = {
    'bundleName': 'com.acts.windowvisibilitytest',
    'abilityName': 'singleserviceextability2'
  };
  let multipleServiceAbilityWant = {
    'bundleName': 'com.acts.windowvisibilitytest',
    'abilityName': 'MultipleServiceExtAbility'
  };
  describe('ActsWindowVisibilityTest', function () {
    afterEach(async function (done) {
      await abilityDelegator.executeShellCommand('aa force-stop com.acts.windowvisibilitytest');
      await done();
    })

    /**
    * @tc.number: SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0100
    * @tc.name: Test two uiabilities foregrounding and two single window service abilities
    * @tc.desc: Verify state
    */
    it('SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0100', 0, async function (done) {
      let TAG1 = 'Acts_WindowVisibility_0100_TAG';
      let subscriber;
      let driver = Driver.create();

      function unSubscribeCallback() {
        console.info(TAG1, 'unSubscribeCallback');
        done();
      }

      function subscribeCallback(error, data) {
        console.info(TAG1, 'subscribe data' + JSON.stringify(data));
        console.info(TAG1, 'subscribe error' + JSON.stringify(error));
        if (data.event == 'visibilityState') {
          try {
            expect(data.parameters.applicationState == 2 || data.parameters.applicationState == 1).assertTrue();
          } catch {
            console.error(TAG1, 'state error');
          }
          commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      await commonEventManager.createSubscriber(ACTS_VisbilityState).then(async (data) => {
        console.info(TAG1, 'createSubscriber');
        subscriber = data;
        await commonEventManager.subscribe(subscriber, subscribeCallback);
        await driver.delayMs(200);
        await globalThis.abilityContext.startAbility(uiAbilityWantOne).then(() => {
          console.info(TAG1, 'Start uiAbility one : ');
        });
        await driver.delayMs(500);
        await globalThis.abilityContext.startAbility(uiAbilityWantTwo).then(() => {
          console.info(TAG1, 'Start uiAbility two : ');
        });
        await driver.delayMs(500);
        await globalThis.abilityContext.startServiceExtensionAbility(singleServiceAbilityWantOne).then(() => {
          console.info(TAG1, 'Start single service ability one : ');
        });
        await driver.delayMs(500);
        await driver.click(10, 10);
        await globalThis.abilityContext.startServiceExtensionAbility(singleServiceAbilityWantTwo).then(() => {
          console.info(TAG1, 'Start single service ability two : ');
        });
      });
    })

    /**
    * @tc.number: SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0200
    * @tc.name: Test two uiabilities backgrounding and two single window service abilities
    * @tc.desc: Verify state
    */
    it('SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0200', 0, async function (done) {
      let TAG1 = 'Acts_WindowVisibility_0200_TAG';
      let driver = Driver.create();
      let subscriber;

      function unSubscribeCallback() {
        console.info(TAG1, 'unSubscribeCallback');
        done();
      }

      function subscribeCallback(error, data) {
        console.info(TAG1, 'subscribe data' + JSON.stringify(data));
        console.info(TAG1, 'subscribe error' + JSON.stringify(error));
        if (data.event == 'visibilityState') {
          try {
            expect(data.parameters.applicationState == 2 || data.parameters.applicationState == 1).assertTrue();
          } catch {
            console.error(TAG1, 'state error');
          }
          commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      await commonEventManager.createSubscriber(ACTS_VisbilityState).then(async (data) => {
        console.info(TAG1, 'createSubscriber');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallback);
        await driver.delayMs(200);
        await globalThis.abilityContext.startAbility(uiAbilityWantOne).then(() => {
          console.info(TAG1, 'Start uiAbility one : ');
        });
        await driver.delayMs(500);
        await globalThis.abilityContext.startAbility(uiAbilityWantTwo).then(() => {
          console.info(TAG1, 'Start uiAbility two : ');
        });
        await driver.delayMs(500);
        await driver.pressHome();
        await driver.delayMs(200);
        await globalThis.abilityContext.startServiceExtensionAbility(singleServiceAbilityWantOne).then(() => {
          console.info(TAG1, 'Start single service ability one : ');
        });
        await driver.delayMs(500);
        await driver.click(10, 10);
        await globalThis.abilityContext.startServiceExtensionAbility(singleServiceAbilityWantTwo).then(() => {
          console.info(TAG1, 'Start single service ability two : ');
        });
      });

    })

    /**
    * @tc.number: SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0300
    * @tc.name: Test two uiabilities backgrounding and two single window service abilities
    * @tc.desc: Verify state
    */
    it('SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0300', 0, async function (done) {
      let TAG1 = 'Acts_WindowVisibility_0300_TAG';
      let driver = Driver.create();
      let subscriber;

      function unSubscribeCallback() {
        console.info(TAG1, 'unSubscribeCallback');
        done();
      }

      function subscribeCallback(error, data) {
        console.info(TAG1, 'subscribe data' + JSON.stringify(data));
        console.info(TAG1, 'subscribe error' + JSON.stringify(error));
        if (data.event == 'visibilityState') {
          try {
            expect(data.parameters.applicationState == 2 || data.parameters.applicationState == 1).assertTrue();
          } catch {
            console.error(TAG1, 'state error');
          }
          commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      await commonEventManager.createSubscriber(ACTS_VisbilityState).then(async (data) => {
        console.info(TAG1, 'createSubscriber');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallback);
        await driver.delayMs(200);
        await globalThis.abilityContext.startAbility(uiAbilityWantOne).then(() => {
          console.info(TAG1, 'Start uiAbility one : ');
        });
        await driver.delayMs(500);
        await globalThis.abilityContext.startAbility(uiAbilityWantTwo).then(() => {
          console.info(TAG1, 'Start uiAbility two : ');
        });
        await driver.delayMs(500);
        await driver.pressHome();
        await driver.delayMs(200);
        await globalThis.abilityContext.startServiceExtensionAbility(singleServiceAbilityWantThree).then(() => {
          console.info(TAG1, 'Start single service ability three : ');
        });
        await driver.delayMs(500);
        await driver.click(10, 10);
        await globalThis.abilityContext.startServiceExtensionAbility(singleServiceAbilityWantTwo).then(() => {
          console.info(TAG1, 'Start single service ability two : ');
        });
      });
    })

    /**
    * @tc.number: SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0400
    * @tc.name: Test two uiabilities foregrounding and multiple window service abilities
    * @tc.desc: Verify state
    */
    it('SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0400', 0, async function (done) {
      let TAG1 = 'Acts_WindowVisibility_0400_TAG';
      let driver = Driver.create();
      let subscriber;

      function unSubscribeCallback() {
        console.info(TAG1, 'unSubscribeCallback');
        done();
      }

      function subscribeCallback(error, data) {
        console.info(TAG1, 'subscribe data' + JSON.stringify(data));
        console.info(TAG1, 'subscribe error' + JSON.stringify(error));
        if (data.event == 'visibilityState') {
          try {
            expect(data.parameters.applicationState == 2 || data.parameters.applicationState == 1).assertTrue();
          } catch {
            console.error(TAG1, 'state error');
          }
          commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      await commonEventManager.createSubscriber(ACTS_VisbilityState).then(async (data) => {
        console.info(TAG1, 'createSubscriber');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallback);
        await driver.delayMs(200);
        await globalThis.abilityContext.startAbility(uiAbilityWantOne).then(() => {
          console.info(TAG1, 'Start uiAbility one : ');
        });
        await driver.delayMs(500);
        await globalThis.abilityContext.startAbility(uiAbilityWantTwo).then(() => {
          console.info(TAG1, 'Start uiAbility two : ');
        });
        await driver.delayMs(500);
        await driver.click(10, 10);
        await globalThis.abilityContext.startServiceExtensionAbility(multipleServiceAbilityWant).then(() => {
          console.info(TAG1, 'Start multiple service ability one : ');
        });
      });
    })

    /**
    * @tc.number: SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0500
    * @tc.name: Test two uiabilities backgrounding and multiple window service abilities
    * @tc.desc: Verify state
    */
    it('SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0500', 0, async function (done) {
      let TAG1 = 'Acts_WindowVisibility_0500_TAG';
      let driver = Driver.create();
      let subscriber;

      function unSubscribeCallback() {
        console.info(TAG1, 'unSubscribeCallback');
        done();
      }

      function subscribeCallback(error, data) {
        console.info(TAG1, 'subscribe data' + JSON.stringify(data));
        console.info(TAG1, 'subscribe error' + JSON.stringify(error));
        if (data.event == 'visibilityState') {
          try {
            expect(data.parameters.applicationState == 2 || data.parameters.applicationState == 1).assertTrue();
          } catch {
            console.error(TAG1, 'state error');
          }
          commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      await commonEventManager.createSubscriber(ACTS_VisbilityState).then(async (data) => {
        console.info(TAG1, 'createSubscriber');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallback);
        await driver.delayMs(200);
        await globalThis.abilityContext.startAbility(uiAbilityWantOne).then(() => {
          console.info(TAG1, 'Start uiAbility one : ');
        });
        await driver.delayMs(500);
        await globalThis.abilityContext.startAbility(uiAbilityWantTwo).then(() => {
          console.info(TAG1, 'Start uiAbility two : ');
        });
        await driver.delayMs(500);
        await driver.pressHome();
        await driver.delayMs(200);
        await driver.click(10, 10);
        await globalThis.abilityContext.startServiceExtensionAbility(multipleServiceAbilityWant).then(() => {
          console.info(TAG1, 'Start multiple service ability one : ');
        });
      });
    })

    /**
    * @tc.number: SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0600
    * @tc.name: Test two single service abilities and multiple window service abilities
    * @tc.desc: Verify state
    */
    it('SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0600', 0, async function (done) {
      let TAG1 = 'Acts_WindowVisibility_0600_TAG';
      let subscriber;
      let driver = Driver.create();

      function unSubscribeCallback() {
        console.info(TAG1, 'unSubscribeCallback');
        done();
      }

      function subscribeCallback(error, data) {
        console.info(TAG1, 'subscribe data' + JSON.stringify(data));
        console.info(TAG1, 'subscribe error' + JSON.stringify(error));
        if (data.event == 'visibilityState') {
          try {
            expect(data.parameters.applicationState == 2 || data.parameters.applicationState == 1).assertTrue();
          } catch {
            console.error(TAG1, 'state error');
          }
          commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      await commonEventManager.createSubscriber(ACTS_VisbilityState).then(async (data) => {
        console.info(TAG1, 'createSubscriber');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallback);
        await driver.delayMs(200);
        await globalThis.abilityContext.startServiceExtensionAbility(singleServiceAbilityWantOne).then(() => {
          console.info(TAG1, 'Start uiAbility one : ');
        });
        await driver.delayMs(500);
        await globalThis.abilityContext.startServiceExtensionAbility(singleServiceAbilityWantThree).then(() => {
          console.info(TAG1, 'Start single service ability three : ');
        });
        await driver.delayMs(500);
        await driver.click(10, 10);
        await globalThis.abilityContext.startServiceExtensionAbility(multipleServiceAbilityWant).then(() => {
          console.info(TAG1, 'Start single service ability one : ');
        });
      })
    })

    /**
    * @tc.number: SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0800
    * @tc.name: Test ui ability and multiple window service abilities
    * @tc.desc: Verify state
    */
    it('SUB_Ability_AbilityRuntime_ABILITY_StateInfo_WindowVisibilityState_0800', 0, async function (done) {
      let TAG1 = 'Acts_WindowVisibility_0800_TAG';
      let subscriber;
      let driver = Driver.create();
      let want = {
        'bundleName': 'com.example.windowvisibilityrely',
        'abilityName': 'EntryAbility'
      };
      function unSubscribeCallback() {
        console.info(TAG1, 'unSubscribeCallback');
        done();
      }

      function subscribeCallback(error, data) {
        console.info(TAG1, 'subscribe data' + JSON.stringify(data));
        console.info(TAG1, 'subscribe error' + JSON.stringify(error));
        if (data.event == 'visibilityState') {
          try {
            expect(data.parameters.applicationState == 2 || data.parameters.applicationState == 1).assertTrue();
          } catch {
            console.error(TAG1, 'state error');
          }
          commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      await commonEventManager.createSubscriber(ACTS_VisbilityState).then(async (data) => {
        console.info(TAG1, 'createSubscriber');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallback);
        await driver.delayMs(200);
        await globalThis.abilityContext.startServiceExtensionAbility(singleServiceAbilityWantOne).then(() => {
          console.info(TAG1, 'Start serviceAbility one : ');
        });
        await driver.delayMs(500);
        await globalThis.abilityContext.startAbility(want);
      })
    })
  })
}
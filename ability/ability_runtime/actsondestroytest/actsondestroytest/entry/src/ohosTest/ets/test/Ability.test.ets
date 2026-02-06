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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import commonEvent from '@ohos.commonEventManager';
import { Driver, ON } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';

let driver = Driver.create();

const TAG = 'SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy';
const CASE_TIMEOUT = 5000;
const MULTIPLE_CASE_TIMEOUT = 6000;
const AFTER_EACH_CASE_TIMEOUT = 1500;
let ACTS_OnDestroy: commonEvent.CommonEventSubscribeInfo = {
  events: ['Acts_EntryOnDestroy', 'Acts_SecondOnDestroy', 'Acts_EntryAbilityTerminate', 'Acts_OtherAbilityTerminate',
    'Acts_SecondOtherAbilityTerminate']
};

export default function abilityTest() {
  describe('ActsAbilityStageOnDestroyTest', () => {

    beforeEach(async (done: Function) => {
      setTimeout(() => {
        done();
      }, 3000)
    })

    afterEach((done: () => void) => {
      setTimeout(() => {
        console.info(TAG + ' afterEach');
        done();
      }, AFTER_EACH_CASE_TIMEOUT)
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0100
     * @tc.name: AbilityStage support onDestroy.
     * @tc.desc: Normal exit under a single module can trigger the OnDestroy of AbilityStage.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0100', Level.LEVEL0, async (done: () => void) => {

      console.info(TAG + '_0100 start');
      let subscriber: commonEvent.CommonEventSubscriber;

      let id = setTimeout(() => {
        console.error(TAG + '_0100 timeout');
        expect().assertFail();
        done();
      }, CASE_TIMEOUT);

      let unSubscribeCallback = (() => {
        console.info(TAG + '_0100 unSubscribeCallback');
        done();
      })

      let subscribeCallBack = ((err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG + `_0100 subscribeCallBack data is: ${JSON.stringify(data)}`);
        if (data.event === 'Acts_EntryOnDestroy') {
          console.info(TAG + '_0100 event is Acts_EntryOnDestroy');
          clearTimeout(id);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      })

      commonEvent.createSubscriber(ACTS_OnDestroy).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        console.info(TAG + '_0100 startAbility');
        let context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        context.startAbility({
          bundleName: 'com.example.abilitystageondestroytest',
          moduleName: 'entry',
          abilityName: 'EntryAbility',
          parameters: {
            param: 'AbilityStage_OnDestroy_0100'
          }
        })
        try {
          let allowed = await driver.waitForComponent(ON.text("打开"), 2000);
          if (allowed) {
            console.log("find button");
            let point = await allowed.getBoundsCenter();
            console.log('point.x : ' + point.x + 'point.y : ' + point.y);
            await driver.click(point.x, point.y);
          }
        } catch (err) {
          console.error('waitForComponent error' + JSON.stringify(err));
          done();
        }
      })

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0200
     * @tc.name: AbilityStage support onDestroy.
     * @tc.desc: Normal exit in multiple modules can trigger OnDestroy of all AbilityStage
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0200', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + '_0200 start');
      let subscriber: commonEvent.CommonEventSubscriber;
      let publishEvent = ['EntryOnDestroy', 'SecondOnDestroy'];

      let id = setTimeout(() => {
        console.error(TAG + '_0200 timeout');
        expect().assertFail();
        done();
      }, CASE_TIMEOUT);

      let unSubscribeCallback = (() => {
        console.info(TAG + '_0200 unSubscribeCallback');
        done();
      })

      let subscribeCallBack = ((err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG + `_0200 subscribeCallBack data is: ${JSON.stringify(data)}`);
        if (data.event === 'Acts_EntryOnDestroy') {
          console.info(TAG + '_0200 event is Acts_EntryOnDestroy');
          publishEvent['EntryOnDestroy'] = true;
        }
        if (data.event === 'Acts_SecondOnDestroy') {
          console.info(TAG + '_0200 event is Acts_SecondOnDestroy');
          publishEvent['SecondOnDestroy'] = true;
        }
        if (publishEvent['EntryOnDestroy'] === true && publishEvent['SecondOnDestroy'] === true) {
          clearTimeout(id);
          console.info(TAG + '_0200 start unSubscribe');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      })

      commonEvent.createSubscriber(ACTS_OnDestroy).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        console.info(TAG + '_0200 startAbility');
        let context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        context.startAbility({
          bundleName: 'com.example.abilitystageondestroytest',
          moduleName: 'entry',
          abilityName: 'EntryAbility',
          parameters: {
            param: 'AbilityStage_OnDestroy_0200',
          }
        })
        try {
          let allowed = await driver.waitForComponent(ON.text("打开"), 2000);
          if (allowed) {
            console.log("find button");
            let point = await allowed.getBoundsCenter();
            console.log('point.x : ' + point.x + 'point.y : ' + point.y);
            await driver.click(point.x, point.y);
          }
        } catch (err) {
          console.error('waitForComponent error' + JSON.stringify(err));
          done();
        }
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0300
     * @tc.name: AbilityStage support onDestroy.
     * @tc.desc: Under multiple ability of a single module, only a normal exit from a single ability cannot trigger
     *           the OnDestroy of AbilityStage.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0300', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + '_0300 start');
      let subscriber: commonEvent.CommonEventSubscriber;
      let isTerminate: boolean = false;

      setTimeout(() => {
        console.info(TAG + '_0300 timeout');
        expect(isTerminate).assertTrue();
        commonEvent.unsubscribe(subscriber, unSubscribeCallback);
      }, CASE_TIMEOUT);

      let unSubscribeCallback = (() => {
        console.info(TAG + '_0300 unSubscribeCallback');
        done();
      })

      let subscribeCallBack = ((err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG + `_0300 subscribeCallBack data is: ${JSON.stringify(data)}`);
        if (data.event === 'Acts_EntryOnDestroy') {
          console.error(TAG + '_0300 event is Acts_EntryOnDestroy');
          expect().assertFail();
          done();
        }
        if (data.event === 'Acts_EntryAbilityTerminate') {
          isTerminate = true;
          console.info(TAG + '_0300 event is Acts_EntryAbilityTerminate');
        }
      })

      commonEvent.createSubscriber(ACTS_OnDestroy).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        console.info(TAG + '_0300 startAbility');
        let context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        context.startAbility({
          bundleName: 'com.example.abilitystageondestroytest',
          moduleName: 'entry',
          abilityName: 'EntryAbility',
          parameters: {
            param: 'AbilityStage_OnDestroy_0300'
          }
        })
        try {
          let allowed = await driver.waitForComponent(ON.text("打开"), 2000);
          if (allowed) {
            console.log("find button");
            let point = await allowed.getBoundsCenter();
            console.log('point.x : ' + point.x + 'point.y : ' + point.y);
            await driver.click(point.x, point.y);
          }
        } catch (err) {
          console.error('waitForComponent error' + JSON.stringify(err));
          done();
        }
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0400
     * @tc.name: AbilityStage support onDestroy.
     * @tc.desc: Normal exit in multiple modules can trigger OnDestroy of all AbilityStage
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0400', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + '_0400 start');
      let subscriber: commonEvent.CommonEventSubscriber;

      let id = setTimeout(() => {
        console.error(TAG + '_0400 timeout');
        expect().assertFail();
        done();
      }, CASE_TIMEOUT);

      let unSubscribeCallback = (() => {
        console.info(TAG + '_0400 unSubscribeCallback');
        done();
      })

      let subscribeCallBack = ((err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG + `_0400 subscribeCallBack data is: ${JSON.stringify(data)}`);
        if (data.event === 'Acts_EntryOnDestroy') {
          console.info(TAG + '_0400 event is Acts_EntryOnDestroy');
          clearTimeout(id);
          console.info(TAG + '_0400 start unSubscribe');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      })

      commonEvent.createSubscriber(ACTS_OnDestroy).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        console.info(TAG + '_0500 startAbility');
        let context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        let want: Want = {
          bundleName: 'com.example.abilitystageondestroytest',
          moduleName: 'entry',
          abilityName: 'EntryAbility',
          parameters: {
            param: 'AbilityStage_OnDestroy_0400',
          }
        }

        await context.startAbility(want).then((data) => {
          console.log(TAG + "_0500 startAbility data : " + JSON.stringify(data));
        }).catch((err: BusinessError) => {
          console.log(TAG + "_0500 startAbility err : " + JSON.stringify(err));
        })

        try {
          let allowed = await driver.waitForComponent(ON.text("打开"), 2000);
          if (allowed) {
            console.log("find button");
            let point = await allowed.getBoundsCenter();
            console.log('point.x : ' + point.x + 'point.y : ' + point.y);
            await driver.click(point.x, point.y);
          }
        } catch (err) {
          console.error('waitForComponent error' + JSON.stringify(err));
          done();
        }
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0500
     * @tc.name: AbilityStage support onDestroy.
     * @tc.desc: Under multiple ability of a single module, only a normal exit from a single ability cannot trigger
     *           the OnDestroy of AbilityStage.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_AbilityStage_OnDestroy_0500', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + '_0500 start');
      let subscriber: commonEvent.CommonEventSubscriber;
      let isTerminate = ['isOtherTerminte', 'isSecondOtherTerminte'];

      setTimeout(() => {
        console.info(TAG + '_0500 timeout');
        expect(isTerminate['isOtherTerminte']).assertTrue();
        expect(isTerminate['isSecondOtherTerminte']).assertTrue();
        commonEvent.unsubscribe(subscriber, unSubscribeCallback);
      }, MULTIPLE_CASE_TIMEOUT);

      let unSubscribeCallback = (() => {
        console.info(TAG + '_0500 unSubscribeCallback');
        done();
      })

      let subscribeCallBack = ((err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(TAG + `_0500 subscribeCallBack data is: ${JSON.stringify(data)}`);
        if (data.event === 'Acts_EntryOnDestroy') {
          console.error(TAG + '_0500 event is Acts_EntryOnDestroy');
          expect().assertFail();
          done();
        }
        if (data.event === 'Acts_SecondOnDestroy') {
          console.info(TAG + '_0500 event is Acts_SecondOnDestroy');
          expect().assertFail();
          done();
        }
        if (data.event === 'Acts_OtherAbilityTerminate') {
          isTerminate['isOtherTerminte'] = true;
          console.info(TAG + '_0500 event is Acts_OtherAbilityTerminate');
        }
        if (data.event === 'Acts_SecondOtherAbilityTerminate') {
          isTerminate['isSecondOtherTerminte'] = true;
          console.info(TAG + '_0500 event is Acts_SecondOtherAbilityTerminate');
        }
      })

      commonEvent.createSubscriber(ACTS_OnDestroy).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        console.info(TAG + '_0500 startAbility');
        let context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        context.startAbility({
          bundleName: 'com.example.abilitystageondestroytest',
          moduleName: 'entry',
          abilityName: 'EntryAbility',
          parameters: {
            param: 'AbilityStage_OnDestroy_0500'
          }
        })
        try {
          let allowed = await driver.waitForComponent(ON.text("打开"), 2000);
          if (allowed) {
            console.log("find button");
            let point = await allowed.getBoundsCenter();
            console.log('point.x : ' + point.x + 'point.y : ' + point.y);
            await driver.click(point.x, point.y);
          }
        } catch (err) {
          console.error('waitForComponent error' + JSON.stringify(err));
          done();
        }
      })
    })
  })
}
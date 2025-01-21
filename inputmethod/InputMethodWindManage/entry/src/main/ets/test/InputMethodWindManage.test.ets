/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import inputMethod from '@ohos.inputMethod';
import inputMethodEngine from '@ohos.inputMethodEngine';
import subtype from '@ohos.InputMethodSubtype';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import display from '@ohos.display';
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';
import deviceinfo from '@ohos.deviceInfo';
import { Driver, ON, MatchPattern, Component, UiWindow, DisplayRotation } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base'

export default function inputMethodWindManageAbility() {
  describe('inputMethodWindManageTest', () => {
    let driver = Driver.create();
    let textArea: Component;
    let rectInfo;

    beforeAll(async (done) => {
      console.info('====>beforeAll inputMethod_enable start!')
      try {
        let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
        let result: boolean = await inputMethodSetting.showOptionalInputMethods();
        console.info('====>beforeAll inputMethodSwitch showOptionalInputMethods result: ' + JSON.stringify(result));
        let inputMethodList = await driver.waitForComponent(ON.type('List'), 3000);
        console.info('====>beforeAll inputMethodSwitch inputMethodList: ' + JSON.stringify(inputMethodList));
        if (JSON.stringify(inputMethodList) === 'null') {
          await driver.delayMs(200);
          inputMethodList = await driver.findComponent(ON.type('List'));
          console.info('====>beforeAll inputMethodSwitch inputMethodList second: ' + JSON.stringify(inputMethodList));
        }
        await driver.delayMs(1000);
        if (deviceinfo.deviceType === '2in1') {
          let inputMethod_name: Component = await driver.waitForComponent(ON.text('widmanage', MatchPattern.CONTAINS), 2000);
          await inputMethod_name.click();
          await driver.delayMs(500);
        } else {
          let inputMethod_name: Component = await inputMethodList.scrollSearch(ON.text('widmanage', MatchPattern.CONTAINS));
          console.info('====>beforeAll inputMethodSwitch inputMethod_name: ' + JSON.stringify(inputMethod_name));
          if (JSON.stringify(inputMethod_name) === 'null') {
            await driver.delayMs(200);
            inputMethod_name = await inputMethodList.scrollSearch(ON.text('widmangae', MatchPattern.CONTAINS));
            console.info('====>beforeAll inputMethodSwitch inputMethod_name second: ' + JSON.stringify(inputMethod_name));
          }
          await inputMethod_name.click();
        }
        console.info('====>beforeAll inputMethodSwitch done');
        await driver.delayMs(1000);
        let testWindow: UiWindow = await driver.findWindow({
          bundleName: "com.acts.inputmethodwidmanage.test"
        });
        console.info('====>beforeAll inputMethodSwitch switch window: ' + JSON.stringify(testWindow));
        await testWindow.focus();
        await driver.delayMs(1000);
        textArea = await driver.findComponent(ON.type('TextArea'));
        console.info('====>beforeAll inputMethodSwitch window textArea:' + JSON.stringify(textArea))
        rectInfo = await textArea.getBounds();
        console.info('====>beforeAll inputMethodSwitch textArea rectInfo:' + JSON.stringify(rectInfo))
        await driver.delayMs(1000);
        await runCmd();
        await driver.delayMs(1000);
        done();
      } catch (err) {
        console.info('====>beforeAll throw err:' + JSON.stringify(err.message))
        done();
      }
    })

    afterAll(async (done: Function) => {
      done();
    })

    let sleep = function (timeout) {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    async function runCmd() {
      let cursor_x = rectInfo.left + 20 + Math.floor(Math.random() * (rectInfo.right - rectInfo.left) * 0.7);
      let cursor_y = rectInfo.top + 20 + Math.floor(Math.random() * (rectInfo.bottom - rectInfo.top) * 0.7);
      console.info(`====>start click x: ${cursor_x}  y: ${cursor_y}`)
      await driver.click(cursor_x, cursor_y)
    }

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_createPanelCallback_0010
    * @tc.name   Sub_Misc_inputMethod_Panel_createPanelCallback_0010
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_createPanelCallback_0010', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_createPanelCallback_0010']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 10
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_createPanelPromise_0020
    * @tc.name   Sub_Misc_inputMethod_Panel_createPanelPromise_0020
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_createPanelPromise_0020', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_createPanelPromise_0020']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 20
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030
    * @tc.name   Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 30
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040
    * @tc.name   Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 40
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_setUiContentCallback_0050
    * @tc.name   Sub_Misc_inputMethod_Panel_setUiContentCallback_0050
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_setUiContentCallback_0050']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 50
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_setUiContentPromise_0060
    * @tc.name   Sub_Misc_inputMethod_Panel_setUiContentPromise_0060
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_setUiContentPromise_0060']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 60
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_setUiContentCallback_0070
    * @tc.name   Sub_Misc_inputMethod_Panel_setUiContentCallback_0070
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_setUiContentCallback_0070']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 70
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_setUiContentPromise_0080
    * @tc.name   Sub_Misc_inputMethod_Panel_setUiContentPromise_0080
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_setUiContentPromise_0080']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 80
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_resizeCallback_0090
    * @tc.name   Sub_Misc_inputMethod_Panel_resizeCallback_0090
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_resizeCallback_0090', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_resizeCallback_0090']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 90
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_resizePromise_0100
    * @tc.name   Sub_Misc_inputMethod_Panel_resizePromise_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_resizePromise_0100', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_resizePromise_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 100
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_moveToCallback_0110
    * @tc.name   Sub_Misc_inputMethod_Panel_moveToCallback_0110
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_moveToCallback_0110', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_moveToCallback_0110']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 110
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_moveToPromise_0120
    * @tc.name   Sub_Misc_inputMethod_Panel_moveToPromise_0120
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_moveToPromise_0120', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_moveToPromise_0120']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 120
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_showCallback_0130
    * @tc.name   Sub_Misc_inputMethod_Panel_showCallback_0130
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_showCallback_0130', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_showCallback_0130 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_showCallback_0130']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 130
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_hideCallback_0150
    * @tc.name   Sub_Misc_inputMethod_Panel_hideCallback_0150
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_hideCallback_0150', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_hideCallback_0150']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 150
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_showPromise_0140
    * @tc.name   Sub_Misc_inputMethod_Panel_showPromise_0140
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_showPromise_0140', 0, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(false, ATTRIBUTE);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_showPromise_0140 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_showPromise_0140']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 140
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_hidePromise_0160
    * @tc.name   Sub_Misc_inputMethod_Panel_hidePromise_0160
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_hidePromise_0160', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_hidePromise_0160']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 160
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_onShow_0170
    * @tc.name  Sub_Misc_inputMethod_Panel_onShow_0170
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_onShow_0170', 0, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(false, ATTRIBUTE);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_onShow_0170 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_onShow_0170']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 170
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_onHide_0180
    * @tc.name  Sub_Misc_inputMethod_Panel_onHide_0180
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_onHide_0180', 0, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(false, ATTRIBUTE);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_onHide_0180 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_onHide_0180']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 180
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_offShow_0190
    * @tc.name  Sub_Misc_inputMethod_Panel_offShow_0190
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_offShow_0190', 0, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(false, ATTRIBUTE);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_offShow_0190 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_offShow_0190']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 190
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_offHide_0200
    * @tc.name  Sub_Misc_inputMethod_Panel_offHide_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_offHide_0200', 0, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(false, ATTRIBUTE);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_offHide_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_offHide_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 200
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_inputWindowInfo_0201
    * @tc.name  Sub_Misc_inputMethod_inputWindowInfo_0201
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_inputWindowInfo_0201', 0, async (done: Function) => {
      let inputWindowInfo: inputMethod.InputWindowInfo = {
        name: 'inputWindowInfo_0201/99',
        left: 100,
        top: 607,
        width: 720,
        height: 601,
      }
      try {
        console.info('====>Sub_Misc_inputMethod_inputWindowInfo_0201 inputWindowInfo: ' + JSON.stringify(inputWindowInfo));
        expect(inputWindowInfo.name).assertEqual('inputWindowInfo_0201/99')
        expect(inputWindowInfo.left).assertEqual(100)
        expect(inputWindowInfo.top).assertEqual(607)
        expect(inputWindowInfo.width).assertEqual(720)
        expect(inputWindowInfo.height).assertEqual(601)
        done();
      } catch (err) {
        console.info('====>Sub_Misc_inputMethod_inputWindowInfo_0201 fail: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_changeFlag_0210
    * @tc.name  Sub_Misc_inputMethod_Panel_changeFlag_0210
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_changeFlag_0210', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_changeFlag_0210']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 210
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_changeFlag_0211
    * @tc.name  Sub_Misc_inputMethod_Panel_changeFlag_0211
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_changeFlag_0211', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 unSubscriberCallback finish');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 success end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 catch end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_changeFlag_0211']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 211
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_InputMethod_IMF_panelInfo_0400
    * @tc.name  SUB_InputMethod_IMF_panelInfo_0400
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('SUB_InputMethod_IMF_panelInfo_0400', 0, async (done: Function) => {
      console.info('====>SUB_InputMethod_IMF_panelInfo_0400 start');
      let panel: PanelInfo;
      panel = {
        type: 1,
        flag: 0
      }
      let FLAG_FLOATING = PanelFlag.FLAG_FLOATING
      console.info('====>SUB_InputMethod_IMF_panelInfo_0400 FLAG_FLOATING: ' + FLAG_FLOATING);
      expect(FLAG_FLOATING === 1).assertTrue();
      let FLAG_FIXED = PanelFlag.FLAG_FIXED
      console.info('====>SUB_InputMethod_IMF_panelInfo_0400 FLAG_FIXED: ' + FLAG_FIXED);
      expect(FLAG_FIXED === 0).assertTrue();

      let FLAG_CANDIDATE = PanelFlag.FLAG_CANDIDATE
      console.info('====>SUB_InputMethod_IMF_panelInfo_0400 FLAG_CANDIDATE: ' + FLAG_CANDIDATE);
      expect(FLAG_CANDIDATE === 2).assertTrue();

      let SOFT_KEYBOARD = PanelType.SOFT_KEYBOARD
      console.info('====>SUB_InputMethod_IMF_panelInfo_0400 SOFT_KEYBOARD: ' + SOFT_KEYBOARD);
      expect(SOFT_KEYBOARD === 0).assertTrue();

      let STATUS_BAR = PanelType.STATUS_BAR
      console.info('====>SUB_InputMethod_IMF_panelInfo_0400 STATUS_BAR: ' + STATUS_BAR);
      expect(STATUS_BAR === 1).assertTrue();
      done();
    });

    /**
     * @tc.number Sub_InputMethod_IMF_SecurityKeyboard_0600
     * @tc.name Sub_InputMethod_IMF_SecurityKeyboard_0600
     * @tc.desc setPrivacyMode(),parameter is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('Sub_InputMethod_IMF_SecurityKeyboard_0600', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 unSubscriberCallback finish');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 success end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 catch end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IMF_SecurityKeyboard_0600']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 212
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number Sub_InputMethod_IMF_SecurityKeyboard_0700
     * @tc.name Sub_InputMethod_IMF_SecurityKeyboard_0700
     * @tc.desc setPrivacyMode(),parameter is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('Sub_InputMethod_IMF_SecurityKeyboard_0700', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 unSubscriberCallback finish');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 success end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 catch end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IMF_SecurityKeyboard_0700']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 213
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number Sub_InputMethod_IMF_SecurityKeyboard_0800
     * @tc.name Sub_InputMethod_IMF_SecurityKeyboard_0800
     * @tc.desc setPrivacyMode(),parameter is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('Sub_InputMethod_IMF_SecurityKeyboard_0800', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 unSubscriberCallback finish');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 success end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 catch end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IMF_SecurityKeyboard_0800']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 214
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number Sub_InputMethod_IMF_getSecurityMode_0100
     * @tc.name Sub_InputMethod_IMF_getSecurityMode_0100
     * @tc.desc getSecurityMode()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('Sub_InputMethod_IMF_getSecurityMode_0100', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IMF_getSecurityMode_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 unSubscriberCallback finish');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 success end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 catch end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IMF_getSecurityMode_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 215
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number SUB_InputMethod_IME_SplitScreen_0100
     * @tc.name SUB_InputMethod_IME_SplitScreen_0100
     * @tc.desc getSecurityMode()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_InputMethod_IME_SplitScreen_0100', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>SUB_InputMethod_IME_SplitScreen_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>SUB_InputMethod_IME_SplitScreen_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>SUB_InputMethod_IME_SplitScreen_0100 unSubscriberCallback finish');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>SUB_InputMethod_IME_SplitScreen_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(async () => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>SUB_InputMethod_IME_SplitScreen_0100 success end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>SUB_InputMethod_IME_SplitScreen_0100 catch end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        runCmd();
        if (err) {
          console.info('====>SUB_InputMethod_IME_SplitScreen_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>SUB_InputMethod_IME_SplitScreen_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['SUB_InputMethod_IME_SplitScreen_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        try{
          subscriber = data;
          console.info('====>SUB_InputMethod_IME_SplitScreen_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>SUB_InputMethod_IME_SplitScreen_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 216
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
      * @tc.number  Sub_InputMethod_IME_ScreenRotation_0100
      * @tc.name    Sub_InputMethod_IME_ScreenRotation_0100
      * @tc.desc    Function test
      * @tc.size    MediumTest
      * @tc.type    Function
      * @tc.level   Level2
      */
    it('Sub_InputMethod_IME_ScreenRotation_0100', 0, async (done: Function) => {

      function unSubscriberCallback(err) {
        console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err) {
        console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_ScreenRotation_0100"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          var commonEventPublishData = {
            code: 217
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
      * @tc.number  Sub_InputMethod_IME_ScreenRotation_0200
      * @tc.name    Sub_InputMethod_IME_ScreenRotation_0200
      * @tc.desc    Function test
      * @tc.size    MediumTest
      * @tc.type    Function
      * @tc.level   Level2
      */
    it('Sub_InputMethod_IME_ScreenRotation_0200', 0, async (done: Function) => {

      function unSubscriberCallback(err) {
        console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err) {
        console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_ScreenRotation_0200"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          var commonEventPublishData = {
            code: 218
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

  });
};

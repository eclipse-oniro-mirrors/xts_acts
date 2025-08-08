/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import inputMethod from '@ohos.inputMethod';
import inputMethodEngine from '@ohos.inputMethodEngine';
import subtype from '@ohos.InputMethodSubtype';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import display from '@ohos.display';
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';
import deviceinfo from '@ohos.deviceInfo';
import { Driver, ON, MatchPattern, Component, UiWindow, DisplayRotation, Rect } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base'
import { util } from '@kit.ArkTS';

export default function inputMethodWindManageAbility() {
  describe('inputMethodWindManageTest', () => {
    let driver = Driver.create();
    let textArea: Component;
    let rectInfo: Rect;

    beforeAll(async (done: Function) => {
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

    let runCmd = async () => {
      let cursor_x: number = rectInfo.left + 20 + Math.floor(Math.random() * (rectInfo.right - rectInfo.left) * 0.7);
      let cursor_y: number = rectInfo.top + 20 + Math.floor(Math.random() * (rectInfo.bottom - rectInfo.top) * 0.7);
      console.info(`====>start click x: ${cursor_x}  y: ${cursor_y}`)
      await driver.click(cursor_x, cursor_y)
    }

    let newArrayBuffer = (str:string|undefined): ArrayBuffer => {
      let arrayBuffer = new ArrayBuffer(0);
      if(str === undefined){
        const view = new Uint8Array(arrayBuffer);
      }else{
        arrayBuffer = new ArrayBuffer(str.length);
        const view = new Uint8Array(arrayBuffer);
        for(let i = 0; i < str.length; i++){
          view[i] = str.charCodeAt(i);
        }
      }
      return arrayBuffer
    }

    let GetArrayBufferString = (buffer: ArrayBuffer): string => {
      console.info('====>GetArrayBufferString: ' + JSON.stringify(buffer));
      const decoder = util.TextDecoder.create('"utf-8"');
      const str = decoder.decodeWithStream(new Uint8Array(buffer));
      return str
    }

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_createPanelCallback_0010
    * @tc.name   Sub_Misc_inputMethod_Panel_createPanelCallback_0010
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   0
    */
    it('Sub_Misc_inputMethod_Panel_createPanelCallback_0010', Level.LEVEL0, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_createPanelPromise_0020
    * @tc.name   Sub_Misc_inputMethod_Panel_createPanelPromise_0020
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   0
    */
    it('Sub_Misc_inputMethod_Panel_createPanelPromise_0020', Level.LEVEL0, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_resizeCallback_0090', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_resizePromise_0100', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_moveToCallback_0110', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_moveToPromise_0120', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_showCallback_0130', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_hideCallback_0150', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_showPromise_0140', Level.LEVEL2, async (done: Function) => {
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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_hidePromise_0160', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_onShow_0170', Level.LEVEL2, async (done: Function) => {
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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_onHide_0180', Level.LEVEL2, async (done: Function) => {
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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_offShow_0190', Level.LEVEL2, async (done: Function) => {
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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_offHide_0200', Level.LEVEL2, async (done: Function) => {
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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_inputWindowInfo_0201', Level.LEVEL2, async (done: Function) => {
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
    it('Sub_Misc_inputMethod_Panel_changeFlag_0210', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_Misc_inputMethod_Panel_changeFlag_0211', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('SUB_InputMethod_IMF_panelInfo_0400', Level.LEVEL2, async (done: Function) => {
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
     * @tc.level Level 1
     */
    it('Sub_InputMethod_IMF_SecurityKeyboard_0600', Level.LEVEL1, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number Sub_InputMethod_IMF_SecurityKeyboard_0700
     * @tc.name Sub_InputMethod_IMF_SecurityKeyboard_0700
     * @tc.desc setPrivacyMode(),parameter is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sub_InputMethod_IMF_SecurityKeyboard_0700', Level.LEVEL1, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_InputMethod_IMF_SecurityKeyboard_0800', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_InputMethod_IMF_getSecurityMode_0100', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('SUB_InputMethod_IME_SplitScreen_0100', Level.LEVEL2, async (done: Function) => {

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
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
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
      }).catch((err: BusinessError) => {
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
    it('Sub_InputMethod_IME_ScreenRotation_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
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

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_ScreenRotation_0100"]
      }
      let subscriber:ESObject;
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
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 217
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
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
    it('Sub_InputMethod_IME_ScreenRotation_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
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

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_ScreenRotation_0200"]
      }
      let subscriber:ESObject;
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
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 218
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_Misc_inputMethod_Panel_onSizeChange_0100
     * @tc.name    Sub_Misc_inputMethod_Panel_onSizeChange_0100
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_Misc_inputMethod_Panel_onSizeChange_0100', Level.LEVEL2, async (done: Function) => {
      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_onSizeChange_0100"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 240
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_Misc_inputMethod_Panel_onSizeChange_0200
     * @tc.name    Sub_Misc_inputMethod_Panel_onSizeChange_0200
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_Misc_inputMethod_Panel_onSizeChange_0200', Level.LEVEL2, async (done: Function) => {
      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_Panel_onSizeChange_0200"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 241
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_InputMethodState_0900
     * @tc.name    Sub_InputMethod_IME_InputMethodState_0900
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_InputMethodState_0900', Level.LEVEL2, async (done: Function) => {
      try{
        let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
        console.info("====>Sub_InputMethod_IME_InputMethodState_0900 getSetting success");
        let state =  await inputMethodSetting.getInputMethodState();
        console.info("====>Sub_InputMethod_IME_InputMethodState_0900 state is: " + state);
        expect(state).assertEqual(inputMethod.EnabledState.FULL_EXPERIENCE_MODE);
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IME_InputMethodState_0900 errCode:${err.code}, errMessage is ${err.message}`)
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Dragging_1100
     * @tc.name    Sub_InputMethod_IME_Dragging_1100
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Dragging_1100', Level.LEVEL2, async (done: Function) => {
      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Dragging_1100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Dragging_1100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Dragging_1100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Dragging_1100 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_Dragging_1100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_Dragging_1100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Dragging_1100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Dragging_1100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Dragging_1100"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Dragging_1100 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Dragging_1100 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 250
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Dragging_0800
     * @tc.name    Sub_InputMethod_IME_Dragging_0800
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Dragging_0800', Level.LEVEL2, async (done: Function) => {
      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Dragging_0800 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Dragging_0800 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Dragging_0800 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Dragging_0800 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_Dragging_0800 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_Dragging_0800 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Dragging_0800 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Dragging_0800 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Dragging_0800"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Dragging_0800 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Dragging_0800 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 251
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Dragging_0900
     * @tc.name    Sub_InputMethod_IME_Dragging_0900
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Dragging_0900', Level.LEVEL2, async (done: Function) => {
      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Dragging_0900 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Dragging_0900 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Dragging_0900 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Dragging_0900 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("number");
            console.info("====>Sub_InputMethod_IME_Dragging_0900 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_Dragging_0900 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Dragging_0900 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Dragging_0900 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Dragging_0900"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Dragging_0900 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Dragging_0900 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 253
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });


    /**
     * @tc.number  Sub_InputMethod_IME_Custom_0700
     * @tc.name    Sub_InputMethod_IME_Custom_0700
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Custom_0700', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(true, ATTRIBUTE);
      let str: string = 'a';
      let msgIdStr: string = 'b';
      let msgParam: ArrayBuffer = newArrayBuffer(str.repeat(128 * 1024));
      let msgId: string = msgIdStr.repeat(256)
      console.info('====>Sub_InputMethod_IME_Custom_0700 sendMessage msgIdSize: ' + msgId.length + ', msgParamSize: ' + msgParam.byteLength);
      try {
        await inputMethod.getController().sendMessage(msgId, msgParam);
        expect().assertFail();
        done();
      }catch (err) {
        console.info(`====>Sub_InputMethod_IME_Custom_0700 sendMessage throw err.code: ${err.code}`);
        expect(err.code).assertEqual(12800015)
        await inputMethod.getController().detach();
        done();
      }
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Custom_0500
     * @tc.name    Sub_InputMethod_IME_Custom_0500
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Custom_0500', Level.LEVEL2, async (done: Function) => {
      let str: string = 'a';
      let msgIdStr: string = 'b';
      let msgParam: ArrayBuffer = newArrayBuffer(str.repeat(128 * 1024));
      let msgId: string = msgIdStr.repeat(256)
      console.info('====>Sub_InputMethod_IME_Custom_0500 sendMessage msgIdSize: ' + msgId.length + ', msgParamSize: ' + msgParam.byteLength);
      try {
        await inputMethod.getController().sendMessage(msgId, msgParam);
        expect().assertFail();
        done();
      }catch (err) {
        console.info(`====>Sub_InputMethod_IME_Custom_0500 sendMessage throw err.code: ${err.code}`);
        expect(err.code).assertEqual(12800009)
        done();
      }
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Custom_0600
     * @tc.name    Sub_InputMethod_IME_Custom_0600
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Custom_0600', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(true, ATTRIBUTE);
      await inputMethod.getController().hideTextInput();
      let str: string = 'a';
      let msgIdStr: string = 'b';
      let msgParam: ArrayBuffer = newArrayBuffer(str.repeat(128 * 1024));
      let msgId: string = msgIdStr.repeat(256)
      console.info('====>Sub_InputMethod_IME_Custom_0600 sendMessage msgIdSize: ' + msgId.length + ', msgParamSize: ' + msgParam.byteLength);
      try {
        await inputMethod.getController().sendMessage(msgId, msgParam);
        expect().assertFail();
        done();
      }catch (err) {
        console.info(`====>Sub_InputMethod_IME_Custom_0600 sendMessage throw err.code: ${err.code}`);
        expect(err.code).assertEqual(12800016)
        done();
      }
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Custom_0900
     * @tc.name    Sub_InputMethod_IME_Custom_0900
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Custom_0900', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(true, ATTRIBUTE);
      let msgHandler: inputMethod.MessageHandler = {
        onTerminated(): void {
          console.info("====>Sub_InputMethod_IME_Custom_0900 onTerminated");
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          console.info('====>Sub_InputMethod_IME_Custom_0900 onMessage msgId: ' + msgId + ', msgParam: ' +
          GetArrayBufferString(msgParam) + ', msgParamObj' + msgParam);
          expect(msgId).assertEqual('Sub_InputMethod_IME_Custom_0900');
          if(msgParam !== undefined){
            expect(GetArrayBufferString(msgParam)).assertEqual('SUCCESS')
          }else{
            expect().assertFail();
          }
          done();
        }
      }
      inputMethod.getController().recvMessage(msgHandler);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Custom_0900 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0900 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Custom_0900 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Custom_0900 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        try {
          expect(data.data).assertEqual("SUCCESS");
          let msgId: string = 'Sub_InputMethod_IME_Custom_0900';
          console.info("====>Sub_InputMethod_IME_Custom_0900 sendMessage");
          try {
            await inputMethod.getController().sendMessage(msgId);
            console.info("====>Sub_InputMethod_IME_Custom_0900 sendMessage success!");
          }catch (err) {
            console.info(`====>Sub_InputMethod_IME_Custom_0900 throw err.code: ${err.code}`);
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0900 err:" + JSON.stringify(err));
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Custom_0900 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0900 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Custom_0900"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Custom_0900 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Custom_0900 subscriber finish");
        }catch(err){
          console.info(`====>Sub_InputMethod_IME_Custom_0900 Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 230
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>Sub_InputMethod_IME_Custom_0900 createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });


    /**
     * @tc.number  Sub_InputMethod_IME_Custom_0200
     * @tc.name    Sub_InputMethod_IME_Custom_0200
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Custom_0200', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(true, ATTRIBUTE);
      let msgHandler: inputMethod.MessageHandler = {
        onTerminated(): void {
          console.info("====>Sub_InputMethod_IME_Custom_0200 onTerminated");
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          console.info('====>Sub_InputMethod_IME_Custom_0200 onMessage msgId: ' + msgId + ', msgParam: ' +
          GetArrayBufferString(msgParam) + ', msgParamObj' + msgParam);
          expect(msgId).assertEqual('Sub_InputMethod_IME_Custom_0200');
          if(msgParam !== undefined){
            expect(GetArrayBufferString(msgParam)).assertEqual('SUCCESS')
          }else{
            expect().assertFail();
          }
          done();
        }
      }
      inputMethod.getController().recvMessage(msgHandler);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Custom_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Custom_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Custom_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        try {
          expect(data.data).assertEqual("SUCCESS");
          let str: string = 'A';
          let msgIdStr: string = 'B';
          let msgParam: ArrayBuffer = newArrayBuffer(str.repeat(128 * 1024));
          let msgId: string = msgIdStr.repeat(256)
          console.info("====>Sub_InputMethod_IME_Custom_0200 sendMessage");
          try {
            await inputMethod.getController().sendMessage(msgId, msgParam);
            console.info("====>Sub_InputMethod_IME_Custom_0200 sendMessage success!");
          }catch (err) {
            console.info(`====>Sub_InputMethod_IME_Custom_0200 throw err.code: ${err.code}`);
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0200 err:" + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Custom_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Custom_0200"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Custom_0200 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Custom_0200 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`);
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 231
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`);
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Custom_0800
     * @tc.name    Sub_InputMethod_IME_Custom_0800
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Custom_0800', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(true, ATTRIBUTE);
      let msgHandler: inputMethod.MessageHandler = {
        onTerminated(): void {
          console.info("====>Sub_InputMethod_IME_Custom_0800 onTerminated");
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          console.info('====>Sub_InputMethod_IME_Custom_0800 onMessage msgId: ' + msgId + ', msgParam: ' +
          GetArrayBufferString(msgParam) + ', msgParamObj' + msgParam);
          expect(msgId).assertEqual('Sub_InputMethod_IME_Custom_0800');
          if(msgParam !== undefined){
            expect(GetArrayBufferString(msgParam)).assertEqual('SUCCESS');
          }else{
            expect().assertFail();
          }
          done();
        }
      }
      inputMethod.getController().recvMessage(msgHandler);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Custom_0800 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0800 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Custom_0800 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Custom_0800 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        try {
          expect(data.data).assertEqual("SUCCESS");
          let msgId: string = '';
          let msgParam: ArrayBuffer = newArrayBuffer('A'.repeat(128 * 1024));
          console.info("====>Sub_InputMethod_IME_Custom_0800 sendMessage");
          try {
            await inputMethod.getController().sendMessage(msgId, msgParam);
            console.info("====>Sub_InputMethod_IME_Custom_0800 sendMessage success!");
          }catch (err) {
            console.info(`====>Sub_InputMethod_IME_Custom_0800 throw err.code: ${err.code}`);
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0800 err:" + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Custom_0800 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0800 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Custom_0800"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Custom_0800 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Custom_0800 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 232
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Custom_0400
     * @tc.name    Sub_InputMethod_IME_Custom_0400
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Custom_0400', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(true, ATTRIBUTE);
      let msgHandler: inputMethod.MessageHandler = {
        onTerminated(): void {
          console.info("====>Sub_InputMethod_IME_Custom_0400 onTerminated");
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          console.info('====>Sub_InputMethod_IME_Custom_0400 onMessage msgId: ' + msgId + ', msgParam: ' +
          GetArrayBufferString(msgParam) + ', msgParamObj' + msgParam);
          expect().assertFail();
          done();
        }
      }
      inputMethod.getController().recvMessage(msgHandler);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Custom_0400 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0400 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Custom_0400 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Custom_0400 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        try {
          expect(data.data).assertEqual("SUCCESS");
          let str: string = 'A';
          let msgIdStr: string = 'B';
          let msgParam: ArrayBuffer = newArrayBuffer(str.repeat(128 * 1024 + 1));
          let msgId: string = msgIdStr.repeat(256)
          console.info("====>Sub_InputMethod_IME_Custom_0400 sendMessage");
          try {
            await inputMethod.getController().sendMessage(msgId, msgParam);
            console.info("====>Sub_InputMethod_IME_Custom_0400 sendMessage success!");
          }catch (err) {
            console.info(`====>Sub_InputMethod_IME_Custom_0400 throw err.code: ${err.code}`);
            expect(err.code).assertEqual(401);
            done();
          }
        } catch (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0400 err:" + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Custom_0400 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0400 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Custom_0400"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Custom_0400 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Custom_0400 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 233
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Custom_0300
     * @tc.name    Sub_InputMethod_IME_Custom_0300
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Custom_0300', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(true, ATTRIBUTE);
      let msgHandler: inputMethod.MessageHandler = {
        onTerminated(): void {
          console.info("====>Sub_InputMethod_IME_Custom_0300 onTerminated");
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          console.info('====>Sub_InputMethod_IME_Custom_0300 onMessage msgId: ' + msgId + ', msgParam: ' +
          GetArrayBufferString(msgParam) + ', msgParamObj' + msgParam);
          expect().assertFail();
          done();
        }
      }
      inputMethod.getController().recvMessage(msgHandler);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Custom_0300 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0300 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Custom_0300 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Custom_0300 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        try {
          expect(data.data).assertEqual("SUCCESS");
          let str: string = 'A';
          let msgIdStr: string = 'B';
          let msgParam: ArrayBuffer = newArrayBuffer(str.repeat(128 * 1024));
          let msgId: string = msgIdStr.repeat(257);
          console.info("====>Sub_InputMethod_IME_Custom_0300 sendMessage");
          try {
            await inputMethod.getController().sendMessage(msgId, msgParam);
            console.info("====>Sub_InputMethod_IME_Custom_0300 sendMessage success!");
          }catch (err) {
            console.info(`====>Sub_InputMethod_IME_Custom_0300 throw err.code: ${err.code}`);
            expect(err.code).assertEqual(401);
            done();
          }
        } catch (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0300 err:" + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Custom_0300 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Custom_0300 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Custom_0300"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Custom_0300 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Custom_0300 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 234
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Custom_1100
     * @tc.name    Sub_InputMethod_IME_Custom_1100
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Custom_1100', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(true, ATTRIBUTE);
      let msgHandler: inputMethod.MessageHandler = {
        onTerminated(): void {
          console.info("====>Sub_InputMethod_IME_Custom_1100 onTerminated");
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          try {
            console.info('====>Sub_InputMethod_IME_Custom_1100 onMessage msgId: ' + msgId + ', msgParam: ' +
            GetArrayBufferString(msgParam) + ', msgParamObj' + msgParam);
            expect(msgId).assertEqual('Sub_InputMethod_IME_Custom_1100');
            expect(typeof(msgParam)).assertEqual('undefined')
            done()
          }catch (err) {
            console.info(`====>Sub_InputMethod_IME_Custom_1100 catch err: ${err.message}`);
          }
        }
      }
      inputMethod.getController().recvMessage(msgHandler);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Custom_1100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Custom_1100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Custom_1100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Custom_1100 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        try {
          expect(data.data).assertEqual("SUCCESS");
          let msgIdStr: string = 'B';
          let msgId: string = msgIdStr.repeat(256)
          console.info("====>Sub_InputMethod_IME_Custom_1100 sendMessage");
          try {
            await inputMethod.getController().sendMessage(msgId);
            console.info("====>Sub_InputMethod_IME_Custom_1100 sendMessage success!");
          }catch (err) {
            console.info(`====>Sub_InputMethod_IME_Custom_1100 throw err.code: ${err.code}`);
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.info("====>Sub_InputMethod_IME_Custom_1100 err:" + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Custom_1100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Custom_1100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Custom_1100"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Custom_1100 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Custom_1100 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 235
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Attach_0100
     * @tc.name    Sub_InputMethod_IME_Attach_0100
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Attach_0100', Level.LEVEL2, async (done: Function) => {
      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Attach_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Attach_0100 unSubscriberCallback failed:" + JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Attach_0100 unSubscriberCallback finish");
        }
      }

      await inputMethod.getController().detach();

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Attach_0100 subscriberCallback data:" + JSON.stringify(data));
        if (data.data == "on_SUCCESS"){
          const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
              textInputType: 0, enterKeyType: 0
            }
          }
          await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
          console.info("====>Sub_InputMethod_IME_Attach_0100 attach success");
        }else {
          commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
          expect(data.data).assertEqual("SUCCESS");
          await inputMethod.getController().detach();
          console.info("====>Sub_InputMethod_IME_Attach_0100 end");
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Attach_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Attach_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Attach_0100"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Attach_0100 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Attach_0100 subscriber finish");
        }catch(err){
          console.info(
            `====>Sub_InputMethod_IME_Attach_0100 subscriber failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 260
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(
          `====>Sub_InputMethod_IME_Attach_0100 createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Attach_0200
     * @tc.name    Sub_InputMethod_IME_Attach_0200
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Attach_0200', Level.LEVEL2, async (done: Function) => {
      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Attach_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Attach_0200 unSubscriberCallback failed:" + JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Attach_0200 unSubscriberCallback finish");
        }
      }

      await inputMethod.getController().detach();

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Attach_0200 subscriberCallback data:" + JSON.stringify(data));
        if (data.data == "on_SUCCESS"){
          const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
              textInputType: 0, enterKeyType: 0
            }
          }
          await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.MOUSE);
          console.info("====>Sub_InputMethod_IME_Attach_0200 attach success");
        }else {
          commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
          expect(data.data).assertEqual("SUCCESS");
          await inputMethod.getController().detach();
          console.info("====>Sub_InputMethod_IME_Attach_0200 end");
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Attach_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Attach_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Attach_0200"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Attach_0200 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Attach_0200 subscriber finish");
        }catch(err){
          console.info(
            `====>Sub_InputMethod_IME_Attach_0200 subscriber failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 261
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(
          `====>Sub_InputMethod_IME_Attach_0200 createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Attach_0300
     * @tc.name    Sub_InputMethod_IME_Attach_0300
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Attach_0300', Level.LEVEL2, async (done: Function) => {
      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Attach_0300 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Attach_0300 unSubscriberCallback failed:" + JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Attach_0300 unSubscriberCallback finish");
        }
      }

      await inputMethod.getController().detach();

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Attach_0300 subscriberCallback data:" + JSON.stringify(data));
        if (data.data == "on_SUCCESS"){
          const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
              textInputType: 0, enterKeyType: 0
            }
          }
          await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.TOUCH);
          console.info("====>Sub_InputMethod_IME_Attach_0300 attach success");
        }else {
          commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
          expect(data.data).assertEqual("SUCCESS");
          await inputMethod.getController().detach();
          console.info("====>Sub_InputMethod_IME_Attach_0300 end");
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Attach_0300 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Attach_0300 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Attach_0300"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Attach_0300 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Attach_0300 subscriber finish");
        }catch(err){
          console.info(
            `====>Sub_InputMethod_IME_Attach_0300 subscriber failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 262
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(
          `====>Sub_InputMethod_IME_Attach_0300 createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Attach_0400
     * @tc.name    Sub_InputMethod_IME_Attach_0400
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Attach_0400', Level.LEVEL2, async (done: Function) => {
      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Attach_0400 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Attach_0400 unSubscriberCallback failed:" + JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Attach_0400 unSubscriberCallback finish");
        }
      }

      await inputMethod.getController().detach();

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Attach_0400 subscriberCallback data:" + JSON.stringify(data));
        if (data.data == "on_SUCCESS"){
          const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
              textInputType: 0, enterKeyType: 0
            }
          }
          await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.OTHER);
          console.info("====>Sub_InputMethod_IME_Attach_0400 attach success");
        }else {
          commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
          expect(data.data).assertEqual("SUCCESS");
          await inputMethod.getController().detach();
          console.info("====>Sub_InputMethod_IME_Attach_0400 end");
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Attach_0400 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Attach_0400 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Attach_0400"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Attach_0400 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Attach_0400 subscriber finish");
        }catch(err){
          console.info(
            `====>Sub_InputMethod_IME_Attach_0400 subscriber failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 263
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(
          `====>Sub_InputMethod_IME_Attach_0400 createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    let sleep = (timeout: number): Promise<ESObject> => {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    /**
     * @tc.number  Sub_InputMethod_IME_ShowTextInput_0100
     * @tc.name    Sub_InputMethod_IME_ShowTextInput_0100
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_ShowTextInput_0100', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().detach();
      await inputMethod.getController().attach(false, ATTRIBUTE);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ShowTextInput_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0100 unSubscriberCallback failed:" +
            JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_ShowTextInput_0100 subscriberCallback data:" + JSON.stringify(data));
        if (data.data == "on_SUCCESS"){
          await sleep(100);
          await inputMethod.getController().showTextInput(0);
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0100 showTextInput success");
        }else {
          commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
          expect(data.data).assertEqual("SUCCESS");
          await inputMethod.getController().detach();
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0100 end");
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ShowTextInput_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_ShowTextInput_0100"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0100 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0100 subscriber finish");
        }catch(err){
          console.info(`====>subscriber failed, code:${err.code}, message is ${err.message}`);
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 270
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`);
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_ShowTextInput_0200
     * @tc.name    Sub_InputMethod_IME_ShowTextInput_0200
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_ShowTextInput_0200', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().detach();
      await inputMethod.getController().attach(false, ATTRIBUTE);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ShowTextInput_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_ShowTextInput_0200 subscriberCallback data:" + JSON.stringify(data));
        if (data.data == "on_SUCCESS"){
          await sleep(100);
          await inputMethod.getController().showTextInput(1);
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0200 showTextInput success");
        }else {
          commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
          expect(data.data).assertEqual("SUCCESS");
          await inputMethod.getController().detach();
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0100 end");
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ShowTextInput_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_ShowTextInput_0200"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0200 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0200 subscriber finish");
        }catch(err){
          console.info(`====>subscriber failed, code:${err.code}, message is ${err.message}`);
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 271
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`);
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_ShowTextInput_0300
     * @tc.name    Sub_InputMethod_IME_ShowTextInput_0300
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_ShowTextInput_0300', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().detach();
      await inputMethod.getController().attach(false, ATTRIBUTE);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ShowTextInput_0300 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0300 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0300 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_ShowTextInput_0300 subscriberCallback data:" + JSON.stringify(data));
        if (data.data == "on_SUCCESS"){
          await sleep(100);
          await inputMethod.getController().showTextInput(2);
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0300 showTextInput success");
        }else {
          commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
          expect(data.data).assertEqual("SUCCESS");
          await inputMethod.getController().detach();
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0100 end");
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ShowTextInput_0300 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0300 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_ShowTextInput_0300"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0300 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0300 subscriber finish");
        }catch(err){
          console.info(`====>subscriber failed, code:${err.code}, message is ${err.message}`);
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 272
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`);
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_ShowTextInput_0400
     * @tc.name    Sub_InputMethod_IME_ShowTextInput_0400
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_ShowTextInput_0400', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().detach();
      await inputMethod.getController().attach(false, ATTRIBUTE);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ShowTextInput_0400 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0400 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0400 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_ShowTextInput_0400 subscriberCallback data:" + JSON.stringify(data));
        if (data.data == "on_SUCCESS"){
          await sleep(100);
          await inputMethod.getController().showTextInput(20);
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0400 showTextInput success");
        }else {
          commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
          expect(data.data).assertEqual("SUCCESS");
          await inputMethod.getController().detach();
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0100 end");
          done();
        }
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ShowTextInput_0400 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0400 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_ShowTextInput_0400"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0400 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_ShowTextInput_0400 subscriber finish");
        }catch(err){
          console.info(`====>subscriber failed, code:${err.code}, message is ${err.message}`);
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 273
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`);
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenAbnormal_0100
     * @tc.name    Sub_InputMethod_IME_FullScreenAbnormal_0100
     * @tc.desc    adjustPanelRect(),parameter FullScreenAbnormal ,Rect is null
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenAbnormal_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0100 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        runCmd();
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenAbnormal_0100"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0100 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0100 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 280
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenAbnormal_0200
     * @tc.name    Sub_InputMethod_IME_FullScreenAbnormal_0200
     * @tc.desc    adjustPanelRect(),parameter FullScreenAbnormal is false ,Rect is null
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenAbnormal_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0200 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenAbnormal_0200"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0200 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0200 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 281
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenAbnormal_0500
     * @tc.name    Sub_InputMethod_IME_FullScreenAbnormal_0500
     * @tc.desc    adjustPanelRect(),parameter FullScreenAbnormal is false ,Rect oversize
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenAbnormal_0500', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0500 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0500 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0500 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0500 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0500 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0500 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0500 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0500 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenAbnormal_0500"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0500 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0500 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 282
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenAbnormal_0400
     * @tc.name    Sub_InputMethod_IME_FullScreenAbnormal_0400
     * @tc.desc    adjustPanelRect(),parameter FullScreenAbnormal is true ,inputRegion.length=5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenAbnormal_0400', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0400 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0400 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0400 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0400 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0400 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0400 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0400 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0400 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenAbnormal_0400"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0400 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0400 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 283
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenAbnormal_0300
     * @tc.name    Sub_InputMethod_IME_FullScreenAbnormal_0300
     * @tc.desc    adjustPanelRect(),parameter FullScreenAbnormal is true ,inputRegion;[]
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenAbnormal_0300', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0300 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0300 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0300 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0300 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0300 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0300 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0300 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0300 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenAbnormal_0300"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0300 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0300 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 284
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenAbnormal_1200
     * @tc.name    Sub_InputMethod_IME_FullScreenAbnormal_1200
     * @tc.desc    adjustPanelRect(),parameter FullScreenAbnormal is true ,flag:CANDIDATE(2)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenAbnormal_1200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1200 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenAbnormal_1200"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1200 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1200 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 285
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenAbnormal_0700
     * @tc.name    Sub_InputMethod_IME_FullScreenAbnormal_0700
     * @tc.desc    adjustPanelRect(),parameter FullScreenAbnormal is false ,flag:0,AvoidY>70%
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenAbnormal_0700', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0700 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0700 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0700 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0700 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0700 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0700 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0700 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0700 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenAbnormal_0700"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0700 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0700 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 286
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenAbnormal_0600
     * @tc.name    Sub_InputMethod_IME_FullScreenAbnormal_0600
     * @tc.desc    adjustPanelRect(),parameter FullScreenAbnormal is true ,flag:0,AvoidY>70%
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenAbnormal_0600', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0600 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0600 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0600 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0600 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0600 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0600 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0600 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0600 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenAbnormal_0600"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0600 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0600 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 287
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenAbnormal_0800
     * @tc.name    Sub_InputMethod_IME_FullScreenAbnormal_0800
     * @tc.desc    adjustPanelRect(),parameter FullScreenAbnormal is true ,flag:1,AvoidY>100%
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenAbnormal_0800', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0800 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0800 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0800 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0800 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0800 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0800 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0800 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0800 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenAbnormal_0800"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0800 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0800 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 288
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenAbnormal_0900
     * @tc.name    Sub_InputMethod_IME_FullScreenAbnormal_0900
     * @tc.desc    adjustPanelRect(),parameter FullScreenAbnormal is false ,flag:1,AvoidY>100%
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenAbnormal_0900', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0900 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0900 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0900 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0900 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0900 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0900 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0900 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0900 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenAbnormal_0900"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0900 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_0900 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 289
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenAbnormal_1000
     * @tc.name    Sub_InputMethod_IME_FullScreenAbnormal_1000
     * @tc.desc    adjustPanelRect(),parameter FullScreenAbnormal is FALSR,AvoidY>panel.height
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenAbnormal_1000', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1000 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1000 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1000 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1000 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1000 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1000 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1000 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1000 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenAbnormal_1000"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1000 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1000 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 290
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenUR_0200
     * @tc.name    Sub_InputMethod_IME_FullScreenUR_0200
     * @tc.desc    updateRegion(),parameter PanelFlag:CANDIDATE(2)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenUR_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0200 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenUR_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenUR_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenUR_0200"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0200 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0200 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 291
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenUR_0300
     * @tc.name    Sub_InputMethod_IME_FullScreenUR_0300
     * @tc.desc    updateRegion(),parameter is []
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenUR_0300', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0300 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0300 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0300 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0300 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenUR_0300 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenUR_0300 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0300 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0300 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenUR_0300"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0300 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0300 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 292
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenUR_0400
     * @tc.name    Sub_InputMethod_IME_FullScreenUR_0400
     * @tc.desc    updateRegion(),parameter Region.length=5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenUR_0400', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0400 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0400 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0400 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0400 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenUR_0400 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenUR_0400 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0400 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0400 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenUR_0400"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0400 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0400 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 293
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });


    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenAbnormal_1100
     * @tc.name    Sub_InputMethod_IME_FullScreenAbnormal_1100
     * @tc.desc    adjustPanelRect(),parameter PanelType is STATUS_BAR
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenAbnormal_1100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1100 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenAbnormal_1100"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1100 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenAbnormal_1100 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 295
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenUR_0100
     * @tc.name    Sub_InputMethod_IME_FullScreenUR_0100
     * @tc.desc    updateRegion(),parameter PanelType is STATUS_BAR
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenUR_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0100 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenUR_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenUR_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenUR_0100"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0100 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0100 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 296
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_FullScreenUR_0700
     * @tc.name    Sub_InputMethod_IME_FullScreenUR_0700
     * @tc.desc    updateRegion(),parameter oversize
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_FullScreenUR_0700', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0700 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0700 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0700 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0700 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_FullScreenUR_0700 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_FullScreenUR_0700 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_FullScreenUR_0700 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0700 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_FullScreenUR_0700"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0700 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_FullScreenUR_0700 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 294
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Immersive_1200
     * @tc.name    Sub_InputMethod_IME_Immersive_1200
     * @tc.desc    getImmersiveMode()
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Immersive_1200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Immersive_1200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Immersive_1200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Immersive_1200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Immersive_1200 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_Immersive_1200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_Immersive_1200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        runCmd();
        console.info("====>Sub_InputMethod_IME_Immersive_1200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Immersive_1200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Immersive_1200"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Immersive_1200 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Immersive_1200 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 300
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Immersive_0900
     * @tc.name    Sub_InputMethod_IME_Immersive_0900
     * @tc.desc    setImmersiveMode(0)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Immersive_0900', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Immersive_0900 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Immersive_0900 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Immersive_0900 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Immersive_0900 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_Immersive_0900 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_Immersive_0900 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Immersive_0900 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Immersive_0900 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Immersive_0900"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Immersive_0900 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Immersive_0900 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 297
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Immersive_1000
     * @tc.name    Sub_InputMethod_IME_Immersive_1000
     * @tc.desc    setImmersiveMode(2)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Immersive_1000', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Immersive_1000 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Immersive_1000 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Immersive_1000 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Immersive_1000 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_Immersive_1000 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_Immersive_1000 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Immersive_1000 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Immersive_1000 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Immersive_1000"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Immersive_1000 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Immersive_1000 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 298
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Immersive_1100
     * @tc.name    Sub_InputMethod_IME_Immersive_1100
     * @tc.desc    setImmersiveMode(3)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Immersive_1100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Immersive_1100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Immersive_1100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Immersive_1100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Immersive_1100 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_Immersive_1100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_Immersive_1100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Immersive_1100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Immersive_1100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Immersive_1100"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Immersive_1100 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Immersive_1100 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 299
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_Immersive_0500
     * @tc.name    Sub_InputMethod_IME_Immersive_0500
     * @tc.desc    setImmersiveMode(1)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_Immersive_0500', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Immersive_0500 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Immersive_0500 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_Immersive_0500 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_Immersive_0500 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_Immersive_0500 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_Immersive_0500 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_Immersive_0500 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_Immersive_0500 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_Immersive_0500"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_Immersive_0500 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_Immersive_0500 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 301
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_createPanelCallback_0011
    * @tc.name    Sub_Misc_inputMethod_Panel_createPanelCallback_0011
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_createPanelCallback_0011', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0011 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0011 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0011 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0011 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0011 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0011 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0011 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0011 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_createPanelCallback_0011']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0011 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0011 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 310
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_createPanelPromise_0021
    * @tc.name    Sub_Misc_inputMethod_Panel_createPanelPromise_0021
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_createPanelPromise_0021', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0021 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0021 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0021 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0021 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0021 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0021 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0021 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0021 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_createPanelPromise_0021']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0021 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0021 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 320
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031
    * @tc.name    Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 330
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041
    * @tc.name    Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 340
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_setUiContentCallback_0051
    * @tc.name   Sub_Misc_inputMethod_Panel_setUiContentCallback_0051
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_setUiContentCallback_0051', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_setUiContentCallback_0051']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 350
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_setUiContentPromise_0061
    * @tc.name   Sub_Misc_inputMethod_Panel_setUiContentPromise_0061
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_setUiContentPromise_0061', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_setUiContentPromise_0061']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 360
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_setUiContentCallback_0071
    * @tc.name   Sub_Misc_inputMethod_Panel_setUiContentCallback_0071
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_setUiContentCallback_0071', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_setUiContentCallback_0071']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 370
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_setUiContentPromise_0081
    * @tc.name   Sub_Misc_inputMethod_Panel_setUiContentPromise_0081
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_setUiContentPromise_0081', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_setUiContentPromise_0081']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 380
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_resizeCallback_0091
    * @tc.name   Sub_Misc_inputMethod_Panel_resizeCallback_0091
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_resizeCallback_0091', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0091 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_resizeCallback_0091 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0091 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0091 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0091 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0091 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0091 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0091 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_resizeCallback_0091']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0091 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0091 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 390
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_resizePromise_0101
    * @tc.name   Sub_Misc_inputMethod_Panel_resizePromise_0101
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_resizePromise_0101', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0101 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_resizePromise_0101 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0101 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0101 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0101 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0101 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0101 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0101 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_resizePromise_0101']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0101 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0101 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 400
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_moveToCallback_0111
    * @tc.name   Sub_Misc_inputMethod_Panel_moveToCallback_0111
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_moveToCallback_0111', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0111 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_moveToCallback_0111 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0111 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0111 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0111 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0111 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0111 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0111 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_moveToCallback_0111']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0111 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0111 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 410
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_moveToPromise_0121
    * @tc.name   Sub_Misc_inputMethod_Panel_moveToPromise_0121
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_moveToPromise_0121', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0121 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_moveToPromise_0121 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0121 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0121 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0121 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0121 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0121 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0121 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_moveToPromise_0121']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0121 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0121 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 420
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_changeFlag_0212
    * @tc.name  Sub_Misc_inputMethod_Panel_changeFlag_0212
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_changeFlag_0212', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0212 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_changeFlag_0212 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0212 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0212 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0212 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0212 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0212 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0212 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_changeFlag_0212']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0212 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0212 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 430
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IME_ScreenRotation_0101
     * @tc.name    Sub_InputMethod_IME_ScreenRotation_0101
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_ScreenRotation_0101', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ScreenRotation_0101 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0101 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0101 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IME_ScreenRotation_0101 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_ScreenRotation_0101 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_ScreenRotation_0101 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_ScreenRotation_0101 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0101 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_ScreenRotation_0101"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0101 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_ScreenRotation_0101 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 440
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  SUB_InputMethod_IsTextPreviewSupport_0101
     * @tc.name    SUB_InputMethod_IsTextPreviewSupport_0101
     * @tc.desc    12800011
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('SUB_InputMethod_IsTextPreviewSupport_0101', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0101 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0101 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0101 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0101 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0101 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0101 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        runCmd();
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0101 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0101 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_InputMethod_IsTextPreviewSupport_0101"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0101 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0101 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 450
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  SUB_InputMethod_IsTextPreviewSupport_0201
     * @tc.name    SUB_InputMethod_IsTextPreviewSupport_0201
     * @tc.desc    12800011
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('SUB_InputMethod_IsTextPreviewSupport_0201', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0201 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0201 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0201 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0201 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0201 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0201 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0201 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0201 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_InputMethod_IsTextPreviewSupport_0201"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0201 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0201 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 460
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  SUB_InputMethod_IsTextPreviewSupport_0301
     * @tc.name    SUB_InputMethod_IsTextPreviewSupport_0301
     * @tc.desc    12800011
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('SUB_InputMethod_IsTextPreviewSupport_0301', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0301 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0301 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0301 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0301 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0301 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0301 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0301 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0301 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_InputMethod_IsTextPreviewSupport_0301"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0301 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0301 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 470
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  SUB_InputMethod_IsTextPreviewSupport_0401
     * @tc.name    SUB_InputMethod_IsTextPreviewSupport_0401
     * @tc.desc    12800011
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('SUB_InputMethod_IsTextPreviewSupport_0401', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0401 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0401 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0401 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0401 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0401 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0401 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0401 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0401 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_InputMethod_IsTextPreviewSupport_0401"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0401 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0401 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 480
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  SUB_InputMethod_IME_SplitScreen_0101
     * @tc.name    SUB_InputMethod_IME_SplitScreen_0101
     * @tc.desc    12800012
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('SUB_InputMethod_IME_SplitScreen_0101', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IME_SplitScreen_0101 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IME_SplitScreen_0101 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_InputMethod_IME_SplitScreen_0101 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>SUB_InputMethod_IME_SplitScreen_0101 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_InputMethod_IME_SplitScreen_0101 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_IME_SplitScreen_0101 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        runCmd();
        console.info("====>SUB_InputMethod_IME_SplitScreen_0101 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IME_SplitScreen_0101 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_InputMethod_IME_SplitScreen_0101"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>SUB_InputMethod_IME_SplitScreen_0101 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_InputMethod_IME_SplitScreen_0101 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 490
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100
     * @tc.name    Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100
     * @tc.desc    on callingDisplayDidChange
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        runCmd();
        console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 502
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.number  Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200
     * @tc.name    Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200
     * @tc.desc    off callingDisplayDidChange()
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200"]
      }
      let subscriber:ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 503
          }
          commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

  });
};

/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import inputMethod from '@ohos.inputMethod';
import inputMethodEngine from '@ohos.inputMethodEngine';
import subtype from '@ohos.InputMethodSubtype';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import display from '@ohos.display';
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';
import deviceinfo from '@ohos.deviceInfo';
import { Driver, ON, MatchPattern, Component, UiWindow, DisplayRotation, Rect } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import { util } from '@kit.ArkTS';

export default function InputMethodEditBoxAbility() {
  describe('InputMethodEditBoxTest', () => {
    let driver = Driver.create();
    let textArea1: Component;
    let textArea2: Component;
    let textArea3: Component;
    let textArea4: Component;
    let textArea5: Component;
    let textArea6: Component;
    let textArea7: Component;
    let textArea8: Component;
    let textArea9: Component;
    let textArea10: Component;
    let rectInfo: Rect;
    const delegator:AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

    beforeAll(async (done: Function) => {
      console.info('====>beforeAll inputMethod_enable start!')
      try {
        await delegator.executeShellCommand('ime -e com.acts.inputmethodeditbox.test -f');
        await delegator.executeShellCommand('ime -s com.acts.inputmethodeditbox.test');
        console.info('====>beforeAll inputMethod_enable success');
        await driver.delayMs(1000);
        let scroll = await driver.findComponent(ON.id('Column1'));
        console.info('====>beforeAll scrollSearch success');
        textArea1 = await scroll.scrollSearch(ON.id('TextArea1'));
        console.info(`====>TextArea1 is: ${JSON.stringify(textArea1)}`);
        textArea2 = await scroll.scrollSearch(ON.id('TextArea2'));
        console.info(`====>TextArea2 is: ${JSON.stringify(textArea2)}`);
        textArea3 = await scroll.scrollSearch(ON.id('TextArea3'));
        console.info(`====>TextArea3 is: ${JSON.stringify(textArea3)}`);
        textArea4 = await scroll.scrollSearch(ON.id('TextArea4'));
        console.info(`====>TextArea4 is: ${JSON.stringify(textArea4)}`);
        textArea5 = await scroll.scrollSearch(ON.id('TextArea5'));
        console.info(`====>TextArea5 is: ${JSON.stringify(textArea5)}`);
        textArea6 = await scroll.scrollSearch(ON.id('TextArea6'));
        console.info(`====>TextArea6 is: ${JSON.stringify(textArea6)}`);
        textArea7 = await scroll.scrollSearch(ON.id('TextArea7'));
        console.info(`====>TextArea7 is: ${JSON.stringify(textArea7)}`);
        textArea8 = await scroll.scrollSearch(ON.id('TextArea8'));
        console.info(`====>TextArea8 is: ${JSON.stringify(textArea8)}`);
        textArea9 = await scroll.scrollSearch(ON.id('TextArea9'));
        console.info(`====>TextArea9 is: ${JSON.stringify(textArea9)}`);
        textArea10 = await scroll.scrollSearch(ON.id('TextArea10'));
        console.info(`====>TextArea10 is: ${JSON.stringify(textArea10)}`);
        done();
      } catch (err) {
        console.info('====>beforeAll throw err:' + JSON.stringify(err.message));
        done();
      }
    })

    afterEach(async (done: Function) => {
      try {
        await inputMethod.getController().detach();
        console.info('====>afterEach detach success');
        done();
      } catch (err) {
        console.info(`====>afterEach throw err: ${JSON.stringify(err.message)}`);
        done();
      }
    })

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0800
     * @tc.number Sub_InputMethod_extraConfig_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_InputMethod_extraConfig_0800', Level.LEVEL2, async (done: Function) => {
      await textArea1.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0800 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0800 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0800 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0800 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0800 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0800 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0800 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0800 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0800']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0800 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0800 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 10
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0900
     * @tc.number Sub_InputMethod_extraConfig_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_InputMethod_extraConfig_0900', Level.LEVEL2, async (done: Function) => {
      await textArea2.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0900 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0900 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0900 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0900 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0900 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0900 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0900 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0900 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0900']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0900 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0900 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 20
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0700
     * @tc.number Sub_InputMethod_extraConfig_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_InputMethod_extraConfig_0700', Level.LEVEL2, async (done: Function) => {
      await textArea3.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0700 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0700 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0700 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0700 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0700 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0700 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0700 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0700 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0700']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0700 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0700 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 30
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_1000
     * @tc.number Sub_InputMethod_extraConfig_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_InputMethod_extraConfig_1000', Level.LEVEL2, async (done: Function) => {
      await textArea4.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_1000 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_1000 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_1000 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_1000 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_1000 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_1000 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_1000 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_1000 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_1000']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_1000 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_1000 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 40
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0500
     * @tc.number Sub_InputMethod_extraConfig_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_extraConfig_0500', Level.LEVEL2, async (done: Function) => {
      await textArea5.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0500 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0500 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0500 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0500 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0500 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0500 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0500 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0500 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0500']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0500 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0500 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 50
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0600
     * @tc.number Sub_InputMethod_extraConfig_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_InputMethod_extraConfig_0600', Level.LEVEL2, async (done: Function) => {
      await textArea6.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0600 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0600 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0600 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0600 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0600 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0600 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0600 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0600 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0600']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0600 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0600 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 60
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0100
     * @tc.number Sub_InputMethod_extraConfig_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_InputMethod_extraConfig_0100', Level.LEVEL2, async (done: Function) => {
      await textArea7.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0100 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0100 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0100']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0100 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0100 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 70
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0300
     * @tc.number Sub_InputMethod_extraConfig_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_extraConfig_0300', Level.LEVEL2, async (done: Function) => {
      await textArea8.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0300 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0300 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0300 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0300 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0300 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0300 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0300 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0300 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0300']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0300 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0300 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 80
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0200
     * @tc.number Sub_InputMethod_extraConfig_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_InputMethod_extraConfig_0200', Level.LEVEL2, async (done: Function) => {
      await textArea9.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0200 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0200 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0200']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0200 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0200 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 90
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
     * @tc.name   Sub_InputMethod_extraConfig_0400
     * @tc.number Sub_InputMethod_extraConfig_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_extraConfig_0400', Level.LEVEL2, async (done: Function) => {
      await textArea10.click();
      await driver.delayMs(1000);

      let unSubscriberCallback = (err: BusinessError) => {
        console.info('====>Sub_InputMethod_extraConfig_0400 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_extraConfig_0400 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0400 unSubscriberCallback finsh');
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info('====>Sub_InputMethod_extraConfig_0400 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_extraConfig_0400 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_extraConfig_0400 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info('====>Sub_InputMethod_extraConfig_0400 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_extraConfig_0400 success ====');
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Sub_InputMethod_extraConfig_0400']
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try{
          subscriber = data;
          console.info('====>Sub_InputMethod_extraConfig_0400 subscribe data: ' + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info('====>Sub_InputMethod_extraConfig_0400 subscribe finish====');
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 100
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commonEventManager.publish('InputMethodEditBoxTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });


  });
};
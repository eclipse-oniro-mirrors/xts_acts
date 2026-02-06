/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import commoneventmanager from '@ohos.commonEventManager';
import inputMethod from '@ohos.inputMethod';
import { Driver, ON, MatchPattern, Component, UiWindow, Rect } from '@ohos.UiTest'
import deviceinfo from '@ohos.deviceInfo';
import { BusinessError } from '@ohos.base'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function inputMethodEngineJSUnit() {
  describe('inputMethodEngine', () => {
    let driver = Driver.create();
    let textArea: Component;
    let rectInfo: Rect;
    const delegator:AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

    let testTemplate: (testName: string, code: number, done: Function, beforePublish?: () => Promise<void>,
      afterPublish?: () => Promise<void>) => void =
      async (testName, code, done, beforePublish, afterPublish) => {

        let unSubscriberCallback = (err: BusinessError) => {
          console.info(`====>${testName} unSubscriberCallback start`);
          if (err) {
            console.info(`====>${testName} unSubscriberCallback failed: ${JSON.stringify(err)}`);
          } else {
            console.info(`====>${testName} unSubscriberCallback finish`)
          }
        }

        let subscriberCallback = (err: BusinessError, data: ESObject) => {
          console.info(`====>${testName} subscriberCallback data: ${JSON.stringify(data)}`);
          commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
          let t = setTimeout(() => {
            try {
              expect(data.data).assertEqual("SUCCESS");
              console.info(`====>${testName} end`);
              clearTimeout(t);
              done();
            } catch (err) {
              console.info(`====>${testName} err: ${JSON.stringify(err)}`);
              clearTimeout(t);
              done();
            }
          }, 500)
        }

        let publishCallback = (err: BusinessError) => {
          console.info(`====>${testName} publishCallback start`);
          if (err) {
            console.info(`====>${testName} publishCallback failed: ${JSON.stringify(err)}`);
          }
        }

        let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
          events: [testName]
        }
        let subscriber: ESObject;
        commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(async (data) => {
          try {
            subscriber = data;
            console.info(`====>${testName} subscriber data: ${JSON.stringify(data)}`)
            commoneventmanager.subscribe(subscriber, subscriberCallback);
            console.info(`====>${testName} subscriber finish`);
          } catch (err) {
            console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
          }

          await beforePublish?.();

          let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
            code: code
          }
          let t = setTimeout(async () => {
            clearTimeout(t);
            commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);

            afterPublish?.();
          }, 500)
        }).catch((err: BusinessError) => {
          console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
        })
      };

    beforeAll(async (done: Function) => {
      console.info('====>beforeAll inputMethod_enable start!')
      try {
        await delegator.executeShellCommand('ime -e com.acts.inputmethodengine.test -f');
        await delegator.executeShellCommand('ime -s com.acts.inputmethodengine.test');
        console.info('====>beforeAll inputMethod_enable success');
        await driver.delayMs(1000);
        textArea = await driver.findComponent(ON.type('TextArea'));
        console.info('====>beforeAll inputMethodSwitch window textArea: ' + JSON.stringify(textArea));
        rectInfo = await textArea.getBounds();
        console.info('====>beforeAll inputMethodSwitch textArea rectInfo: ' + JSON.stringify(rectInfo));
        await driver.delayMs(1000);
        await runCmd();
        await driver.delayMs(1000);
        done();
      } catch (err) {
        console.info('====>beforeAll throw err:' + JSON.stringify(err.message))
        done();
      }
    })

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterAll(async (done: Function) => {
      done();
    })

    let runCmd = async () => {
      let cursor_x = rectInfo.left + 20 + Math.floor(Math.random() * (rectInfo.right - rectInfo.left) * 0.7);
      let cursor_y = rectInfo.top + 20 + Math.floor(Math.random() * (rectInfo.bottom - rectInfo.top) * 0.7);
      console.info(`====>start click x: ${cursor_x}  y: ${cursor_y}`)
      await driver.click(cursor_x, cursor_y)
    }

    /*
    * @tc.number  inputMethodEngine_test_getInputMethodEngine_001
    * @tc.name   inputMethodEngine_test_getInputMethodEngine_001
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level0
    */
    it('inputMethodEngine_test_getInputMethodEngine_001', Level.LEVEL0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_getInputMethodEngine_001 unSubscriberCallback start");
        if (err) {
          console.error("====>inputMethodEngine_test_getInputMethodEngine_001 unSubscriberCallback failed: " +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_getInputMethodEngine_001 unSubscriberCallback finsh");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_getInputMethodEngine_001 subscriberCallback data: " +
        JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_getInputMethodEngine_001 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_getInputMethodEngine_001 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info("====>inputMethodEngine_test_getInputMethodEngine_001 end<====" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_getInputMethodEngine_001"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_getInputMethodEngine_001 subscribe data: " + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_getInputMethodEngine_001 subscribe finish====");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 1
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_getKeyboardDelegate_001
    * @tc.name   inputMethodEngine_test_getKeyboardDelegate_001
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_getKeyboardDelegate_001', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 unSubscriberCallback start");
        if (err) {
          console.error("====>inputMethodEngine_test_getKeyboardDelegate_001 unSubscriberCallback failed: " +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 unSubscriberCallback finsh");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 subscriberCallback data: " +
        JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 end<====");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 end<====" + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        if (err) {
          console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 end<====" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_getKeyboardDelegate_001"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 subscribe data: " + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 subscribe finish====");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 2
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_028
    * @tc.name   inputMethodEngine_test_028
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_028', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_028 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_028 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_028 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_028 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_028 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_028 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_028 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_028 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_028"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_028 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_028 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 28
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_029
    * @tc.name   inputMethodEngine_test_029
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_029', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_029 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_029 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_029 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_029 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_029 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_029 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_029 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_029 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_029"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_029 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_029 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 29
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_030
    * @tc.name   inputMethodEngine_test_030
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_030', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_030 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_030 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_030 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_030 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_030 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_030 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_030 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_030 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_030"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_030 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_030 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 30
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_031
    * @tc.name   inputMethodEngine_test_031
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_031', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_031 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_031 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_031 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_031 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_031 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_031 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_031 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_031 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_031"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_031 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_031 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 31
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_032
    * @tc.name   inputMethodEngine_test_032
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_032', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_032 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_032 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_032 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_032 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_032 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_032 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_032 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_032 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_032"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_032 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_032 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 32
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_033
    * @tc.name   inputMethodEngine_test_033
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_033', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_033 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_033 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_033 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_033 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_033 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_033 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_033 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_033 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_033"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_033 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_033 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 33
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_034
    * @tc.name   inputMethodEngine_test_034
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_034', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_034 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_034 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_034 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_034 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_034 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_034 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_034 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_034 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_034"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_034 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_034 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 34
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_035
    * @tc.name   inputMethodEngine_test_035
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_035', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_035 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_035 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_035 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_035 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_035 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_035 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_035 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_035 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_035"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_035 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_035 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 35
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_036
    * @tc.name   inputMethodEngine_test_036
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_036', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_036 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_036 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_036 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_036 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_036 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_036 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_036 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_036 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_036"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_036 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_036 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 36
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_037
    * @tc.name   inputMethodEngine_test_037
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_037', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_037 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_037 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_037 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_037 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_037 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_037 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_037 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_037 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_037"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_037 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_037 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 37
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_038
    * @tc.name   inputMethodEngine_test_038
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_038', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_038 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_038 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_038 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_038 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_038 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_038 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_038 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_038 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_038"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_038 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_038 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 38
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_039
    * @tc.name   inputMethodEngine_test_039
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_039', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_039 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_039 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_039 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_039 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_039 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_039 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_039 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_039 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_039"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_039 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_039 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 39
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_040
    * @tc.name   inputMethodEngine_test_040
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_040', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_040 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_040 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_040 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_040 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_040 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_040 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_040 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_040 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_040"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_040 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_040 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 40
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_041
    * @tc.name   inputMethodEngine_test_041
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_041', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_041 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_041 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_041 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_041 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_041 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_041 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_041 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_041 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_041"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_041 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_041 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 41
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_042
    * @tc.name   inputMethodEngine_test_042
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_042', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_042 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_042 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_042 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_042 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_042 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_042 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_042 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_042 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_042"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_042 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_042 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 42
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
     * @tc.number  inputMethodEngine_test_043
     * @tc.name   inputMethodEngine_test_043
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('inputMethodEngine_test_043', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_043 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_043 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_043 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_043 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_043 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_043 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_043 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_043 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_043"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_043 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_043 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 43
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_049
    * @tc.name   inputMethodEngine_test_049
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_049', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_049 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_049 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_049 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_049 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_049 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_049 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_049 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_049 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_049"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_049 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_049 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 49
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_050
    * @tc.name   inputMethodEngine_test_050
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_050', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_050 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_050 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_050 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_050 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_050 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_050 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_050 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_050 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_050"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_050 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_050 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 50
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_071
    * @tc.name   inputMethodEngine_test_071
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_071', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_071 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_071 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_071 unSubscriberCallback finish")
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_071 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_071 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_071 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_071 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_071 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_071"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_071 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_071 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 71
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_072
    * @tc.name   inputMethodEngine_test_072
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_072', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_072 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_072 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_072 unSubscriberCallback finish")
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_072 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_072 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_072 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_072 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_072 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(() => {
            runCmd();
            clearTimeout(t)
          }, 200)
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_072"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_072 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_072 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 72
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_073
    * @tc.name   inputMethodEngine_test_073
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_073', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_073 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_073 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_073 unSubscriberCallback finish")
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_073 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_073 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_073 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 2000)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_073 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_073 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(() => {
            runCmd();
            clearTimeout(t);
          }, 200)
          let t1 = setTimeout(async () => {
            let result = await delegator.executeShellCommand(`uinput -K -d 2000 -u 2000`);
            console.info("====>inputMethodEngine_test_073 executeShellCommand success: " + JSON.stringify(result));
            clearTimeout(t1);
          }, 400)
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_073"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_073 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_073 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 73
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_074
    * @tc.name   inputMethodEngine_test_074
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_074', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_074 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_074 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_074 unSubscriberCallback finish")
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_074 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_074 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_074 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_074 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_074 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd();
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_074"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_074 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_074 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 74
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_076
    * @tc.name   inputMethodEngine_test_076
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_076', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_076 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_076 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_076 unSubscriberCallback finish")
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_076 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_076 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_076 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_076 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_076 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(() => {
            runCmd();
            clearTimeout(t)
          }, 200)
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_076"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodEngine_test_076 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_076 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 76
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodEngine_test_077
    * @tc.name   inputMethodEngine_test_077
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_077', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_077 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_077 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_077 unSubscriberCallback finish")
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodEngine_test_077 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodEngine_test_077 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodEngine_test_077 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodEngine_test_077 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_077 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_077"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        try {
          console.info("====>inputMethodEngine_test_077 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodEngine_test_077 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 77
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_InputMethod_IME_VisualInput_0500
    * @tc.name   Sub_InputMethod_IME_VisualInput_0500
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IME_VisualInput_0500', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_VisualInput_0500 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_VisualInput_0500 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_VisualInput_0500 unSubscriberCallback finish")
        }

      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_VisualInput_0500 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(async () => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_VisualInput_0500 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_VisualInput_0500 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_VisualInput_0500 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_VisualInput_0500 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_VisualInput_0500"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_VisualInput_0500 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_VisualInput_0500 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 78
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_InputMethod_IME_VisualInput_0600
    * @tc.name   Sub_InputMethod_IME_VisualInput_0600
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IME_VisualInput_0600', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_VisualInput_0600 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_VisualInput_0600 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_VisualInput_0600 unSubscriberCallback finish")
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IME_VisualInput_0600 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IME_VisualInput_0600 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IME_VisualInput_0600 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IME_VisualInput_0600 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_VisualInput_0600 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_VisualInput_0600"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IME_VisualInput_0600 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IME_VisualInput_0600 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 79
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 80
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendKeyFunction_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 81
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 82
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteForward_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 83
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_insertText_0100
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_insertText_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_insertText_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_insertText_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0100 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 84
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_insertText_0200
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_insertText_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_insertText_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_insertText_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0200 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_insertText_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 85
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_getForward_0100
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_getForward_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_getForward_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_getForward_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0100 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 86
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_getForward_0200
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_getForward_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_getForward_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_getForward_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0200 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getForward_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 87
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_getBackward_0100
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_getBackward_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_getBackward_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_getBackward_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0100 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 88
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_getBackward_0200
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_getBackward_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_getBackward_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_getBackward_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0200 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_getBackward_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 89
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 90
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_moveCursor_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 91
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 92
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByRange_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 93
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 94
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_selectByMovement_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 95
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendPrivateCommand_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 98
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_InputMethod_IMF_SecurityKeyboard_0601
    * @tc.name    Sub_InputMethod_IMF_SecurityKeyboard_0601
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_SecurityKeyboard_0601', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IMF_SecurityKeyboard_0601 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IMF_SecurityKeyboard_0601 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IMF_SecurityKeyboard_0601 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_InputMethod_IMF_SecurityKeyboard_0601 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_InputMethod_IMF_SecurityKeyboard_0601 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_InputMethod_IMF_SecurityKeyboard_0601 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_InputMethod_IMF_SecurityKeyboard_0601 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IMF_SecurityKeyboard_0601 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IMF_SecurityKeyboard_0601"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_InputMethod_IMF_SecurityKeyboard_0601 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_InputMethod_IMF_SecurityKeyboard_0601 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 99
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 100
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_deleteBackward_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 101
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  SUB_InputMethod_IME_PrivateDateTransferred_1101
    * @tc.name    SUB_InputMethod_IME_PrivateDateTransferred_1101
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_InputMethod_IME_PrivateDateTransferred_1101', Level.LEVEL2, async (done: Function) => {
      testTemplate('SUB_InputMethod_IME_PrivateDateTransferred_1101', 102, done);
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 96
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /**
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200
    * @tc.name    Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200 subscriber data:" + JSON.stringify(data))
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethodEngine_InputClient_sendExtendAction_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
          code: 97
        }
        let t = setTimeout(async () => {
          clearTimeout(t);
          commoneventmanager.publish('inputMethodEngineTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0100
    * @tc.name   Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0100', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          }
        }
        inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
      }

      testTemplate('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0100', 103, done, beforePublish);
    });

    /*
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0200
    * @tc.name   Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0200', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          }
        }
        inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.MOUSE);
      }

      testTemplate('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0200', 104, done, beforePublish);
    });

    /*
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0300
    * @tc.name   Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0300
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0300', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          }
        }
        inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.TOUCH);
      }

      testTemplate('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0300', 105, done, beforePublish);
    });

    /*
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0400
    * @tc.name   Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0400
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0400', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          }
        }
        inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.OTHER);
      }

      testTemplate('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0400', 106, done, beforePublish);
    });

    /*
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0500
    * @tc.name   Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0500
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0500', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          }
        }
        await inputMethod.getController().attach(false, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        inputMethod.getController().showTextInput(inputMethod.RequestKeyboardReason.NONE);
      }

      testTemplate('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0500', 111, done, beforePublish);
    });

    /*
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0600
    * @tc.name   Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0600
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0600', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          }
        }
        await inputMethod.getController().attach(false, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        inputMethod.getController().showTextInput(inputMethod.RequestKeyboardReason.MOUSE);
      }

      testTemplate('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0600', 112, done, beforePublish);
    });

    /*
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0700
    * @tc.name   Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0700
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0700', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          }
        }
        await inputMethod.getController().attach(false, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        inputMethod.getController().showTextInput(inputMethod.RequestKeyboardReason.TOUCH);
      }

      testTemplate('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0700', 113, done, beforePublish);
    });

    /*
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0800
    * @tc.name   Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0800
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0800', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          }
        }
        await inputMethod.getController().attach(false, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        inputMethod.getController().showTextInput(inputMethod.RequestKeyboardReason.OTHER);
      }

      testTemplate('Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_0800', 114, done, beforePublish);
    });

    /*
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_onAttachOptionsDidChange_0100
    * @tc.name   Sub_Misc_inputMethodEngine_InputClient_onAttachOptionsDidChange_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_onAttachOptionsDidChange_0100', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let beforePublish = async () => {
        await inputMethod.getController().detach();
        inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
      }

      let afterPublish = async () => {
        setTimeout(async () => {
          let inputMethodController = inputMethod.getController();
          await inputMethodController.detach();
          inputMethodController.attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.TOUCH);
        }, 100);
      }

      testTemplate('Sub_Misc_inputMethodEngine_InputClient_onAttachOptionsDidChange_0100', 107, done, beforePublish, afterPublish);
    });
    
    /*
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_onAttachOptionsDidChange_0200
    * @tc.name   Sub_Misc_inputMethodEngine_InputClient_onAttachOptionsDidChange_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_onAttachOptionsDidChange_0200', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let beforePublish = async () => {
        await inputMethod.getController().detach();
        inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
      }

      let afterPublish = async () => {
        setTimeout(async () => {
          let inputMethodController = inputMethod.getController();
          await inputMethodController.detach();
          inputMethodController.attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.TOUCH);
        }, 100);
      }

      testTemplate('Sub_Misc_inputMethodEngine_InputClient_onAttachOptionsDidChange_0200', 108, done, beforePublish, afterPublish);
    });
    
    /*
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_offAttachOptionsDidChange_0100
    * @tc.name   Sub_Misc_inputMethodEngine_InputClient_offAttachOptionsDidChange_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_offAttachOptionsDidChange_0100', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let beforePublish = async () => {
        await inputMethod.getController().detach();
        inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
      }

      let afterPublish = async () => {
        setTimeout(async () => {
          let inputMethodController = inputMethod.getController();
          await inputMethodController.detach();
          inputMethodController.attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.TOUCH);
        }, 100);
        
        setTimeout(async () => {
          let inputMethodController = inputMethod.getController();
          await inputMethodController.detach();
          inputMethodController.attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.MOUSE);
        }, 300);
      }

      testTemplate('Sub_Misc_inputMethodEngine_InputClient_offAttachOptionsDidChange_0100', 109, done, beforePublish, afterPublish);
    });
    
    /*
    * @tc.number  Sub_Misc_inputMethodEngine_InputClient_offAttachOptionsDidChange_0200
    * @tc.name   Sub_Misc_inputMethodEngine_InputClient_offAttachOptionsDidChange_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_InputClient_offAttachOptionsDidChange_0200', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let beforePublish = async () => {
        await inputMethod.getController().detach();
        inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
      }

      let afterPublish = async () => {
        setTimeout(async () => {
          let inputMethodController = inputMethod.getController();
          await inputMethodController.detach();
          inputMethodController.attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.TOUCH);
        }, 100);
        
        setTimeout(async () => {
          let inputMethodController = inputMethod.getController();
          await inputMethodController.detach();
          inputMethodController.attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.MOUSE);
        }, 300);
      }

      testTemplate('Sub_Misc_inputMethodEngine_InputClient_offAttachOptionsDidChange_0200', 110, done, beforePublish, afterPublish);
    });

    /*
    * @tc.number  Sub_InputMethod_IMF_CapitalizeMode_0100
    * @tc.name    Sub_InputMethod_IMF_CapitalizeMode_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_CapitalizeMode_0100', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          },
          capitalizeMode: inputMethod.CapitalizeMode.NONE
        }
        await inputMethod.getController().attach(false, ATTRIBUTE);
      }

      testTemplate('Sub_InputMethod_IMF_CapitalizeMode_0100', 115, done, beforePublish);
    });

    /*
    * @tc.number  Sub_InputMethod_IMF_CapitalizeMode_0200
    * @tc.name    Sub_InputMethod_IMF_CapitalizeMode_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_CapitalizeMode_0200', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          },
          capitalizeMode: inputMethod.CapitalizeMode.SENTENCES
        }
        await inputMethod.getController().attach(false, ATTRIBUTE);
      }

      testTemplate('Sub_InputMethod_IMF_CapitalizeMode_0200', 116, done, beforePublish);
    });

    /*
    * @tc.number  Sub_InputMethod_IMF_CapitalizeMode_0300
    * @tc.name    Sub_InputMethod_IMF_CapitalizeMode_0300
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_CapitalizeMode_0300', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          },
          capitalizeMode: inputMethod.CapitalizeMode.WORDS
        }
        await inputMethod.getController().attach(false, ATTRIBUTE);
      }

      testTemplate('Sub_InputMethod_IMF_CapitalizeMode_0300', 117, done, beforePublish);
    });

    /*
    * @tc.number  Sub_InputMethod_IMF_CapitalizeMode_0400
    * @tc.name    Sub_InputMethod_IMF_CapitalizeMode_0400
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_CapitalizeMode_0400', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          },
          capitalizeMode: inputMethod.CapitalizeMode.CHARACTERS
        }
        await inputMethod.getController().attach(false, ATTRIBUTE);
      }

      testTemplate('Sub_InputMethod_IMF_CapitalizeMode_0400', 118, done, beforePublish);
    });

    /*
    * @tc.number  Sub_InputMethod_IMF_CapitalizeMode_0500
    * @tc.name    Sub_InputMethod_IMF_CapitalizeMode_0500
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_CapitalizeMode_0500', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          },
        }
        await inputMethod.getController().attach(false, ATTRIBUTE);
      }

      testTemplate('Sub_InputMethod_IMF_CapitalizeMode_0500', 119, done, beforePublish);
    });

    /*
    * @tc.number  Sub_InputMethod_IMF_Placeholder_0100
    * @tc.name    Sub_InputMethod_IMF_Placeholder_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_Placeholder_0100', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          },
        }
        await inputMethod.getController().attach(false, ATTRIBUTE);
      }

      testTemplate('Sub_InputMethod_IMF_Placeholder_0100', 120, done, beforePublish);
    });

    /*
    * @tc.number  Sub_InputMethod_IMF_Placeholder_0200
    * @tc.name    Sub_InputMethod_IMF_Placeholder_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_Placeholder_0200', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          },
        }
        let value: string = 'B';
        let placeholderValue = value.repeat(255);
        let abilityNameValue = value.repeat(127);
        ATTRIBUTE.inputAttribute.placeholder = placeholderValue;
        ATTRIBUTE.inputAttribute.abilityName = abilityNameValue;
        await inputMethod.getController().attach(false, ATTRIBUTE);
      }

      testTemplate('Sub_InputMethod_IMF_Placeholder_0200', 121, done, beforePublish);
    });

    /*
    * @tc.number  Sub_InputMethod_IMF_Placeholder_0300
    * @tc.name    Sub_InputMethod_IMF_Placeholder_0300
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_Placeholder_0300', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          },
        }
        let value: string = 'B';
        let placeholderValue = value.repeat(256);
        let abilityNameValue = value.repeat(127);
        ATTRIBUTE.inputAttribute.placeholder = placeholderValue;
        ATTRIBUTE.inputAttribute.abilityName = abilityNameValue;
        await inputMethod.getController().attach(false, ATTRIBUTE);
      }

      testTemplate('Sub_InputMethod_IMF_Placeholder_0300', 122, done, beforePublish);
    });

    /*
    * @tc.number  Sub_InputMethod_IMF_Placeholder_0400
    * @tc.name    Sub_InputMethod_IMF_Placeholder_0400
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_Placeholder_0400', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0
          },
        }
        let value: string = 'B';
        let placeholderValue = value.repeat(255);
        let abilityNameValue = value.repeat(128);
        ATTRIBUTE.inputAttribute.placeholder = placeholderValue;
        ATTRIBUTE.inputAttribute.abilityName = abilityNameValue;
        await inputMethod.getController().attach(false, ATTRIBUTE);
      }

      testTemplate('Sub_InputMethod_IMF_Placeholder_0400', 123, done, beforePublish);
    });

    /*
    * @tc.number  Sub_InputMethod_IMF_Placeholder_0600
    * @tc.name    Sub_InputMethod_IMF_Placeholder_0600
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_Placeholder_0600', Level.LEVEL2, async (done: Function) => {
      let beforePublish = async () => {
        await inputMethod.getController().detach();
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0, enterKeyType: 0, placeholder: undefined, abilityName: undefined
          },
        }
        await inputMethod.getController().attach(false, ATTRIBUTE);
      }

      testTemplate('Sub_InputMethod_IMF_Placeholder_0600', 124, done, beforePublish);
    });

    /*
    * @tc.number  Sub_InputMethod_IMF_DiscardTypingText_0300
    * @tc.name    Sub_InputMethod_IMF_DiscardTypingText_0300
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_DiscardTypingText_0300', Level.LEVEL2, async (done: Function) => {
      await inputMethod.getController().detach();
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        },
      }
      await inputMethod.getController().attach(false, ATTRIBUTE);
      runCmd();
      try{
        let inputMethodController = inputMethod.getController();
        let state =  await inputMethodController.discardTypingText();
        console.info("====>Sub_InputMethod_IMF_DiscardTypingText_0300 state is: " + state);
        expect().assertFail();
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IMF_DiscardTypingText_0300 errCode:${err.code}, errMessage is ${err.message}`)
        expect(err.code).assertEqual(12800015);
        done();
      }
    });

    /*
    * @tc.number  Sub_InputMethod_IMF_DiscardTypingText_0100
    * @tc.name    Sub_InputMethod_IMF_DiscardTypingText_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_DiscardTypingText_0100', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }, 
      };
      let newEditBoxValue: boolean = false;
      ATTRIBUTE.newEditBox = newEditBoxValue;

      let beforePublish = async () => {
        await inputMethod.getController().detach();
        inputMethod.getController().attach(true, ATTRIBUTE);
      }

      let afterPublish = async () => {
        setTimeout(async () => {
          let inputMethodController = inputMethod.getController();
          await inputMethodController.discardTypingText();
        }, 100);
      }

      testTemplate('Sub_InputMethod_IMF_DiscardTypingText_0100', 125, done, beforePublish, afterPublish);
    });

    /*
    * @tc.number  Sub_InputMethod_IMF_DiscardTypingText_1000
    * @tc.name    Sub_InputMethod_IMF_DiscardTypingText_1000
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_InputMethod_IMF_DiscardTypingText_1000', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        },
      };
      let newEditBoxValue: boolean = true;
      ATTRIBUTE.newEditBox = newEditBoxValue;

      let beforePublish = async () => {
        await inputMethod.getController().detach();
        inputMethod.getController().attach(true, ATTRIBUTE);
      }

      let afterPublish = async () => {
        setTimeout(async () => {
          let inputMethodController = inputMethod.getController();
          await inputMethodController.discardTypingText();
        }, 100);
      }

      testTemplate('Sub_InputMethod_IMF_DiscardTypingText_1000', 126, done, beforePublish, afterPublish);
    });

  })
}

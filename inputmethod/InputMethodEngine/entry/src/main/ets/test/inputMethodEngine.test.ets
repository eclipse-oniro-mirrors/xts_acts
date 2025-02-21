/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commoneventmanager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import subtype from '@ohos.InputMethodSubtype';
import inputMethod from '@ohos.inputMethod';
import display from '@ohos.display';
import {Driver, ON, MatchPattern, Component } from '@ohos.UiTest'
import deviceinfo from '@ohos.deviceInfo';
import { BusinessError} from '@ohos.base'

export default function inputMethodEngineJSUnit() {
  describe('inputMethodEngine', function () {
    beforeAll(async (done)=>{
      console.info('====> inputMethod_enable deviceinfo.deviceType:' + JSON.stringify(deviceinfo.deviceType));
      try {
        let driver: Driver = Driver.create();
        await driver.delayMs(500);
        let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
        let result: boolean = await inputMethodSetting.showOptionalInputMethods();
        console.info('====>beforeAll inputMethodSwitch else result: ' + JSON.stringify(result));
        let list = await driver.waitForComponent(ON.type('List'), 1000);
        console.info('====>beforeAll inputMethodSwitch else list: ' + JSON.stringify(list));
        if (JSON.stringify(list) == 'null') {
          await driver.delayMs(200);
          list = await driver.findComponent(ON.type('List'));
          console.info('====>beforeAll inputMethodSwitch second list: ' + JSON.stringify(list));
        }
        await driver.delayMs(500);
        let inputMethod_name: Component = await list.scrollSearch(ON.text('engine', MatchPattern.CONTAINS));
        console.info('====>beforeAll inputMethodSwitch else waitForComponent: ' + JSON.stringify(inputMethod_name));
        if (JSON.stringify(inputMethod_name) == 'null') {
          await driver.delayMs(200);
          inputMethod_name = await list.scrollSearch(ON.text('engine', MatchPattern.CONTAINS));
        }
        await inputMethod_name.click();
        console.info('====>beforeAll inputMethodSwitch else done' )
        await driver.delayMs(2000);
        let data = await inputMethod.getController().detach();
        console.info(`====>runCmd detach`);
        let textConfig: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: 0,
            enterKeyType: 1
          }
        };
        await inputMethod.getController().attach(true, textConfig);
        console.info(`====>runCmd attach`);
        done();
      } catch(err) {
        console.info('====>beforeAll inputMethodSwitch else err:' + JSON.stringify(err));
        done();
      }
    })

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterAll(async (done) => {

      done();
    })

    let dis = display.getDefaultDisplaySync();
    let driver = Driver.create();
    async function runCmd() {
      let cursor_x = 30 + Math.floor(Math.random() * dis.width * 0.8);
      let cursor_y = 150 + Math.floor(Math.random() * Math.round(dis.height * 0.4));
      console.info(`====>start click x:${cursor_x}  y:${cursor_y}`)
      await driver.click(cursor_x, cursor_y)
    }

    /*
    * @tc.number  inputMethodEngine_test_getInputMethodEngine_001
    * @tc.name   inputMethodEngine_test_getInputMethodEngine_001
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_getInputMethodEngine_001', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_getInputMethodEngine_001 unSubscriberCallback start");
        if (err) {
          console.error("====>inputMethodEngine_test_getInputMethodEngine_001 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_getInputMethodEngine_001 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>inputMethodEngine_test_getInputMethodEngine_001 subscriberCallback data: " + JSON.stringify(data));
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

      async function publishCallback(err) {
        if (err) {
          console.info("====>inputMethodEngine_test_getInputMethodEngine_001 end<====" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_getInputMethodEngine_001"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>inputMethodEngine_test_getInputMethodEngine_001 subscribe data: " + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_getInputMethodEngine_001 subscribe finish====");

        let commonEventPublishData = {
          code: 1
        }
        commoneventmanager.publish("test1", commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_getKeyboardDelegate_001', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 unSubscriberCallback start");
        if (err) {
          console.error("====>inputMethodEngine_test_getKeyboardDelegate_001 unSubscriberCallback failed: " + JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 unSubscriberCallback finsh");
        }
      }

      function subscriberCallback(err, data) {
        console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 subscriberCallback data: " + JSON.stringify(data));
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

      async function publishCallback(err) {
        if (err) {
          console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 end<====" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_getKeyboardDelegate_001"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 subscribe data: " + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_getKeyboardDelegate_001 subscribe finish====");

        let commonEventPublishData = {
          code: 2
        }
        commoneventmanager.publish("test1", commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_028', 0, async function (done) {

      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_028 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_028 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_028 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_028 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_028 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_028"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_028 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_028 subscriber finish");

        var commonEventPublishData = {
          code: 28
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_029', 0, async function (done) {

      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_029 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_029 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_029 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_029 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_029 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_029"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_029 subscriber data:" + JSON.stringify(data))
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_029 subscriber finish");

        var commonEventPublishData = {
          code: 29
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_030', 0, async function (done) {

      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_030 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_030 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_030 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_030 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_030 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_030"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_030 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_030 subscriber finish");

        var commonEventPublishData = {
          code: 30
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_031', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_031 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_031 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_031 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_031 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_031 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_031"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_031 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_031 subscriber finish");

        var commonEventPublishData = {
          code: 31
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_032', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_032 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_032 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_032 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_032 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_032 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_032"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_032 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_032 subscriber finish");

        var commonEventPublishData = {
          code: 32
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_033', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_033 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_033 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_033 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_033 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_033 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_033"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_033 subscriber data:" + JSON.stringify(data))
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_033 subscriber finish");

        var commonEventPublishData = {
          code: 33
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_034', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_034 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_034 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_034 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_034 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_034 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_034"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_034 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_034 subscriber finish");

        var commonEventPublishData = {
          code: 34
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_035', 0, async function (done) {

      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_035 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_035 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_035 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_035 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_035 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_035"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_035 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_035 subscriber finish");

        var commonEventPublishData = {
          code: 35
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_036', 0, async function (done) {

      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_036 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_036 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_036 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_036 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_036 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_036"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_036 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_036 subscriber finish");

        var commonEventPublishData = {
          code: 36
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_037', 0, async function (done) {

      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_037 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_037 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_037 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_037 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_037 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_037"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_037 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_037 subscriber finish");

        var commonEventPublishData = {
          code: 37
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_038', 0, async function (done) {

      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_038 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_038 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_038 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_038 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_038 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_038"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_038 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_038 subscriber finish");

        var commonEventPublishData = {
          code: 38
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_039', 0, async function (done) {

      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_039 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_039 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_039 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_039 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_039 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_039"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_039 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_039 subscriber finish");

        var commonEventPublishData = {
          code: 39
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_040', 0, async function (done) {

      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_040 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_040 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_040 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_040 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_040 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_040"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_040 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_040 subscriber finish");

        var commonEventPublishData = {
          code: 40
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_041', 0, async function (done) {

      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_041 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_041 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_041 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_041 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_041 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_041"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_041 subscriber data:" + JSON.stringify(data))
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_041 subscriber finish");

        var commonEventPublishData = {
          code: 41
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_042', 0, async function (done) {

      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_042 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_042 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_042 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_042 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_042 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_042"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_042 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_042 subscriber finish");

        var commonEventPublishData = {
          code: 42
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_043', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_043 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_043 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_043 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_043 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_043 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_043"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_043 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_043 subscriber finish");

        var commonEventPublishData = {
          code: 43
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_049', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_049 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_049 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_049 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_049 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_049 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_049"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_049 subscriber data:" + JSON.stringify(data))
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_049 subscriber finish");

        var commonEventPublishData = {
          code: 49
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_050', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_050 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_050 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_050 unSubscriberCallback finish");
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_050 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_050 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_050"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_050 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_050 subscriber finish");

        var commonEventPublishData = {
          code: 50
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_071', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_071 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_071 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_071 unSubscriberCallback finish")
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_071 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_071 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_071"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_071 subscriber data:" + JSON.stringify(data))
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_071 subscriber finish");

        var commonEventPublishData = {
          code: 71
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_072', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_072 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_072 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_072 unSubscriberCallback finish")
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_072 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_072 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(()=>{
            runCmd();
            clearTimeout(t)
          }, 100)
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_072"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_072 subscriber data:" + JSON.stringify(data))
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_072 subscriber finish");

        var commonEventPublishData = {
          code: 72
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_073', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_073 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_073 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_073 unSubscriberCallback finish")
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_073 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_073 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(()=>{
            runCmd();
            clearTimeout(t);
          }, 100)
          let t1 = setTimeout(async () => {
            await driver.triggerKey(2000)
            clearTimeout(t1);
          },300)
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_073"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_073 subscriber data:" + JSON.stringify(data))
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_073 subscriber finish");

        var commonEventPublishData = {
          code: 73
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_074', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_074 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_074 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_074 unSubscriberCallback finish")
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_074 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_074 publishCallback failed:" + JSON.stringify(err));
        }  else {
          let t = setTimeout(()=>{
            runCmd();
            clearTimeout(t)
          }, 100)
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_074"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_074 subscriber data:" + JSON.stringify(data))
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_074 subscriber finish");

        var commonEventPublishData = {
          code: 74
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_076', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_076 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_076 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_076 unSubscriberCallback finish")
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_076 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_076 publishCallback failed:" + JSON.stringify(err));
        }  else {
          let t = setTimeout(()=>{
            runCmd();
            clearTimeout(t)
          }, 100)
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_076"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_076 subscriber data:" + JSON.stringify(data))
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_076 subscriber finish");

        var commonEventPublishData = {
          code: 76
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('inputMethodEngine_test_077', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>inputMethodEngine_test_077 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_077 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodEngine_test_077 unSubscriberCallback finish")
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>inputMethodEngine_test_077 publishCallback start");
        if (err) {
          console.info("====>inputMethodEngine_test_077 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodEngine_test_077"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>inputMethodEngine_test_077 subscriber data:" + JSON.stringify(data))
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodEngine_test_077 subscriber finish");

        var commonEventPublishData = {
          code: 77
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('Sub_InputMethod_IME_VisualInput_0500', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_InputMethod_IME_VisualInput_0500 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_VisualInput_0500 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_VisualInput_0500 unSubscriberCallback finish")
        }

      }

      function subscriberCallback(err, data) {
        console.info("====>Sub_InputMethod_IME_VisualInput_0500 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(async() => {
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

      async function publishCallback(err) {
        console.info("====>Sub_InputMethod_IME_VisualInput_0500 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_VisualInput_0500 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_VisualInput_0500"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>Sub_InputMethod_IME_VisualInput_0500 subscriber data:" + JSON.stringify(data))
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_InputMethod_IME_VisualInput_0500 subscriber finish");
        var commonEventPublishData = {
          code: 78
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
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
    it('Sub_InputMethod_IME_VisualInput_0600', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info("====>Sub_InputMethod_IME_VisualInput_0600 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_VisualInput_0600 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_InputMethod_IME_VisualInput_0600 unSubscriberCallback finish")
        }
      }

      function subscriberCallback(err, data) {
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

      function publishCallback(err) {
        console.info("====>Sub_InputMethod_IME_VisualInput_0600 publishCallback start");
        if (err) {
          console.info("====>Sub_InputMethod_IME_VisualInput_0600 publishCallback failed:" + JSON.stringify(err));
        } 
      }

      var commonEventSubscribeInfo = {
        events: ["Sub_InputMethod_IME_VisualInput_0600"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        subscriber = data;
        console.info("====>Sub_InputMethod_IME_VisualInput_0600 subscriber data:" + JSON.stringify(data))
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>Sub_InputMethod_IME_VisualInput_0600 subscriber finish");

        var commonEventPublishData = {
          code: 79
        }
        commoneventmanager.publish('test1', commonEventPublishData, publishCallback);
      })
    });

  })
}

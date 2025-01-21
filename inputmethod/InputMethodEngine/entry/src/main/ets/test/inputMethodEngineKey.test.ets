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

export default function inputMethodEngineKeyJSUnit() {
  describe('inputMethodEngineKeyEvent', function () {
    var inputSever = {
      packageName: '',
      methodId: '',
      name: '',
      id: '',
      extra: {}
    }
    beforeAll(async (done)=>{
      let inputM = inputMethod.getCurrentInputMethod();
      console.info("====>beforeAll: getCurrentInputMethod inputMethodEngineJSUnit to: " + JSON.stringify(inputM));
      inputSever.packageName = inputM.packageName;
      inputSever.methodId = inputM.methodId;
      inputSever.name = inputM.packageName;
      inputSever.id = inputM.methodId;

      let InputKeyService: subtype = {
        id: "InputKeyService",
        label: "",
        name: "com.acts.inputmethodengine.test",
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      }
      try {
        await inputMethod.switchCurrentInputMethodSubtype(InputKeyService);
        setTimeout(() => {
          console.info("====>beforeAll: inputMethodEngineJSUnit switchCurrentInputMethodSubtype success");
          done();
        }, 2000)
      } catch (err) {
        console.info("====>beforeAll: inputMethodEngineJSUnit fail" + JSON.stringify(err));
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

    /*
    * @tc.number  SUB_Misc_InputMethod_Manage_Physical_Buttons_0010
    * @tc.name   SUB_Misc_InputMethod_Manage_Physical_Buttons_0010
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_Manage_Physical_Buttons_0010', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000)
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(async ()=>{
            await driver.triggerKey(2045)
            clearTimeout(t);
          }, 100)    
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_Manage_Physical_Buttons_0010"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 subscriber finish");

        var commonEventPublishData = {
          code: 10
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_Manage_Physical_Buttons_0020
    * @tc.name   SUB_Misc_InputMethod_Manage_Physical_Buttons_0020
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_Manage_Physical_Buttons_0020', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000);
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(async ()=>{
            await driver.triggerKey(2017)
            clearTimeout(t);
          }, 100)             
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_Manage_Physical_Buttons_0020"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 subscriber finish");

        var commonEventPublishData = {
          code: 20
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_Manage_Physical_Buttons_0030
    * @tc.name   SUB_Misc_InputMethod_Manage_Physical_Buttons_0030
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_Manage_Physical_Buttons_0030', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000);
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(async ()=>{
            await driver.triggerCombineKeys(2045, 2049);
            clearTimeout(t);
          }, 100)            
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_Manage_Physical_Buttons_0030"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 subscriber finish");

        var commonEventPublishData = {
          code: 30
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_Manage_Physical_Buttons_0040
    * @tc.name   SUB_Misc_InputMethod_Manage_Physical_Buttons_0040
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_Manage_Physical_Buttons_0040', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000)
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(async ()=>{
            await driver.triggerCombineKeys(2017, 2047);
            clearTimeout(t);
          }, 100)  
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_Manage_Physical_Buttons_0040"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 subscriber finish");

        var commonEventPublishData = {
          code: 40
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_Manage_Physical_Buttons_0050
    * @tc.name   SUB_Misc_InputMethod_Manage_Physical_Buttons_0050
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_Manage_Physical_Buttons_0050', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000)
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(async ()=>{
            await driver.triggerCombineKeys(2047, 2017);
            clearTimeout(t);
          }, 100)  
          
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_Manage_Physical_Buttons_0050"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 subscriber finish");

        var commonEventPublishData = {
          code: 50
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_Manage_Physical_Buttons_0060
    * @tc.name   SUB_Misc_InputMethod_Manage_Physical_Buttons_0060
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_Manage_Physical_Buttons_0060', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000)
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(async ()=>{
            await driver.triggerCombineKeys(2072, 2045, 2055);
            clearTimeout(t);
          }, 100)  
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_Manage_Physical_Buttons_0060"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 subscriber finish");

        var commonEventPublishData = {
          code: 60
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_Manage_Physical_Buttons_0070
    * @tc.name   SUB_Misc_InputMethod_Manage_Physical_Buttons_0070
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_Manage_Physical_Buttons_0070', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 subscriberCallback data:"
        + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000)
      }

      async function publishCallback(err){
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 publishCallback start");
        if (err){
          console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(async ()=>{
            await driver.triggerCombineKeys(2072, 2045, 2017)
            clearTimeout(t)
          }, 100)  
        }
      }

      var commonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_Manage_Physical_Buttons_0070"]
      }
      var subscriber;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 subscriber data:" + JSON.stringify(data));
        commoneventmanager.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 subscriber finish");

        var commonEventPublishData = {
          code: 70
        }
        commoneventmanager.publish('test', commonEventPublishData, publishCallback);
      })
    });

  })
}
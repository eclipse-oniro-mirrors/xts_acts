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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import inputMethod from '@ohos.inputMethod';
import inputMethodEngine from '@ohos.inputMethodEngine';
import subtype from '@ohos.InputMethodSubtype';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import display from '@ohos.display';

export default function inputMethodAbility() {
  describe('inputMethodAbility', function () {
    var inputServer = {
      packageName: '',
      methodId: '',
      name:'',
      id:'',
      extra:{}
    }

    let display_info;
    let getFocusCmd = '';
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    async function runCmd(cmd){
      console.debug('====>runCmd info:' + cmd);
      await abilityDelegator.executeShellCommand(cmd);
    }
    beforeAll(async (done)=>{
      display_info = display.getDefaultDisplaySync()
      getFocusCmd = `uinput -T -c ${display_info.width*0.5}  ${display_info.height*0.5}`
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("====>beforeAll: switchInputMethod to: " +  JSON.stringify(inputM));
      inputServer.packageName = inputM.packageName;
      inputServer.methodId = inputM.methodId;
      inputServer.name = inputM.packageName;
      inputServer.id = inputM.methodId;
      console.info("====>beforeAll inputMethodStageJSUnit start");
      let inputDemoService: subtype ={
        id: 'inputStageService',
        label: '',
        name: 'com.acts.inputmethodengine.test',
        mode: 'lower',
        locale: '',
        language: '',
        icon: '',
        iconId: 0,
        extra: {},
      }
      try{
        await inputMethod.switchCurrentInputMethodSubtype(inputDemoService);
        setTimeout(()=>{
          console.debug("====>beforeAll inputMethodStageJSUnit switchCurrentInputMethodSubtype success");
          done();
        },2000)
      }catch(err){
        console.debug("====>beforeAll inputMethodStageJSUnit switchCurrentInputMethodSubtype failed");
      }
    })

    afterAll(async (done) => {
      try {
        await inputMethod.switchInputMethod(inputServer);
        console.info("====>afterAll: inputMethodStageJSUnit switchInputMethod success" + JSON.stringify(inputServer));
        setTimeout(() => {
          console.info("====>afterAll: inputMethodStageJSUnit switchInputMethod success");
          done();
        }, 2000)
      } catch (err) {
        console.info("====>afterAll: inputMethodStageJSUnit fail" + JSON.stringify(err));
      }
    })

    it('inputMethodEngine_test_001', 0, async function (done) {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_UNSPECIFIED;
      console.info("====>inputMethodEngine_test_001 result:" + keyType);
      expect(keyType).assertEqual(0);
      done();
    });

    it('inputMethodEngine_test_002', 0, async function (done) {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_GO;
      console.info("====>inputMethodEngine_test_002 result:" + keyType);
      expect(keyType).assertEqual(2);
      done();
    });

    it('inputMethodEngine_test_003', 0, async function (done) {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_SEARCH;
      console.info("====>inputMethodEngine_test_003 result:" + keyType);
      expect(keyType).assertEqual(3);
      done();
    });

    it('inputMethodEngine_test_004', 0, async function (done) {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_SEND;
      console.info("====>inputMethodEngine_test_004 result:" + keyType);
      expect(keyType).assertEqual(4);
      done();
    });

    it('inputMethodEngine_test_005', 0, async function (done) {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_NEXT;
      console.info("====>inputMethodEngine_test_005 result:" + keyType);
      expect(keyType).assertEqual(5);
      done();
    });

    it('inputMethodEngine_test_006', 0, async function (done) {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_DONE;
      console.info("====>inputMethodEngine_test_006 result:" + keyType);
      expect(keyType).assertEqual(6);
      done();
    });

    it('inputMethodEngine_test_007', 0, async function (done) {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_PREVIOUS;
      console.info("====>inputMethodEngine_test_007 result:" + keyType);
      expect(keyType).assertEqual(7);
      done();
    });

    it('inputMethodEngine_test_008', 0, async function (done) {
      let keyType = inputMethodEngine.PATTERN_NULL;
      console.info("====>inputMethodEngine_test_008 result:" + keyType);
      expect(keyType).assertEqual(-1);
      done();
    });

    it('inputMethodEngine_test_009', 0, async function (done) {
      let keyType = inputMethodEngine.PATTERN_TEXT;
      console.info("====>inputMethodEngine_test_009 result:" + keyType);
      expect(keyType).assertEqual(0);
      done();
    });

    it('inputMethodEngine_test_010', 0, async function (done) {
      let keyType = inputMethodEngine.PATTERN_NUMBER;
      console.info("====>inputMethodEngine_test_010 result:" + keyType);
      expect(keyType).assertEqual(2);
      done();
    });

    it('inputMethodEngine_test_011', 0, async function (done) {
      let keyType = inputMethodEngine.PATTERN_PHONE;
      console.info("====>inputMethodEngine_test_011 result:" + keyType);
      expect(keyType).assertEqual(3);
      done();
    });

    it('inputMethodEngine_test_012', 0, async function (done) {
      let keyType = inputMethodEngine.PATTERN_DATETIME;
      console.info("====>inputMethodEngine_test_012 result:" + keyType);
      expect(keyType).assertEqual(4);
      done();
    });

    it('inputMethodEngine_test_013', 0, async function (done) {
      let keyType = inputMethodEngine.PATTERN_EMAIL;
      console.info("====>inputMethodEngine_test_013 result:" + keyType);
      expect(keyType).assertEqual(5);
      done();
    });

    it('inputMethodEngine_test_014', 0, async function (done) {
      let keyType = inputMethodEngine.PATTERN_URI;
      console.info("====>inputMethodEngine_test_014 result:" + keyType);
      expect(keyType).assertEqual(6);
      done();
    });

    it('inputMethodEngine_test_015', 0, async function (done) {
      let keyType = inputMethodEngine.PATTERN_PASSWORD;
      console.info("====>inputMethodEngine_test_015 result:" + keyType);
      expect(keyType).assertEqual(7);
      done();
    });

    it('inputMethodEngine_test_016', 0, async function (done) {
      let keyType = inputMethodEngine.FLAG_SELECTING;
      console.info("====>inputMethodEngine_test_016 result:" + keyType);
      expect(keyType).assertEqual(2);
      done();
    });

    it('inputMethodEngine_test_017', 0, async function (done) {
      let keyType = inputMethodEngine.FLAG_SINGLE_LINE;
      console.info("====>inputMethodEngine_test_017 result:" + keyType);
      expect(keyType).assertEqual(1);
      done();
    });

    it('inputMethodEngine_test_018', 0, async function (done) {
      let keyType = inputMethodEngine.DISPLAY_MODE_PART;
      console.info("====>inputMethodEngine_test_018 result:" + keyType);
      expect(keyType).assertEqual(0);
      done();
    });

    it('inputMethodEngine_test_019', 0, async function (done) {
      let keyType = inputMethodEngine.DISPLAY_MODE_FULL;
      console.info("====>inputMethodEngine_test_019 result:" + keyType);
      expect(keyType).assertEqual(1);
      done();
    });

    it('inputMethodEngine_test_020', 0, async function (done) {
      let keyType = inputMethodEngine.OPTION_ASCII;
      console.info("====>inputMethodEngine_test_020 result:" + keyType);
      expect(keyType).assertEqual(20);
      done();
    });

    it('inputMethodEngine_test_021', 0, async function (done) {
      let keyType = inputMethodEngine.OPTION_NONE;
      console.info("====>inputMethodEngine_test_021 result:" + keyType);
      expect(keyType).assertEqual(0);
      done();
    });

    it('inputMethodEngine_test_022', 0, async function (done) {
      let keyType = inputMethodEngine.OPTION_AUTO_CAP_CHARACTERS;
      console.info("====>inputMethodEngine_test_022 result:" + keyType);
      expect(keyType).assertEqual(2);
      done();
    });

    it('inputMethodEngine_test_023', 0, async function (done) {
      let keyType = inputMethodEngine.OPTION_AUTO_CAP_SENTENCES;
      console.info("====>inputMethodEngine_test_023 result:" + keyType);
      expect(keyType).assertEqual(8);
      done();
    });

    it('inputMethodEngine_test_024', 0, async function (done) {
      let keyType = inputMethodEngine.OPTION_AUTO_WORDS;
      console.info("====>inputMethodEngine_test_024 result:" + keyType);
      expect(keyType).assertEqual(4);
      done();
    });

    it('inputMethodEngine_test_025', 0, async function (done) {
      let keyType = inputMethodEngine.OPTION_MULTI_LINE;
      console.info("====>inputMethodEngine_test_025 result:" + keyType);
      expect(keyType).assertEqual(1);
      done();
    });

    it('inputMethodEngine_test_026', 0, async function (done) {
      let keyType = inputMethodEngine.OPTION_NO_FULLSCREEN;
      console.info("====>inputMethodEngine_test_026 result:" + keyType);
      expect(keyType).assertEqual(10);
      done();
    });

    it('inputMethodAbility_test_getInputMethodAbility_001', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_getInputMethodAbility_001 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_getInputMethodAbility_001 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_getInputMethodAbility_001 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_getInputMethodAbility_001 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_getInputMethodAbility_001 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_getInputMethodAbility_001 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_getInputMethodAbility_001 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_getInputMethodAbility_001 publishCallback failed:" +
          JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_getInputMethodAbility_001"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_getInputMethodAbility_001 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_getInputMethodAbility_001 subscriber finish");

        let commonEventPublishData = {
          code: 1
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    it('inputMethodAbility_test_getKeyboardDelegate_001', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 publishCallback failed:" +
          JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_getKeyboardDelegate_001"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 subscriber finish");

        let commonEventPublishData = {
          code: 2
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    it('inputMethodAbility_test_028', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_028 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_028 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_028 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_028 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_028 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_028 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_028 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_028 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_028"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_028 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_028 subscriber finish");
      })

      var commonEventPublishData = {
        code: 28
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_029', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_029 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_029 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_029 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_029 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_029 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_029 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_029 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_029 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_029"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_029 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_029 subscriber finish");
      })

      var commonEventPublishData = {
        code: 29
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback)
    });

    it('inputMethodAbility_test_030', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_030 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_030 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_030 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_030 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_030 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_030 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_030 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_030 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_030"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_030 subscriber data:" + JSON.stringify(data))
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_030 subscriber finish");
      })

      var commonEventPublishData = {
        code: 30
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_031', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_031 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_031 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_031 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_031 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_031 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_031 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_031 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_031 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_031"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_031 subscriber data:" + JSON.stringify(data))
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_031 subscriber finish");
      })

      var commonEventPublishData = {
        code: 31
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_032', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_032 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_032 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_032 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_032 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_032 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_032 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_032 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_032 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_032"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_032 subscriber data:" + JSON.stringify(data))
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_032 subscriber finish");
      })

      var commonEventPublishData = {
        code: 32
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_033', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_033 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_033 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_033 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_033 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_033 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_033 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_033 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_033 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_033"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_033 subscriber data:" + JSON.stringify(data))
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_033 subscriber finish");
      })

      var commonEventPublishData = {
        code: 33
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback)
    });

    it('inputMethodAbility_test_034', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_034 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_034 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_034 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_034 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_034 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_034 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_034 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_034 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_034"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_034 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_034 subscriber finish");
      })

      var commonEventPublishData = {
        code: 34
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_035', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_035 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_035 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_035 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_035 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_035 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_035 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_035 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_035 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_035"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_035 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_035 subscriber finish");
      })

      var commonEventPublishData = {
        code: 35
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_036', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_036 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_036 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_036 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_036 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_036 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_036 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_036 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_036 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_036"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_036 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_036 subscriber finish");
      })

      var commonEventPublishData = {
        code: 36
      };
      commonEventManager.publish('test', commonEventPublishData, publishCallback);;
    });

    it('inputMethodAbility_test_037', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_037 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_037 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_037 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_037 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_037 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_037 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_037 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_037 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_037"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_037 subscriber data:" + JSON.stringify(data))
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_037 subscriber finish");
      })

      var commonEventPublishData = {
        code: 37
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_038', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_038 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_038 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_038 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_038 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_038 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_038 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_038 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_038 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_038"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_038 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_038 subscriber finish");
      })

      var commonEventPublishData = {
        code: 38
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_039', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_039 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_039 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_039 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_039 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_039 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_039 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_039 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_039 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_039"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_039 subscriber data:" + JSON.stringify(data))
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_039 subscriber finish");
      })

      var commonEventPublishData = {
        code: 39
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_040', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_040 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_040 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_040 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_040 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_040 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_040 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_040 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_040 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_040"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_040 subscriber data:" + JSON.stringify(data))
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_040 subscriber finish");
      })

      var commonEventPublishData = {
        code: 40
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_041', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_041 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_041 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_041 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_041 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_041 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_041 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_041 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_041 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_041"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_041 subscriber data:" + JSON.stringify(data))
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_041 subscriber finish");
      })

      var commonEventPublishData = {
        code: 41
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_042', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_042 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_042 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_042 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_042 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_042 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_042 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_042 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_042 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_042"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_042 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_042 subscriber finish");
      })

      var commonEventPublishData = {
        code: 42
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_043', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_043 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_043 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_043 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_043 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_043 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_043 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_043 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_043 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_043"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_043 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_043 subscriber finish");
      })

      var commonEventPublishData = {
        code: 43
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodEngine_test_044', 0, async function (done) {
      let keyType = inputMethodEngine.WINDOW_TYPE_INPUT_METHOD_FLOAT;
      console.info("====>inputMethodEngine_test_044 result:" + keyType);
      expect(keyType).assertEqual(2105);
      done();
    });

    it('inputMethodAbility_test_045', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_045 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_045 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_045 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_045 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_045 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_045 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_045 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_045 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_045"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_045 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_045 subscriber finish");
      })

      var commonEventPublishData = {
        code: 45
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_046', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_046 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_046 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_046 unSubscriberCallback finish")
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_046 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_046 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_046 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_046 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_046 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_046"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_046 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_046 subscriber finish");
      })

      var commonEventPublishData = {
        code: 46
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_047', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_047 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_047 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_047 unSubscriberCallback finish")
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_047 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_047 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_047 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_047 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_047 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_047"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_047 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_047 subscriber finish");
      })

      var commonEventPublishData = {
        code: 47
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_048', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_048 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_048 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_048 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_048 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_048 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_048 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_048 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_048 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_048"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_048 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_048 subscriber finish");
      })

      var commonEventPublishData = {
        code: 48
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_049', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_049 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_049 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_049 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_049 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_049 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_049 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_049 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_049 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_049"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_049 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_049 subscriber finish");
      })

      var commonEventPublishData = {
        code: 49
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_050', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_050 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_050 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_050 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_050 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_050 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_050 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_050 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_050 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_050"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_050 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_050 subscriber finish")
      })

      var commonEventPublishData = {
        code: 50
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_070', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_070 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_070 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_070 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_070 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_070 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_070 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_070 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_070 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_070"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_070 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_070 subscriber finish")
      })

      var commonEventPublishData = {
        code: 70
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_071', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_071 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_071 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_071 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_071 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_071 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_071 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_071 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_071 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_071"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_071 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_071 subscriber finish")
      })

      var commonEventPublishData = {
        code: 71
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_072', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_072 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_072 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_072 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_072 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_072 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_072 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_072 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_072 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_072"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_072 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_072 subscriber finish")
      })

      var commonEventPublishData = {
        code: 72
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_073', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_073 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_073 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_073 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_073 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_073 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_073 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_073 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_073 publishCallback failed:" + JSON.stringify(err));
        } else {
          runCmd(getFocusCmd);
          let t = setTimeout(() => {
            runCmd("uinput -K -d 2000 -u 2000");
            clearTimeout(t);
          },200);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_073"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_073 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_073 subscriber finish")
      })

      var commonEventPublishData = {
        code: 73
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

    it('inputMethodAbility_test_074', 0, async function (done) {
      function unSubscriberCallback (err){
        console.info("====>inputMethodAbility_test_074 unSubscriberCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_074 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_074 unSubscriberCallback finish");
        }
      }

      function subscriberCallback (err, data){
        console.info("====>inputMethodAbility_test_074 subscriberCallback data:"
        + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try{
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_074 end");
            clearTimeout(t);
            done();
          }catch(err){
            console.info("====>inputMethodAbility_test_074 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500);
      }

      function publishCallback(err){
        console.info("====>inputMethodAbility_test_074 publishCallback start");
        if (err){
          console.info("====>inputMethodAbility_test_074 publishCallback failed:" + JSON.stringify(err));
        } else {
          let count = 0;
          let t = setInterval(() => {
            count += 1;
            runCmd(getFocusCmd);
            if (count === 2){
              clearInterval(t);
            }
          }, 500);
        }
      }

      var commonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_074"]
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>inputMethodAbility_test_074 subscriber data:" + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info("====>inputMethodAbility_test_074 subscriber finish");
      })

      var commonEventPublishData = {
        code: 74
      }
      commonEventManager.publish('test', commonEventPublishData, publishCallback);
    });

  });
};

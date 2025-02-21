/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import ErrorManager from "@ohos.app.ability.errorManager"
import commonEvent from '@ohos.commonEvent'
const CASE_TIME_OUT=5000;
var ACTS_Register = {
  events: ["ACTS_RegisterEvent_First", "ACTS_RegisterEvent_Second"]
};

export default function abilityTest() {
  describe('ActsAbilityTest', function () {
    let observer;
    beforeAll(function () {
      observer = {
        onUnhandledException(strMsg){
          console.info("====>Acts_RegisterJsErrorCallback onUnhandledException Message: " + strMsg);
        },
        onException(errObject){
          console.info("====>Acts_RegisterJsErrorCallback onException Message: " + errObject);
        }
      }
    })

    /*
     * @tc.number: Acts_RegisterJsErrorCallback_0100
     * @tc.name: JsError callback enhancement
     * @tc.desc: Js registers onUnhandledException callback to listen. There is a callback notification when
     *           JS is abnormal.
     */
    it('Acts_RegisterJsErrorCallback_0100',0, async function (done) {
      let subscriber;
      let flag = false;
      console.info("====>Acts_RegisterJsErrorCallback_0100 start");
      commonEvent.createSubscriber(ACTS_Register).then(async (data) => {
        console.debug("====>Acts_RegisterJsErrorCallback_0100 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.example.actsregisterjserrorrely",
            abilityName: "EntryAbility",
            action: "Acts_RegisterJsErrorCallback_0100"
          },(err)=>{
          console.debug("====>Acts_RegisterJsErrorCallback_0100 startAbility err: "+JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.debug("====>Acts_RegisterJsErrorCallback_0100 subscribeCallBack data: " + JSON.stringify(data));
        if(data.event == "ACTS_RegisterEvent_First") {
          flag = true;
          expect(data.parameters.message).assertContain("Error message:Cannot read property terminateSelf");
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        console.debug("====>Acts_RegisterJsErrorCallback_0100 unSubscribeCallback");
        setTimeout(()=>{
          done();
        }, 800);
      }

      setTimeout(()=>{
        if(flag==false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_RegisterJsErrorCallback_0200
     * @tc.name: JsError callback enhancement
     * @tc.desc: Js registers onUnhandledException and onException callback to listen. There is a callback
     *           notification when JS is abnormal.
     */
    it('Acts_RegisterJsErrorCallback_0200',0, async function (done) {
      let subscriber;
      let flag = false;
      console.info("====>Acts_RegisterJsErrorCallback_0200 start")
      commonEvent.createSubscriber(ACTS_Register).then(async (data) => {
        console.debug("====>Acts_RegisterJsErrorCallback_0200 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.example.actsregisterjserrorrely",
            abilityName: "EntryAbility",
            action: "Acts_RegisterJsErrorCallback_0200"
          },(err)=>{
          console.debug("====>Acts_RegisterJsErrorCallback_0200 startAbility err: "+JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      var msg = {"ACTS_RegisterEvent_First": false, "ACTS_RegisterEvent_Second": false}
      function subscribeCallBack(err, data) {
        if (data.event === 'ACTS_RegisterEvent_First') {
          console.debug("====>Acts_RegisterJsErrorCallback_0200 subscribeCallBack First data: " + JSON.stringify(data));
          expect(data.parameters.message).assertContain("Error message:Cannot read property terminateSelf");
          msg["ACTS_RegisterEvent_First"] = true;
        } else if (data.event === 'ACTS_RegisterEvent_Second') {
          console.debug("====>Acts_RegisterJsErrorCallback_0200 subscribeCallBack Second data: " +
            JSON.stringify(data));
          expect(data.parameters.message.name).assertEqual("TypeError");
          expect(data.parameters.message.message).assertEqual("Cannot read property terminateSelf of undefined");
          expect(data.parameters.message.stack).assertContain("at anonymous");
          msg["ACTS_RegisterEvent_Second"] = true;
        }

        if (msg["ACTS_RegisterEvent_First"] == true && msg["ACTS_RegisterEvent_Second"] == true) {
          flag = true;
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        setTimeout(()=>{
          console.debug("====>Acts_RegisterJsErrorCallback_0200 unSubscribeCallback");
          done();
        }, 800);
      }

      setTimeout(()=>{
        if(flag==false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_RegisterJsErrorCallback_0300
     * @tc.name: JsError callback enhancement
     * @tc.desc: When registering JS exception listening interface parameter type is undefined, returns an error.
     */
    it('Acts_RegisterJsErrorCallback_0300',0, async function (done) {
      console.info("====>Acts_RegisterJsErrorCallback_0300 start");
      try {
        ErrorManager.on(undefined, observer);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>Acts_RegisterJsErrorCallback_0300 catch " + JSON.stringify(err.code));
        expect(err.code).assertEqual(401);
        console.info("====>Acts_RegisterJsErrorCallback_0300 end");
        done();
      }
    })

    /*
     * @tc.number: Acts_RegisterJsErrorCallback_0400
     * @tc.name: JsError callback enhancement
     * @tc.desc: When registering JS exception listening interface parameter type is null, returns an error.
     */
    it('Acts_RegisterJsErrorCallback_0400',0, async function (done) {
      console.info("====>Acts_RegisterJsErrorCallback_0400 start");
      try {
        ErrorManager.on(null, observer);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>Acts_RegisterJsErrorCallback_0400 catch " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.info("====>Acts_RegisterJsErrorCallback_0400 end");
        done();
      }
    })

    /*
     * @tc.number: Acts_RegisterJsErrorCallback_0500
     * @tc.name: JsError callback enhancement
     * @tc.desc: When registering JS exception listening interface parameter observer is undefined, no abnormal
     *           error in interface execution.
     */
    it('Acts_RegisterJsErrorCallback_0500',0, async function (done) {
      console.info("====>Acts_RegisterJsErrorCallback_0500 start");
      try {
        const observerId = ErrorManager.on('error', undefined);
        expect(true).assertTrue();
        await ErrorManager.off('error', observerId);
        console.info("====>Acts_RegisterJsErrorCallback_0500 end");
        done();
      } catch (err) {
        console.info("====>Acts_RegisterJsErrorCallback_0500 catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number: Acts_RegisterJsErrorCallback_0600
     * @tc.name: JsError callback enhancement
     * @tc.desc: When registering JS exception listening interface parameter observer is null, no abnormal
     *           error in interface execution.
     */
    it('Acts_RegisterJsErrorCallback_0600',0, async function (done) {
      console.info("====>Acts_RegisterJsErrorCallback_0600 start");
      try {
        const observerId = ErrorManager.on('error', null);
        expect(true).assertTrue();
        await ErrorManager.off('error', observerId);
        console.info("====>Acts_RegisterJsErrorCallback_0600 end");
        done();
      } catch (err) {
        console.info("====>Acts_RegisterJsErrorCallback_0600 catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number: Acts_UnregisterJsErrorCallback_0100
     * @tc.name: JsError callback enhancement
     * @tc.desc: When unregistering JS exception listening interface parameter type is undefined, returns an error.
     */
    it('Acts_UnregisterJsErrorCallback_0100',0, async function (done) {
      console.info("====>Acts_UnregisterJsErrorCallback_0100 start");
      let observerId = ErrorManager.on("error", observer);
      try {
        await ErrorManager.off(undefined, observerId);
        console.info("====>Acts_UnregisterJsErrorCallback_0100 success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>Acts_UnregisterJsErrorCallback_0100 catch: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        await ErrorManager.off('error', observerId);
        console.info("====>Acts_UnregisterJsErrorCallback_0100 end");
        done();
      }
    })

    /*
     * @tc.number: Acts_UnregisterJsErrorCallback_0200
     * @tc.name: JsError callback enhancement
     * @tc.desc: When unregistering JS exception listening interface parameter type is null, returns an error.
     */
    it('Acts_UnregisterJsErrorCallback_0200',0, async function (done) {
      console.info("====>Acts_UnregisterJsErrorCallback_0200 start");
      let observerId = ErrorManager.on("error", observer);
      try {
        await ErrorManager.off(null, observerId);
        console.info("====>Acts_UnregisterJsErrorCallback_0200 success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>Acts_UnregisterJsErrorCallback_0200 catch: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        await ErrorManager.off('error', observerId);
        console.info("====>Acts_UnregisterJsErrorCallback_0200 end");
        done();
      }
    })

    /*
     * @tc.number: Acts_UnregisterJsErrorCallback_0300
     * @tc.name: JsError callback enhancement
     * @tc.desc: When unregistering JS exception listening interface parameter observerId is undefined, returns error.
     */
    it('Acts_UnregisterJsErrorCallback_0300',0, async function (done) {
      console.info("====>Acts_UnregisterJsErrorCallback_0300 start");
      ErrorManager.off("error", undefined).then(()=>{
        console.info("====>Acts_UnregisterJsErrorCallback_0300 success");
        expect().assertFail();
        done();
      }).catch((err)=>{
        console.info("====>Acts_UnregisterJsErrorCallback_0300 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /*
     * @tc.number: Acts_UnregisterJsErrorCallback_0400
     * @tc.name: JsError callback enhancement
     * @tc.desc: When unregistering JS exception listening interface parameter observerId is null, returns error.
     */
    it('Acts_UnregisterJsErrorCallback_0400',0, async function (done) {
      console.info("====>Acts_UnregisterJsErrorCallback_0400 start");
      ErrorManager.off("error", null).then(()=>{
        console.info("====>Acts_UnregisterJsErrorCallback_0400 success");
        expect().assertFail();
        done();
      }).catch((err)=>{
        console.info("====>Acts_UnregisterJsErrorCallback_0400 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /*
     * @tc.number: Acts_UnregisterJsErrorCallback_0500
     * @tc.name: JsError callback enhancement
     * @tc.desc: When unregistering JS exception listening interface parameter observerId is -1, returns error.
     */
    it('Acts_UnregisterJsErrorCallback_0500',0, async function (done) {
      console.info("====>Acts_UnregisterJsErrorCallback_0500 start");
      ErrorManager.off("error", -1).then(()=>{
        console.info("====>Acts_UnregisterJsErrorCallback_0500 success");
        expect().assertFail();
        done();
      }).catch((err)=>{
        console.info("====>Acts_UnregisterJsErrorCallback_0500 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /*
     * @tc.number: Acts_UnregisterJsErrorCallback_0600
     * @tc.name: JsError callback enhancement
     * @tc.desc: When unregistering JS exception listening interface parameter observerId is 10000, returns error.
     */
    it('Acts_UnregisterJsErrorCallback_0600',0, async function (done) {
      console.info("====>Acts_UnregisterJsErrorCallback_0600 start");
      ErrorManager.off("error", 10000).then(()=>{
        console.info("====>Acts_UnregisterJsErrorCallback_0600 success");
        expect().assertFail();
        done();
      }).catch((err)=>{
        console.info("====>Acts_UnregisterJsErrorCallback_0600 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(16000003);
        done();
      })
    })

    /*
     * @tc.number: Acts_UnregisterJsErrorCallback_0700
     * @tc.name: JsError callback enhancement
     * @tc.desc: When the parameter objectId of the unregistered JS exception listening interface is the correct
     *           registered value, the interface executes correctly.
     */
    it('Acts_UnregisterJsErrorCallback_0700',0, async function (done) {
      console.info("====>Acts_UnregisterJsErrorCallback_0700 start");
      let observerId = ErrorManager.on("error", observer);
      try {
        await ErrorManager.off('error', observerId);
        console.info("====>Acts_UnregisterJsErrorCallback_0700 end");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.info("====>Acts_UnregisterJsErrorCallback_0700 catch: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number: Acts_UnregisterJsErrorCallback_0800
     * @tc.name: JsError callback enhancement
     * @tc.desc: When unregistered as the correct registered value, the interface executes correctly and the JS
     *           layer does not trigger an exception error callback.
     */
    it('Acts_UnregisterJsErrorCallback_0800',0, async function (done) {
      let subscriber;
      let flag = false;
      console.info("====>Acts_UnregisterJsErrorCallback_0800 start")
      commonEvent.createSubscriber(ACTS_Register).then(async (data) => {
        console.debug("====>Acts_UnregisterJsErrorCallback_0800 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.example.actsregisterjserrorrely",
            abilityName: "EntryAbility",
            action: "Acts_UnregisterJsErrorCallback_0800"
          },(err)=>{
          console.debug("====>Acts_UnregisterJsErrorCallback_0800 startAbility err: "+JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      var msg = {"ACTS_RegisterEvent_First": false, "ACTS_RegisterEvent_Second": false}
      function subscribeCallBack(err, data) {
        if (data.event === 'ACTS_RegisterEvent_First') {
          console.debug("====>Acts_UnregisterJsErrorCallback_0800 subscribeCallBack First data: " +
            JSON.stringify(data));
          expect(data.parameters.message).assertContain("Error message:Cannot read property terminateSelf");
          msg["ACTS_RegisterEvent_First"] = true;
        } else if (data.event === 'ACTS_RegisterEvent_Second') {
          console.debug("====>Acts_UnregisterJsErrorCallback_0800 subscribeCallBack Second data: " +
            JSON.stringify(data));
          expect(data.parameters.message.name).assertEqual("TypeError");
          expect(data.parameters.message.message).assertEqual("Cannot read property terminateSelf of undefined");
          expect(data.parameters.message.stack).assertContain("at anonymous");
          msg["ACTS_RegisterEvent_Second"] = true;
        }

        if (msg["ACTS_RegisterEvent_First"] == true && msg["ACTS_RegisterEvent_Second"] == true) {
          flag = true;
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        setTimeout(() => {
          console.debug("====>Acts_UnregisterJsErrorCallback_0800 unSubscribeCallback");
          done();
        }, 800);
      }

      setTimeout(()=>{
        if(flag==false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      },CASE_TIME_OUT)
    })
  })
}
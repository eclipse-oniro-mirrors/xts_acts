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
import commonEvent from '@ohos.commonEvent'

const CASE_TIME_OUT=5000;
var ACTS_StopServiceExtension = {
  events: ["ACTS_StopEvent_First", "ACTS_StopEvent_Second", "ACTS_StopEvent_Third"]
};

function sleep(delay) {
    let start = new Date().getTime();
    while (true) {
        if (new Date().getTime() - start > delay) {
            break;
        }
    }
}

export default function abilityTest() {
  describe('ActsAbilityTest', function () {
    /*
     * @tc.number: Acts_StopServiceExtension_0100
     * @tc.name: Distributed Component Support Remote Stop Extension
     * @tc.desc: Local device usage StopServiceExtensionAbility Stop the ServiceExtension application
     *           started by startAbility.
     */
    it('Acts_StopServiceExtension_0100', 0, async function (done) {
      let subscriber;
      let flag = false;
      let want = {
        bundleName: "com.acts.stopserviceextensiontest",
        abilityName: "ServiceAbility",
        action: "Acts_StopServiceExtension_0100"
      }
      console.info("====>Acts_StopServiceExtension_0100 start");
      commonEvent.createSubscriber(ACTS_StopServiceExtension).then(async (data) => {
        console.info("====>Acts_StopServiceExtension_0100 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(want, (err) => {
          console.info("====>Acts_StopServiceExtension_0100 startAbility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.info("====>Acts_StopServiceExtension_0100 subscribeCallBack data: " + JSON.stringify(data));
        if (data.event == "ACTS_StopEvent_First") {
          flag = true;
          globalThis.abilityContext.stopServiceExtensionAbility(want, (err) => {
            console.info("====>Acts_StopServiceExtension_0100 stopServiceExtensionAbility err: " + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            commonEvent.unsubscribe(subscriber, unSubscribeCallback);
          })
        }
      }

      function unSubscribeCallback() {
        console.info("====>Acts_StopServiceExtension_0100 unSubscribeCallback");
        done();
      }

      setTimeout(() => {
        if (flag == false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }, CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_StopServiceExtension_0200
     * @tc.name: Distributed Component Support Remote Stop Extension
     * @tc.desc: Local device usage StopServiceExtensionAbility Stop the ServiceExtension application
     *           started by startAbility.
     */
    it('Acts_StopServiceExtension_0200', 0, async function (done) {
      let subscriber;
      let flag = false;
      let count = 0;
      console.info("====>Acts_StopServiceExtension_0200 start");
      commonEvent.createSubscriber(ACTS_StopServiceExtension).then(async (data) => {
        console.info("====>Acts_StopServiceExtension_0200 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.acts.stopserviceextensiontest",
            abilityName: "ServiceAbility",
            action: "Acts_StopServiceExtension_0200"
          }, (err) => {
          console.info("====>Acts_StopServiceExtension_0200 startAbility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        if (data.event == "ACTS_StopEvent_First") {
          console.info("====>Acts_StopServiceExtension_0200 subscribeCallBack First data: " + JSON.stringify(data));
          expect(data.parameters.message).assertEqual(0);
          count++;
        } else if (data.event == "ACTS_StopEvent_Second") {
          console.info("====>Acts_StopServiceExtension_0200 subscribeCallBack Second data: " + JSON.stringify(data));
          expect(data.parameters.message.bundleName).assertEqual('com.acts.stopserviceextensiontest');
          expect(data.parameters.message.abilityName).assertEqual('ServiceAbilitySec');
          count++;
        }
        if (count == 2) {
          flag = true;
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        globalThis.abilityContext.stopServiceExtensionAbility({
          bundleName: "com.acts.stopserviceextensiontest",
          abilityName: "ServiceAbility"
        }, (err) => {
          console.info("====>Acts_StopServiceExtension_0200 stop ServiceAbility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(0);
          console.info("====>Acts_StopServiceExtension_0200 unSubscribeCallback");
          done();
        })
      }

      setTimeout(() => {
        if (flag == false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }, CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_StopServiceExtension_0300
     * @tc.name: Distributed Component Support Remote Stop Extension
     * @tc.desc: Local device usage StopServiceExtensionAbility Stop the ServiceExtension application
     *           started by startServiceExtensionAbility.
     */
    it('Acts_StopServiceExtension_0300', 0, async function (done) {
      let subscriber;
      let flag = false;
      let want = {
        bundleName: "com.acts.stopserviceextensiontest",
        abilityName: "ServiceAbility",
        action: "Acts_StopServiceExtension_0300"
      }
      console.info("====>Acts_StopServiceExtension_0300 start");
      commonEvent.createSubscriber(ACTS_StopServiceExtension).then(async (data) => {
        console.info("====>Acts_StopServiceExtension_0300 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startServiceExtensionAbility(want, (err) => {
          console.info("====>Acts_StopServiceExtension_0300 startAbility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.info("====>Acts_StopServiceExtension_0300 subscribeCallBack data: " + JSON.stringify(data));
        if (data.event == "ACTS_StopEvent_First") {
          flag = true;
          globalThis.abilityContext.stopServiceExtensionAbility(want, (err) => {
            console.info("====>Acts_StopServiceExtension_0300 stopServiceExtensionAbility err: " +
            JSON.stringify(err));
            expect(err.code).assertEqual(0);
            commonEvent.unsubscribe(subscriber, unSubscribeCallback);
          })
        }
      }

      function unSubscribeCallback() {
        console.info("====>Acts_StopServiceExtension_0300 unSubscribeCallback");
        done();
      }

      setTimeout(() => {
        if (flag == false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }, CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_StopServiceExtension_0400
     * @tc.name: Distributed Component Support Remote Stop Extension
     * @tc.desc: Local device usage StopServiceExtensionAbility Stop the ServiceExtension application
     *           started by startServiceExtensionAbility.
     */
    it('Acts_StopServiceExtension_0400', 0, async function (done) {
      let subscriber;
      let flag = false;
      let count = 0;
      console.info("====>Acts_StopServiceExtension_0400 start");
      commonEvent.createSubscriber(ACTS_StopServiceExtension).then(async (data) => {
        console.info("====>Acts_StopServiceExtension_0400 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.acts.stopserviceextensiontest",
            abilityName: "ServiceAbility",
            action: "Acts_StopServiceExtension_0400"
          }, (err) => {
          console.info("====>Acts_StopServiceExtension_0400 startAbility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        if (data.event == "ACTS_StopEvent_First") {
          console.info("====>Acts_StopServiceExtension_0400 subscribeCallBack First data: " + JSON.stringify(data));
          expect(data.parameters.message).assertEqual(0);
          count++;
        } else if (data.event == "ACTS_StopEvent_Second") {
          console.info("====>Acts_StopServiceExtension_0400 subscribeCallBack Second data: " + JSON.stringify(data));
          expect(data.parameters.message.bundleName).assertEqual('com.acts.stopserviceextensiontest');
          expect(data.parameters.message.abilityName).assertEqual('ServiceAbilitySec');
          count++;
        }
        if (count == 2) {
          flag = true;
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        globalThis.abilityContext.stopServiceExtensionAbility({
          bundleName: "com.acts.stopserviceextensiontest",
          abilityName: "ServiceAbility"
        }, (err) => {
          console.info("====>Acts_StopServiceExtension_0400 stop ServiceAbility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(0);
          console.info("====>Acts_StopServiceExtension_0400 unSubscribeCallback");
          done();
        })
      }

      setTimeout(() => {
        if (flag == false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }, CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_StopServiceExtension_0500
     * @tc.name: Distributed Component Support Remote Stop Extension
     * @tc.desc: Local device usage StopServiceExtensionAbility Stop the ServiceExtension application
     *           started by connectServiceExtensionAbility.
     */
    it('Acts_StopServiceExtension_0500', 0, async function (done) {
      let subscriber;
      let flag = false;
      let disConnect = false;
      let want = {
        bundleName: "com.acts.stopserviceextensiontest",
        abilityName: "ServiceAbility",
        action: "Acts_StopServiceExtension_0500"
      }
      let options = {
        onConnect: async function (element: any, proxy: any) {
          console.info("Acts_StopServiceExtension_0500 service onConnect success!!!")
          console.info('Acts_StopServiceExtension_0500 service onConnect element : ' + JSON.stringify(element));
          console.info('Acts_StopServiceExtension_0500 service onConnect proxy : ' + JSON.stringify(proxy));
        },
        onDisconnect: async function (element1: any) {
          disConnect = true;
          console.info("Acts_StopServiceExtension_0500 service onDisconnect success!!!")
          console.info('Acts_StopServiceExtension_0500 service onDisconnect ele : ' + JSON.stringify(element1));
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        },
        onFailed: async function (code: any) {
          console.info("Acts_StopServiceExtension_0500 service onFailed!!!")
          console.info('Acts_StopServiceExtension_0500 service onFailed errCode : ' + JSON.stringify(code));
        },
      }
      console.info("====>Acts_StopServiceExtension_0500 start");
      commonEvent.createSubscriber(ACTS_StopServiceExtension).then(async (data) => {
        console.info("====>Acts_StopServiceExtension_0500 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.connectServiceExtensionAbility(want, options, (err) => {
          console.info("====>Acts_StopServiceExtension_0500 startAbility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.info("====>Acts_StopServiceExtension_0500 subscribeCallBack data: " + JSON.stringify(data));
        if (data.event == "ACTS_StopEvent_First") {
          flag = true;
          globalThis.abilityContext.stopServiceExtensionAbility(want, (err) => {
            console.info("====>Acts_StopServiceExtension_0500 stopServiceExtensionAbility err: " + JSON.stringify(err));
            expect(err.code).assertEqual(0);
          })
        }
      }

      function unSubscribeCallback() {
        console.info("====>Acts_StopServiceExtension_0500 unSubscribeCallback");
        expect(disConnect).assertTrue();
        done();
      }

      setTimeout(() => {
        if (flag == false || disConnect == false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }, CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_StopServiceExtension_0600
     * @tc.name: Distributed Component Support Remote Stop Extension
     * @tc.desc: Local device usage StopServiceExtensionAbility Stop the ServiceExtension application
     *           started by connectServiceExtensionAbility.
     */
    it('Acts_StopServiceExtension_0600', 0, async function (done) {
      console.info("====>Acts_StopServiceExtension_0600 start");
      let subscriber;
      let count = 0;
      commonEvent.createSubscriber(ACTS_StopServiceExtension).then(async (data) => {
        console.info("====>Acts_StopServiceExtension_0600 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.acts.stopserviceextensiontest",
            abilityName: "ServiceAbility",
            action: "Acts_StopServiceExtension_0600"
          }, (err) => {
          console.info("====>Acts_StopServiceExtension_0600 startAbility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        if (data.event == "ACTS_StopEvent_First") {
          console.info("====>Acts_StopServiceExtension_0600 subscribeCallBack First data: " + JSON.stringify(data));
          expect(data.parameters.message).assertEqual(0);
          count++;
        } else if (data.event == "ACTS_StopEvent_Second") {
          console.info("====>Acts_StopServiceExtension_0600 subscribeCallBack Second data: " + JSON.stringify(data));
          expect(data.parameters.message.bundleName).assertEqual('com.acts.stopserviceextensiontest');
          expect(data.parameters.message.abilityName).assertEqual('ServiceAbilitySec');
          count++;
        } else if (data.event == "ACTS_StopEvent_Third") {
          sleep(500)
          console.info("====>Acts_StopServiceExtension_0600 subscribeCallBack Third data: " + JSON.stringify(data));
          expect(data.parameters.message).assertTrue();
          count++;
        }
        if (count == 3) {
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        globalThis.abilityContext.stopServiceExtensionAbility({
          bundleName: "com.acts.stopserviceextensiontest",
          abilityName: "ServiceAbility"
        }, (err) => {
          console.info("====>Acts_StopServiceExtension_0600 stop ServiceAbility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(0);
          console.info("====>Acts_StopServiceExtension_0600 unSubscribeCallback");
          done();
        })
      }
    })

    /*
     * @tc.number: Acts_StopServiceExtension_0700
     * @tc.name: Distributed Component Support Remote Stop Extension
     * @tc.desc: Calling stopServiceExtensionAbility to stop the remote device ServiceExtension application
     *           without distributed permissions returns an error value.
     */
    it('Acts_StopServiceExtension_0700', 0, async function (done) {
      console.info("====>Acts_StopServiceExtension_0700 start");
      let want = {
        deviceId: "abcdefg12345678",
        bundleName: "com.acts.stopserviceextensiontest",
        abilityName: "ServiceAbility",
        action: "Acts_StopServiceExtension_0700"
      }
      globalThis.abilityContext.stopServiceExtensionAbility(want, (err) => {
        console.info("====>Acts_StopServiceExtension_0700 stopServiceExtensionAbility err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /*
     * @tc.number: Acts_StopServiceExtension_0800
     * @tc.name: Distributed Component Support Remote Stop Extension
     * @tc.desc: Calling stopServiceExtensionAbility to stop the remote device ServiceExtension application
     *           without distributed permissions returns an error value.
     */
    it('Acts_StopServiceExtension_0800', 0, async function (done) {
      let subscriber;
      let flag = false;
      console.info("====>Acts_StopServiceExtension_0800 start");
      commonEvent.createSubscriber(ACTS_StopServiceExtension).then(async (data) => {
        console.info("====>Acts_StopServiceExtension_0800 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.acts.stopserviceextensiontest",
            abilityName: "ServiceAbility",
            action: "Acts_StopServiceExtension_0800"
          }, (err) => {
          console.info("====>Acts_StopServiceExtension_0800 startAbility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.info("====>Acts_StopServiceExtension_0800 subscribeCallBack data: " + JSON.stringify(data));
        if (data.event == "ACTS_StopEvent_First") {
          expect(data.parameters.message).assertEqual(401);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        globalThis.abilityContext.stopServiceExtensionAbility({
          bundleName: "com.acts.stopserviceextensiontest",
          abilityName: "ServiceAbility"
        }, (err) => {
          console.info("====>Acts_StopServiceExtension_0800 stop ServiceAbility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(0);
          console.info("====>Acts_StopServiceExtension_0800 unSubscribeCallback");
          done();
        })
      }

      setTimeout(() => {
        if (flag == false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }, CASE_TIME_OUT)
    })

    /*
     * @tc.number: Acts_StopServiceExtension_1700
     * @tc.name: Distributed Component Support Remote Stop Extension
     * @tc.desc: The local device does not have distributed permissions. The device ID is undefined. Call
     *           stopServiceExtensionAbility to stop the ServiceExtension application and return an error value.
     */
    it('Acts_StopServiceExtension_1700', 0, async function (done) {
      console.info("====>Acts_StopServiceExtension_1700 start");
      let want = {
        deviceId: undefined,
        bundleName: "com.acts.stopserviceextensiontest",
        abilityName: "ServiceAbility",
        action: "Acts_StopServiceExtension_1700"
      }
      globalThis.abilityContext.stopServiceExtensionAbility(want, (err) => {
        console.info("====>Acts_StopServiceExtension_1700 stopServiceExtensionAbility err: " + JSON.stringify(err));
        expect(err.code).assertEqual(16000050);
        done();
      })
    })

    /*
     * @tc.number: Acts_StopServiceExtension_1800
     * @tc.name: Distributed Component Support Remote Stop Extension
     * @tc.desc: The local device does not have distributed permissions. The device ID is undefined. Call
     *           stopServiceExtensionAbility to stop the ServiceExtension application and return an error value.
     */
    it('Acts_StopServiceExtension_1800', 0, async function (done) {
      let subscriber;
      let flag = false;
      console.info("====>Acts_StopServiceExtension_1800 start");
      commonEvent.createSubscriber(ACTS_StopServiceExtension).then(async (data) => {
        console.info("====>Acts_StopServiceExtension_1800 Create Subscribe");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilityContext.startAbility(
          {
            bundleName: "com.acts.stopserviceextensiontest",
            abilityName: "ServiceAbility",
            action: "Acts_StopServiceExtension_1800"
          }, (err) => {
          console.info("====>Acts_StopServiceExtension_1800 startAbility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      function subscribeCallBack(err, data) {
        console.info("====>Acts_StopServiceExtension_1800 subscribeCallBack data: " + JSON.stringify(data));
        if (data.event == "ACTS_StopEvent_First") {
          expect(data.parameters.message).assertEqual(16000050);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      function unSubscribeCallback() {
        globalThis.abilityContext.stopServiceExtensionAbility({
          bundleName: "com.acts.stopserviceextensiontest",
          abilityName: "ServiceAbility"
        }, (err) => {
          console.info("====>Acts_StopServiceExtension_1800 stop ServiceAbility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(0);
          console.info("====>Acts_StopServiceExtension_1800 unSubscribeCallback");
          done();
        })
      }

      setTimeout(() => {
        if (flag == false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }, CASE_TIME_OUT)
    })
  })
}

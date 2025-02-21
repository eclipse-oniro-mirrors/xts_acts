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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Component, Driver, UiWindow, ON, UiDriver } from '@ohos.UiTest';
import commonEvent from '@ohos.commonEvent';
import appManager from '@ohos.app.ability.appManager';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

let ACTS_ProcessState = {
  events: ["processState"]
};

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function abilityTest() {
  describe('GetRunningProcessInformationTest', function () {

    beforeEach(async function () {
      var abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd1 = 'hilog -r';
      await abilityDelegator.executeShellCommand(cmd1, (err: any, data: any) => {
        console.info("executeShellCommand1 callback");
      });
      await abilityDelegator.executeShellCommand("hilog -G 20M", async (err, data) => {
      });
    })

    afterEach(async function () {
      var abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd1 = 'aa force-stop com.example.applicationstatechangeonereply';
      let cmd2 = 'aa force-stop com.example.applicationstatechangetworeply';
      let cmd6 = 'aa force-stop com.example.applicationstatechangethreereply';
      let cmd4 = 'aa force-stop com.example.getrunningprocessinformationonereply';
      let cmd5 = 'aa force-stop com.example.getrunningprocessinformationtworeply';
      let cmd3 = 'hilog -r';
      await abilityDelegator.executeShellCommand(cmd1).then(() => {
        console.info("executeShellCommand1 callback");
      });
      await abilityDelegator.executeShellCommand(cmd2).then(() => {
        console.info("executeShellCommand2 callback");
      });
      await abilityDelegator.executeShellCommand(cmd3).then(() => {
        console.info("executeShellCommand3 callback");
      });
      await abilityDelegator.executeShellCommand(cmd4).then(() => {
        console.info("executeShellCommand3 callback");
      });
      await abilityDelegator.executeShellCommand(cmd5).then(() => {
        console.info("executeShellCommand3 callback");
      });
      await abilityDelegator.executeShellCommand(cmd6).then(() => {
        console.info("executeShellCommand3 callback");
      });
    })

    /*
     * @tc.number: Acts_ApplicationStateChange_0100
     * @tc.name: Register and deregister to monitor the foreground and background changes of this application.
     * @tc.desc: In the same application, the on interface is called once, but the off interface is not called, and the
     *           foreground and background changes can be monitored.
     */
    it('Acts_ApplicationStateChange_0100', 0, function (done) {
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "Normal"
      };
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "Normal"
      };
      let subscriber;

      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0100 unSubscribeCallback");
        done();
      }

      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0100 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0100 err: " + JSON.stringify(err));
        if (data.event == "processState") {
          try {
            expect(data.parameters.commonStateArr[0]).assertEqual(1);
            expect(data.parameters.commonStateArr[1]).assertEqual(1);
            expect(data.parameters.commonStateArr[2]).assertEqual(-1);
            expect(data.parameters.commonStateArr[3]).assertEqual(-1);     
          }
          catch (error) {
            console.log("An error is generated");
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      setTimeout(() => {
        console.log('Acts_ApplicationStateChange_0100');
        commonEvent.createSubscriber(ACTS_ProcessState).then((data) => {
          console.debug("====>Acts_ApplicationStateChange_0100 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code);
            expect(error.code).assertEqual(0);
          })

          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code);
              expect(error.code).assertEqual(0);
            })
          }, 3000);

        });
      }, 700);
    })

    /*
     * @tc.number: Acts_ApplicationStateChange_0200
     * @tc.name: Register and deregister to monitor the foreground and background changes of this application.
     * @tc.desc: In the same application, the on interface is called once, and the off interface is called, and the
     *           foreground and background changes can be monitored.
     */
    it('Acts_ApplicationStateChange_0200', 0, async function (done) {
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "NeedBackGroundOff"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "Normal"
      }
      let subscriber;

      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0200 unSubscribeCallback");
        done();
      }

      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0200 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0200 err: " + JSON.stringify(err));
        if (data.event == "processState") {
          console.info("entered assert zone!");
          try {
            expect(data.parameters.commonStateArr[0]).assertEqual(-1);
            expect(data.parameters.commonStateArr[1]).assertEqual(1);
            expect(data.parameters.commonStateArr[2]).assertEqual(-1);
            expect(data.parameters.commonStateArr[3]).assertEqual(-1);
          }
          catch {
            console.log("An error is generated");
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      setTimeout(() => {
        console.log('Acts_ApplicationStateChange_0200');
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_ApplicationStateChange_0200 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code);
            expect(error.code).assertEqual(0);
          })

          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code);
              expect(error.code).assertEqual(0);
            })
          }, 3000);         
        })
      }, 700);
    })

    /*
     * @tc.number: Acts_ApplicationStateChange_0300
     * @tc.name: Register and deregister to monitor the foreground and background changes of this application.
     * @tc.desc: In the same application, the on interface is called many times, but the off interface is not called,
     *           and the foreground and background changes can be monitored.
     */
    it('Acts_ApplicationStateChange_0300', 0, async function (done) {
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "doubleRegister"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "Normal"
      }

      let subscriber;

      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0300 unSubscribeCallback");
        done();
      }

      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0300 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0300 err: " + JSON.stringify(err));
        if (data.event == "processState") {
          console.info("entered assert zone!")
          try {
            expect(data.parameters.commonStateArr[0]).assertEqual(1);
            expect(data.parameters.commonStateArr[1]).assertEqual(1);
            expect(data.parameters.commonStateArr[2]).assertEqual(1);
            expect(data.parameters.commonStateArr[3]).assertEqual(1);
          }
          catch (error) {
            console.log("An error is generated");
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      setTimeout(() => {
        console.log('Acts_ApplicationStateChange_0300');
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_ApplicationStateChange_0300 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code);
            expect(error.code).assertEqual(0);
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code);
              expect(error.code).assertEqual(0);
            })
          }, 3000);
        })
      }, 700);
    })

    /*
     * @tc.number: Acts_ApplicationStateChange_0400
     * @tc.name: Register and deregister to monitor the foreground and background changes of this application.
     * @tc.desc: In the same application, the on interface is called many times, and the off interface is called
     *           (Callback is specified), and the foreground and background changes can be monitored.
     */
    it('Acts_ApplicationStateChange_0400', 0, async function (done) {
      let abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "doubleNeedBackGroundOff"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "Normal"
      }

      let subscriber;

      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0400 unSubscribeCallback");
        done();
      }

      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0400 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0400 err: " + JSON.stringify(err));
        if (data.event == "processState") {
          console.info("entered assert zone!");
          try {
            expect(data.parameters.commonStateArr[0]).assertEqual(1);
            expect(data.parameters.commonStateArr[1]).assertEqual(1);
            expect(data.parameters.commonStateArr[2]).assertEqual(-1);
            expect(data.parameters.commonStateArr[3]).assertEqual(1);
          }
          catch (error) {
            console.log("An error is generated");
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      setTimeout(() => {
        console.log('Acts_ApplicationStateChange_0400');
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_ApplicationStateChange_0400 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code);
            expect(error.code).assertEqual(0);
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code);
              expect(error.code).assertEqual(0);
            })
          }, 3000)
        })
      }, 700)
    })

    /*
     * @tc.number: Acts_ApplicationStateChange_0500
     * @tc.name: Register and deregister to monitor the foreground and background changes of this application.
     * @tc.desc: In the different application, the on interface is called many times, and the off interface is called,
     *           and the foreground and background changes can be monitored.
     */
    it('Acts_ApplicationStateChange_0500', 0, async function (done) {
      let abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "MultiAppRegister"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "MultiAppRegister"
      }

      let subscriber;

      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0500 unSubscribeCallback");
        done();
      }

      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0500 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0500 err: " + JSON.stringify(err));
        if (data.event == "processState") {
          console.info("entered assert zone!");
          try {
            expect(data.parameters.commonStateArr[0]).assertEqual(-1);
            expect(data.parameters.commonStateArr[1]).assertEqual(1);
            expect(data.parameters.commonStateArr[2]).assertEqual(-1);
            expect(data.parameters.commonStateArr[3]).assertEqual(-1);
          }
          catch (error) {
            console.log("An error is generated");
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      setTimeout(() => {
        console.log('Acts_ApplicationStateChange_0500');
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_ApplicationStateChange_0500 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code);
            expect(error.code).assertEqual(0);
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code);
              expect(error.code).assertEqual(0);
            })
          }, 3000);
        })
      }, 700);
    })

    /*
     * @tc.number: Acts_ApplicationStateChange_0600
     * @tc.name: Register and deregister to monitor the foreground and background changes of this application.
     * @tc.desc: In the same application, the on interface is called many times, and the off interface is called
     *           (Callback is not specified), and the foreground and background changes can be monitored.
     */
    it('Acts_ApplicationStateChange_0600', 0, async function (done) {
      let abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "DoubleRegisterOff"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "DoubleRegisterOff"
      }

      let subscriber;

      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0600 unSubscribeCallback");
        done();
      }

      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0600 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0600 err: " + JSON.stringify(err));
        if (data.event == "processState") {
          console.info("entered assert zone!");
          try {
            expect(data.parameters.commonStateArr[0]).assertEqual(-1);
            expect(data.parameters.commonStateArr[1]).assertEqual(1);
            expect(data.parameters.commonStateArr[2]).assertEqual(-1);
            expect(data.parameters.commonStateArr[3]).assertEqual(1);
          }
          catch (error) {
            console.log("An error is generated");
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      setTimeout(() => {
        console.log('Acts_ApplicationStateChange_0600');
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_ApplicationStateChange_0600 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code);
            expect(error.code).assertEqual(0);
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code);
              expect(error.code).assertEqual(0);
            })
          }, 3000);
        })
      }, 700);
    })

    /*
     * @tc.number: Acts_ApplicationStateChange_0700
     * @tc.name: Register and deregister to monitor the foreground and background changes of this application.
     * @tc.desc: In the same application, call on interface, call off interface and then call on again., and the
     *           foreground and background changes can be monitored.
     */
    it('Acts_ApplicationStateChange_0700', 0, function (done) {
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "RegisterOnOffOn"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "Normal"
      }
      let subscriber;

      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0700 unSubscribeCallback");
        done();
      }

      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0700 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0700 err: " + JSON.stringify(err));
        if (data.event == "processState") {
          try {
            expect(data.parameters.commonStateArr[0]).assertEqual(1);
            expect(data.parameters.commonStateArr[1]).assertEqual(1);
            expect(data.parameters.commonStateArr[2]).assertEqual(-1);
            expect(data.parameters.commonStateArr[3]).assertEqual(-1);
          }
          catch (error) {
            console.log("An error is generated");
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      setTimeout(() => {
        console.log('Acts_ApplicationStateChange_0700');
        commonEvent.createSubscriber(ACTS_ProcessState).then((data) => {
          console.debug("====>Acts_ApplicationStateChange_0700 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code);
            expect(error.code).assertEqual(0);
          })

          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code);
              expect(error.code).assertEqual(0);
            })
          }, 3000);

        })
      }, 700);
    })

    /*
     * @tc.number: Acts_ApplicationStateChange_0800
     * @tc.name: Register and deregister to monitor the foreground and background changes of this application.
     * @tc.desc: In the same application, start multiple abilities, call the on interface, and not all the application
     *           abilities can't be monitored in the background.
     */
    it('Acts_ApplicationStateChange_0800', 0, async function (done) {
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangethreereply",
        "abilityName": "EntryAbility",
        "action": "DoubleAbilityTest"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangethreereply",
        "abilityName": "EntryAbility1",
        "action": "DoubleAbilityTest"
      }

      let subscriber;

      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0800 unSubscribeCallback");
        done();
      }

      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0800 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0800 err: " + JSON.stringify(err));
        if (data.event == "processState") {
          console.info("entered assert zone!");
          try {
            expect(data.parameters.commonStateArr).assertEqual(-1);
          }
          catch (error) {
            console.log("An error is generated");
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      setTimeout(() => {
        console.log('Acts_ApplicationStateChange_0800');
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_ApplicationStateChange_0800 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code);
            expect(error.code).assertEqual(0);
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code);
              expect(error.code).assertEqual(0);
            })
          }, 3000);
        })
      }, 700);
    })

    /*
     * @tc.number: Acts_GetRunningProcessInformation_AsyncCallback_0100
     * @tc.name: When getting ProcessInfo, add the state field.
     * @tc.desc: When the application obtains and does not obtain the focus, it can get the process information by
     *           calling the getRunningProcessInformation interface in AsyncCallback mode.
     */
    it('Acts_GetRunningProcessInformation_AsyncCallback_0100', 0, async function (done) {
      let TAG = 'Acts_GetRunningProcessInformation_AsyncCallback_0100_TAG';
      console.info(TAG, 'Start.');
      let abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let appState = -1;
      function setAppState(){
        globalThis.applicationContext.getRunningProcessInformation((err, data) => {
          if (err) {
            console.info(TAG, 'getRunningProcessInformation err: ' + JSON.stringify(err));
          }
          else {
            console.info(TAG, 'getRunningProcessInformation State: ', data[0].state);
            appState = data[0].state;
          }
        });
      }
      let want = {
        "bundleName": "com.example.getrunningprocessinformationonereply",
        "abilityName": "EntryAbility",
      };
      let options = {
        windowMode: AbilityConstant.WindowMode.WINDOW_MODE_FLOATING
      }
      let testWant = {
        "bundleName": "com.example.getrunningprocessinformationtest",
        "abilityName": "TestAbility"
      }
      await sleep(500);
      await globalThis.abilityContext.startAbility(testWant).then(async () => {
        console.info(TAG, 'Start test ability sucessfully.');
        await sleep(1500);
        setAppState();
        await sleep(500);
        expect(appState == 2 || appState == 1).assertTrue();
      }).catch((error) => {
        console.info(TAG, 'Start test ability error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      await sleep(1000);
      await globalThis.abilityContext.startAbility(want, options).then(async () => {
        console.info(TAG, 'Start rely app sucessfully.');
        await sleep(1500);
        setAppState();
        await sleep(500);
        expect(appState).assertEqual(1);
        await abilityDelegator.executeShellCommand('aa force-stop com.example.getrunningprocessinformationonereply');
      }).catch((error) => {
        console.info(TAG, 'Start rely app error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      await sleep(1000);
      await globalThis.abilityContext.startAbility(want).then(async () => {
        console.info(TAG, 'Start rely app sucessfully.');
        await sleep(1500);
        setAppState();
        await sleep(500);
        expect(appState).assertEqual(3);
        console.info(TAG, 'End.');
        done();
      }).catch((error) => {
        console.info(TAG, 'Start rely app error: ' + JSON.stringify(error));
        expect().assertFail();
        console.info(TAG, 'End.');
        done();
      })
    })

    /*
     * @tc.number: Acts_GetRunningProcessInformation_Promise_0100
     * @tc.name: When getting ProcessInfo, add the state field.
     * @tc.desc: When the application obtains and does not obtain the focus, it can get the process information by
     *           calling the getRunningProcessInformation interface in promise mode.
     */
    it('Acts_GetRunningProcessInformation_Promise_0100', 0, async function (done) {
      let TAG = 'Acts_GetRunningProcessInformation_Promise_0100_TAG';
      console.info(TAG, 'Start.');
      let abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let appState = -1;
      function setAppState(){
        globalThis.applicationContext.getRunningProcessInformation().then((data) => {
          console.info(TAG, 'getRunningProcessInformation State: ', data[0].state);
          appState = data[0].state;
        }).catch((err) => {
          console.info(TAG, 'getRunningProcessInformation err: ' + JSON.stringify(err));
        })
      }
      let want = {
        "bundleName": "com.example.getrunningprocessinformationonereply",
        "abilityName": "EntryAbility",
      };
      let options = {
        windowMode: AbilityConstant.WindowMode.WINDOW_MODE_FLOATING
      }
      let testWant = {
        "bundleName": "com.example.getrunningprocessinformationtest",
        "abilityName": "TestAbility"
      }
      await sleep(500);
      await globalThis.abilityContext.startAbility(testWant).then(async () => {
        console.info(TAG, 'Start test ability sucessfully.');
        await sleep(1500);
        setAppState();
        await sleep(500);
        expect(appState == 2 || appState == 1).assertTrue();
      }).catch((error) => {
        console.info(TAG, 'Start test ability error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      await sleep(1000);
      await globalThis.abilityContext.startAbility(want, options).then(async () => {
        console.info(TAG, 'Start rely app sucessfully.');
        await sleep(1500);
        setAppState();
        await sleep(500);
        expect(appState).assertEqual(1);
        await abilityDelegator.executeShellCommand('aa force-stop com.example.getrunningprocessinformationonereply');
      }).catch((error) => {
        console.info(TAG, 'Start rely app error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      await sleep(1000);
      await globalThis.abilityContext.startAbility(want).then(async () => {
        console.info(TAG, 'Start rely app sucessfully.');
        await sleep(1500);
        setAppState();
        await sleep(500);
        expect(appState).assertEqual(3);
        console.info(TAG, 'End.');
        done();
      }).catch((error) => {
        console.info(TAG, 'Start rely app error: ' + JSON.stringify(error));
        expect().assertFail();
        console.info(TAG, 'End.');
        done();
      })
    })
  })
}
/*
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
import Subscriber from '@ohos.commonEvent'

var commonEventSubscribeInfo = { events: ["MainAbility5_onWindowStageDestroy"] };

export default function abilityTestSync() {

  let monitor = undefined;
  describe('ActsAbilityMonitorSync', function () {

    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time));
    }

    afterEach(async function (done) {
      console.info("afterEach each called");
      if (monitor) {
        console.info("afterEach removeAbilityMonitor monitor");
        globalThis.abilitydelegator.removeAbilityMonitor(monitor, () => {
          monitor = undefined;
        });
        await sleep(100);
      }
      done();
    });

    /**
     * @tc.number: ACTS_AddAbilityMonitorSync_0100
     * @tc.name: Verify that the addAbilityMonitorSync interface functions normally.
     * @tc.desc: Use addAbilityMonitorSync to add a monitor then use startAbility to trigger onAbilityCreate (Callback).
     */
    it('ACTS_AddAbilityMonitorSync_0100', 0, async function (done) {
      var CallbackFlag = 0
      console.log("====>ACTS_AddAbilityMonitorSync_0100--addAbilityMonitorSync--Subscriber====>");
      Subscriber.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        Subscriber.subscribe(sub, (err, msg) => {
          Subscriber.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(1)
          done()
        })
      })

      function onAbilityCreate() {
        console.log("====>ACTS_AddAbilityMonitorSync_0100--onAbilityCreate====>");
        CallbackFlag = 1;
      }

      console.log("====>ACTS_AddAbilityMonitorSync_0100--addAbilityMonitorSync--start====>");
      monitor = {
        abilityName: 'MainAbility5',
        onAbilityCreate: onAbilityCreate
      }
      try {
        globalThis.abilitydelegator.addAbilityMonitorSync(monitor);
      } catch (err) {
        expect().assertFail()
        console.log("====>ACTS_AddAbilityMonitorSync_0100--addAbilityMonitorSync--fail====>" + JSON.stringify(err));
        done()
      }
      console.log("====>ACTS_AddAbilityMonitorSync_0100--addAbilityMonitorSync--end====>");

      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility5'
        }).then(async () => {
        console.log("====>ACTS_AddAbilityMonitorSync_0100--startAbility success====>");
      });
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitorSync_0200
     * @tc.name: Verify that the addAbilityMonitorSync interface functions normally.
     * @tc.desc: Use addAbilityMonitorSync to add a monitor then use startAbility to
     * trigger onAbilityForeground (Callback).
     */
    it('ACTS_AddAbilityMonitorSync_0200', 0, async function (done) {
      var CallbackFlag = 0
      console.log("====>ACTS_AddAbilityMonitorSync_0200--addAbilityMonitorSync--Subscriber====>");
      Subscriber.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        Subscriber.subscribe(sub, (err, msg) => {
          Subscriber.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(1)
          done()
        })
      })

      function onAbilityForeground() {
        console.log("====>ACTS_AddAbilityMonitorSync_0200--onAbilityCreate====>");
        CallbackFlag = 1;
      }

      console.log("====>ACTS_AddAbilityMonitorSync_0200--addAbilityMonitorSync--start====>");
      monitor = {
        abilityName: 'MainAbility5',
        onAbilityForeground: onAbilityForeground,
        onWindowStageRestore: (Ability) => {
          console.info("===>ACTS_AddAbilityMonitorSync_0200 onWindowStageRestore");
        }
      }
      try {
        globalThis.abilitydelegator.addAbilityMonitorSync(monitor)
      } catch (err) {
        expect().assertFail()
        console.log("====>ACTS_AddAbilityMonitorSync_0200--addAbilityMonitorSync--fail====>" + JSON.stringify(err));
        done()
      }
      console.log("====>ACTS_AddAbilityMonitorSync_0200--end addAbilityMonitorSync====>");

      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility5'
        }).then(async () => {
        console.log("====>ACTS_AddAbilityMonitorSync_0200--startAbility success====>");
      })
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitorSync_0300
     * @tc.name: Verify that the addAbilityMonitorSync interface functions normally.
     * @tc.desc: Use addAbilityMonitorSync to add a monitor then use startAbility to trigger
     * onAbilityBackground (Callback).
     */
    it('ACTS_AddAbilityMonitorSync_0300', 0, async function (done) {
      var CallbackFlag = 0
      console.log("====>ACTS_AddAbilityMonitorSync_0300--addAbilityMonitorSync--Subscriber====>");
      Subscriber.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        Subscriber.subscribe(sub, (err, msg) => {
          Subscriber.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(1)
          done()
        })
      })

      function onAbilityBackgroundPromise() {
        console.log("====>ACTS_AddAbilityMonitorSync_0300 onAbilityBackgroundPromise ====>");
        CallbackFlag = 1;
      }

      console.log("====>ACTS_AddAbilityMonitorSync_0300--addAbilityMonitorSync--start====>");
      monitor = {
        abilityName: 'MainAbility5',
        onAbilityBackground: onAbilityBackgroundPromise
      }
      try {
        globalThis.abilitydelegator.addAbilityMonitorSync(monitor)
      } catch (err) {
        console.log("====>ACTS_AddAbilityMonitorSync_0300--error addAbilityMonitorSync====>" + JSON.stringify(err));
        expect().assertFail()
        done()
      }
      console.log("====>ACTS_AddAbilityMonitorSync_0300--addAbilityMonitorSync--end====>");

      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility5'
        }).then(async () => {
        console.log("====>ACTS_AddAbilityMonitorSync_0300--startAbility success====>");
      })
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitorSync_0400
     * @tc.name: Verify that the addAbilityMonitorSync interface functions normally.
     * @tc.desc: Use addAbilityMonitorSync to add a monitor then use startAbility
     * to trigger onAbilityDestroy (Callback).
     */
    it('ACTS_AddAbilityMonitorSync_0400', 0, async function (done) {
      var CallbackFlag = 0
      console.log("====>ACTS_AddAbilityMonitorSync_0400--addAbilityMonitorSync--Subscriber====>");
      Subscriber.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        Subscriber.subscribe(sub, (err, msg) => {
          Subscriber.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(1)
          done()
        })
      })

      function onAbilityDestroy() {
        console.log("====>ACTS_AddAbilityMonitorSync_0400 onAbilityDestroy ====>");
        CallbackFlag = 1;
      }

      console.log("====>ACTS_AddAbilityMonitorSync_0400--addAbilityMonitorSync--start====>");
      try {
        globalThis.abilitydelegator.addAbilityMonitorSync(
          {
            abilityName: 'MainAbility5',
            onAbilityDestroy: onAbilityDestroy
          })
      } catch (err) {
        console.log("====>ACTS_AddAbilityMonitorSync_0400--addAbilityMonitorSync--error====>" + JSON.stringify(err));
        expect().assertFail()
        done()
      }
      console.log("====>ACTS_AddAbilityMonitorSync_0400--addAbilityMonitorSync--end====>");
      monitor = {
        bundleName: 'com.example.abilitymonitortest',
        abilityName: 'MainAbility5'
      }
      globalThis.abilitydelegator.startAbility(monitor).then(async () => {
        console.log("====>ACTS_AddAbilityMonitorSync_0400--startAbility success====>");
      })
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitorSync_0500
     * @tc.name: Verify that the addAbilityMonitorSync interface functions normally.
     * @tc.desc: Use addAbilityMonitorSync to add a monitor then use startAbility
     * to trigger onWindowStageCreate (Callback).
     */
    it('ACTS_AddAbilityMonitorSync_0500', 0, async function (done) {
      var CallbackFlag = 0
      console.log("====>ACTS_AddAbilityMonitorSync_0500--addAbilityMonitorSync--Subscriber====>");
      Subscriber.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        Subscriber.subscribe(sub, (err, msg) => {
          Subscriber.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(1)
          done()
        })
      })

      function onWindowStageCreate() {
        console.log("====>ACTS_AddAbilityMonitorSync_0500 onWindowStageCreate ====>");
        CallbackFlag = 1;
      }

      console.log("====>ACTS_AddAbilityMonitorSync_0500--addAbilityMonitorSync--start====>");
      monitor = {
        abilityName: 'MainAbility5',
        onWindowStageCreate: onWindowStageCreate
      }
      try {
        globalThis.abilitydelegator.addAbilityMonitorSync(monitor)
      } catch (err) {
        console.log("====>ACTS_AddAbilityMonitorSync_0500--addAbilityMonitorSync--error====>" + JSON.stringify(err));
        expect().assertFail()
        done()
      }
      console.log("====>ACTS_AddAbilityMonitorSync_0500--addAbilityMonitorSync--end====>");

      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility5'
        }).then(async () => {
        console.log("====>ACTS_AddAbilityMonitorSync_0500--startAbility success====>");
      })
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitorSync_0600
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility
     * to trigger onWindowStageDestroy (Callback).
     */
    it('ACTS_AddAbilityMonitorSync_0600', 0, async function (done) {
      var CallbackFlag = 0
      console.log("====>ACTS_AddAbilityMonitorSync_0600--addAbilityMonitorSync--Subscriber====>");
      Subscriber.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        Subscriber.subscribe(sub, (err, msg) => {
          Subscriber.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(1)
          done()
        })
      })

      function onWindowStageDestroy() {
        console.log("====>ACTS_AddAbilityMonitor_0600 onWindowStageDestroy ====>");
        CallbackFlag = 1;
      }

      console.log("====>ACTS_AddAbilityMonitorSync_0600--addAbilityMonitorSync--start====>");
      monitor = {
        abilityName: 'MainAbility5',
        onWindowStageDestroy: onWindowStageDestroy
      }
      try {
        globalThis.abilitydelegator.addAbilityMonitorSync(monitor)
      } catch (err) {
        console.log("====>ACTS_AddAbilityMonitorSync_0600--addAbilityMonitorSync--error====>" + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log("====>ACTS_AddAbilityMonitorSync_0600--addAbilityMonitorSync--end====>");
      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility5'
        }).then(async () => {
        console.log("====>0600startAbility success====>");
      })
    })


    /**
     * @tc.number: ACTS_RemoveAbilityMonitorSync_0100
     * @tc.name: Verify that the removeAbilityMonitorSync interface functions normally.
     * @tc.desc: Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * to remove monitor then trigger
     *           onAbilityCreate (Callback).
     */
    it('ACTS_RemoveAbilityMonitorSync_0100', 0, async function (done) {
      var CallbackFlag = 0
      console.log("====>ACTS_AddAbilityMonitorSync_0600--addAbilityMonitorSync--Subscriber====>");
      Subscriber.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        Subscriber.subscribe(sub, (err, msg) => {
          Subscriber.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(0)
          done()
        })
      })

      function onAbilityCreate() {
        CallbackFlag = -1
        console.log("====>ACTS_RemoveAbilityMonitorSync_0100 onAbilityCreate ====>");
      }

      var monitor = {
        abilityName: 'MainAbility5',
        onAbilityCreate: onAbilityCreate
      }

      try {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0100 addAbilityMonitorSync start====>");
        globalThis.abilitydelegator.addAbilityMonitorSync(monitor)
        console.log("====>ACTS_RemoveAbilityMonitorSync_0100 ACTS_RemoveAbilityMonitorSync_0100 start====>");
        globalThis.abilitydelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0100 catch error ====>" + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log("====>ACTS_RemoveAbilityMonitorSync_0100 startAbility ====>");
      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility5'
        }).then(async () => {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0100 startAbility end====>");
      })
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitorSync_0200
     * @tc.name: Verify that the removeAbilityMonitorSync interface functions normally.
     * @tc.desc: Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * to remove monitor then trigger
     *           onAbilityForeground (Callback).
     */
    it('ACTS_RemoveAbilityMonitorSync_0200', 0, async function (done) {
      var CallbackFlag = 0
      console.log("====>ACTS_AddAbilityMonitorSync_0600--addAbilityMonitorSync--Subscriber====>");
      Subscriber.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        Subscriber.subscribe(sub, (err, msg) => {
          Subscriber.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(0)
          done()
        })
      })

      function onAbilityForeground() {
        CallbackFlag = -1
        console.log("====>ACTS_RemoveAbilityMonitorSync_0200 onAbilityForeground ====>");
      }

      var monitor = {
        abilityName: 'MainAbility5',
        onAbilityForeground: onAbilityForeground
      }
      try {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0200 addAbilityMonitorSync start====>");
        globalThis.abilitydelegator.addAbilityMonitorSync(monitor)
        console.log("====>ACTS_RemoveAbilityMonitorSync_0200 ACTS_RemoveAbilityMonitorSync_0100 start====>");
        globalThis.abilitydelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0200 catch error ====>" + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log("====>ACTS_RemoveAbilityMonitorSync_0200 startAbility ====>");
      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility5'
        }).then(async () => {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0200 startAbility end====>");
      })
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitorSync_0300
     * @tc.name: Verify that the removeAbilityMonitorSync interface functions normally.
     * @tc.desc: Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * to remove monitor then trigger
     *           onAbilityBackground (Callback).
     */
    it('ACTS_RemoveAbilityMonitorSync_0300', 0, async function (done) {
      var CallbackFlag = 0
      console.log("====>ACTS_AddAbilityMonitorSync_0600--addAbilityMonitorSync--Subscriber====>");
      Subscriber.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        Subscriber.subscribe(sub, (err, msg) => {
          Subscriber.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(0)
          done()
        })
      })

      function onAbilityBackground() {
        CallbackFlag = -1
        console.log("====>ACTS_RemoveAbilityMonitorSync_0300 onAbilityBackground ====>");
      }

      var monitor = {
        abilityName: 'MainAbility5',
        onAbilityBackground: onAbilityBackground
      }
      try {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0300 addAbilityMonitorSync start====>");
        globalThis.abilitydelegator.addAbilityMonitorSync(monitor)
        console.log("====>ACTS_RemoveAbilityMonitorSync_0100 ACTS_RemoveAbilityMonitorSync_0100 start====>");
        globalThis.abilitydelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0300 catch error ====>" + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log("====>ACTS_RemoveAbilityMonitorSync_0300 startAbility ====>");
      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility5'
        }).then(async () => {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0300 startAbility end====>");
      })
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitorSync_0400
     * @tc.name: Verify that the removeAbilityMonitorSync interface functions normally.
     * @tc.desc: Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * to remove monitor then trigger
     *           onAbilityDestroy (Callback).
     */
    it('ACTS_RemoveAbilityMonitor_0400', 0, async function (done) {
      var CallbackFlag = 0
      console.log("====>ACTS_AddAbilityMonitorSync_0400--addAbilityMonitorSync--Subscriber====>");
      Subscriber.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        Subscriber.subscribe(sub, (err, msg) => {
          Subscriber.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(0)
          done()
        })
      })

      function onAbilityDestroy() {
        CallbackFlag = -1
        console.log("====>ACTS_RemoveAbilityMonitor_0400 onAbilityDestroy ====>");
      }

      var monitor = {
        abilityName: 'MainAbility5',
        onAbilityDestroy: onAbilityDestroy
      }
      try {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0400 addAbilityMonitorSync start====>");
        globalThis.abilitydelegator.addAbilityMonitorSync(monitor)
        console.log("====>ACTS_RemoveAbilityMonitorSync_0400 ACTS_RemoveAbilityMonitorSync_0100 start====>");
        globalThis.abilitydelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0400 catch error ====>" + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log("====>ACTS_RemoveAbilityMonitorSync_0400 startAbility ====>");
      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility5'
        }).then(async () => {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0400 startAbility end====>");
      })
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitorSync_0500
     * @tc.name: Verify that the removeAbilityMonitorSync interface functions normally.
     * @tc.desc: Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * to remove monitor then trigger
     *           onWindowStageCreate (Callback).
     */
    it('ACTS_RemoveAbilityMonitorSync_0500', 0, async function (done) {
      var CallbackFlag = 0
      console.log("====>ACTS_AddAbilityMonitorSync_0600--addAbilityMonitorSync--Subscriber====>");
      Subscriber.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        Subscriber.subscribe(sub, (err, msg) => {
          Subscriber.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(0)
          done()
        })
      })

      function onWindowStageCreate() {
        CallbackFlag = -1
        console.log("====>onWindowStageCreate ====>");
      }

      var monitor = {
        abilityName: 'MainAbility5',
        onWindowStageCreate: onWindowStageCreate
      }
      try {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0500 addAbilityMonitorSync start====>");
        globalThis.abilitydelegator.addAbilityMonitorSync(monitor)
        console.log("====>ACTS_RemoveAbilityMonitorSync_0500 ACTS_RemoveAbilityMonitorSync_0100 start====>");
        globalThis.abilitydelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0500 catch error ====>" + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log("====>ACTS_RemoveAbilityMonitorSync_0500 startAbility ====>");
      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility5'
        }).then(async () => {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0500 startAbility end====>");
      })
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitorSync_0600
     * @tc.name: Verify that the removeAbilityMonitorSync interface functions normally.
     * @tc.desc: Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * to remove monitor then trigger
     *           onWindowStageDestroy (Callback).
     */
    it('ACTS_RemoveAbilityMonitorSync_0600', 0, async function (done) {
      var CallbackFlag = 0
      console.log("====>ACTS_AddAbilityMonitorSync_0600--addAbilityMonitorSync--Subscriber====>");
      Subscriber.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        Subscriber.subscribe(sub, (err, msg) => {
          Subscriber.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(0)
          done()
        })
      })

      function onWindowStageDestroy() {
        CallbackFlag = -1
        console.log("====>ACTS_RemoveAbilityMonitorSync_0600 onWindowStageDestroy ====>");
      }

      var monitor = {
        abilityName: 'MainAbility5',
        onWindowStageDestroy: onWindowStageDestroy
      }
      try {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0600 addAbilityMonitorSync start====>");
        globalThis.abilitydelegator.addAbilityMonitorSync(monitor)
        console.log("====>ACTS_RemoveAbilityMonitorSync_0600 ACTS_RemoveAbilityMonitorSync_0100 start====>");
        globalThis.abilitydelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0600 catch error ====>" + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log("====>ACTS_RemoveAbilityMonitorSync_0600 startAbility ====>");
      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility5'
        }).then(async () => {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0600 startAbility end====>");
      })
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitorSync_0700
     * @tc.name: Verify that the removeAbilityMonitorSync interface functions normally.
     * @tc.desc: Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * to remove monitor then trigger
     *           onAbilityCreate (Callback).
     */
    it('ACTS_RemoveAbilityMonitorSync_0700', 0, async function (done) {

      function onAbilityCreate() {
        console.log("====>onAbilityCreate====>");
      }

      try {
        globalThis.abilitydelegator.removeAbilityMonitorSync({
          abilityName: 'WrongName',
          onAbilityCreate: onAbilityCreate
        })
        console.log("====>ACTS_RemoveAbilityMonitorSync_0700 success====>");
        expect(true).assertTrue()
        done();
      } catch (err) {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0700 fail====>");
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitorSync_0800
     * @tc.name: Verify that the removeAbilityMonitorSync interface functions normally.
     * @tc.desc: Use waitAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * to remove monitor then trigger
     *           onAbilityCreate (Callback).
     */
    it('ACTS_RemoveAbilityMonitorSync_0800', 0, async function (done) {
      var CallbackFlag = 0
      console.log("====>ACTS_AddAbilityMonitorSync_0600--addAbilityMonitorSync--Subscriber====>");
      Subscriber.createSubscriber(commonEventSubscribeInfo, (err, sub) => {
        Subscriber.subscribe(sub, (err, msg) => {
          Subscriber.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(0)
          done()
        })
      })

      function onAbilityCreate() {
        CallbackFlag = -1
        console.log("====>ACTS_RemoveAbilityMonitorSync_0800 onAbilityCreate ====>");
      }

      var monitor = {
        abilityName: 'MainAbility5',
        onAbilityCreate: onAbilityCreate
      }
      try {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0800 addAbilityMonitorSync start====>");
        globalThis.abilitydelegator.addAbilityMonitorSync(monitor)
        console.log("====>ACTS_RemoveAbilityMonitorSync_0800 ACTS_RemoveAbilityMonitorSync_0100 start====>");
        globalThis.abilitydelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0800 catch error ====>" + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log("====>ACTS_RemoveAbilityMonitorSync_0800 startAbility ====>");
      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility5'
        }).then(async () => {
        console.log("====>ACTS_RemoveAbilityMonitorSync_0800 startAbility end====>");
      })
    })
  })
}
/*
 * Copyright (c) 2023-2025 Huawei Device Co., Ltd.
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
import AbilityDelegatorRegistry from "@ohos.app.ability.abilityDelegatorRegistry";
import { describe, beforeEach, afterEach, expect, it, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import commonEvent from '@ohos.commonEventManager';
let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let monitor: AbilityDelegatorRegistry.AbilityMonitor | null | undefined
let TAG: string = "";
let LABLE: string = "AbilityMonitorTest";
const want: Want = { bundleName: 'com.example.delegatortest', abilityName: 'Main2Ability', moduleName: 'entry' };
let ACTS_CallFunction: commonEvent.CommonEventSubscribeInfo = {
  events: ['Main2Ability.onAbilityCreate']
};

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function AbilityMonitorTest() {

  describe("AbilityMonitorTest", () => {
    beforeEach(async (done: Function) => {
      console.info("AbilityMonitorTest before each called");
      await sleep(500);
      done();
    });

    afterEach(async (done: Function) => {
      console.info(LABLE + TAG + "AbilityMonitorTest afterEach each called");
      if (monitor) {
        console.info(LABLE + TAG + "AbilityMonitorTest afterEach removeAbilityMonitor called");
        abilityDelegator.removeAbilityMonitor(monitor, () => {
          monitor = undefined;
        });
      }
      if (LABLE + TAG === "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200" ||
        TAG === "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500" ||
        TAG === "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0300" ||
        TAG === "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500" ||
        TAG === "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000" ||
        TAG === "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200") {
        if (globalThis.main2AbilityContext) {
          console.info(LABLE + TAG + "AbilityMonitorTest afterEach terminateSelf main2 called");
          globalThis.main2AbilityContext.terminateSelf();
        }
      }
      await sleep(500)
      console.info(LABLE + TAG + "AbilityMonitorTest afterEach each end");
      done()
    });

    /**
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100
     * @tc.desc   pass in a null monitor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100";
      console.log(LABLE + TAG + ":start")
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      monitor = null;
      try {
        abilityDelegator.addAbilityMonitor(monitor, (err: BusinessError) => {
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100" + err.code
          );
          expect().assertFail();
          done();
        });
      } catch (e) {
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100 code:" + e.code
        );
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100 message:" + e.message
        );
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parse");
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100 pass"
        );
        done();
      }
    });

    /**
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200
     * @tc.desc   Pass in a monitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200";
      console.log(LABLE + TAG + ":start")
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (data)=> {
          console.log("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200 ");
          expect(true).assertTrue();
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200 pass"
          );
          data.context.terminateSelf().then((data) => {
            console.log("AbilityMonitorTest terminateSelf successful data: " + JSON.stringify(data));
            abilityDelegator.removeAbilityMonitor(monitor);
            monitor = undefined;
            done();
          }).catch((error:BusinessError) => {
            console.log("AbilityMonitorTest terminateSelf error: " + JSON.stringify(error));
            abilityDelegator.removeAbilityMonitor(monitor);
            monitor = undefined;
            done();
          });
        },
      };
      abilityDelegator.addAbilityMonitor(monitor, (err: BusinessError) => {
        console.log("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200");
      });
      setTimeout(() => {
        abilityDelegator.startAbility(want);
      }, 500);
    });

    /**
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300
     * @tc.desc   Pass in a monitor that has already been added.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300";
      console.log(LABLE + TAG + ":start")
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (data) =>{
          expect(true).assertTrue();
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300 pass "
          );
          data.context.terminateSelf().then((data) => {
            console.log("AbilityMonitorTest terminateSelf successful data: " + JSON.stringify(data));
          }).catch((error:BusinessError) => {
            console.log("AbilityMonitorTest terminateSelf error: " + JSON.stringify(error));
          });
          abilityDelegator.removeAbilityMonitor(monitor, () => {
            monitor = undefined;
            done();
          });
        },
      };
      abilityDelegator.addAbilityMonitor(monitor, (err: BusinessError) => {
        console.log("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300");
      });
      setTimeout(() => {
        abilityDelegator.startAbility(want);
      }, 1000);
    });

    /**
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_PROMISE_0100
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0100
     * @tc.desc   pass in a null monitor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_0100";
      console.log(LABLE + TAG + ":start")
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let monitor = null;
      try {
        let result = await abilityDelegator.addAbilityMonitor(monitor);
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_ADD_ABILITY_MONITOR_PROMISE_0100 error"
        );
        expect().assertFail();
        done();
      } catch (e) {
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_ADD_ABILITY_MONITOR_PROMISE_0100 code:" + e.code
        );
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_ADD_ABILITY_MONITOR_PROMISE_0100 message:" + e.message
        );
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parse");;
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_ADD_ABILITY_MONITOR_PROMISE_0100 pass"
        );
        done();
      }
    });

    /**
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_PROMISE_0200
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0200
     * @tc.desc   Pass in a monitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_0200";
      console.log(LABLE + TAG + ":start")
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate:  (data) =>{
          expect(true).assertTrue();
          abilityDelegator.printSync('AbilityMonitorTest ACTS_ADD_ABILITY_MONITOR_PROMISE_0200 pass');
          data.context.terminateSelf().then((data) => {
            console.log("AbilityMonitorTest terminateSelf successful data: " + JSON.stringify(data));
            done();
          }).catch((error:BusinessError) => {
            console.log("AbilityMonitorTest terminateSelf error: " + JSON.stringify(error));
            done();
          });
        },
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      await abilityDelegator.startAbility(want).then((data) => {
        console.log(LABLE + TAG + "startAbility successful data: " + JSON.stringify(data));
      }).catch((error:BusinessError) => {
        console.log(LABLE + TAG + "startAbility error: " + JSON.stringify(error));
      });
    });

    /**
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_PROMISE_0300
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0300
     * @tc.desc   Pass in a monitor that has already been added.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0300", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_0300";
      console.log(LABLE + TAG + ":start")
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (data) =>{
          expect(true).assertTrue();
          data.context.terminateSelf().then((data) => {
            abilityDelegator.printSync(
              "AbilityMonitorTest ACTS_ADD_ABILITY_MONITOR_PROMISE_0300 pass"
            );
          }).catch((error:BusinessError) => {
            abilityDelegator.printSync(
              "AbilityMonitorTest ACTS_ADD_ABILITY_MONITOR_PROMISE_0300 pass"
            );
          });
          abilityDelegator.removeAbilityMonitor(monitor, () => {
            monitor = undefined;
            done();
          });
        },
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      await abilityDelegator.addAbilityMonitor(monitor);
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100
     * @tc.desc   pass in a null monitor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100";
      console.log(LABLE + TAG + ":start")
      let monitor = null;
      try {
        abilityDelegator.removeAbilityMonitor(monitor, (err: BusinessError) => {
          expect().assertFail();
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100 error"
          );
          done();
        });
      } catch (e) {
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100 error code:" + e.code
        );
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100 message:" + e.message
        );
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parse");
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100 pass"
        );
        done();
      }
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200
     * @tc.desc   Pass in an Add monitor that has already been added.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200";
      console.log(LABLE + TAG + "start");
      let result = 0;
      let id: number;
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: () => {
          console.log(LABLE + TAG + "onAbilityCreateCallback");
          result = 1;
        },
      };
      console.log(LABLE + TAG + "addAbilityMonitor");
      abilityDelegator.addAbilityMonitor(monitor);
      await sleep(200);
      console.log(LABLE + TAG + "removeAbilityMonitor");
      abilityDelegator.removeAbilityMonitor(monitor, (err: BusinessError) => {
        monitor = undefined;
      });
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        console.log(LABLE + TAG + "startAbility");
        abilityDelegator.startAbility(want).then((data) => {
          console.log(LABLE + TAG + "successful data: " + JSON.stringify(data));
        }).catch((error:BusinessError) => {
          console.log(LABLE + TAG + "startAbility error: " + JSON.stringify(error));
        });
      });
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        if (data.event == 'Main2Ability.onAbilityCreate') {
          console.log(LABLE + TAG + "assertEqual result=" + result);
          expect(result).assertEqual(0);
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200 pass"
          );
          clearTimeout(id);
          commonEvent.unsubscribe(subscriber, done());
        }
      };
      id = setTimeout(() => {
        console.log(LABLE + TAG + "startAbility fail");
        expect().assertFail();
        commonEvent.unsubscribe(subscriber, done());
      }, 3000);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300
     * @tc.desc   Pass in an unadded monitor to monitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300";
      console.log(LABLE + TAG + "start");
      let result = 0;

      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: () =>{
          console.log(LABLE + TAG + "onAbilityCreateCallback");
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300 onAbilityCreateCallback"
          );
          result = 1;
        },
      };
      console.log(LABLE + TAG + "removeAbilityMonitor");
      abilityDelegator.removeAbilityMonitor(monitor, (err: BusinessError) => {
        console.log(LABLE + TAG + "removeAbilityMonitor callback");
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300 removeAbilityMonitor"
        );
        monitor = undefined;
      });

      await sleep(100);
      console.log(LABLE + TAG + "assertEqual result=" + result);
      expect(result).assertEqual(0);
      abilityDelegator.printSync(
        "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300 pass "
      );
      done();
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400
     * @tc.desc   remove a monitor that has already been wait.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400";
      console.log(LABLE + TAG + "start");
      let result = 0;
      let id: number;

      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: () =>{
          console.log(LABLE + TAG + "onAbilityCreateCallback");
          result = 1;
        },
      };
      console.log(LABLE + TAG + "waitAbilityMonitor");
      abilityDelegator.waitAbilityMonitor(monitor);
      await sleep(100);
      console.log(LABLE + TAG + "removeAbilityMonitor");
      abilityDelegator.removeAbilityMonitor(monitor, (err: BusinessError) => {
        console.log(LABLE + TAG + "removeAbilityMonitor callback");
        monitor = undefined;
      });
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        console.log(LABLE + TAG + "startAbility");
        abilityDelegator.startAbility(want).then((data) => {
          console.log(LABLE + TAG + "successful data: " + JSON.stringify(data));
        }).catch((error:BusinessError) => {
          console.log(LABLE + TAG + "startAbility error: " + JSON.stringify(error));
        });
      });
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        if (data.event == 'Main2Ability.onAbilityCreate') {
          console.log(LABLE + TAG + "assertEqual result=" + result);
          expect(result).assertEqual(0);
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400 pass "
          );
          clearTimeout(id);
          commonEvent.unsubscribe(subscriber, done());
        }
      };
      id = setTimeout(() => {
        console.log(LABLE + TAG + "startAbility fail");
        expect().assertFail();
        commonEvent.unsubscribe(subscriber, done());
      }, 3000);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500
     * @tc.desc   Pass in an Add monitor that has already been added.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500";
      console.log(LABLE + TAG + "start");
      let result = 0;
      let id: number;

      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: () =>{
          console.log(LABLE + TAG + "onAbilityCreateCallback");
          result = 1;
        },
      };
      console.log(LABLE + TAG + "addAbilityMonitor");
      await abilityDelegator.addAbilityMonitor(monitor);
      console.log(LABLE + TAG + "removeAbilityMonitor");
      abilityDelegator.removeAbilityMonitor(monitor, (err: BusinessError) => {
        console.log(LABLE + TAG + "removeAbilityMonitor callback" + JSON.stringify(err));
        monitor = undefined;
      });
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        console.log(LABLE + TAG + "startAbility");
        abilityDelegator.startAbility(want).then((data) => {
          console.log(LABLE + TAG + "successful data: " + JSON.stringify(data));
        }).catch((error:BusinessError) => {
          console.log(LABLE + TAG + "startAbility error: " + JSON.stringify(error));
        });
      });
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        if (data.event == 'Main2Ability.onAbilityCreate') {
          console.log(LABLE + TAG + "assertEqual result=" + result);
          expect(result).assertEqual(0);
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500 pass"
          );
          clearTimeout(id);
          commonEvent.unsubscribe(subscriber, done());
        }
      };
      id = setTimeout(() => {
        console.log(LABLE + TAG + "startAbility fail");
        expect().assertFail();
        commonEvent.unsubscribe(subscriber, done());
      }, 3000);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100
     * @tc.desc   pass in a null monitor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100";
      console.log(LABLE + TAG + "start");
      let monitor = null;
      try {
        let result = await abilityDelegator.removeAbilityMonitor(monitor);
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100 pass+result：" + result
        );
        expect().assertFail();
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100 error"
        );
        done();
      } catch (e) {
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100 code：" + e.code
        );
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100 message:" + e.message
        );
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parse");
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100 pass"
        );
        done();
      }
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200
     * @tc.desc   Pass in an Add monitor that has already been added.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200";
      console.log(LABLE + TAG + "start");
      let result = 0;
      let id: number;

      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (err) =>{
          console.log(LABLE + TAG + "onAbilityCreateCallback err = " + JSON.stringify(err));
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200 onAbilityCreateCallback "
          );
          result = 1;
        },
      };
      console.log(LABLE + TAG + "addAbilityMonitor");
      await abilityDelegator.addAbilityMonitor(monitor);
      await abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          console.log(LABLE + TAG + "removeAbilityMonitor promise success");
          monitor = undefined;
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200 callback"
          );
        })
        .catch((error:BusinessError) => {
          console.log(LABLE + TAG + "removeAbilityMonitor catch error = " + JSON.stringify(error));
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200 error:" + error
          );
        });
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        console.log(LABLE + TAG + "startAbility");
        abilityDelegator.startAbility(want).then((data) => {
          console.log(LABLE + TAG + "successful data: " + JSON.stringify(data));
        }).catch((error:BusinessError) => {
          console.log(LABLE + TAG + "startAbility error: " + JSON.stringify(error));
        });;
      });
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        if (data.event == 'Main2Ability.onAbilityCreate') {
          console.log(LABLE + TAG + "assertEqual result=" + result);
          expect(result).assertEqual(0);
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200 pass "
          );
          clearTimeout(id);
          commonEvent.unsubscribe(subscriber, done());
        }
      };
      id = setTimeout(() => {
        console.log(LABLE + TAG + "startAbility fail");
        expect().assertFail();
        commonEvent.unsubscribe(subscriber, done());
      }, 3000);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300
     * @tc.desc   Pass in an unadded monitor to monitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300";
      console.log(LABLE + TAG + "start");
      let result = 0;

      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: () =>{
          console.log(LABLE + TAG + "onAbilityCreateCallback");
          result = 1;
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300 onAbilityCreateCallback"
          );
        },
      };
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          console.log(LABLE + TAG + "removeAbilityMonitor promise success");
          monitor = undefined;
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300"
          );
          expect(true).assertTrue();
          abilityDelegator.printSync(
            "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300"
          );
          done();
        })
        .catch((error:BusinessError) => {
          console.log(LABLE + TAG + "removeAbilityMonitor catch error" + JSON.stringify(error));
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300 error:" + error
          );
          expect().assertFail();
          done();
        });

      await sleep(100);
      console.log(LABLE + TAG + "assertEqual result = " + result);
      expect(result).assertEqual(0);
      abilityDelegator.printSync(
        "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300 pass "
      );
      done();
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400
     * @tc.desc   remove a monitor that has already been wait.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400";
      console.log(LABLE + TAG + "start");
      let result = 0;
      let id: number;

      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: () =>{
          console.log(LABLE + TAG + "onAbilityCreateCallback");
          result = 1;
        },
      };
      abilityDelegator.waitAbilityMonitor(monitor);
      await sleep(100)
      await abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          console.log(LABLE + TAG + "removeAbilityMonitor promise success");
          monitor = undefined;
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400"
          );
        })
        .catch((error:BusinessError) => {
          console.log(LABLE + TAG + "removeAbilityMonitor catch error = " + JSON.stringify(error));
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400 error:" + error
          );
          expect().assertFail();
          done();
        });
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        console.log(LABLE + TAG + "startAbility");
        abilityDelegator.startAbility(want).then((data) => {
          console.log(LABLE + TAG + "successful data: " + JSON.stringify(data));
        }).catch((error:BusinessError) => {
          console.log(LABLE + TAG + "startAbility error: " + JSON.stringify(error));
        });;
      });
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        if (data.event == 'Main2Ability.onAbilityCreate') {
          console.log(LABLE + TAG + "assertEqual result=" + result);
          expect(result).assertEqual(0);
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400 pass "
          );
          clearTimeout(id);
          commonEvent.unsubscribe(subscriber, done());
        }
      };
      id = setTimeout(() => {
        console.log(LABLE + TAG + "startAbility fail");
        expect().assertFail();
        commonEvent.unsubscribe(subscriber, done());
      }, 3000);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500
     * @tc.desc   Pass in an unadded monitor to monitor whether the monitor container size increases.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500";
      console.log(LABLE + TAG + "start");
      let result = 1;
      let id: number;

      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: () =>{
          console.log(LABLE + TAG + "onAbilityCreateCallback");
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500 onAbilityCreateCallback"
          );
          result = 0;
        },
      };
      console.log(LABLE + TAG + "addAbilityMonitor");
      await abilityDelegator.addAbilityMonitor(monitor);
      await abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          console.log(LABLE + TAG + "removeAbilityMonitor promise success");
          monitor = undefined;
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500 callback"
          );
        })
        .catch((error:BusinessError) => {
          console.log(LABLE + TAG + "removeAbilityMonitor catch error = " + JSON.stringify(error));
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500 error:" + error
          );
          expect().assertFail();
          done();
        });
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        console.log(LABLE + TAG + "startAbility");
        abilityDelegator.startAbility(want).then((data) => {
          console.log(LABLE + TAG + "successful data: " + JSON.stringify(data));
        }).catch((error:BusinessError) => {
          console.log(LABLE + TAG + "startAbility error: " + JSON.stringify(error));
        });;
      });
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        if (data.event == 'Main2Ability.onAbilityCreate') {
          console.log(LABLE + TAG + "assertEqual result=" + result);
          expect(result).assertEqual(1);
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500 pass"
          );
          clearTimeout(id);
          commonEvent.unsubscribe(subscriber, done());
        }
      };
      id = setTimeout(() => {
        console.log(LABLE + TAG + "startAbility fail");
        expect().assertFail();
        commonEvent.unsubscribe(subscriber, done());
      }, 3000);
    });

    /**
     * @tc.name   ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100
     * @tc.desc   pass in a null monitor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100";
      console.log(LABLE + TAG + "start");
      let monitor = null;
      try {
        abilityDelegator.waitAbilityMonitor(monitor, (err: BusinessError) => {
          console.log(LABLE + TAG + "waitAbilityMonitor callback , err = " + JSON.stringify(err));
          expect().assertFail();
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100 callback "
          );
          done();
        });
      } catch (e) {
        console.log(LABLE + TAG + "waitAbilityMonitor catch error , err = " + JSON.stringify(e));
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100 code：" + e.code
        );
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100 message:" + e.message
        );
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parse");
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100 monitor pass"
        );
        done();
      }
    });

    /**
     * @tc.name   ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0300
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0300
     * @tc.desc   Pass in an added monitor and start the monitor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0300", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0300";
      console.log(LABLE + TAG + "start");

      let want:Want = {
        bundleName: "com.example.delegatortest",
        abilityName: "Main2Ability",
        moduleName: "entry",
      };
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (data) =>{
          console.log(LABLE + TAG + "onAbilityCreateCallback data = " + JSON.stringify(data));
          expect(data.context.abilityInfo.name).assertEqual("Main2Ability");
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0300 pass"
          );
          data.context.terminateSelf().then((data) => {
            console.log("AbilityMonitorTest terminateSelf successful data: " + JSON.stringify(data));
            done();
          }).catch((error:BusinessError) => {
            console.log("AbilityMonitorTest terminateSelf error: " + JSON.stringify(error));
            done();
          });
        },
      };
      console.log(LABLE + TAG + "waitAbilityMonitor");
      abilityDelegator.waitAbilityMonitor(monitor, () => {
      });
      console.log(LABLE + TAG + "startAbility");
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.name   ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400
     * @tc.desc   Pass in an empty monitor, timeout=6000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400";
      console.log(LABLE + TAG + "start");
      let monitor = null;
      try {
        abilityDelegator.waitAbilityMonitor(monitor, 6000, (err: BusinessError) => {
          console.log(LABLE + TAG + "waitAbilityMonitor callback , err = " + JSON.stringify(err));
          expect().assertFail();
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400 error"
          );
          done();
        });
      } catch (e) {
        console.log(LABLE + TAG + "waitAbilityMonitor catch error, error = " + JSON.stringify(e));
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400 code:" + e.code
        );
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400 message:" + e.message
        );
        expect(e.message).assertContain("Parse");
        expect(e.code).assertEqual(401);
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400 pass "
        );
        done();
      }
    });

    /**
     * @tc.name   ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500
     * @tc.desc   Pass in a monitor that has been added, timeout=10000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500";
      console.log(LABLE + TAG + "start");

      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (data) =>{
          console.log(LABLE + TAG + "onAbilityCreateCallback, data = " + JSON.stringify(data));
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500 error"
          );
          expect(true).assertTrue();
          done();
        },
      };
      abilityDelegator.waitAbilityMonitor(
        monitor,
        100,
        (err: BusinessError) => {
          console.log(LABLE + TAG + "waitAbilityMonitor callback, err = " + JSON.stringify(err));
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500 : " + err.code + " " + err.message
          );
          expect(err.code).assertEqual(16000100);
          expect(true).assertTrue();
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500 pass"
          );
          done();
        }
      );
    });

    /**
     * @tc.name   ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0600
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0600
     * @tc.desc   Pass in an already added monitor and start this monitor, timeout<5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0600", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0600";
      console.log(LABLE + TAG + "start");
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (data) =>{
          console.log(LABLE + TAG + "onAbilityCreateCallback data = " + JSON.stringify(data));
          expect(true).assertTrue();
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0600 pass"
          );
          data.context.terminateSelf().then((data) => {
            console.log("AbilityMonitorTest terminateSelf successful data: " + JSON.stringify(data));
            done();
          }).catch((error:BusinessError) => {
            console.log("AbilityMonitorTest terminateSelf error: " + JSON.stringify(error));
            done();
          });
        },
      };
      console.log(LABLE + TAG + "waitAbilityMonitor");
      abilityDelegator.waitAbilityMonitor(
        monitor,
        6000,
        () => {
        }
      );
      console.log(LABLE + TAG + "startAbility");
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.name   ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0700
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0700
     * @tc.desc   Pass in an already added monitor and start this monitor, timeout=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0700", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0700";
      console.log(LABLE + TAG + "start");
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (data) =>{
          console.log(LABLE + TAG + "onAbilityCreateCallback, data = " + JSON.stringify(data));
          expect(true).assertTrue();
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0700 pass"
          );
          data.context.terminateSelf().then((data) => {
            console.log("AbilityMonitorTest terminateSelf successful data: " + JSON.stringify(data));
            done();
          }).catch((error:BusinessError) => {
            console.log("AbilityMonitorTest terminateSelf error: " + JSON.stringify(error));
            done();
          });
        },
      };
      console.log(LABLE + TAG + "waitAbilityMonitor start");
      abilityDelegator.waitAbilityMonitor(
        monitor,
        0,
        () => {
          console.log(LABLE + TAG + "waitAbilityMonitor callback");
        }
      );
      console.log(LABLE + TAG + "startAbility");
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.name   ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0800
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0800
     * @tc.desc   Pass in an already added monitor and start this monitor, timeout<5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0800", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0800";
      console.log(LABLE + TAG + "start");
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (data) =>{
          console.log(LABLE + TAG + "onAbilityCreateCallback, data = " + JSON.stringify(data));
          expect(true).assertTrue();
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0800 pass"
          );
          data.context.terminateSelf().then((data) => {
            console.log("AbilityMonitorTest terminateSelf successful data: " + JSON.stringify(data));
            done();
          }).catch((error:BusinessError) => {
            console.log("AbilityMonitorTest terminateSelf error: " + JSON.stringify(error));
            done();
          });
        },
      };
      console.log(LABLE + TAG + "waitAbilityMonitor start");
      abilityDelegator.waitAbilityMonitor(
        monitor,
        4000,
        () => {
          console.log(LABLE + TAG + "waitAbilityMonitor callback");
        }
      );
      console.log(LABLE + TAG + "startAbility");
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.name   ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0900
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0900
     * @tc.desc   Pass in an already added monitor and start this monitor, timeout<0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0900", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0900";
      console.log(LABLE + TAG + "start");
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (data) =>{
          console.log(LABLE + TAG + "onAbilityCreateCallback, data = " + JSON.stringify(data));
          expect(true).assertTrue();
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0900 pass"
          );
          data.context.terminateSelf().then((data) => {
            console.log("AbilityMonitorTest terminateSelf successful data: " + JSON.stringify(data));
            done();
          }).catch((error:BusinessError) => {
            console.log("AbilityMonitorTest terminateSelf error: " + JSON.stringify(error));
            done();
          });
        },
      };
      console.log(LABLE + TAG + "waitAbilityMonitor start");
      abilityDelegator.waitAbilityMonitor(
        monitor,
        -1,
        () => {
          console.log(LABLE + TAG + "waitAbilityMonitor callback");
        }
      );
      console.log(LABLE + TAG + "startAbility start");
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.name   ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000
     * @tc.desc   Pass in an added monitor and start this monitor to get the current bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000";
      console.log(LABLE + TAG + " start");
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (data) =>{
          console.log(LABLE + TAG + " onAbilityCreateCallback, data = " + JSON.stringify(data));
          try {
            abilityDelegator.printSync(
              "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000 getCurrentTopAbility ability: " +
              data.context.abilityInfo.name
            );
            expect(true).assertTrue();
            abilityDelegator.printSync(
              "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000 pass"
            );
            done();
          } catch (e) {
            abilityDelegator.printSync(
              "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000 error"
            );
            expect(true).assertTrue();
            done();
          }
        },
      };
      console.log(LABLE + TAG + " waitAbilityMonitor start");
      abilityDelegator.waitAbilityMonitor(monitor);
      console.log(LABLE + TAG + " startAbility start");
      abilityDelegator.startAbility(want);
    });

    /**
     * @tc.name   ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100
     * @tc.desc   pass in a null monitor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100";
      console.log(LABLE + TAG + " start");
      let monitor = null;
      try {
        let result = await abilityDelegator.waitAbilityMonitor(monitor);
        expect(result).assertEqual(undefined);
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100  error"
        );
        done();
      } catch (e) {
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100  code:" + e.code
        );
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100  message:" + e.message
        );
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parse");
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100  pass"
        );
        done();
      }
    });

    /**
     * @tc.name   ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200
     * @tc.desc   Pass in a Monitor that has already been added.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200";
      console.log(LABLE + TAG + " start");
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (data) =>{
          console.log(LABLE + TAG + " onAbilityCreateCallback data = " + JSON.stringify(data));
          expect(true).assertTrue();
          abilityDelegator.printSync(
            "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200 onAbilityCreateCallback"
          );
          data.context.terminateSelf().then((data) => {
            console.log("AbilityMonitorTest terminateSelf successful data: " + JSON.stringify(data));
            done();
          }).catch((error:BusinessError) => {
            console.log("AbilityMonitorTest terminateSelf error: " + JSON.stringify(error));
            done();
          });
        },
      };
      console.log(LABLE + TAG + " waitAbilityMonitor start");
      abilityDelegator
        .waitAbilityMonitor(monitor)
        .then(() => {
          console.log(LABLE + TAG + " waitAbilityMonitor promise");
          expect(true).assertTrue();
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200 pass"
          );
        })
        .catch((error:BusinessError) => {
          console.log(LABLE + TAG + " waitAbilityMonitor catch error = " + JSON.stringify(error));
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200 error:" + error
          );
          expect().assertFail();
          done();
        });
      console.log(LABLE + TAG + " startAbility start");
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.name   ACTS_WAIT_ABILITY_MONITOR_PROMISE_0300
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_PROMISE_0300
     * @tc.desc   Pass in an already added Monitor and start the Monitor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_WAIT_ABILITY_MONITOR_PROMISE_0300", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0300";
      console.log(LABLE + TAG + " start");
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (data) =>{
          console.log(LABLE + TAG + " onAbilityCreateCallback callback , data = " + JSON.stringify(data));
          expect(true).assertTrue();
          data.context.terminateSelf().then((data) => {
            abilityDelegator.printSync("AbilityMonitorTest ACTS_WAITABILITYMONTOR_PROMISE_0300 pass");
            done();
          }).catch((error:BusinessError) => {
            abilityDelegator.printSync("AbilityMonitorTest ACTS_WAITABILITYMONTOR_PROMISE_0300 pass");
            done();
          });
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      await abilityDelegator.addAbilityMonitor(monitor);
      await sleep(100);
      console.log(LABLE + TAG + " waitAbilityMonitor start");
      abilityDelegator
        .waitAbilityMonitor(monitor)
        .then(() => {
          console.log(LABLE + TAG + " waitAbilityMonitor promise");
          abilityDelegator.printSync(
            "AbilityMonitorTest actsWaitAbilityMonitorPromise0300 waitAbilityMonitor"
          );
        })
        .catch((error:BusinessError) => {
          console.log(LABLE + TAG + " waitAbilityMonitor catch error, error = " + JSON.stringify(error));
          abilityDelegator.printSync(
            "AbilityMonitorTest actsWaitAbilityMonitorPromise0300 error:" + error
          );
          expect().assertFail();
          done();
        });
      console.log(LABLE + TAG + " startAbility start");
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.name   ACTS_WAIT_ABILITY_MONITOR_PROMISE_0400
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_PROMISE_0400
     * @tc.desc   Pass in an already added StageMonitor and start this Monitor, passing in a timeout=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_WAIT_ABILITY_MONITOR_PROMISE_0400", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0400";
      console.log(LABLE + TAG + " start");
      monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: (data) =>{
          console.log(LABLE + TAG + " onAbilityCreateCallback, data = " + JSON.stringify(data));
          expect(true).assertTrue();
          abilityDelegator.printSync("AbilityMonitorTest ACTS_WAITABILITYMONTOR_PROMISE_0400 pass");
          data.context.terminateSelf().then((data) => {
            console.log("AbilityMonitorTest terminateSelf successful data: " + JSON.stringify(data));
            done();
          }).catch((error:BusinessError) => {
            console.log("AbilityMonitorTest terminateSelf error: " + JSON.stringify(error));
            done();
          });
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      await abilityDelegator.addAbilityMonitor(monitor);
      console.log(LABLE + TAG + " waitAbilityMonitor start");
      await sleep(100);
      abilityDelegator
        .waitAbilityMonitor(monitor, 0)
        .then(() => {
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_PROMISE_0400 waitAbilityMonitor"
          );
        })
        .catch((error:BusinessError) => {
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_PROMISE_0400 error:" + error
          );
          expect().assertFail();
          done();
        });
      console.log(LABLE + TAG + " startAbility start");
      await abilityDelegator.startAbility(want);
    });
  });
}

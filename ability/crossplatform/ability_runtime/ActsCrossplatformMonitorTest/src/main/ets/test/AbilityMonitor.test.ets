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
import AbilityDelegatorRegistry from "@ohos.app.ability.abilityDelegatorRegistry";
import { describe, beforeEach, afterEach, expect, it } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import UIAbility from '@ohos.app.ability.UIAbility';
let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let monitor: AbilityDelegatorRegistry.AbilityMonitor | null | undefined
let TAG: string = "";
let LABLE: string = "AbilityMonitorTest";

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
  const factoryWant = (
    bundleName: string,
    abilityName: string,
    moduleName: string
  ): Want => {
    return {
      bundleName: bundleName,
      abilityName: abilityName,
      moduleName: moduleName,
    };
  };

  describe("AbilityMonitorTest", () => {
    beforeEach(async (done: Function) => {
      console.info("AbilityMonitorTest before each called");
      await sleep(1000);
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
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100
     * @tc.name actsAddAbilityMonitorCallback0100
     * @tc.desc pass in a null monitor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100";
      console.log(LABLE + TAG + ":start")
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
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
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200
     * @tc.name actsAddAbilityMonitorCallback0200
     * @tc.desc Pass in a monitor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200";
      console.log(LABLE + TAG + ":start")
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

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
      }, 1000);
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300
     * @tc.name actsAddAbilityMonitorCallback0300
     * @tc.desc Pass in a monitor that has already been added.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300";
      console.log(LABLE + TAG + ":start")
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

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
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0100
     * @tc.name actsAddAbilityMonitorPromise0100
     * @tc.desc pass in a null monitor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0100", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_0100";
      console.log(LABLE + TAG + ":start")
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
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
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0200
     * @tc.name actsAddAbilityMonitorPromise0200
     * @tc.desc Pass in a monitor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0200", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_0200";
      console.log(LABLE + TAG + ":start")
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

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
      setTimeout(() => {
        abilityDelegator.startAbility(want);
      }, 2000);
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0300
     * @tc.name actsAddAbilityMonitorPromise0300
     * @tc.desc Pass in a monitor that has already been added.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0300", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_0300";
      console.log(LABLE + TAG + ":start")
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

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
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100
     * @tc.name actsRemoveAbilityMonitorCallback0100
     * @tc.desc pass in a null monitor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100", 0, async (done: Function) => {
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
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200
     * @tc.name actsRemoveAbilityMonitorCallback0200
     * @tc.desc Pass in an Add monitor that has already been added.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200";
      console.log(LABLE + TAG + "start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let result = 0;
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
      setTimeout(() => {
        console.log(LABLE + TAG + "startAbility");
        abilityDelegator.startAbility(want);
      }, 2000);
      setTimeout(() => {
        console.log(LABLE + TAG + "assertEqual result=" + result);
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200 pass"
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300
     * @tc.name actsRemoveAbilityMonitorCallback0300
     * @tc.desc Pass in an unadded monitor to monitor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300", 0, async (done: Function) => {
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

      setTimeout(() => {
        console.log(LABLE + TAG + "assertEqual result=" + result);
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400
     * @tc.name actsRemoveAbilityMonitorCallback0400
     * @tc.desc remove a monitor that has already been wait.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400";
      console.log(LABLE + TAG + "start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let result = 0;

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
      console.log(LABLE + TAG + "startAbility");
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        console.log(LABLE + TAG + "assertEqual result=" + result);
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500
     * @tc.name actsRemoveAbilityMonitorCallback0500
     * @tc.desc Pass in an Add monitor that has already been added.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500";
      console.log(LABLE + TAG + "start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let result = 0;

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
      await sleep(200)
      console.log(LABLE + TAG + "startAbility");
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        console.log(LABLE + TAG + "assertEqual result=" + result);
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500 pass"
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100
     * @tc.name actsRemoveAbilityMonitorPromise0100
     * @tc.desc pass in a null monitor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100", 0, async (done: Function) => {
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
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200
     * @tc.name actsRemoveAbilityMonitorPromise0200
     * @tc.desc Pass in an Add monitor that has already been added.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200";
      console.log(LABLE + TAG + "start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let result = 0;

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
      console.log(LABLE + TAG + "startAbility");
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        console.log(LABLE + TAG + "assertEqual result" + result);
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300
     * @tc.name actsRemoveAbilityMonitorPromise0300
     * @tc.desc Pass in an unadded monitor to monitor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300";
      console.log(LABLE + TAG + "start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
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

      setTimeout(() => {
        console.log(LABLE + TAG + "assertEqual result = " + result);
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400
     * @tc.name actsRemoveAbilityMonitorPromise0400
     * @tc.desc remove a monitor that has already been wait.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400";
      console.log(LABLE + TAG + "start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let result = 0;

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
      console.log(LABLE + TAG + "startAbility");
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        console.log(LABLE + TAG + "assertEqual result = " + result);
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500
     * @tc.name actsRemoveAbilityMonitorPromise0500
     * @tc.desc Pass in an unadded monitor to monitor whether the monitor container size increases.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500";
      console.log(LABLE + TAG + "start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let result = 1;

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
      console.log(LABLE + TAG + "startAbility");
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        console.log(LABLE + TAG + "assertEqual result = " + result);
        expect(result).assertEqual(1);
        abilityDelegator.printSync(
          "AbilityMonitorTest ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500 pass"
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100
     * @tc.name actsWaitAbilityMonitorCallback0100
     * @tc.desc pass in a null monitor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100", 0, async (done: Function) => {
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
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0300
     * @tc.name actsWaitAbilityMonitorCallback0300
     * @tc.desc Pass in an added monitor and start the monitor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0300", 0, async (done: Function) => {
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
      await sleep(500);
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400
     * @tc.name actsWaitAbilityMonitorCallback0400
     * @tc.desc Pass in an empty monitor, timeout=6000.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400", 0, async (done: Function) => {
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
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500
     * @tc.name actsWaitAbilityMonitorCallback0500
     * @tc.desc Pass in a monitor that has been added, timeout=10000.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500", 0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500";
      console.log(LABLE + TAG + "start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

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
        6000,
        (err: BusinessError) => {
          console.log(LABLE + TAG + "waitAbilityMonitor callback, err = " + JSON.stringify(err));
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500 : " + err.code
          );
          abilityDelegator.printSync(
            "AbilityMonitorTest ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500 : " + err.message
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
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0600
     * @tc.name actsWaitAbilityMonitorCallback0600
     * @tc.desc Pass in an already added monitor and start this monitor, timeout<5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0600", 0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0600";
      console.log(LABLE + TAG + "start");

      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
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
      await sleep(500);
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0700
     * @tc.name actsWaitAbilityMonitorCallback0700
     * @tc.desc Pass in an already added monitor and start this monitor, timeout=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0700", 0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0700";
      console.log(LABLE + TAG + "start");

      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
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
      await sleep(500);
      console.log(LABLE + TAG + "startAbility");
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0800
     * @tc.name actsWaitAbilityMonitorCallback0800
     * @tc.desc Pass in an already added monitor and start this monitor, timeout<5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0800", 0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0800";
      console.log(LABLE + TAG + "start");

      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
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
      await sleep(500);
      console.log(LABLE + TAG + "startAbility");
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0900
     * @tc.name actsWaitAbilityMonitorCallback0900
     * @tc.desc Pass in an already added monitor and start this monitor, timeout<0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0900", 0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0900";
      console.log(LABLE + TAG + "start");

      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
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
      await sleep(500);
      console.log(LABLE + TAG + "startAbility start");
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000
     * @tc.name actsWaitAbilityMonitorCallback1000
     * @tc.desc Pass in an added monitor and start this monitor to get the current bundleName.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000", 0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000";
      console.log(LABLE + TAG + " start");



      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
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
      await sleep(500);
      console.log(LABLE + TAG + " startAbility start");
      abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100
     * @tc.name actsWaitAbilityMonitorPromise0100
     * @tc.desc pass in a null monitor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100", 0, async (done: Function) => {
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
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200
     * @tc.name actsWaitAbilityMonitorPromise0200
     * @tc.desc Pass in a Monitor that has already been added.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200", 0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

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
      await sleep(500);
      console.log(LABLE + TAG + " startAbility start");
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_PROMISE_0300
     * @tc.name actsWaitAbilityMonitorPromise0300
     * @tc.desc Pass in an already added Monitor and start the Monitor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_PROMISE_0300", 0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0300";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );



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
      await sleep(500);
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_PROMISE_0400
     * @tc.name actsWaitAbilityMonitorPromise0400
     * @tc.desc Pass in an already added StageMonitor and start this Monitor, passing in a timeout=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_PROMISE_0400", 0, async (done: Function) => {
      TAG = "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0400";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

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
      await sleep(500);
      await abilityDelegator.startAbility(want);
    });
  });
}

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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, } from "@ohos/hypium";
import AbilityDelegatorRegistry from "@ohos.app.ability.abilityDelegatorRegistry";
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function AbilityMonitor2Test() {
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

  let TAG: string = "";
  let LABLE: string = "AbilityMonitor2Test";
  let monitor: AbilityDelegatorRegistry.AbilityMonitor | null | undefined = undefined;
  let deviceType = systemParameterEnhance.getSync('const.product.devicetype');

  describe("AbilityMonitor2Test", () => {
    beforeEach(async (done: Function) => {
      console.info("AbilityMonitor2Test before each called");
      await sleep(1000);
      done();
    });

    afterEach(async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      if (monitor) {
        console.info(LABLE + TAG + "AbilityMonitor2Test afterEach removeAbilityMonitor called");
        abilityDelegator.removeAbilityMonitor(monitor, () => {
          monitor = undefined;
        });
      }
      if (TAG === "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300") {
        if (globalThis.main4AbilityContext) {
          console.info(LABLE + TAG + "AbilityMonitorTest afterEach terminateSelf main4 called");
          globalThis.main4AbilityContext.terminateSelf();
        }
      }
      await sleep(500)
      console.info(LABLE + TAG + "AbilityMonitorTest afterEach each end");
      done()
    });


    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0100
     * @tc.name ACTS_AddAbilityMonitor_Callback_2_0100
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the callback function (onAbilityForeground) CallBack when the ability status becomes foreground
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0100", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0100";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      monitor = {
        abilityName: "Main2Ability",
        onAbilityForeground: (data) => {
          console.log(LABLE + TAG + " onAbilityForegroundCallback, data=" + JSON.stringify(data));
          expect(data != null).assertTrue();
          abilityDelegator.printSync(
            TAG + " ability name:" +
            data.context.abilityInfo.name
          );
          data.context.terminateSelf().then(() => {
            done();
          }).catch((error: BusinessError) => {
            console.log(TAG + " terminateSelf error: " + JSON.stringify(error));
            done();
          });
          abilityDelegator.printSync(TAG + " pass");
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator.addAbilityMonitor(monitor, (error: BusinessError) => {
        abilityDelegator.printSync(
          TAG + " addAbilityMonitor:" +
          JSON.stringify(error)
        );
        console.log(LABLE + TAG + " startAbility start");
        abilityDelegator.startAbility(want, (error: BusinessError) => {
          abilityDelegator.printSync(
            TAG + " startAbility:" +
            JSON.stringify(error)
          );
        });
      });
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0200
     * @tc.name ACTS_AddAbilityMonitor_Callback_2_0200
     * @tc.desc Verify that addAbilityMonitor enters the normal value of the monitor parameter and executes the callback function (onWindowStageCreate) CallBack when the window stage is created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0200", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0200";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main3Ability",
        "entry"
      );
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();


      monitor = {
        abilityName: "Main3Ability",
        onWindowStageCreate: (data) => {
          console.log(LABLE + TAG + "onWindowStageCreateCallBack");
          expect(data != null).assertTrue();
          abilityDelegator.printSync(
            TAG + " ability name:" +
            data.context.abilityInfo.name
          );
          globalThis.main3Context.terminateSelf().then(() => {
          }).catch((error: BusinessError) => {
            console.log(LABLE + TAG + " terminate error:" + JSON.stringify(error));
          });
          abilityDelegator.printSync(TAG + " pass");
          
          setTimeout(() => {
            console.log(LABLE + TAG + " done");
            done();
          }, 1000);
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator.addAbilityMonitor(monitor, (error: BusinessError) => {
        abilityDelegator.printSync(
          TAG + " addAbilityMonitor:" +
          JSON.stringify(error)
        );
        abilityDelegator.startAbility(want, (err) => {
          console.log(LABLE + TAG + " startAbility start");
          abilityDelegator.printSync(
            TAG + " startAbility:" +
            JSON.stringify(err)
          );
        });
      });
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0300
     * @tc.name ACTS_AddAbilityMonitor_Callback_2_0300
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the callback function (onWindowStageCreate) Promise when the window stage is created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0300", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0300";
      console.log(LABLE + TAG + " start");
      if (deviceType === '2in1') {
        console.log(LABLE + TAG + " deviceType: " + deviceType);
        done();
        return;
      }
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      monitor = {
        abilityName: "Main4Ability",
        onAbilityBackground: (data) => {
          console.log(LABLE + TAG + " onAbilityBackgroundCallback");
          expect(data != null).assertTrue();
          console.info(TAG + " pass");
          done();
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator.addAbilityMonitor(monitor, (error: BusinessError) => {
        console.log(
          TAG + " err:" + JSON.stringify(error)
        );
      });
      await sleep(500);
      console.log(LABLE + TAG + " startAbility start");
      abilityDelegator.startAbility(want, (err) => {
        console.log(
          TAG + " err:" + JSON.stringify(err)
        );
        setTimeout(() => {
          globalThis.main4AbilityContext.terminateSelf();
        }, 2000);
      });
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0400
     * @tc.name ACTS_AddAbilityMonitor_Callback_2_0400
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the onAbilityBackground Promise when the ability status becomes background
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0400", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0400";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      monitor = {
        abilityName: "Main2Ability",
        onWindowStageDestroy: (data) => {
          expect(data != null).assertTrue();
          console.info(TAG + " pass");
          done();
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator.addAbilityMonitor(monitor, (error: BusinessError) => {
        console.log(
          TAG + " err:" + JSON.stringify(error)
        );
      });
      setTimeout(() => {
        console.log(LABLE + TAG + " startAbility start");
        abilityDelegator.startAbility(want, (err) => {
          console.log(LABLE + TAG + " err:" + JSON.stringify(err));
          setTimeout(() => {
            globalThis.main2AbilityContext.terminateSelf();
          }, 2000);
        });
      }, 2000);
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0500
     * @tc.name ACTS_AddAbilityMonitor_Callback_2_0500
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the onAbilityDestroy callBack function before the ability is destroyed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0500", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0500";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main3Ability",
        "entry"
      );
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();


      monitor = {
        abilityName: "Main3Ability",
        onAbilityDestroy: (data) => {
          console.log(LABLE + TAG + " onAbilityDestroyCallback abilityInfo=" + JSON.stringify(data.context.abilityInfo));
          expect(data != null).assertTrue();
          abilityDelegator.printSync(TAG + " pass");
          done();
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator.addAbilityMonitor(monitor, (error: BusinessError) => {
        abilityDelegator.printSync(
          TAG + " addAbilityMonitor:" +
          JSON.stringify(error)
        );
      });
      setTimeout(() => {
        console.log(LABLE + TAG + " startAbility start");
        abilityDelegator.startAbility(want, (err) => {
          console.log(LABLE + TAG + "ACTS_AddAbilityMonitor_Callback_0500 startAbility:" + JSON.stringify(err));
          setTimeout(() => {
            globalThis.main3Context.terminateSelf();
          }, 2000);
        });
      }, 2000);
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0100
     * @tc.name ACTS_AddAbilityMonitor_Promise_2_0100
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the onAbilityForeground Promise when the ability status becomes foreground
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0100", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0100";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      monitor = {
        abilityName: "Main4Ability",
        onAbilityForeground: (data) => {
          console.log(LABLE + TAG + " onAbilityForegroundPromise");
          expect(data != null).assertTrue();
          abilityDelegator.printSync(
            TAG + " ability name:" +
            data.context.abilityInfo.name
          );
          data.context.terminateSelf().then((data) => {
            console.log(TAG + " terminateSelf successful data: " + JSON.stringify(data));
            done();
          }).catch((error: BusinessError) => {
            console.log(TAG + " terminateSelf error: " + JSON.stringify(error));
            done();
          });
          abilityDelegator.printSync(TAG + " pass");
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator
        .addAbilityMonitor(monitor)
        .then(() => {
          abilityDelegator.printSync(TAG + " ACTS_AddAbilityMonitor_Promise_0100 add");
          console.log(LABLE + TAG + " startAbility start");
          abilityDelegator.startAbility(want);
        })
        .catch(() => {
          abilityDelegator.printSync(
            TAG + "  error"
          );
          done();
        });
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0200
     * @tc.name ACTS_AddAbilityMonitor_Promise_2_0200
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the callback function (onWindowStageCreate) Promise when the window stage is created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0200", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0200";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );


      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      monitor = {
        abilityName: "Main2Ability",
        onWindowStageCreate: (data) => {
          console.log(LABLE + TAG + " onWindowStageCreatePromise start");
          expect(data != null).assertTrue();
          abilityDelegator.printSync(
            TAG + " ability name:" +
            data.context.abilityInfo.name
          );
          console.log(LABLE + TAG + " terminateSelf start");
          data.context.terminateSelf().then((data) => {
            console.log(TAG + " terminateSelf successful data: " + JSON.stringify(data));
            done();
          }).catch((error: BusinessError) => {
            console.log(TAG + " terminateSelf error: " + JSON.stringify(error));
            done();
          });
          abilityDelegator.printSync(TAG + " pass");
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator
        .addAbilityMonitor(monitor)
        .then(async () => {
          abilityDelegator.printSync(TAG + " add");
          setTimeout(() => {
            console.log(LABLE + TAG + " startAbility start");
            abilityDelegator.startAbility(want).then(async () => {
              abilityDelegator.printSync(
                TAG + " start"
              );
            });
          }, 2000);
        })
        .catch(() => {
          abilityDelegator.printSync(
            TAG + " error"
          );
          done();
        });
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0300
     * @tc.name ACTS_AddAbilityMonitor_Promise_2_0300
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the onAbilityBackground Promise when the ability status becomes background     * @tc.size MediumTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0300", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0300";
      console.log(LABLE + TAG + " start");
      if (deviceType === '2in1') {
        console.log(LABLE + TAG + " deviceType: " + deviceType);
        done();
        return;
      }
      const want = factoryWant(
        "com.example.delegatortest",
        "Main3Ability",
        "entry"
      );


      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      monitor = {
        abilityName: "Main3Ability",
        onAbilityBackground: (data) => {
          console.log(LABLE + TAG + " onAbilityBackgroundPromise data = " + JSON.stringify(data));
          expect(data != null).assertTrue();
          console.log("ACTS_AddAbilityMonitor_Promise_0300 pass");
          console.log(LABLE + TAG + " terminateSelf start");
          data.context.terminateSelf().then((data) => {
            console.log("AbilityMonitor2Test terminateSelf successful data: " + JSON.stringify(data));
            done();
          }).catch((error: BusinessError) => {
            console.log(TAG + " terminateSelf error: " + JSON.stringify(error));
            done();
          });
        },
      };
      console.log(LABLE + TAG + " abilityDelegator start");
      abilityDelegator
        .addAbilityMonitor(monitor)
        .then(async () => {
          console.info(TAG + " add");
        })
        .catch(() => {
          console.info(TAG + " error");
          done();
        });
      setTimeout(() => {
        console.log(LABLE + TAG + " startAbility start");
        abilityDelegator
          .startAbility(want)
          .then(async () => {
            console.info(TAG + " start");
            setTimeout(() => {
              globalThis.main3Context.terminateSelf();
            }, 2000);
          })
          .catch(() => {
            console.info(LABLE + TAG + "ACTS_AddAbilityMonitor_Promise_0300 startability error");
            done();
          });
      }, 2000);
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0400
     * @tc.name ACTS_AddAbilityMonitor_Promise_2_0400
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the callback function (onWindowStageDestroy) Promise before the window stage is destroyed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0400", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0400";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      monitor = {
        abilityName: "Main4Ability",
        onWindowStageDestroy: (data) => {
          console.log(LABLE + TAG + " onWindowStageDestroyPromise");
          expect(data != null).assertTrue();
          console.log(LABLE + TAG + "ACTS_AddAbilityMonitor_Promise_0400 pass");
          done();
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator
        .addAbilityMonitor(monitor)
        .then(async () => {
          console.log(LABLE + TAG + " addAbilityMonitor added");
        })
        .catch((err: BusinessError) => {
          console.log(LABLE + TAG + " addAbilityMonitor catch error:" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      console.log(LABLE + TAG + " startAbility start");
      setTimeout(() => {
        abilityDelegator.startAbility(want, (err) => {
          console.log(LABLE + TAG + " startAbility end, err=" + JSON.stringify(err));
          setTimeout(() => {
            globalThis.main4AbilityContext.terminateSelf();
          }, 2000);
        });
      }, 2000);
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0500
     * @tc.name ACTS_AddAbilityMonitor_Promise_2_0500
     * @tc.desc Verify that the addAbilityMonitor parameter monitor passes in the normal value, and execute the onAbilityDestroy Promise before the ability is destroyed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0500", 0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0500";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main3Ability",
        "entry"
      );

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      monitor = {
        abilityName: "Main3Ability",
        onAbilityDestroy: (data) => {
          console.log(LABLE + TAG + " onAbilityDestroyPromise");
          expect(data != null).assertTrue();
          abilityDelegator.printSync(TAG + " pass");
          done();
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator
        .addAbilityMonitor(monitor)
        .then(async () => {
          abilityDelegator.printSync(LABLE + TAG + "AbilityMonitor2Test ACTS_AddAbilityMonitor_Promise_0500 add");
        })
        .catch((err: BusinessError) => {
          abilityDelegator.printSync(LABLE + TAG + " addAbilityMonitor catch error=" + JSON.stringify(err));
          done();
        });
      console.log(LABLE + TAG + " startAbility start");
      await sleep(100);
      abilityDelegator.startAbility(want, (err) => {
        console.log(LABLE + TAG + " startAbility, err:" + JSON.stringify(err));
        setTimeout(() => {
          globalThis.main3Context.terminateSelf();
        }, 2000);
      });
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0100
     * @tc.name ACTS_RemoveABILITY_MONITOR_CALLBACK_2_0100
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to the onAbilityForeground callback CallBack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0100", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0100";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      monitor = {
        abilityName: "Main4Ability",
        onAbilityForeground: () => {
          console.log(LABLE + TAG + " onAbilityForegroundCallback");
          result = 1;
          abilityDelegator.printSync(
            TAG + " error"
          );
          done();
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator.addAbilityMonitor(monitor);
      await sleep(500);
      console.log(LABLE + TAG + " removeAbilityMonitor start");
      abilityDelegator.removeAbilityMonitor(monitor, (error: BusinessError) => {
        monitor = undefined;
        abilityDelegator.printSync(TAG + " ACTS_RemoveABILITY_MONITOR_CALLBACK_0100.");
        abilityDelegator.startAbility(want);
      });
      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          TAG + " pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0200
     * @tc.name ACTS_RemoveABILITY_MONITOR_CALLBACK_2_0200
     * @tc.desc After validating removeAbilityMonitor, you cannot listen to the onWindowStageCreate callback CallBack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0200", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0200";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      monitor = {
        abilityName: "Main4Ability",
        onWindowStageCreate: () => {
          console.log(LABLE + TAG + " onWindowStageCreateCallBack");
          result = 1;
          abilityDelegator.printSync(
            TAG + " error"
          );
          done();
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator.addAbilityMonitor(monitor);
      await sleep(500);
      console.log(LABLE + TAG + " removeAbilityMonitor start");
      abilityDelegator.removeAbilityMonitor(monitor, (error: BusinessError) => {
        monitor = undefined;
        abilityDelegator.printSync(
          TAG + " ACTS_REMOVEABILITY_MONITOR_CALLBACK_0200 ."
        );
        abilityDelegator.startAbility(want);
      });
      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          TAG + " pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0300
     * @tc.name ACTS_RemoveABILITY_MONITOR_CALLBACK_2_0300
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to the onAbilityBackground callback callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0300", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0300";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      monitor = {
        abilityName: "Main4Ability",
        onAbilityBackground: () => {
          console.log(LABLE + TAG + " onAbilityBackgroundCallBack start");
          result = 1;
          abilityDelegator.printSync(
            TAG + " error"
          );
          done();
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator.addAbilityMonitor(monitor);
      await sleep(500);
      console.log(LABLE + TAG + " removeAbilityMonitor start");
      abilityDelegator.removeAbilityMonitor(monitor, (error: BusinessError) => {
        monitor = undefined;
        console.log(LABLE + TAG + " removeAbilityMonitor callback, err=" + JSON.stringify(error));
        abilityDelegator.printSync(
          TAG + " ACTS_REMOVEABILITY_MONITOR_CALLBACK_0300 ."
        );
        abilityDelegator.startAbility(want, (err) => {
          console.log(
            TAG + " err:" + JSON.stringify(err)
          );
          setTimeout(() => {
            globalThis.main4AbilityContext.terminateSelf();
          }, 2000);
        });
      });
      setTimeout(() => {
        console.log(LABLE + TAG + " assertEqual result=" + result);
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          TAG + " pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0400
     * @tc.name ACTS_RemoveABILITY_MONITOR_CALLBACK_2_0400
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to the onAbilityDestroy callback CallBack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0400", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0400";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      monitor = {
        abilityName: "Main4Ability",
        onAbilityDestroy: () => {
          console.log(LABLE + TAG + " onAbilityDestroyCallBack");
          result = 1;
          abilityDelegator.printSync(
            TAG + " ACTS_REMOVEABILITY_MONITOR_CALLBACK_0400 error"
          );
          done();
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator.addAbilityMonitor(monitor);
      await sleep(500);
      console.log(LABLE + TAG + " removeAbilityMonitor start");
      abilityDelegator.removeAbilityMonitor(monitor, (error: BusinessError) => {
        monitor = undefined;
        abilityDelegator.printSync(LABLE + TAG + " removeAbilityMonitor callback, err= " + JSON.stringify(error));
        abilityDelegator.startAbility(want, (err) => {
          console.log(
            TAG + " err:" + JSON.stringify(err)
          );
          setTimeout(() => {
            globalThis.main4AbilityContext.terminateSelf();
          }, 2000);
        });
      });
      setTimeout(() => {
        console.log(LABLE + TAG + " assertEqual result=" + result);
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          TAG + " pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0500
     * @tc.name ACTS_RemoveABILITY_MONITOR_CALLBACK_2_0500
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to the onWindowStageDestroy callback CallBack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0500", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0500";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      monitor = {
        abilityName: "Main4Ability",
        onWindowStageDestroy: () => {
          console.log(LABLE + TAG + " onWindowStageDestroyCallBack");
          result = 1;
          abilityDelegator.printSync(
            TAG + " error"
          );
          done();
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      abilityDelegator.addAbilityMonitor(monitor);
      await sleep(500);
      console.log(LABLE + TAG + " removeAbilityMonitor start");
      abilityDelegator.removeAbilityMonitor(monitor, (error: BusinessError) => {
        monitor = undefined;
        abilityDelegator.printSync(LABLE + TAG + " removeAbilityMonitor callback, err=" + JSON.stringify(error));
        abilityDelegator.startAbility(want, (err) => {
          console.log(LABLE + TAG + " startAbility err:" + JSON.stringify(err));
          setTimeout(() => {
            globalThis.main4AbilityContext.terminateSelf();
          }, 2000);
        });
      });
      setTimeout(() => {
        console.log(LABLE + TAG + " assertEqual result:" + result);
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          TAG + " pass "
        );
        done();
      }, 4000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0100
     * @tc.name Acts_RemoveAbility_Monitor_Promise_2_0100
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to onAbilityForeground callback promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0100", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0100";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      monitor = {
        abilityName: "Main4Ability",
        onAbilityForeground: () => {
          console.log(LABLE + TAG + " onAbilityForegroundPromise callback");
          abilityDelegator.printSync(
            TAG + " error "
          );
          result = 0;
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      await abilityDelegator.addAbilityMonitor(monitor);
      await sleep(500);
      console.log(LABLE + TAG + " removeAbilityMonitor start");
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          monitor = undefined;
          abilityDelegator.printSync(LABLE + TAG + "  removeAbilityMonitor promise");
        })
        .catch((err: BusinessError) => {
          abilityDelegator.printSync(LABLE + TAG + "  removeAbilityMonitor catch error, error = " + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await sleep(500);
      console.log(LABLE + TAG + " startAbility start");
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        expect(result).assertEqual(1);
        abilityDelegator.printSync(
          TAG + " pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0200
     * @tc.name Acts_RemoveAbility_Monitor_Promise_2_0200
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to the onWindowStageCreate callback Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0200", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0200";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      monitor = {
        abilityName: "Main4Ability",
        onWindowStageCreate: () => {
          abilityDelegator.printSync(LABLE + TAG + " onWindowStageCreatePromise");
          result = 0;
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      await abilityDelegator.addAbilityMonitor(monitor);
      await sleep(500);
      console.log(LABLE + TAG + " removeAbilityMonitor start");
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          monitor = undefined;
          abilityDelegator.printSync(LABLE + TAG + " removeAbilityMonitor promise");
        })
        .catch((err: BusinessError) => {
          abilityDelegator.printSync(LABLE + TAG + " removeAbilityMonitor catch error, err=" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await sleep(500);
      console.log(LABLE + TAG + " startAbility start");
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        console.log(LABLE + TAG + " assertEqual result=" + result);
        expect(result).assertEqual(1);
        abilityDelegator.printSync(
          TAG + " pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0300
     * @tc.name Acts_RemoveAbility_Monitor_Promise_2_0300
     * @tc.desc After validating removeAbilityMonitor, you cannot listen to the onAbilityBackground callback Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0300", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0300";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      monitor = {
        abilityName: "Main4Ability",
        onAbilityBackground: () => {
          abilityDelegator.printSync(LABLE + TAG + " onAbilityBackgroundPromise ");
          result = 0;
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      await abilityDelegator.addAbilityMonitor(monitor);
      await sleep(500);
      console.log(LABLE + TAG + " removeAbilityMonitor start");
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          monitor = undefined;
          abilityDelegator.printSync(LABLE + TAG + " removeAbilityMonitor promise");
        })
        .catch((err: BusinessError) => {
          abilityDelegator.printSync(LABLE + TAG + "removeAbilityMonitor catch error = " + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await sleep(500);
      console.log(LABLE + TAG + " startAbility start");
      abilityDelegator
        .startAbility(want)
        .then(async () => {
          console.info(TAG + " success");
          setTimeout(() => {
            globalThis.main4AbilityContext.terminateSelf();
          }, 2000);
        })
        .catch((err: BusinessError) => {
          abilityDelegator.printSync(TAG + "startAbility catch error, err=" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      setTimeout(() => {
        console.log(LABLE + TAG + " assertEqual result=" + result);
        expect(result).assertEqual(1);
        abilityDelegator.printSync(
          TAG + " pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0400
     * @tc.name Acts_RemoveAbility_Monitor_Promise_2_0400
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to onAbilityDestroy callback promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0400", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0400";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      monitor = {
        abilityName: "Main4Ability",
        onAbilityDestroy: () => {
          abilityDelegator.printSync(LABLE + TAG + "onAbilityDestroyPromise");
          result = 0;
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      await abilityDelegator.addAbilityMonitor(monitor);
      await sleep(500);
      console.log(LABLE + TAG + " removeAbilityMonitor start");
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          monitor = undefined;
          abilityDelegator.printSync(LABLE + TAG + "  removeAbilityMonitor promise");
        })
        .catch((err: BusinessError) => {
          abilityDelegator.printSync(LABLE + TAG + " removeAbilityMonitor catch error, err=" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await sleep(500);
      console.log(LABLE + TAG + " startAbility start");
      abilityDelegator
        .startAbility(want)
        .then(async () => {
          console.info(LABLE + TAG + " startAbility start success");
          setTimeout(() => {
            globalThis.main4AbilityContext.terminateSelf();
          }, 2000);
        })
        .catch((err: BusinessError) => {
          abilityDelegator.printSync(LABLE + TAG + "start catch error, err = " + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      setTimeout(() => {
        console.log(LABLE + TAG + " assertEqual result=" + result);
        expect(result).assertEqual(1);
        abilityDelegator.printSync(
          TAG + " pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0500
     * @tc.name Acts_RemoveAbility_Monitor_Promise_2_0500
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to the onWindowStageDestroy callback Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0500", 0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0500";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      monitor = {
        abilityName: "Main4Ability",
        onWindowStageDestroy: () => {
          abilityDelegator.printSync(LABLE + TAG + " onWindowStageDestroyPromise");
          result = 0;
        },
      };
      console.log(LABLE + TAG + " addAbilityMonitor start");
      await abilityDelegator.addAbilityMonitor(monitor);
      await sleep(500);
      console.log(LABLE + TAG + " removeAbilityMonitor start");
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          monitor = undefined;
          abilityDelegator.printSync(LABLE + TAG + " removeAbilityMonitor promise");
        })
        .catch((err: BusinessError) => {
          abilityDelegator.printSync(LABLE + TAG + " removeAbilityMonitor catch error, err = " + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await sleep(500);
      console.log(LABLE + TAG + " startAbility start");
      abilityDelegator
        .startAbility(want)
        .then(async () => {
          console.info(LABLE + TAG + " startAbility success");
          setTimeout(() => {
            globalThis.main4AbilityContext.terminateSelf();
          }, 2000);
        })
        .catch((err: BusinessError) => {
          abilityDelegator.printSync(LABLE + TAG + " startAbility catch error, err=" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      setTimeout(() => {
        console.info(LABLE + TAG + " result =" + result);
        expect(result).assertEqual(1);
        abilityDelegator.printSync(
          TAG + " pass "
        );
        done();
      }, 3000);
    });
  });
}

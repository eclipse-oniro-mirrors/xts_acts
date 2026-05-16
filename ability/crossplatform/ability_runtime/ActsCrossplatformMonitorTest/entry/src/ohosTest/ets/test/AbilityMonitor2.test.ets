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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from "@ohos.app.ability.abilityDelegatorRegistry";
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import commonEvent from '@ohos.commonEventManager';
let ACTS_CallFunction: commonEvent.CommonEventSubscribeInfo = {
  events: ['Main4Ability.onAbilityCreate']
};
let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

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
  let deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');

  describe("AbilityMonitor2Test", () => {
    beforeEach(async (done: Function) => {
      console.info("AbilityMonitor2Test before each called");
      await sleep(500);
      done();
    });

    afterEach(async (done: Function) => {
      if (monitor) {
        console.info(LABLE + TAG + "AbilityMonitor2Test afterEach removeAbilityMonitor called");
        abilityDelegator.removeAbilityMonitor(monitor, () => {
          monitor = undefined;
        });
      }
      if (TAG === "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0100" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0200" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0100" ||
        TAG === "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0200") {
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
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0100
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0100
     * @tc.desc   Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the callback function (onAbilityForeground) CallBack when the ability status becomes foreground
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0100", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0100";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
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
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0200
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0200
     * @tc.desc   Verify that addAbilityMonitor enters the normal value of the monitor parameter and executes the callback function (onWindowStageCreate) CallBack when the window stage is created
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0200", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0200";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main3Ability",
        "entry"
      );
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
          }, 500);
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
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0300
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0300
     * @tc.desc   Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the callback function (onWindowStageCreate) Promise when the window stage is created
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0300", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0300";
      console.log(LABLE + TAG + " start");
      if (deviceSupport === 'false') {
        console.log(LABLE + TAG + " deviceSupport: " + deviceSupport);
        done();
        return;
      }
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );

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
        }, 1000);
      });
    });

    /**
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0400
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0400
     * @tc.desc   Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the onAbilityBackground Promise when the ability status becomes background
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0400", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0400";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

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
      await sleep(500);
      console.log(LABLE + TAG + " startAbility start");
      abilityDelegator.startAbility(want, (err) => {
        console.log(LABLE + TAG + " err:" + JSON.stringify(err));
        setTimeout(() => {
          globalThis.main2AbilityContext.terminateSelf();
        }, 1000);
      });
    });

    /**
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0500
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0500
     * @tc.desc   Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the onAbilityDestroy callBack function before the ability is destroyed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0500", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_CALLBACK_2_0500";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main3Ability",
        "entry"
      );

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
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0100
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0100
     * @tc.desc   Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the onAbilityForeground Promise when the ability status becomes foreground
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0100", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0100";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );

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
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0200
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0200
     * @tc.desc   Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the callback function (onWindowStageCreate) Promise when the window stage is created
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0200", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0200";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

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
          }, 1000);
        })
        .catch(() => {
          abilityDelegator.printSync(
            TAG + " error"
          );
          done();
        });
    });

    /**
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0300
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0300
     * @tc.desc   Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the onAbilityBackground Promise when the ability status becomes background     * @tc.size MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0300", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0300";
      console.log(LABLE + TAG + " start");
      if (deviceSupport === 'false') {
        console.log(LABLE + TAG + " deviceSupport: " + deviceSupport);
        done();
        return;
      }
      const want = factoryWant(
        "com.example.delegatortest",
        "Main3Ability",
        "entry"
      );

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
      console.log(LABLE + TAG + " startAbility start");
      await sleep(200);
      abilityDelegator
        .startAbility(want)
        .then(async () => {
          console.info(TAG + " start");
          setTimeout(() => {
            globalThis.main3Context.terminateSelf();
          }, 1000);
        })
        .catch(() => {
          console.info(LABLE + TAG + "ACTS_AddAbilityMonitor_Promise_0300 startability error");
          done();
        });
    });

    /**
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0400
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0400
     * @tc.desc   Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the callback function (onWindowStageDestroy) Promise before the window stage is destroyed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0400", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0400";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );

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
      await sleep(200);
      abilityDelegator.startAbility(want, (err) => {
        console.log(LABLE + TAG + " startAbility end, err=" + JSON.stringify(err));
        setTimeout(() => {
          globalThis.main4AbilityContext.terminateSelf();
        }, 1000);
      });
    });

    /**
     * @tc.name   ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0500
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0500
     * @tc.desc   Verify that the addAbilityMonitor parameter monitor passes in the normal value, and execute the onAbilityDestroy Promise before the ability is destroyed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0500", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ADD_ABILITY_MONITOR_PROMISE_2_0500";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main3Ability",
        "entry"
      );

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
        }, 1000);
      });
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0100
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0100
     * @tc.desc   After verifying removeAbilityMonitor, you cannot listen to the onAbilityForeground callback CallBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0100", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0100";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;
      let id: number;

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
      });
      let subscriber: commonEvent.CommonEventSubscriber;
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        if (data.event == 'Main4Ability.onAbilityCreate') {
          expect(result).assertEqual(0);
          abilityDelegator.printSync(
            TAG + " pass "
          );
          clearTimeout(id);
          if (subscriber) {
            commonEvent.unsubscribe(subscriber, done());
          } else {
            done();
          }
        }
      };
      id = setTimeout(() => {
        console.log(LABLE + TAG + "startAbility fail");
        expect().assertFail();
        if (subscriber) {
          commonEvent.unsubscribe(subscriber, done());
        } else {
          done();
        }
      }, 3000);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0200
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0200
     * @tc.desc   After validating removeAbilityMonitor, you cannot listen to the onWindowStageCreate callback CallBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0200", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0200";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;
      let id: number;

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
      });
      let subscriber: commonEvent.CommonEventSubscriber;

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        if (data.event == 'Main4Ability.onAbilityCreate') {
          expect(result).assertEqual(0);
          abilityDelegator.printSync(
            TAG + " pass "
          );
          clearTimeout(id);
        if (subscriber) {
          commonEvent.unsubscribe(subscriber, done());
        } else {
          done();
        }
        }
      };
      id = setTimeout(() => {
        console.log(LABLE + TAG + "startAbility fail");
        expect().assertFail();
        if (subscriber) {
          commonEvent.unsubscribe(subscriber, done());
        } else {
          done();
        }
      }, 3000);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0300
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0300
     * @tc.desc   After verifying removeAbilityMonitor, you cannot listen to the onAbilityBackground callback callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0300", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0300";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;

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
          }, 1000);
        });
      });
      setTimeout(() => {
        console.log(LABLE + TAG + " assertEqual result=" + result);
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          TAG + " pass "
        );
        done();
      }, 1000);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0400
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0400
     * @tc.desc   After verifying removeAbilityMonitor, you cannot listen to the onAbilityDestroy callback CallBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0400", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0400";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;
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
          }, 1000);
        });
      });
      setTimeout(() => {
        console.log(LABLE + TAG + " assertEqual result=" + result);
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          TAG + " pass "
        );
        done();
      }, 1000);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0500
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0500
     * @tc.desc   After verifying removeAbilityMonitor, you cannot listen to the onWindowStageDestroy callback CallBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0500", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_2_0500";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;

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
          }, 1000);
        });
      });
      setTimeout(() => {
        console.log(LABLE + TAG + " assertEqual result:" + result);
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          TAG + " pass "
        );
        done();
      }, 1000);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0100
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0100
     * @tc.desc   After verifying removeAbilityMonitor, you cannot listen to onAbilityForeground callback promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0100", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0100";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;
      let id: number;

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
        if (data.event == 'Main4Ability.onAbilityCreate') {
          expect(result).assertEqual(1);
          abilityDelegator.printSync(
            TAG + " pass "
          );
          clearTimeout(id);
          if (subscriber) {
            commonEvent.unsubscribe(subscriber, done());
          } else {
            done();
          }
        }
      };
      id = setTimeout(() => {
        console.log(LABLE + TAG + "startAbility fail");
        expect().assertFail();
          if (subscriber) {
            commonEvent.unsubscribe(subscriber, done());
          } else {
            done();
          }
      }, 3000);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0200
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0200
     * @tc.desc   After verifying removeAbilityMonitor, you cannot listen to the onWindowStageCreate callback Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0200", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0200";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;
      let id: number;

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
        if (data.event == 'Main4Ability.onAbilityCreate') {
          expect(result).assertEqual(1);
          abilityDelegator.printSync(
            TAG + " pass "
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
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0300
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0300
     * @tc.desc   After validating removeAbilityMonitor, you cannot listen to the onAbilityBackground callback Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0300", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0300";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;

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
          }, 500);
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
      }, 1000);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0400
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0400
     * @tc.desc   After verifying removeAbilityMonitor, you cannot listen to onAbilityDestroy callback promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0400", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0400";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;

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
          }, 500);
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
      }, 1000);
    });

    /**
     * @tc.name   ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0500
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0500
     * @tc.desc   After verifying removeAbilityMonitor, you cannot listen to the onWindowStageDestroy callback Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0500", Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_2_0500";
      console.log(LABLE + TAG + " start");
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;

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
          }, 500);
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
      }, 1000);
    });
  });
}

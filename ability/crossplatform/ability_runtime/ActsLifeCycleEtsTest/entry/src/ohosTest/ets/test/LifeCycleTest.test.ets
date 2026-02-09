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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import AbilityLifecycleCallback from '@ohos.app.ability.AbilityLifecycleCallback';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

const moduleName = "entry_test";
const otherBundle = "com.example.commontestabilityapp";
const otherModuleName = "feature";
let deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');

let TAG: string = "";
let tempCallbackId: number;
let intervalId: number = -1;

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  });
}

function handlerMessage(callback: ESObject): number {
  if (intervalId != -1) {
    clearInterval(intervalId);
  }
  intervalId = setInterval(() => {
    let event: Array<string> = globalThis.testEvent;
    globalThis.testEvent = [];
    if (event && event.length > 0) {
      event.forEach(str => {
        callback(str);
      })
    }
  }, 100);
  return intervalId;
}

function handlerMessageDelayed(event: string, longTime: number): void {
  if (event == undefined || event === '') {
    return;
  }
  if (longTime == 0) {
    globalThis.testEvent.push(event);
    return;
  }
  setTimeout(() => {
    globalThis.testEvent.push(event);
  }, longTime);
}

export default function lifecycleTest() {
  describe("LifeCycleTest", () => {
    beforeEach(async (done: Function) => {
      console.info("LifeCycleTest before each called");
      await sleep(1000);
      done();
    });
    let para: common.AbilityResult = {
      resultCode: 2,
      want: {
        abilityName: "MainAbility1",
        bundleName: "com.test.lifecycle_crossplatform_xts",
        moduleName: moduleName,
      },
    }
    afterEach(async (done: Function) => {
      console.info("LifeCycleTest after each called");
      if ("Crossplatform_Singlehap_LifeCycleTest_0200" === TAG || "Crossplatform_Singlehap_LifeCycleTest_0300" === TAG
        || "Crossplatform_Singlehap_LifeCycleTest_0500" === TAG || "Crossplatform_Singlehap_LifeCycleTest_0600" === TAG
        || "Crossplatform_Singlehap_LifeCycleTest_0800" === TAG || "Crossplatform_Singlehap_LifeCycleTest_0900" === TAG
        || "Crossplatform_Singlehap_LifeCycleTest_1400" === TAG || "Crossplatform_LifeCycleTest_on_0400" === TAG) {
        console.log("LifeCycleTest terminateSelfwithresult para: " + JSON.stringify(para));

        await globalThis.ability1context
          .terminateSelf()
          .then((data: ESObject) => {
            console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          })
          .catch((error: BusinessError) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      } else if ("Singlehap_LifeCycleTest_2000" === TAG) {
        let para1: common.AbilityResult = {
          resultCode: 2,
          want: {
            abilityName: "MainAbility12",
            bundleName: "com.test.lifecycle_crossplatform_xts",
            moduleName: moduleName,
          },
        };
        console.log("LifeCycleTest terminateSelfwithresult para: " + JSON.stringify(para1));
        await globalThis.ability12
          .terminateSelf()
          .then((data: ESObject) => {
            console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          })
          .catch((error: BusinessError) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      }
      done();
    });


    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_0100
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_0100", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_Singlehap_LifeCycleTest_0100 START-------------");
      TAG = "Crossplatform_Singlehap_LifeCycleTest_0100";
      let code: number;
      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };

      handlerMessage((event: string) => {
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'MainAbility2onDestroy') {
          clearInterval(intervalId);
          intervalId = -1;
          console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list));
          console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid));
          tempCallbackId = globalThis.callbackid;
          console.log(TAG + " registerAbilityLifecycleCallback tempCallbackId : " + JSON.stringify(tempCallbackId));
          let listTemp = JSON.stringify(globalThis.list);
          console.log(TAG + " listTemp is :" + listTemp);
          expect(listTemp.indexOf("MainAbility2 onAbilityCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onWindowStageCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityForeground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityBackground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityDestroy") !== -1).assertTrue();
          globalThis.applicationContext.off("abilityLifecycle", tempCallbackId, (error: BusinessError) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + error);
            code = error ? error.code : 0;
            expect(code).assertEqual(0);
            done();
            console.log("------------Crossplatform_Singlehap_LifeCycleTest_0100 END-------------");
          });
        }
      });

      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
    });

    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_0200
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_0200", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_Singlehap_LifeCycleTest_0200 START-------------");
      TAG = "Crossplatform_Singlehap_LifeCycleTest_0200";
      let code: number;
      let oneStartMainAbility1: boolean = false;
      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      let str1: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };

      handlerMessage((event: string) => {
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'StartMainAbility1') {
          globalThis.abilityContext
            .startAbility(str)
            .then((data: ESObject) => {
              console.info(TAG + " start successful. Data: " + data);
            })
            .catch((error: BusinessError) => {
              console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
            });
        } else if (event === 'MainAbility1onForeground') {
          if (!oneStartMainAbility1) {
            globalThis.abilityContext
              .startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + " start successful. Data: " + data);
              })
              .catch((error: BusinessError) => {
                console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
              });
          }
          oneStartMainAbility1 = true;
        } else if (event === 'MainAbility2onDestroy') {
          clearInterval(intervalId);
          intervalId = -1;
          console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
          console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
          let listTemp = JSON.stringify(globalThis.list1);
          console.log(TAG + " listTemp is :" + listTemp);
          expect(listTemp.indexOf("MainAbility1 onWindowStageCreate") !== -1).assertTrue();
          if (deviceSupport !== 'false') {
            expect(listTemp.split("MainAbility1 onAbilityForeground").length - 1).assertEqual(2);
            expect(listTemp.indexOf("MainAbility1 onAbilityBackground") !== -1).assertTrue();
          }
          expect(listTemp.indexOf("MainAbility2 onAbilityCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onWindowStageCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityForeground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityBackground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityDestroy") !== -1).assertTrue();
          globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error: BusinessError) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + error);
            code = error ? error.code : 0;
            expect(code).assertEqual(0);
            console.log("------------Crossplatform_Singlehap_LifeCycleTest_0200 END-------------");
            done();
          });
        }
      });
      handlerMessageDelayed('StartMainAbility1', 0);
    });

    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_0300
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_0300", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_Singlehap_LifeCycleTest_0300 START-------------");
      TAG = "Crossplatform_Singlehap_LifeCycleTest_0300";
      let code: number;
      let oneStartMainAbility1: boolean = false;
      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      let str1: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };

      handlerMessage((event: string) => {
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'StartMainAbility1') {
          globalThis.abilityContext
            .startAbility(str)
            .then((data: ESObject) => {
              console.info(TAG + " start successful. Data: " + data);
            })
            .catch((error: BusinessError) => {
              console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
            });
        } else if (event === 'MainAbility1onForeground') {
          if (!oneStartMainAbility1) {
            globalThis.abilityContext
              .startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + " start successful. Data: " + data);
              })
              .catch((error: BusinessError) => {
                console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
              });
          }
          oneStartMainAbility1 = true;
        } else if (event === 'MainAbility2onDestroy') {
          clearInterval(intervalId);
          intervalId = -1;
          console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
          console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
          let listTemp = JSON.stringify(globalThis.list1);
          console.log(TAG + " listTemp is :" + listTemp);
          expect(listTemp.indexOf("MainAbility1 onWindowStageCreate") !== -1).assertTrue();
          if (deviceSupport !== 'false') {
            expect(listTemp.split("MainAbility1 onAbilityForeground").length - 1).assertEqual(2);
            expect(listTemp.indexOf("MainAbility1 onAbilityBackground") !== -1).assertTrue();
          }
          expect(listTemp.indexOf("MainAbility2 onAbilityCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onWindowStageCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityForeground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityBackground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityDestroy") !== -1).assertTrue();
          globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error: BusinessError) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: ");
          });
          setTimeout(() => {
            console.log(TAG + " secondunregister callbackid : " + JSON.stringify(globalThis.callbackid1));
            globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error: BusinessError) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
              code = error ? error.code : 0;
              expect(code).assertEqual(401);
              console.log("------------Crossplatform_Singlehap_LifeCycleTest_0300 END-------------");
              done();
            });
          }, 1000);
        }
      });
      handlerMessageDelayed('StartMainAbility1', 0);
    });

    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_0400
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_0400", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_Singlehap_LifeCycleTest_0400 START-------------");
      TAG = "Crossplatform_Singlehap_LifeCycleTest_0400";
      let code: number;
      let oneStartMainAbility3: boolean = false;
      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility3",
        moduleName: moduleName,
      };
      let str1: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };

      handlerMessage((event: string) => {
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'StartMainAbility3') {
          globalThis.abilityContext
            .startAbility(str)
            .then((data: ESObject) => {
              console.info(TAG + " start3 successful. Data: " + data);
            })
            .catch((error: BusinessError) => {
              console.info(TAG + " start3 failed. Cause: " + JSON.stringify(error));
            });
        } else if (event === 'MainAbility3onForeground') {
          if (!oneStartMainAbility3) {
            globalThis.abilityContext
              .startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + " start2 successful. Data: " + data);
              })
              .catch((error: BusinessError) => {
                console.info(TAG + " start2 failed. Cause: " + JSON.stringify(error));
              });
          }
          oneStartMainAbility3 = true;
        } else if (event === 'MainAbility2onDestroy') {
          clearInterval(intervalId);
          intervalId = -1;
          globalThis.applicationContext3.off("abilityLifecycle", globalThis.callbackid3, (error: BusinessError) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
            code = error ? error.code : 0;
            expect(code).assertEqual(0);
          });
          console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list3));
          console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid3));
          let listTemp = JSON.stringify(globalThis.list3);
          console.log(TAG + " listTemp is :" + listTemp);
          expect(listTemp.indexOf("MainAbility3 onWindowStageCreate") !== -1).assertTrue();
          if (deviceSupport !== 'false') {
            expect(listTemp.split("MainAbility3 onAbilityForeground").length - 1).assertEqual(2);
            expect(listTemp.indexOf("MainAbility3 onAbilityBackground") !== -1).assertTrue();
          }
          expect(listTemp.indexOf("MainAbility2 onAbilityCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onWindowStageCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityForeground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityBackground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityDestroy") !== -1).assertTrue();
          globalThis.ability3
            .terminateSelf()
            .then((data: ESObject) => {
              console.log(TAG + " terminateSelfwithresult successful data: " + JSON.stringify(data));
            })
            .catch((error: BusinessError) => {
              console.log(TAG + " terminateSelfwithresult error: " + JSON.stringify(error));
            });
          done();
        }
      });
      handlerMessageDelayed('StartMainAbility3', 0);
    });

    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_0500
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_0500", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_Singlehap_LifeCycleTest_0500 START-------------");
      TAG = "Crossplatform_Singlehap_LifeCycleTest_0500";
      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      let str1: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility3",
        moduleName: moduleName,
      };
      let str2: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility4",
        moduleName: moduleName,
      };
      let ability1HasForeground = false;
      handlerMessage((event: string) => {
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'StartMainAbility1') {
          globalThis.abilityContext
            .startAbility(str)
            .then((data: ESObject) => {
              console.info(TAG + " start1 successful. Data: " + data);
            })
            .catch((error: BusinessError) => {
              console.info(TAG + " start1 failed. Cause: " + JSON.stringify(error));
            });
        } else if (event === 'MainAbility1onForeground') {
          if (!ability1HasForeground) {
            globalThis.abilityContext
              .startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + " start3 successful. Data: " + data);
              })
              .catch((error: BusinessError) => {
                console.info(TAG + " start3 failed. Cause: " + JSON.stringify(error));
              });
          }
          ability1HasForeground = true;
        } else if (event === 'MainAbility3onForeground') {
          globalThis.abilityContext
            .startAbility(str2).then((data: ESObject) => {
            console.info(TAG + " start4 successful. Data: " + data);
          }).catch((error: BusinessError) => {
            console.info(TAG + " start4 failed. Cause: " + JSON.stringify(error));
          });
          globalThis.ability3.terminateSelf();
        } else if (event === 'MainAbility4onForeground') {
          clearInterval(intervalId);
          intervalId = -1;
          console.log(TAG + " listKey1 : " + JSON.stringify(globalThis.list1));
          console.log(TAG + " callbackid1 : " + JSON.stringify(globalThis.callbackid1));
          console.log(TAG + " listKey3 : " + JSON.stringify(globalThis.list3));
          console.log(TAG + " callbackid3 : " + JSON.stringify(globalThis.callbackid3));
          let id3: number = globalThis.callbackid3 as number;
          console.log(TAG + " listKey4 : " + JSON.stringify(globalThis.list4));
          console.log(TAG + " callbackid4 : " + JSON.stringify(globalThis.callbackid4));
          let id4: number = globalThis.callbackid4 as number;
          expect(id3 + 1).assertEqual(id4);
          globalThis.applicationContext4.off("abilityLifecycle", globalThis.callbackid1, (error: BusinessError) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback1 success, err: " + JSON.stringify(error));
            globalThis.applicationContext4.off("abilityLifecycle", globalThis.callbackid3, (error: BusinessError) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback3 success, err: " + JSON.stringify(error));
              globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid4, (error: BusinessError) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback4 success, err: " + JSON.stringify(error));
                done();
              });
            });
          });
        }
      });
      handlerMessageDelayed('StartMainAbility1', 2000);
    });

    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_0600
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_0600", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_Singlehap_LifeCycleTest_0600 START-------------");
      TAG = "Crossplatform_Singlehap_LifeCycleTest_0600";
      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      let str1: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility5",
        moduleName: moduleName,
      };
      let str2: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };
      let oneStartMainAbility1 = false;
      let oneStartMainAbility5 = false;
      let isStartWith600 = false;

      handlerMessage((event: string) => {
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'StartMainAbility1') {
          isStartWith600 = true;
          globalThis.abilityContext
            .startAbility(str).then((data: ESObject) => {
            console.info(TAG + " start1 successful. Data: " + data);
          }).catch((error: BusinessError) => {
            console.info(TAG + " start1 failed. Cause: " + JSON.stringify(error));
          });
        } else if (event === 'MainAbility1onForeground' && isStartWith600) {
          if (!oneStartMainAbility1) {
            globalThis.abilityContext
              .startAbility(str1).then((data: ESObject) => {
              console.info(TAG + " start5 successful. Data: " + data);
            }).catch((error: BusinessError) => {
              console.info(TAG + " start5 failed. Cause: " + JSON.stringify(error));
            });
          }
          oneStartMainAbility1 = true;
        } else if (event === 'MainAbility5onForeground') {
          if (!oneStartMainAbility5) {
            oneStartMainAbility5 = true;
            globalThis.abilityContext
              .startAbility(str2).then((data: ESObject) => {
              console.info(TAG + " start4 successful. Data: " + data);
            }).catch((error: BusinessError) => {
              console.info(TAG + " start4 failed. Cause: " + JSON.stringify(error));
            });
          }
        } else if (event === 'MainAbility2onDestroy') {
          clearInterval(intervalId);
          intervalId = -1;
          console.log(TAG + " listKey1 : " + JSON.stringify(globalThis.list1));
          console.log(TAG + " callbackid1 : " + JSON.stringify(globalThis.callbackid1));
          let listTemp = JSON.stringify(globalThis.list1);
          console.log(TAG + " listTemp is :" + listTemp);
          expect(listTemp.indexOf("MainAbility2 onAbilityCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onWindowStageCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityForeground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityBackground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility5 onAbilityCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility5 onWindowStageCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility5 onAbilityForeground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility5 onAbilityBackground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility5 onWindowStageDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility5 onAbilityDestroy") !== -1).assertTrue();
          globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error: BusinessError) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
            done();
          });
        }
      });
      handlerMessageDelayed('StartMainAbility1', 1000);
    });

    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_0700
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_0700", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_Singlehap_LifeCycleTest_0700 START-------------");
      TAG = "Crossplatform_Singlehap_LifeCycleTest_0700";
      let code1: number;
      let code2: number;
      let code3: number;
      let id1: number;
      let id2: number;
      let id3: number;
      let listKey8: string[] = [];
      let AbilityLifecycleCallback: AbilityLifecycleCallback = {
        onAbilityCreate(ability) {
          console.log(TAG + " onAbilityCreate ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " onAbilityCreate abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityCreate");
          listKey8.push(abilityname + " onAbilityCreate");
        },
        onWindowStageCreate(ability, windowStage) {
          console.log(TAG + " onWindowStageCreate ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " onWindowStageCreate abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onWindowStageCreate");
          listKey8.push(abilityname + " onWindowStageCreate");
        },
        onWindowStageActive(ability, windowStage) {
          let abilityname = ability.context.abilityInfo.name;
          console.log(abilityname + " onWindowStageActive");
        },
        onWindowStageInactive(ability, windowStage) {
          let abilityname = ability.context.abilityInfo.name;
          console.log(abilityname + " onWindowStageInactive");
        },
        onWindowStageDestroy(ability, windowStage) {
          console.log(TAG + " AbilityLifecycleCallback1 onWindowStageDestroy ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onWindowStageDestroy abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onWindowStageDestroy");
          listKey8.push(abilityname + " onWindowStageDestroy");
        },
        onAbilityDestroy(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityDestroy ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityDestroy abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityDestroy");
          listKey8.push(abilityname + " onAbilityDestroy");
        },
        onAbilityForeground(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityForeground ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityForeground abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityForeground");
          listKey8.push(abilityname + " onAbilityForeground");
        },
        onAbilityBackground(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityBackground ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityBackground abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityBackground");
          listKey8.push(abilityname + " onAbilityBackground");
        },
        onAbilityContinue(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityContinue ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityContinue abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityContinue");
          listKey8.push(abilityname + " onAbilityContinue");
        },
      };
      let applicationContext: common.ApplicationContext = globalThis.abilityContext.getApplicationContext() as common.ApplicationContext;
      id1 = applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
      console.log(TAG + " registerAbilityLifecycleCallback1 number: " + JSON.stringify(id1));
      await sleep(1000);
      applicationContext.off("abilityLifecycle", id1, (error: BusinessError) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        code1 = error ? error.code : 0;
      });
      await sleep(1000);
      id2 = applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
      console.log(TAG + " registerAbilityLifecycleCallback2 number: " + JSON.stringify(id2));
      await sleep(1000);
      applicationContext.off("abilityLifecycle", id2, (error: BusinessError) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        code2 = error ? error.code : 0;
      });
      await sleep(1000);
      id3 = applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
      console.log(TAG + " registerAbilityLifecycleCallback3 number: " + JSON.stringify(id3));
      await sleep(1000);
      applicationContext.off("abilityLifecycle", id3, (error: BusinessError) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback3 success, err: " + JSON.stringify(error));
        code3 = error ? error.code : 0;
        expect(id1 > 0).assertTrue();
        expect(id2).assertEqual(id1 + 1);
        expect(id3).assertEqual(id2 + 1);
        expect(code1).assertEqual(0);
        expect(code2).assertEqual(0);
        expect(code3).assertEqual(0);
        console.log("------------Crossplatform_Singlehap_LifeCycleTest_0700 END-------------");
        done();
      });
    });

    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_0800
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_0800", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_Singlehap_LifeCycleTest_0800 START-------------");
      TAG = "Crossplatform_Singlehap_LifeCycleTest_0800";
      globalThis.MainAbility1onForeground = false;
      globalThis.applicationContext1onAbilityLifecycle = false;
      let mainAbility2FirstStart = false;
      let mainAbility2SecendStart = false;
      let mainAbility2ThirtStart = false;
      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      let str1: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };

      handlerMessage((event: string) => {
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'StartMainAbility1') {
          globalThis.abilityContext
            .startAbility(str).then((data: ESObject) => {
            console.info(TAG + " start 1 successful. Data: " + data);
          }).catch((error: BusinessError) => {
            console.info(TAG + " start 1 failed. Cause: " + JSON.stringify(error));
          });
        } else if (event === 'MainAbility1onForeground') {
          if (!mainAbility2FirstStart) {
            mainAbility2FirstStart = true;
            globalThis.abilityContext
              .startAbility(str1).then((data: ESObject) => {
              console.info(TAG + " start 2 successful. Data: " + data);
            }).catch((error: BusinessError) => {
              console.info(TAG + " start 2 failed. Cause: " + JSON.stringify(error));
            });
          }
        } else if (event === 'MainAbility2onDestroy') {
          if (mainAbility2SecendStart && mainAbility2ThirtStart) {
            console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
            console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
            let listTemp = JSON.stringify(globalThis.list1);
            console.log(TAG + " listTemp is :" + listTemp);
            expect(listTemp.indexOf("MainAbility1 onWindowStageCreate") !== -1).assertTrue();
            if (deviceSupport !== 'false') {
              expect(listTemp.split("MainAbility1 onAbilityForeground").length - 1).assertEqual(4);
              expect(listTemp.split("MainAbility1 onAbilityBackground").length - 1).assertEqual(3);
            }
            expect(listTemp.split("MainAbility2 onAbilityCreate").length - 1).assertEqual(3);
            expect(listTemp.split("MainAbility2 onWindowStageCreate").length - 1).assertEqual(3);
            expect(listTemp.split("MainAbility2 onAbilityForeground").length - 1).assertEqual(3);
            expect(listTemp.split("MainAbility2 onAbilityBackground").length - 1).assertEqual(3);
            expect(listTemp.split("MainAbility2 onWindowStageDestroy").length - 1).assertEqual(3);
            expect(listTemp.split("MainAbility2 onAbilityDestroy").length - 1).assertEqual(3);
            globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error: BusinessError) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
              done();
            });
          }
          if (!mainAbility2SecendStart || !mainAbility2ThirtStart) {
            if (mainAbility2SecendStart) {
              mainAbility2ThirtStart = true;
            }
            mainAbility2SecendStart = true;
            globalThis.abilityContext
              .startAbility(str1).then((data: ESObject) => {
              console.info(TAG + " start successful. Data: " + data);
            }).catch((error: BusinessError) => {
              console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
            });
          }
        }
      });
      handlerMessageDelayed('StartMainAbility1', 0);
    });

    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_0900
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_0900", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_Singlehap_LifeCycleTest_0900 START-------------");
      TAG = "Crossplatform_Singlehap_LifeCycleTest_0900";
      globalThis.MainAbility1onForeground = false;
      globalThis.applicationContext1onAbilityLifecycle = false;
      let mainAbility2FirstStart = false;
      let mainAbility2FirstDestory = false;
      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      let str1: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };

      handlerMessage((event: string) => {
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'StartMainAbility1') {
          globalThis.abilityContext
            .startAbility(str).then((data: ESObject) => {
            console.info(TAG + " start 1 successful. Data: " + data);
          }).catch((error: BusinessError) => {
            console.info(TAG + " start 1 failed. Cause: " + JSON.stringify(error));
          });
        } else if (event === 'MainAbility1onForeground') {
          if (!mainAbility2FirstStart) {
            mainAbility2FirstStart = true;
            globalThis.abilityContext
              .startAbility(str1).then((data: ESObject) => {
              console.info(TAG + " start 2 successful. Data: " + data);
            }).catch((error: BusinessError) => {
              console.info(TAG + " start 2 failed. Cause: " + JSON.stringify(error));
            });
          }
        } else if (event === 'MainAbility2onDestroy') {
          if (!mainAbility2FirstDestory) {
            globalThis.abilityContext
              .startAbility(str1).then((data: ESObject) => {
              console.info(TAG + " start successful. Data: " + data);
            }).catch((error: BusinessError) => {
              console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
            });
          } else {
            console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
            console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
            let listTemp = JSON.stringify(globalThis.list1);
            console.log(TAG + " listTemp is :" + listTemp);
            expect(listTemp.indexOf("MainAbility1 onWindowStageCreate") !== -1).assertTrue();
            if (deviceSupport !== 'false') {
              expect(listTemp.split("MainAbility1 onAbilityForeground").length - 1).assertEqual(3);
              expect(listTemp.split("MainAbility1 onAbilityBackground").length - 1).assertEqual(2);
            }
            expect(listTemp.split("MainAbility2 onAbilityCreate").length - 1).assertEqual(2);
            expect(listTemp.split("MainAbility2 onWindowStageCreate").length - 1).assertEqual(2);
            expect(listTemp.split("MainAbility2 onAbilityForeground").length - 1).assertEqual(2);
            expect(listTemp.split("MainAbility2 onAbilityBackground").length - 1).assertEqual(2);
            expect(listTemp.split("MainAbility2 onWindowStageDestroy").length - 1).assertEqual(2);
            expect(listTemp.split("MainAbility2 onAbilityDestroy").length - 1).assertEqual(2);
            globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error: BusinessError) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
              done();
            });
          }
          mainAbility2FirstDestory = true;
        }
      });
      handlerMessageDelayed('StartMainAbility1', 0);
    });

    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_1000
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_1000", Level.LEVEL0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_1200 START-------------");
      TAG = "Singlehap_LifeCycleTest_1200";
      let id1: number|undefined = undefined;
      let id2: number|undefined = undefined;
      globalThis.MainAbility8onForeground = false;
      globalThis.applicationContext8onAbilityLifecycle = false;
      let mainAbility8onDestroyCount = 0;
      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility8",
        moduleName: moduleName,
      };

      handlerMessage((event: string) => {
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'StartMainAbility8') {
          globalThis.abilityContext
            .startAbility(str).then((data: ESObject) => {
            console.info(TAG + " start successful. Data: " + data);
          }).catch((error: BusinessError) => {
            console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
          });
        } else if (event === 'MainAbility8onForeground') {
          if (id1) {
            id2 = globalThis.callbackid8;
            console.log(TAG + " secondCallback id : " + JSON.stringify(id2));
          } else {
            id1 = globalThis.callbackid8;
            console.log(TAG + " firstCallback id : " + JSON.stringify(id1));
          }
          globalThis.ability8.terminateSelf((error: ESObject, data: ESObject) => {
            console.log(TAG + " terminateSelfwithresult success, err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
          });
        } else if (event === 'MainAbility8onDestroy') {
          mainAbility8onDestroyCount++;
          if (mainAbility8onDestroyCount === 1) {
            // Second startup
            handlerMessageDelayed('StartMainAbility8', 0);
          } else {
            expect(id1! + 1).assertEqual(id2);
            globalThis.applicationContext8.off("abilityLifecycle", id1, (error: BusinessError) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success1, err: " + JSON.stringify(error));
              globalThis.applicationContext8.off("abilityLifecycle", id2, (error: BusinessError) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback success2, err: " + JSON.stringify(error));
                console.log("------------Singlehap_LifeCycleTest_1200 END-------------");
                done();
              });
            });
          }
        }
      });
      handlerMessageDelayed('StartMainAbility8', 0);
    });

    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_1100
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_1100", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_Singlehap_LifeCycleTest_1100 start-------------");
      TAG = "Crossplatform_Singlehap_LifeCycleTest_1100";
      globalThis.MainAbility9onForeground = false;
      globalThis.applicationContext9onAbilityLifecycle = false;
      let hap1MainAbility2onDestroyCount = 0;
      let mainAbility9StartedHap1MainAbility2onDestroy = false;

      handlerMessage((event: string) => {
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'StartMainAbility9') {
          globalThis.abilityContext.startAbility({
            bundleName: "com.test.lifecycle_crossplatform_xts",
            abilityName: "MainAbility9",
            moduleName: moduleName,
          }, (error: ESObject, data: ESObject) => {
            console.log(TAG + ": MainAbility9 startAbility success, err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
          }
          );
        } else if (event === 'MainAbility9onForeground') {
          if (!mainAbility9StartedHap1MainAbility2onDestroy) {
            handlerMessageDelayed('StartHap1MainAbility2', 0);
            globalThis.ability9.terminateSelf();
          }
          mainAbility9StartedHap1MainAbility2onDestroy = true;
        } else if (event === 'StartHap1MainAbility2') {
          globalThis.abilityContext.startAbility({
            bundleName: "com.test.lifecycle_crossplatform_xts",
            abilityName: "Hap1MainAbility2",
            moduleName: moduleName,
          }, (error: ESObject, data: ESObject) => {
            console.log(TAG + ":first Hap1MainAbility2 startAbility success, err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
          }
          );
        } else if (event === 'Hap1MainAbility2onDestroy') {
          hap1MainAbility2onDestroyCount++;
          if (hap1MainAbility2onDestroyCount === 1) {
            // Second startup
            handlerMessageDelayed('StartHap1MainAbility2', 0);
          } else {
            let listTemp = JSON.stringify(globalThis.mainAbility9ListKey);
            console.log(TAG + "listTemp is :" + listTemp);
            console.log(TAG + "globalThis.mainAbility9CallBackId is :" + globalThis.mainAbility9CallBackId);
            expect(listTemp.split("Hap1MainAbility2 onAbilityCreate").length - 1).assertEqual(2);
            expect(listTemp.split("Hap1MainAbility2 onWindowStageCreate").length - 1).assertEqual(2);
            expect(listTemp.split("Hap1MainAbility2 onAbilityForeground").length - 1).assertEqual(2);
            expect(listTemp.split("Hap1MainAbility2 onAbilityBackground").length - 1).assertEqual(2);
            expect(listTemp.split("Hap1MainAbility2 onWindowStageDestroy").length - 1).assertEqual(2);
            expect(listTemp.split("Hap1MainAbility2 onAbilityDestroy").length - 1).assertEqual(2);
            globalThis.applicationContext9.off("abilityLifecycle", globalThis.mainAbility9CallBackId, (error: BusinessError) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
              done();
            });
            console.log("------------Singlehap_LifeCycleTest_1400 end-------------");
          }
        }
      });
      handlerMessageDelayed('StartMainAbility9', 0);
    });

    let callbackid_NA = 100;
    let callbackid_errorNum = -1;

    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_1200
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_1200", Level.LEVEL0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_1600 START-------------");
      TAG = "Singlehap_LifeCycleTest_1600";
      let code: number;

      globalThis.abilityContext.getApplicationContext()
        .off("abilityLifecycle", callbackid_NA, (error: BusinessError) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
          code = error.code;
          sleep(1000);
          expect(code).assertEqual(401);
          done();
        });
    });

    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_1300
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_1300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_1300", Level.LEVEL0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_1700 START-------------");
      TAG = "Singlehap_LifeCycleTest_1700";
      let code: number;

      globalThis.abilityContext.getApplicationContext()
        .off("abilityLifecycle", callbackid_errorNum, (error: BusinessError) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
          code = error.code;
          sleep(1000);
          expect(code).assertEqual(401);
          done();
        });
    });

    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_1400
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_1400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_1400", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_Singlehap_LifeCycleTest_1400 START-------------");
      TAG = "Crossplatform_Singlehap_LifeCycleTest_1400";
      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      let str2: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };

      handlerMessage((event: string) => {
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'StartMainAbility1') {
          globalThis.abilityContext
            .startAbility(str).then((data: ESObject) => {
            console.info(TAG + " start successful. Data: " + data);
          }).catch((error: BusinessError) => {
            console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
          });
        }
        if (event === 'StartMainAbility2') {
          globalThis.abilityContext
            .startAbility(str2).then((data: ESObject) => {
            console.info(TAG + " start successful. Data: " + data);
          }).catch((error: BusinessError) => {
            console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
          });
        } else if (event === 'MainAbility2onDestroy') {
          console.log(TAG + " firstCallback listKey1 : " + JSON.stringify(globalThis.list1));
          console.log(TAG + " firstCallback callbackid1 : " + JSON.stringify(globalThis.callbackid1));
          console.log(TAG + " secondCallback callbackid1 : " + JSON.stringify(globalThis.callbackid1));
          let listTemp = JSON.stringify(globalThis.list1);
          console.log(TAG + " listTemp is :" + listTemp);
          expect(listTemp.indexOf("MainAbility2 onAbilityCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onWindowStageCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityForeground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityBackground") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("MainAbility2 onAbilityDestroy") !== -1).assertTrue();
          globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error: BusinessError) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
            done();
          });
        }
      });
      handlerMessageDelayed('StartMainAbility1', 0);
      handlerMessageDelayed('StartMainAbility2', 1000);
    });

    /**
     * @tc.name   Crossplatform_AbilityStage_onCreate_Test_0100
     * @tc.number Crossplatform_AbilityStage_onCreate_Test_0100
     * @tc.desc   Start mainability2, test stage ability onCreate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_AbilityStage_onCreate_Test_0100", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_AbilityStage_onCreate_Test_0100 START-------------");
      TAG = "Crossplatform_AbilityStage_onCreate_Test_0100";
      // abilitystage的onCreatre里注册了globalThis.applicationContext，globalThis.applicationContext不为null
      // 则oncreate触发成功。
      expect(globalThis.applicationContext != null).assertTrue();
      done();
      console.log("------------Crossplatform_AbilityStage_onCreate_Test_0100 END-------------");
    });

    /**
     * @tc.name   Crossplatform_AbilityStage_Context_Test_0100
     * @tc.number Crossplatform_AbilityStage_Context_Test_0100
     * @tc.desc   Start mainability2, test stage ability context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_AbilityStage_Context_Test_0100", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_AbilityStage_Context_Test_0100 START-------------");
      TAG = "Crossplatform_AbilityStage_Context_Test_0100";
      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str).then((data: ESObject) => {
        console.info(TAG + " start successful. Data: " + data);
        setTimeout(() => {
          // abilitystage的onCreatre里注册了globalThis.applicationContext，globalThis.applicationContext不为null
          // 则oncreate触发成功,且context能够获取。
          console.log("AbilityStage_Context_Test_0100 1000" + JSON.stringify(globalThis.ability2));
          expect(globalThis.ability2 != null).assertTrue();
          console.log("AbilityStage_Context_Test_0100 1001");
          expect(globalThis.ability2.currentHapModuleInfo != null).assertTrue();
          console.log("AbilityStage_Context_Test_0100 1002");
          expect(globalThis.ability2.config != null).assertTrue();
          done();
        }, 1000);
      }).catch((error: BusinessError) => {
        console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        expect().assertFail();
      });
    });

    /**
     * @tc.name   Crossplatform_Multi_LifeCycleTest_0200
     * @tc.number Crossplatform_Multi_LifeCycleTest_0200
     * @tc.desc   start multi ability1, then start multi ability1, check life cycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Multi_LifeCycleTest_0200", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_Multi_LifeCycleTest_0200 START-------------");
      TAG = "Crossplatform_Multi_LifeCycleTest_0200";
      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MultiMainability1",
        moduleName: moduleName,
      };

      // 第一次起MultiMainability1
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await sleep(1500);

      let listtemp = JSON.stringify(globalThis.mlist1);
      console.info(TAG + "list:" + listtemp);
      expect(listtemp.indexOf("MultiMainability1 onWindowStageCreate") !== -1).assertTrue();
      expect(listtemp.indexOf("MultiMainability1 onAbilityForeground") !== -1).assertTrue();
      globalThis.multiability1context.terminateSelf();
      await sleep(1000);

      // 第二次起MultiMainability1
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await sleep(1500);

      listtemp = JSON.stringify(globalThis.mlist1);
      console.info(TAG + "list:" + listtemp);
      expect(listtemp.indexOf("MultiMainability1 onAbilityCreate") !== -1).assertTrue();
      expect(listtemp.indexOf("MultiMainability1 onWindowStageCreate") !== -1).assertTrue();
      globalThis.multiability1context.terminateSelf();
      await sleep(1000);
      done();
    });

    /**
     * @tc.name   Crossplatform_LifeCycleTest_on_0100
     * @tc.number Crossplatform_LifeCycleTest_on_0100
     * @tc.desc   on abilityLifecycle twice in mainability13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_LifeCycleTest_on_0100", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_LifeCycleTest_on_0100 START-------------");
      TAG = "Crossplatform_LifeCycleTest_on_0100";
      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility13",
        moduleName: moduleName,
      };

      // 第一次起MultiMainability1
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(2500);
      console.log(TAG + "list1:" + globalThis.list13);
      const list1: string[] = globalThis.list13;
      console.log(TAG + "list2:" + globalThis.otherList13);
      const list2: string[] = globalThis.otherList13;
      expect(list1[0]).assertEqual(list2[0]);
      expect(list1[1]).assertEqual(list2[1]);
      expect(list1[2]).assertEqual(list2[2]);
      globalThis.ability13.terminateSelf();
      done();
    });

    /**
     * @tc.name   Crossplatform_LifeCycleTest_on_0200
     * @tc.number Crossplatform_LifeCycleTest_on_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_LifeCycleTest_on_0200", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_LifeCycleTest_on_0200 START-------------");
      TAG = "Crossplatform_LifeCycleTest_on_0200";
      let listKey14: string[] = [];
      let AbilityLifecycleCallback: AbilityLifecycleCallback = {
        onAbilityCreate(ability) {
          console.log(TAG + " onAbilityCreate ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " onAbilityCreate abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityCreate");
          listKey14.push(abilityname + " onAbilityCreate");
        },
        onWindowStageCreate(ability, windowStage) {
          console.log(TAG + " onWindowStageCreate ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " onWindowStageCreate abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onWindowStageCreate");
          listKey14.push(abilityname + " onWindowStageCreate");
        },
        onWindowStageActive(ability, windowStage) {
          let abilityname = ability.context.abilityInfo.name;
          console.log(abilityname + " onWindowStageActive");
        },
        onWindowStageInactive(ability, windowStage) {
          let abilityname = ability.context.abilityInfo.name;
          console.log(abilityname + " onWindowStageInactive");
        },
        onWindowStageDestroy(ability, windowStage) {
          console.log(TAG + " AbilityLifecycleCallback1 onWindowStageDestroy ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onWindowStageDestroy abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onWindowStageDestroy");
          listKey14.push(abilityname + " onWindowStageDestroy");
        },
        onAbilityDestroy(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityDestroy ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityDestroy abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityDestroy");
          listKey14.push(abilityname + " onAbilityDestroy");
        },
        onAbilityForeground(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityForeground ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityForeground abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityForeground");
          listKey14.push(abilityname + " onAbilityForeground");
        },
        onAbilityBackground(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityBackground ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityBackground abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityBackground");
          listKey14.push(abilityname + " onAbilityBackground");
        },
        onAbilityContinue(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityContinue ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityContinue abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityContinue");
          listKey14.push(abilityname + " onAbilityContinue");
        },
      };

      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility14",
        moduleName: moduleName,
      };

      // 第一次起Mainability14
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(1000);
      let applicationContext: common.ApplicationContext = globalThis.ability14.getApplicationContext() as common.ApplicationContext;

      for (let i = 0; i < 10; i++) {
        const tempId:number = applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
        console.log(TAG + " registerAbilityLifecycleCallback1 number: " + JSON.stringify(tempId));

        applicationContext.off("abilityLifecycle", tempId, (error: BusinessError) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        });
      }

      applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
      await sleep(1000);
      globalThis.ability14.terminateSelf();
      await sleep(1000);

      let listTemp = JSON.stringify(listKey14);
      console.info(TAG + "list:" + listTemp);

      expect(listTemp.indexOf("MainAbility14 onAbilityBackground") !== -1).assertTrue();
      expect(listTemp.indexOf("MainAbility14 onWindowStageDestroy") !== -1).assertTrue();
      expect(listTemp.indexOf("MainAbility14 onAbilityDestroy") !== -1).assertTrue();
      done();
    });

    /**
     * @tc.name   Crossplatform_LifeCycleTest_on_0300
     * @tc.number Crossplatform_LifeCycleTest_on_0300
     * @tc.desc   unregister callback id which is not exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_LifeCycleTest_on_0300", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_LifeCycleTest_on_0300 START-------------");
      TAG = "Crossplatform_LifeCycleTest_on_0300";

      let applicationContext: common.ApplicationContext = globalThis.abilityContext.getApplicationContext() as common.ApplicationContext;
      applicationContext.off("abilityLifecycle", 100, (error: BusinessError) => {
        expect(error.code).assertEqual(401);
        console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        done();
      });
    });

    /**
     * @tc.name   Crossplatform_LifeCycleTest_on_0400
     * @tc.number Crossplatform_LifeCycleTest_on_0400
     * @tc.desc   unregister callback twice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_LifeCycleTest_on_0400", Level.LEVEL0, async (done: Function) => {
      console.log("------------LifeCycleTest_on_0400 START-------------");
      TAG = "Crossplatform_LifeCycleTest_on_0400";

      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };

      // 第一次起MultiMainability1
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(1500);
      console.info(TAG + "list:" + globalThis.list1);

      globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error: BusinessError) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error: BusinessError) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
          expect(error.code).assertEqual(401);
          done();
        });
      });
    });

    /**
     * @tc.name   Crossplatform_LifeCycleTest_on_0500
     * @tc.number Crossplatform_LifeCycleTest_on_0500
     * @tc.desc   start other hap's ability in the same app, and register this lifecycle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_LifeCycleTest_on_0500", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_LifeCycleTest_on_0500 START-------------");
      TAG = "Crossplatform_LifeCycleTest_on_0500";
      console.info(TAG + "start");

      let str: Want = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility",
        moduleName: otherModuleName,
      };

      // 第一次起MainAbility
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await sleep(2000);
      console.info(TAG + "list:" + globalThis.featureList1);
      let listTemp = JSON.stringify(globalThis.featureList1)
      expect(listTemp.indexOf("FeatureMainAbility onWindowStageCreate") !== -1).assertTrue();
      expect(listTemp.indexOf("FeatureMainAbility onAbilityForeground") !== -1).assertTrue();

      globalThis.featureAbilityContext.terminateSelf();
      await sleep(1000);
      done();
    });

    /**
     * @tc.name   Crossplatform_Multi_LifeCycleTest_0100
     * @tc.number Crossplatform_Multi_LifeCycleTest_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Multi_LifeCycleTest_0100", Level.LEVEL0, async (done: Function) => {
      console.log("------------Crossplatform_Multi_LifeCycleTest_0100 START-------------");
      TAG = "Crossplatform_Multi_LifeCycleTest_0100";
      globalThis.abilityContext
        .startAbility({
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility1",
          moduleName: moduleName,
        }).then((data: ESObject) => {
        console.info(TAG + " start successful. Data: " + data);
      }).catch((error: BusinessError) => {
        console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
      });

      await sleep(1000);

      globalThis.abilityContext
        .startAbility({
          bundleName: otherBundle,
          abilityName: "MainAbility",
          moduleName: "entry",
        }).then((data: ESObject) => {
        console.info(TAG + " start successful. Data: " + data);
        done();
      }).catch((error: BusinessError) => {
        console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        expect().assertFail();
        done();
      });
    });
  });
}

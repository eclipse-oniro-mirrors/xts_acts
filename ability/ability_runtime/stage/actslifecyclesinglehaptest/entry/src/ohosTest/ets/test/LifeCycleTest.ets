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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium"
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import base from '@ohos.base';
import commonEvent from '@ohos.commonEventManager';
import ability from '@ohos.ability.ability';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import AbilityLifecycleCallback from '@ohos.app.ability.AbilityLifecycleCallback';

let deviceType = systemParameterEnhance.getSync('const.product.devicetype');
let subscriber: commonEvent.CommonEventSubscriber;

let TAG = "";
let tempCallbackId: ESObject;

function sleep(time: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time))
}


export default function lifecycleTest() {

  let event = [
    'MainAbility1_onForground',
    'MainAbility1_onDestroy',
    'MainAbility2_onForground',
    'MainAbility2_onAbilityDestroy',
    'MainAbility3_onForground',
    'MainAbility3_onAbilityDestroy',
    'MainAbility4_onForground',
    'MainAbility5_onForground',
    'MainAbility6_onForground',
    'MainAbility7_onForground',
    'MainAbility8_onForground',
    'MainAbility9_onForground',
    'MainAbility11_onForground',
    'MainAbility12_onForground',
    'MainAbility12_onDestroy',
    'Hap1MainAbility1_onForground',
    "Hap1MainAbility1_onDestroy",
    "Hap1MainAbility2_onDestroy",
    "Hap1MainAbility2_onAbilityDestroy",
  ];
  let callbackid_NA = 100;
  let callbackid_errorNum = -1;
  let callbackid_errorType = "test";

  describe('LifeCycleTest', () => {

    beforeEach(async (done: Function) => {
      console.info('LifeCycleTest before each called');
      await sleep(1000);
      done()
    });

    afterEach(async (done: Function) => {
      console.info('LifeCycleTest after each called');
      if ("Singlehap_LifeCycleTest_0200" === TAG || "Singlehap_LifeCycleTest_0300" === TAG
        || "Singlehap_LifeCycleTest_0500" === TAG || "Singlehap_LifeCycleTest_0600" === TAG
        || "Singlehap_LifeCycleTest_0800" === TAG || "Singlehap_LifeCycleTest_0900" === TAG) {
        let para: ability.AbilityResult = {
          resultCode: 2,
          want: {
            "abilityName": "MainAbility1",
            "bundleName": "com.example.lifecycle_xts"
          }
        }
        console.log("LifeCycleTest terminateSelfwithresult para: " + JSON.stringify(para));
        await globalThis.ability1context.terminateSelfWithResult(para)
          .then((data: ESObject) => {
            console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          }).catch((error: base.BusinessError) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      } else if ('Singlehap_LifeCycleTest_1300' === TAG || 'Singlehap_LifeCycleTest_1400' === TAG) {
        let para2: ability.AbilityResult = {
          resultCode: 2,
          want: {
            "abilityName": "MainAbility9",
            "bundleName": "com.example.lifecycle_xts"
          }
        }
        console.log("LifeCycleTest terminateSelfwithresult para: " + JSON.stringify(para2));
        await globalThis.ability9.terminateSelfWithResult(para2)
          .then((data: ESObject) => {
            console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          }).catch((error: base.BusinessError) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      } else if ("Singlehap_LifeCycleTest_2000" === TAG) {
        let para1: ability.AbilityResult = {
          resultCode: 2,
          want: {
            "abilityName": "MainAbility12",
            "bundleName": "com.example.lifecycle_xts"
          }
        }
        console.log("LifeCycleTest terminateSelfwithresult para: " + JSON.stringify(para1));
        await globalThis.ability12.terminateSelfWithResult(para1)
          .then((data: ESObject) => {
            console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          }).catch((error: base.BusinessError) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      }
      done();
    });


    /*
     * @tc.number  Singlehap_LifeCycleTest_0100
     * @tc.name    Register in abilitystage,listen to the lifecycle of abilityA,deregister after listening
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0100", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_0100 START-------------");
      TAG = "Singlehap_LifeCycleTest_0100";
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility2",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event === 'MainAbility2_onAbilityDestroy') {
            console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
            console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
            let listTemp = JSON.stringify(globalThis.list);
            console.log(TAG + " listTemp is :" + listTemp);
            tempCallbackId = globalThis.callbackid;
            console.log(TAG + " registerAbilityLifecycleCallback tempCallbackId : " + JSON.stringify(tempCallbackId));
            expect(listTemp.indexOf("MainAbility2 onAbilityCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityForeground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityBackground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityDestroy") !== -1).assertTrue();
            globalThis.applicationContext
              .unregisterAbilityLifecycleCallback(tempCallbackId, (error: base.BusinessError, data: ESObject) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
                expect(error.code).assertEqual(0);
                commonEvent.unsubscribe(subscriber, () => {
                  console.log(`${TAG} UnSubscribeCallback end`);
                  done();
                })
              });
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility2 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility2 failed. Cause: ' + JSON.stringify(error));
        })
    })

    /*
     * @tc.number  Singlehap_LifeCycleTest_0200
     * @tc.name    Register in abilityA,listen to the lifecycle of abilityB,deregister after listening
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0200", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_0200 START-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_0200";
      let count = 0;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      }
      let str1: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility2",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event === 'MainAbility1_onForground' && count === 0) {
            count++;
            await globalThis.abilityContext.startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + ' startMainAbility2 successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' startMainAbility2 failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'MainAbility2_onAbilityDestroy') {
            console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
            console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
            let listTemp = JSON.stringify(globalThis.list1);
            console.log(TAG + " listTemp is :" + listTemp);

            expect(listTemp.indexOf("MainAbility1 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.split("MainAbility1 onAbilityForeground").length - 1).assertEqual(2);
            expect(listTemp.indexOf("MainAbility1 onAbilityBackground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityForeground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityBackground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityDestroy") !== -1).assertTrue();

            globalThis.applicationContext1
              .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error: base.BusinessError, data: ESObject) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
                expect(error.code).assertEqual(0);
                commonEvent.unsubscribe(subscriber, () => {
                  console.log(`${TAG} UnSubscribeCallback end`);
                  done();
                })
              });
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility1 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility1 failed. Cause: ' + JSON.stringify(error));
        })
    });

    /*
    * @tc.number  Singlehap_LifeCycleTest_0300
    * @tc.name    Register in abilityA,listening the lifecycle of abilityB,deregister,repeat the unregister
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("Singlehap_LifeCycleTest_0300", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_0300 START-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_0300";
      let count = 0;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      }
      let str1: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility2",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event === 'MainAbility1_onForground' && count === 0) {
            count++;
            await globalThis.abilityContext.startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + ' startMainAbility2 successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' startMainAbility2 failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'MainAbility2_onAbilityDestroy' && count === 1) {
            console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
            console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
            count++;
            let listTemp = JSON.stringify(globalThis.list1);
            console.log(TAG + " listTemp is :" + listTemp);
            globalThis.applicationContext1
              .unregisterAbilityLifecycleCallback(globalThis.callbackid1)
              .then((data: ESObject) => {
                console.info(TAG + ' unregisterAbilityLifecycleCallback successful. Data: ' + data);
              })
              .catch((error: base.BusinessError) => {
                console.error(TAG + ' unregisterAbilityLifecycleCallback failed. Cause: ' + JSON.stringify(error));
              })
            console.log(TAG + " secondunregister callbackid : " + JSON.stringify(globalThis.callbackid1));
            expect(listTemp.indexOf("MainAbility1 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.split("MainAbility1 onAbilityForeground").length - 1).assertEqual(2);
            expect(listTemp.indexOf("MainAbility1 onAbilityBackground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityForeground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityBackground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityDestroy") !== -1).assertTrue();
            globalThis.applicationContext1
              .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error: base.BusinessError, data: ESObject) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback_1 success, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
                expect(error.code).assertEqual(1);
                commonEvent.unsubscribe(subscriber, () => {
                  console.log(`${TAG} UnSubscribeCallback end`);
                  done();
                })
              })
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility1 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility1 failed. Cause: ' + JSON.stringify(error));
        })
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0400
     * @tc.name    Register in abilityA,listening the lifecycle of abilityB,terminate abilityA,unregister
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0400", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_0400 START-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_0400";
      let count = 0;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility3",
      }
      let str1: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility2",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event === 'MainAbility3_onForground' && count === 0) {
            count++;
            await globalThis.abilityContext.startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + ' startMainAbility2 successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' startMainAbility2 failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'MainAbility2_onForground' && count === 1) {
            count++;
            let para: ability.AbilityResult = {
              resultCode: 1,
              want: {
                "abilityName": "MainAbility3",
                "bundleName": "com.example.lifecycle_xts"
              }
            }
            console.log(TAG + " terminateSelfwithresult para: " + JSON.stringify(para));
            globalThis.ability3.terminateSelfWithResult(para)
              .then((data: ESObject) => {
                console.log(TAG + " terminateSelfwithresult successful data: " + JSON.stringify(data));
              }).catch((error: base.BusinessError) => {
              console.log(TAG + " terminateSelfwithresult error: " + JSON.stringify(error));
            });
          } else if (data.event === 'MainAbility3_onAbilityDestroy' && count === 2) {
            console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list3));
            console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid3));
            count++;
            let listTemp = JSON.stringify(globalThis.list3);
            console.log(TAG + " listTemp is :" + listTemp);
            expect(listTemp.indexOf("MainAbility3 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.split("MainAbility3 onAbilityForeground").length - 1).assertEqual(2);
            expect(listTemp.indexOf("MainAbility3 onAbilityBackground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityForeground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityBackground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityDestroy") !== -1).assertTrue();
            globalThis.applicationContext3
              .unregisterAbilityLifecycleCallback(globalThis.callbackid3, (error: base.BusinessError, data: ESObject) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback3 success, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
                expect(error.code).assertEqual(0);
                commonEvent.unsubscribe(subscriber, () => {
                  console.log(`${TAG} UnSubscribeCallback end`);
                  done();
                })
              })
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility3 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility3 failed. Cause: ' + JSON.stringify(error));
        })
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0500
     * @tc.name    Register in abilityA and abilityB,unregister MainabilityB,then Register in ManinabilityC
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0500", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_0500 START-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_0500";
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      }
      let str1: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility3",
      }
      let str2: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility4",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event === 'MainAbility1_onForground') {
            await globalThis.abilityContext.startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + ' startMainAbility3 successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' startMainAbility3 failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'MainAbility3_onForground') {
            await globalThis.abilityContext.startAbility(str2)
              .then((data: ESObject) => {
                console.info(TAG + ' startMainAbility4 successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' startMainAbility4 failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'MainAbility4_onForground') {
            console.log(TAG + " listKey1 : " + JSON.stringify(globalThis.list1));
            console.log(TAG + " callbackid1 : " + JSON.stringify(globalThis.callbackid1));
            console.log(TAG + " listKey3 : " + JSON.stringify(globalThis.list3));
            console.log(TAG + " callbackid3 : " + JSON.stringify(globalThis.callbackid3));
            let id3 = globalThis.callbackid3;
            console.log(TAG + " listKey4 : " + JSON.stringify(globalThis.list4));
            console.log(TAG + " callbackid4 : " + JSON.stringify(globalThis.callbackid4));
            let id4 = globalThis.callbackid4;
            expect(id3 + 1).assertEqual(id4);
            globalThis.applicationContext4
              .unregisterAbilityLifecycleCallback(globalThis.callbackid4, (error: base.BusinessError, data: ESObject) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback4 success, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
              })
            globalThis.applicationContext1
              .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error: base.BusinessError, data: ESObject) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback1 success, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
                console.log("------------Singlehap_LifeCycleTest_0500 END-------------");
              })
            if (globalThis.ability3) {
              globalThis.ability3.terminateSelf();
            }
            globalThis.applicationContext3
              .unregisterAbilityLifecycleCallback(globalThis.callbackid3, (error: base.BusinessError, data: ESObject) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback3 success, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
                expect(error.code).assertEqual(0);
                commonEvent.unsubscribe(subscriber, () => {
                  console.log(`${TAG} UnSubscribeCallback end`);
                  done();
                })
              })
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility1 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility1 failed. Cause: ' + JSON.stringify(error));
        })
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0600
     * @tc.name    Register in abilityA,start abilityB、abilityC,terminate abilityB 、abilityC
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0600", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_0600 START-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_0600";
      let count = 0;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      }
      let str1: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility5",
      }
      let str2: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility2",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event === 'MainAbility1_onForground' && count === 0) {
            count++;
            await globalThis.abilityContext.startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + ' startMainAbility5 successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' startMainAbility5 failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'MainAbility5_onForground' && count === 1) {
            count++;
            await globalThis.abilityContext.startAbility(str2)
              .then((data: ESObject) => {
                console.info(TAG + ' startMainAbility2 successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' startMainAbility2 failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'MainAbility2_onAbilityDestroy' && count === 2) {
            console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
            console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
            count++;
            let listTemp = JSON.stringify(globalThis.list1);
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
            globalThis.applicationContext1
              .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error: base.BusinessError, data: ESObject) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
                commonEvent.unsubscribe(subscriber, () => {
                  console.log(`${TAG} UnSubscribeCallback end`);
                  done();
                })
              })
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility1 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility1 failed. Cause: ' + JSON.stringify(error));
        })
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0700
     * @tc.name    Multiple registration/unregistration
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0700", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_0700 START-------------");
      TAG = "Singlehap_LifeCycleTest_0700";
      let id1 = -1;
      let id2 = -1;
      let id3 = -1;
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
          console.log(abilityname + " onWindowStageActive")
        },
        onWindowStageInactive(ability, windowStage) {
          let abilityname = ability.context.abilityInfo.name;
          console.log(abilityname + " onWindowStageInactive")
        },
        onWindowStageDestroy(ability, windowStage) {
          console.log(TAG + " AbilityLifecycleCallback1 onWindowStageDestroy ability:"
            + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onWindowStageDestroy abilityname:"
            + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onWindowStageDestroy");
          listKey8.push(abilityname + " onWindowStageDestroy");
        },
        onAbilityDestroy(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityDestroy ability:"
            + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityDestroy abilityname:"
            + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityDestroy");
          listKey8.push(abilityname + " onAbilityDestroy");
        },
        onAbilityForeground(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityForeground ability:"
            + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityForeground abilityname:"
            + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityForeground");
          listKey8.push(abilityname + " onAbilityForeground");
        },
        onAbilityBackground(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityBackground ability:"
            + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityBackground abilityname:"
            + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityBackground");
          listKey8.push(abilityname + " onAbilityBackground");
        },
        onAbilityContinue(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityContinue ability:"
            + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityContinue abilityname:"
            + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityContinue");
          listKey8.push(abilityname + " onAbilityContinue");
        }
      }
      let applicationContext = globalThis.abilityContext.getApplicationContext();
      id1 = applicationContext.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
      console.log(TAG + " registerAbilityLifecycleCallback1 number: " + JSON.stringify(id1));
      applicationContext.unregisterAbilityLifecycleCallback(id1, (error: base.BusinessError, data: ESObject) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback1 success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
        expect(error.code).assertEqual(0);
        id2 = applicationContext.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log(TAG + " registerAbilityLifecycleCallback2 number: " + JSON.stringify(id2));
        applicationContext.unregisterAbilityLifecycleCallback(id2, (error: base.BusinessError, data: ESObject) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback2 success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          expect(error.code).assertEqual(0);
          id3 = applicationContext.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
          console.log(TAG + " registerAbilityLifecycleCallback3 number: " + JSON.stringify(id3));
          applicationContext.unregisterAbilityLifecycleCallback(id3, (error: base.BusinessError, data: ESObject) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback3 success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
            expect(error.code).assertEqual(0);
            expect(id1 > 0).assertTrue();
            expect(id2).assertEqual(id1 + 1);
            expect(id3).assertEqual(id2 + 1);
            done();
          })
        })
      })
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0800
     * @tc.name    Maninability1 Register listening, Repeat starting and termination Ability2
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0800", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_0800 START-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_0800";
      let count = 0;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      };
      let str1: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility2",
      };
      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event == 'MainAbility1_onForground') {
            count++;
            if (count < 4) {
              await globalThis.abilityContext.startAbility(str1)
                .then((data: ESObject) => {
                  console.info(TAG + ' startMainAbility2 successful. Data: ' + data);
                }).catch((error: base.BusinessError) => {
                  console.error(TAG + ' startMainAbility2 failed. Cause: ' + JSON.stringify(error));
                })
            } else {
              console.info(TAG + ' count++ is: ' + count);
              console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
              console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
              let listTemp = JSON.stringify(globalThis.list1);
              console.log(TAG + " listTemp is :" + listTemp);
              try {
                expect(listTemp.indexOf("MainAbility1 onWindowStageCreate") !== -1).assertTrue();
                expect(listTemp.split("MainAbility1 onAbilityForeground").length - 1).assertLarger(1);
                expect(listTemp.split("MainAbility1 onAbilityBackground").length - 1).assertEqual(3);
                expect(listTemp.split("MainAbility2 onAbilityCreate").length - 1).assertEqual(3);
                expect(listTemp.split("MainAbility2 onWindowStageCreate").length - 1).assertEqual(3);
                expect(listTemp.split("MainAbility2 onAbilityForeground").length - 1).assertEqual(3);
                expect(listTemp.split("MainAbility2 onAbilityBackground").length - 1).assertLarger(1);
                expect(listTemp.split("MainAbility2 onWindowStageDestroy").length - 1).assertLarger(1);
                expect(listTemp.split("MainAbility2 onAbilityDestroy").length - 1).assertLarger(1);
              } catch (error) {
                console.error(`${TAG} startRunning failed: ${JSON.stringify(error)}`);
                done();
              }
              globalThis.applicationContext1
                .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error: base.BusinessError, data: ESObject) => {
                  console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                    ",data: " + JSON.stringify(data));
                  commonEvent.unsubscribe(subscriber, () => {
                    console.log(`${TAG} UnSubscribeCallback end`);
                    done();
                  })
                });
            }
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility1 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility1 failed. Cause: ' + JSON.stringify(error));
        })
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0900
     * @tc.name    Repeat switching Ability1 between front and back
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0900", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_0900 START-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_0900";
      let count = 0;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      }
      let str1: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility2",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event == 'MainAbility1_onForground') {
            count++;
            if (count < 3) {
              await globalThis.abilityContext.startAbility(str1)
                .then((data: ESObject) => {
                  console.info(TAG + ' startMainAbility2 successful. Data: ' + data);
                }).catch((error: base.BusinessError) => {
                  console.error(TAG + ' startMainAbility2 failed. Cause: ' + JSON.stringify(error));
                })
            } else {
              console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
              console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
              let listTemp = JSON.stringify(globalThis.list1);
              console.log(TAG + " listTemp is :" + listTemp);

              expect(listTemp.indexOf("MainAbility1 onWindowStageCreate") !== -1).assertTrue();
              expect(listTemp.split("MainAbility1 onAbilityForeground").length - 1).assertEqual(3);
              expect(listTemp.split("MainAbility1 onAbilityBackground").length - 1).assertEqual(2);
              expect(listTemp.split("MainAbility2 onAbilityCreate").length - 1).assertEqual(2);
              expect(listTemp.split("MainAbility2 onWindowStageCreate").length - 1).assertEqual(2);
              expect(listTemp.split("MainAbility2 onAbilityForeground").length - 1).assertEqual(2);
              expect(listTemp.split("MainAbility2 onAbilityBackground").length - 1).assertEqual(2);
              expect(listTemp.split("MainAbility2 onWindowStageDestroy").length - 1).assertEqual(2);
              expect(listTemp.split("MainAbility2 onAbilityDestroy").length - 1).assertEqual(2);
              globalThis.applicationContext1
                .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error: base.BusinessError, data: ESObject) => {
                  console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                    ",data: " + JSON.stringify(data));
                  commonEvent.unsubscribe(subscriber, () => {
                    console.log(`${TAG} UnSubscribeCallback end`);
                    done();
                  })
                });
            }
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility1 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility1 failed. Cause: ' + JSON.stringify(error));
        })
    })

    /*
     * @tc.number  Singlehap_LifeCycleTest_1000
     * @tc.name    Register listening in abilityA foreground,repeat the registration
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_1000", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_1000 START-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_1000";
      let id1 = -1;
      let id2 = -1;
      let count = 0;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility6",
      }
      let str1: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility2",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event == 'MainAbility6_onForground') {
            count++;
            if (count < 2) {
              console.log(TAG + " firstCallback listKey : " + JSON.stringify(globalThis.list6));
              console.log(TAG + " firstCallback callbackid : " + JSON.stringify(globalThis.callbackid6));
              id1 = globalThis.callbackid6;
              console.log(TAG + " firstCallback id : " + JSON.stringify(id1));
              globalThis.abilityContext.startAbility(str1)
                .then((data: ESObject) => {
                  console.info(TAG + ' startMainAbility2 successful. Data: ' + data);
                }).catch((error: base.BusinessError) => {
                console.error(TAG + ' startMainAbility2 failed. Cause: ' + JSON.stringify(error));
              })
            } else {
              console.log(TAG + " secondCallback listKey : " + JSON.stringify(globalThis.list6));
              console.log(TAG + " secondCallback callbackid : " + JSON.stringify(globalThis.callbackid6));
              id2 = globalThis.callbackid6;
              console.log(TAG + " secondCallback id : " + JSON.stringify(id2));
              expect(id1 + 1).assertEqual(id2);
              if (globalThis.ability6) {
                globalThis.ability6.terminateSelf();
              }
              globalThis.applicationContext6
                .unregisterAbilityLifecycleCallback(globalThis.callbackid6, (error: base.BusinessError, data: ESObject) => {
                  console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                    ",data: " + JSON.stringify(data));
                  commonEvent.unsubscribe(subscriber, () => {
                    console.log(`${TAG} UnSubscribeCallback end`);
                    done();
                  })
                });
            }
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility6 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility6 failed. Cause: ' + JSON.stringify(error));
        })
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_1100
     * @tc.name    Register listening in abilityA foreground,repeat the registration (singleton)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_1100", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_1100 START-------------");
      TAG = "Singlehap_LifeCycleTest_1100";
      let id1 = -1;
      let id2 = -1;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility7",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          console.log(TAG + " firstCallback listKey : " + JSON.stringify(globalThis.list7));
          console.log(TAG + " firstCallback callbackid : " + JSON.stringify(globalThis.callbackid7));
          console.log(TAG + " secondCallback callbackid : " + JSON.stringify(globalThis.callbackid7_1));
          id1 = globalThis.callbackid7;
          id2 = globalThis.callbackid7_1;
          expect(id1 + 1).assertEqual(id2);
          globalThis.applicationContext7
            .unregisterAbilityLifecycleCallback(globalThis.callbackid7, (error: base.BusinessError, data: ESObject) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                ",data: " + JSON.stringify(data));
            });
          let para: ability.AbilityResult = {
            resultCode: 1,
            want: {
              "abilityName": "MainAbility7",
              "bundleName": "com.example.lifecycle_xts"
            }
          }
          console.log(TAG + " terminateSelfwithresult para: " + JSON.stringify(para));
          globalThis.ability7.terminateSelfWithResult(para, (error: base.BusinessError, data: ESObject) => {
            console.log(TAG + " terminateSelfwithresult success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
            commonEvent.unsubscribe(subscriber, () => {
              console.log(`${TAG} UnSubscribeCallback end`);
              done();
            })
          });
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility7 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility7 failed. Cause: ' + JSON.stringify(error));
        })
    });
    /*
     * @tc.number  Singlehap_LifeCycleTest_1200
     * @tc.name    Register listening in abilityA foreground,repeat the registration (standard)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_1200", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_1200 START-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_1200";
      let id1 = -1;
      let id2 = -1;
      let count = 0;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility8",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event === 'MainAbility8_onForground' && count === 0) {
            console.log(TAG + " firstCallback listKey : " + JSON.stringify(globalThis.list8));
            console.log(TAG + " firstCallback callbackid : " + JSON.stringify(globalThis.callbackid8));
            count++;
            id1 = globalThis.callbackid8;
            console.log(TAG + " firstCallback id : " + JSON.stringify(id1));
            await globalThis.abilityContext.startAbility(str)
              .then((data: ESObject) => {
                console.info(TAG + ' startMainAbility8 successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' startMainAbility8 failed. Cause: ' + JSON.stringify(error));
              })
          } else {
            console.log(TAG + " secondCallback listKey : " + JSON.stringify(globalThis.list8));
            console.log(TAG + " secondCallback callbackid : " + JSON.stringify(globalThis.callbackid8));
            id2 = globalThis.callbackid8;
            console.log(TAG + " secondCallback id : " + JSON.stringify(id2));
            expect(id1 + 1).assertEqual(id2);
            done();
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility8 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility8 failed. Cause: ' + JSON.stringify(error));
        })
    });

    /*
    * @tc.number  Singlehap_LifeCycleTest_1300
    * @tc.name    The ability of HAP A listens to the ability lifecycle callback of HAP B (singleton)
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("Singlehap_LifeCycleTest_1300", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_1300 start-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_1300";
      let count = 0;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility9",
      }
      let str1: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "Hap1MainAbility1",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event === 'MainAbility9_onForground' && count === 0) {
            count++;
            await globalThis.abilityContext.startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + ' Hap1MainAbility1 first successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' Hap1MainAbility1 first failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'Hap1MainAbility1_onDestroy' && count === 1) {
            count++;
            await globalThis.abilityContext.startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + ' Hap1MainAbility1 second successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' Hap1MainAbility1 second failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'Hap1MainAbility1_onForground' && count === 2) {
            count++;
            let listTemp = JSON.stringify(globalThis.mainAbility9ListKey);
            console.log(TAG + "listTemp is :" + listTemp);
            console.log(TAG + "globalThis.mainAbility9CallBackId is :" + globalThis.mainAbility9CallBackId);
            expect(listTemp.indexOf("Hap1MainAbility1 onAbilityCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap1MainAbility1 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap1MainAbility1 onAbilityForeground") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap1MainAbility1 onAbilityBackground") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap1MainAbility1 onWindowStageDestroy") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap1MainAbility1 onAbilityDestroy") !== -1).assertTrue();
            globalThis.applicationContext9
              .unregisterAbilityLifecycleCallback(globalThis.mainAbility9CallBackId, (error: base.BusinessError, data: ESObject) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
                commonEvent.unsubscribe(subscriber, () => {
                  console.log(`${TAG} UnSubscribeCallback end`);
                  done();
                })
              });
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility9 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility9 failed. Cause: ' + JSON.stringify(error));
        })
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_1400
     * @tc.name    The ability of HAP A listens to the ability lifecycle callback of HAP B (standard)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_1400", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_1400 start-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_1400";
      let count = 0;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility9",
      }
      let str1: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "Hap1MainAbility2",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event === 'MainAbility9_onForground' && count === 0) {
            count++;
            await globalThis.abilityContext.startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + ' Hap1MainAbility2 first successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' Hap1MainAbility2 first failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'Hap1MainAbility2_onDestroy' && count === 1) {
            count++;
            await globalThis.abilityContext.startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + ' Hap1MainAbility2 second successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' Hap1MainAbility2 second failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'Hap1MainAbility2_onAbilityDestroy' && count === 2) {
            count++;
            let listTemp = JSON.stringify(globalThis.mainAbility9ListKey);
            console.log(TAG + "listTemp is :" + listTemp);
            console.log(TAG + "globalThis.mainAbility9CallBackId is :" + globalThis.mainAbility9CallBackId);
            expect(listTemp.split("Hap1MainAbility2 onAbilityCreate").length - 1).assertEqual(2);
            expect(listTemp.split("Hap1MainAbility2 onWindowStageCreate").length - 1).assertEqual(2);
            expect(listTemp.split("Hap1MainAbility2 onAbilityForeground").length - 1).assertEqual(2);
            expect(listTemp.split("Hap1MainAbility2 onAbilityBackground").length - 1).assertEqual(2);
            expect(listTemp.split("Hap1MainAbility2 onWindowStageDestroy").length - 1).assertEqual(2);
            expect(listTemp.split("Hap1MainAbility2 onAbilityDestroy").length - 1).assertEqual(2);
            globalThis.applicationContext9
              .unregisterAbilityLifecycleCallback(globalThis.mainAbility9CallBackId, (error: base.BusinessError, data: ESObject) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
                commonEvent.unsubscribe(subscriber, () => {
                  console.log(`${TAG} UnSubscribeCallback end`);
                  done();
                })
              });
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility9 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility9 failed. Cause: ' + JSON.stringify(error));
        })
    });
    /*
     * @tc.number  Singlehap_LifeCycleTest_1500
     * @tc.name    Register in abilityA , starting and termination AbilityB,Repeat previous steps (standard)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_1500", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_1500 START-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_1500";
      let id1 = -1;
      let id2 = -1;
      let count = 0;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility11",
      }
      let str1: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility2",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          console.info(TAG + ' count. is: ' + JSON.stringify(count));
          if (data.event === 'MainAbility11_onForground' && count === 0) {
            count++;
            await globalThis.abilityContext.startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + ' startMainAbility2 successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' startMainAbility2 failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'MainAbility2_onForground' && count === 1) {
            console.log(TAG + " firstCallback listKey : " + JSON.stringify(globalThis.list11));
            console.log(TAG + " firstCallback callbackid : " + JSON.stringify(globalThis.callbackid11));
            id1 = globalThis.callbackid11;
            console.log(TAG + " firstCallback id : " + JSON.stringify(id1));
            count++;
            await globalThis.abilityContext.startAbility(str)
              .then((data: ESObject) => {
                console.info(TAG + ' startMainAbility11 successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' startMainAbility11 failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'MainAbility11_onForground' && count === 2) {
            count++;
            await globalThis.abilityContext.startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + ' startMainAbility2 successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' startMainAbility2 failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'MainAbility2_onAbilityDestroy' && count === 3) {
            console.log(TAG + " secondCallback listKey : " + JSON.stringify(globalThis.list11));
            console.log(TAG + " secondCallback callbackid : " + JSON.stringify(globalThis.callbackid11));
            id2 = globalThis.callbackid11;
            console.log(TAG + " secondCallback id : " + JSON.stringify(id2));
            let listTemp = JSON.stringify(globalThis.list11);
            console.log(TAG + " listTemp is :" + listTemp);
            expect(listTemp.indexOf("MainAbility2 onAbilityCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityForeground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityBackground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityDestroy") !== -1).assertTrue();
            expect(id1 + 1).assertEqual(id2);
            globalThis.applicationContext11
              .unregisterAbilityLifecycleCallback(globalThis.callbackid11, (error: base.BusinessError, data: ESObject) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
                commonEvent.unsubscribe(subscriber, () => {
                  console.log(`${TAG} UnSubscribeCallback end`);
                  done();
                })
              });
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility11 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility11 failed. Cause: ' + JSON.stringify(error));
        })
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_1600
     * @tc.name    input Nonexistent callbackid for unregisterAbilityLifecycleCallback parameter
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("Singlehap_LifeCycleTest_1600", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_1600 START-------------");
      TAG = "Singlehap_LifeCycleTest_1600";
      let code = -1;
      globalThis.abilityContext.getApplicationContext()
        .unregisterAbilityLifecycleCallback(callbackid_NA, (error: base.BusinessError, data: ESObject) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          code = error.code;
          sleep(1000);
          expect(code).assertEqual(1);
          done();
        });
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_1700
     * @tc.name    input error callbackid for unregisterAbilityLifecycleCallback parameter
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("Singlehap_LifeCycleTest_1700", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_1700 START-------------");
      TAG = "Singlehap_LifeCycleTest_1700";
      let code = -1;
      globalThis.abilityContext.getApplicationContext()
        .unregisterAbilityLifecycleCallback(callbackid_errorNum, (error: base.BusinessError, data: ESObject) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          code = error.code;
          sleep(1000);
          expect(code).assertEqual(1);
          done();
        });
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_1800
     * @tc.name    input error type callbackid for unregisterAbilityLifecycleCallback parameter
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("Singlehap_LifeCycleTest_1800", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_1800 START-------------");
      TAG = "Singlehap_LifeCycleTest_1800";
      let code = -1;
      globalThis.abilityContext.getApplicationContext()
        .unregisterAbilityLifecycleCallback(callbackid_errorType, (error: base.BusinessError, data: ESObject) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          code = error.code;
          sleep(1000);
          expect(code).assertEqual(1);
          done();
        });
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_1900
     * @tc.name    input null callbackid for unregisterAbilityLifecycleCallback parameter
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("Singlehap_LifeCycleTest_1900", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_1900 START-------------");
      TAG = "Singlehap_LifeCycleTest_1900";
      let code = -1;
      globalThis.abilityContext.getApplicationContext()
        .unregisterAbilityLifecycleCallback(null, (error: base.BusinessError, data: ESObject) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          code = error.code;
          sleep(1000);
          expect(code).assertEqual(1);
          done();
        });
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_2000
     * @tc.name    Register in abilityA, starting and termination AbilityB, terminate abilityA, Re-register in abilityA
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_2000", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_2000 START-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_2000";
      let id1 = -1;
      let id2 = -1;
      let count = 0;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility12",
      }
      let str1: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility2",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event === 'MainAbility12_onForground') {
            count++;
            if (count === 1 || count === 3) {
              await globalThis.abilityContext.startAbility(str1)
                .then((data: ESObject) => {
                  console.info(TAG + ' startMainAbility2 successful. Data: ' + data);
                }).catch((error: base.BusinessError) => {
                  console.error(TAG + ' startMainAbility2 failed. Cause: ' + JSON.stringify(error));
                })
            } else if (count === 2) {
              console.log(TAG + " firstCallback listKey : " + JSON.stringify(globalThis.list12));
              console.log(TAG + " firstCallback callbackid : " + JSON.stringify(globalThis.callbackid12));
              id1 = globalThis.callbackid12;
              console.log(TAG + " firstCallback id : " + JSON.stringify(id1));
              globalThis.ability12.terminateSelf(str)
                .then((data: ESObject) => {
                  console.log(TAG + " terminateSelfwithresult successful data: " + JSON.stringify(data));
                }).catch((error: base.BusinessError) => {
                console.log(TAG + " terminateSelfwithresult error: " + JSON.stringify(error));
              });
            } else {
              console.log(TAG + " secondCallback listKey : " + JSON.stringify(globalThis.list12));
              console.log(TAG + " secondCallback callbackid : " + JSON.stringify(globalThis.callbackid12));
              id2 = globalThis.callbackid12;
              console.log(TAG + " secondCallback id : " + JSON.stringify(id2));
              let listTemp = JSON.stringify(globalThis.list12);
              console.log(TAG + " listTemp is :" + listTemp);
              expect(listTemp.indexOf("MainAbility2 onAbilityCreate") !== -1).assertTrue();
              expect(listTemp.indexOf("MainAbility2 onWindowStageCreate") !== -1).assertTrue();
              expect(listTemp.indexOf("MainAbility2 onAbilityForeground") !== -1).assertTrue();
              expect(listTemp.indexOf("MainAbility2 onAbilityBackground") !== -1).assertTrue();
              expect(listTemp.indexOf("MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
              expect(listTemp.indexOf("MainAbility2 onAbilityDestroy") !== -1).assertTrue();
              expect(id1 + 1).assertEqual(id2);
              globalThis.applicationContext12
                .unregisterAbilityLifecycleCallback(id2, (error: base.BusinessError, data: ESObject) => {
                  console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                    ",data: " + JSON.stringify(data));
                  commonEvent.unsubscribe(subscriber, () => {
                    console.log(`${TAG} UnSubscribeCallback end`);
                    done();
                  })
                });
            }
          }
          if (data.event === 'MainAbility12_onDestroy') {
            globalThis.abilityContext.startAbility(str)
              .then((data: ESObject) => {
                console.info(TAG + ' startMainAbility12 successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
              console.error(TAG + ' startMainAbility12 failed. Cause: ' + JSON.stringify(error));
            })
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' startMainAbility12 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' startMainAbility12 failed. Cause: ' + JSON.stringify(error));
        })
    });

    /*
    * @tc.number  Singlehap_LifeCycleTest_2100
    * @tc.name    Register in abilityA,register in abilityB, starting and termination abilityC,
                  termination abilityB、abilityA, Re-register in abilityA、abilityB
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("Singlehap_LifeCycleTest_2100", 0, async (done: Function) => {
      console.log("------------Singlehap_LifeCycleTest_2100 START-------------");
      if (deviceType === '2in1') {
        done();
        return;
      }
      TAG = "Singlehap_LifeCycleTest_2100";
      let id1 = -1;
      let str: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      }
      let str1: Want = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility2",
      }

      await commonEvent.createSubscriber({
        events: event
      }).then((data: ESObject) => {
        subscriber = data;
        commonEvent.subscribe(data, async (err, data) => {
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          console.info(TAG + ' subscribeCallBack. err: ' + JSON.stringify(err));
          if (data.event === 'MainAbility1_onForground') {
            await globalThis.abilityContext.startAbility(str1)
              .then((data: ESObject) => {
                console.info(TAG + ' MainAbility2 successful. Data: ' + data);
              }).catch((error: base.BusinessError) => {
                console.error(TAG + ' MainAbility1 failed. Cause: ' + JSON.stringify(error));
              })
          } else if (data.event === 'MainAbility2_onForground') {
            console.log(TAG + " firstCallback listKey1 : " + JSON.stringify(globalThis.list1));
            console.log(TAG + " firstCallback callbackid1 : " + JSON.stringify(globalThis.callbackid1));
            id1 = globalThis.callbackid1;
            console.log(TAG + " firstCallback id1 : " + JSON.stringify(id1));
            let para: ability.AbilityResult = {
              resultCode: 2100,
              want: {
                "abilityName": "MainAbility1",
                "bundleName": "com.example.lifecycle_xts"
              }
            }
            console.log(TAG + " terminateSelfwithresult para: " + JSON.stringify(para));
            globalThis.ability1context.terminateSelfWithResult(para)
              .then((data: ESObject) => {
                console.log(TAG + " terminateSelfwithresult successful data: " + JSON.stringify(data));
              }).catch((error: base.BusinessError) => {
              console.log(TAG + " terminateSelfwithresult error: " + JSON.stringify(error));
            });
          } else if (data.event === 'MainAbility1_onDestroy') {
            console.log(TAG + " secondCallback callbackid1 : " + JSON.stringify(globalThis.callbackid1));
            let listTemp = JSON.stringify(globalThis.list1);
            console.log(TAG + " listTemp is :" + listTemp);
            expect(listTemp.indexOf("MainAbility2 onAbilityCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityForeground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityBackground") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
            expect(listTemp.indexOf("MainAbility2 onAbilityDestroy") !== -1).assertTrue();
            globalThis.applicationContext1
              .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error: base.BusinessError, data: ESObject) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
                console.log("------------Singlehap_LifeCycleTest_2100 END-------------");
                commonEvent.unsubscribe(subscriber, () => {
                  console.log(`${TAG} UnSubscribeCallback end`);
                  done();
                })
              });
          }
        })
      })

      await globalThis.abilityContext.startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + ' MainAbility1 successful. Data: ' + data);
        }).catch((error: base.BusinessError) => {
          console.error(TAG + ' MainAbility1 failed. Cause: ' + JSON.stringify(error));
        })
    });
  })
}
// @ts-nocheck
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
export default function abilityTest() {

  describe('AbilityTest', function () {

    console.info("-----------------LifecycleTest is start----------------")
    beforeEach(async function (done) {
      console.info('LifeCycleTest before each called');
      await sleep(1000);
      done()
    });

    afterEach(async function (done) {
      console.info('LifeCycleTest after each called');
      if ("Multihap_WindowStageLifecycleTest_007" != TAG || "Multihap_WindowStageLifecycleTest_010" != TAG
        || "Multihap_WindowStageLifecycleTest_006" != TAG) {
        var para = {
          resultCode: 2,
          want: {
            "abilityName": "MainAbility4",
            bundleName: "com.example.lifecycletest"
          }
        }
        console.log("LifeCycleTest terminateSelfwithresult para: " + JSON.stringify(para));
        await globalThis.ability4context.terminateSelfWithResult(para)
          .then((data) => {
            console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          }).catch((error) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      }
      done();
    });

    var TAG;
    var listKeyTemp = [];
    var listKeyTemp1 = [];


    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time))
    }

    /*
     * @tc.number  Multihap_WindowStageLifecycleTest_001
     * @tc.name    The ability of HAP A listens to the ability lifecycle callback of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_WindowStageLifecycleTest_001", 0, async function (done) {
      console.info("---------------Multihap_WindowStageLifecycleTest_001 is start---------------")
      TAG = "Multihap_WindowStageLifecycleTest_001";
      listKeyTemp = [];
      var transferStr0 = "";

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(1000);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility3"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": Hap2MainAbility3 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for (var i = 0;i < globalThis.mainAbility4ListKey.length; i++) {
            if (globalThis.mainAbility4ListKey[i].substring(0, 16) == "Hap2MainAbility3") {
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
              transferStr0 += globalThis.mainAbility4ListKey[i];
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(transferStr0.indexOf("Hap2MainAbility3 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility3 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility3 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility3 onWindowStageDestroy")!=-1).assertTrue();
          console.info(TAG + "globalThis.ApplicationContext4 is :" + JSON.stringify(globalThis.ApplicationContext4));
          globalThis.ApplicationContext4
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);
              done();
            });
        }, 4000)
      });
      console.info("---------------Multihap_WindowStageLifecycleTest_001 is end---------------")
    });

    /*
     * @tc.number  Multihap_WindowStageLifecycleTest_002
     * @tc.name    The ability of HAP A listens to the ability lifecycle callback of HAP B (single instance)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_WindowStageLifecycleTest_002", 0, async function (done) {
      console.log("------------Multihap_WindowStageLifecycleTest_002 start-------------");
      TAG = "Multihap_WindowStageLifecycleTest_002";
      listKeyTemp = [];
      var transferStr0 = "";

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(1000);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility4"
      }, (error, data) => {
        console.log(TAG + ":first Hap2MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(1000);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility4"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap2MainAbility4 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for (var i = 0; i < globalThis.mainAbility4ListKey.length; i++) {
            if (globalThis.mainAbility4ListKey[i].substring(0, 16) == "Hap2MainAbility4") {
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
              transferStr0 += globalThis.mainAbility4ListKey[i];
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(transferStr0.indexOf("Hap2MainAbility4 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility4 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility4 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility4 onWindowStageDestroy")!=-1).assertTrue();
          globalThis.ApplicationContext4
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);
              done();
            });
        }, 4000)
      });
      console.log("------------Multihap_WindowStageLifecycleTest_002 end-------------");
    });

    /*
     * @tc.number  Multihap_WindowStageLifecycleTest_003
     * @tc.name    The ability of HAP A listens to the ability lifecycle callback of HAP B (multiple cases)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_WindowStageLifecycleTest_003", 0, async function (done) {
      console.log("------------Multihap_WindowStageLifecycleTest_003 start-------------");
      TAG = "Multihap_WindowStageLifecycleTest_003";
      listKeyTemp = [];
      var transferStr0 = "";

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(1000);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility5"
      }, (error, data) => {
        console.log(TAG + ":first Hap2MainAbility5 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(1000);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility5"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap2MainAbility5 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for (var i = 0;i < globalThis.mainAbility4ListKey.length; i++) {
            if (globalThis.mainAbility4ListKey[i].substring(0, 16) == "Hap2MainAbility5") {
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
              transferStr0 += globalThis.mainAbility4ListKey[i];
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(transferStr0.indexOf("Hap2MainAbility5 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility5 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility5 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility5 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility5 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility5 onWindowStageDestroy")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility5 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility5 onWindowStageDestroy")!=-1).assertTrue();
          globalThis.ApplicationContext4
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);
              done();
            });
        }, 4000)
      });
      console.log("------------Multihap_WindowStageLifecycleTest_003 end-------------");
    });

    /*
     * @tc.number  Multihap_WindowStageLifecycleTest_004
     * @tc.name    The ability of HAP A monitors the ability life cycle callback of HAP B and HAP C
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_WindowStageLifecycleTest_004", 0, async function (done) {
      console.log("------------Multihap_WindowStageLifecycleTest_004 start-------------");
      TAG = "Multihap_WindowStageLifecycleTest_004";
      listKeyTemp = [];
      listKeyTemp1 = [];
      var transferStr0 = "";
      var transferStr1 = "";

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(1000);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility6"
      }, (error, data) => {
        console.log(TAG + ":first Hap2MainAbility6 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(1000);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap3MainAbility2"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap3MainAbility2 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for (var i = 0;i < globalThis.mainAbility4ListKey.length; i++) {
            if (globalThis.mainAbility4ListKey[i].substring(0, 16) == "Hap2MainAbility6") {
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
              transferStr0 += globalThis.mainAbility4ListKey[i];
            } else if (globalThis.mainAbility4ListKey[i].substring(0, 16) == "Hap3MainAbility2") {
              listKeyTemp1.push(globalThis.mainAbility4ListKey[i]);
              transferStr1 += globalThis.mainAbility4ListKey[i];
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "listKeyTemp1 is :" + listKeyTemp1);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(transferStr0.indexOf("Hap2MainAbility6 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility6 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility6 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility6 onWindowStageDestroy")!=-1).assertTrue();

          expect(transferStr1.indexOf("Hap3MainAbility2 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr1.indexOf("Hap3MainAbility2 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr1.indexOf("Hap3MainAbility2 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr1.indexOf("Hap3MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
          globalThis.ApplicationContext4
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);
              done();
            });
        }, 4000)
      });
      console.log("------------Multihap_WindowStageLifecycleTest_004 end-------------");
    });

    /*
     * @tc.number  Multihap_WindowStageLifecycleTest_005
     * @tc.name    The ability of HAP A listens to two ability life cycle callbacks in HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_WindowStageLifecycleTest_005", 0, async function (done) {
      console.log("------------Multihap_WindowStageLifecycleTest_005 start-------------");
      TAG = "Multihap_WindowStageLifecycleTest_005";
      listKeyTemp = [];
      listKeyTemp1 = [];
      var transferStr0 = "";
      var transferStr1 = "";

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility6"
      }, (error, data) => {
        console.log(TAG + ":first Hap2MainAbility6 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility7"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap2MainAbility7 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for (var i = 0;i < globalThis.mainAbility4ListKey.length; i++) {
            if (globalThis.mainAbility4ListKey[i].substring(0, 16) == "Hap2MainAbility6") {
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
              transferStr0 += globalThis.mainAbility4ListKey[i];
            } else if (globalThis.mainAbility4ListKey[i].substring(0, 16) == "Hap2MainAbility7") {
              listKeyTemp1.push(globalThis.mainAbility4ListKey[i]);
              transferStr1 += globalThis.mainAbility4ListKey[i];
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "listKeyTemp1 is :" + listKeyTemp1);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(transferStr0.indexOf("Hap2MainAbility6 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility6 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility6 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility6 onWindowStageDestroy")!=-1).assertTrue();

          expect(transferStr1.indexOf("Hap2MainAbility7 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr1.indexOf("Hap2MainAbility7 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr1.indexOf("Hap2MainAbility7 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr1.indexOf("Hap2MainAbility7 onWindowStageDestroy")!=-1).assertTrue();

          globalThis.ApplicationContext4
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);
              done();
            });
        }, 3000)
      });
      console.log("------------end Multihap_WindowStageLifecycleTest_005-------------");
    });

    /*
     * @tc.number  Multihap_WindowStageLifecycleTest_006
     * @tc.name    Repeat the registration. The ability of HAP A listens to the life
                    cycle callback of the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_WindowStageLifecycleTest_006", 0, async function (done) {
      console.log("------------Multihap_WindowStageLifecycleTest_006 start-------------");
      TAG = "Multihap_WindowStageLifecycleTest_006";
      listKeyTemp = [];
      listKeyTemp1 = [];
      var firstCallbackId;
      var secondCallbackId;

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility7"
      }, (error, data) => {
        console.log(TAG + ": first MainAbility7 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility8"
      }, (error, data) => {
        setTimeout(function () {
          console.log(TAG + ": first Hap2MainAbility8 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          console.log(TAG + "first globalThis.mainAbility7CallBackId is :" + globalThis.mainAbility7CallBackId);
          firstCallbackId = globalThis.mainAbility7CallBackId;
          console.log(TAG + "firstCallbackId is : " + firstCallbackId);
        }, 3000)
      });

      await sleep(500);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility7"
      }, (error, data) => {
        console.log(TAG + ": second MainAbility7 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(1000);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility8"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap2MainAbility8 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for (var i = 0;i < globalThis.mainAbility7ListKey.length; i++) {
            if (globalThis.mainAbility7ListKey[i].substring(0, 16) == "Hap2MainAbility8") {
              listKeyTemp1.push(globalThis.mainAbility7ListKey[i]);
            }
          }
          console.log(TAG + "second globalThis.mainAbility7CallBackId is :" + globalThis.mainAbility7CallBackId);
          secondCallbackId = globalThis.mainAbility7CallBackId;
          console.log(TAG + "secondCallbackId is : " + secondCallbackId);
          expect(secondCallbackId).assertEqual(firstCallbackId + 1)
          setTimeout(() => {
            globalThis.ApplicationContext7
              .unregisterAbilityLifecycleCallback(globalThis.mainAbility7CallBackId, (error, data) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                ",data: " + JSON.stringify(data));
                expect(error.code).assertEqual(0);
                done();
              });
          }, 1000)
        }, 4000)
      });

      console.log("------------Multihap_WindowStageLifecycleTest_006 end-------------");
    });

    /*
     * @tc.number  Multihap_WindowStageLifecycleTest_007
     * @tc.name    Repeat registration and deregistration. The ability of HAP A listens to the life
                    cycle callback of the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_WindowStageLifecycleTest_007", 0, async function (done) {
      console.log("------------Multihap_WindowStageLifecycleTest_007 start-------------");
      TAG = "Multihap_WindowStageLifecycleTest_007";
      listKeyTemp = [];
      listKeyTemp1 = [];
      var transferStr0 = "";
      var transferStr1 = "";
      var callBackId1;
      var callBackId2;
      var flag;

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility6"
      }, (error, data) => {
        console.log(TAG + ": first MainAbility6 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      setTimeout(function () {
        globalThis.abilityContext.startAbility({
          bundleName: "com.example.lifecycletest",
          abilityName: "Hap2MainAbility9"
        }, (error, data) => {
          setTimeout(() => {
            console.log(TAG + ":first Hap2MainAbility9 startAbility success, err: " +
            JSON.stringify(error) + ",data: " + JSON.stringify(data));

            for (var i = 0;i < globalThis.mainAbility6ListKey.length; i++) {
              if (globalThis.mainAbility6ListKey[i].substring(0, 16) == "Hap2MainAbility9") {
                listKeyTemp.push(globalThis.mainAbility6ListKey[i]);
                transferStr0 += globalThis.mainAbility6ListKey[i];
              }
            }
            console.log(TAG + "listKeyTemp is :" + listKeyTemp);
            console.log(TAG + "first globalThis.mainAbility6CallBackId is :" + globalThis.mainAbility6CallBackId);
            callBackId1 = globalThis.mainAbility6CallBackId
            console.log(TAG + "callBackId1 is :" + callBackId1);
            expect(transferStr0.indexOf("Hap2MainAbility9 onWindowStageCreate")!=-1).assertTrue();
            expect(transferStr0.indexOf("Hap2MainAbility9 onWindowStageActive")!=-1).assertTrue();
            expect(transferStr0.indexOf("Hap2MainAbility9 onWindowStageInactive")!=-1).assertTrue();
            expect(transferStr0.indexOf("Hap2MainAbility9 onWindowStageDestroy")!=-1).assertTrue();
            globalThis.ApplicationContext6
              .unregisterAbilityLifecycleCallback(globalThis.mainAbility6CallBackId, (error, data) => {
                console.log(TAG + ": first unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                ",data: " + JSON.stringify(data));
                expect(error.code).assertEqual(0);
                flag = error.code;
                console.log(TAG + "flag is:" + flag);
              });
          }, 3000)
        });
      }, 1000)


      setTimeout(function () {
        if (flag == 0) {

          globalThis.abilityContext.startAbility({
            bundleName: "com.example.lifecycletest",
            abilityName: "MainAbility6"
          }, (error, data) => {
            console.log(TAG + ": first MainAbility6 startAbility success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          });

          setTimeout(function () {
            globalThis.abilityContext.startAbility({
              bundleName: "com.example.lifecycletest",
              abilityName: "Hap2MainAbility9"
            }, (error, data) => {

              setTimeout(() => {
                console.log(TAG + ":second Hap2MainAbility9 startAbility success, err: " +
                JSON.stringify(error) + ",data: " + JSON.stringify(data));

                for (var i = 0;i < globalThis.mainAbility6ListKey.length; i++) {
                  if (globalThis.mainAbility6ListKey[i].substring(0, 16) == "Hap2MainAbility9") {
                    listKeyTemp1.push(globalThis.mainAbility6ListKey[i]);
                    transferStr1 += globalThis.mainAbility6ListKey[i];
                  }
                }
                console.log(TAG + "listKeyTemp1 is :" + listKeyTemp1);
                console.log(TAG + "second globalThis.mainAbility6CallBackId is :" + globalThis.mainAbility6CallBackId);
                callBackId2 = globalThis.mainAbility6CallBackId
                console.log(TAG + "callBackId2 is :" + callBackId2);
                expect(callBackId2).assertEqual(callBackId1 + 1)
                expect(transferStr1.indexOf("Hap2MainAbility9 onWindowStageCreate")!=-1).assertTrue();
                expect(transferStr1.indexOf("Hap2MainAbility9 onWindowStageActive")!=-1).assertTrue();
                expect(transferStr1.indexOf("Hap2MainAbility9 onWindowStageInactive")!=-1).assertTrue();
                expect(transferStr1.indexOf("Hap2MainAbility9 onWindowStageDestroy")!=-1).assertTrue();
                globalThis.ApplicationContext6
                  .unregisterAbilityLifecycleCallback(globalThis.mainAbility6CallBackId, (error, data) => {
                    console.log(TAG + ": second unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                    ",data: " + JSON.stringify(data));
                    expect(error.code).assertEqual(0);
                    done();
                  });
              }, 3000)
            })
          }, 2000)
        }
      }, 10000)

      console.log("------------Multihap_WindowStageLifecycleTest_007 end-------------");
    });

    /*
     * @tc.number  Multihap_WindowStageLifecycleTest_008
     * @tc.name    Repeat deregistration. The ability of HAP A listens to the life
                    cycle callback of the ability of HAP B
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multihap_WindowStageLifecycleTest_008", 0, async function (done) {
      console.log("------------Multihap_WindowStageLifecycleTest_008 start-------------");
      TAG = "Multihap_WindowStageLifecycleTest_008";
      listKeyTemp = [];
      var transferStr0 = "";

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });

      await sleep(500);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility6"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": Hap2MainAbility6 startAbility success, err: " +
          JSON.stringify(error) + ",data: " + JSON.stringify(data));

          for (var i = 0;i < globalThis.mainAbility4ListKey.length; i++) {
            if (globalThis.mainAbility4ListKey[i].substring(0, 16) == "Hap2MainAbility6") {
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
              transferStr0 += globalThis.mainAbility4ListKey[i];
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(transferStr0.indexOf("Hap2MainAbility6 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility6 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility6 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility6 onWindowStageDestroy")!=-1).assertTrue();
          globalThis.ApplicationContext4
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": first unregisterAbilityLifecycleCallback, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);
              globalThis.ApplicationContext4
                .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
                  console.log(TAG + ": second unregisterAbilityLifecycleCallback, err: " + JSON.stringify(error) +
                  ",data: " + JSON.stringify(data));
                  expect(error.code).assertEqual(1);
                  done()
                });
            });
        }, 4000)
      });
      console.log("------------Multihap_WindowStageLifecycleTest_008 end-------------");
    });

    /*
     * @tc.number  Multihap_WindowStageLifecycleTest_009
     * @tc.name    Switch the front and background for many times to monitor the life cycle
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('Multihap_WindowStageLifecycleTest_009', 0, async function (done) {
      console.info("---------------Multihap_WindowStageLifecycleTest_009 is start---------------")
      TAG = "Multihap_WindowStageLifecycleTest_009";
      listKeyTemp = [];
      listKeyTemp1 = [];
      var transferStr0 = "";
      var transferStr1 = "";

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4",
      }, (error, data) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })

      await sleep(1000)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility10",
      }, (error, data) => {
        console.log(TAG + ": first Hap2MainAbility10 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })

      await sleep(1000)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap3MainAbility3",
      }, (error, data) => {
        console.log(TAG + ": first Hap3MainAbility3 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })

      await sleep(1000)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility10",
      }, (error, data) => {
        console.log(TAG + ": second Hap2MainAbility10 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })

      await sleep(1000)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap3MainAbility3",
      }, (error, data) => {
        console.log(TAG + ": second Hap3MainAbility3 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })


      await sleep(1000)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap2MainAbility10",
      }, (error, data) => {
        console.log(TAG + ": third Hap2MainAbility10 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })

      await sleep(1000)
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap3MainAbility3",
      }, (error, data) => {

        setTimeout(() => {
          console.log(TAG + ": third Hap3MainAbility3 startAbility success, err: " +
          JSON.stringify(error) + ",data: " + JSON.stringify(data));

          for (var i = 0;i < globalThis.mainAbility4ListKey.length; i++) {
            if (globalThis.mainAbility4ListKey[i].substring(0, 17) == "Hap2MainAbility10") {
              listKeyTemp.push(globalThis.mainAbility4ListKey[i]);
              transferStr0 += globalThis.mainAbility4ListKey[i];
            } else if (globalThis.mainAbility4ListKey[i].substring(0, 16) == "Hap3MainAbility3") {
              listKeyTemp1.push(globalThis.mainAbility4ListKey[i]);
              transferStr1 += globalThis.mainAbility4ListKey[i];
            }
          }
          console.log(TAG + " listKeyTemp is :" + listKeyTemp);
          console.log(TAG + " listKeyTemp1 is :" + listKeyTemp1);
          console.log(TAG + " globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);

          expect(transferStr0.indexOf("Hap2MainAbility10 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility10 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility10 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility10 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility10 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility10 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap2MainAbility10 onWindowStageInactive")!=-1).assertTrue();

          expect(transferStr1.indexOf("Hap3MainAbility3 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr1.indexOf("Hap3MainAbility3 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr1.indexOf("Hap3MainAbility3 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr1.indexOf("Hap3MainAbility3 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr1.indexOf("Hap3MainAbility3 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr1.indexOf("Hap3MainAbility3 onWindowStageActive")!=-1).assertTrue();
          globalThis.ApplicationContext4
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);
              done();
            });
        }, 4000)
      })
      console.info("---------------Multihap_WindowStageLifecycleTest_009 is end---------------")
    })

    /*
     * @tc.number  Multihap_WindowStageLifecycleTest_010
     * @tc.name    The ability of HAP A listens to the life cycle callback
                    of the ability of HAP B in different processes
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('Multihap_WindowStageLifecycleTest_010', 0, async function (done) {
      console.info("---------------Multihap_WindowStageLifecycleTest_010 is start---------------")
      TAG = "Multihap_WindowStageLifecycleTest_010";
      listKeyTemp = [];

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility2",
      }, (error, data) => {
        console.log(TAG + ": Hap1MainAbility2 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })

      await sleep(500);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "Hap4MainAbility1",
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": Hap4MainAbility1 startAbility success, err: " +
          JSON.stringify(error) + ",data: " + JSON.stringify(data));

          for (var i = 0; i < globalThis.mainAbility2ListKey.length; i++) {
            if (globalThis.mainAbility2ListKey[i].substring(0, 16) == "Hap4MainAbility1") {
              listKeyTemp.push(globalThis.mainAbility2ListKey[i]);
            }
          }
          console.log(TAG + " listKeyTemp is :" + listKeyTemp);
          console.log(TAG + " globalThis.mainAbility2CallBackId is :" + globalThis.mainAbility2CallBackId);
          expect(listKeyTemp.length).assertEqual(0);

          globalThis.ApplicationContext2
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility2CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);
              done();
            });
        }, 4000)
      });
      console.info("---------------Multihap_WindowStageLifecycleTest_010 is end---------------")
    })
  })
}

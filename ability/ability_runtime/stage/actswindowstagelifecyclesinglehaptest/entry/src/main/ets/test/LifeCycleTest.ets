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
export default function lifecycleTest() {
  describe('LifeCycleTest', function () {

    beforeEach(async function (done) {
      console.info('LifeCycleTest before each called');
      await sleep(1000);
      done()
    });

    afterEach(async function (done) {
      console.info('LifeCycleTest after each called');
      if ("Singlehap_WindowStageLifeCycleTest_0200" === TAG || "Singlehap_WindowStageLifeCycleTest_0300" === TAG
        || "Singlehap_WindowStageLifeCycleTest_0500" === TAG || "Singlehap_WindowStageLifeCycleTest_0600" === TAG
        || "Singlehap_WindowStageLifeCycleTest_0700" === TAG) {
        var para = {
          resultCode: 2,
          want: {
            "abilityName": "MainAbility1",
            "bundleName": "com.example.windowstagelifecycle_xts"
          }
        }
        console.log("LifeCycleTest terminateSelfwithresult para: " + JSON.stringify(para));
        await globalThis.ability1context.terminateSelfWithResult(para)
          .then((data) => {
            console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          }).catch((error) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      } else if ("Singlehap_WindowStageLifeCycleTest_1200" === TAG) {
        var para1 = {
          resultCode: 2,
          want: {
            "abilityName": "MainAbility12",
            "bundleName": "com.example.windowstagelifecycle_xts"
          }
        }
        console.log("LifeCycleTest terminateSelfwithresult para: " + JSON.stringify(para1));
        await globalThis.ability12.terminateSelfWithResult(para1)
          .then((data) => {
            console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          }).catch((error) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      }
      done();
    });

    var TAG = "";
    var listKeyTemp = ""
    var tempCallbackId;

    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time))
    }

    /*
     * @tc.number  Singlehap_WindowStageLifeCycleTest_0100
     * @tc.name    Register in abilitystage,listen to the windowstage lifecycle of abilityA,deregister after listening
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_WindowStageLifeCycleTest_0100", 0, async function (done) {
      console.log("------------Singlehap_WindowStageLifeCycleTest_0100 START-------------");
      TAG = "Singlehap_WindowStageLifeCycleTest_0100";
      var code;
      var str = {
        "bundleName": "com.example.windowstagelifecycle_xts",
        "abilityName": "MainAbility2",
      }
      globalThis.globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid));
        tempCallbackId = globalThis.callbackid;
        console.log(TAG + " registerAbilityLifecycleCallback tempCallbackId : " + JSON.stringify(tempCallbackId));
        var strtemp = "";
        var listtemp = [];
        var transferStr0 = "";
        for (var i = 0; i < globalThis.list.length; i++) {
          strtemp = globalThis.list[i].substring(0, 12);
          if (strtemp === "MainAbility2") {
            listtemp.push(globalThis.list[i]);
            transferStr0 += globalThis.list[i];
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        globalThis.applicationContext
          .unregisterAbilityLifecycleCallback(tempCallbackId, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            code = error.code;
          });
        setTimeout(function () {
          expect(transferStr0.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
          expect(code).assertEqual(0);
          console.log("------------Singlehap_WindowStageLifeCycleTest_0100 END-------------");
          done();
        }, 1000);
      }, 3000);
    })

    /*
     * @tc.number  Singlehap_WindowStageLifeCycleTest_0200
     * @tc.name    Register in abilityA,listen to the windowstage lifecycle of abilityB,deregister after listening
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_WindowStageLifeCycleTest_0200", 0, async function (done) {
      console.log("------------Singlehap_WindowStageLifeCycleTest_0200 START-------------");
      TAG = "Singlehap_WindowStageLifeCycleTest_0200";
      var code;
      var str = {
        "bundleName": "com.example.windowstagelifecycle_xts",
        "abilityName": "MainAbility1",
      }
      globalThis.globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        var str1 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
        var strtemp = "";
        var listtemp = [];
        var transferStr0 = "";
        for (var i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp === "MainAbility1" || strtemp === "MainAbility2") {
            listtemp.push(globalThis.list1[i]);
            transferStr0 += globalThis.list1[i];
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        globalThis.applicationContext1
          .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            code = error.code;
          })
        setTimeout(function () {
          expect(transferStr0.indexOf("MainAbility1 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility1 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility1 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility1 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
          expect(code).assertEqual(0);
          console.log("------------Singlehap_WindowStageLifeCycleTest_0200 END-------------");
          done();
        }, 1000);
      }, 3000);
    });

    /*
    * @tc.number  Singlehap_WindowStageLifeCycleTest_0300
    * @tc.name    Register in abilityA,listening the windowstage lifecycle of abilityB,deregister,repeat the unregister
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("Singlehap_WindowStageLifeCycleTest_0300", 0, async function (done) {
      console.log("------------Singlehap_WindowStageLifeCycleTest_0300 START-------------");
      TAG = "Singlehap_WindowStageLifeCycleTest_0300";
      var code;
      var str = {
        "bundleName": "com.example.windowstagelifecycle_xts",
        "abilityName": "MainAbility1",
      }
      globalThis.globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        var str1 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
        var strtemp = "";
        var listtemp = [];
        var transferStr0 = "";
        for (var i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp === "MainAbility1" || strtemp === "MainAbility2") {
            listtemp.push(globalThis.list1[i]);
            transferStr0 += globalThis.list1[i];
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        globalThis.applicationContext1
          .unregisterAbilityLifecycleCallback(globalThis.callbackid1)
          .then((data) => {
            console.info(TAG + ' unregisterAbilityLifecycleCallback successful. Data: ' + data);
          })
          .catch((error) => {
            console.error(TAG + ' unregisterAbilityLifecycleCallback failed. Cause: ' + JSON.stringify(error));
          })
        setTimeout(function () {
          console.log(TAG + " secondunregister callbackid : " + JSON.stringify(globalThis.callbackid1));
          globalThis.applicationContext1
            .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback_1 success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              code = error.code;
            })
        }, 500);
        setTimeout(function () {
          expect(transferStr0.indexOf("MainAbility1 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility1 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility1 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility1 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
          expect(code).assertEqual(1);
          console.log("------------Singlehap_WindowStageLifeCycleTest_0300 END-------------");
          done();
        }, 2000);
      }, 3000);
    });

    /*
     * @tc.number  Singlehap_WindowStageLifeCycleTest_0400
     * @tc.name    Register in abilityA,listening the windowstage lifecycle of abilityB,terminate abilityA,unregister
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_WindowStageLifeCycleTest_0400", 0, async function (done) {
      console.log("------------Singlehap_WindowStageLifeCycleTest_0400 START-------------");
      TAG = "Singlehap_WindowStageLifeCycleTest_0400";
      var code;
      var str = {
        "bundleName": "com.example.windowstagelifecycle_xts",
        "abilityName": "MainAbility3",
      }
      globalThis.globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start3 successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start3 failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        var str1 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start2 successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start2 failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list3));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid3));
        var strtemp = "";
        var listtemp = [];
        var transferStr0 = "";
        for (var i = 0; i < globalThis.list3.length; i++) {
          strtemp = globalThis.list3[i].substring(0, 12);
          if (strtemp === "MainAbility3" || strtemp === "MainAbility2") {
            listtemp.push(globalThis.list3[i]);
            transferStr0 += globalThis.list3[i];
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        let exlist = listtemp;
        var para = {
          resultCode: 1,
          want: {
            "abilityName": "MainAbility3",
            "bundleName": "com.example.windowstagelifecycle_xts"
          }
        }
        console.log(TAG + " terminateSelfwithresult para: " + JSON.stringify(para));
        globalThis.ability3.terminateSelfWithResult(para)
          .then((data) => {
            console.log(TAG + " terminateSelfwithresult successful data: " + JSON.stringify(data));
          }).catch((error) => {
          console.log(TAG + " terminateSelfwithresult error: " + JSON.stringify(error));
        });
        setTimeout(function () {
          globalThis.applicationContext3
            .unregisterAbilityLifecycleCallback(globalThis.callbackid3, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback3 success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              code = error.code;
            })
        }, 500);
        setTimeout(function () {
          expect(transferStr0.indexOf("MainAbility3 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility3 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility3 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility3 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
          expect(code).assertEqual(0);
          console.log("------------Singlehap_WindowStageLifeCycleTest_0400 END-------------");
          done();
        }, 1000);
      }, 3000);
    });

    /*
     * @tc.number  Singlehap_WindowStageLifeCycleTest_0500
     * @tc.name    Register in abilityA,start abilityB、abilityC,terminate abilityB 、abilityC
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_WindowStageLifeCycleTest_0500", 0, async function (done) {
      console.log("------------Singlehap_WindowStageLifeCycleTest_0500 START-------------");
      TAG = "Singlehap_WindowStageLifeCycleTest_0500";
      var str = {
        "bundleName": "com.example.windowstagelifecycle_xts",
        "abilityName": "MainAbility1",
      }
      globalThis.globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start1 successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start1 failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        var str1 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility5",
        }
        globalThis.globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start5 successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start5 failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        var str2 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.globalThis.abilityContext.startAbility(str2)
          .then((data) => {
            console.info(TAG + ' start2 successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start2 failed. Cause: ' + JSON.stringify(error));
        })
      }, 1100);
      setTimeout(function () {
        console.log(TAG + " listKey1 : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " callbackid1 : " + JSON.stringify(globalThis.callbackid1));
        var strtemp = "";
        var listtemp = [];
        var transferStr0 = "";
        for (var i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp == "MainAbility5" || strtemp == "MainAbility2") {
            listtemp.push(globalThis.list1[i]);
            transferStr0 += globalThis.list1[i];
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        expect(transferStr0.indexOf("MainAbility5 onWindowStageCreate")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility5 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility5 onWindowStageInactive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility5 onWindowStageDestroy")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageInactive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
        globalThis.applicationContext1
          .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            console.log("------------Singlehap_WindowStageLifeCycleTest_0500 END-------------");
            done();
          })
      }, 3800);
    });

    /*
     * @tc.number  Singlehap_WindowStageLifeCycleTest_0600
     * @tc.name    Maninability1 Register listening, Repeat starting and termination Ability2
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_WindowStageLifeCycleTest_0600", 0, async function (done) {
      console.log("------------Singlehap_WindowStageLifeCycleTest_0600 START-------------");
      TAG = "Singlehap_WindowStageLifeCycleTest_0600";
      var str = {
        "bundleName": "com.example.windowstagelifecycle_xts",
        "abilityName": "MainAbility1",
      }
      globalThis.globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        var str1 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        var str1 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 3000);

      setTimeout(function () {
        var str1 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 4500);

      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
        var strtemp = "";
        var listtemp = [];
        var transferStr0 = "";
        for (var i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp === "MainAbility1" || strtemp === "MainAbility2") {
            listtemp.push(globalThis.list1[i]);
            transferStr0 += globalThis.list1[i];
          }
        }
        console.log(TAG + " listtemp is :" + listtemp);
        expect(transferStr0.indexOf("MainAbility1 onWindowStageCreate")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility1 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility1 onWindowStageInactive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility1 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageInactive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility1 onWindowStageInactive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility1 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageInactive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility1 onWindowStageInactive")!=-1).assertTrue();
        globalThis.applicationContext1
          .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            console.log("------------Singlehap_WindowStageLifeCycleTest_0600 END-------------");
            done();
          });
      }, 4950);
    });

    /*
     * @tc.number  Singlehap_WindowStageLifeCycleTest_0700
     * @tc.name    Repeat switching Ability1 between front and back
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_WindowStageLifeCycleTest_0700", 0, async function (done) {
      console.log("------------Singlehap_WindowStageLifeCycleTest_0700 START-------------");
      TAG = "Singlehap_WindowStageLifeCycleTest_0700";
      var str = {
        "bundleName": "com.example.windowstagelifecycle_xts",
        "abilityName": "MainAbility1",
      }
      globalThis.globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        var str1 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        var str1 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 2000);
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
        var strtemp = "";
        var listtemp = [];
        var transferStr0 = "";
        for (var i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp === "MainAbility1" || strtemp === "MainAbility2") {
            listtemp.push(globalThis.list1[i]);
            transferStr0 += globalThis.list1[i];
          }
        }
        console.log(TAG + " listtemp is :" + listtemp);
        expect(transferStr0.indexOf("MainAbility1 onWindowStageCreate")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility1 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility1 onWindowStageInactive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility1 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageInactive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility1 onWindowStageInactive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility1 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageInactive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
        globalThis.applicationContext1
          .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            console.log("------------Singlehap_WindowStageLifeCycleTest_0700 END-------------");
            done();
          });
      }, 4000);
    });

    /*
     * @tc.number  Singlehap_WindowStageLifeCycleTest_0800
     * @tc.name    Register listening in abilityA foreground,repeat the registration
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_WindowStageLifeCycleTest_0800", 0, async function (done) {
      console.log("------------Singlehap_WindowStageLifeCycleTest_0800 START-------------");
      TAG = "Singlehap_WindowStageLifeCycleTest_0800";
      var id1;
      var id2;
      var str = {
        "bundleName": "com.example.windowstagelifecycle_xts",
        "abilityName": "MainAbility6",
      }
      globalThis.globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        console.log(TAG + " firstCallback listKey : " + JSON.stringify(globalThis.list6));
        console.log(TAG + " firstCallback callbackid : " + JSON.stringify(globalThis.callbackid6));
        id1 = globalThis.callbackid6;
        console.log(TAG + " firstCallback id : " + JSON.stringify(id1));
        var str1 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 2000);
      setTimeout(function () {
        console.log(TAG + " secondCallback listKey : " + JSON.stringify(globalThis.list6));
        console.log(TAG + " secondCallback callbackid : " + JSON.stringify(globalThis.callbackid6));
        id2 = globalThis.callbackid6;
        console.log(TAG + " secondCallback id : " + JSON.stringify(id2));
        expect(id1 + 1).assertEqual(id2);
        globalThis.applicationContext6
          .unregisterAbilityLifecycleCallback(globalThis.callbackid6, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            console.log("------------Singlehap_WindowStageLifeCycleTest_0800 END-------------");
            done();
          });
      }, 4500);
    });

    /*
    * @tc.number  Singlehap_WindowStageLifeCycleTest_0900
    * @tc.name    The ability of HAP A listens to the ability lifecycle callback of HAP B (singleton)
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("Singlehap_WindowStageLifeCycleTest_0900", 0, async function (done) {
      console.log("------------Singlehap_WindowStageLifeCycleTest_0900 start-------------");
      TAG = "Singlehap_WindowStageLifeCycleTest_0900";
      listKeyTemp = [];
      var transferStr0 = "";
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.windowstagelifecycle_xts",
        abilityName: "MainAbility9"
      }, (error, data) => {
        console.log(TAG + ": MainAbility9 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      await sleep(500);
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.windowstagelifecycle_xts",
        abilityName: "Hap1MainAbility1"
      }, (error, data) => {
        console.log(TAG + ":first Hap1MainAbility1 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      await sleep(500);
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.windowstagelifecycle_xts",
        abilityName: "Hap1MainAbility1"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap1MainAbility1 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for (var i = 0; i < globalThis.mainAbility9ListKey.length; i++) {
            if (globalThis.mainAbility9ListKey[i].substring(0, 16) == "Hap1MainAbility1") {
              listKeyTemp.push(globalThis.mainAbility9ListKey[i]);
              transferStr0 += globalThis.mainAbility9ListKey[i];
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "globalThis.mainAbility9CallBackId is :" + globalThis.mainAbility9CallBackId);
          expect(transferStr0.indexOf("Hap1MainAbility1 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap1MainAbility1 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap1MainAbility1 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap1MainAbility1 onWindowStageDestroy")!=-1).assertTrue();
          globalThis.applicationContext9
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility9CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              done();
            });
        }, 3000)
      });
      console.log("------------Singlehap_WindowStageLifeCycleTest_0900 end-------------");
    });

    /*
     * @tc.number  Singlehap_WindowStageLifeCycleTest_1000
     * @tc.name    The ability of HAP A listens to the ability windowstage lifecycle callback of HAP B (standard)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_WindowStageLifeCycleTest_1000", 0, async function (done) {
      console.log("------------Singlehap_WindowStageLifeCycleTest_1000 start-------------");
      TAG = "Singlehap_WindowStageLifeCycleTest_1000";
      listKeyTemp = [];
      var transferStr0 = "";
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.windowstagelifecycle_xts",
        abilityName: "MainAbility9"
      }, (error, data) => {
        console.log(TAG + ": MainAbility9 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      await sleep(500);
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.windowstagelifecycle_xts",
        abilityName: "Hap1MainAbility2"
      }, (error, data) => {
        console.log(TAG + ":first Hap1MainAbility2 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      await sleep(500);
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.windowstagelifecycle_xts",
        abilityName: "Hap1MainAbility2"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap1MainAbility2 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for (var i = 0;i < globalThis.mainAbility9ListKey.length; i++) {
            if (globalThis.mainAbility9ListKey[i].substring(0, 16) == "Hap1MainAbility2") {
              listKeyTemp.push(globalThis.mainAbility9ListKey[i]);
              transferStr0 += globalThis.mainAbility9ListKey[i];
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "globalThis.mainAbility9CallBackId is :" + globalThis.mainAbility9CallBackId);
          expect(transferStr0.indexOf("Hap1MainAbility2 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap1MainAbility2 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap1MainAbility2 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap1MainAbility2 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap1MainAbility2 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap1MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap1MainAbility2 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("Hap1MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
          globalThis.applicationContext9
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility9CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              done();
            });
        }, 3000)
      });
      console.log("------------Singlehap_WindowStageLifeCycleTest_1000 end-------------");
    });
    /*
     * @tc.number  Singlehap_WindowStageLifeCycleTest_1100
     * @tc.name    Register in abilityA , starting and termination AbilityB,Repeat previous steps (standard)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_WindowStageLifeCycleTest_1100", 0, async function (done) {
      console.log("------------Singlehap_WindowStageLifeCycleTest_1100 START-------------");
      TAG = "Singlehap_WindowStageLifeCycleTest_1100";
      var id1;
      var id2;
      var str = {
        "bundleName": "com.example.windowstagelifecycle_xts",
        "abilityName": "MainAbility11",
      }
      globalThis.globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        var str1 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        console.log(TAG + " firstCallback listKey : " + JSON.stringify(globalThis.list11));
        console.log(TAG + " firstCallback callbackid : " + JSON.stringify(globalThis.callbackid11));
        id1 = globalThis.callbackid11;
        console.log(TAG + " firstCallback id : " + JSON.stringify(id1));
        var str = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility11",
        }
        globalThis.globalThis.abilityContext.startAbility(str)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
        setTimeout(function () {
          var str1 = {
            "bundleName": "com.example.windowstagelifecycle_xts",
            "abilityName": "MainAbility2",
          }
          globalThis.globalThis.abilityContext.startAbility(str1)
            .then((data) => {
              console.info(TAG + ' start successful. Data: ' + data);
            }).catch((error) => {
            console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
          })
        }, 1000);
      }, 3000);
      setTimeout(function () {
        console.log(TAG + " secondCallback listKey : " + JSON.stringify(globalThis.list11));
        console.log(TAG + " secondCallback callbackid : " + JSON.stringify(globalThis.callbackid11));
        id2 = globalThis.callbackid11;
        console.log(TAG + " secondCallback id : " + JSON.stringify(id2));
        var strtemp = "";
        var listtemp = [];
        var transferStr0 = "";
        for (var i = 0; i < globalThis.list11.length; i++) {
          strtemp = globalThis.list11[i].substring(0, 12);
          if (strtemp == "MainAbility2") {
            listtemp.push(globalThis.list11[i]);
            transferStr0 += globalThis.list11[i];
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        expect(transferStr0.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageInactive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
        expect(id1 + 1).assertEqual(id2);
        globalThis.applicationContext11
          .unregisterAbilityLifecycleCallback(globalThis.callbackid11, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            console.log("------------Singlehap_WindowStageLifeCycleTest_1100 END-------------");
            done();
          });
      }, 6000);
    });

    /*
     * @tc.number  Singlehap_WindowStageLifeCycleTest_1200
     * @tc.name    Register in abilityA, starting and termination AbilityB, terminate abilityA, Re-register in abilityA
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_WindowStageLifeCycleTest_1200", 0, async function (done) {
      console.log("------------Singlehap_WindowStageLifeCycleTest_1200 START-------------");
      TAG = "Singlehap_WindowStageLifeCycleTest_1200";
      var id1;
      var id2;
      var str = {
        "bundleName": "com.example.windowstagelifecycle_xts",
        "abilityName": "MainAbility12",
      }
      globalThis.globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        var str1 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        console.log(TAG + " firstCallback listKey : " + JSON.stringify(globalThis.list12));
        console.log(TAG + " firstCallback callbackid : " + JSON.stringify(globalThis.callbackid12));
        id1 = globalThis.callbackid12;
        console.log(TAG + " firstCallback id : " + JSON.stringify(id1));
        var para = {
          resultCode: 2000,
          want: {
            "abilityName": "MainAbility12",
            "bundleName": "com.example.windowstagelifecycle_xts"
          }
        }
        console.log(TAG + " terminateSelfwithresult para: " + JSON.stringify(para));
        globalThis.ability12.terminateSelfWithResult(para)
          .then((data) => {
            console.log(TAG + " terminateSelfwithresult successful data: " + JSON.stringify(data));
          }).catch((error) => {
          console.log(TAG + " terminateSelfwithresult error: " + JSON.stringify(error));
        });
      }, 2500);
      setTimeout(function () {
        var str = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility12",
        }
        globalThis.globalThis.abilityContext.startAbility(str)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
        setTimeout(function () {
          var str1 = {
            "bundleName": "com.example.windowstagelifecycle_xts",
            "abilityName": "MainAbility2",
          }
          globalThis.globalThis.abilityContext.startAbility(str1)
            .then((data) => {
              console.info(TAG + ' start successful. Data: ' + data);
            }).catch((error) => {
            console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
          })
        }, 500);
      }, 4000);
      setTimeout(function () {
        console.log(TAG + " secondCallback listKey : " + JSON.stringify(globalThis.list12));
        console.log(TAG + " secondCallback callbackid : " + JSON.stringify(globalThis.callbackid12));
        id2 = globalThis.callbackid12;
        console.log(TAG + " secondCallback id : " + JSON.stringify(id2));
        var strtemp = "";
        var listtemp = [];
        var transferStr0 = "";
        for (var i = 0; i < globalThis.list12.length; i++) {
          strtemp = globalThis.list12[i].substring(0, 12);
          if (strtemp == "MainAbility2") {
            listtemp.push(globalThis.list12[i]);
            transferStr0 += globalThis.list12[i];
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        expect(transferStr0.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageInactive")!=-1).assertTrue();
        expect(transferStr0.indexOf("MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
        expect(id1 + 1).assertEqual(id2);
        globalThis.applicationContext12
          .unregisterAbilityLifecycleCallback(id2, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            console.log("------------Singlehap_WindowStageLifeCycleTest_1200 END-------------");
            done();
          });
      }, 6200);
    });

    /*
    * @tc.number  Singlehap_WindowStageLifeCycleTest_1300
    * @tc.name    Register in abilityA,register in abilityB, starting and termination abilityC,
                  termination abilityB、abilityA, Re-register in abilityA、abilityB
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("Singlehap_WindowStageLifeCycleTest_1300", 0, async function (done) {
      console.log("------------Singlehap_WindowStageLifeCycleTest_1300 START-------------");
      TAG = "Singlehap_WindowStageLifeCycleTest_1300";
      var id1;
      var id2;
      var id3;
      var id4;
      var str = {
        "bundleName": "com.example.windowstagelifecycle_xts",
        "abilityName": "MainAbility1",
      }
      globalThis.globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        var str1 = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility12",
        }
        globalThis.globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
        setTimeout(function () {
          var str2 = {
            "bundleName": "com.example.windowstagelifecycle_xts",
            "abilityName": "MainAbility2",
          }
          globalThis.globalThis.abilityContext.startAbility(str2)
            .then((data) => {
              console.info(TAG + ' start successful. Data: ' + data);
            }).catch((error) => {
            console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
          })
        }, 500);
      }, 500);
      setTimeout(function () {
        console.log(TAG + " firstCallback listKey1 : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " firstCallback callbackid1 : " + JSON.stringify(globalThis.callbackid1));
        console.log(TAG + " firstCallback listKey12 : " + JSON.stringify(globalThis.list12));
        console.log(TAG + " firstCallback callbackid12 : " + JSON.stringify(globalThis.callbackid12));
        id1 = globalThis.callbackid1;
        console.log(TAG + " firstCallback id1 : " + JSON.stringify(id1));
        id2 = globalThis.callbackid12;
        console.log(TAG + " firstCallback id12 : " + JSON.stringify(id2));
        var para = {
          resultCode: 2100,
          want: {
            "abilityName": "MainAbility12",
            "bundleName": "com.example.windowstagelifecycle_xts"
          }
        }
        console.log(TAG + " terminateSelfwithresult para: " + JSON.stringify(para));
        globalThis.ability12.terminateSelfWithResult(para)
          .then((data) => {
            console.log(TAG + " terminateSelfwithresult successful data: " + JSON.stringify(data));
          }).catch((error) => {
          console.log(TAG + " terminateSelfwithresult error: " + JSON.stringify(error));
        });
        setTimeout(function () {
          var para = {
            resultCode: 2100,
            want: {
              "abilityName": "MainAbility1",
              "bundleName": "com.example.windowstagelifecycle_xts"
            }
          }
          console.log(TAG + " terminateSelfwithresult para: " + JSON.stringify(para));
          globalThis.ability1context.terminateSelfWithResult(para)
            .then((data) => {
              console.log(TAG + " terminateSelfwithresult successful data: " + JSON.stringify(data));
            }).catch((error) => {
            console.log(TAG + " terminateSelfwithresult error: " + JSON.stringify(error));
          });
        }, 500);
      }, 3000);
      setTimeout(function () {
        var str = {
          "bundleName": "com.example.windowstagelifecycle_xts",
          "abilityName": "MainAbility1",
        }
        globalThis.globalThis.abilityContext.startAbility(str)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
        setTimeout(function () {
          var str1 = {
            "bundleName": "com.example.windowstagelifecycle_xts",
            "abilityName": "MainAbility12",
          }
          globalThis.globalThis.abilityContext.startAbility(str1)
            .then((data) => {
              console.info(TAG + ' start successful. Data: ' + data);
            }).catch((error) => {
            console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
          })
          setTimeout(function () {
            var str2 = {
              "bundleName": "com.example.windowstagelifecycle_xts",
              "abilityName": "MainAbility2",
            }
            globalThis.globalThis.abilityContext.startAbility(str2)
              .then((data) => {
                console.info(TAG + ' start successful. Data: ' + data);
              }).catch((error) => {
              console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
            })
          }, 500);
        }, 500);
      }, 4000);
      setTimeout(function () {
        console.log(TAG + " secondCallback listKey1 : " + JSON.stringify(globalThis.list1));
        let templist1 = globalThis.list1;
        console.log(TAG + " secondCallback templist1 : " + JSON.stringify(templist1));
        console.log(TAG + " secondCallback callbackid1 : " + JSON.stringify(globalThis.callbackid1));
        console.log(TAG + " secondCallback listKey12 : " + JSON.stringify(globalThis.list12));
        let templist2 = globalThis.list12;
        console.log(TAG + " secondCallback templist2 : " + JSON.stringify(templist2));
        console.log(TAG + " secondCallback callbackid12 : " + JSON.stringify(globalThis.callbackid12));
        id3 = globalThis.callbackid1;
        console.log(TAG + " secondCallback id1 : " + JSON.stringify(id3));
        id4 = globalThis.callbackid12;
        console.log(TAG + " secondCallback id12 : " + JSON.stringify(id4));
        var strtemp = "";
        var listtemp = [];
        var transferStr0 = "";
        for (var i = 0; i < templist1.length; i++) {
          strtemp = templist1[i].substring(0, 13);
          if (strtemp === "MainAbility2 " || strtemp === "MainAbility12") {
            listtemp.push(templist1[i]);
            transferStr0 += templist1[i];
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        setTimeout(function () {
          var strtemp1 = "";
          var listtemp1 = [];
          var transferStr1 = "";
          for (var j = 0; j < templist2.length; j++) {
            strtemp1 = templist2[j].substring(0, 12);
            if (strtemp1 === "MainAbility2") {
              listtemp1.push(templist2[j]);
              transferStr1 += templist2[j];
            }
          }
          console.log(TAG + " listtemp1 is :" + JSON.stringify(listtemp1));
          expect(transferStr0.indexOf("MainAbility12 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility12 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility12 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility12 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr0.indexOf("MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
          expect(transferStr1.indexOf("MainAbility2 onWindowStageCreate")!=-1).assertTrue();;
          expect(transferStr1.indexOf("MainAbility2 onWindowStageActive")!=-1).assertTrue();
          expect(transferStr1.indexOf("MainAbility2 onWindowStageInactive")!=-1).assertTrue();
          expect(transferStr1.indexOf("MainAbility2 onWindowStageDestroy")!=-1).assertTrue();
          expect(id1 + 1).assertEqual(id2);
          expect(id3 + 1).assertEqual(id4);
          globalThis.applicationContext12
            .unregisterAbilityLifecycleCallback(globalThis.callbackid12, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
            });
          globalThis.applicationContext1
            .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              console.log("------------Singlehap_WindowStageLifeCycleTest_1300 END-------------");
              done();
            });
        }, 100);
      }, 7000);
    });

  })
}
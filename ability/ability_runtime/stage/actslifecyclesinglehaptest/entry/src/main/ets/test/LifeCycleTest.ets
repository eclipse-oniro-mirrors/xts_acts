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
      if ("Singlehap_LifeCycleTest_0200" === TAG || "Singlehap_LifeCycleTest_0300" === TAG
      || "Singlehap_LifeCycleTest_0500" === TAG || "Singlehap_LifeCycleTest_0600" === TAG
      || "Singlehap_LifeCycleTest_0800" === TAG || "Singlehap_LifeCycleTest_0900" === TAG) {
        let para = {
          resultCode: 2,
          want: {
            "abilityName": "MainAbility1",
            "bundleName": "com.example.lifecycle_xts"
          }
        }
        console.log("LifeCycleTest terminateSelfwithresult para: " + JSON.stringify(para));
        await globalThis.ability1context.terminateSelfWithResult(para)
          .then((data) => {
            console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          }).catch((error) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      } else if ("Singlehap_LifeCycleTest_2000" === TAG) {
        let para1 = {
          resultCode: 2,
          want: {
            "abilityName": "MainAbility12",
            "bundleName": "com.example.lifecycle_xts"
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

    let TAG = "";
    let listKeyTemp;
    let tempCallbackId;

    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time))
    }

    /*
     * @tc.number  Singlehap_LifeCycleTest_0100
     * @tc.name    Register in abilitystage,listen to the lifecycle of abilityA,deregister after listening
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0100", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0100 START-------------");
      TAG = "Singlehap_LifeCycleTest_0100";
      let code;
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility2",
      }
      globalThis.abilityContext.startAbility(str)
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
        let strtemp = "";
        let listtemp = [];
        for (let i = 0; i < globalThis.list.length; i++) {
          strtemp = globalThis.list[i].substring(0, 12);
          if (strtemp === "MainAbility2") {
            listtemp.push(globalThis.list[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        let exlist = listtemp;
        globalThis.applicationContext
          .unregisterAbilityLifecycleCallback(tempCallbackId, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            code = error.code;
          });
        setTimeout(function () {
          expect(exlist[0]).assertEqual("MainAbility2 onAbilityCreate");
          expect(exlist[1]).assertEqual("MainAbility2 onWindowStageCreate");
          expect(exlist[2]).assertEqual("MainAbility2 onAbilityForeground");
          expect(exlist[3]).assertEqual("MainAbility2 onAbilityBackground");
          expect(exlist[4]).assertEqual("MainAbility2 onWindowStageDestroy");
          expect(exlist[5]).assertEqual("MainAbility2 onAbilityDestroy");
          expect(code).assertEqual(0);
          console.log("------------Singlehap_LifeCycleTest_0100 END-------------");
          done();
        }, 1000);
      }, 3000);
    })

    /*
     * @tc.number  Singlehap_LifeCycleTest_0200
     * @tc.name    Register in abilityA,listen to the lifecycle of abilityB,deregister after listening
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0200", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0200 START-------------");
      TAG = "Singlehap_LifeCycleTest_0200";
      let code;
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      }
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
        let strtemp = "";
        let listtemp = [];
        let listtemp1 = [];
        for (let i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp === "MainAbility1") {
            listtemp.push(globalThis.list1[i]);
          } else if (strtemp === "MainAbility2") {
            listtemp1.push(globalThis.list1[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        console.log(TAG + " listtemp1 is :" + JSON.stringify(listtemp1));
        let exlist = listtemp;
        let exlist1 = listtemp1;
        globalThis.applicationContext1
          .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            code = error.code;
          })
        setTimeout(function () {
          expect(exlist[0]).assertEqual("MainAbility1 onWindowStageCreate");
          expect(exlist[1]).assertEqual("MainAbility1 onAbilityForeground");
          expect(exlist[2]).assertEqual("MainAbility1 onAbilityBackground");
          expect(exlist[3]).assertEqual("MainAbility1 onAbilityForeground");
          expect(exlist1[0]).assertEqual("MainAbility2 onAbilityCreate");
          expect(exlist1[1]).assertEqual("MainAbility2 onWindowStageCreate");
          expect(exlist1[2]).assertEqual("MainAbility2 onAbilityForeground");
          expect(exlist1[3]).assertEqual("MainAbility2 onAbilityBackground");
          expect(exlist1[4]).assertEqual("MainAbility2 onWindowStageDestroy");
          expect(exlist1[5]).assertEqual("MainAbility2 onAbilityDestroy");
          expect(code).assertEqual(0);
          console.log("------------Singlehap_LifeCycleTest_0200 END-------------");
          done();
        }, 1000);
      }, 3000);
    });

    /*
    * @tc.number  Singlehap_LifeCycleTest_0300
    * @tc.name    Register in abilityA,listening the lifecycle of abilityB,deregister,repeat the unregister
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("Singlehap_LifeCycleTest_0300", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0300 START-------------");
      TAG = "Singlehap_LifeCycleTest_0300";
      let code;
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      }
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
        let strtemp = "";
        let listtemp = [];
        let listtemp1 = [];
        for (let i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp === "MainAbility1") {
            listtemp.push(globalThis.list1[i]);
          } else if (strtemp === "MainAbility2") {
            listtemp1.push(globalThis.list1[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        console.log(TAG + " listtemp1 is :" + JSON.stringify(listtemp1));
        let exlist = listtemp;
        let exlist1 = listtemp1;
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
          expect(exlist[0]).assertEqual("MainAbility1 onWindowStageCreate");
          expect(exlist[1]).assertEqual("MainAbility1 onAbilityForeground");
          expect(exlist[2]).assertEqual("MainAbility1 onAbilityBackground");
          expect(exlist[3]).assertEqual("MainAbility1 onAbilityForeground");
          expect(exlist1[0]).assertEqual("MainAbility2 onAbilityCreate");
          expect(exlist1[1]).assertEqual("MainAbility2 onWindowStageCreate");
          expect(exlist1[2]).assertEqual("MainAbility2 onAbilityForeground");
          expect(exlist1[3]).assertEqual("MainAbility2 onAbilityBackground");
          expect(exlist1[4]).assertEqual("MainAbility2 onWindowStageDestroy");
          expect(exlist1[5]).assertEqual("MainAbility2 onAbilityDestroy");
          expect(code).assertEqual(1);
          console.log("------------Singlehap_LifeCycleTest_0300 END-------------");
          done();
        }, 2000);
      }, 3000);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0400
     * @tc.name    Register in abilityA,listening the lifecycle of abilityB,terminate abilityA,unregister
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0400", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0400 START-------------");
      TAG = "Singlehap_LifeCycleTest_0400";
      let code;
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility3",
      }
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start3 successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start3 failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start2 successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start2 failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list3));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid3));
        let strtemp = "";
        let listtemp = [];
        let listtemp1 = [];
        for (let i = 0; i < globalThis.list3.length; i++) {
          strtemp = globalThis.list3[i].substring(0, 12);
          if (strtemp === "MainAbility3") {
            listtemp.push(globalThis.list3[i]);
          } else if (strtemp === "MainAbility2") {
            listtemp1.push(globalThis.list3[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        console.log(TAG + " listtemp1 is :" + JSON.stringify(listtemp1));
        let exlist = listtemp;
        let exlist1 = listtemp1;
        let para = {
          resultCode: 1,
          want: {
            "abilityName": "MainAbility3",
            "bundleName": "com.example.lifecycle_xts"
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
          expect(exlist[0]).assertEqual("MainAbility3 onWindowStageCreate");
          expect(exlist[1]).assertEqual("MainAbility3 onAbilityForeground");
          expect(exlist[2]).assertEqual("MainAbility3 onAbilityBackground");
          expect(exlist[3]).assertEqual("MainAbility3 onAbilityForeground");
          expect(exlist1[0]).assertEqual("MainAbility2 onAbilityCreate");
          expect(exlist1[1]).assertEqual("MainAbility2 onWindowStageCreate");
          expect(exlist1[2]).assertEqual("MainAbility2 onAbilityForeground");
          expect(exlist1[3]).assertEqual("MainAbility2 onAbilityBackground");
          expect(exlist1[4]).assertEqual("MainAbility2 onWindowStageDestroy");
          expect(exlist1[5]).assertEqual("MainAbility2 onAbilityDestroy");
          expect(code).assertEqual(0);
          console.log("------------Singlehap_LifeCycleTest_0400 END-------------");
          done();
        }, 1000);
      }, 3000);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0500
     * @tc.name    Register in abilityA and abilityB,unregister MainabilityB,then Register in ManinabilityC
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0500", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0500 START-------------");
      TAG = "Singlehap_LifeCycleTest_0500";
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      }
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start1 successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start1 failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility3",
        }
        globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start3 successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start3 failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        console.log(TAG + " start after callbackid3 : " + JSON.stringify(globalThis.callbackid3));
        globalThis.applicationContext3
          .unregisterAbilityLifecycleCallback(globalThis.callbackid3)
          .then((data) => {
            console.info(TAG + ' unregisterAbilityLifecycleCallback3 successful. Data: ' + data);
          })
          .catch((error) => {
            console.error(TAG + ' unregisterAbilityLifecycleCallback3 failed. Cause: ' + JSON.stringify(error));
          });
        let str2 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility4",
        }
        globalThis.abilityContext.startAbility(str2)
          .then((data) => {
            console.info(TAG + ' start4 successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start4 failed. Cause: ' + JSON.stringify(error));
        })
      }, 2800);
      setTimeout(function () {
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
          .unregisterAbilityLifecycleCallback(globalThis.callbackid4, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback4 success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          })
        globalThis.applicationContext1
          .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback1 success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            console.log("------------Singlehap_LifeCycleTest_0500 END-------------");
            done();
          })
      }, 5000);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0600
     * @tc.name    Register in abilityA,start abilityB、abilityC,terminate abilityB 、abilityC
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0600", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0600 START-------------");
      TAG = "Singlehap_LifeCycleTest_0600";
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      }
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start1 successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start1 failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility5",
        }
        globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start5 successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start5 failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        let str2 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.abilityContext.startAbility(str2)
          .then((data) => {
            console.info(TAG + ' start2 successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start2 failed. Cause: ' + JSON.stringify(error));
        })
      }, 1100);
      setTimeout(function () {
        console.log(TAG + " listKey1 : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " callbackid1 : " + JSON.stringify(globalThis.callbackid1));
        let strtemp = "";
        let listtemp = [];
        let listtemp2 = [];
        for (let i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp == "MainAbility2") {
              listtemp.push(globalThis.list1[i]);
          } else if (strtemp == "MainAbility5") {
              listtemp2.push(globalThis.list1[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        console.log(TAG + " listtemp2 is :" + JSON.stringify(listtemp2));
        let exlist = listtemp;
        let exlist2 = listtemp2;
        expect(exlist[0]).assertEqual("MainAbility2 onAbilityCreate");
        expect(exlist[1]).assertEqual("MainAbility2 onWindowStageCreate");
        expect(exlist[2]).assertEqual("MainAbility2 onAbilityForeground");
        expect(exlist[3]).assertEqual("MainAbility2 onAbilityBackground");
        expect(exlist[4]).assertEqual("MainAbility2 onWindowStageDestroy");
        expect(exlist[5]).assertEqual("MainAbility2 onAbilityDestroy");
        expect(exlist2[0]).assertEqual("MainAbility5 onAbilityCreate");
        expect(exlist2[1]).assertEqual("MainAbility5 onWindowStageCreate");
        expect(exlist2[2]).assertEqual("MainAbility5 onAbilityForeground");
        expect(exlist2[3]).assertEqual("MainAbility5 onAbilityBackground");
        expect(exlist2[4]).assertEqual("MainAbility5 onWindowStageDestroy");
        expect(exlist2[5]).assertEqual("MainAbility5 onAbilityDestroy");

        globalThis.applicationContext1
          .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            console.log("------------Singlehap_LifeCycleTest_0600 END-------------");
            done();
          })
      }, 4200);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0700
     * @tc.name    Multiple registration/unregistration
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0700", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0700 START-------------");
      TAG = "Singlehap_LifeCycleTest_0700";
      let code1;
      let code2;
      let code3;
      let id1;
      let id2;
      let id3;
      let listKey8 = [];
      let AbilityLifecycleCallback = {
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
      applicationContext.unregisterAbilityLifecycleCallback(id1, (error, data) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback1 success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
        code1 = error.code;
      })
      setTimeout(function () {
        id2 = applicationContext.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log(TAG + " registerAbilityLifecycleCallback2 number: " + JSON.stringify(id2));
        applicationContext.unregisterAbilityLifecycleCallback(id2, (error, data) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback2 success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          code2 = error.code;
        })
      }, 1000);
      setTimeout(function () {
        id3 = applicationContext.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log(TAG + " registerAbilityLifecycleCallback3 number: " + JSON.stringify(id3));
        applicationContext.unregisterAbilityLifecycleCallback(id3, (error, data) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback3 success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          code3 = error.code;
          expect(id1 > 0).assertTrue();
          expect(id2).assertEqual(id1 + 1);
          expect(id3).assertEqual(id2 + 1);
          expect(code1).assertEqual(0);
          expect(code2).assertEqual(0);
          expect(code3).assertEqual(0);
          console.log("------------Singlehap_LifeCycleTest_0700 END-------------");
          done();
        })
      }, 3000);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0800
     * @tc.name    Maninability1 Register listening, Repeat starting and termination Ability2
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0800", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0800 START-------------");
      TAG = "Singlehap_LifeCycleTest_0800";
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      }
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 1500);
      setTimeout(function () {
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 3000);

      setTimeout(function () {
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 4500);

      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
        let strtemp = "";
        let listtemp = [];
        let listtemp1 = [];
        for (let i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp === "MainAbility1") {
            listtemp.push(globalThis.list1[i]);
          } else if (strtemp === "MainAbility2") {
            listtemp1.push(globalThis.list1[i]);
          }
        }
        console.log(TAG + " listtemp is :" + listtemp);
        console.log(TAG + " listtemp1 is :" + listtemp1);
        let exlist = listtemp;
        let exlist1 = listtemp1;
        expect(exlist[0]).assertEqual("MainAbility1 onWindowStageCreate");
        expect(exlist[1]).assertEqual("MainAbility1 onAbilityForeground");
        expect(exlist[2]).assertEqual("MainAbility1 onAbilityBackground");
        expect(exlist[3]).assertEqual("MainAbility1 onAbilityForeground");
        expect(exlist[4]).assertEqual("MainAbility1 onAbilityBackground");
        expect(exlist[5]).assertEqual("MainAbility1 onAbilityForeground");
        expect(exlist[6]).assertEqual("MainAbility1 onAbilityBackground");
        expect(exlist1[0]).assertEqual("MainAbility2 onAbilityCreate");
        expect(exlist1[1]).assertEqual("MainAbility2 onWindowStageCreate");
        expect(exlist1[2]).assertEqual("MainAbility2 onAbilityForeground");
        expect(exlist1[3]).assertEqual("MainAbility2 onAbilityBackground");
        expect(exlist1[4]).assertEqual("MainAbility2 onWindowStageDestroy");
        expect(exlist1[5]).assertEqual("MainAbility2 onAbilityDestroy");
        expect(exlist1[6]).assertEqual("MainAbility2 onAbilityCreate");
        expect(exlist1[7]).assertEqual("MainAbility2 onWindowStageCreate");
        expect(exlist1[8]).assertEqual("MainAbility2 onAbilityForeground");
        expect(exlist1[9]).assertEqual("MainAbility2 onAbilityBackground");
        expect(exlist1[10]).assertEqual("MainAbility2 onWindowStageDestroy");
        expect(exlist1[11]).assertEqual("MainAbility2 onAbilityDestroy");
        expect(exlist1[12]).assertEqual("MainAbility2 onAbilityCreate");
        expect(exlist1[13]).assertEqual("MainAbility2 onWindowStageCreate");
        expect(exlist1[14]).assertEqual("MainAbility2 onAbilityForeground");
        globalThis.applicationContext1
          .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            console.log("------------Singlehap_LifeCycleTest_0800 END-------------");
            done();
          });
      }, 5500);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0900
     * @tc.name    Repeat switching Ability1 between front and back
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0900", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0900 START-------------");
      TAG = "Singlehap_LifeCycleTest_0900";
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      }
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 500);
      setTimeout(function () {
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 2000);
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
        let strtemp = "";
        let listtemp = [];
        let listtemp1 = [];
        for (let i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp === "MainAbility1") {
            listtemp.push(globalThis.list1[i]);
          } else if (strtemp === "MainAbility2") {
            listtemp1.push(globalThis.list1[i]);
          }
        }
        console.log(TAG + " listtemp is :" + listtemp);
        console.log(TAG + " listtemp1 is :" + listtemp1);
        let exlist = listtemp;
        let exlist1 = listtemp1;
        expect(exlist[0]).assertEqual("MainAbility1 onWindowStageCreate");
        expect(exlist[1]).assertEqual("MainAbility1 onAbilityForeground");
        expect(exlist[2]).assertEqual("MainAbility1 onAbilityBackground");
        expect(exlist[3]).assertEqual("MainAbility1 onAbilityForeground");
        expect(exlist[4]).assertEqual("MainAbility1 onAbilityBackground");
        expect(exlist[5]).assertEqual("MainAbility1 onAbilityForeground");
        expect(exlist1[0]).assertEqual("MainAbility2 onAbilityCreate");
        expect(exlist1[1]).assertEqual("MainAbility2 onWindowStageCreate");
        expect(exlist1[2]).assertEqual("MainAbility2 onAbilityForeground");
        expect(exlist1[3]).assertEqual("MainAbility2 onAbilityBackground");
        expect(exlist1[4]).assertEqual("MainAbility2 onWindowStageDestroy");
        expect(exlist1[5]).assertEqual("MainAbility2 onAbilityDestroy");
        expect(exlist1[6]).assertEqual("MainAbility2 onAbilityCreate");
        expect(exlist1[7]).assertEqual("MainAbility2 onWindowStageCreate");
        expect(exlist1[8]).assertEqual("MainAbility2 onAbilityForeground");
        expect(exlist1[9]).assertEqual("MainAbility2 onAbilityBackground");
        expect(exlist1[10]).assertEqual("MainAbility2 onWindowStageDestroy");
        expect(exlist1[11]).assertEqual("MainAbility2 onAbilityDestroy");
        globalThis.applicationContext1
          .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            console.log("------------Singlehap_LifeCycleTest_0900 END-------------");
            done();
          });
      }, 4000);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_1000
     * @tc.name    Register listening in abilityA foreground,repeat the registration
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_1000", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1000 START-------------");
      TAG = "Singlehap_LifeCycleTest_1000";
      let id1;
      let id2;
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility6",
      }
      globalThis.abilityContext.startAbility(str)
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
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.abilityContext.startAbility(str1)
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
            console.log("------------Singlehap_LifeCycleTest_1000 END-------------");
            done();
          });
      }, 4500);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_1100
     * @tc.name    Register listening in abilityA foreground,repeat the registration (singleton)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_1100", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1100 START-------------");
      TAG = "Singlehap_LifeCycleTest_1100";
      let id1;
      let id2;
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility7",
      }
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        console.log(TAG + " firstCallback listKey : " + JSON.stringify(globalThis.list7));
        console.log(TAG + " firstCallback callbackid : " + JSON.stringify(globalThis.callbackid7));
        id1 = globalThis.callbackid7;
        console.log(TAG + " firstCallback id : " + JSON.stringify(id1));
        let str = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility7",
        }
        globalThis.abilityContext.startAbility(str)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 2000);
      setTimeout(function () {
        console.log(TAG + " secondCallback listKey : " + JSON.stringify(globalThis.list7));
        console.log(TAG + " secondCallback callbackid : " + JSON.stringify(globalThis.callbackid7));
        id2 = globalThis.callbackid7;
        console.log(TAG + " secondCallback id : " + JSON.stringify(id2));
        expect(id1).assertEqual(id2);
        globalThis.applicationContext7
          .unregisterAbilityLifecycleCallback(globalThis.callbackid7, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          });
        let para = {
          resultCode: 1,
          want: {
            "abilityName": "MainAbility1",
            "bundleName": "com.example.lifecycle_xts"
          }
        }
        console.log(TAG + " terminateSelfwithresult para: " + JSON.stringify(para));
        globalThis.ability7.terminateSelfWithResult(para, (error, data) => {
          console.log(TAG + " terminateSelfwithresult success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          console.log("------------Singlehap_LifeCycleTest_1100 END-------------");
          done();
        });
      }, 4000);
    });
    /*
     * @tc.number  Singlehap_LifeCycleTest_1200
     * @tc.name    Register listening in abilityA foreground,repeat the registration (standard)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_1200", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1200 START-------------");
      TAG = "Singlehap_LifeCycleTest_1200";
      let id1;
      let id2;
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility8",
      }
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        console.log(TAG + " firstCallback listKey : " + JSON.stringify(globalThis.list8));
        console.log(TAG + " firstCallback callbackid : " + JSON.stringify(globalThis.callbackid8));
        id1 = globalThis.callbackid8;
        console.log(TAG + " firstCallback id : " + JSON.stringify(id1));
        let str = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility8",
        }
        globalThis.abilityContext.startAbility(str)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
      }, 2000);
      setTimeout(function () {
        console.log(TAG + " secondCallback listKey : " + JSON.stringify(globalThis.list8));
        console.log(TAG + " secondCallback callbackid : " + JSON.stringify(globalThis.callbackid8));
        id2 = globalThis.callbackid8;
        console.log(TAG + " secondCallback id : " + JSON.stringify(id2));
        expect(id1 + 1).assertEqual(id2);
        globalThis.applicationContext8
          .unregisterAbilityLifecycleCallback(globalThis.callbackid8, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          });
        let para = {
          resultCode: 1,
          want: {
            "abilityName": "MainAbility8",
            "bundleName": "com.example.lifecycle_xts"
          }
        }
        console.log(TAG + " terminateSelfwithresult para: " + JSON.stringify(para));
        globalThis.ability8.terminateSelfWithResult(para, (error, data) => {
          console.log(TAG + " terminateSelfwithresult success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          console.log("------------Singlehap_LifeCycleTest_1200 END-------------");
          done();
        });
      }, 4000);
    });

    /*
    * @tc.number  Singlehap_LifeCycleTest_1300
    * @tc.name    The ability of HAP A listens to the ability lifecycle callback of HAP B (singleton)
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("Singlehap_LifeCycleTest_1300", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1300 start-------------");
      TAG = "Singlehap_LifeCycleTest_1300";
      listKeyTemp = [];
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycle_xts",
        abilityName: "MainAbility9"
      }, (error, data) => {
        console.log(TAG + ": MainAbility9 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      await sleep(500);
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycle_xts",
        abilityName: "Hap1MainAbility1"
      }, (error, data) => {
        console.log(TAG + ":first Hap1MainAbility1 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      await sleep(500);
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycle_xts",
        abilityName: "Hap1MainAbility1"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap1MainAbility1 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for (let i = 0; i < globalThis.mainAbility9ListKey.length; i++) {
            if (globalThis.mainAbility9ListKey[i].substring(0, 16) == "Hap1MainAbility1") {
              listKeyTemp.push(globalThis.mainAbility9ListKey[i]);
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "globalThis.mainAbility9CallBackId is :" + globalThis.mainAbility9CallBackId);
          expect(listKeyTemp[0]).assertEqual("Hap1MainAbility1 onAbilityCreate");
          expect(listKeyTemp[1]).assertEqual("Hap1MainAbility1 onWindowStageCreate");
          expect(listKeyTemp[2]).assertEqual("Hap1MainAbility1 onAbilityForeground");
          expect(listKeyTemp[3]).assertEqual("Hap1MainAbility1 onAbilityBackground");
          expect(listKeyTemp[4]).assertEqual("Hap1MainAbility1 onWindowStageDestroy");
          expect(listKeyTemp[5]).assertEqual("Hap1MainAbility1 onAbilityDestroy");
          globalThis.applicationContext9
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility9CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              done();
            });
        }, 3000)
      });
      console.log("------------Singlehap_LifeCycleTest_1300 end-------------");
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_1400
     * @tc.name    The ability of HAP A listens to the ability lifecycle callback of HAP B (standard)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_1400", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1400 start-------------");
      TAG = "Singlehap_LifeCycleTest_1400";
      listKeyTemp = [];
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycle_xts",
        abilityName: "MainAbility9"
      }, (error, data) => {
        console.log(TAG + ": MainAbility9 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      await sleep(500);
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycle_xts",
        abilityName: "Hap1MainAbility2"
      }, (error, data) => {
        console.log(TAG + ":first Hap1MainAbility2 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      await sleep(500);
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycle_xts",
        abilityName: "Hap1MainAbility2"
      }, (error, data) => {
        setTimeout(() => {
          console.log(TAG + ": second Hap1MainAbility2 startAbility success, err: " + JSON.stringify(error) +
          ",data: " + JSON.stringify(data));
          for (let i = 0;i < globalThis.mainAbility9ListKey.length; i++) {
            if (globalThis.mainAbility9ListKey[i].substring(0, 16) == "Hap1MainAbility2") {
              listKeyTemp.push(globalThis.mainAbility9ListKey[i]);
            }
          }
          console.log(TAG + "listKeyTemp is :" + listKeyTemp);
          console.log(TAG + "globalThis.mainAbility9CallBackId is :" + globalThis.mainAbility9CallBackId);
          expect(listKeyTemp[0]).assertEqual("Hap1MainAbility2 onAbilityCreate");
          expect(listKeyTemp[1]).assertEqual("Hap1MainAbility2 onWindowStageCreate");
          expect(listKeyTemp[2]).assertEqual("Hap1MainAbility2 onAbilityForeground");
          expect(listKeyTemp[3]).assertEqual("Hap1MainAbility2 onAbilityCreate");
          expect(listKeyTemp[4]).assertEqual("Hap1MainAbility2 onWindowStageCreate");
          expect(listKeyTemp[5]).assertEqual("Hap1MainAbility2 onAbilityForeground");
          expect(listKeyTemp[6]).assertEqual("Hap1MainAbility2 onAbilityBackground");
          expect(listKeyTemp[7]).assertEqual("Hap1MainAbility2 onWindowStageDestroy");
          expect(listKeyTemp[8]).assertEqual("Hap1MainAbility2 onAbilityDestroy");
          expect(listKeyTemp[9]).assertEqual("Hap1MainAbility2 onAbilityBackground");
          expect(listKeyTemp[10]).assertEqual("Hap1MainAbility2 onWindowStageDestroy");
          expect(listKeyTemp[11]).assertEqual("Hap1MainAbility2 onAbilityDestroy");
          globalThis.applicationContext9
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility9CallBackId, (error, data) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              done();
            });
        }, 3000)
      });
      console.log("------------Singlehap_LifeCycleTest_1400 end-------------");
    });
    /*
     * @tc.number  Singlehap_LifeCycleTest_1500
     * @tc.name    Register in abilityA , starting and termination AbilityB,Repeat previous steps (standard)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_1500", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1500 START-------------");
      TAG = "Singlehap_LifeCycleTest_1500";
      let id1;
      let id2;
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility11",
      }
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.abilityContext.startAbility(str1)
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
        let str = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility11",
        }
        globalThis.abilityContext.startAbility(str)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
        setTimeout(function () {
          let str1 = {
            "bundleName": "com.example.lifecycle_xts",
            "abilityName": "MainAbility2",
          }
          globalThis.abilityContext.startAbility(str1)
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
        let strtemp = "";
        let listtemp = [];
        for (let i = 0; i < globalThis.list11.length; i++) {
          strtemp = globalThis.list11[i].substring(0, 12);
          if (strtemp == "MainAbility2") {
            listtemp.push(globalThis.list11[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        let exlist = listtemp;
        expect(exlist[0]).assertEqual("MainAbility2 onAbilityCreate");
        expect(exlist[1]).assertEqual("MainAbility2 onWindowStageCreate");
        expect(exlist[2]).assertEqual("MainAbility2 onAbilityForeground");
        expect(exlist[3]).assertEqual("MainAbility2 onAbilityBackground");
        expect(exlist[4]).assertEqual("MainAbility2 onWindowStageDestroy");
        expect(exlist[5]).assertEqual("MainAbility2 onAbilityDestroy");
        expect(id1 + 1).assertEqual(id2);
        globalThis.applicationContext11
          .unregisterAbilityLifecycleCallback(globalThis.callbackid11, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            console.log("------------Singlehap_LifeCycleTest_1500 END-------------");
            done();
          });
      }, 6000);
    });

    let callbackid_NA = 100
    let callbackid_errorNum = -1
    let callbackid_errorType = "test"
    /*
     * @tc.number  Singlehap_LifeCycleTest_1600
     * @tc.name    input Nonexistent callbackid for unregisterAbilityLifecycleCallback parameter
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("Singlehap_LifeCycleTest_1600", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1600 START-------------");
      TAG = "Singlehap_LifeCycleTest_1600";
      let code;
      globalThis.abilityContext.getApplicationContext()
        .unregisterAbilityLifecycleCallback(callbackid_NA, (error, data) => {
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
    it("Singlehap_LifeCycleTest_1700", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1700 START-------------");
      TAG = "Singlehap_LifeCycleTest_1700";
      let code;
      globalThis.abilityContext.getApplicationContext()
        .unregisterAbilityLifecycleCallback(callbackid_errorNum, (error, data) => {
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
    it("Singlehap_LifeCycleTest_1800", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1800 START-------------");
      TAG = "Singlehap_LifeCycleTest_1800";
      let code;
      globalThis.abilityContext.getApplicationContext()
        .unregisterAbilityLifecycleCallback(callbackid_errorType, (error, data) => {
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
    it("Singlehap_LifeCycleTest_1900", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1900 START-------------");
      TAG = "Singlehap_LifeCycleTest_1900";
      let code;
      globalThis.abilityContext.getApplicationContext()
        .unregisterAbilityLifecycleCallback(null, (error, data) => {
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
    it("Singlehap_LifeCycleTest_2000", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_2000 START-------------");
      TAG = "Singlehap_LifeCycleTest_2000";
      let id1;
      let id2;
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility12",
      }
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility2",
        }
        globalThis.abilityContext.startAbility(str1)
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
        let para = {
          resultCode: 2000,
          want: {
            "abilityName": "MainAbility12",
            "bundleName": "com.example.lifecycle_xts"
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
        let str = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility12",
        }
        globalThis.abilityContext.startAbility(str)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
        setTimeout(function () {
          let str1 = {
            "bundleName": "com.example.lifecycle_xts",
            "abilityName": "MainAbility2",
          }
          globalThis.abilityContext.startAbility(str1)
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
        let strtemp = "";
        let listtemp = [];
        for (let i = 0; i < globalThis.list12.length; i++) {
          strtemp = globalThis.list12[i].substring(0, 12);
          if (strtemp == "MainAbility2") {
            listtemp.push(globalThis.list12[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        let exlist = listtemp;
        expect(exlist[0]).assertEqual("MainAbility2 onAbilityCreate");
        expect(exlist[1]).assertEqual("MainAbility2 onWindowStageCreate");
        expect(exlist[2]).assertEqual("MainAbility2 onAbilityForeground");
        expect(exlist[3]).assertEqual("MainAbility2 onAbilityBackground");
        expect(exlist[4]).assertEqual("MainAbility2 onWindowStageDestroy");
        expect(exlist[5]).assertEqual("MainAbility2 onAbilityDestroy");
        expect(id1 + 1).assertEqual(id2);
        globalThis.applicationContext12
          .unregisterAbilityLifecycleCallback(id2, (error, data) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
            console.log("------------Singlehap_LifeCycleTest_2000 END-------------");
            done();
          });
      }, 6200);
    });

    /*
    * @tc.number  Singlehap_LifeCycleTest_2100
    * @tc.name    Register in abilityA,register in abilityB, starting and termination abilityC,
                  termination abilityB、abilityA, Re-register in abilityA、abilityB
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("Singlehap_LifeCycleTest_2100", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_2100 START-------------");
      TAG = "Singlehap_LifeCycleTest_2100";
      let id1;
      let id2;
      let id3;
      let id4;
      let str = {
        "bundleName": "com.example.lifecycle_xts",
        "abilityName": "MainAbility1",
      }
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })
      setTimeout(function () {
        let str1 = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility12",
        }
        globalThis.abilityContext.startAbility(str1)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
        setTimeout(function () {
          let str2 = {
            "bundleName": "com.example.lifecycle_xts",
            "abilityName": "MainAbility2",
          }
          globalThis.abilityContext.startAbility(str2)
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
        let para = {
          resultCode: 2100,
          want: {
            "abilityName": "MainAbility12",
            "bundleName": "com.example.lifecycle_xts"
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
          let para = {
            resultCode: 2100,
            want: {
              "abilityName": "MainAbility1",
              "bundleName": "com.example.lifecycle_xts"
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
        let str = {
          "bundleName": "com.example.lifecycle_xts",
          "abilityName": "MainAbility1",
        }
        globalThis.abilityContext.startAbility(str)
          .then((data) => {
            console.info(TAG + ' start successful. Data: ' + data);
          }).catch((error) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })
        setTimeout(function () {
          let str1 = {
            "bundleName": "com.example.lifecycle_xts",
            "abilityName": "MainAbility12",
          }
          globalThis.abilityContext.startAbility(str1)
            .then((data) => {
              console.info(TAG + ' start successful. Data: ' + data);
            }).catch((error) => {
            console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
          })
          setTimeout(function () {
            let str2 = {
              "bundleName": "com.example.lifecycle_xts",
              "abilityName": "MainAbility2",
            }
            globalThis.abilityContext.startAbility(str2)
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
        let strtemp = "";
        let listtemp = [];
        let listtemp12 = [];
        for (let i = 0; i < templist1.length; i++) {
          strtemp = templist1[i].substring(0, 13);
          if (strtemp === "MainAbility2 ") {
            listtemp.push(templist1[i]);
          } else if (strtemp === "MainAbility12") {
            listtemp12.push(templist1[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        console.log(TAG + " listtemp12 is :" + JSON.stringify(listtemp12));
        setTimeout(function () {
          let strtemp1 = "";
          let listtemp1 = [];
          for (let j = 0; j < templist2.length; j++) {
            strtemp1 = templist2[j].substring(0, 12);
            if (strtemp1 === "MainAbility2") {
              listtemp1.push(templist2[j]);
            }
          }
          console.log(TAG + " listtemp1 is :" + JSON.stringify(listtemp1));
          let exlist = listtemp;
          let exlist12 = listtemp12;
          let exlist1 = listtemp1;
          expect(exlist[0]).assertEqual("MainAbility2 onAbilityCreate");
          expect(exlist[1]).assertEqual("MainAbility2 onWindowStageCreate");
          expect(exlist[2]).assertEqual("MainAbility2 onAbilityForeground");
          expect(exlist[3]).assertEqual("MainAbility2 onAbilityBackground");
          expect(exlist[4]).assertEqual("MainAbility2 onWindowStageDestroy");
          expect(exlist[5]).assertEqual("MainAbility2 onAbilityDestroy");
          expect(exlist12[0]).assertEqual("MainAbility12 onAbilityCreate");
          expect(exlist12[1]).assertEqual("MainAbility12 onWindowStageCreate");
          expect(exlist12[2]).assertEqual("MainAbility12 onAbilityForeground");
          expect(exlist12[3]).assertEqual("MainAbility12 onAbilityBackground");
          expect(exlist12[4]).assertEqual("MainAbility12 onAbilityForeground");
          expect(exlist1[0]).assertEqual("MainAbility2 onAbilityCreate");
          expect(exlist1[1]).assertEqual("MainAbility2 onWindowStageCreate");
          expect(exlist1[2]).assertEqual("MainAbility2 onAbilityForeground");
          expect(exlist1[3]).assertEqual("MainAbility2 onAbilityBackground");
          expect(exlist1[4]).assertEqual("MainAbility2 onWindowStageDestroy");
          expect(exlist1[5]).assertEqual("MainAbility2 onAbilityDestroy");
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
              console.log("------------Singlehap_LifeCycleTest_2100 END-------------");
              done();
            });
        }, 100);
      }, 7000);
    });

  })
}
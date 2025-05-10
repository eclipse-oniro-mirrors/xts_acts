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

export default function lifecycleTest(abilityContext) {
  describe('LifeCycleOneTest', function () {

    beforeEach(async function (done) {
      console.info('LifeCycleOneTest before each called');
      await sleep(1000);
      done()
    });

    afterEach(async function (done) {
      console.info('LifeCycleOneTest after each called');
      if ("Singlehap_LifeCycleTest_0200" === TAG || "Singlehap_LifeCycleTest_0300" === TAG
      || "Singlehap_LifeCycleTest_0500" === TAG || "Singlehap_LifeCycleTest_0600" === TAG
      || "Singlehap_LifeCycleTest_0800" === TAG || "Singlehap_LifeCycleTest_0900" === TAG) {
        var para = {
          resultCode: 2,
          want: {
            "abilityName": "MainAbility1",
            "bundleName": "com.example.lifecycle_xts"
          }
        }
        console.log("LifeCycleOneTest terminateSelfwithresult para: " + JSON.stringify(para));
        await globalThis.ability1context.terminateSelfWithResult(para)
          .then((data) => {
            console.log("LifeCycleOneTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          }).catch((error) => {
            console.log("LifeCycleOneTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      } else if ("Singlehap_LifeCycleTest_2000" === TAG) {
        var para1 = {
          resultCode: 2,
          want: {
            "abilityName": "MainAbility12",
            "bundleName": "com.example.lifecycle_xts"
          }
        }
        console.log("LifeCycleOneTest terminateSelfwithresult para: " + JSON.stringify(para1));
        await globalThis.ability12.terminateSelfWithResult(para1)
          .then((data) => {
            console.log("LifeCycleOneTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          }).catch((error) => {
            console.log("LifeCycleOneTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      }
      done();
    });

    var TAG = "";
    var listKeyTemp = ""

    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time))
    }

    /*
   * @tc.number  Singlehap_LifeCycleTest_0700
   * @tc.name    Multiple registration/unregistration
   * @tc.desc    Function test
   * @tc.level   0
   */
    it("Singlehap_LifeCycleTest_0700", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0700 START-------------");
      TAG = "Singlehap_LifeCycleTest_0700";
      var code1;
      var code2;
      var code3;
      var id1;
      var id2;
      var id3;
      var listKey8 = [];
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
  })
}
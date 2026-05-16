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
import eventBusPlus from '../lib/EventBusPlus';

const moduleName = "entry_test";
const otherBundle = "com.example.commontestabilityapp";
const otherModuleName = "feature";
let deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');

let TAG: string = "";
let tempCallbackId: number;

export default function lifecycleTest() {
  describe("LifeCycleTest", () => {
    beforeEach(async (done: Function) => {
      console.info("LifeCycleTest before each called");
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

        let ab1DestRely = eventBusPlus.onWait('MainAbility1_onDestroy');
        globalThis.ability1context
          .terminateSelf()
          .then((data: ESObject) => {
            console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          })
          .catch((error: BusinessError) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
        await ab1DestRely;
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
        let ab12DestRely = eventBusPlus.onWait('MainAbility12_onDestroy');
        globalThis.ability12
          .terminateSelf()
          .then((data: ESObject) => {
            console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          })
          .catch((error: BusinessError) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
        await ab12DestRely;
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

      let ab2OnForeRely = eventBusPlus.onWait('MainAbility2_onForeground');
      let ab2OnDestRely = eventBusPlus.onWait('MainAbility2_onDestroy');
      let stagOnAbDestRely = eventBusPlus.onWait('AbilityStage_onAbilityDestroy');
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await Promise.all([
        ab2OnForeRely,
        ab2OnDestRely,
        stagOnAbDestRely
      ]);

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

      let ab1OnForeRely = eventBusPlus.onWait('MainAbility1_onForeground');
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await ab1OnForeRely;

      let ab2OnForeRely = eventBusPlus.onWait('MainAbility2_onForeground');
      let ab2OnDestRely = eventBusPlus.onWait('MainAbility2_onDestroy');
      let ab2OnAbDestRely = eventBusPlus.onWait('MainAbility2In1_onAbilityDestroy');
      globalThis.abilityContext
        .startAbility(str1)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await Promise.all([
        ab2OnForeRely,
        ab2OnDestRely,
        ab2OnAbDestRely
      ]);

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
      globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, async (error: BusinessError) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + error);
        code = error ? error.code : 0;
        expect(code).assertEqual(0);
        console.log("------------Crossplatform_Singlehap_LifeCycleTest_0200 END-------------");
        done();
      });

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

      let ab1OnForeRely = eventBusPlus.onWait('MainAbility1_onForeground');
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await ab1OnForeRely;

      let ab2OnForeRely = eventBusPlus.onWait('MainAbility2_onForeground');
      let ab2OnDestRely = eventBusPlus.onWait('MainAbility2_onDestroy');
      let ab2OnAbDestRely = eventBusPlus.onWait('MainAbility2In1_onAbilityDestroy');
      globalThis.abilityContext
        .startAbility(str1)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await Promise.all([
        ab2OnForeRely,
        ab2OnDestRely,
        ab2OnAbDestRely
      ]);

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
        console.log(TAG + " secondunregister callbackid : " + JSON.stringify(globalThis.callbackid1));
        globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error: BusinessError) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
          code = error ? error.code : 0;
          expect(code).assertEqual(401);
          console.log("------------Crossplatform_Singlehap_LifeCycleTest_0300 END-------------");
          done();
        });
      });
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

      let ab3OnForeRely = eventBusPlus.onWait('MainAbility3_onForeground');
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start3 successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start3 failed. Cause: " + JSON.stringify(error));
        });
      await ab3OnForeRely;

      let ab2OnForeRely = eventBusPlus.onWait('MainAbility2_onForeground');
      let ab2OnDestRely = eventBusPlus.onWait('MainAbility2_onDestroy');
      let ab2OnAbDestRely = eventBusPlus.onWait('MainAbility2In3_onAbilityDestroy');
      globalThis.abilityContext
        .startAbility(str1)
        .then((data: ESObject) => {
          console.info(TAG + " start2 successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start2 failed. Cause: " + JSON.stringify(error));
        });
      await Promise.all([
        ab2OnForeRely,
        ab2OnDestRely,
        ab2OnAbDestRely
      ]);

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

      let ab3OnDestRely = eventBusPlus.onWait('MainAbility3_onDestroy');
      globalThis.ability3
        .terminateSelf()
        .then((data: ESObject) => {
          console.log(TAG + " terminateSelfwithresult successful data: " + JSON.stringify(data));
        })
        .catch((error: BusinessError) => {
          console.log(TAG + " terminateSelfwithresult error: " + JSON.stringify(error));
        });
      await ab3OnDestRely;
      done();
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

      let ab1OnForeRely = eventBusPlus.onWait('MainAbility1_onForeground');
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start1 successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start1 failed. Cause: " + JSON.stringify(error));
        });
      await ab1OnForeRely;

      let ab3OnForeRely = eventBusPlus.onWait('MainAbility3_onForeground');
      globalThis.abilityContext
        .startAbility(str1)
        .then((data: ESObject) => {
          console.info(TAG + " start3 successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start3 failed. Cause: " + JSON.stringify(error));
        });
      await ab3OnForeRely;

      let ab4OnForeRely = eventBusPlus.onWait('MainAbility4_onForeground');
      let ab3OnDestRely = eventBusPlus.onWait('MainAbility3_onDestroy');
      globalThis.abilityContext
        .startAbility(str2).then((data: ESObject) => {
        console.info(TAG + " start4 successful. Data: " + data);
      }).catch((error: BusinessError) => {
        console.info(TAG + " start4 failed. Cause: " + JSON.stringify(error));
      });
      globalThis.ability3.terminateSelf();
      await Promise.all([
        ab4OnForeRely,
        ab3OnDestRely
      ]);

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

      let ab1OnForeRely = eventBusPlus.onWait('MainAbility1_onForeground');
      globalThis.abilityContext
        .startAbility(str).then((data: ESObject) => {
        console.info(TAG + " start1 successful. Data: " + data);
      }).catch((error: BusinessError) => {
        console.info(TAG + " start1 failed. Cause: " + JSON.stringify(error));
      });
      await ab1OnForeRely;

      let ab5OnForeRely = eventBusPlus.onWait('MainAbility5_onForeground');
      let ab5OnDestRely = eventBusPlus.onWait('MainAbility5_onDestroy');
      globalThis.abilityContext
        .startAbility(str1).then((data: ESObject) => {
        console.info(TAG + " start5 successful. Data: " + data);
      }).catch((error: BusinessError) => {
        console.info(TAG + " start5 failed. Cause: " + JSON.stringify(error));
      });
      await Promise.all([
        ab5OnForeRely,
        ab5OnDestRely
      ]);

      let ab2OnForeRely = eventBusPlus.onWait('MainAbility2_onForeground');
      let ab2OnDestRely = eventBusPlus.onWait('MainAbility2_onDestroy');
      let ab2OnAbDestRely = eventBusPlus.onWait('MainAbility2In1_onAbilityDestroy');
      globalThis.abilityContext
        .startAbility(str2).then((data: ESObject) => {
        console.info(TAG + " start4 successful. Data: " + data);
      }).catch((error: BusinessError) => {
        console.info(TAG + " start4 failed. Cause: " + JSON.stringify(error));
      });
      await Promise.all([
        ab2OnForeRely,
        ab2OnDestRely,
        ab2OnAbDestRely
      ]);

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
      applicationContext.off("abilityLifecycle", id1, (error: BusinessError) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        code1 = error ? error.code : 0;

        id2 = applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
        console.log(TAG + " registerAbilityLifecycleCallback2 number: " + JSON.stringify(id2));
        applicationContext.off("abilityLifecycle", id2, (error: BusinessError) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
          code2 = error ? error.code : 0;

          id3 = applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
          console.log(TAG + " registerAbilityLifecycleCallback3 number: " + JSON.stringify(id3));
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
      let startAb2Count: number = 0;

      let ab1OnForeRely = eventBusPlus.onWait('MainAbility1_onForeground');
      globalThis.abilityContext
        .startAbility(str).then((data: ESObject) => {
        console.info(TAG + " start 1 successful. Data: " + data);
      }).catch((error: BusinessError) => {
        console.info(TAG + " start 1 failed. Cause: " + JSON.stringify(error));
      });
      await ab1OnForeRely;

      while (startAb2Count < 3) {
        let ab2OnForeRely = eventBusPlus.onWait('MainAbility2_onForeground');
        let ab2OnDestRely = eventBusPlus.onWait('MainAbility2_onDestroy');
        let ab2OnAbDestRely = eventBusPlus.onWait('MainAbility2In1_onAbilityDestroy');
        globalThis.abilityContext
          .startAbility(str1).then((data: ESObject) => {
          console.info(TAG + " start 2 successful. Data: " + data);
        }).catch((error: BusinessError) => {
          console.info(TAG + " start 2 failed. Cause: " + JSON.stringify(error));
        });
        await Promise.all([ab2OnForeRely, ab2OnDestRely, ab2OnAbDestRely]);
        startAb2Count ++;
      }

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
      // let mainAbility2FirstStart = false;
      // let mainAbility2FirstDestory = false;
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
      let startAb2Count: number = 0;

      let ab1OnForeRely = eventBusPlus.onWait('MainAbility1_onForeground');
      globalThis.abilityContext
        .startAbility(str).then((data: ESObject) => {
        console.info(TAG + " start 1 successful. Data: " + data);
      }).catch((error: BusinessError) => {
        console.info(TAG + " start 1 failed. Cause: " + JSON.stringify(error));
      });
      await ab1OnForeRely;

      while (startAb2Count < 2) {
        let ab2OnForeRely = eventBusPlus.onWait('MainAbility2_onForeground');
        let ab2OnDestRely = eventBusPlus.onWait('MainAbility2_onDestroy');
        let ab2OnAbDestRely = eventBusPlus.onWait('MainAbility2In1_onAbilityDestroy');
        globalThis.abilityContext
          .startAbility(str1).then((data: ESObject) => {
          console.info(TAG + " start 2 successful2. Data: " + data);
        }).catch((error: BusinessError) => {
          console.info(TAG + " start 2 failed2. Cause: " + JSON.stringify(error));
        });
        await Promise.all([
          ab2OnForeRely,
          ab2OnDestRely,
          ab2OnAbDestRely
        ]);
        startAb2Count ++;
      }

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

      let ab8OnForeRely = eventBusPlus.onWait('MainAbility8_onForeground');
      globalThis.abilityContext
        .startAbility(str).then((data: ESObject) => {
        console.info(TAG + " start successful. Data: " + data);
      }).catch((error: BusinessError) => {
        console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
      });
      await ab8OnForeRely;

      id1 = globalThis.callbackid8;
      console.log(TAG + " firstCallback id : " + JSON.stringify(id1));

      let ab8OnDestRely = eventBusPlus.onWait('MainAbility8_onDestroy');
      globalThis.ability8.terminateSelf((error: ESObject, data: ESObject) => {
        console.log(TAG + " terminateSelfwithresult success, err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
      });
      await ab8OnDestRely;

      let ab8OnForeRely2 = eventBusPlus.onWait('MainAbility8_onForeground');
      globalThis.abilityContext
        .startAbility(str).then((data: ESObject) => {
        console.info(TAG + " start successful. Data: " + data);
      }).catch((error: BusinessError) => {
        console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
      });
      await ab8OnForeRely2;

      id2 = globalThis.callbackid8;
      console.log(TAG + " secondCallback id : " + JSON.stringify(id2));
      let ab8OnDestRely2 = eventBusPlus.onWait('MainAbility8_onDestroy');
      globalThis.ability8.terminateSelf((error: ESObject, data: ESObject) => {
        console.log(TAG + " terminateSelfwithresult success, err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
      });
      await ab8OnDestRely2;

      expect(id1! + 1).assertEqual(id2);
      globalThis.applicationContext8.off("abilityLifecycle", id1, (error: BusinessError) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback success1, err: " + JSON.stringify(error));
        globalThis.applicationContext8.off("abilityLifecycle", id2, (error: BusinessError) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success2, err: " + JSON.stringify(error));
          console.log("------------Singlehap_LifeCycleTest_1200 END-------------");
          done();
        });
      });
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

      let ab9OnForeRely = eventBusPlus.onWait('MainAbility9_onForeground');
      globalThis.abilityContext.startAbility({
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility9",
        moduleName: moduleName,
      }, (error: ESObject, data: ESObject) => {
        console.log(TAG + ": MainAbility9 startAbility success, err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
      });
      await ab9OnForeRely;

      let hap1Ab2OnForeRely = eventBusPlus.onWait('Hap1MainAbility2_onForeground');
      let ab9OnDestRely = eventBusPlus.onWait('MainAbility9_onDestroy');
      let hap1Ab2OnDestRely = eventBusPlus.onWait('Hap1MainAbility2_onDestroy');
      globalThis.abilityContext.startAbility({
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "Hap1MainAbility2",
        moduleName: moduleName,
      }, (error: ESObject, data: ESObject) => {
        console.log(TAG + ":first Hap1MainAbility2 startAbility success, err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
      });
      globalThis.ability9.terminateSelf();
      await Promise.all([
        hap1Ab2OnForeRely,
        hap1Ab2OnDestRely,
        ab9OnDestRely
      ]);

      let hap1Ab2OnForeRely2 = eventBusPlus.onWait('Hap1MainAbility2_onForeground');
      let hap1Ab2OnDestRely2 = eventBusPlus.onWait('Hap1MainAbility2_onDestroy');
      globalThis.abilityContext.startAbility({
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "Hap1MainAbility2",
        moduleName: moduleName,
      }, (error: ESObject, data: ESObject) => {
        console.log(TAG + ":first Hap1MainAbility2 startAbility success, err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
      });
      await Promise.all([
        hap1Ab2OnForeRely2,
        hap1Ab2OnDestRely2
      ]);

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

      let ab1OnForeRely = eventBusPlus.onWait('MainAbility1_onForeground');
      globalThis.abilityContext
        .startAbility(str).then((data: ESObject) => {
        console.info(TAG + " start successful. Data: " + data);
      }).catch((error: BusinessError) => {
        console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
      });
      await ab1OnForeRely;

      let ab2OnForeRely = eventBusPlus.onWait('MainAbility2_onForeground');
      let ab2OnDestRely = eventBusPlus.onWait('MainAbility2_onDestroy');
      let ab2OnAbDestRely = eventBusPlus.onWait('MainAbility2In1_onAbilityDestroy');
      globalThis.abilityContext
        .startAbility(str2).then((data: ESObject) => {
        console.info(TAG + " start successful. Data: " + data);
      }).catch((error: BusinessError) => {
        console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
      });
      await Promise.all([
        ab2OnForeRely,
        ab2OnDestRely,
        ab2OnAbDestRely
      ]);

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
      let ab2OnForeRely = eventBusPlus.onWait('MainAbility2_onForeground');
      globalThis.abilityContext
        .startAbility(str).then(async (data: ESObject) => {
        console.info(TAG + " start successful. Data: " + data);
        await ab2OnForeRely;
        // abilitystage的onCreatre里注册了globalThis.applicationContext，globalThis.applicationContext不为null
        // 则oncreate触发成功,且context能够获取。
        console.log("AbilityStage_Context_Test_0100 1000" + JSON.stringify(globalThis.ability2));
        expect(globalThis.ability2 != null).assertTrue();
        console.log("AbilityStage_Context_Test_0100 1001");
        expect(globalThis.ability2.currentHapModuleInfo != null).assertTrue();
        console.log("AbilityStage_Context_Test_0100 1002");
        expect(globalThis.ability2.config != null).assertTrue();
        done();
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
      let multiAb1OnForeRely = eventBusPlus.onWait('MultiMainability1_onForeground');
      let multiAb1OnAbForeRely = eventBusPlus.onWait('MultiMainability1_onAbilityForeground');
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await Promise.all([
        multiAb1OnForeRely,
        multiAb1OnAbForeRely
      ]);

      let listtemp = JSON.stringify(globalThis.mlist1);
      console.info(TAG + "list:" + listtemp);
      expect(listtemp.indexOf("MultiMainability1 onWindowStageCreate") !== -1).assertTrue();
      expect(listtemp.indexOf("MultiMainability1 onAbilityForeground") !== -1).assertTrue();
      let multiAb1OnDestRely = eventBusPlus.onWait('MultiMainability1_onDestroy');
      globalThis.multiability1context.terminateSelf();
      await multiAb1OnDestRely;

      // 第二次起MultiMainability1
      let multiAb1OnForeRely2 = eventBusPlus.onWait('MultiMainability1_onForeground');
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await multiAb1OnForeRely2;

      listtemp = JSON.stringify(globalThis.mlist1);
      console.info(TAG + "list:" + listtemp);
      expect(listtemp.indexOf("MultiMainability1 onAbilityCreate") !== -1).assertTrue();
      expect(listtemp.indexOf("MultiMainability1 onWindowStageCreate") !== -1).assertTrue();
      let multiAb1OnDestRely2 = eventBusPlus.onWait('MultiMainability1_onDestroy');
      globalThis.multiability1context.terminateSelf();
      await multiAb1OnDestRely2;
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

      // 第一次起MainAbility13
      let ab13OnForeRely = eventBusPlus.onWait('MainAbility13_onForeground');
      let ab13OnAbForeRely = eventBusPlus.onWait('MainAbility13_onAbilityForeground');
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await Promise.all([
        ab13OnForeRely,
        ab13OnAbForeRely
      ]);
      console.log(TAG + "list1:" + globalThis.list13);
      const list1: string[] = globalThis.list13;
      console.log(TAG + "list2:" + globalThis.otherList13);
      const list2: string[] = globalThis.otherList13;
      expect(list1[0]).assertEqual(list2[0]);
      expect(list1[1]).assertEqual(list2[1]);
      expect(list1[2]).assertEqual(list2[2]);
      let ab13OnDestRely = eventBusPlus.onWait('MainAbility13_onDestroy');
      globalThis.ability13.terminateSelf();
      await ab13OnDestRely;
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
          eventBusPlus.emit('MainAbility_onAbilityDestroy');
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
      let ab14OnForeRely = eventBusPlus.onWait('MainAbility14_onForeground');
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await ab14OnForeRely;
      let applicationContext: common.ApplicationContext = globalThis.ability14.getApplicationContext() as common.ApplicationContext;

      for (let i = 0; i < 10; i++) {
        const tempId:number = applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
        console.log(TAG + " registerAbilityLifecycleCallback1 number: " + JSON.stringify(tempId));

        applicationContext.off("abilityLifecycle", tempId, (error: BusinessError) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        });
      }

      applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
      let ab14OnDestRely = eventBusPlus.onWait('MainAbility14_onDestroy');
      let ab14OnAbDestRely = eventBusPlus.onWait('MainAbility_onAbilityDestroy');
      globalThis.ability14.terminateSelf();
      await Promise.all([
        ab14OnDestRely,
        ab14OnAbDestRely
      ]);

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
      let ab1OnForeRely = eventBusPlus.onWait('MainAbility1_onForeground');
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await ab1OnForeRely;
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
      let featureMainAbOnForeRely = eventBusPlus.onWait('FeatureMainAbility_onForeground');
      let featureMainAbOnAbForeRely = eventBusPlus.onWait('FeatureMainAbility_onAbilityForeground');
      globalThis.abilityContext
        .startAbility(str)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
        
      await Promise.all([featureMainAbOnForeRely, featureMainAbOnAbForeRely]);
      console.info(TAG + "list:" + globalThis.featureList1);
      let listTemp = JSON.stringify(globalThis.featureList1)
      expect(listTemp.indexOf("FeatureMainAbility onWindowStageCreate") !== -1).assertTrue();
      expect(listTemp.indexOf("FeatureMainAbility onAbilityForeground") !== -1).assertTrue();
      let featureMainAbOnDestRely = eventBusPlus.onWait('FeatureMainAbility_onDestroy');
      globalThis.featureAbilityContext.terminateSelf();
      await featureMainAbOnDestRely;
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
      let ab1OnForeRely = eventBusPlus.onWait('MainAbility1_onForeground');
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

      await ab1OnForeRely;

      let commonMainAbOnForeRely = eventBusPlus.onWait('CommonMainAbility_onForeground');
      let commonMainAbOnDestRely = eventBusPlus.onWait('CommonMainAbility_onDestroy');
      globalThis.abilityContext
        .startAbility({
          bundleName: otherBundle,
          abilityName: "MainAbility",
          moduleName: "entry",
        }).then(async (data: ESObject) => {
        console.info(TAG + " start successful. Data: " + data);
        await Promise.all([
          commonMainAbOnForeRely,
          commonMainAbOnDestRely
        ]);
        done();
      }).catch((error: BusinessError) => {
        console.info(TAG + " start failed. Cause: " + JSON.stringify(error));
        expect().assertFail();
        done();
      });
    });
  });
}

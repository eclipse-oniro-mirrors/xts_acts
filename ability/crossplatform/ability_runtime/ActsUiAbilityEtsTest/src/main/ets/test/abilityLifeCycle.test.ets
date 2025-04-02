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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import aConstant from '@ohos.app.ability.AbilityConstant'
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

let deviceType = systemParameterEnhance.getSync('const.product.devicetype');

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

const moduleName = "entry_test";

export default function abilityTest() {
  describe("ActsAbilityLifeCycleTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    let TAG = "";
    const otherBundle = "com.example.commontestabilityapp";

    /**
     * @tc.number    : UI_ABILITY_CONTEXT_TEST_0001
     * @tc.name      : UI_Ability_Context_Test_0001
     * @tc.desc      : Test context.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("UI_Ability_Context_Test_0001", 0, async (done: Function) => {
      console.log("------------UI_ABILITY_CONTEXT_TEST_0001 START-------------");
      TAG = "UI_ABILITY_CONTEXT_TEST_0001";
      expect(globalThis.abilityContext != null).assertTrue();
      done();
    });

    /**
     * @tc.number    : UI_ABILITY_CONTEXT_TEST_0002
     * @tc.name      : UI_Ability_Context_Test_0002
     * @tc.desc      : Test context.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("UI_Ability_Context_Test_0002", 0, async (done: Function) => {
      console.log("------------UI_ABILITY_CONTEXT_TEST_0002 START-------------");
      TAG = "UI_ABILITY_CONTEXT_TEST_0002";
      expect(globalThis.abilityContext != null).assertTrue();
      expect(globalThis.abilityContext.startAbility != null).assertTrue();
      done();
    });

    /**
     * @tc.number    : UI_ABILITY_CONTEXT_TEST_0003
     * @tc.name      : UIAbilityContextTest_0003
     * @tc.desc      : Test context.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("UIAbilityContextTest_0003", 0, async (done: Function) => {
      console.log("------------UI_ABILITY_CONTEXT_TEST_0003 START-------------");
      TAG = "UI_ABILITY_CONTEXT_TEST_0003";
      expect(globalThis.abilityContext != null).assertTrue();
      expect(globalThis.abilityContext.terminateSelf != null).assertTrue();
      done();
    });

    /**
     * @tc.number    : UI_ABILITY_LIFE_CYCLE_TEST_0001
     * @tc.name      : UI_Ability_Life_Cycle_Test_0001
     * @tc.desc      : Only start 'MainAbility2', MainAbility2 will terminate self after 1.5 seconds.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("UI_Ability_Life_Cycle_Test_0001", 0, async (done: Function) => {
      console.log("------------UI_ABILITY_LIFE_CYCLE_TEST_0001 START-------------");
      TAG = "UI_ABILITY_LIFE_CYCLE_TEST_0001";

      let want: Want = {
        bundleName: "com.example.uiabilitylifecycle",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(want)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      // MainAbility2在1.5秒后，会终结自己，等待3.5s, 确保MainAbility2终结完自己
      await sleep(3500);

      const result2 = globalThis.list2;
      console.info("result2: " + JSON.stringify(result2));

      expect(result2[0]).assertEqual("MainAbility2 onCreate");
      expect(result2[1]).assertEqual("MainAbility2 onWindowStageCreate");
      expect(result2[2]).assertEqual("MainAbility2 onForeground");
      expect(result2[3]).assertEqual("MainAbility2 onBackground");
      expect(result2[4]).assertEqual("MainAbility2 onWindowStageDestroy");
      expect(result2[5]).assertEqual("MainAbility2 onDestroy");
      done();
    });

    /**
     * @tc.number    : UI_ABILITY_LIFE_CYCLE_TEST_0002
     * @tc.name      : UI_Ability_Life_Cycle_Test_0002
     * @tc.desc      : Only start 'MainAbility1'
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("UI_Ability_Life_Cycle_Test_0002", 0, async (done: Function) => {
      console.log("------------UI_ABILITY_LIFE_CYCLE_TEST_0002 START-------------");
      TAG = "UI_ABILITY_LIFE_CYCLE_TEST_0002";

      let want: Want = {
        bundleName: "com.example.uiabilitylifecycle",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(want)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(2500);

      const result1 = globalThis.list1;
      console.info("result1: " + JSON.stringify(result1));

      expect(result1[0]).assertEqual("MainAbility1 onCreate");
      expect(result1[1]).assertEqual("MainAbility1 onWindowStageCreate");
      expect(result1[2]).assertEqual("MainAbility1 onForeground");

      globalThis.ability1context.terminateSelf();
      await sleep(1000);
      expect(result1[3]).assertEqual("MainAbility1 onBackground");
      expect(result1[4]).assertEqual("MainAbility1 onWindowStageDestroy");
      expect(result1[5]).assertEqual("MainAbility1 onDestroy");
      done();
    });

    /**
     * @tc.number    : UI_ABILITY_LIFE_CYCLE_TEST_0003
     * @tc.name      : UI_Ability_Life_Cycle_Test_0003
     * @tc.desc      : start 'MainAbility2', after MainAbility2 terminated, start MainAbility1, after 2 seconds, terminate MainAbility1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("UI_Ability_Life_Cycle_Test_0003", 0, async (done: Function) => {
      console.log("------------UI_ABILITY_LIFE_CYCLE_TEST_0003 START-------------");
      TAG = "UI_ABILITY_LIFE_CYCLE_TEST_0003";

      let want: Want = {
        bundleName: "com.example.uiabilitylifecycle",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(want)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      // MainAbility2在1.5秒后，会终结自己，等待2.5s, 确保MainAbility2终结完自己
      await sleep(2500);

      let want1: Want = {
        bundleName: "com.example.uiabilitylifecycle",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(want1)
        .then((data: ESObject) => {
          console.info(TAG + " start MainAbility1 successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.error(TAG + " start MainAbility1 failed. Cause: " + JSON.stringify(error));
        });
      await sleep(2000);
      globalThis.ability1context.terminateSelf();
      await sleep(1000);

      const result1: string[] = globalThis.list1;
      const result2: string[] = globalThis.list2;
      console.info("result1: " + JSON.stringify(result1));
      console.info("result2: " + JSON.stringify(result2));

      expect(result2[0]).assertEqual("MainAbility2 onCreate");
      expect(result2[1]).assertEqual("MainAbility2 onWindowStageCreate");
      expect(result2[2]).assertEqual("MainAbility2 onForeground");
      expect(result2[3]).assertEqual("MainAbility2 onBackground");
      expect(result2[4]).assertEqual("MainAbility2 onWindowStageDestroy");
      expect(result2[5]).assertEqual("MainAbility2 onDestroy");

      expect(result1[0]).assertEqual("MainAbility1 onCreate");
      expect(result1[1]).assertEqual("MainAbility1 onWindowStageCreate");
      expect(result1[2]).assertEqual("MainAbility1 onForeground");
      expect(result1[3]).assertEqual("MainAbility1 onBackground");
      expect(result1[4]).assertEqual("MainAbility1 onWindowStageDestroy");
      expect(result1[5]).assertEqual("MainAbility1 onDestroy");
      done();
    });

    /**
     * @tc.number    : UI_ABILITY_LIFE_CYCLE_TEST_0004
     * @tc.name      : UI_Ability_Life_Cycle_Test_0004
     * @tc.desc      : start mainability1, after 1.5 seconds, start mainability2, after 1.5 seconds, mainability2 terminated.
     after 1 seconds, terminate mainability1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("UI_Ability_Life_Cycle_Test_0004", 0, async (done: Function) => {
      console.log("------------UI_ABILITY_LIFE_CYCLE_TEST_0004 START-------------");
      TAG = "UI_ABILITY_LIFE_CYCLE_TEST_0004";

      let want: Want = {
        bundleName: "com.example.uiabilitylifecycle",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(want)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      // 1.5秒后打开MainAbility2
      await sleep(1500);

      let want1: Want = {
        bundleName: "com.example.uiabilitylifecycle",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(want1)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(1000);

      const result1: string[] = globalThis.list1;
      console.info(TAG + "result1: " + JSON.stringify(result1));

      // 启动mainability2后，mainability1将会切到后台
      expect(result1[0]).assertEqual("MainAbility1 onCreate");
      expect(result1[1]).assertEqual("MainAbility1 onWindowStageCreate");
      expect(result1[2]).assertEqual("MainAbility1 onForeground");
      if (deviceType === '2in1') {
        done();
        return;
      }
      expect(result1[3]).assertEqual("MainAbility1 onBackground");

      // mainability2将会在1.5秒后，终结自己
      await sleep(2000);
      const result2: string[] = globalThis.list2;
      console.info(TAG + "result2: " + JSON.stringify(result2));

      expect(result2[0]).assertEqual("MainAbility2 onCreate");
      expect(result2[1]).assertEqual("MainAbility2 onWindowStageCreate");
      expect(result2[2]).assertEqual("MainAbility2 onForeground");
      expect(result2[3]).assertEqual("MainAbility2 onBackground");
      expect(result2[4]).assertEqual("MainAbility2 onWindowStageDestroy");
      expect(result2[5]).assertEqual("MainAbility2 onDestroy");

      // mainability1将会重新唤起
      await sleep(1000);
      console.info(TAG + "result1: " + JSON.stringify(result1));
      expect(result1[2]).assertEqual("MainAbility1 onForeground");

      await sleep(1000);
      globalThis.ability1context.terminateSelf();
      await sleep(1500);
      console.info(TAG + "result1: " + JSON.stringify(result1));
      expect(result1[5]).assertEqual("MainAbility1 onBackground");
      expect(result1[6]).assertEqual("MainAbility1 onWindowStageDestroy");
      expect(result1[7]).assertEqual("MainAbility1 onDestroy");
      done();
    });

    /**
     * @tc.number    : UI_ABILITY_LIFE_CYCLE_TEST_0005
     * @tc.name      : UI_Ability_Life_Cycle_Test_0005
     * @tc.desc      : start mainability1, after 1seconds, start other app mainability.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("UI_Ability_Life_Cycle_Test_0005", 0, async (done: Function) => {
      console.log("------------UI_ABILITY_LIFE_CYCLE_TEST_0005 START-------------");
      TAG = "UI_ABILITY_LIFE_CYCLE_TEST_0005";

      let want: Want = {
        bundleName: "com.example.uiabilitylifecycle",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(want)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(1000);

      const result1: string[] = globalThis.list1;
      console.info(TAG + "result1: " + JSON.stringify(result1));

      expect(result1[0]).assertEqual("MainAbility1 onCreate");
      expect(result1[1]).assertEqual("MainAbility1 onWindowStageCreate");
      expect(result1[2]).assertEqual("MainAbility1 onForeground");

      let want1: Want = {
        bundleName: otherBundle,
        abilityName: "MainAbility",
        moduleName: "entry_test",
      };
      let otherAppResult = 0;
      globalThis.abilityContext
        .startAbility(want1)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
          otherAppResult = 1;
        })
        .catch((error: BusinessError) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(3000);
      expect(otherAppResult == 1).assertTrue();
      done();
    });

    /**
     * @tc.number    : UI_ABILITY_LIFE_CYCLE_TEST_0006
     * @tc.name      : UI_Ability_Life_Cycle_Test_0006
     * @tc.desc      : start mainability3, after start mainability3 twice, mainability3 is a standard ability.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("UI_Ability_Life_Cycle_Test_0006", 0, async (done: Function) => {
      console.log("------------UI_ABILITY_LIFE_CYCLE_TEST_0006 START-------------");
      TAG = "UI_ABILITY_LIFE_CYCLE_TEST_0006";

      let want: Want = {
        bundleName: "com.example.uiabilitylifecycle",
        abilityName: "MainAbility3",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(want)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(1000);

      const result1: string[] = globalThis.list3;
      console.info(TAG + "result1: " + JSON.stringify(result1));

      expect(result1[0]).assertEqual("MainAbility3 onCreate");
      expect(result1[1]).assertEqual("MainAbility3 onWindowStageCreate");
      expect(result1[2]).assertEqual("MainAbility3 onForeground");

      globalThis.abilityContext
        .startAbility(want)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(1000);
      const result2: string[] = globalThis.list3;
      console.info(TAG + "result2: " + JSON.stringify(result2));
      expect(result2[0]).assertEqual("MainAbility3 onCreate");
      expect(result2[1]).assertEqual("MainAbility3 onWindowStageCreate");
      expect(result2[2]).assertEqual("MainAbility3 onForeground");

      globalThis.ability3context.terminateSelf();
      await sleep(500);
      done();
    });

    /**
     * @tc.number    : UI_ABILITY_LIFE_CYCLE_TEST_0007
     * @tc.name      : UIAbilityLifeCycleTest0007
     * @tc.desc      : start mainability1, after start mainability1 twice, mainability1 is a single ability.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('UI_ABILITY_LIFE_CYCLE_TEST_0007', 0, async (done: Function) => {
      console.log("------------UI_ABILITY_LIFE_CYCLE_TEST_0007 START-------------");
      TAG = "UI_ABILITY_LIFE_CYCLE_TEST_0007";

      let want: Want = {
        "bundleName": "com.example.uiabilitylifecycle",
        "abilityName": "MainAbility1",
        "moduleName": moduleName
      }
      await globalThis.abilityContext.startAbility(want)
        .then((data: ESObject) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error: BusinessError) => {
          console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
        })

      await sleep(2000);

      globalThis.abilityContext.startAbility(want)
        .then((data: ESObject) => {
          console.info(TAG + ' start successful. Data: ' + data);
        }).catch((error: BusinessError) => {
        console.error(TAG + ' start failed. Cause: ' + JSON.stringify(error));
      })

      await sleep(2000);
      const result: string = globalThis.onNewWantStr;
      console.info(TAG + 'result: ' + JSON.stringify(result));
      expect(result).assertEqual('MainAbility1 onNewWant');

      globalThis.ability1context.terminateSelf();
      await sleep(500);
      done();
    })

    /**
     * @tc.number    : UI_Ability_Constant_Test_0100
     * @tc.name      : UI_Ability_Constant_Test_0100
     * @tc.desc      : start mainability1, check ability constant.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("UI_Ability_Constant_Test_0100", 0, async (done: Function) => {
      console.log("------------UI_Ability_Constant_Test_0100 START-------------");
      TAG = "UI_Ability_Constant_Test_0100";

      let want: Want = {
        bundleName: "com.example.uiabilitylifecycle",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(want)
        .then((data: ESObject) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error: BusinessError) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(1000);

      console.log('UI_Ability_Constant_Test_0100:' + globalThis.launchParam1.lastExitReason)
      expect(globalThis.launchParam1.launchReason == 1).assertTrue();
      expect(globalThis.launchParam1.lastExitReason == 2).assertTrue();
      expect(aConstant.LaunchReason.UNKNOWN == 0).assertTrue();
      expect(aConstant.LastExitReason.UNKNOWN == 0).assertTrue();
      done();
    });

  });
}

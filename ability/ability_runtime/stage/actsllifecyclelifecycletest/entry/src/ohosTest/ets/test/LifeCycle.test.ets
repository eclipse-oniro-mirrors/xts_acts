/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import base from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityLifecycleCallback from '@ohos.app.ability.AbilityLifecycleCallback';
import { BusinessError } from '@ohos.base';

const TAG: string = 'ActsAbilityRunTimeLifeCycleTest';
let deviceSupport = '';
const TEST_SUITE_NAME: string = 'ActsLifeCycleTest'
function sleep(time:number):Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time))
}

function startAbilityTest(abilityName: string, tag: string) {
  globalThis.abilityContext.startAbility({
    bundleName: "com.ohos.actslifecycle",
    abilityName: abilityName
  }, (error:base.BusinessError, data:ESObject) => {
    hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${tag} ${abilityName} startAbility success, err:${JSON.stringify(error)}`);
  });
}

function getAbilityLifeCycleFilter(abilityName: string, TEST_CASE_NAME: string, listKey?: []) {
  hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} ${abilityName} list :${JSON.stringify(listKey)}`);
  let listKeyTemp:string[] = [];
  let temListKey = listKey
  if (!temListKey) {
    temListKey = globalThis.mainAbilityAListKey
  }
  for (let i = 0; i < temListKey!.length; i++) {
    let item: string = temListKey![i]
    if (item.includes(abilityName)) {
      let index = listKeyTemp.indexOf(item);
      if (index === -1) {
        listKeyTemp.push(item);
      }
    }
  }
  hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} ${abilityName} list :${JSON.stringify(listKeyTemp)}`);
  return listKeyTemp
}

function clearAbilityLifeCycle(listKey?: []) {
  let temListKey = listKey
  if (!temListKey) {
    temListKey = globalThis.mainAbilityAListKey
  }
  temListKey!.splice(0, temListKey!.length)
}

function getStageLifeCycleFilter(abilityName: string, TEST_CASE_NAME: string) {
  let listKeyTemp:string[] = [];
  for (let i = 0; i < globalThis.mainAbilityStageListKey.length; i++) {
    let item: string = globalThis.mainAbilityStageListKey[i]
    if (item.includes(abilityName)) {
      let index = listKeyTemp.indexOf(item);
      if (index === -1) {
        listKeyTemp.push(item);
      }
    }
  }
  hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} ${abilityName} Stage list :${JSON.stringify(listKeyTemp)}`);
  return listKeyTemp
}


function getAbilityLastLifeCycle(abilityName: string) {
  for (let i = globalThis.mainAbilityAListKey.length - 1; i >= 0; i--) {
    let item: string = globalThis.mainAbilityAListKey[i]
    if (item.includes(abilityName)) {
      return item
    }
  }
  return ""
}

export default function abilityTest() {
  describe('ActsAbilityTest', ()=> {
 
    let TEST_CASE_NAME: string = '';
    let isTerminateSelfMainAbilityA = false;
    let isTerminateSelfMainAbilityB = false;
    let isTerminateSelfMainAbilityC = false;
    let isTerminateSelfSingle1 = false;
    let isTerminateSelfMultitonA = false;
    let isTerminateSelfMainAbility3Multition = false;

    beforeEach(async (done:Function) => {
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} beforeEach...`);
      deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} deviceSupport...${deviceSupport}`);
      await sleep(1000);
      done()
    })

    afterEach(async (done:Function) => {
      if (isTerminateSelfMainAbilityA) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} abilityAContext terminateSelf start `);
        await globalThis.abilityAContext.terminateSelf()
        isTerminateSelfMainAbilityA = false;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} abilityAContext terminateSelf end`);
      }
      if (isTerminateSelfMainAbilityB) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} abilityBContext terminateSelf start `);
        await globalThis.abilityBContext.terminateSelf();
        isTerminateSelfMainAbilityB = false;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} abilityBContext terminateSelf`);
      }
      if (isTerminateSelfMainAbilityC) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} abilityCContext terminateSelf start `);
        await globalThis.abilityCContext.terminateSelf()
        isTerminateSelfMainAbilityC = false;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} abilityCContext terminateSelf`);
      }
      if (isTerminateSelfSingle1) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} abilitySingle1Context terminateSelf start `);
        await globalThis.abilitySingle1Context.terminateSelf()
        isTerminateSelfSingle1 = false;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} abilitySingle1Context terminateSelf`);
      }
      if (isTerminateSelfMultitonA) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} abilityMultitonAContext terminateSelf start `);
        await globalThis.mainAbilityMultitionAContexts.forEach((item:common.UIAbilityContext):void => {
          item.terminateSelf()
        })
        globalThis.mainAbilityMultitionAContexts.splice(0, globalThis.mainAbilityMultitionAContexts.length)
        isTerminateSelfMultitonA = false;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} abilityMultitonAContext terminateSelf`);
      }
      if (isTerminateSelfMainAbility3Multition) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} MainAbility3 terminateSelf start `);
        await globalThis.mainAbility3Contexts.forEach((item:common.UIAbilityContext) => {
          item.terminateSelf()
        })
        globalThis.mainAbility3Contexts.splice(0, globalThis.mainAbility3Contexts.length)
        isTerminateSelfMainAbility3Multition = false;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} MainAbility3 terminateSelf`);
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} afterEach...`);
      done()
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0100
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0100
     * @tc.desc   Register listening in AbilityA and pull yourself (single example)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0100', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0100';

      startAbilityTest("MainAbilityA", TEST_CASE_NAME)

      await sleep(1000);

      let callBackId1:number = globalThis.mainAbilityACallBackId

      startAbilityTest("MainAbilityA", TEST_CASE_NAME)

      await sleep(1000);

      let callBackId2:number = globalThis.mainAbilityACallBackId
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} MainAbilityA callBackId1:${callBackId1} callBackId2:${callBackId2}`);

      expect(callBackId1 === callBackId2);

      isTerminateSelfMainAbilityA = true;
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0500
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0500
     * @tc.desc   AbilityA registers for listening, AbilityB registers for listening,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0500', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0500';

      startAbilityTest("MainAbilityA", TEST_CASE_NAME)
      await sleep(1000);

      startAbilityTest("MainAbilityB", TEST_CASE_NAME)
      await sleep(1000);
      let callBackIdB:number = globalThis.mainAbilityBCallBackId
      await sleep(1000);
      globalThis.ApplicationContextB
        .unregisterAbilityLifecycleCallback(globalThis.callBackIdB, (error:base.BusinessError, data:ESObject) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback success,
            err:  ${JSON.stringify(error)} ",data: ${JSON.stringify(data)}`);
        });

      startAbilityTest("MainAbilityC", TEST_CASE_NAME)
      await sleep(1000);

      let callBackIdC:number = globalThis.mainAbilityCCallBackId

      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  callBackIdB:${callBackIdB} callBackIdC:${callBackIdC}`);

      expect(callBackIdB === (callBackIdC - 1))

      isTerminateSelfMainAbilityA = true;
      isTerminateSelfMainAbilityB = true;
      isTerminateSelfMainAbilityC = true;
      done()
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0600
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0600
     * @tc.desc   In the same application, AbilityA registers for listening, starts AbilityB, starts AbilityC, stops AbilityB, and stops AbilityC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0600', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0600';
      let listKeyTemp:string[] = [];
      startAbilityTest("MainAbilityA", TEST_CASE_NAME)
      await sleep(1000);

      startAbilityTest("MainAbilityB", TEST_CASE_NAME)
      await sleep(2000);

      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[0]).assertEqual("MainAbilityB onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityB onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityB onAbilityForeground");

      startAbilityTest("MainAbilityC", TEST_CASE_NAME)
      await sleep(2000);


      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityC", TEST_CASE_NAME)
      expect(listKeyTemp[0]).assertEqual("MainAbilityC onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityC onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityC onAbilityForeground");

      globalThis.abilityBContext.terminateSelf()
      await sleep(500);

      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[3]).assertEqual("MainAbilityB onAbilityBackground");
      let transferStr0 = listKeyTemp[4] + listKeyTemp[5];
      expect(transferStr0.indexOf("MainAbilityB onWindowStageDestroy") != -1).assertTrue();
      expect(transferStr0.indexOf("MainAbilityB onAbilityDestroy") != -1).assertTrue();

      globalThis.abilityCContext.terminateSelf()
      await sleep(500);

      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityC", TEST_CASE_NAME)
      expect(listKeyTemp[3]).assertEqual("MainAbilityC onAbilityBackground");
      transferStr0 = listKeyTemp[4] + listKeyTemp[5];
      expect(transferStr0.indexOf("MainAbilityC onWindowStageDestroy") != -1).assertTrue();
      expect(transferStr0.indexOf("MainAbilityC onAbilityDestroy") != -1).assertTrue();
      isTerminateSelfMainAbilityA = true;
      done()
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0700
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0700
     * @tc.desc   start AbilityA, register listening in AbilityA, start and stop AbilityB, unregister, and then unregister again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0700', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0700';
      let listKeyTemp:string[] = [];
      startAbilityTest("MainAbilityA", TEST_CASE_NAME)
      await sleep(1000);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityA", TEST_CASE_NAME);
      let listKeyTemp1 = JSON.stringify(listKeyTemp);
      expect(listKeyTemp1.indexOf("MainAbilityA onWindowStageCreate") !== -1).assertTrue();
      expect(listKeyTemp1.indexOf("MainAbilityA onAbilityForeground") !== -1).assertTrue();

      startAbilityTest("MainAbilityB", TEST_CASE_NAME)
      await sleep(500);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[0]).assertEqual("MainAbilityB onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityB onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityB onAbilityForeground");

      if (deviceSupport != 'false') {
        listKeyTemp = getAbilityLifeCycleFilter("MainAbilityA", TEST_CASE_NAME);
        listKeyTemp1 = JSON.stringify(listKeyTemp);
        expect(listKeyTemp1.indexOf("MainAbilityA onAbilityBackground") !== -1).assertTrue();
      }

      globalThis.abilityBContext.terminateSelf()
      await sleep(500);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[3]).assertEqual("MainAbilityB onAbilityBackground");
      let transferStr0 = listKeyTemp[4] + listKeyTemp[5];
      expect(transferStr0.indexOf("MainAbilityB onWindowStageDestroy") != -1).assertTrue();
      expect(transferStr0.indexOf("MainAbilityB onAbilityDestroy") != -1).assertTrue();

      if (deviceSupport != 'false') {
        let last = getAbilityLastLifeCycle("MainAbilityA")
        expect(last).assertEqual("MainAbilityA onAbilityForeground");
      }

      isTerminateSelfMainAbilityA = true;
      globalThis.ApplicationContextA
        .unregisterAbilityLifecycleCallback(globalThis.mainAbilityACallBackId, (error:base.BusinessError, data:ESObject) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback success,
            err:  ${JSON.stringify(error)} ",data: ${JSON.stringify(data)}`);
          expect(error.code).assertEqual(0);
          globalThis.ApplicationContextA
            .unregisterAbilityLifecycleCallback(globalThis.mainAbilityACallBackId, (error:base.BusinessError, data:ESObject) => {
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback success,
                err:  ${JSON.stringify(error)} ",data: ${JSON.stringify(data)}`);
              expect(error.code).assertEqual(1);
              done()
            });
        });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0800
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0800
     * @tc.desc   In the same application, start AbilityA, register listening in AbilityA, start and stop AbilityB, destroy AbilityA, and then unregister
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0800', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0800';
      let listKeyTemp:string[] = [];
      startAbilityTest("MainAbilityA", TEST_CASE_NAME)
      await sleep(1000);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityA", TEST_CASE_NAME)
      let listKeyTemp1 = JSON.stringify(listKeyTemp);
      expect(listKeyTemp1.indexOf("MainAbilityA onWindowStageCreate") !== -1).assertTrue();
      expect(listKeyTemp1.indexOf("MainAbilityA onAbilityForeground") !== -1).assertTrue();

      startAbilityTest("MainAbilityB", TEST_CASE_NAME)
      await sleep(500);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[0]).assertEqual("MainAbilityB onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityB onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityB onAbilityForeground");

      if (deviceSupport != 'false') {
        listKeyTemp = getAbilityLifeCycleFilter("MainAbilityA", TEST_CASE_NAME)
        listKeyTemp1 = JSON.stringify(listKeyTemp);
        expect(listKeyTemp1.indexOf("MainAbilityA onAbilityBackground") !== -1).assertTrue();
      }

      globalThis.abilityBContext.terminateSelf()
      await sleep(500);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[3]).assertEqual("MainAbilityB onAbilityBackground");
      let transferStr0 = listKeyTemp[4] + listKeyTemp[5];
      expect(transferStr0.indexOf("MainAbilityB onWindowStageDestroy") != -1).assertTrue();
      expect(transferStr0.indexOf("MainAbilityB onAbilityDestroy") != -1).assertTrue();

      if (deviceSupport != 'false') {
        let last = getAbilityLastLifeCycle("MainAbilityA")
        expect(last).assertEqual("MainAbilityA onAbilityForeground");
      }

      await sleep(3000);
      globalThis.abilityAContext.terminateSelf()
      globalThis.ApplicationContextA
        .unregisterAbilityLifecycleCallback(globalThis.mainAbilityACallBackId, (error:base.BusinessError, data:ESObject) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback success,
            err:  ${JSON.stringify(error)} ",data: ${JSON.stringify(data)}`);
          expect(error.code).assertEqual(0);
          done()
        });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0900
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0900
     * @tc.desc   In the same application, start AbilityA, register listening in AbilityA, start and stop AbilityB, and unregister
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0900', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_0900';
      let listKeyTemp:string[] = [];
      startAbilityTest("MainAbilityA", TEST_CASE_NAME)
      await sleep(1000);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityA", TEST_CASE_NAME)
      let listKeyTemp1 = JSON.stringify(listKeyTemp);
      expect(listKeyTemp1.indexOf("MainAbilityA onWindowStageCreate") !== -1).assertTrue();
      expect(listKeyTemp1.indexOf("MainAbilityA onAbilityForeground") !== -1).assertTrue();

      startAbilityTest("MainAbilityB", TEST_CASE_NAME)
      await sleep(500);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[0]).assertEqual("MainAbilityB onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityB onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityB onAbilityForeground");

      if (deviceSupport != 'false') {
        listKeyTemp = getAbilityLifeCycleFilter("MainAbilityA", TEST_CASE_NAME)
        listKeyTemp1 = JSON.stringify(listKeyTemp);
        expect(listKeyTemp1.indexOf("MainAbilityA onAbilityBackground") !== -1).assertTrue();
      }

      globalThis.abilityBContext.terminateSelf()
      await sleep(500);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[3]).assertEqual("MainAbilityB onAbilityBackground");
      let transferStr0 = listKeyTemp[4] + listKeyTemp[5];
      expect(transferStr0.indexOf("MainAbilityB onWindowStageDestroy") != -1).assertTrue();
      expect(transferStr0.indexOf("MainAbilityB onAbilityDestroy") != -1).assertTrue();

      if (deviceSupport != 'false') {
        let last = getAbilityLastLifeCycle("MainAbilityA")
        expect(last).assertEqual("MainAbilityA onAbilityForeground");
      }

      isTerminateSelfMainAbilityA = true;
      globalThis.ApplicationContextA
        .unregisterAbilityLifecycleCallback(globalThis.mainAbilityACallBackId, (error:base.BusinessError, data:ESObject) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback success,
            err:  ${JSON.stringify(error)} ",data: ${JSON.stringify(data)}`);
          expect(error.code).assertEqual(0);
          globalThis.ApplicationContextA
            .unregisterAbilityLifecycleCallback(globalThis.mainAbilityACallBackId, (error:base.BusinessError, data:ESObject) => {
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback success,
                err:  ${JSON.stringify(error)} ",data: ${JSON.stringify(data)}`);
              done()
            });
        });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1000
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1000
     * @tc.desc   older under the application folder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1000', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1000';
      let listKeyTemp:string[] = [];
      startAbilityTest("MainAbilityA", TEST_CASE_NAME)
      await sleep(1000);
      listKeyTemp = getStageLifeCycleFilter("MainAbilityA", TEST_CASE_NAME)
      expect(listKeyTemp[0]).assertEqual("MainAbilityA onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityA onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityA onAbilityForeground");

      await sleep(500);
      globalThis.abilityAContext.terminateSelf()
      await sleep(500);
      listKeyTemp = getStageLifeCycleFilter("MainAbilityA", TEST_CASE_NAME)
      expect(listKeyTemp[3]).assertEqual("MainAbilityA onAbilityBackground");
      let transferStr0 = listKeyTemp[4] + listKeyTemp[5];
      expect(transferStr0.indexOf("MainAbilityA onWindowStageDestroy") != -1).assertTrue();
      expect(transferStr0.indexOf("MainAbilityA onAbilityDestroy") != -1).assertTrue();

      globalThis.ApplicationContextStage
        .unregisterAbilityLifecycleCallback(globalThis.mainAbilityStageCallBackId, (error:base.BusinessError, data:ESObject) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback success,
            err:  ${JSON.stringify(error)} ",data: ${JSON.stringify(data)}`);
          expect(error.code).assertEqual(0);
          done()
        });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1100
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1100
     * @tc.desc   switch the ability to the front and back ends
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1100', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1100';
      if (deviceSupport != 'false') {
        startAbilityTest("MainAbilityA", TEST_CASE_NAME)
        await sleep(1000);
        startAbilityTest("MainAbilityB", TEST_CASE_NAME)
        await sleep(1000);
        let last = getAbilityLastLifeCycle("MainAbilityA")
        expect(last).assertEqual("MainAbilityA onAbilityBackground");

        globalThis.abilityBContext.terminateSelf()
        await sleep(500);
        last = getAbilityLastLifeCycle("MainAbilityA")
        expect(last).assertEqual("MainAbilityA onAbilityForeground");

        startAbilityTest("MainAbilityB", TEST_CASE_NAME)
        await sleep(1000);
        last = getAbilityLastLifeCycle("MainAbilityA")
        expect(last).assertEqual("MainAbilityA onAbilityBackground");

        globalThis.abilityBContext.terminateSelf()
        await sleep(500);
        last = getAbilityLastLifeCycle("MainAbilityA")
        expect(last).assertEqual("MainAbilityA onAbilityForeground");
        isTerminateSelfMainAbilityA = true;
      }
      done()
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1200
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1200
     * @tc.desc   repeat start stop capability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1200', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1200';
      startAbilityTest("MainAbilityA", TEST_CASE_NAME)
      await sleep(1000);
      let listKeyTemp: string[] = [];
      startAbilityTest("MainAbilityB", TEST_CASE_NAME)
      await sleep(1000);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[0]).assertEqual("MainAbilityB onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityB onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityB onAbilityForeground");

      globalThis.abilityBContext.terminateSelf()
      await sleep(500);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[3]).assertEqual("MainAbilityB onAbilityBackground");
      let transferStr0 = listKeyTemp[4] + listKeyTemp[5];
      expect(transferStr0.indexOf("MainAbilityB onWindowStageDestroy") != -1).assertTrue();
      expect(transferStr0.indexOf("MainAbilityB onAbilityDestroy") != -1).assertTrue();

      clearAbilityLifeCycle()
      startAbilityTest("MainAbilityB", TEST_CASE_NAME)
      await sleep(1000);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[0]).assertEqual("MainAbilityB onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityB onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityB onAbilityForeground");

      await globalThis.abilityBContext.terminateSelf()
      await sleep(500);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[3]).assertEqual("MainAbilityB onAbilityBackground");
      transferStr0 = listKeyTemp[4] + listKeyTemp[5];
      expect(transferStr0.indexOf("MainAbilityB onWindowStageDestroy") != -1).assertTrue();
      expect(transferStr0.indexOf("MainAbilityB onAbilityDestroy") != -1).assertTrue();
      isTerminateSelfMainAbilityA = true;
      done()
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1300
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1300
     * @tc.desc   In the same application, repeatedly starting Ability (single instance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1300', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1300';
      startAbilityTest("MainAbilityA", TEST_CASE_NAME)
      await sleep(1000);
      let listKeyTemp :string[] = [];
      startAbilityTest("MainAbilitySingle1", TEST_CASE_NAME)
      await sleep(1000);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilitySingle1", TEST_CASE_NAME)
      expect(listKeyTemp[0]).assertEqual("MainAbilitySingle1 onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilitySingle1 onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilitySingle1 onAbilityForeground");

      clearAbilityLifeCycle()
      startAbilityTest("MainAbilitySingle1", TEST_CASE_NAME)
      await sleep(1000);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilitySingle1", TEST_CASE_NAME)
      expect(listKeyTemp.length).assertEqual(0);
      isTerminateSelfMainAbilityA = true;
      isTerminateSelfSingle1 = true;
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1400
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1400
     * @tc.desc   Repeatedly starting Ability in the same application (multiple examples)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1400', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1400';
      startAbilityTest("MainAbilityA", TEST_CASE_NAME)
      await sleep(1000);
      let listKeyTemp :string[] = [];
      startAbilityTest("MainAbility3", TEST_CASE_NAME)
      await sleep(1000);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbility3", TEST_CASE_NAME)
      expect(listKeyTemp[0]).assertEqual("MainAbility3 onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbility3 onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbility3 onAbilityForeground");

      clearAbilityLifeCycle()
      startAbilityTest("MainAbility3", TEST_CASE_NAME)
      await sleep(1000);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbility3", TEST_CASE_NAME)
      let listKeyTempStr = JSON.stringify(listKeyTemp)
      expect(listKeyTempStr.indexOf("MainAbility3 onAbilityCreate") != -1).assertEqual(true);
      expect(listKeyTempStr.indexOf("MainAbility3 onWindowStageCreate") != -1).assertEqual(true);
      expect(listKeyTempStr.indexOf("MainAbility3 onAbilityForeground") != -1).assertEqual(true);
      isTerminateSelfMainAbilityA = true;
      isTerminateSelfMainAbility3Multition = true;
      done()
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1500
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1500
     * @tc.desc   destroy activityA, and then pull up activityA to register again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1500', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1500';
      startAbilityTest("MainAbilityA", TEST_CASE_NAME)
      await sleep(1000);
      let listKeyTemp:string[] = [];
      let callBackId1:number = globalThis.mainAbilityACallBackId
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} MainAbilityA callBackId1:${callBackId1}`);
      startAbilityTest("MainAbilityB", TEST_CASE_NAME)
      await sleep(500);
      await globalThis.abilityBContext.terminateSelf()
      await sleep(2500);

      await globalThis.abilityAContext.terminateSelf()
      await sleep(2000);
      startAbilityTest("MainAbilityA", TEST_CASE_NAME)
      await sleep(1000);
      let callBackId2:number = globalThis.mainAbilityACallBackId
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} MainAbilityA callBackId1:${callBackId1} callBackId2:${callBackId2}`);
      expect(callBackId1 === (callBackId2 - 1))

      clearAbilityLifeCycle()
      startAbilityTest("MainAbilityB", TEST_CASE_NAME)
      await sleep(1000);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[0]).assertEqual("MainAbilityB onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityB onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityB onAbilityForeground");

      await globalThis.abilityBContext.terminateSelf()
      await sleep(500);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME)
      expect(listKeyTemp[3]).assertEqual("MainAbilityB onAbilityBackground");
      let transferStr0 = listKeyTemp[4] + listKeyTemp[5];
      expect(transferStr0.indexOf("MainAbilityB onWindowStageDestroy") != -1).assertTrue();
      expect(transferStr0.indexOf("MainAbilityB onAbilityDestroy") != -1).assertTrue();
      isTerminateSelfMainAbilityA = true;
      done()
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1600
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1600
     * @tc.desc   and register listening repeatedly (multiple examples)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1600', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1600';
      startAbilityTest("MainAbilityMultitonA", TEST_CASE_NAME)
      await sleep(1000);
      let listKeyTemp :string[] = [];
      let callBackId1:number = globalThis.mainMultitonAbilityACallBackId
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} MainAbilityA callBackId1:${callBackId1}`);
      startAbilityTest("MainAbilityC", TEST_CASE_NAME)
      await sleep(1000);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityC", TEST_CASE_NAME, globalThis.mainMultitonAbilityAListKey)
      expect(listKeyTemp[0]).assertEqual("MainAbilityC onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityC onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityC onAbilityForeground");

      await globalThis.abilityCContext.terminateSelf()
      await sleep(500);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityC", TEST_CASE_NAME, globalThis.mainMultitonAbilityAListKey)
      expect(listKeyTemp[3]).assertEqual("MainAbilityC onAbilityBackground");
      let transferStr0 = listKeyTemp[4] + listKeyTemp[5];
      expect(transferStr0.indexOf("MainAbilityC onWindowStageDestroy") != -1).assertTrue();
      expect(transferStr0.indexOf("MainAbilityC onAbilityDestroy") != -1).assertTrue();

      startAbilityTest("MainAbilityMultitonA", TEST_CASE_NAME)
      await sleep(1000);
      clearAbilityLifeCycle(globalThis.mainMultitonAbilityAListKey)

      startAbilityTest("MainAbilityC", TEST_CASE_NAME)
      await sleep(1000);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityC", TEST_CASE_NAME, globalThis.mainMultitonAbilityAListKey)
      expect(listKeyTemp[0]).assertEqual("MainAbilityC onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityC onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityC onAbilityForeground");

      await globalThis.abilityCContext.terminateSelf()
      await sleep(500);
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityC", TEST_CASE_NAME, globalThis.mainMultitonAbilityAListKey)
      expect(listKeyTemp[3]).assertEqual("MainAbilityC onAbilityBackground");
      transferStr0 = listKeyTemp[4] + listKeyTemp[5];
      expect(transferStr0.indexOf("MainAbilityC onWindowStageDestroy") != -1).assertTrue();
      expect(transferStr0.indexOf("MainAbilityC onAbilityDestroy") != -1).assertTrue();

      let callBackId2:number = globalThis.mainMultitonAbilityACallBackId
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} MainAbilityMultitonA callBackId1:${callBackId1} callBackId2:${callBackId2}`);
      expect(callBackId1 === (callBackId2 - 1))
      isTerminateSelfMultitonA = true;
      done()
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1700
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1700
     * @tc.desc   Register listening in activityA, start activityB, register listening in activityB, start and stop activityC,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1700', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1700';
      startAbilityTest("MainAbilityA", TEST_CASE_NAME)
      await sleep(1000);
      let listKeyTemp:string[] = [];
      let curCallBackId:number = globalThis.mainAbilityACallBackId
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} MainAbilityA callBackId:${curCallBackId}`);
      startAbilityTest("MainAbilityB", TEST_CASE_NAME)
      await sleep(1000);
      let callBackIdB1:number = globalThis.mainAbilityBCallBackId
      curCallBackId = callBackIdB1
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} MainAbilityA callBackIdB1:${callBackIdB1}`);

      startAbilityTest("MainAbilityC", TEST_CASE_NAME)
      await sleep(500);
      await globalThis.abilityCContext.terminateSelf()
      await sleep(2000);

      await globalThis.abilityBContext.terminateSelf()
      await sleep(2000);
      await globalThis.abilityAContext.terminateSelf()
      await sleep(2000);
      startAbilityTest("MainAbilityA", TEST_CASE_NAME)
      await sleep(2000);
      let callBackIdA2:number = globalThis.mainAbilityACallBackId
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} MainAbilityA callBackIdA2:${callBackIdA2}`);
      expect(curCallBackId === (callBackIdA2 - 1))
      curCallBackId = callBackIdA2

      startAbilityTest("MainAbilityB", TEST_CASE_NAME)
      await sleep(2000);
      let callBackIdB2:number = globalThis.mainAbilityBCallBackId
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} MainAbilityB callBackIdB2:${callBackIdB2}`);
      expect(curCallBackId === (callBackIdB2 - 1))
      curCallBackId = callBackIdB2

      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityB", TEST_CASE_NAME, globalThis.mainAbilityAListKey)
      expect(listKeyTemp[0]).assertEqual("MainAbilityB onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityB onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityB onAbilityForeground");

      startAbilityTest("MainAbilityC", TEST_CASE_NAME)
      await sleep(1000);
      let last = getAbilityLastLifeCycle("MainAbilityB")
      if (deviceSupport != 'false') {
        expect(last).assertEqual("MainAbilityB onAbilityBackground");
      }

      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityC", TEST_CASE_NAME, globalThis.mainAbilityAListKey)
      expect(listKeyTemp[0]).assertEqual("MainAbilityC onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityC onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityC onAbilityForeground");

      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityC", TEST_CASE_NAME, globalThis.mainAbilityBListKey)
      expect(listKeyTemp[0]).assertEqual("MainAbilityC onAbilityCreate");
      expect(listKeyTemp[1]).assertEqual("MainAbilityC onWindowStageCreate");
      expect(listKeyTemp[2]).assertEqual("MainAbilityC onAbilityForeground");

      await globalThis.abilityCContext.terminateSelf()
      await sleep(1000);
      if (deviceSupport != 'false') {
        last = getAbilityLastLifeCycle("MainAbilityB")
        expect(last).assertEqual("MainAbilityB onAbilityForeground");
      }
      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityC", TEST_CASE_NAME, globalThis.mainAbilityAListKey)
      let transferStr0 = listKeyTemp[4] + listKeyTemp[5];
      expect(transferStr0.indexOf("MainAbilityC onWindowStageDestroy") != -1).assertTrue();
      expect(transferStr0.indexOf("MainAbilityC onAbilityDestroy") != -1).assertTrue();

      listKeyTemp = getAbilityLifeCycleFilter("MainAbilityC", TEST_CASE_NAME, globalThis.mainAbilityBListKey)
      transferStr0 = listKeyTemp[4] + listKeyTemp[5];
      expect(transferStr0.indexOf("MainAbilityC onWindowStageDestroy") != -1).assertTrue();
      expect(transferStr0.indexOf("MainAbilityC onAbilityDestroy") != -1).assertTrue();
      isTerminateSelfMainAbilityA = true;
      isTerminateSelfMainAbilityB = true;
      done()
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1800
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1800
     * @tc.desc   Multiple registrations/deregistrations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1800', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1800';

      startAbilityTest("MainAbilityC", TEST_CASE_NAME)
      await sleep(1000);
      let AbilityLifecycleCallback:AbilityLifecycleCallback  = {
        onAbilityCreate(ability) {
        },
        onWindowStageCreate(ability, windowStage) {
          
        },
        onWindowStageActive(ability, windowStage) {
        },
        onWindowStageInactive(ability, windowStage) {
          
        },
        onAbilityForeground(ability) {
          
        },
        onAbilityBackground(ability) {
          
        },
        onWindowStageDestroy(ability, windowStage) {
          
        },
        onAbilityDestroy(ability) {
          
        },
        onAbilityContinue(ability) {
          
        }
      }
      let callBackId:number = globalThis.abilityCContext.getApplicationContext().registerAbilityLifecycleCallback(AbilityLifecycleCallback);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} MainAbilityC callBackId:${callBackId}`);
      await sleep(1000);

      await globalThis.abilityCContext.getApplicationContext().unregisterAbilityLifecycleCallback(callBackId).then((data:void) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback success,
          callBackId:  ${callBackId} ",data: ${JSON.stringify(data)}`);
      }).catch((error:BusinessError) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback
          error callBackId:  ${JSON.stringify(callBackId)} ",error: ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      })
      let callBackId2:number = globalThis.abilityCContext.getApplicationContext().registerAbilityLifecycleCallback(AbilityLifecycleCallback);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} MainAbilityC callBackId2:${callBackId2}`);
      await sleep(1000);
      isTerminateSelfMainAbilityC = true;
      await globalThis.abilityCContext.getApplicationContext().unregisterAbilityLifecycleCallback(callBackId2).then((data:void) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback success,
          callBackId:  ${callBackId} ",data: ${JSON.stringify(data)}`);
      }).catch((error:base.BusinessError) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback
          error callBackId:  ${JSON.stringify(callBackId)} ",error: ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      })
      expect(callBackId === (callBackId2 - 1))
      done()
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1900
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1900
     * @tc.desc   The callback ID for the input parameter is a non-existent ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1900', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_1900';

      startAbilityTest("MainAbilityC", TEST_CASE_NAME)
      await sleep(1000);
      isTerminateSelfMainAbilityC = true;
      globalThis.abilityCContext.getApplicationContext()
        .unregisterAbilityLifecycleCallback(100, (error:base.BusinessError, data:ESObject) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback success,
            err:  ${JSON.stringify(error)} ",data: ${JSON.stringify(data)}`);
          expect(error.code).assertEqual(1);
          done()
        });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2000
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2000
     * @tc.desc   The input parameter callbackid is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2000', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2000';

      startAbilityTest("MainAbilityC", TEST_CASE_NAME)
      await sleep(1000);
      isTerminateSelfMainAbilityC = true;
      globalThis.abilityCContext.getApplicationContext()
        .unregisterAbilityLifecycleCallback("", (error:base.BusinessError, data:ESObject) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback success,
            err:  ${JSON.stringify(error)} ",data: ${JSON.stringify(data)}`);
          expect(error.code).assertEqual(1);
          done()
        });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2100
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2100
     * @tc.desc   The callback id for the input parameter is negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2100', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2100';

      startAbilityTest("MainAbilityC", TEST_CASE_NAME)
      await sleep(1000);
      isTerminateSelfMainAbilityC = true;
      globalThis.abilityCContext.getApplicationContext()
        .unregisterAbilityLifecycleCallback(-1, (error:base.BusinessError, data:ESObject) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback success,
            err:  ${JSON.stringify(error)} ",data: ${JSON.stringify(data)}`);
          expect(error.code).assertEqual(1);
          done()
        });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2200
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2200
     * @tc.desc   Callbackid is of incorrect type (such as string type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2200', Level.LEVEL3, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2200';

      startAbilityTest("MainAbilityC", TEST_CASE_NAME)
      await sleep(1000);
      isTerminateSelfMainAbilityC = true;
      globalThis.abilityCContext.getApplicationContext()
        .unregisterAbilityLifecycleCallback("test", (error:base.BusinessError, data:ESObject) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} unregisterAbilityLifecycleCallback success, err:
            ${JSON.stringify(error)} ",data: ${JSON.stringify(data)}`);
          expect(error.code).assertEqual(1);
          done()
        });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2300
     * @tc.number SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2300
     * @tc.desc   will LifecycleCallback Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LifeCycle_LifeCycleTest_2300', Level.LEVEL3, async (done: Function) => {
      let templeStr:string[] = globalThis.willAbilityStageListKey.join(',');

      expect(templeStr.indexOf("MainAbilityA onAbilityWillCreate") != -1).assertTrue();
      expect(templeStr.indexOf("MainAbilityA onWindowStageWillCreate") != -1).assertTrue();
      expect(templeStr.indexOf("MainAbilityA onAbilityWillForeground") != -1).assertTrue();
      expect(templeStr.indexOf("MainAbilityA onWillNewWant") != -1).assertTrue();
      expect(templeStr.indexOf("MainAbilityA onNewWant") != -1).assertTrue();
      expect(templeStr.indexOf("MainAbilityA onAbilityWillDestroy") != -1).assertTrue();
      expect(templeStr.indexOf("MainAbilityA onAbilityWillBackground") != -1).assertTrue();
      expect(templeStr.indexOf("MainAbilityA onWindowStageWillDestroy") != -1).assertTrue();
      done();
    })
  })
}

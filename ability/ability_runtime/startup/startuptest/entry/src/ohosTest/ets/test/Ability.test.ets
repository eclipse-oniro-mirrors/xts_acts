/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import common from '@ohos.app.ability.common';
import ability from '@ohos.ability.ability';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { commonEventManager } from '@kit.BasicServicesKit';

export default function abilityTest() {
  let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;
  console.log("du.yuan testContext:", testContext)
  let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let context: common.UIAbilityContext;
  let TAG = "";

  describe('ActsAbilityStartUpTest', () => {
    beforeAll(async (done: Function) => {
      context = testContext;
      done();
    });

    afterEach(async (done: Function) => {
      if (TAG === "SUB_Ability_AbilityRuntime_StartUpFeature_0100" ||
        TAG === "SUB_Ability_AbilityRuntime_StartUpFeature_0200" ||
        TAG === "SUB_Ability_AbilityRuntime_StartUpFeature_0300" ||
        TAG === "SUB_Ability_AbilityRuntime_StartUpFeature_0400") {
        setTimeout(() => {
          done();
        }, 3000)
      } else {
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_0100
     * @tc.desc   test the startup results of a single startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0100', Level.LEVEL0, async (done: Function) => {
        TAG = "ACTS_AddAbilityMonitor_Callback_0100";
        console.log(TAG + " start");
        context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'SingleStartAbility',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startResult: boolean = result.want?.parameters?.startResult as boolean
        console.log(TAG + " startResult = " + startResult)
        expect(startResult).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_0200
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_0200
     * @tc.desc   test the startup results of the serial startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0200', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0200";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility2',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startOrder = JSON.stringify(result.want?.parameters?.startOrder)
        expect(startOrder.indexOf('startupSampleInit1') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit2') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit3') != -1).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_0300
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_0300
     * @tc.desc   test the startup results of the parallel startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0300', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0300";
      console.log(TAG + " start");
       context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility3',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startOrder = JSON.stringify(result.want?.parameters?.startOrder)
        expect(startOrder.indexOf('startupSampleInit1') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit4') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit5') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit6') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit7') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit8') != -1).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_0400
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_0400
     * @tc.desc   test the startup results of loop serial startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0400', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0400";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility4',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startResult = result.want?.parameters?.startResult
        let code = result.want?.parameters?.code
        expect(startResult).assertFalse()
        expect(code).assertEqual(28800002)
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_0500
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_0500
     * @tc.desc   test the startup results of cycle parallel start framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0500', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0500";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility5',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startResult = result.want?.parameters?.startResult
        let code = result.want?.parameters?.code
        expect(startResult).assertFalse()
        expect(code).assertEqual(28800002)
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_0600
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_0600
     * @tc.desc   test the callback for successful loading of the serial startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0600', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0600";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility6',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let hasInit001 = result.want?.parameters?.hasInit001
        let hasInit003 = result.want?.parameters?.hasInit003
        expect(hasInit001).assertTrue()
        expect(hasInit003).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_0700
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_0700
     * @tc.desc   test the callback for successful loading of the parallel startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0700', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0700";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility7',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startOrder = JSON.stringify(result.want?.parameters?.startOrder)
        expect(startOrder.indexOf('Sample_006') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_008') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_001') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_005') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_007') != -1).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_0800
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_0800
     * @tc.desc   test a callback for successfully loading a startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0800', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0800";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'SingleStartAbility2',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startupDefaultConfig = result.want?.parameters?.startupDefaultConfig
        let startupSampleComp = result.want?.parameters?.startupSampleComp

        console.log(TAG + " startupDefaultConfig = " + JSON.stringify(startupDefaultConfig))
        console.log(TAG + " startupSampleComp = " + JSON.stringify(startupSampleComp))
        delegator.printSync(TAG + " startupSampleComp = " + JSON.stringify(startupSampleComp))

        expect(startupDefaultConfig).assertTrue()
        expect(startupSampleComp).assertFalse()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_0900
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_0900
     * @tc.desc   test the results of the main thread waiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0900', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0900";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility8',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let res = result.want?.parameters?.result
        expect(res).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_1000
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_1000
     * @tc.desc   test the result of the main thread not waiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1000', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1000";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility9',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let res = result.want?.parameters?.result
        expect(res).assertFalse()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_1100
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_1100
     * @tc.desc   test the startup results of custom configuration a single startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1100', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1100";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'SingleStartAbility',
        parameters: {
          customConfig: true
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startResult = result.want?.parameters?.startResult
        expect(startResult).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_1200
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_1200
     * @tc.desc   test the startup results of custom configuration serial startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1200', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1200";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility2',
        parameters: {
          customConfig: true
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startOrder = JSON.stringify(result.want?.parameters?.startOrder)
        expect(startOrder.indexOf('startupSampleInit1') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit2') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit3') != -1).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_1300
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_1300
     * @tc.desc   test the startup results of the custom configuration parallel startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1300', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1300";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility3',
        parameters: {
          customConfig: true
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startOrder = JSON.stringify(result.want?.parameters?.startOrder)
        expect(startOrder.indexOf('startupSampleInit1') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit4') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit5') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit6') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit7') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit8') != -1).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_1400
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_1400
     * @tc.desc   test the startup results of custom configuration loop serial startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1400', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1400";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility4',
        parameters: {
          customConfig: true
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startResult = result.want?.parameters?.startResult
        let code = result.want?.parameters?.code
        expect(startResult).assertFalse()
        expect(code).assertEqual(28800002)
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_1500
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_1500
     * @tc.desc   test the startup results of custom configuration cycle parallel start framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1500', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1500";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility5',
        parameters: {
          customConfig: true
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startResult = result.want?.parameters?.startResult
        let code = result.want?.parameters?.code
        expect(startResult).assertFalse()
        expect(code).assertEqual(28800002)
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_1600
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_1600
     * @tc.desc   test custom configuration the callback for successful loading of the serial startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1600', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1600";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility6',
        parameters: {
          customConfig: true
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let hasInit001 = result.want?.parameters?.hasInit001
        let hasInit003 = result.want?.parameters?.hasInit003
        expect(hasInit001).assertTrue()
        expect(hasInit003).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_1700
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_1700
     * @tc.desc   test custom configuration the callback for successful loading of the parallel startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1700', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1700";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility7',
        parameters: {
          customConfig: true
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startOrder = JSON.stringify(result.want?.parameters?.startOrder)
        expect(startOrder.indexOf('Sample_006') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_008') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_001') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_005') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_007') != -1).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_1800
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_1800
     * @tc.desc   test custom configuration a callback for successfully loading a startup framework
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1800', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1800";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'SingleStartAbility2',
        parameters: {
          customConfig: true
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startupDefaultConfig = result.want?.parameters?.startupDefaultConfig
        let startupSampleComp = result.want?.parameters?.startupSampleComp

        console.log(TAG + " startupDefaultConfig = " + JSON.stringify(startupDefaultConfig))
        console.log(TAG + " startupSampleComp = " + JSON.stringify(startupSampleComp))

        expect(startupDefaultConfig).assertTrue()
        expect(startupSampleComp).assertFalse()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_1900
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_1900
     * @tc.desc   test the custom configuration results of the main thread waiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1900', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1900";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility8',
        parameters: {
          customConfig: true
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let res = result.want?.parameters?.result
        expect(res).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_2000
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_2000
     * @tc.desc   test the custom configuration result of the main thread not waiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2000', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2000";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility9',
        parameters: {
          customConfig: true
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let res = result.want?.parameters?.result
        expect(res).assertFalse()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_2100
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_2100
     * @tc.desc   the result of testing startup framework parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2100', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2100";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility10',
        parameters: {
          type: 0
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let code = result.want?.parameters?.code
        expect(code == 401).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_2200
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_2200
     * @tc.desc   the result of testing startup framework parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2200', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2200";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility10',
        parameters: {
          type: 0
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let code = result.want?.parameters?.code
        expect(code == 401).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_2300
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_2300
     * @tc.desc   the result of testing startup framework parameter is []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2300', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2300";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility10',
        parameters: {
          type: 1
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let code = result.want?.parameters?.code
        expect(code == 401).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_2400
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_2400
     * @tc.desc   the result of testing startup framework parameter is {}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2400', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2400";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility10',
        parameters: {
          type: 2
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let code = result.want?.parameters?.code
        expect(code == 16000050).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_2500
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_2500
     * @tc.desc   the result of testing startup framework parameter is {}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2500', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2500";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility10',
        parameters: {
          type: 3
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let code = result.want?.parameters?.code
        expect(code == 401).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_2600
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_2600
     * @tc.desc   the result of testing startup framework parameter is not exit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2600', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2600";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility10',
        parameters: {
          type: 4
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let code = result.want?.parameters?.code
        expect(code == 401).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_2700
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_2700
     * @tc.desc   the result of testing startup framework parameter is not exit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2700', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2700";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility11',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let apiResult: Array<boolean> = (result.want?.parameters?.apiResult) as Array<boolean>
        expect(apiResult.length == 11).assertTrue()
        expect(apiResult[0]).assertTrue()
        expect(apiResult[1]).assertTrue()
        expect(apiResult[2]).assertTrue()
        expect(apiResult[3]).assertFalse()
        expect(apiResult[4]).assertFalse()
        expect(apiResult[5]).assertFalse()
        expect(apiResult[6]).assertFalse()
        expect(apiResult[7]).assertFalse()
        expect(apiResult[8]).assertFalse()
        expect(apiResult[9]).assertFalse()
        expect(apiResult[10]).assertTrue()
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_2800
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_2800
     * @tc.desc   The startup tasks have circular dependencies.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2800', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2800";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility100',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let apiResult: Array<number> = (result.want?.parameters?.apiResult) as Array<number>
        expect(apiResult[0]).assertEqual(28800002);
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_2900
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_2900
     * @tc.desc   An error occurred while running the startup tasks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2900', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2900";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility102',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let apiResult: Array<number> = (result.want?.parameters?.apiResult) as Array<number>
        expect(apiResult[0]).assertEqual(28800003);
        done();
      })
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUp_3000
     * @tc.number SUB_Ability_AbilityRuntime_StartUp_3000
     * @tc.desc   Running startup tasks timeout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUp_3000', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_3000";
      console.log(TAG + " start");
      let sub:commonEventManager.CommonEventSubscriber;
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sample_103_init"]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        console.info("createSubscriber success");
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          console.info("the erris " + JSON.stringify(err))
          console.info("the data " + JSON.stringify(commonEventData))
          try {
            expect(commonEventData.parameters?.result).assertEqual(28800004);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
      });

      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility103',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_0100
     * @tc.desc   the testing startup framework errorCode is 28800001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_0100', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUpFeature_0100";
      console.log(TAG + " start");
      let flag = false;
      let sub:commonEventManager.CommonEventSubscriber;
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Start_Run_Sample_004"]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        console.info("createSubscriber success");
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          console.info("the erris " + JSON.stringify(err))
          console.info("the data " + JSON.stringify(commonEventData))
          try {
            expect(commonEventData.parameters?.result).assertEqual(28800001);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
      });
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp2',
        abilityName: 'PageAbilityFeature',
        parameters:{
          "case":"0100"
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        try{expect(flag).assertTrue()}catch{
          console.info(TAG + "app run task use time over 2s");
        }
        done();
      })
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_0200
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_0200
     * @tc.desc   the testing startup framework errorCode is 28800002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_0200', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUpFeature_0200";
      console.log(TAG + " start");
      let flag = false;
      let sub:commonEventManager.CommonEventSubscriber;
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Start_Run_Sample_100"]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        console.info("createSubscriber success");
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          console.info("the erris " + JSON.stringify(err))
          console.info("the data " + JSON.stringify(commonEventData))
          try {
            expect(commonEventData.parameters?.result).assertEqual(28800002);
            flag = true;
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
      });
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp2',
        abilityName: 'PageAbilityFeature',
        parameters:{
          "case":"0200"
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        try{expect(flag).assertTrue()}catch{
          console.info(TAG + "app run task use time over 2s");
        }
        done();
      })
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_0300
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_0300
     * @tc.desc   the testing startup framework errorCode is 28800003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_0300', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUpFeature_0300";
      console.log(TAG + " start");
      let sub:commonEventManager.CommonEventSubscriber;
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Start_Run_Sample_102"]
      };
      let flag = false;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        console.info("createSubscriber success");
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          console.info("the erris " + JSON.stringify(err))
          console.info("the data " + JSON.stringify(commonEventData))
          try {
            expect(commonEventData.parameters?.result).assertEqual(28800003);
            flag = true;
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });
      });
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp2',
        abilityName: 'PageAbilityFeature',
        parameters:{
          "case":"0300"
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        try{expect(flag).assertTrue()}catch{
          console.info(TAG + "app run task use time over 2s");
        }
        done();
      })
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_0400
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_0400
     * @tc.desc   the testing startup framework errorCode is 28800004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_0400', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUpFeature_0400";
      console.log(TAG + " start");
      let flag = false;
      let sub:commonEventManager.CommonEventSubscriber;
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sample_103_init"]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        console.info("createSubscriber success");
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          console.info("the erris " + JSON.stringify(err))
          console.info("the data " + JSON.stringify(commonEventData))
          try {
            expect(commonEventData.parameters?.result).assertEqual(28800004);
            flag = true;
            commonEventManager.publish("Sample_103_terminate", (err, data) => {
              console.log('StartupTest Start_Run_Sample_100 end, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Start_Run_Sample_100 end, publish msg, data=' + JSON.stringify(data));
            });
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });
      });
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp2',
        abilityName: 'PageAbility103',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        try{expect(flag).assertTrue()}catch{
          console.info(TAG + "app run task use time over 2s");
        }
        done();
      })
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_0500
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_0500
     * @tc.desc   the testing startup framework with matchRules.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_0500', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_StartUpFeature_0500";
      console.log(TAG + " start");
      let flag = false;
      let sub:commonEventManager.CommonEventSubscriber;
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["onRequestCustomMatchRule_running"]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        console.info(TAG + "createSubscriber success");
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          console.info(TAG + "the erris " + JSON.stringify(err))
          console.info(TAG + "the data " + JSON.stringify(commonEventData))
          try {
            expect(commonEventData.parameters?.result).assertEqual("customRule1");
            flag = true;
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            console.info(TAG + "unsubscribe success");
          });
        });
      });
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp2',
        abilityName: 'PageAbilityFeature',
        parameters:{
          "customParam": "param1"
        }
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err));
        console.log(TAG + " result = " + JSON.stringify(result));
        try{expect(flag).assertTrue()}catch{
          console.info(TAG + "app run task use time over 2s");
        }
        done();
      })
    })

  })
}
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import ability from '@ohos.ability.ability';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function abilityTest() {
  let testContext = AppStorage.get<UIAbilityContext>("testContext");
  console.log("du.yuan testContext:", testContext)
  let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let context: common.UIAbilityContext;
  let TAG = "";

  describe('ActsAbilityStartUpTest', function () {
    beforeAll(async function (done) {
      context = testContext;
      done();
    });

    afterEach(async function (done) {
      setTimeout(() => {
        done();
      }, 3000)
    });

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0100
     * @tc.name: test a single startup framework
     * @tc.desc: test the startup results of a single startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0100', 0, async function (done) {
        TAG = "ACTS_AddAbilityMonitor_Callback_0100";
        console.log(TAG + " start");
        context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'SingleStartAbility',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startResult = result.want.parameters.startResult
        console.log(TAG + " startResult = " + startResult)
        expect(startResult).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0200
     * @tc.name: test the serial startup framework
     * @tc.desc: test the startup results of the serial startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0200', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0200";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility2',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startOrder = JSON.stringify(result.want.parameters.startOrder)
        expect(startOrder.indexOf('startupSampleInit1') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit2') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit3') != -1).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0300
     * @tc.name: test parallel start framework
     * @tc.desc: test the startup results of the parallel startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0300', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0300";
      console.log(TAG + " start");
       context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility3',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startOrder = JSON.stringify(result.want.parameters.startOrder)
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
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0400
     * @tc.name: test loop serial startup framework
     * @tc.desc: test the startup results of loop serial startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0400', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0400";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility4',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startResult = result.want.parameters.startResult
        let code = result.want.parameters.code
        expect(startResult).assertFalse()
        expect(code).assertEqual(28800002)
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0500
     * @tc.name: test cycle parallel start framework
     * @tc.desc: test the startup results of cycle parallel start framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0500', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0500";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility5',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startResult = result.want.parameters.startResult
        let code = result.want.parameters.code
        expect(startResult).assertFalse()
        expect(code).assertEqual(28800002)
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0600
     * @tc.name: test the callback for successful loading of the serial startup framework
     * @tc.desc: test the callback for successful loading of the serial startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0600', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0600";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility6',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let hasInit001 = result.want.parameters.hasInit001
        let hasInit003 = result.want.parameters.hasInit003
        expect(hasInit001).assertTrue()
        expect(hasInit003).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0700
     * @tc.name: test the callback for successful loading of the parallel startup framework
     * @tc.desc: test the callback for successful loading of the parallel startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0700', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0700";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility7',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startOrder = JSON.stringify(result.want.parameters.startOrder)
        expect(startOrder.indexOf('Sample_006') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_008') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_001') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_005') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_007') != -1).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0800
     * @tc.name: test a callback for successfully loading a startup framework
     * @tc.desc: test a callback for successfully loading a startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0800', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0800";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'SingleStartAbility2',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let startupDefaultConfig = result.want.parameters.startupDefaultConfig
        let startupSampleComp = result.want.parameters.startupSampleComp

        console.log(TAG + " startupDefaultConfig = " + JSON.stringify(startupDefaultConfig))
        console.log(TAG + " startupSampleComp = " + JSON.stringify(startupSampleComp))
        delegator.printSync(TAG + " startupSampleComp = " + JSON.stringify(startupSampleComp))

        expect(startupDefaultConfig).assertTrue()
        expect(startupSampleComp).assertFalse()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_0900
     * @tc.name: test main thread waiting
     * @tc.desc: test the results of the main thread waiting
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_0900', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_0900";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility8',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let res = result.want.parameters.result
        expect(res).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1000
     * @tc.name: test main thread not waiting
     * @tc.desc: test the result of the main thread not waiting
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1000', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_1000";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility9',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let res = result.want.parameters.result
        expect(res).assertFalse()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1100
     * @tc.name: test custom configuration a single startup framework
     * @tc.desc: test the startup results of custom configuration a single startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1100', 0, async function (done) {
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
        let startResult = result.want.parameters.startResult
        expect(startResult).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1200
     * @tc.name: test custom configuration serial startup framework
     * @tc.desc: test the startup results of custom configuration serial startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1200', 0, async function (done) {
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
        let startOrder = JSON.stringify(result.want.parameters.startOrder)
        expect(startOrder.indexOf('startupSampleInit1') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit2') != -1).assertTrue()
        expect(startOrder.indexOf('startupSampleInit3') != -1).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1300
     * @tc.name: test custom configuration parallel start framework
     * @tc.desc: test the startup results of the custom configuration parallel startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1300', 0, async function (done) {
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
        let startOrder = JSON.stringify(result.want.parameters.startOrder)
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
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1400
     * @tc.name: test custom configuration loop serial startup framework
     * @tc.desc: test the startup results of custom configuration loop serial startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1400', 0, async function (done) {
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
        let startResult = result.want.parameters.startResult
        let code = result.want.parameters.code
        expect(startResult).assertFalse()
        expect(code).assertEqual(28800002)
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1500
     * @tc.name: test custom configuration cycle parallel start framework
     * @tc.desc: test the startup results of custom configuration cycle parallel start framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1500', 0, async function (done) {
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
        let startResult = result.want.parameters.startResult
        let code = result.want.parameters.code
        expect(startResult).assertFalse()
        expect(code).assertEqual(28800002)
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1600
     * @tc.name: test custom configuration the callback for successful loading of the serial startup framework
     * @tc.desc: test custom configuration the callback for successful loading of the serial startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1600', 0, async function (done) {
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
        let hasInit001 = result.want.parameters.hasInit001
        let hasInit003 = result.want.parameters.hasInit003
        expect(hasInit001).assertTrue()
        expect(hasInit003).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1700
     * @tc.name: test custom configuration the callback for successful loading of the parallel startup framework
     * @tc.desc: test custom configuration the callback for successful loading of the parallel startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1700', 0, async function (done) {
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
        let startOrder = JSON.stringify(result.want.parameters.startOrder)
        expect(startOrder.indexOf('Sample_006') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_008') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_001') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_005') != -1).assertTrue()
        expect(startOrder.indexOf('Sample_007') != -1).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1800
     * @tc.name: test custom configuration a callback for successfully loading a startup framework
     * @tc.desc: test custom configuration a callback for successfully loading a startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1800', 0, async function (done) {
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
        let startupDefaultConfig = result.want.parameters.startupDefaultConfig
        let startupSampleComp = result.want.parameters.startupSampleComp

        console.log(TAG + " startupDefaultConfig = " + JSON.stringify(startupDefaultConfig))
        console.log(TAG + " startupSampleComp = " + JSON.stringify(startupSampleComp))

        expect(startupDefaultConfig).assertTrue()
        expect(startupSampleComp).assertFalse()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_1900
     * @tc.name: test custom configuration main thread waiting
     * @tc.desc: test the custom configuration results of the main thread waiting
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_1900', 0, async function (done) {
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
        let res = result.want.parameters.result
        expect(res).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2000
     * @tc.name: test custom configuration main thread not waiting
     * @tc.desc: test the custom configuration result of the main thread not waiting
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2000', 0, async function (done) {
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
        let res = result.want.parameters.result
        expect(res).assertFalse()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2100
     * @tc.name: the testing startup framework parameter is undefined
     * @tc.desc: the result of testing startup framework parameter is undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2100', 0, async function (done) {
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
        let code = result.want.parameters.code
        expect(code == 401).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2200
     * @tc.name: the testing startup framework parameter is null
     * @tc.desc: the result of testing startup framework parameter is null
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2200', 0, async function (done) {
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
        let code = result.want.parameters.code
        expect(code == 401).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2300
     * @tc.name: the testing startup framework parameter is []
     * @tc.desc: the result of testing startup framework parameter is []
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2300', 0, async function (done) {
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
        let code = result.want.parameters.code
        expect(code == 401).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2400
     * @tc.name: the testing startup framework parameter is {}
     * @tc.desc: the result of testing startup framework parameter is {}
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2400', 0, async function (done) {
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
        let code = result.want.parameters.code
        expect(code == 16000050).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2500
     * @tc.name: the testing startup framework parameter is {}
     * @tc.desc: the result of testing startup framework parameter is {}
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2500', 0, async function (done) {
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
        let code = result.want.parameters.code
        expect(code == 401).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2600
     * @tc.name: the testing startup framework parameter is {}
     * @tc.desc: the result of testing startup framework parameter is not exit
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2600', 0, async function (done) {
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
        let code = result.want.parameters.code
        expect(code == 401).assertTrue()
        done();
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_StartUp_2700
     * @tc.name: the testing startup framework parameter is {}
     * @tc.desc: the result of testing startup framework parameter is not exit
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_StartUp_2700', 0, async function (done) {
      TAG = "SUB_Ability_AbilityRuntime_StartUp_2700";
      console.log(TAG + " start");
      context.startAbilityForResult({
        bundleName: 'com.acts.startupmanualhelp1',
        abilityName: 'PageAbility11',
      }, (err, result: ability.AbilityResult) => {
        console.log(TAG + " error = " + JSON.stringify(err))
        console.log(TAG + " result = " + JSON.stringify(result))
        delegator.printSync(TAG + " result = " + JSON.stringify(result))
        let apiResult: Array<boolean> = (result.want.parameters.apiResult) as Array<boolean>
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
  })
}
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { application, common, Want, wantConstant } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

let testContext: common.UIAbilityContext;

const DOMAIN = 0x0000;
const LOG_TAG = 'PLUGIN_TEST';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      try {
        const ability = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility()
        testContext = ability.context;
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "get context failed: " + JSON.stringify(err))
        try { expect().assertFail(); } catch (err) {}
      }
      done();
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_1900
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_1900
     * @tc.desc   Expect: failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_1900', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_1900';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      let want: Want = {};
      want.parameters = {};
      want.parameters[wantConstant.Params.DESTINATION_PLUGIN_ABILITY] = true;
      try {
        await testContext.startAbility(want);
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'startFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_2100
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_2100
     * @tc.desc   Expect: failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_2100', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_2100';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      let want: Want = {
        abilityName: '111',
        bundleName: '111'
      };
      want.parameters = {};
      want.parameters[wantConstant.Params.DESTINATION_PLUGIN_ABILITY] = true;
      try {
        await testContext.startAbility(want);
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'startFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_2200
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_2200
     * @tc.desc   Expect: failed with code 16000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_2200', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_2200';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      let want: Want = {
        abilityName: '111',
        bundleName: '111',
        moduleName: '111'
      };
      want.parameters = {};
      want.parameters[wantConstant.Params.DESTINATION_PLUGIN_ABILITY] = true;
      try {
        await testContext.startAbility(want);
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'startFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(16000001);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_1200
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_1200
     * @tc.desc   Expect: failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_1200', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_1200';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      try {
        await application.createPluginModuleContext(testContext, '', '');
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_1300
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_1300
     * @tc.desc   Test createPluginModuleContext with first parameter (context) as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_1300', Level.LEVEL1, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_1300';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      try {
        await application.createPluginModuleContext(null, 'testBundle', 'testModule');
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: should throw error');
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_1400
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_1400
     * @tc.desc   Test createPluginModuleContext with first parameter (context) as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_1400', Level.LEVEL1, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_1400';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      try {
        await application.createPluginModuleContext(undefined, 'testBundle', 'testModule');
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: should throw error');
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_1500
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_1500
     * @tc.desc   Test createPluginModuleContext with second parameter (bundleName) as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_1500', Level.LEVEL1, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_1500';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      try {
        await application.createPluginModuleContext(testContext, null, 'testModule');
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: should throw error');
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_1600
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_1600
     * @tc.desc   Test createPluginModuleContext with second parameter (bundleName) as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_1600', Level.LEVEL1, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_1600';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      try {
        await application.createPluginModuleContext(testContext, undefined, 'testModule');
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: should throw error');
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_1700
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_1700
     * @tc.desc   Test createPluginModuleContext with third parameter (moduleName) as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_1700', Level.LEVEL1, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_1700';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      try {
        await application.createPluginModuleContext(testContext, 'testBundle', null);
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: should throw error');
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_1800
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_1800
     * @tc.desc   Test createPluginModuleContext with third parameter (moduleName) as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_1800', Level.LEVEL1, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_1800';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      try {
        await application.createPluginModuleContext(testContext, 'testBundle', undefined);
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: should throw error');
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_2000
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_2000
     * @tc.desc   Test createPluginModuleContext with second and third parameters as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_2000', Level.LEVEL1, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_2000';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      try {
        await application.createPluginModuleContext(testContext, null, null);
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: should throw error');
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_2500
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_2500
     * @tc.desc   Test createPluginModuleContext with second and third parameters as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_2500', Level.LEVEL1, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_2500';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      try {
        await application.createPluginModuleContext(testContext, undefined, undefined);
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: should throw error');
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_2600
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_2600
     * @tc.desc   Test createPluginModuleContext with bundleName as null and moduleName as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_2600', Level.LEVEL1, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_2600';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      try {
        await application.createPluginModuleContext(testContext, null, undefined);
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: should throw error');
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_2700
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_2700
     * @tc.desc   Test createPluginModuleContext with bundleName as undefined and moduleName as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_2700', Level.LEVEL1, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_2700';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      try {
        await application.createPluginModuleContext(testContext, undefined, null);
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: should throw error');
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'createContextFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })
  })
}
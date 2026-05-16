/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';

let context:common.UIAbilityContext;

export default function AbilityRuntimeUIRestartApp() {
  describe('AbilityRuntimeUIRestartApp', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
    })
    beforeEach(async () => {})
    afterEach(() => {})
    afterAll(async () => {})

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIRestartApp_0100
     * @tc.number SUB_Ability_AbilityRuntime_UIRestartApp_0100
     * @tc.desc   Verify that the input parameter 'want' for calling RestartApp is null, and return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIRestartApp_0100', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_UIRestartApp_0100';

        try {
          await context.restartApp(null);
        } catch (err) {
          if (err?.code === 801) {
            expect(err.code).assertEqual(801)
            done()
          }else {
            hilog.info(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
            expect(err?.code).assertEqual(401)
            done();
          }
        }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIRestartApp_0200
     * @tc.number SUB_Ability_AbilityRuntime_UIRestartApp_0200
     * @tc.desc   Verify that the input parameter 'want' for calling RestartApp is empty, and return 16000063
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIRestartApp_0200', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_UIRestartApp_0200';
      let want :Want= {} ;
        try {
          await context.restartApp(want);
        } catch (err) {
          if (err?.code === 801) {
            expect(err.code).assertEqual(801)
            done()
          }else {
            hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
            expect(err?.code).assertEqual(16000063)
            done();
          }
        }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIRestartApp_0300
     * @tc.number SUB_Ability_AbilityRuntime_UIRestartApp_0300
     * @tc.desc   Verify that when calling RestartApp and entering the parameter 'want', the bundle name is undefined, and return 16000063
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIRestartApp_0300', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_UIRestartApp_0300';
        let want: Want = {
          bundleName: undefined,
          moduleName: 'entry',
          abilityName: 'EntryAbility'
        };
        try {
          await context.restartApp(want);
        } catch (err) {
          if (err?.code === 801) {
            expect(err.code).assertEqual(801)
            done()
          }else {
            hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
            expect(err?.code).assertEqual(16000063)
            done();
          }
        }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIRestartApp_0400
     * @tc.number SUB_Ability_AbilityRuntime_UIRestartApp_0400
     * @tc.desc   Verify that when calling RestartApp and entering the parameter 'want', the 'ability name' is undefined, and return 16000063
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIRestartApp_0400', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_UIRestartApp_0400';

        let want: Want = {
          bundleName: 'com.wz.restartapp',
          moduleName: 'entry',
          abilityName: undefined
        };
        try {
          await context.restartApp(want);
        } catch (err) {
          if (err?.code === 801) {
            expect(err.code).assertEqual(801)
            done()
          }else {
            hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
            expect(err?.code).assertEqual(16000063)
            done();
          }
        }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIRestartApp_0500
     * @tc.number SUB_Ability_AbilityRuntime_UIRestartApp_0500
     * @tc.desc   Verify that the call to RestartApp enters the parameter 'want' with the target UIAbility being another application, and return 16000063
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIRestartApp_0500', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_UIRestartApp_0500';
        let want: Want = {
          bundleName: 'com.acts.myapplication',
          abilityName: 'EntryAbility',
          moduleName: 'entry',
        };
        try {
          await context.restartApp(want);
        } catch (err) {
          if (err?.code === 801) {
            expect(err.code).assertEqual(801)
            done()
          }else {
            hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
            expect(err?.code).assertEqual(16000063)
            done();
          }
        }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIRestartApp_0600
     * @tc.number SUB_Ability_AbilityRuntime_UIRestartApp_0600
     * @tc.desc   Verify that the call to RestartApp enters the parameter 'want' with the target UIAbility being another application, and return 16000063
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIRestartApp_0600', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_UIRestartApp_0600';
        let want: Want = {
          bundleName: 'com.acts.myapplication',
          moduleName: 'entry',
          abilityName: 'EntryEmbeddedUIExtAbility'
        };
        try {
          await context.restartApp(want);
        } catch (err) {
          if (err?.code === 801) {
            expect(err.code).assertEqual(801)
            done()
          }else {
            hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
            expect(err?.code).assertEqual(16000063)
            done();
          }
        }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIRestartApp_0700
     * @tc.number SUB_Ability_AbilityRuntime_UIRestartApp_0700
     * @tc.desc   Verify that calling RestartApp with parameter 'want' is an implicit match and returns 16000063
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIRestartApp_0700', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_UIRestartApp_0700';
        let want: Want = {
          'action': 'action.system.home',
          'entities': ['entity.system.home'],
          'uri': 'https://www.test.com:8080/query',
          'type': 'text/*'
        };
        try {
          await context.restartApp(want);
        } catch (err) {
          if (err?.code === 801) {
            expect(err.code).assertEqual(801)
            done()
          }else {
            hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
            expect(err?.code).assertEqual(16000063)
            done();
          }
        }
    })
  })
}
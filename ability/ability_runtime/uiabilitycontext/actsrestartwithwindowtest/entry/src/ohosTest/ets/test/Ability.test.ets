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
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import { commonEventManager } from '@kit.BasicServicesKit';
import { Driver, ON } from '@ohos.UiTest';

let testContext: common.UIAbilityContext;
let supportRestartWithWindow = false;

const DOMAIN = 0x0000;
const LOG_TAG = 'RESTART_APP_TEST';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      try {
        const ability = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility()
        testContext = ability.context;
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "get context failed: " + JSON.stringify(err))
        try { expect().assertFail(); } catch (err) {}
      }

      let isRestartWithWindowSupported =
        systemParameterEnhance.getSync('persist.sys.abilityms.restart_app_with_window', 'false');
      hilog.info(DOMAIN, LOG_TAG, 'isRestartWithWindowSupported: %{public}s', isRestartWithWindowSupported);
      if (isRestartWithWindowSupported === 'true') {
        supportRestartWithWindow = true;
      }

      done();
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RestartApp_0100
     * @tc.number SUB_Ability_AbilityRuntime_RestartApp_0100
     * @tc.desc   Expect: restart success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RestartApp_0100', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_RestartApp_0100';
      hilog.info(DOMAIN, LOG_TAG, tag + " it begin");

      if (!supportRestartWithWindow) {
        done();
        return;
      }

      let subscriber = commonEventManager.createSubscriberSync({
        events: ['RESTART_SUCCESS']
      });

      commonEventManager.subscribe(subscriber, (err, data) => {
        commonEventManager.unsubscribe(subscriber);
        expect(data?.event).assertEqual('RESTART_SUCCESS');
        done();
      })

      try {
        await testContext.startAbility({
          abilityName: 'EntryAbility',
          bundleName: 'com.acts.ability.restartapp.demo',
          parameters: {
            needRestart: true,
          }
        });
      } catch (err) {
        hilog.info(0x0000, LOG_TAG, 'startFailed: ' + JSON.stringify(err));
        try { expect().assertFail(); } catch (err) {}
        commonEventManager.unsubscribe(subscriber);
        done();
      }
    })
  })
}
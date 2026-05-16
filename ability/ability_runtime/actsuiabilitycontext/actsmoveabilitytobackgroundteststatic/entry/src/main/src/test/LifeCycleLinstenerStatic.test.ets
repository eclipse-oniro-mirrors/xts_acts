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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import ApplicationStateChangeCallback from '@ohos.app.ability.ApplicationStateChangeCallback';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import InteropAbilityLifecycleCallback from '@ohos.app.ability.InteropAbilityLifecycleCallback';
import { Driver, ON } from '@ohos.UiTest';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

const domain: int = 0x0000;
const tag = 'testTag'
let deviceSupport  = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');

type AbilityCallbackFn = (ability: Any) => void;
type WindowStageCallbackFn = (ability: Any, windowStage: window.WindowStage) => void;

class CustomApplicationStateChangeCallback implements ApplicationStateChangeCallback {
  public isForeground: boolean = false;
  public isBackground: boolean = false;

  onApplicationForeground() {
    hilog.info(domain, tag, 'ApplicationStateChangeCallback onApplicationForeground');
    this.isForeground = true;
    this.isBackground = false;
  }

  onApplicationBackground() {
    hilog.info(domain, tag, 'ApplicationStateChangeCallback onApplicationBackground');
    this.isForeground = false;
    this.isBackground = true;
  }
}

class MyInteropAbilityLifecycleCallback implements InteropAbilityLifecycleCallback {
  public isForeground: boolean = false;
  public isBackground: boolean = false;

  onAbilityCreate: AbilityCallbackFn = (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityCreate');
  };

  onWindowStageCreate: WindowStageCallbackFn = (ability: Any, windowStage: window.WindowStage) => {
    hilog.info(domain, tag, 'onWindowStageCreate');
  };

  onWindowStageDestroy: WindowStageCallbackFn = (ability: Any, windowStage: window.WindowStage) => {
    hilog.info(domain, tag, 'onWindowStageDestroy');
  };

  onAbilityDestroy: AbilityCallbackFn = (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityDestroy');
  };

  onAbilityForeground: AbilityCallbackFn = (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityForeground');
    this.isForeground = true;
    this.isBackground = false;
  };

  onAbilityBackground: AbilityCallbackFn = (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityBackground');
    this.isForeground = false;
    this.isBackground = true;
  };
}

export default function LifeCycleLinstenerStaticTest() {

  describe('LifeCycleLinstenerStaticTest', () => {
    let uiAbilityContext: common.UIAbilityContext;
    let applicationContext: common.ApplicationContext;
    let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
    const BUNDLE_NAME: string = 'com.acts.moveabilitytobgtest.static';

    beforeAll(async () => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      hilog.info(domain, tag, 'beforeAll start');
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      await abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
      await Utils.msSleep(2000);
      uiAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      applicationContext = uiAbilityContext.getApplicationContext();
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_Static_0100
     * @tc.desc   Call UIAbilityContext moveAbilityToBackground,expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_Static_0100`;
      console.log(`${tag}, it begin`);
      try {
        let appCloneIndex: Int = applicationContext.getCurrentAppCloneIndex();
      } catch (err: BusinessError) {
        console.info(`${tag} error, errorCode: ${JSON.stringify(err?.message)}`);
        expect(err?.code).assertEqual(16000071);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100
     * @tc.desc   Call UIAbilityContext moveAbilityToBackground expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100`;
        hilog.info(domain, tag, `${itName} start`);
        if (deviceSupport === 'false') {
          done();
        } else {
          try {
            hilog.info(domain, tag, `${itName} on applicationStateChange`);
            const cb = new CustomApplicationStateChangeCallback();
            applicationContext.onApplicationStateChange(cb);

            hilog.info(domain, tag, `${itName} EntryAbility moveAbilityToBackground`);
            await uiAbilityContext.moveAbilityToBackground()
            await Utils.msSleep(2000);
            hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isBackground: ${cb.isBackground}`);
            expect(cb.isBackground).assertTrue();

            hilog.info(domain, tag, `${itName} start EntryAbility ability`);
            await abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
            await Utils.msSleep(2000);
            hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isForeground: ${cb.isForeground}`);
            expect(cb.isForeground).assertTrue();

            hilog.info(domain, tag, `${itName} off applicationStateChange`);
            applicationContext.offApplicationStateChange(cb);
          } catch (err: BusinessError) {
            hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
            expect().assertFail();
          }
          hilog.info(domain, tag, `${itName} end`);
          done();
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200
     * @tc.desc   Call UIAbilityContext moveAbilityToBackground expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200`;
        if (deviceSupport === 'false') {
          done();
        } else {
          try {
            hilog.info(domain, tag, `${itName} on applicationStateChange`);
            const cb = new CustomApplicationStateChangeCallback();
            applicationContext.onApplicationStateChange(cb);

            hilog.info(domain, tag, `${itName} off applicationStateChange`);
            applicationContext.offApplicationStateChange(cb);

            hilog.info(domain, tag, `${itName} start EntryAbility1 ability`);
            const want: Want = {
              bundleName: `${BUNDLE_NAME}`,
              abilityName: 'EntryAbility1'
            }
            await uiAbilityContext.startAbility(want);
            await Utils.msSleep(2000);

            hilog.info(domain, tag, `${itName} EntryAbility1 moveAbilityToBackground`);
            const uiAbilityContext1 =
              AppStorage.get<common.UIAbilityContext>("UIAbilityContext1") as common.UIAbilityContext;
            await uiAbilityContext1.moveAbilityToBackground();
            await Utils.msSleep(2000);

            hilog.info(domain, tag, `${itName} EntryAbility moveAbilityToBackground`);
            await uiAbilityContext.moveAbilityToBackground();
            await Utils.msSleep(2000);
            hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isBackground: ${cb.isBackground}`);
            expect(cb.isBackground).assertFalse();

            hilog.info(domain, tag, `${itName} start EntryAbility ability`);
            await abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
            await Utils.msSleep(2000);
            hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isForeground: ${cb.isForeground}`);
            expect(cb.isForeground).assertFalse();
          } catch (err: BusinessError) {
            expect().assertFail();
            hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          }
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0300
     * @tc.desc   Call UIAbilityContext moveAbilityToBackground expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0300`;
        if (deviceSupport === 'false') {
          done();
        } else {
          try {
            hilog.info(domain, tag, `${itName} on applicationStateChange`);
            const cb = new CustomApplicationStateChangeCallback();
            applicationContext.onApplicationStateChange(cb);

            hilog.info(domain, tag, `${itName} off applicationStateChange`);
            applicationContext.offApplicationStateChange();

            hilog.info(domain, tag, `${itName} start EntryAbility1 ability`);
            const want: Want = {
              bundleName: `${BUNDLE_NAME}`,
              abilityName: 'EntryAbility1'
            }
            await uiAbilityContext.startAbility(want);
            await Utils.msSleep(2000);

            hilog.info(domain, tag, `${itName} EntryAbility1 moveAbilityToBackground`);
            const uiAbilityContext1 =
              AppStorage.get<common.UIAbilityContext>("UIAbilityContext1") as common.UIAbilityContext;
            await uiAbilityContext1.moveAbilityToBackground();
            await Utils.msSleep(2000);

            hilog.info(domain, tag, `${itName} EntryAbility moveAbilityToBackground`);
            await uiAbilityContext.moveAbilityToBackground();
            await Utils.msSleep(2000);
            hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isBackground: ${cb.isBackground}`);
            expect(cb.isBackground).assertFalse();

            hilog.info(domain, tag, `${itName} start EntryAbility ability`);
            await abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
            await Utils.msSleep(2000);
            hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isForeground: ${cb.isForeground}`);
            expect(cb.isForeground).assertFalse();
          } catch (err: BusinessError) {
            expect().assertFail();
            hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          }
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0100
     * @tc.desc   onInteropAbilityLifecycle（）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0100`;
        hilog.info(domain, tag, `${itName} start`);
        try {
          let cb: InteropAbilityLifecycleCallback = new MyInteropAbilityLifecycleCallback()
          hilog.info(domain, tag, `${itName} onInteropAbilityLifecycle`);
          applicationContext.onInteropAbilityLifecycle(cb)
          hilog.info(domain, tag, `${itName} offInteropAbilityLifecycle`);
          applicationContext.offInteropAbilityLifecycle(cb);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect().assertFail();
        }
        hilog.info(domain, tag, `${itName} end`);
        done();
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0200
     * @tc.desc   offInteropAbilityLifecycle（） no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0200`;
        hilog.info(domain, tag, `${itName} start`);
        try {
          let cb: InteropAbilityLifecycleCallback = new MyInteropAbilityLifecycleCallback()
          applicationContext.offInteropAbilityLifecycle(cb);
          expect().assertFail()
          done()
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect(err.code === 401).assertTrue();
          hilog.info(domain, tag, `${itName} end`);
          done();
        }
      })
  })
}


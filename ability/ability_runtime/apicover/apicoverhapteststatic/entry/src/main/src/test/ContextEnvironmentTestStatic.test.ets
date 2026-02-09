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
import { ShellCmdResult } from "application.shellCmdResult";
import common from '@ohos.app.ability.common';
import EnvironmentCallback from '@ohos.app.ability.EnvironmentCallback';
import { Configuration } from '@ohos.app.ability.Configuration';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';

const domain: int = 0x0000;
const tag = 'testTag'

class CustomEnvironmentCallback implements EnvironmentCallback {
  public configurationUpdated: boolean = false;

  onMemoryLevel(level: AbilityConstant.MemoryLevel): void {
    hilog.info(domain, tag, `EnvironmentCallback onMemoryLevel`);
  }

  onConfigurationUpdated(config: Configuration): void {
    hilog.info(domain, tag, `EnvironmentCallback onConfigurationUpdated`);
    this.configurationUpdated = true;
  }
}

export default function ContextEnvironmentStaticTest() {
  const BUNDLE_NAME: string = 'com.example.apicoverhaptest.static';

  describe('ContextEnvironmentStaticTest', () => {
    let applicationContext: common.ApplicationContext;

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
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      await abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
      await Utils.msSleep(2000);
      const uIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      applicationContext = uIAbilityContext.getApplicationContext();
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   SUB_AA_Context_EnvironmentTest_Static_0400
     * @tc.number SUB_AA_Context_EnvironmentTest_Static_0400
     * @tc.desc   Multiple registrations and deregistration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_Context_EnvironmentTest_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_AA_Context_EnvironmentTest_Static_0400';
        hilog.info(domain, tag, `${itName} start`);
        try {
          const count = 5;
          let callNum: number = 0;
          for (let i = 0; i < count; i++) {
            hilog.info(domain, tag, `${itName} on environment`);
            const cb = new CustomEnvironmentCallback();
            const callbackId = applicationContext.onEnvironment(cb);
            hilog.info(domain, tag, `${itName} callbackId:  ${callbackId}, callNum: ${callNum}`);

            await Utils.msSleep(700);

            let code: int | undefined = undefined;
            hilog.info(domain, tag, `${itName} off environment`);
            applicationContext.offEnvironment(callbackId, (err: BusinessError<void> | null): void => {
              hilog.info(domain, tag, `${itName} off environment err: code ${err?.code}, message: ${err?.message}`);
              code = err?.code;
            })

            await Utils.msSleep(700);

            expect(`${callbackId}`).assertEqual(`${callNum}`);
            expect(`${code}`).assertEqual('0');
            callNum++;
          }
        } catch (err) {
          expect().assertFail();
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.name   SUB_AA_Context_EnvironmentTest_Static_0500
     * @tc.number SUB_AA_Context_EnvironmentTest_Static_0500
     * @tc.desc   nregisterEnvironmentCallback interface input parameter is a nonexistent.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_Context_EnvironmentTest_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_AA_Context_EnvironmentTest_Static_0500';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} off environment`);
          applicationContext.offEnvironment(100, (err: BusinessError<void> | null): void => {
            hilog.info(domain, tag, `${itName} off err: code ${err?.code}, message ${err?.message}`);
            expect(`${err?.code}`).assertEqual('401');
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err) {
          hilog.info(domain, tag, `${itName} err: code ${err?.code}, message ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.name   SUB_AA_Context_EnvironmentTest_Static_0600
     * @tc.number SUB_AA_Context_EnvironmentTest_Static_0600
     * @tc.desc   unregisterEnvironmentCallback interface input parameter is negative.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_Context_EnvironmentTest_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_AA_Context_EnvironmentTest_Static_0600';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} off environment`);
          applicationContext.offEnvironment(-1, (err: BusinessError<void> | null): void => {
            hilog.info(domain, tag, `${itName} off err: code ${err?.code}, message ${err?.message}`);
            expect(`${err?.code}`).assertEqual('401');
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err) {
          hilog.info(domain, tag, `${itName} err: code ${err?.code}, message ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.name   SUB_AA_Context_EnvironmentTest_Static_0800
     * @tc.number SUB_AA_Context_EnvironmentTest_Static_0800
     * @tc.desc   nregisterEnvironmentCallback interface input parameter is a nonexistent.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_Context_EnvironmentTest_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_AA_Context_EnvironmentTest_Static_0800';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} off environment`);
          applicationContext.offEnvironment(100).then(() => {
            hilog.info(domain, tag, `${itName} off success`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          }).catch((e: Error) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} off err: code ${err?.code}, message ${err?.message}`);
            expect(`${err.code}`).assertEqual('401');
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err) {
          hilog.info(domain, tag, `${itName} err: code ${err?.code}, message ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.name   SUB_AA_Context_EnvironmentTest_Static_0900
     * @tc.number SUB_AA_Context_EnvironmentTest_Static_0900
     * @tc.desc   unregisterEnvironmentCallback interface input parameter is negative.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_Context_EnvironmentTest_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_AA_Context_EnvironmentTest_Static_0900';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} off environment`);
          applicationContext.offEnvironment(-1).then(() => {
            hilog.info(domain, tag, `${itName} off success`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          }).catch((e: Error) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} off err: code ${err?.code}, message ${err?.message}`);
            expect(`${err.code}`).assertEqual('401');
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err) {
          hilog.info(domain, tag, `${itName} err: code ${err?.code}, message ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.name   SUB_AA_Context_EnvironmentTest_Static_1000
     * @tc.number SUB_AA_Context_EnvironmentTest_Static_1000
     * @tc.desc   EnvironmentCallback triggered normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_Context_EnvironmentTest_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'SUB_AA_Context_EnvironmentTest_Static_1000';
      hilog.info(domain, tag, `${itName} start`);
      try {
        hilog.info(domain, tag, `${itName} on environment`);
        const cb = new CustomEnvironmentCallback();
        const callbackId = applicationContext.onEnvironment(cb);
        hilog.info(domain, tag, `${itName} callbackId:  ${callbackId}`);

        hilog.info(domain, tag, `${itName} set color mode`);
        applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        await Utils.msSleep(2000);

        hilog.info(domain, tag, `${itName} EnvironmentCallback configurationUpdated: ${cb.configurationUpdated}`);
        expect(cb.configurationUpdated).assertTrue();

        hilog.info(domain, tag, `${itName} off environment`);
        await applicationContext.offEnvironment(callbackId);
        hilog.info(domain, tag, `${itName} reset color mode`);
        applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
      } catch (err) {
        hilog.info(domain, tag, `${itName} err: code ${err?.code}, message ${err?.message}`);
        expect().assertFail();
      }
      done();
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   SUB_AA_Context_EnvironmentTest_Static_1100
     * @tc.number SUB_AA_Context_EnvironmentTest_Static_1100
     * @tc.desc   EnvironmentCallback triggered normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_Context_EnvironmentTest_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'SUB_AA_Context_EnvironmentTest_Static_1100';
      hilog.info(domain, tag, `${itName} start`);
      try {
        hilog.info(domain, tag, `${itName} on environment`);
        const cb = new CustomEnvironmentCallback();
        const callbackId = applicationContext.onEnvironment(cb);
        hilog.info(domain, tag, `${itName} callbackId:  ${callbackId}`);

        hilog.info(domain, tag, `${itName} set color mode`);
        applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
        await Utils.msSleep(2000);

        hilog.info(domain, tag, `${itName} EnvironmentCallback configurationUpdated: ${cb.configurationUpdated}`);
        expect(cb.configurationUpdated).assertTrue();

        hilog.info(domain, tag, `${itName} off environment`);
        await applicationContext.offEnvironment(callbackId);
        hilog.info(domain, tag, `${itName} reset color mode`);
        applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
      } catch (err) {
        hilog.info(domain, tag, `${itName} err: code ${err?.code}, message ${err?.message}`);
        expect().assertFail();
      }
      done();
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   SUB_AA_Context_EnvironmentTest_Static_1200
     * @tc.number SUB_AA_Context_EnvironmentTest_Static_1200
     * @tc.desc   EnvironmentCallback triggered normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_Context_EnvironmentTest_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'SUB_AA_Context_EnvironmentTest_Static_1200';
      hilog.info(domain, tag, `${itName} start`);
      try {
        hilog.info(domain, tag, `${itName} on environment`);
        const cb = new CustomEnvironmentCallback();
        const callbackId = applicationContext.onEnvironment(cb);
        hilog.info(domain, tag, `${itName} callbackId:  ${callbackId}`);

        hilog.info(domain, tag, `${itName} set language`);
        applicationContext.setLanguage('zh-cn');
        await Utils.msSleep(2000);

        hilog.info(domain, tag, `${itName} EnvironmentCallback configurationUpdated: ${cb.configurationUpdated}`);
        expect(cb.configurationUpdated).assertTrue();

        hilog.info(domain, tag, `${itName} off environment`);
        await applicationContext.offEnvironment(callbackId);
      } catch (err) {
        hilog.info(domain, tag, `${itName} err: code ${err?.code}, message ${err?.message}`);
        expect().assertFail();
      }
      done();
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   SUB_AA_Context_EnvironmentTest_Static_1300
     * @tc.number SUB_AA_Context_EnvironmentTest_Static_1300
     * @tc.desc   unregisterEnvironmentCallback execution is normal.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_Context_EnvironmentTest_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'SUB_AA_Context_EnvironmentTest_Static_1300';
      hilog.info(domain, tag, `${itName} start`);
      try {
        hilog.info(domain, tag, `${itName} on environment`);
        const cb = new CustomEnvironmentCallback();
        const callbackId = applicationContext.onEnvironment(cb);
        hilog.info(domain, tag, `${itName} callbackId:  ${callbackId}`);

        hilog.info(domain, tag, `${itName} off environment`);
        applicationContext.offEnvironment(callbackId, (err: BusinessError<void> | null): void => {
          hilog.info(domain, tag, `${itName} off environment err: code ${err?.code}, message: ${err?.message}`);
          expect(`${err?.code}`).assertEqual('0');

          hilog.info(domain, tag, `${itName} set color mode`);
          applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} EnvironmentCallback configurationUpdated: ${cb.configurationUpdated}`);
          expect(cb.configurationUpdated).assertFalse();

          hilog.info(domain, tag, `${itName} reset color mode`);
          applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);

          done();
          hilog.info(domain, tag, `${itName} end`);
        })
      } catch (err) {
        hilog.info(domain, tag, `${itName} err: code ${err?.code}, message ${err?.message}`);
        expect().assertFail();
        done();
        hilog.info(domain, tag, `${itName} end`);
      }
    })

    /**
     * @tc.name   SUB_AA_Context_EnvironmentTest_Static_1400
     * @tc.number SUB_AA_Context_EnvironmentTest_Static_1400
     * @tc.desc   unregisterEnvironmentCallback execution is normal.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_Context_EnvironmentTest_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'SUB_AA_Context_EnvironmentTest_Static_1400';
      hilog.info(domain, tag, `${itName} start`);
      try {
        hilog.info(domain, tag, `${itName} on environment`);
        const cb = new CustomEnvironmentCallback();
        const callbackId = applicationContext.onEnvironment(cb);
        hilog.info(domain, tag, `${itName} callbackId:  ${callbackId}`);

        hilog.info(domain, tag, `${itName} off environment`);
        applicationContext.offEnvironment(callbackId).then(() => {
          hilog.info(domain, tag, `${itName} set color mode`);
          applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} EnvironmentCallback configurationUpdated: ${cb.configurationUpdated}`);
          expect(cb.configurationUpdated).assertFalse();

          hilog.info(domain, tag, `${itName} reset color mode`);
          applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);

          done();
          hilog.info(domain, tag, `${itName} end`);
        }).catch((err: Error) => {
          hilog.info(domain, tag, `${itName} off err: code ${err?.code}, message ${err?.message}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${itName} end`);
        })
      } catch (err) {
        hilog.info(domain, tag, `${itName} err: code ${err?.code}, message ${err?.message}`);
        expect().assertFail();
        done();
        hilog.info(domain, tag, `${itName} end`);
      }
    })
  })
}
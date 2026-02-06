/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';

const PARAMETER_ERROR = 401;
let testAbilityContext: common.UIAbilityContext;

export default function applicationContextTest() {
  describe('applicationContextTest', () => {
    beforeAll(() => {
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
    })
    /**
     * @tc.name   TestAbilityAbilityRuntimeConfigrationApplicationContextSetColorMode0100
     * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetColorMode_0100
     * @tc.desc   Using the on method set color mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestAbilityAbilityRuntimeConfigrationApplicationContextSetColorMode0100', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'applicationContextTag', '%{public}s',
        'TestAbilityAbilityRuntimeConfigrationApplicationContextSetColorMode0100 begin');
      try {
        let applicationContext: common.ApplicationContext = testAbilityContext?.getApplicationContext();
        applicationContext.setColorMode(null);
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'applicationContextTag', '%{public}s',
          'TestAbilityAbilityRuntimeConfigrationApplicationContextSetColorMode0100 failed ' + JSON.stringify(error));
        expect(error.code).assertEqual(PARAMETER_ERROR);
        done();
      }
    });

    /**
     * @tc.name   TestAbilityAbilityRuntimeConfigrationApplicationContextSetColorMode0200
     * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetColorMode_0200
     * @tc.desc   Using the on method set color mode and check the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestAbilityAbilityRuntimeConfigrationApplicationContextSetColorMode0200', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'applicationContextTag', '%{public}s',
        'TestAbilityAbilityRuntimeConfigrationApplicationContextSetColorMode0200 begin');
      try {
        let applicationContext: common.ApplicationContext = testAbilityContext?.getApplicationContext();
        let colorMode = testAbilityContext.config.colorMode;
        if (colorMode === ConfigurationConstant.ColorMode.COLOR_MODE_DARK) {
          applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
          sleep(2000);
          expect(testAbilityContext.config.colorMode === ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
        } else {
          applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
          sleep(2000);
          expect(testAbilityContext.config.colorMode === ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        }
        applicationContext.setColorMode(colorMode);
        sleep(2000);
        done();
      } catch (error) {
        hilog.error(0x0000, 'applicationContextTag', '%{public}s',
          'TestAbilityAbilityRuntimeConfigrationApplicationContextSetColorMode0200 failed ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   TestAbilityAbilityRuntimeConfigrationApplicationContextSetLanguage0100
     * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0100
     * @tc.desc   Using the on method set language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestAbilityAbilityRuntimeConfigrationApplicationContextSetLanguage0100', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'applicationContextTag', '%{public}s',
        'TestAbilityAbilityRuntimeConfigrationApplicationContextSetLanguage0100 begin');
      try {
        let applicationContext: common.ApplicationContext = testAbilityContext?.getApplicationContext();
        applicationContext.setLanguage(null);
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'applicationContextTag', '%{public}s',
          'TestAbilityAbilityRuntimeConfigrationApplicationContextSetLanguage0100 failed ' + JSON.stringify(error));
        expect(error.code).assertEqual(PARAMETER_ERROR);
        done();
      }
    });

    /**
     * @tc.name   TestAbilityAbilityRuntimeConfigrationApplicationContextSetLanguage0200
     * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0200
     * @tc.desc   Application call interface to set language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestAbilityAbilityRuntimeConfigrationApplicationContextSetLanguage0200', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'applicationContextTag', '%{public}s',
        'TestAbilityAbilityRuntimeConfigrationApplicationContextSetLanguage0200 begin');
      try {
        let applicationContext: common.ApplicationContext = testAbilityContext?.getApplicationContext();
        let language = testAbilityContext.config.language;
        if (language === 'zh-cn') {
          applicationContext.setLanguage('en-us');
          sleep(2000);
          expect(testAbilityContext.config.language === 'en-us');
        } else {
          applicationContext.setLanguage('zh-cn');
          sleep(2000);
          expect(testAbilityContext.config.language === 'zh-cn');
        }
        applicationContext.setLanguage(language);
        sleep(2000);
        done();
      } catch (error) {
        hilog.error(0x0000, 'applicationContextTag', '%{public}s',
          'TestAbilityAbilityRuntimeConfigrationApplicationContextSetLanguage0200 failed ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   TestAbilityAbilityRuntimeConfigrationApplicationContextSetLanguageMode0300
     * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0300
     * @tc.desc   The application parameter is undefined calling the interface to set the language
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestAbilityAbilityRuntimeConfigrationApplicationContextSetLanguageMode0300', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'applicationContextTag', '%{public}s',
        'TestAbilityAbilityRuntimeConfigrationApplicationContextSetLanguageMode0300 begin');
      try {
        let applicationContext: common.ApplicationContext = testAbilityContext?.getApplicationContext();
        applicationContext.setLanguage(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'applicationContextTag', '%{public}s',
          'TestAbilityAbilityRuntimeConfigrationApplicationContextSetLanguageMode0300 failed ' + JSON.stringify(error));
        expect(error.code).assertEqual(PARAMETER_ERROR);
        done();
      }
    });

    /**
     * @tc.name   TestAbilityAbilityRuntimeConfigrationApplicationContextSetColorMode0300
     * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetColorMode_0300
     * @tc.desc   Using the on method set color mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TestAbilityAbilityRuntimeConfigrationApplicationContextSetColorMode0300', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'applicationContextTag', '%{public}s',
        'TestAbilityAbilityRuntimeConfigrationApplicationContextSetColorMode0300 begin');
      try {
        let applicationContext: common.ApplicationContext = testAbilityContext?.getApplicationContext();
        applicationContext.setColorMode(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'applicationContextTag', '%{public}s',
          'TestAbilityAbilityRuntimeConfigrationApplicationContextSetColorMode0300 failed ' + JSON.stringify(error));
        expect(error.code).assertEqual(PARAMETER_ERROR);
        done();
      }
    });
  });
}

let sleep = (ms: number): Promise<void> => {
  return new Promise(resolve => setTimeout(resolve, ms));
}

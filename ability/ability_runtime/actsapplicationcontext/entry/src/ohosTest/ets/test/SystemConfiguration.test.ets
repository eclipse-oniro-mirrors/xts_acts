/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach } from '@ohos/hypium';
import { common, systemConfiguration, ConfigurationConstant, abilityManager, application } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function systemConfigurationTest() {
  describe('SystemConfigurationTest', () => {
    let applicationContext: common.ApplicationContext = application.getApplicationContext();
    let testAbilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
    let callbackRegistered = false;
    let callbackTriggered = false;
    let timeoutId: number;

    beforeAll(() => {
      applicationContext = application.getApplicationContext();
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
      testAbilityContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
    });
    beforeEach(() => {
      applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
      testAbilityContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
      callbackTriggered = false;
    });

    afterEach(async() => {
      try{
        applicationContext.offSystemConfigurationUpdated();
        if (timeoutId) {
          clearTimeout(timeoutId);
        } 
      }catch(err){
        console.info(`afterEach error:` + (err as BusinessError).code);
        console.info(`afterEach error:` + (err as BusinessError).message);
      }
    });

    /**
     * @tc.name SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0500
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0500
     * @tc.desc 测试UIAbilityContext.setColorMode不会触发onColorModeUpdated回调
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0500 start`);
      let callback: systemConfiguration.UpdatedCallback = {
        onColorModeUpdated(colorMode: ConfigurationConstant.ColorMode) {
          console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0500 onColorModeUpdated:` + colorMode);
          callbackTriggered = true;
        },
        onFontSizeScaleUpdated(fontSizeScale: number) {
          console.info(`system configuration updated ability:` + fontSizeScale);
          expect().assertFail();
        },
        onFontWeightScaleUpdated(fontWeightScale: number) {
          console.info(`system configuration updated ability:` + fontWeightScale);
          expect().assertFail();
        },
        onLanguageUpdated(language: string) {
          console.info(`system configuration updated ability:` + language);
          expect().assertFail();
        },
        onFontIdUpdated(fontId: string) {
          console.info(`system configuration updated ability:` + fontId);
          expect().assertFail();
        },
        onMCCUpdated(mcc: string) {
          console.info(`system configuration updated ability:` + mcc);
          expect().assertFail();
        },
        onMNCUpdated(mnc: string) {
          console.info(`system configuration updated ability:` + mnc);
          expect().assertFail();
        },
        onHasPointerDeviceUpdated(hasPointerDevice: boolean) {
          console.info(`system configuration updated ability:` + hasPointerDevice);
          expect().assertFail();
        },
        onLocaleUpdated(locale: string) {
          console.info(`system configuration updated ability:` + locale);
          expect().assertFail();
        }
      };
      try {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0500: applicationContext.onSystemConfigurationUpdated`);
        applicationContext.onSystemConfigurationUpdated(callback);
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0500: testAbilityContext.setColorMode`);
        testAbilityContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        timeoutId = setTimeout(() => {
          console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0500: check callbackTriggered`);
          expect(callbackTriggered).assertFalse();
          applicationContext.offSystemConfigurationUpdated(callback);
          done();
        }, 3000);
      } catch (error) {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0500:` + (error as BusinessError).code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0600
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0600
     * @tc.desc 测试ApplicationContext.setColorMode不会触发onColorModeUpdated回调
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0600 start`);
      let callback: systemConfiguration.UpdatedCallback = {
        onColorModeUpdated(colorMode: ConfigurationConstant.ColorMode) {
          console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0600 onColorModeUpdated:` + colorMode);
          callbackTriggered = true;
        }
      };

      try {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0600: applicationContext.onSystemConfigurationUpdated`);
        applicationContext.onSystemConfigurationUpdated(callback);
        callbackRegistered = true;

        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0600: applicationContext.setColorMode`);
        applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);

        timeoutId = setTimeout(() => {
          console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0600: check callbackTriggered`);
          expect(callbackTriggered).assertFalse();
          applicationContext.offSystemConfigurationUpdated(callback);
          done();
        }, 3000);
      } catch (error) {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0600:` + (error as BusinessError).code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0800
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0800
     * @tc.desc 测试ApplicationContext.setFontSizeScale不会触发onFontSizeScaleUpdated回调
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0800 start`);
      let callback: systemConfiguration.UpdatedCallback = {
        onFontSizeScaleUpdated(fontSizeScale: number) {
          console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0800 onFontSizeScaleUpdated:` + fontSizeScale);
          callbackTriggered = true;
        }
      };

      try {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0800: applicationContext.onSystemConfigurationUpdated`);
        applicationContext.onSystemConfigurationUpdated(callback);
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0800: applicationContext.setFontSizeScale`);
        applicationContext.setFontSizeScale(1.2);

        timeoutId = setTimeout(() => {
          console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0800: check callbackTriggered`);
          expect(callbackTriggered).assertFalse();
          applicationContext.offSystemConfigurationUpdated(callback);
          done();
        }, 3000);
      } catch (error) {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0800:` + (error as BusinessError).code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0900
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0900
     * @tc.desc 测试ApplicationContext.setLanguage不会触发onLanguageUpdated回调
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0900 start`);
      let callback: systemConfiguration.UpdatedCallback = {
        onLanguageUpdated(language: string) {
          console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0900 onLanguageUpdated:` + language);
          callbackTriggered = true;
        }
      };

      try {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0900: applicationContext.onSystemConfigurationUpdated`);
        applicationContext.onSystemConfigurationUpdated(callback);
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0900: applicationContext.setLanguage`);
        applicationContext.setLanguage('zh-CN');

        timeoutId = setTimeout(() => {
          console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0900: check callbackTriggered`);
          expect(callbackTriggered).assertFalse();
          applicationContext.offSystemConfigurationUpdated(callback);
          done();
        }, 3000);
      } catch (error) {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0900:` + (error as BusinessError).code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_1000
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_1000
     * @tc.desc 测试ApplicationContext.setFont不会触发onFontIdUpdated回调
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_1000 start`);
      let callback: systemConfiguration.UpdatedCallback = {
        onFontIdUpdated(fontId: string) {
          console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_1000 onFontIdUpdated:` + fontId);
          callbackTriggered = true;
        }
      };

      try {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_1000: applicationContext.onSystemConfigurationUpdated`);
        applicationContext.onSystemConfigurationUpdated(callback);

        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_1000: applicationContext.setFont`);
        applicationContext.setFont('test-font');

        timeoutId = setTimeout(() => {
          console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_1000: check callbackTriggered`);
          expect(callbackTriggered).assertFalse();
          applicationContext.offSystemConfigurationUpdated(callback);
          done();
        }, 3000);
      } catch (error) {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_1000:` + (error as BusinessError).code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0100
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0100
     * @tc.desc 测试onSystemConfigurationUpdated入参undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        applicationContext.onSystemConfigurationUpdated(undefined);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0100:` + (error as BusinessError).code);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0200
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0200
     * @tc.desc 测试onSystemConfigurationUpdated入参null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        applicationContext.onSystemConfigurationUpdated(null);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0200:` + (error as BusinessError).code);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0300
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0300
     * @tc.desc 测试offSystemConfigurationUpdated入参null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        applicationContext.offSystemConfigurationUpdated(null);
        expect(true).assertFalse();
        done();
      } catch (error) {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0300:` + (error as BusinessError).code);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0400
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0400
     * @tc.desc 测试offSystemConfigurationUpdated入参undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        applicationContext.offSystemConfigurationUpdated(undefined);
        expect(true).assertFalse();
        done();
      } catch (error) {
        console.info(`SUB_Ability_AbilityRuntime_ApplicationContext_SystemConfigurationUpdated_0400:` + (error as BusinessError).code);
        expect(error.code).assertEqual(401);
        done();
      }
    });

  });
}

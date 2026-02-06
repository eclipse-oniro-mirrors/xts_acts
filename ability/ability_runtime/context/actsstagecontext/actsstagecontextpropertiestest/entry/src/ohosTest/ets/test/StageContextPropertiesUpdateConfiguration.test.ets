/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium'
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
import common from '@ohos.app.ability.common';
import { EnvironmentCallback } from '@kit.AbilityKit';

export default function stageContextPropertiesTestUpdateConfiguration(applicationContext: common.ApplicationContext) {
  describe('StageContextPropertiesUpdateConfiguration.test', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetColorMode_0100
     * @tc.number SUB_AA_SetColorMode_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetColorMode_0100', Level.LEVEL0, (done: Function) => {
      console.info('=============ApplicationContext_SetColorMode_0100============')
      let resultTag = -1
      let environmentId:number = -1
      let environmentCallback: EnvironmentCallback = {
        onConfigurationUpdated(config){
          console.info(`=============envCallback onConfigurationUpdated success: ${JSON.stringify(config)}`);
          resultTag = 0;
        },
        onMemoryLevel(level) {
          console.log(`onMemoryLevel level: ${level}`);
        }
      };
      environmentId = applicationContext.on('environment', environmentCallback);
      applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
      setTimeout(()=>{
        applicationContext.off('environment', environmentId);
        expect(resultTag).assertEqual(0)
        done()
      }, 1000)
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetColorMode_0200
     * @tc.number SUB_AA_SetColorMode_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetColorMode_0200', Level.LEVEL0, (done: Function) => {
      console.info('=============ApplicationContext_SetColorMode_0200============')
      let resultTag = -1
      let environmentId:number = -1;
      let environmentCallback: EnvironmentCallback = {
        onConfigurationUpdated(config){
          console.info(`=============envCallback onConfigurationUpdated success: ${JSON.stringify(config)}`);
          resultTag = 0;
          expect(typeof(config.fontId)).assertEqual('string');
        },
        onMemoryLevel(level) {
          console.log(`onMemoryLevel level: ${level}`);
        }
      };
      environmentId = applicationContext.on('environment', environmentCallback);
      applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
      setTimeout(()=>{
        applicationContext.off('environment', environmentId);
        expect(resultTag).assertEqual(0)
        done()
      }, 1000)
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0100
     * @tc.number SUB_AA_SetLanguage_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0100', Level.LEVEL0, (done: Function) => {
      console.info('=============ApplicationContext_SetLanguage_0100============')
      try {
        applicationContext.setLanguage(undefined);
        expect().assertFail()
        done()
      } catch(e) {
        expect(true).assertTrue()
        done()
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0200
     * @tc.number SUB_AA_SetLanguage_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0200', Level.LEVEL0, (done: Function) => {
      console.info('=============ApplicationContext_SetLanguage_0200============')
      let resultTag = -1
      let environmentId:number = -1
      let environmentCallback: EnvironmentCallback = {
        onConfigurationUpdated(config){
          console.info(`=============envCallback onConfigurationUpdated success: ${JSON.stringify(config)}`);
          resultTag = 0
        },
        onMemoryLevel(level) {
          console.log(`onMemoryLevel level: ${level}`);
        }
      };
      environmentId = applicationContext.on('environment', environmentCallback);
      applicationContext.setLanguage('zh-cn');
      setTimeout(()=>{
        applicationContext.off('environment', environmentId);
        expect(resultTag).assertEqual(0)
        done()
      }, 1000)
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFont_0100
     * @tc.number SUB_AA_SetFont_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFont_0100', Level.LEVEL0, (done: Function) => {
      console.info('=============ApplicationContext_SetFont_0100============')
      try {
        applicationContext.setFont("fontName");
        done()
      } catch(e) {
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFont_0200
     * @tc.number SUB_AA_SetFont_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFont_0200', Level.LEVEL0, (done: Function) => {
      console.info('=============ApplicationContext_SetFont_0200============')
      try {
        applicationContext.setFont(undefined);
        expect().assertFail()
        done()
      } catch(e) {
        expect(JSON.stringify(e.code)).assertEqual("401")
        done()
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFont_0300
     * @tc.number SUB_AA_SetFont_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFont_0300', Level.LEVEL0, (done: Function) => {
      console.info('=============ApplicationContext_SetFont_0300============')
      try {
        applicationContext.setFont(null);
        expect().assertFail()
        done()
      } catch(e) {
        expect(JSON.stringify(e.code)).assertEqual("401")
        done()
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFontSize__0100
     * @tc.number SUB_AA_SetFontSize_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFontSize__0100', Level.LEVEL0, (done: Function) => {
      console.info('=============ApplicationContext_SetFontSize__0100============')
      try {
        applicationContext.setFontSizeScale(undefined);
        expect().assertFail()
        done()
      } catch(e) {
        expect(JSON.stringify(e.code)).assertEqual("401")
        done()
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFontSize__0200
     * @tc.number SUB_AA_SetFontSize_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFontSize__0200', Level.LEVEL0, (done: Function) => {
      console.info('=============ApplicationContext_SetFontSize__0200============')
      try {
        applicationContext.setFontSizeScale(-1);
        expect().assertFail()
        done()
      } catch(e) {
        expect(JSON.stringify(e.code)).assertEqual("401")
        done()
      }
    });

  })
}
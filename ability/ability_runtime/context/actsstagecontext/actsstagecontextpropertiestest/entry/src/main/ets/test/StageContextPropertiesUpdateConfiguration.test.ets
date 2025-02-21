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

import { describe, it, expect } from '@ohos/hypium'
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';

export default function stageContextPropertiesTestUpdateConfiguration(applicationContext) {
    describe('StageContextPropertiesUpdateConfiguration.test', function () {

        /**
         * @tc.number: SUB_AA_SetColorMode_0100
         * @tc.name: Check if the application can be successfully set to the color mode
         * @tc.desc:  Function test
         * @tc.level   1
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetColorMode_0100', 0, function (done) {
            console.info('=============ApplicationContext_SetColorMode_0100============')
            let resultTag = -1
            let environmentId:number = -1
            let envCallback = {
                onConfigurationUpdated(config){
                    console.info(`=============envCallback onConfigurationUpdated success: ${JSON.stringify(config)}`);
                    resultTag = 0
                },
            };
            environmentId = applicationContext.on('environment', envCallback);
            applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
            setTimeout(()=>{
                applicationContext.off('environment', environmentId);
                expect(resultTag).assertEqual(0)
                done()
            }, 2000)
        });

         /**
         * @tc.number: SUB_AA_SetColorMode_0200
         * @tc.name: Check if the application can be successfully set to the color mode
         * @tc.desc:  Function test
         * @tc.level   1
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetColorMode_0200', 0, function (done) {
            console.info('=============ApplicationContext_SetColorMode_0200============')
            let resultTag = -1
            let environmentId:number = -1
            let envCallback = {
                onConfigurationUpdated(config){
                    console.info(`=============envCallback onConfigurationUpdated success: ${JSON.stringify(config)}`);
                    resultTag = 0
                },
            };
            environmentId = applicationContext.on('environment', envCallback);
            applicationContext.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
            setTimeout(()=>{
                applicationContext.off('environment', environmentId);
                expect(resultTag).assertEqual(0)
                done()
            }, 2000)
        });

         /**
         * @tc.number: SUB_AA_SetLanguage_0100
         * @tc.name: Check if the application can be successfully set to the language
         * @tc.desc:  Function test
         * @tc.level   1
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0100', 0, function (done) {
            console.info('=============ApplicationContext_SetLanguage_0100============')
            try {
                applicationContext.setLanguage();
                expect().assertFail()
                done()
            } catch(e) {
                expect(true).assertTrue()
                done()
            }
        });

         /**
         * @tc.number: SUB_AA_SetLanguage_0200
         * @tc.name: Check if the application can be successfully set to the language
         * @tc.desc:  Function test
         * @tc.level   1
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0200', 0, function (done) {
            console.info('=============ApplicationContext_SetLanguage_0200============')
            let resultTag = -1
            let environmentId:number = -1
            let envCallback = {
                onConfigurationUpdated(config){
                    console.info(`=============envCallback onConfigurationUpdated success: ${JSON.stringify(config)}`);
                    resultTag = 0
                },
            };
            environmentId = applicationContext.on('environment', envCallback);
            applicationContext.setLanguage('zh-cn');
            setTimeout(()=>{
                applicationContext.off('environment', environmentId);
                expect(resultTag).assertEqual(0)
                done()
            }, 2000)
        });
        
         /**
         * @tc.number: SUB_AA_SetFont_0100
         * @tc.name: Check if the application can be successfully set to the font
         * @tc.desc:  Function test
         * @tc.level   1
         */
         it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFont_0100', 0, function (done) {
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
         * @tc.number: SUB_AA_SetFont_0200
         * @tc.name: Check wrong parameters
         * @tc.desc:  Function test
         * @tc.level   1
         */
         it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFont_0200', 0, function (done) {
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
         * @tc.number: SUB_AA_SetFont_0300
         * @tc.name: Check wrong parameters
         * @tc.desc:  Function test
         * @tc.level   1
         */
         it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFont_0300', 0, function (done) {
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
         * @tc.number: SUB_AA_SetFontSize_0100
         * @tc.name: Check wrong parameters
         * @tc.desc:  Function test
         * @tc.level   1
         */
         it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFontSize__0100', 0, function (done) {
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
         * @tc.number: SUB_AA_SetFontSize_0200
         * @tc.name: Check wrong parameters
         * @tc.desc:  Function test
         * @tc.level   1
         */
         it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetFontSize__0200', 0, function (done) {
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
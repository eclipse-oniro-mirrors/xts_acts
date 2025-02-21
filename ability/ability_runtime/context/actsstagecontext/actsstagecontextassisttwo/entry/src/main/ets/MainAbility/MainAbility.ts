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

import Ability from '@ohos.app.ability.UIAbility'
import commonEvent from '@ohos.commonEvent'

export default class MainAbility extends Ability {
    onCreate(want: any, launchParam: any) {
        console.info('ActsStageContextAssistTwo MainAbility4 onCreate')
    }

    onDestroy() {
        console.info('MainAbilityMonitor onDestroy')
    }

    onWindowStageCreate(windowStage) {
        console.info('ActsStageContextAssistTwo MainAbility4 onWindowStageCreate')
        windowStage.setUIContent(this.context, 'MainAbility/pages/index', null)
    }

    onWindowStageDestroy() {
        console.info('ActsStageContextAssistTwo MainAbility4 onWindowStageDestroy')
    }

    async onForeground() {
        console.info('ActsStageContextAssistTwo MainAbility4 onForeground')
        let contextJson = {
            'cacheDir': this.context.cacheDir, 'tempDir': this.context.tempDir, 'filesDir': this.context.filesDir,
            'distributedFilesDir': this.context.distributedFilesDir, 'databaseDir': this.context.databaseDir,
            'preferencesDir': this.context.preferencesDir, 'bundleCodeDir': this.context.bundleCodeDir
        };

        let abilityAppContext = this.context.getApplicationContext()

        let appContextJson = {
            'cacheDir': abilityAppContext.cacheDir, 'tempDir': abilityAppContext.tempDir, 'filesDir': abilityAppContext.filesDir,
            'distributedFilesDir': abilityAppContext.distributedFilesDir, 'databaseDir': abilityAppContext.databaseDir,
            'preferencesDir': abilityAppContext.preferencesDir, 'bundleCodeDir': abilityAppContext.bundleCodeDir
        };

        let errCode;

        try {
            this.context.createBundleContext("com.example.stagecontextpropertiestest")
        } catch (error) {
            console.log("ActsStageContextAssistTwo createBundleContext is error:" + JSON.stringify(error))
            errCode = error.code
        }

        let commonEventData = {
            parameters: {
                abilityContextAssistTwo: contextJson,
                abilityAppContextAssistTwo: appContextJson,
                abilityBundleContextTest: errCode
            }
        }
        commonEvent.publish("StartMainAbility4_CommonEvent_ContextOne", commonEventData, () => {
            console.log("Publish StartMainAbility4_CommonEvent_ContextOne callback")
        })
    }

    onBackground() {
        console.info('ActsStageContextAssistTwo MainAbility4 onBackground')
    }
};
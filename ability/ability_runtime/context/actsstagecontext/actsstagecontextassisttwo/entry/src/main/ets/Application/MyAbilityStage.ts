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

import AbilityStage from "@ohos.app.ability.AbilityStage"
import commonEvent from '@ohos.commonEvent'

function sleep(delay) {
    let start = new Date().getTime();
    while (true) {
        if (new Date().getTime() - start > delay) {
            break;
        }
    }
}

export default class MyAbilityStage extends AbilityStage {
    onCreate() {
        console.info("ActsStageContextAssistTwo AbilityStage onCreate")
        globalThis.abilityStageContextB = this.context
    }

    onAcceptWant(want) {
        console.log("ActsStageContextAssistTwo onAcceptWant called want:" + JSON.stringify(want));
        async function publishContext() {
            let stageContextJson = {
                'cacheDir': globalThis.abilityStageContextB.cacheDir, 'tempDir': globalThis.abilityStageContextB.tempDir,
                'filesDir': globalThis.abilityStageContextB.filesDir, 'distributedFilesDir': globalThis.abilityStageContextB.distributedFilesDir,
                'databaseDir': globalThis.abilityStageContextB.databaseDir, 'preferencesDir': globalThis.abilityStageContextB.preferencesDir,
                'bundleCodeDir': globalThis.abilityStageContextB.bundleCodeDir
            };

            let stageAppContext = globalThis.abilityStageContextB.getApplicationContext()

            let stageAppContextJson = {
                'cacheDir': stageAppContext.cacheDir, 'tempDir': stageAppContext.tempDir, 'filesDir': stageAppContext.filesDir,
                'distributedFilesDir': stageAppContext.distributedFilesDir, 'databaseDir': stageAppContext.databaseDir,
                'preferencesDir': stageAppContext.preferencesDir, 'bundleCodeDir': stageAppContext.bundleCodeDir
            };

            let commonEventData = {
                parameters: {
                    abilityStageContextAssistOne: stageContextJson,
                    abilityStageAppContextAssistOne: stageAppContextJson,
                }
            }
            commonEvent.publish("AssistContextTwo_StageAbilityA_Start_CommonEvent", commonEventData, () => {
                console.log("Publish AssistContextTwo_StageAbilityA_Start_CommonEvent callback")
            })
        }
        publishContext()
        sleep(500)
        let abilityId = want.parameters.startId.toString();
        return abilityId;
    }
}
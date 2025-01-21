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

export default class MainAbility extends Ability {
    onCreate(want,launchParam){
        // Ability is creating, initialize resources for this ability
        console.log("MainAbility onCreate");
        globalThis.abilityWant = want;
        globalThis.abilityContext = this.context;
        globalThis.applicationContext = this.context.getApplicationContext();
        globalThis.requestDialogSuccess = false;
        globalThis.validRequestInfo = false;
        globalThis.validRequestCallback = false;
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("MainAbility onDestroy");
        globalThis.applicationContext.killAllProcesses().then((data)=>{
          console.log(`MainAbility getRunningProcessInformation data ${JSON.stringify(data)}`);
        }).catch((err)=>{
          console.log(`MainAbility getRunningProcessInformation err  ${JSON.stringify(err)}`);
        })

        globalThis.applicationContext.killAllProcesses((err, data)=>{
          console.log(`MainAbility getRunningProcessInformation data ${JSON.stringify(data)}
          err: ${JSON.stringify(err)}`);
        })
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("MainAbility onWindowStageCreate");
        windowStage.setUIContent(this.context, "MainAbility/pages/index/index", null)
    }

    onWindowStageDestroy() {
        //Main window is destroyed, release UI related resources
        console.log("MainAbility onWindowStageDestroy");
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("MainAbility onForeground");
    }

    onBackground() {
        // Ability has back to background
        console.log("MainAbility onBackground");
    }
};
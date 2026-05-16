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
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import commonEventManager from '@ohos.commonEvent';

let type:number = 0;
let onWindowStageWillDestoryExecutCount = 0;
let mainAbility13onForeground = 0;
let offCatchError = false;

export default class MainAbility13 extends UIAbility {
    onCreate(want:Want, launchParam) {
        hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory', '%{public}s', 'Ability onCreate' + JSON.stringify(want));
        type = want.parameters.type as number;
        onWindowStageWillDestoryExecutCount = 0;
        hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory', '%{public}s', 'Ability onCreate' + JSON.stringify(type));
    }

    onDestroy() {
        hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory', '%{public}s', 'Ability onDestroy, onWindowStageWillDestoryExecutCount: ' + onWindowStageWillDestoryExecutCount);
        commonEventManager.publish("MainAbility13onDestroy", {
            parameters: {
                'onWindowStageWillDestoryExecutCount': onWindowStageWillDestoryExecutCount,
                'offCatchError': offCatchError
            }
        }, (err, data)=>{
            hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory', '%{public}s', 'publish err: ' + err);
            hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory', '%{public}s', 'publish err: ' + data);
        })
    }

    onWindowStageCreate(windowStage: window.WindowStage) {
        // Main window is created, set main page for this ability
        hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory', '%{public}s', 'Ability onWindowStageCreate');

        windowStage.loadContent('MainAbility/pages/index13', (err, data) => {
            if (err.code) {
                hilog.error(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
        });
        if (type == 2) {
            windowStage.on('windowStageEvent', (data) => {
                console.log(`SUB_Ability_AbilityRuntime_OnWindowStageWillDestory windowStageEvent is : ${JSON.stringify(data)}`);
            })
        }
    }

    onWindowStageWillDestroy(windowStage: window.WindowStage) {
        onWindowStageWillDestoryExecutCount++;
        if (type == 2) {
            try {
                windowStage.off('windowStageEvent', (data) => {
                    console.log(`SUB_Ability_AbilityRuntime_OnWindowStageWillDestory windowStageEvent is : ${JSON.stringify(data)}`);
                })
            }catch (e){
                console.log(`SUB_Ability_AbilityRuntime_OnWindowStageWillDestory off catch error is : ${JSON.stringify(e)}`);
                offCatchError = true;
            }
        }
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory', '%{public}s', 'Ability onWindowStageDestroy');
    }

    onForeground() {
        mainAbility13onForeground++;
        // Ability has brought to foreground
        hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory', '%{public}s', 'Ability onForeground');
        if (type == 0 || type == 2) {
            this.terminateSelfTimeout();
        }
        if (type == 1) {
            setTimeout(()=>{
                commonEventManager.publish("MainAbility13onForeground", {
                    parameters:{
                        'mainAbility13onForeground':mainAbility13onForeground
                    }
                }, (err, data)=>{
                    hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory onForeground', '%{public}s', 'publish err: ' + err);
                    hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory onForeground', '%{public}s', 'publish err: ' + data);
                })
            }, 1000)
            if (mainAbility13onForeground == 2) {
                this.terminateSelfTimeout();
            }
        }

    }

    terminateSelfTimeout(){
        setTimeout(()=>{
            this.context.terminateSelf()
        }, 1500)
    }

    onBackground() {
        // Ability has back to background
        hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory', '%{public}s', 'Ability onBackground');
        if (type == 1) {
            setTimeout(()=>{
                commonEventManager.publish("MainAbility13onBackground", (err, data)=>{
                    hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory onBackground', '%{public}s', 'publish err: ' + err);
                    hilog.info(0x0000, 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory onBackground', '%{public}s', 'publish err: ' + data);
                })
            }, 1000)
        }
    }
}

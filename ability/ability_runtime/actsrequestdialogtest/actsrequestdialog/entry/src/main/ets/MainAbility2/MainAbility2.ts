/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import dialogRequest from '@ohos.app.ability.dialogRequest'

async function publishEvent() {
    var event = 'ACTS_REQUEST_DIALOG_EVENT1';

    var commonEventPublishData = {
        parameters: {
            instanceCount: 1,
        }
    };

    commonEvent.publish(event, commonEventPublishData, () => {
        console.log('============>publish event success.==========>>')
    });

}

export default class MainAbility2 extends Ability {

    onCreate(want, launchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("MainAbility2 onCreate");
        globalThis.abilityWant2 = want;
        globalThis.requestDialogSuccess = true;

        try {
            let requestInfo = dialogRequest.getRequestInfo(want);
            if (requestInfo) {
                globalThis.validRequestInfo = true;
                console.log("MainAbility2 requestInfo is valid");
            } else {
                console.log("MainAbility2 requestInfo is invalid");
            }

            let requestCallback = dialogRequest.getRequestCallback(want);
            if (requestCallback) {
                console.log("MainAbility2 requestCallback is valid");
                globalThis.validRequestCallback = true;
                let resultCode = {
                    result : dialogRequest.ResultCode.RESULT_CANCEL,
                };
                let resultCode2 ={
                  result : dialogRequest.ResultCode.RESULT_OK,
                };
                console.log(`resultCjode2 is ${JSON.stringify(resultCode2)}`);
                requestCallback.setRequestResult(resultCode);
            } else {
                console.log("MainAbility2 requestCallback is invalid");
            }
            publishEvent();
        } catch {
            console.log("MainAbility2 testRequest fail");
        }

        console.log("AbilityMultiInstanceAppA abilityWant = " + JSON.stringify( globalThis.abilityWant2));
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("MainAbility2 onDestroy");
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("MainAbility2 onWindowStageCreate")
        globalThis.abilityContext2 = this.context;
        windowStage.setUIContent(this.context, "MainAbility/pages/second/second", null);
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
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

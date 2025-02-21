/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import Ability from '@ohos.app.ability.UIAbility'
import Window from '@ohos.window'
import commonEvent from '@ohos.commonEvent'
import ErrorManager from "@ohos.app.ability.errorManager"
let message;
let commonEventData={
    parameters:{
        message:message,
    }
}

export default class EntryAbility extends Ability {
    onCreate(want, launchParam) {
        globalThis.want = want;
        globalThis.context = this.context;
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
        hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
        hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    }

    onDestroy() {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    }

    onWindowStageCreate(windowStage: Window.WindowStage) {
        // Main window is created, set main page for this ability
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

        windowStage.loadContent('pages/Index', (err, data) => {
            if (err.code) {
                hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.ERROR);
                hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
            hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
        });
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    }

    onForeground() {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
        let observer = undefined;
        if (globalThis.want.action == "Acts_RegisterJsErrorCallback_0100") {
            observer = {
                onUnhandledException(strMsg){
                    commonEventData.parameters.message = strMsg;
                    console.info("====>Acts_RegisterJsErrorCallback_0100 onUnhandledException Message: " + strMsg);
                    commonEvent.publish("ACTS_RegisterEvent_First", commonEventData, (err) => {
                        console.info("====>Acts_RegisterJsErrorCallback_0100 publish err: " + JSON.stringify(err));
                        setTimeout(()=>{
                            globalThis.context.terminateSelf().then(()=>{
                                console.info("====>Acts_RegisterJsErrorCallback_0100 rely terminateSelf end");
                            }).catch((err)=>{
                                console.info("====>Acts_RegisterJsErrorCallback_0100 rely terminateSelf err: " +
                                JSON.stringify(err));
                            });
                        }, 100);
                    })
                }
            }

            ErrorManager.on("error", observer);
            setTimeout(() => {
                globalThis.contest.terminateSelf();
            }, 300);
        } else if (globalThis.want.action == "Acts_RegisterJsErrorCallback_0200") {
            observer = {
                onUnhandledException(strMsg: String){
                    commonEventData.parameters.message = strMsg;
                    console.info("====>Acts_RegisterJsErrorCallback_0200 onUnhandledException Message: " + strMsg);
                    commonEvent.publish("ACTS_RegisterEvent_First", commonEventData, (err) => {
                        console.info("====>Acts_RegisterJsErrorCallback_0200 onUnhandledException publish err: " +
                            JSON.stringify(err));
                    })
                },
                onException(errObject: Error){
                    commonEventData.parameters.message = errObject;
                    console.info("====>Acts_RegisterJsErrorCallback_0200 onException Message: " + JSON.stringify(errObject));
                    commonEvent.publish("ACTS_RegisterEvent_Second", commonEventData, (err) => {
                        console.info("====>Acts_RegisterJsErrorCallback_0200 onException publish err: " +
                            JSON.stringify(err));
                        setTimeout(()=>{
                            globalThis.context.terminateSelf().then(()=>{
                                console.info("====>Acts_RegisterJsErrorCallback_0200 rely terminateSelf end");
                            }).catch((err)=>{
                                console.info("====>Acts_RegisterJsErrorCallback_0200 rely terminateSelf err: " +
                                    JSON.stringify(err));
                            })
                        }, 100)
                    })
                }
            }
            ErrorManager.on("error", observer);
            setTimeout(() => {
                globalThis.contest.terminateSelf();
            }, 300);
        } else if (globalThis.want.action == "Acts_UnregisterJsErrorCallback_0800") {
            observer = {
                onUnhandledException(strMsg: String){
                    commonEventData.parameters.message = strMsg;
                    console.info("====>Acts_UnregisterJsErrorCallback_0800 onUnhandledException Message: " + strMsg);
                    commonEvent.publish("ACTS_RegisterEvent_First", commonEventData, (err) => {
                        console.info("====>Acts_UnregisterJsErrorCallback_0800 onUnhandledException publish err: " +
                        JSON.stringify(err));
                    })
                },
                onException(errObject: Error){
                    commonEventData.parameters.message = errObject;
                    console.info("====>Acts_UnregisterJsErrorCallback_0800 onException Message: " + JSON.stringify(errObject));
                    commonEvent.publish("ACTS_RegisterEvent_Second", commonEventData, (err) => {
                        console.info("====>Acts_UnregisterJsErrorCallback_0800 onException publish err: " +
                        JSON.stringify(err));
                        setTimeout(()=>{
                            globalThis.context.terminateSelf().then(()=>{
                                console.info("====>Acts_UnregisterJsErrorCallback_0800 rely terminateSelf end");
                            }).catch((err)=>{
                                console.info("====>Acts_UnregisterJsErrorCallback_0800 rely terminateSelf err: " +
                                JSON.stringify(err));
                            })
                        }, 100)
                    })
                }
            }
            ErrorManager.on("error", observer);
            let observerId = ErrorManager.on("error", observer);
            ErrorManager.off("error", observerId).then(()=>{
                console.info("====>Acts_UnregisterJsErrorCallback_0800 rely off end");
            }).catch((err)=>{
                console.info("====>Acts_UnregisterJsErrorCallback_0800 rely off err: " +
                JSON.stringify(err));
            })
            setTimeout(() => {
                globalThis.contest.terminateSelf();
            }, 300);
        }
    }

    onBackground() {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    }
}

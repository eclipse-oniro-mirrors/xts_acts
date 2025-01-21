/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import notification from '@ohos.notification';
import featureAbility from '@ohos.ability.featureAbility';
import wantAgent from '@ohos.wantAgent';
import backgroundTaskManager from '@ohos.backgroundTaskManager';
import particleAbility from '@ohos.ability.particleAbility';
import commonEvent from '@ohos.commonEvent';

const TAG = "BGMODE_TEST ";

let event;

let request = {
    content: {
        contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
            title: "title",
            text: "text"
        }
    },
    id: 1
};

let wantAgentInfo = {
    wants: [
        {
            bundleName: "com.example.continuoustaskserver",
            abilityName: "com.example.continuoustaskserver.MainAbility"
        }
    ],
    operationType: wantAgent.OperationType.START_ABILITY,
    requestCode: 0,
    wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
};

function callback(err, data) {
    if (err) {
        console.error(TAG + " Operation failed");
    } else {
        console.info(TAG + " Operation succeed");
        commonEvent.publish(event, (err) => {
            if (err.code) {
                console.error(TAG + "PublishCallBack failed");
            } else {
                console.info(TAG + "Publish succeed");
            }
        })
    }
}

function startContinuousTaskUseApi7Callback() {
    event = "startTaskUseApi7Callback";
    particleAbility.startBackgroundRunning(1, request, callback);
}

function stopContinuousTaskUseApi7Callback() {
    event = "stopTaskUseApi7Callback";
    particleAbility.startBackgroundRunning(1, request).then(() => {
        particleAbility.cancelBackgroundRunning(callback);
    });
}

function startContinuousTaskUseApi8Callback() {
    event = "startTaskUseApi8Callback";
    wantAgent.getWantAgent(wantAgentInfo).then((data) => {
        backgroundTaskManager.startBackgroundRunning(featureAbility.getContext(),
            backgroundTaskManager.BackgroundMode.LOCATION, data, callback);
    });
}

function stopContinuousTaskUseApi8Callback() {
    event = "stopTaskUseApi8Callback";
    wantAgent.getWantAgent(wantAgentInfo).then((data) => {
        return backgroundTaskManager.startBackgroundRunning(featureAbility.getContext(),
            backgroundTaskManager.BackgroundMode.LOCATION, data);
    }).then(() => {
        backgroundTaskManager.stopBackgroundRunning(featureAbility.getContext(), callback);
    });
}

function startContinuousTaskUseApi7Promise() {
    particleAbility.startBackgroundRunning(1, request).then(() => {
        commonEvent.publish("startTaskUseApi7Promise", (err) => {
            if (err.code) {
                console.error(TAG + "PublishCallBack failed");
            } else {
                console.info(TAG + "Publish succeed");
            }
        });
    });
}

function stopContinuousTaskUseApi7Promise() {
    particleAbility.startBackgroundRunning(1, request).then(() => {
        return particleAbility.cancelBackgroundRunning();
    }).then(() => {
        commonEvent.publish("stopTaskUseApi7Promise", (err) => {
            if (err.code) {
                console.error(TAG + "PublishCallBack failed");
            } else {
                console.info(TAG + "Publish succeed");
            }
        });
    });
}

function startContinuousTaskUseApi8Promise() {
    wantAgent.getWantAgent(wantAgentInfo).then((data) => {
        return backgroundTaskManager.startBackgroundRunning(featureAbility.getContext(),
            backgroundTaskManager.BackgroundMode.LOCATION, data);
    }).then(() => {
        commonEvent.publish("startTaskUseApi8Promise", (err) => {
            if (err.code) {
                console.error(TAG + "PublishCallBack failed");
            } else {
                console.info(TAG + "Publish succeed");
            }
        });
    });
}

function stopContinuousTaskUseApi8Promise() {
    wantAgent.getWantAgent(wantAgentInfo).then((data) => {
        return backgroundTaskManager.startBackgroundRunning(featureAbility.getContext(),
            backgroundTaskManager.BackgroundMode.LOCATION, data);
    }).then(() => {
        return backgroundTaskManager.stopBackgroundRunning(featureAbility.getContext());
    }).then(() => {
        commonEvent.publish("stopTaskUseApi8Promise", (err) => {
            if (err.code) {
                console.error(TAG + "PublishCallBack failed");
            } else {
                console.info(TAG + "Publish succeed");
            }
        })
    })
}

function startContinuousTaskInvalidBgmode() {
    wantAgent.getWantAgent(wantAgentInfo).then((data) => {
        return backgroundTaskManager.startBackgroundRunning(featureAbility.getContext(),
            backgroundTaskManager.BackgroundMode.BLUETOOTH_INTERACTION, data);
    }).catch(() => {
        commonEvent.publish("startTaskInvalidBgmode", (err) => {
            if (err.code) {
                console.error(TAG + "PublishCallBack failed");
            } else {
                console.info(TAG + "Publish succeed");
            }
        });
    });
}

function handleOption(want) {
    switch (want.parameters.option) {
        case "testcase1":
            startContinuousTaskUseApi7Callback();
            break;
        case "testcase2":
            stopContinuousTaskUseApi7Callback();
            break;
        case "testcase3":
            startContinuousTaskUseApi8Callback();
            break;
        case "testcase4":
            stopContinuousTaskUseApi8Callback();
            break;
        case "testcase5":
            startContinuousTaskUseApi7Promise();
            break;
        case "testcase6":
            stopContinuousTaskUseApi7Promise();
            break;
        case "testcase7":
            startContinuousTaskUseApi8Promise();
            break;
        case "testcase8":
            stopContinuousTaskUseApi8Promise();
            break;
        case "testcase9":
            startContinuousTaskInvalidBgmode();
            break;
        default:
            console.warn(TAG + 'Unknown option');
            break;
    }
}

export default {
    onStart() {
        console.info(TAG + 'ServiceAbility onStart');
    },
    onStop() {
        console.info(TAG + 'ServiceAbility onStop');
    },
    onCommand(want, startId) {
        console.info(TAG + 'ServiceAbility onCommand');
        console.info(TAG + "Get onCommand want: " + JSON.stringify(want));
        particleAbility.cancelBackgroundRunning();
        backgroundTaskManager.stopBackgroundRunning(featureAbility.getContext());
        handleOption(want);
    },
    onConnect(want) {
        console.info(TAG + 'ServiceAbility onConnect');
    },
    onDisConnect(want) {
        console.info(TAG + 'ServiceAbility onDisConnect');
    },
};
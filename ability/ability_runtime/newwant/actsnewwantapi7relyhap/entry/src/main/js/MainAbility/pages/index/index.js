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
import file from '@system.file'
import app from '@system.app'
import device from '@system.device'
import router from '@system.router'
import { Core, ExpectExtend, Level } from '@ohos/hypium'
import featureAbility from '@ohos.ability.featureAbility'

const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')

function sleep(delay) {
    let start = new Date().getTime();
    while (true) {
        if (new Date().getTime() - start > delay) {
            break;
        }
    }
}

export default {
    data: {
        title: ""
    },
    onInit() {
        console.info('ACTS_NewWant Api7 onInit');
        this.title = "ProcessManageSystemAppA";
    },
    onReady() {
        console.info('ACTS_NewWant Api7 onReady');
    },
    onActive() {
        console.info('ACTS_NewWant Api7 onActive');
    },
    async onShow() {
        console.info('ACTS_NewWant Api7 onShow');
        sleep(1000)
        await featureAbility.startAbility(
            {
                want:
                {
                    bundleName: "com.example.newwanthap",
                    abilityName: "com.example.newwanthapa.SecondAbility",
                    action: "restartSecondAbility0800",
                },
            }
        );

    },
    onInactive() {
        console.info('ACTS_NewWant Api7 onInactive');
    },
    onHide() {
        console.info('ACTS_NewWant Api7 onHide');
    },
    onDestroy() {
        console.info('ACTS_NewWant Api7 onDestroy');
    },
    onBackPress() {
        console.info('ACTS_NewWant Api7 onBackPress');
    },
    onNewRequest() {
        console.info('ACTS_NewWant Api7 onNewRequest');
    },
    onStartContinuation() {
        console.info('ACTS_NewWant Api7 onStartContinuation');
    },
    onSaveData(value) {
        console.info('ACTS_NewWant Api7 onSaveData:' + JSON.stringify(value));
    },
    onRestoreData(value) {
        console.info('ACTS_NewWant Api7 onRestoreData:' + JSON.stringify(value));
    },
    onCompleteContinuation(code) {
        console.info('ACTS_NewWant Api7 onCompleteContinuation:' + JSON.stringify(code));
    },
    onConfigurationUpdated(configuration) {
        console.info('ACTS_NewWant Api7 onConfigurationUpdated:' + JSON.stringify(configuration));
    }
}


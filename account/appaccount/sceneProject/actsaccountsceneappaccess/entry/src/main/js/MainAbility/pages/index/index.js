/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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
import account from '@ohos.account.appAccount'
import file from '@system.file'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')

export default {
    data: {
    },
    onInit() {
        this.title = 'scene AppAccess';
        console.info('====>scene application start====');
        let appAccountManager = account.createAppAccountManager();
        console.info('====>creat scene manager finish====');
        let enableBundle = 'com.example.actsaccountpressure';
        console.info('====>add first account start====');
        appAccountManager.createAccount('account_name_scene_first', async (err) => {
            console.info('====>add first account err:' + JSON.stringify(err));
            try {
                await appAccountManager.setAppAccess('account_name_scene_first', enableBundle, true);
            } catch (err) {
                console.info('====>setAppAccess account_name_scene_first err:' + JSON.stringify(err));
            }
            await appAccountManager.createAccount('account_name_scene_second');
            try {
                await appAccountManager.setAppAccess('account_name_scene_second', enableBundle, true);
            } catch (err) {
                console.info('====>setAppAccess account_name_scene_second err:' + JSON.stringify(err));
            }
            featureAbility.terminateSelf(
                (err, data) => {
                    console.info('====>Terminate Ability Success====');
                });
        });
    },
    onShow() {
    },
    onReady() {
    },
}
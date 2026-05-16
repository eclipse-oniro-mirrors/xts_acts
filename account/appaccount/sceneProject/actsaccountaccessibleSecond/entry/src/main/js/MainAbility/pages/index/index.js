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
import featureAbility from '@ohos.ability.featureAbility'

const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')

export default {
    data: {
    },
    onInit() {
        this.title = 'scene accessible second application';
        console.info('====>scene accessible second application start====');
        let appAccountManager = account.createAppAccountManager();
        console.info('====>creat second scene manager finish====');
        let enableBundle = 'com.example.actsgetallaccessiblemultiple';
        let enableBundle2 = 'com.example.getmultipleaccountstest';
        let enableBundle3 = 'com.example.getmultipleaccountstest.static';
        console.info('====>add second account start====');
        appAccountManager.createAccount('account_name_scene_second_first', async (err)=>{
            console.info('====>add second account err:' + JSON.stringify(err));
            try {
                await appAccountManager.setAppAccess('account_name_scene_second_first', enableBundle, true);
                await appAccountManager.setAppAccess('account_name_scene_second_first', enableBundle2, true);
                await appAccountManager.setAppAccess('account_name_scene_second_first', enableBundle3, true);
            } catch (err) {
                console.info('====>enableAppAccess second account err:' + JSON.stringify(err));
            }
            await appAccountManager.createAccount('account_name_scene_second_second');
            try {
                await appAccountManager.setAppAccess('account_name_scene_second_second', enableBundle, true);
                await appAccountManager.setAppAccess('account_name_scene_second_second', enableBundle2, true);
                await appAccountManager.setAppAccess('account_name_scene_second_second', enableBundle3, true);
            } catch (err) {
                console.info('====>enableAppAccess second enableBundle err:' + JSON.stringify(err));
            }
            console.info('====>terminateSelfWithResult second');
            featureAbility.terminateSelfWithResult({
                resultCode: 1,
                want:
                {
                    bundleName: 'com.example.actsaccountaccessiblesecond',
                    abilityName: 'com.example.actsaccountaccessiblesecond.MainAbility'
                }
            });
        });
    },
    onShow() {
    },
    onReady() {
    },
}
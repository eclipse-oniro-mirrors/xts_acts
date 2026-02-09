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
        this.title = 'scene accessible first application';
        console.info('====>scene accessible first application start====');
        let enableBundle = 'com.example.actsgetallaccessiblemultiple';
        let enableBundle2 = 'com.example.getmultipleaccountstest';
        let enableBundle3 = 'com.example.getmultipleaccountstest.static';
        let appAccountManager = account.createAppAccountManager();
        console.info('====>create first scene manager finish====');
        appAccountManager.createAccount('account_name_scene_first_first', async (err)=>{
            console.info('====>add first account err:' + JSON.stringify(err));
            try {
                await appAccountManager.setAppAccess('account_name_scene_first_first', enableBundle, true);
            } catch (err) {
                console.info('====>enableAppAccess first account err:' + JSON.stringify(err));
            }
            try {
                await appAccountManager.setAppAccess('account_name_scene_first_first', enableBundle2, true);
            } catch (err) {
                console.info('====>enableAppAccess first account for enableBundle2 err:' + JSON.stringify(err));
            }
            try {
                await appAccountManager.setAppAccess('account_name_scene_first_first', enableBundle3, true);
            } catch (err) {
                console.info('====>enableAppAccess first account for enableBundle2 err:' + JSON.stringify(err));
            }
            await appAccountManager.createAccount('account_name_scene_first_second');
            try {
                await appAccountManager.setAppAccess('account_name_scene_first_second', enableBundle, true);
            } catch (err) {
                console.info('====>enableAppAccess second enableBundle err:' + JSON.stringify(err));
            }
            try {
                await appAccountManager.setAppAccess('account_name_scene_first_second', enableBundle2, true);
            } catch (err) {
                console.info('====>enableAppAccess second enableBundle2 err:' + JSON.stringify(err));
            }
            try {
                await appAccountManager.setAppAccess('account_name_scene_first_second', enableBundle3, true);
            } catch (err) {
                console.info('====>enableAppAccess second enableBundle2 err:' + JSON.stringify(err));
            }
            this.startA();
        });
    },
    startA() {
        console.info('====>startAbility second start====');
        featureAbility.startAbilityForResult(
            {
                want:
                {
                    deviceId: '',
                    bundleName: 'com.example.actsaccountaccessiblesecond',
                    abilityName: 'com.example.actsaccountaccessiblesecond.MainAbility',
                    action: 'action1'
                },
            }, async (err, data) => {
                console.info('====>startAbility second err:' + JSON.stringify(err));
                console.info('====>start terminateSelfWithResult first');
                featureAbility.terminateSelfWithResult({
                    resultCode: 1,
                    want:
                    {
                        bundleName: 'com.example.actsaccountaccessiblefirst',
                        abilityName: 'com.example.actsaccountaccessiblefirst.MainAbility'
                    }
                });
            }
        );
    },
    onShow() {
    },
    onReady() {
    },
}
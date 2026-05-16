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
        let enableBundle = 'com.example.actsgetallaccessibleaccounts';
        let enableBundle2 = 'com.example.getallaccountsnoparameter';
        let enableBundle3 = 'com.example.getallaccountsnoparameter.static';
        this.title = 'scene accessible account';
        console.info('====>scene accessible account start====');
        console.info('====>scene add account start====');
        let appAccountManager = account.createAppAccountManager();
        console.info('====>scene create scene manager finish====');
        appAccountManager.createAccount('account_name_scene_single', async (err)=>{
            console.info('====>add account scene err:' + JSON.stringify(err));
            console.info('====>scene setAppAccess start====');
            try {
                await appAccountManager.setAppAccess('account_name_scene_single', enableBundle, true);
            } catch (err) {
                console.info('====>setAppAccess enableBundle err:' + JSON.stringify(err));
            }
            try {
                await appAccountManager.setAppAccess('account_name_scene_single', enableBundle2, true);
            } catch (err) {
                console.info('====>setAppAccess enableBundle2 err:' + JSON.stringify(err));
            }
            try {
                await appAccountManager.setAppAccess('account_name_scene_single', enableBundle3, true);
            } catch (err) {
                console.info('====>setAppAccess enableBundle2 err:' + JSON.stringify(err));
            }
            console.info('====>scene terminateSelfWithResult start====');
            featureAbility.terminateSelfWithResult({
                resultCode: 1,
                want:
                {
                    bundleName: 'com.example.actsaccountsceneaccessible',
                    abilityName: 'com.example.actsaccountsceneaccessible.MainAbility'
                }
            });
        });
    },
    onShow() {
    },
    onReady() {
    },
}
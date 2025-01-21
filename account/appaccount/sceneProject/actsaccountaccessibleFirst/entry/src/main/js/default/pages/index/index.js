/*
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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
        this.title = "scene accessible first application";
    },
    onShow() {
        function sleep(delay) {
            var start = (new Date()).getTime();
            while((new Date()).getTime() - start < delay) {
                continue;
            }
        }

        console.info('====>scene accessible first application start====');
        var appAccountManager = account.createAppAccountManager();
        console.info("====>creat first scene manager finish====");
        var enableBundle = "com.example.actsgetallaccessiblemultiple";
        var enableBundle_2 = "com.example.getmultipleaccountstest"
        console.info("====>add first account start====");
        appAccountManager.createAccount("account_name_scene_first_first", (err)=>{
            console.info("====>add first account err:" + JSON.stringify(err));
            appAccountManager.setAppAccess("account_name_scene_first_first", enableBundle, true, (err)=>{
                console.info("====>enableAppAccess first account err:" + JSON.stringify(err));
                appAccountManager.setAppAccess("account_name_scene_first_first", enableBundle_2, true, (err) => {
                    console.info("====>enableAppAccess first account for enableBundle_2 err:" + JSON.stringify(err));
                    appAccountManager.createAccount("account_name_scene_first_second", (err)=>{
                        console.info("====>add second account err:" + JSON.stringify(err));
                        appAccountManager.setAppAccess("account_name_scene_first_second", enableBundle, true, (err)=>{
                            appAccountManager.setAppAccess("account_name_scene_first_second", enableBundle_2, true, (err)=>{
                                console.info("====>enableAppAccess second account err:" + JSON.stringify(err));
                                console.info("====>startAbility second start====");
                                featureAbility.startAbility(
                                    {
                                        want:
                                        {
                                            deviceId: "",
                                            bundleName: "com.example.actsaccountaccessiblesecond",
                                            abilityName: "com.example.actsaccountaccessiblesecond.MainAbility",
                                            action: "action1",
                                            parameters:
                                            {},
                                        },
                                    }, (err, data) => {
                                        console.info("====>startAbility com.example.actsaccountaccessiblesecond err:" + JSON.stringify(err));
                                        sleep(1500);
                                        featureAbility.terminateSelf((err, data)=>{
                                            console.info("====>Terminate First Ability err:" + JSON.stringify(err));
                                        });
                                    }
                                );
                            })
                        })
                    })
                })
            })  
        })
    },
    onReady() {
    },
}
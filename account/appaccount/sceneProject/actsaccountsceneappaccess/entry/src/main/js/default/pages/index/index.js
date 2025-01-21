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
import account from '@ohos.account.appAccount'
import file from '@system.file'
import {Core, ExpectExtend} from 'deccjsunit/index'

const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')

export default {
    data: {
    },
    onInit() {
        this.title = "scene AppAccess";
    },
    onShow() {
        console.info('====>scene application start====');
        var appAccountManager = account.createAppAccountManager();
        console.info("====>creat scene manager finish====");
        var enableBundle = "com.example.actsaccountpressure";
        console.info("====>add first account start====");
        appAccountManager.createAccount("account_name_scene_first", (err)=>{
            console.info("====>add first account err:" + JSON.stringify(err));
            appAccountManager.setAppAccess("account_name_scene_first", enableBundle, true, (err)=>{
                console.info("====>enableAppAccess first account err:" + JSON.stringify(err));
                appAccountManager.createAccount("account_name_scene_second", (err)=>{
                    console.info("====>add second account err:" + JSON.stringify(err));
                    appAccountManager.setAppAccess("account_name_scene_second", enableBundle, true, (err)=>{
                        console.info("====>enableAppAccess second account err:" + JSON.stringify(err));
                        featureAbility.terminateSelf(
                            (err, data)=>{
                                console.info('====>Terminate Ability Success====')
                        });
                    })
                })
            })
        })
    },
    onReady() {
    },
}
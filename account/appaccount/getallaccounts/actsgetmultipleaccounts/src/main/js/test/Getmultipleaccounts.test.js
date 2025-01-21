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
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

const TIMEOUT = 5000;
export default function ActsGetMultipleAccounts() {
    describe('ActsGetMultipleAccounts', function () {
        beforeAll(async function (done) {
            console.debug("====>startAbility first start====");
            await featureAbility.startAbility(
                {
                    want:
                    {
                        deviceId: "",
                        bundleName: "com.example.actsaccountaccessiblefirst",
                        abilityName: "com.example.actsaccountaccessiblefirst.MainAbility",
                        action: "action1",
                        parameters:
                        {},
                    },
                },
            );
            sleep(TIMEOUT);
            done();
        });

        function sleep(delay) {
            var start = (new Date()).getTime();
            while((new Date()).getTime() - start < delay) {
                continue;
            }
        }

        /*
        * @tc.number    : ActsGetMultipleAccounts_0100
        * @tc.name      : getAllAccounts
        * @tc.desc      : This application adds multiple account, other applications authorizes multiple accounts to this
        *                 application and this application obtains authorization
        */
        it('ActsGetMultipleAccounts_0100', 0, async function (done) {
            console.debug("====>ActsGetMultipleAccounts_0100 start====");
            let dataMap = new Map();
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            console.debug("====>add first account 0100 start====");
            await appAccountManager.createAccount("accessibleAccount_this_application_first");
            console.debug("====>add second account 0100 start====");
            await appAccountManager.createAccount("accessibleAccount_this_application_second");
            console.debug("====>add third account 0100 start====");
            await appAccountManager.createAccount("accessibleAccount_this_application_third");
            console.debug("====>getAllAccounts 0100 start====");
            try{
                var data = await appAccountManager.getAllAccounts();
            }
            catch(err){
                console.error("====>getAllAccounts 0100 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>getAllAccounts 0100 data:" + JSON.stringify(data));
            expect(data.length).assertEqual(7);
            console.debug("====>data.length:" + data.length);
            for (let i = 0, len = data.length; i < len; i++) {
                dataMap.set(data[i].name, data[i].owner)
            }
            expect(dataMap.has("account_name_scene_first_first")).assertTrue();
            if (dataMap.has("account_name_scene_first_first")) {
                let data = dataMap.get("account_name_scene_first_first");
                console.debug("====>first account owner is: " + data);
                expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
            }
            expect(dataMap.has("account_name_scene_first_second")).assertTrue();
            if (dataMap.has("account_name_scene_first_second")) {
                let data = dataMap.get("account_name_scene_first_second");
                console.debug("====>second account owner is: " + data);
                expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
            }
            expect(dataMap.has("account_name_scene_second_first")).assertTrue();
            if (dataMap.has("account_name_scene_second_first")) {
                let data = dataMap.get("account_name_scene_second_first");
                console.debug("====>third account owner is: " + data);
                expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
            }
            expect(dataMap.has("account_name_scene_second_second")).assertTrue();
            if (dataMap.has("account_name_scene_second_second")) {
                let data = dataMap.get("account_name_scene_second_second");
                console.debug("====>fourth account owner is: " + data);
                expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
            }
            expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
            if (dataMap.has("accessibleAccount_this_application_first")) {
                let data = dataMap.get("accessibleAccount_this_application_first");
                console.debug("====>fifth account owner is: " + data);
                expect(data).assertEqual("com.example.getmultipleaccountstest");
            }
            expect(dataMap.has("accessibleAccount_this_application_second")).assertTrue();
            if (dataMap.has("accessibleAccount_this_application_second")) {
                let data = dataMap.get("accessibleAccount_this_application_second");
                console.debug("====>sixth account owner is: " + data);
                expect(data).assertEqual("com.example.getmultipleaccountstest");
            }
            expect(dataMap.has("accessibleAccount_this_application_third")).assertTrue();
            if (dataMap.has("accessibleAccount_this_application_third")) {
                let data = dataMap.get("accessibleAccount_this_application_third");
                console.debug("====>seventh account owner is: " + data);
                expect(data).assertEqual("com.example.getmultipleaccountstest");
            }
            console.debug("====>delete account start====");
            await appAccountManager.removeAccount("accessibleAccount_this_application_first");
            await appAccountManager.removeAccount("accessibleAccount_this_application_second");
            await appAccountManager.removeAccount("accessibleAccount_this_application_third");
            console.debug("====>ActsGetAllAccessibleAccounts_0100 end====");
            done();
        });
    })
}
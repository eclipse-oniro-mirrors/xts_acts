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

const TIMEOUT = 2000;
const SELFBUNDLE = 'com.example.getallaccountsnoparameter'
export default function ActsGetAllAccountsNoParameter() {
    describe('ActsGetAllAccountsNoParameter', function () {
        async function sleep(delay) {
            let timeoutId = null;
            var promise = new Promise((resolve, reject) => {
                timeoutId = setTimeout(() => {
                    resolve("done")
                }, delay)
            })
            await promise
            clearTimeout(timeoutId)
        }

        /*
        * @tc.number    : ActsGetAllAccountsNoParameter_0100
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : This application has not added an account and has not been authorized by other applications to
        *                 obtain authorization
        */
        it('ActsGetAllAccountsNoParameter_0100', 0, async function (done) {
            console.info("====>ActsGetAllAccountsNoParameter_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.getAllAccounts((err, data)=>{
                console.info("====>getAllAccounts 0100 err:" + JSON.stringify(err));
                console.info("====>getAllAccounts 0100 data:" + JSON.stringify(data));
                console.info("====>getAllAccounts 0100 data.length:" + data.length);
                expect(err).assertEqual(null);
                expect(data.length).assertEqual(0);
                console.info("====>ActsGetAllAccountsNoParameter_0100 end====");
                done();
            });
        });

        /*
        * @tc.number    : ActsGetAllAccountsNoParameter_0200
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : This application has not added an account and has not been authorized by other applications to
        *                 obtain authorization
        */
        it('ActsGetAllAccountsNoParameter_0200', 0, async function (done) {
            console.info("====>ActsGetAllAccountsNoParameter_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>getAllAccounts 0200 start====");
            try{
                var data = await appAccountManager.getAllAccounts();
            }
            catch(err){
                console.error("====>getAllAccounts 0200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAllAccounts 0200 data:" + JSON.stringify(data));
            console.info("====>getAllAccounts 0200 data.length:" + data.length);
            expect(data.length).assertEqual(0);
            console.info("====>ActsGetAllAccountsNoParameter_0200 end====");
            done();
        });

        /*
        * @tc.number    : ActsGetAllAccountsNoParameter_0300
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : This application gets authorization after adding a single account
        */
        it('ActsGetAllAccountsNoParameter_0300', 0, async function (done) {
            console.info("====>ActsGetAllAccountsNoParameter_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("accessibleAccount_callback_single", (err)=>{
                console.info("====> add account ActsGetAllAccountsNoParameter_0300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAccounts((err, data)=>{
                    console.info("====>getAllAccounts 0300 err:" + JSON.stringify(err));
                    console.info("====>getAllAccounts 0300 data:" + JSON.stringify(data));
                    console.info("====>getAllAccounts 0300 data.length:" + data.length);
                    expect(err).assertEqual(null);
                    expect(data.length).assertEqual(1);
                    try{
                        expect(data[0].name).assertEqual("accessibleAccount_callback_single");
                        expect(data[0].owner).assertEqual("com.example.getallaccountsnoparameter");
                    }
                    catch(err){
                        console.error("====>getAllAccounts check data 0300 fail err:" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    appAccountManager.removeAccount("accessibleAccount_callback_single", (err)=>{
                        console.info("====>delete Account ActsGetAllAccountsNoParameter_0300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsGetAllAccountsNoParameter_0300 end====");
                        done();
                    })
                });
            });
        });

        /*
        * @tc.number    : ActsGetAllAccountsNoParameter_0400
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : This application gets authorization after adding a single account
        */
    it('ActsGetAllAccountsNoParameter_0400', 0, async function (done) {
            console.info("====>ActsGetAllAccountsNoParameter_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>getAllAccounts for clean====");
            try{
                var acclist = await appAccountManager.getAllAccounts(SELFBUNDLE);
            }
            catch(err){
                console.error("====>getAllAccounts err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>account list length: " + acclist.length);
            if(acclist.length > 0){
                for(var i = 0;i < acclist.length; i++){
                    await appAccountManager.removeAccount(acclist[i].name);
                }
            }
            console.info("====>add account ActsGetAllAccountsNoParameter_0400 start====");
            await appAccountManager.createAccount("accessibleAccount_promise_single");
            console.info("====>getAllAccounts 0400 start====");
            try{
                var data = await appAccountManager.getAllAccounts();
            }
            catch(err){
                console.error("====>getAllAccounts 0400 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAllAccounts 0400 data:" + JSON.stringify(data));
            console.info("====>getAllAccounts 0400 data.length:" + data.length);
            try{
                expect(data[0].name).assertEqual("accessibleAccount_promise_single");
                expect(data[0].owner).assertEqual("com.example.getallaccountsnoparameter");
            }
            catch(err){
                console.error("====>getAllAccounts check data 0400 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            await appAccountManager.removeAccount("accessibleAccount_promise_single");
            console.info("====>ActsGetAllAccountsNoParameter_0400 end====");
            done();
        });

        /*
        * @tc.number    : ActsGetAllAccountsNoParameter_0500
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : This application is added to obtain authorization after adding multiple application accounts
        */
        it('ActsGetAllAccountsNoParameter_0500', 0, async function (done) {
            console.info("====>ActsGetAllAccountsNoParameter_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("accessibleAccount_callback_first", (err)=>{
                console.info("====>add account first time 0500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.createAccount("accessibleAccount_callback_second", (err)=>{
                    console.info("====>add account second time 0500 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.createAccount("accessibleAccount_callback_third", (err)=>{
                        console.info("====>add account third time 0500 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAllAccounts((err, data)=>{
                            console.info("====>getAllAccounts 0500 err:" + JSON.stringify(err));
                            console.info("====>getAllAccounts 0500 data:" + JSON.stringify(data));
                            console.info("====>getAllAccounts 0500 data.length:" + data.length);
                            expect(err).assertEqual(null);
                            expect(data.length).assertEqual(3);
                            try{
                                expect(data[0].name).assertEqual("accessibleAccount_callback_first");
                                expect(data[0].owner).assertEqual("com.example.getallaccountsnoparameter");
                                expect(data[1].name).assertEqual("accessibleAccount_callback_second");
                                expect(data[1].owner).assertEqual("com.example.getallaccountsnoparameter");
                                expect(data[2].name).assertEqual("accessibleAccount_callback_third");
                                expect(data[2].owner).assertEqual("com.example.getallaccountsnoparameter");
                            }
                            catch(err){
                                console.error("====>check data 0500 fail err:" + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            }
                            appAccountManager.removeAccount("accessibleAccount_callback_first", (err)=>{
                                console.info("====>delete Account first 0500 err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.removeAccount("accessibleAccount_callback_second", (err)=>{
                                    console.info("====>delete Account second 0500 err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    appAccountManager.removeAccount("accessibleAccount_callback_third", (err)=>{
                                        console.info("====>delete Account third 0500 err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        console.info("====>ActsGetAllAccountsNoParameter_0500 end====");
                                        done();
                                    })
                                })
                            })
                        });
                    })
                })
            });
        });

        /*
        * @tc.number    : ActsGetAllAccountsNoParameter_0600
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : This application is added to obtain authorization after adding multiple application accounts
        */
        it('ActsGetAllAccountsNoParameter_0600', 0, async function (done) {
            console.info("====>ActsGetAllAccountsNoParameter_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>getAllAccounts for clean====");
            try{
                var acclist = await appAccountManager.getAllAccounts(SELFBUNDLE);
            }
            catch(err){
                console.error("====>getAllAccounts err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>account list length: " + acclist.length);
            if(acclist.length > 0){
                for(var i = 0;i < acclist.length; i++){
                    await appAccountManager.removeAccount(acclist[i].name);
                }
            }
            console.info("====>add first account 0600 start====");
            await appAccountManager.createAccount("accessibleAccount_promise_first");
            console.info("====>add second account 0600 start====");
            await appAccountManager.createAccount("accessibleAccount_promise_second");
            console.info("====>add third account 0600 start====");
            await appAccountManager.createAccount("accessibleAccount_promise_third");
            try{
                var data = await appAccountManager.getAllAccounts();
            }
            catch(err){
                console.error("====>getAllAccounts 0600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAllAccounts 0600 data:" + JSON.stringify(data));
            expect(data.length).assertEqual(3);
            try{
                expect(data[0].name).assertEqual("accessibleAccount_promise_first");
                expect(data[0].owner).assertEqual("com.example.getallaccountsnoparameter");
                expect(data[1].name).assertEqual("accessibleAccount_promise_second");
                expect(data[1].owner).assertEqual("com.example.getallaccountsnoparameter");
                expect(data[2].name).assertEqual("accessibleAccount_promise_third");
                expect(data[2].owner).assertEqual("com.example.getallaccountsnoparameter");
            }
            catch(err){
                console.error("====>check data 0600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>delete first account 0600 start====");
            await appAccountManager.removeAccount("accessibleAccount_promise_first");
            console.info("====>delete second account 0600 start====");
            await appAccountManager.removeAccount("accessibleAccount_promise_second");
            console.info("====>delete third account 0600 start====");
            await appAccountManager.removeAccount("accessibleAccount_promise_third");
            console.info("====>ActsGetAllAccountsNoParameter_0600 end====");
            done();
        });

        /*
        * @tc.number    : ActsGetAllAccountsNoParameter_0700
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : This application adds different application accounts three times in a row, and obtains
        *                 authorization after deleting the account added for the second time
        */
        it('ActsGetAllAccountsNoParameter_0700', 0, async function (done) {
            console.info("====>ActsGetAllAccountsNoParameter_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("accessibleAccount_callback_delete_first", (err)=>{
                console.info("====>add first account 0700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.createAccount("accessibleAccount_callback_delete_second", (err)=>{
                    console.info("====>add second account 0700 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.createAccount("accessibleAccount_callback_delete_third", (err)=>{
                        console.info("====>add third account 0700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.removeAccount("accessibleAccount_callback_delete_second", (err)=>{
                            console.info("====>delete second account 0700 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getAllAccounts((err, data)=>{
                                console.info("====>getAllAccounts 0700 err:" + JSON.stringify(err));
                                console.info("====>getAllAccounts 0700 data:" + JSON.stringify(data));
                                console.info("====>getAllAccounts 0700 data.length:" + data.length);
                                expect(err).assertEqual(null);
                                expect(data.length).assertEqual(2);
                                try{
                                    expect(data[0].name).assertEqual("accessibleAccount_callback_delete_first");
                                    expect(data[0].owner).assertEqual("com.example.getallaccountsnoparameter");
                                    expect(data[1].name).assertEqual("accessibleAccount_callback_delete_third");
                                    expect(data[1].owner).assertEqual("com.example.getallaccountsnoparameter");
                                }
                                catch(err){
                                    console.error("====>check data 0700 fail err:" + JSON.stringify(err));
                                    expect().assertFail();
                                    done();
                                }
                                appAccountManager.removeAccount("accessibleAccount_callback_delete_first", (err)=>{
                                    console.info("====>delete first account 0700 err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    appAccountManager.removeAccount("accessibleAccount_callback_delete_third", (err)=>{
                                        console.info("====>delete third account 0700 err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        console.info("====>ActsGetAllAccountsNoParameter_0700 end====");
                                        done();
                                    })
                                })
                            });
                        })
                    })
                })
            });
        });

        /*
        * @tc.number    : ActsGetAllAccountsNoParameter_0800
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : This application adds different application accounts three times in a row, and obtains
        *                 authorization after deleting the account added for the second time
        */
        it('ActsGetAllAccountsNoParameter_0800', 0, async function (done) {
            console.info("====>ActsGetAllAccountsNoParameter_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>getAllAccounts for clean====");
            try{
                var acclist = await appAccountManager.getAllAccounts(SELFBUNDLE);
            }
            catch(err){
                console.error("====>getAllAccounts err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>account list length: " + acclist.length);
            if(acclist.length > 0){
                for(var i = 0;i < acclist.length; i++){
                    await appAccountManager.removeAccount(acclist[i].name);
                }
            }
            console.info("====>add first account 0800 start====");
            await appAccountManager.createAccount("accessibleAccount_promise_first");
            console.info("====>add second account 0800 start====");
            await appAccountManager.createAccount("accessibleAccount_promise_second");
            console.info("====>add third account 0800 start====");
            await appAccountManager.createAccount("accessibleAccount_promise_third");
            console.info("====>delete second account 0800 start====");
            await appAccountManager.removeAccount("accessibleAccount_promise_second");
            try{
                var data = await appAccountManager.getAllAccounts();
            }
            catch(err){
                console.error("====>getAllAccounts 0800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAllAccounts 0800 data:" + JSON.stringify(data));
            expect(data.length).assertEqual(2);
            try{
                expect(data[0].name).assertEqual("accessibleAccount_promise_first");
                expect(data[0].owner).assertEqual("com.example.getallaccountsnoparameter");
                expect(data[1].name).assertEqual("accessibleAccount_promise_third");
                expect(data[1].owner).assertEqual("com.example.getallaccountsnoparameter");
            }
            catch(err){
                console.error("====>check data 0800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>delete first account 0800 start====");
            await appAccountManager.removeAccount("accessibleAccount_promise_first");
            console.info("====>delete third account 0800 start====");
            await appAccountManager.removeAccount("accessibleAccount_promise_third");
            console.info("====>ActsGetAllAccountsNoParameter_0800 end====");
            done();
        });

        /*
        * @tc.number    : ActsGetAllAccountsNoParameter_0900
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : This application adds different application accounts three times in a row, and then obtains
        *                 authorization multiple times
        */
        it('ActsGetAllAccountsNoParameter_0900', 0, async function (done) {
            console.info("====>ActsGetAllAccountsNoParameter_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("accessibleAccount_callback_multiple_first", (err)=>{
                console.info("====>add first account 0900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.createAccount("accessibleAccount_callback_multiple_second", (err)=>{
                    console.info("====>add third account 0900 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAllAccounts((err, data)=>{
                        console.info("====>getAllAccounts first 0900 err:" + JSON.stringify(err));
                        console.info("====>getAllAccounts first 0900 data:" + JSON.stringify(data));
                        console.info("====>getAllAccounts first 0900 data.length:" + data.length);
                        expect(err).assertEqual(null);
                        expect(data.length).assertEqual(2);
                        try{
                            expect(data[0].name).assertEqual("accessibleAccount_callback_multiple_first");
                            expect(data[0].owner).assertEqual("com.example.getallaccountsnoparameter");
                            expect(data[1].name).assertEqual("accessibleAccount_callback_multiple_second");
                            expect(data[1].owner).assertEqual("com.example.getallaccountsnoparameter");
                        }
                        catch(err){
                            console.error("====>check data first 0900 fail err:" + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        }
                        appAccountManager.getAllAccounts((err, data)=>{
                            console.info("====>getAllAccounts second 0900 err:" + JSON.stringify(err));
                            console.info("====>getAllAccounts second 0900 data:" + JSON.stringify(data));
                            console.info("====>getAllAccounts second 0900 data.length:" + data.length);
                            expect(err).assertEqual(null);
                            expect(data.length).assertEqual(2);
                            try{
                                expect(data[0].name).assertEqual("accessibleAccount_callback_multiple_first");
                                expect(data[0].owner).assertEqual("com.example.getallaccountsnoparameter");
                                expect(data[1].name).assertEqual("accessibleAccount_callback_multiple_second");
                                expect(data[1].owner).assertEqual("com.example.getallaccountsnoparameter");
                            }
                            catch(err){
                                console.error("====>check data second 0900 fail err:" + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            }
                            appAccountManager.removeAccount("accessibleAccount_callback_multiple_first", (err)=>{
                                console.info("====>delete first account 0900 err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.removeAccount("accessibleAccount_callback_multiple_second", (err)=>{
                                    console.info("====>delete second account 0900 err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsGetAllAccountsNoParameter_0900 end====");
                                    done();
                                })
                            })
                        })
                    })
                })
            });
        });

        /*
        * @tc.number    : ActsGetAllAccountsNoParameter_1000
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : This application adds different application accounts three times in a row, and then obtains
        *                 authorization multiple times
        */
        it('ActsGetAllAccountsNoParameter_1000', 0, async function (done) {
            console.info("====>ActsGetAllAccountsNoParameter_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>getAllAccounts for clean====");
            try{
                var acclist = await appAccountManager.getAllAccounts(SELFBUNDLE);
            }
            catch(err){
                console.error("====>getAllAccounts err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>account list length: " + acclist.length);
            if(acclist.length > 0){
                for(var i = 0;i < acclist.length; i++){
                    await appAccountManager.removeAccount(acclist[i].name);
                }
            }
            console.info("====>add first account 1000 start====");
            await appAccountManager.createAccount("accessibleAccount_promise_multiple_first");
            console.info("====>add second account 1000 start====");
            await appAccountManager.createAccount("accessibleAccount_promise_multiple_second");
            console.info("====>getAllAccounts first 1000 start====");
            try{
                var data = await appAccountManager.getAllAccounts();
            }
            catch(err){
                console.error("====>getAllAccounts first 1000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAllAccounts 1000 data:" + JSON.stringify(data));
            expect(data.length).assertEqual(2);
            try{
                expect(data[0].name).assertEqual("accessibleAccount_promise_multiple_first");
                expect(data[0].owner).assertEqual("com.example.getallaccountsnoparameter");
                expect(data[1].name).assertEqual("accessibleAccount_promise_multiple_second");
                expect(data[1].owner).assertEqual("com.example.getallaccountsnoparameter");
            }
            catch(err){
                console.error("====>check data 1000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAllAccounts second 1000 start====");
            try{
                var dataTwo = await appAccountManager.getAllAccounts();
            }
            catch(err){
                console.error("====>getAllAccounts second 1000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAllAccounts 1000 dataTwo:" + JSON.stringify(dataTwo));
            expect(data.length).assertEqual(2);
            try{
                expect(dataTwo[0].name).assertEqual("accessibleAccount_promise_multiple_first");
                expect(dataTwo[0].owner).assertEqual("com.example.getallaccountsnoparameter");
                expect(dataTwo[1].name).assertEqual("accessibleAccount_promise_multiple_second");
                expect(dataTwo[1].owner).assertEqual("com.example.getallaccountsnoparameter");
            }
            catch(err){
                console.error("====>check dataTwo 1000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>delete first account 1000 start====");
            await appAccountManager.removeAccount("accessibleAccount_promise_multiple_first");
            console.info("====>delete second account 1000 start====");
            await appAccountManager.removeAccount("accessibleAccount_promise_multiple_second");
            console.info("====>ActsGetAllAccountsNoParameter_1000 end====");
            done();
        });

        /*
        * @tc.number    : ActsGetAllAccountsNoParameter_1100
        * @tc.name      : getAllAccounts
        * @tc.desc      : This application adds an account, other application authorizes an account to this application
        *                 and this application obtains authorization
        */
        it('ActsGetAllAccountsNoParameter_1100', 0, async function (done) {
            console.info("====>ActsGetAllAccountsNoParameter_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account 1100 start====");
            await appAccountManager.createAccount("accessibleAccount_this_application");
            console.info("====>startAbility 1100 start====");
            await featureAbility.startAbility(
                {
                    want:
                    {
                        deviceId: "",
                        bundleName: "com.example.actsaccountsceneaccessible",
                        abilityName: "com.example.actsaccountsceneaccessible.MainAbility",
                        action: "action1",
                        parameters:
                        {},
                    },
                },
            );
            await sleep(TIMEOUT)
            console.info("====>getAllAccounts 1100 start====");
            try{
                var data = await appAccountManager.getAllAccounts();
            }
            catch(err){
                console.error("====>getAllAccounts 1100 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAllAccounts 1100 data:" + JSON.stringify(data));
            expect(data.length).assertEqual(2);
            try{
                expect(data[0].name).assertEqual("account_name_scene_single");
                expect(data[0].owner).assertEqual("com.example.actsaccountsceneaccessible");
                expect(data[1].name).assertEqual("accessibleAccount_this_application");
                expect(data[1].owner).assertEqual("com.example.getallaccountsnoparameter");
            }
            catch(err){
                console.error("====>check data 1100 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>delete account 1100 start====");
            await appAccountManager.removeAccount("accessibleAccount_this_application");
            console.info("====>ActsGetAllAccountsNoParameter_1100 end====");
            done();
        });
    })
}
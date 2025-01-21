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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

const LENGTHLIMIT = 1024;
export default function ActsGetAllAccounts() {
    describe('ActsGetAllAccounts', function () {

        /*
        * @tc.number    : ActsGetAllAccounts_0100
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : This application gets its own application information after adding an account
        */
        it('ActsGetAllAccounts_0100', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var selfBundle = "com.example.actsgetallaccounts";
            appAccountManager.addAccount("Account_this_application_callback", (err)=>{
                console.info("====>add account 0100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAccounts(selfBundle, (err, data)=>{
                    console.info("====>getAllAccounts 0100 err:" + JSON.stringify(err));
                    console.info("====>getAllAccounts 0100 data:" + JSON.stringify(data));
                    expect(err).assertEqual(null);
                    try{
                        expect(data[0].name).assertEqual("Account_this_application_callback");
                        expect(data[0].owner).assertEqual("com.example.actsgetallaccounts");
                    }
                    catch(err){
                        console.error("====>getAllAccounts 0100 fail err:" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    appAccountManager.deleteAccount("Account_this_application_callback", (err)=>{
                        console.info("====>delete account 0100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsGetAllAccounts_0100 end====");
                        done();
                    });
                })
            });
        });

        /*
        * @tc.number    : ActsGetAllAccounts_0200
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : This application gets its own application information after adding an account
        */
        it('ActsGetAllAccounts_0200', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>getAllAccounts for clean====");
            var selfBundle = "com.example.actsgetallaccounts";
            try{
                var acclist = await appAccountManager.getAllAccounts(selfBundle);
            } catch(err) {
                console.error("====>getAllAccounts err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>account list length: " + acclist.length);
            if(acclist.length > 0){
                for(var i = 0;i < acclist.length; i++){
                    await appAccountManager.deleteAccount(acclist[i].name);
                }
            }
            console.info("====>add account 0200 start====");
            await appAccountManager.addAccount("Account_this_application_promise");
            console.info("====>getAllAccounts 0200 start====");
            try{
                var data = await appAccountManager.getAllAccounts(selfBundle);
            } catch(err) {
                console.error("====>getAllAccounts 0200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }       
            try{
                expect(data[0].name).assertEqual("Account_this_application_promise");
                expect(data[0].owner).assertEqual("com.example.actsgetallaccounts");
            } catch(err) {
                console.error("====>check data 0200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>delete account 0200 start====");
            await appAccountManager.deleteAccount("Account_this_application_promise");      
            console.info("====>ActsGetAllAccounts_0200 end====");
            done();
        });

        /*
        * @tc.number    : ActsGetAllAccounts_0300
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : No account has been added to this application and it is not authorized by other applications to
        *                 obtain account information for this application
        */
        it('ActsGetAllAccounts_0300', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var selfBundle = "com.example.actsgetallaccounts";
            appAccountManager.getAllAccounts(selfBundle, (err, data)=>{
                console.info("====>getAllAccounts 0300 err:" + JSON.stringify(err));
                console.info("====>getAllAccounts 0300 data:" + JSON.stringify(data));
                expect(err).assertEqual(null);
                expect(data.length).assertEqual(0);
                console.info("====>ActsGetAllAccounts_0300 end====");
                done();
            })
        });

        /*
        * @tc.number    : ActsGetAllAccounts_0400
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : No account has been added to this application and it is not authorized by other applications to
        *                 obtain account information for this application
        */
        it('ActsGetAllAccounts_0400', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>getAllAccounts for clean====");
            var selfBundle = "com.example.actsgetallaccounts";
            try{
                var acclist = await appAccountManager.getAllAccounts(selfBundle);
            } catch(err) {
                console.error("====>getAllAccounts err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>account list length: " + acclist.length);
            if(acclist.length > 0){
                for(var i = 0;i < acclist.length; i++){
                    await appAccountManager.deleteAccount(acclist[i].name);
                }
            }
            var data = await appAccountManager.getAllAccounts(selfBundle);
            console.info("====>getAllAccounts 0400 data:" + JSON.stringify(data));   
            expect(data.length).assertEqual(0);
            console.info("====>ActsGetAllAccounts_0400 end====");
            done();
        });

        /*
        * @tc.number    : ActsGetAllAccounts_0500
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : The parameter owner is an empty string
        */
        it('ActsGetAllAccounts_0500', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var emptyBundle = "";
            appAccountManager.getAllAccounts(emptyBundle, (err, data)=>{
                console.info("====>getAllAccounts 0500 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsGetAllAccounts_0500 end====");
                done();
            })
        });

        /*
        * @tc.number    : ActsGetAllAccounts_0600
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : The parameter owner is an empty string
        */
        it('ActsGetAllAccounts_0600', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var emptyBundle = "";
            try{
                var data = await appAccountManager.getAllAccounts(emptyBundle);
            } catch(err) {
                console.info("====>getAllAccounts 0600 err:" + JSON.stringify(err));   
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsGetAllAccounts_0600 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsGetAllAccounts_0700
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : The parameter owner is a string that exceeds the length limit
        */
        it('ActsGetAllAccounts_0700', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var limitBundle = '';
            for (var i = 0; i < LENGTHLIMIT + 1; i++) {
                limitBundle += 't';
            }
            appAccountManager.getAllAccounts(limitBundle, (err, data)=>{
                console.info("====>getAllAccounts 0700 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsGetAllAccounts_0700 end====");
                done();
            })
        });

        /*
        * @tc.number    : ActsGetAllAccounts_0800
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : The parameter owner is a string that exceeds the length limit
        */
        it('ActsGetAllAccounts_0800', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var limitBundle = '';
            for (var i = 0; i < LENGTHLIMIT + 1; i++) {
                limitBundle += 'n';
            }
            try{
                var data = await appAccountManager.getAllAccounts(limitBundle);
            } catch(err) {
                console.info("====>getAllAccounts 0800 err:" + JSON.stringify(err));   
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsGetAllAccounts_0800 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsGetAllAccounts_0900
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : This application adds an account, and after other applications authorize an account to this
        *                 application, this application obtains the information of its own application
        */
        it('ActsGetAllAccounts_0900', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var selfBundle = "com.example.actsgetallaccounts";
            console.info("====>add account 0900 start====");
            await appAccountManager.addAccount("Account_application_callback");
            function getAllCallback(err, data){
                console.info("====>getAllAccounts 0900 err:" + JSON.stringify(err));
                console.info("====>getAllAccounts 0900 data:" + JSON.stringify(data));
                expect(err).assertEqual(null);
                expect(data[0].name).assertEqual("Account_application_callback");
                expect(data[0].owner).assertEqual("com.example.actsgetallaccounts");
                console.info("====>delete account 0900 start====");
                appAccountManager.deleteAccount("Account_application_callback", (err)=>{
                    console.info("====>delete account 0900 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.info("====>ActsGetAllAccounts_0900 end====");
                    done();
                });
            }
            console.info("====>startAbility 0900 start====");
            featureAbility.startAbilityForResult(
                {
                    want:
                    {
                        deviceId: "",
                        bundleName: "com.example.actsscenegetallaccounts",
                        abilityName: "com.example.actsscenegetallaccounts.MainAbility",
                        action: "action1",
                        parameters:
                        {},
                    },
                }, (err, data) => {
                    console.info("====>ActsGetAllAccounts_0900 startAbilityForResult err:" + JSON.stringify(err))
                    console.info("====>ActsGetAllAccounts_0900 startAbilityForResult data:" + JSON.stringify(data))
                    console.info("====>getAllAccounts 0900 start====");
                    appAccountManager.getAllAccounts(selfBundle, getAllCallback);
                }
            );
        });

        /*
        * @tc.number    : ActsGetAllAccounts_1000
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : This application adds an account, and after other applications authorize an account to this
        *                 application, this application obtains the information of its own application
        */
        it('ActsGetAllAccounts_1000', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_1000 start====");
            let appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            let selfBundle = "com.example.actsgetallaccounts";
            console.info("====>add account 1000 start====");
            await appAccountManager.addAccount("Account_application_promise");
            console.info("====>startAbility 1000 start====");
            featureAbility.startAbilityForResult(
                {
                    want:
                    {
                        deviceId: "",
                        bundleName: "com.example.actsscenegetallaccounts",
                        abilityName: "com.example.actsscenegetallaccounts.MainAbility",
                        action: "action1",
                        parameters:
                        {},
                    },
                }, async (err, data) => {
                    console.info("====>ActsGetAllAccounts_1000 startAbilityForResult err:" + JSON.stringify(err))
                    console.info("====>ActsGetAllAccounts_1000 startAbilityForResult data:" + JSON.stringify(data))
                    console.info("====>getAllAccounts 1000 start====");
                    try{
                        let data = await appAccountManager.getAllAccounts(selfBundle);
                        console.info("====>getAllAccounts 1000 data:" + JSON.stringify(data));
                        expect(data[0].name).assertEqual("Account_application_promise");
                        expect(data[0].owner).assertEqual("com.example.actsgetallaccounts");
                        console.info("====>delete account 1000 start====");
                        await appAccountManager.deleteAccount("Account_application_promise");
                        console.info("====>ActsGetAllAccounts_1000 end====");
                        done();
                    } catch(err) {
                        console.error("====>getAllAccounts 1000 fail err:" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                }
            );
        });

        /*
        * @tc.number    : ActsGetAllAccounts_1100
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : The parameter owner is not a exist owner
        */
        it('ActsGetAllAccounts_1100', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>createAppAccountManager finish====");
            var selfBundle = "com.example.notexist";
            console.info("====>getAllAccounts 1100 start====");
            appAccountManager.getAllAccounts(selfBundle, (err, data) => {
                console.info("====>getAllAccounts 1100 err:" + JSON.stringify(err));
                console.info("====>getAllAccounts 1100 data:" + JSON.stringify(data));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsGetAllAccounts_1100 end====");
                done();
            });
        });

        /*
        * @tc.number    : ActsGetAllAccounts_1200
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : The parameter owner is not a exist owner
        */
        it('ActsGetAllAccounts_1200', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_1200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var selfBundle = "com.example.notexist";
            console.info("====>getAllAccounts 1200 start====");
            try{
                await appAccountManager.getAllAccounts(selfBundle);
            } catch(err) {
                console.error("====>getAllAccounts 1200 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsGetAllAccounts_1200 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsGetAllAccounts_1300
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : The parameter owner is a bundlename that does not exist
        */
        it('ActsGetAllAccounts_1300', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_1300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var nonexistentBundle = "com.example.actsgetallaccountsnonexistent";
            appAccountManager.getAllAccounts(nonexistentBundle, (err, data)=>{
                console.info("====>getAllAccounts 1300 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsGetAllAccounts_1300 end====");
                done();
            })
        });

        /*
        * @tc.number    : ActsGetAllAccounts_1400
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : The parameter owner is a bundlename that does not exist
        */
        it('ActsGetAllAccounts_1400', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_1400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var nonexistentBundle = "com.example.actsgetallaccountsnonexistent";
            try{
                var data = await appAccountManager.getAllAccounts(nonexistentBundle);
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>getAllAccounts 1400 err:" + JSON.stringify(err));   
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsGetAllAccounts_1400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsGetAllAccounts_1500
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : Get account information after adding and deleting account
        */
        it('ActsGetAllAccounts_1500', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_1500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var selfBundle = "com.example.actsgetallaccounts";
            appAccountManager.addAccount("account_callback_delete", (err)=>{
                console.info("====>add account 1500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAccounts(selfBundle, (err, data)=>{
                    console.info("====>getAllAccounts 1500 err:" + JSON.stringify(err));
                    console.info("====>getAllAccounts 1500 data:" + JSON.stringify(data));
                    expect(err).assertEqual(null);
                    expect(data[0].name).assertEqual("account_callback_delete");
                    expect(data[0].owner).assertEqual("com.example.actsgetallaccounts");
                    appAccountManager.deleteAccount("account_callback_delete", (err)=>{
                        console.info("====>delete account 1500 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAllAccounts(selfBundle, (err, data)=>{
                            console.info("====>getAllAccounts 1500 err:" + JSON.stringify(err));
                            console.info("====>getAllAccounts 1500 data:" + JSON.stringify(data));
                            expect(err).assertEqual(null);
                            expect(data.length).assertEqual(0);
                            console.info("====>ActsGetAllAccounts_1500 end====");
                            done();
                        })
                    });
                })
            });
        });

        /*
        * @tc.number    : ActsGetAllAccounts_1600
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : Get account information after adding and deleting account
        */
        it('ActsGetAllAccounts_1600', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_1600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>getAllAccounts for clean====");
            var selfBundle = "com.example.actsgetallaccounts";
            try{
                var acclist = await appAccountManager.getAllAccounts(selfBundle);
            } catch(err) {
                console.error("====>getAllAccounts err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>account list length: " + acclist.length);
            if(acclist.length > 0){
                for(var i = 0;i < acclist.length; i++){
                    await appAccountManager.deleteAccount(acclist[i].name);
                }
            }
            console.info("====>add account 1600 start====");
            await appAccountManager.addAccount("account_promise_delete");
            console.info("====>first getAllAccounts 1600 start====");
            try{
                var data = await appAccountManager.getAllAccounts(selfBundle);
            } catch(err) {
                console.error("====>getAllAccounts 1600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }       
            expect(data[0].name).assertEqual("account_promise_delete");
            expect(data[0].owner).assertEqual("com.example.actsgetallaccounts");
            console.info("====>delete account 1600 start====");
            await appAccountManager.deleteAccount("account_promise_delete");  
            console.info("====>second getAllAccounts 1600 start====");
            try{
                var dataDelete = await appAccountManager.getAllAccounts(selfBundle);
            } catch(err) {
                console.error("====>second getAllAccounts 1600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }       
            expect(dataDelete.length).assertEqual(0);
            console.info("====>ActsGetAllAccounts_1600 end====");
            done();
        });

        /*
        * @tc.number    : ActsGetAllAccounts_1700
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : Get account information after adding an account with additional information and deleting an
        *                 account
        */
        it('ActsGetAllAccounts_1700', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_1700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var selfBundle = "com.example.actsgetallaccounts";
            appAccountManager.addAccount("account_callback_additional", "account_extrainfo", (err)=>{
                console.info("====>add account 1700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAccounts(selfBundle, (err, data)=>{
                    console.info("====>getAllAccounts 1700 err:" + JSON.stringify(err));
                    console.info("====>getAllAccounts 1700 data:" + JSON.stringify(data));
                    expect(err).assertEqual(null);
                    expect(data[0].name).assertEqual("account_callback_additional");
                    expect(data[0].owner).assertEqual("com.example.actsgetallaccounts");
                    appAccountManager.deleteAccount("account_callback_additional", (err)=>{
                        console.info("====>delete account 1700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAllAccounts(selfBundle, (err, data)=>{
                            console.info("====>getAllAccounts 1700 err:" + JSON.stringify(err));
                            console.info("====>getAllAccounts 1700 data:" + JSON.stringify(data));
                            expect(err).assertEqual(null);
                            expect(data.length).assertEqual(0);
                            console.info("====>ActsGetAllAccounts_1700 end====");
                            done();
                        })
                    });
                })
            });
        });

        /*
        * @tc.number    : ActsGetAllAccounts_1800
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : Get account information after adding an account with additional information and deleting an
        *                 account
        */
        it('ActsGetAllAccounts_1800', 0, async function (done) {
            console.info("====>ActsGetAllAccounts_1800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>getAllAccounts for clean====");
            var selfBundle = "com.example.actsgetallaccounts";
            try{
                var acclist = await appAccountManager.getAllAccounts(selfBundle);
            } catch(err) {
                console.error("====>getAllAccounts err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>account list length: " + acclist.length);
            if(acclist.length > 0){
                for(var i = 0;i < acclist.length; i++){
                    await appAccountManager.deleteAccount(acclist[i].name);
                }
            }
            console.info("====>add account 1800 start====");
            await appAccountManager.addAccount("account_promise_additional", "account_extrainfo");
            console.info("====>first getAllAccounts 1800 start====");
            try{
                var data = await appAccountManager.getAllAccounts(selfBundle);
            } catch(err) {
                console.error("====>getAllAccounts 1800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>first getAllAccounts 1800 data:" + JSON.stringify(data)); 
            expect(data[0].name).assertEqual("account_promise_additional");
            expect(data[0].owner).assertEqual("com.example.actsgetallaccounts");
            console.info("====>delete account 1800 start====");
            await appAccountManager.deleteAccount("account_promise_additional");  
            console.info("====>second getAllAccounts 1800 start====");
            try{
                var dataDelete = await appAccountManager.getAllAccounts(selfBundle);
            } catch(err) {
                console.error("====>second getAllAccounts 1800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>second getAllAccounts 1800 data:" + JSON.stringify(data));
            expect(dataDelete.length).assertEqual(0);
            console.info("====>ActsGetAllAccounts_1800 end====");
            done();
        });
    })
}
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

const STRCOUNT = 513;
const createAccountOptions = {customData:{age:'12'}}
export default function ActsAccountSetAppAccess() {
    describe('ActsAccountSetAppAccess', function () {

        /*
        * @tc.number    : ActsAccountSetAppAccess_0100
        * @tc.name      : enableAppAccess callback
        * @tc.desc      : Enable the app to access the app itself
        */
        it('ActsAccountSetAppAccess_0100', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("AppAccess_callback_itself", createAccountOptions, (err)=>{
                console.info("====>add account ActsAccountSetAppAccess_0100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAppAccess("AppAccess_callback_itself", "com.example.actsaccountappaccess", true, (err)=>{
                    console.info("====>enableAppAccess err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(12400001);
                    appAccountManager.removeAccount("AppAccess_callback_itself", (err)=>{
                        console.info("====>delete Account ActsAccountSetAppAccess_0100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountSetAppAccess_0100 end====");
                        done();
                    });
                })
            })
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_0200
        * @tc.name      : enableAppAccess promise
        * @tc.desc      : Enable the app to access the app itself
        */
        it('ActsAccountSetAppAccess_0200', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountSetAppAccess_0200 start====");
            await appAccountManager.createAccount("AppAccess_promise_itself", createAccountOptions);
            console.info("====>enableAppAccess ActsAccountSetAppAccess_0200 start====");
            try{
                await appAccountManager.setAppAccess("AppAccess_promise_itself", "com.example.actsaccountappaccess", true);
            }
            catch(err){
                console.info("====>enableAppAccess 0200 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12400001);
                console.info("====>delete account ActsAccountSetAppAccess_0200 start====");
                await appAccountManager.removeAccount("AppAccess_promise_itself");
                console.info("====>ActsAccountSetAppAccess_0200 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_0300
        * @tc.name      : enableAppAccess callback
        * @tc.desc      : The enabled bundleName does not exist
        */
        it('ActsAccountSetAppAccess_0300', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var nonExistBundle = "com.example.NonExistentBundleCallback";
            appAccountManager.createAccount("AppAccess_callback_NotExistBundle", createAccountOptions, (err)=>{
                console.info("====>add account ActsAccountSetAppAccess_0300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAppAccess("AppAccess_callback_NotExistBundle", nonExistBundle, true, (err)=>{
                    console.info("====>enableAppAccess 0300 err:" + JSON.stringify(err));
                    expect(err.code == 12400001).assertEqual(true);
                    appAccountManager.removeAccount("AppAccess_callback_NotExistBundle", (err)=>{
                        console.info("====>delete Account ActsAccountSetAppAccess_0300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountSetAppAccess_0300 end====");
                        done();
                    });
                })
            })
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_0400
        * @tc.name      : enableAppAccess promise
        * @tc.desc      : The enabled bundleName does not exist
        */
        it('ActsAccountSetAppAccess_0400', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var nonExistBundle = "com.example.NonExistentBundlePromise";
            console.info("====>add account ActsAccountSetAppAccess_0400 start====");
            await appAccountManager.createAccount("AppAccess_promise_NotExistBundle", createAccountOptions);
            console.info("====>enableAppAccess ActsAccountSetAppAccess_0400 start====");
            try{
                await appAccountManager.setAppAccess("AppAccess_promise_NotExistBundle", nonExistBundle, true);
            }
            catch(err){
                console.error("====>enableAppAccess ActsAccountSetAppAccess_0400 err:" + JSON.stringify(err));
                expect(err.code == 12400001).assertEqual(true);
                console.info("====>delete account ActsAccountSetAppAccess_0400 start====");
                await appAccountManager.removeAccount("AppAccess_promise_NotExistBundle");
                console.info("====>ActsAccountSetAppAccess_0400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_0500
        * @tc.name      : enableAppAccess callback
        * @tc.desc      : The enabled account name does not exist
        */
        it('ActsAccountSetAppAccess_0500', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var enableBundle = "com.example.actsaccountsceneappaccess";
            var nonExistAccount = "NonExistentAccountCallback";
            appAccountManager.setAppAccess(nonExistAccount, enableBundle, true, (err)=>{
                console.info("====>enableAppAccess 0500 err:" + JSON.stringify(err));
                expect(err.code == 12300003).assertEqual(true);
                console.info("====>ActsAccountSetAppAccess_0500 end====");
                done();
            })
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_0600
        * @tc.name      : enableAppAccess promise
        * @tc.desc      : The enabled account name does not exist
        */
        it('ActsAccountSetAppAccess_0600', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var enableBundle = "com.example.actsaccountsceneappaccess";
            var nonExistAccount = "NonExistentAccountPromise";
            console.info("====>enableAppAccess ActsAccountSetAppAccess_0600 start====");
            try{
                await appAccountManager.setAppAccess("NonExistentAccountPromise", enableBundle, true);
            }
            catch(err){
                console.info("====>enableAppAccess 0600 err:" + JSON.stringify(err));
                expect(err.code == 12300003).assertEqual(true);
                console.info("====>ActsAccountSetAppAccess_0600 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_0700
        * @tc.name      : enableAppAccess disableAppAccess callback
        * @tc.desc      : Cancel the authorization after authorizing the account to another app
        */
        it('ActsAccountSetAppAccess_0700', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var enableBundle = "com.example.actsaccountsceneappaccess";
            appAccountManager.createAccount("AppAccess_callback_account", (err)=>{
                console.info("====>add account ActsAccountSetAppAccess_0700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAppAccess("AppAccess_callback_account", enableBundle, true, (err)=>{
                    console.info("====>enableAppAccess 0700 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAppAccess("AppAccess_callback_account", enableBundle, false, (err)=>{
			            console.info("====>disableAppAccess 0700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null)
                        appAccountManager.removeAccount("AppAccess_callback_account", (err)=>{
                            console.info("====>delete Account ActsAccountSetAppAccess_0700 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountSetAppAccess_0700 end====");
                            done();
                        });
                    })
                })
            })
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_0800
        * @tc.name      : enableAppAccess disableAppAccess promise
        * @tc.desc      : Cancel the authorization after authorizing the account to another account
        */
        it('ActsAccountSetAppAccess_0800', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var enableBundle = "com.example.actsaccountsceneappaccess";
            console.info("====>add account ActsAccountSetAppAccess_0800 start====");
            try{
                await appAccountManager.createAccount("AppAccess_promise_account");
            }
            catch(err){
                console.error("====>createAccount ActsAccountSetAppAccess_0800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>enableAppAccess ActsAccountSetAppAccess_0800 start====");
            try{
                await appAccountManager.setAppAccess("AppAccess_promise_account", enableBundle, true);
            }
            catch(err){
                console.error("====>enableAppAccess ActsAccountSetAppAccess_0800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>disableAppAccess ActsAccountSetAppAccess_0800 start====");
            await appAccountManager.setAppAccess("AppAccess_promise_account", enableBundle, false);
            console.info("====>delete account ActsAccountSetAppAccess_0800 start====");
            await appAccountManager.removeAccount("AppAccess_promise_account");
            console.info("====>ActsAccountSetAppAccess_0800 end====");
            done();
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_0900
        * @tc.name      : enableAppAccess callback
        * @tc.desc      : The authorized account name is a long string
        */
        it('ActsAccountSetAppAccess_0900', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var bigAccountName = '';
            for (var i = 0; i < STRCOUNT; i++) {
                bigAccountName += 't';
            }
            var enableBundle = "com.example.actsaccountsceneappaccess";
            appAccountManager.setAppAccess(bigAccountName, enableBundle, true, (err)=>{
                console.info("====>enableAppAccess 0900 err:" + JSON.stringify(err));
                expect(err.code == 12300002).assertEqual(true);
                console.info("====>ActsAccountSetAppAccess_0900 end====");
                done();
            })
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_1000
        * @tc.name      : enableAppAccess promise
        * @tc.desc      : The authorized account name is a long string
        */
        it('ActsAccountSetAppAccess_1000', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var bigAccountName = '';
            for (var i = 0; i < STRCOUNT; i++) {
                bigAccountName += 't';
            }
            var enableBundle = "com.example.actsaccountsceneappaccess";
            console.info("====>enableAppAccess ActsAccountSetAppAccess_1000 start====");
            try{
                await appAccountManager.setAppAccess(bigAccountName, enableBundle, true);
            }
            catch(err){
                console.info("====>enableAppAccess 1000 err:" + JSON.stringify(err));
                expect(err.code == 12300002).assertEqual(true);
                console.info("====>ActsAccountSetAppAccess_1000 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_1100
        * @tc.name      : enableAppAccess callback
        * @tc.desc      : The authorized bundle name is a long string
        */
        it('ActsAccountSetAppAccess_1100', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var bigBundleName = '';
            for (var i = 0; i < STRCOUNT; i++) {
                bigBundleName += 't';
            }
            appAccountManager.createAccount("AppAccess_callback_bigBundleName", (err)=>{
                console.info("====>add account ActsAccountSetAppAccess_1100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAppAccess("AppAccess_callback_bigBundleName", bigBundleName, true, (err)=>{
                    console.info("====>enableAppAccess 1100 err:" + JSON.stringify(err));
                    expect(err.code == 12300002).assertEqual(true);
                    appAccountManager.removeAccount("AppAccess_callback_bigBundleName", (err)=>{
                        console.info("====>delete Account ActsAccountSetAppAccess_1100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountSetAppAccess_1100 end====");
                        done();
                    });
                })
            })
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_1200
        * @tc.name      : enableAppAccess promise
        * @tc.desc      : The authorized bundle name is a long string
        */
        it('ActsAccountSetAppAccess_1200', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_1200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var bigBundleName = '';
            for (var i = 0; i < STRCOUNT; i++) {
                bigBundleName += 't';
            }
            console.info("====>add account ActsAccountSetAppAccess_1200 start====");
            await appAccountManager.createAccount("AppAccess_promise_bigBundleName");
            console.info("====>enableAppAccess ActsAccountSetAppAccess_1200 start====");
            try{
                await appAccountManager.setAppAccess("AppAccess_promise_bigBundleName", bigBundleName, true);
            }
            catch(err){
                console.info("====>enableAppAccess 1200 err:" + JSON.stringify(err));
                expect(err.code == 12300002).assertEqual(true);
                console.info("====>delete account ActsAccountSetAppAccess_1200 start====");
                await appAccountManager.removeAccount("AppAccess_promise_bigBundleName");
                console.info("====>ActsAccountSetAppAccess_1200 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_1300
        * @tc.name      : enableAppAccess callback
        * @tc.desc      : The authorized account name is an empty string
        */
        it('ActsAccountSetAppAccess_1300', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_1300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var emptyBundleName = '';
            appAccountManager.createAccount("AppAccess_callback_emptyBundleName", (err)=>{
                console.info("====>add account ActsAccountSetAppAccess_1300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAppAccess("AppAccess_callback_emptyBundleName", emptyBundleName, true, (err)=>{
                    console.info("====>enableAppAccess 1300 err:" + JSON.stringify(err));
                    expect(err.code == 12300002).assertEqual(true);
                    appAccountManager.removeAccount("AppAccess_callback_emptyBundleName", (err)=>{
                        console.info("====>delete Account ActsAccountSetAppAccess_1300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountSetAppAccess_1300 end====");
                        done();
                    });
                })
            })
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_1400
        * @tc.name      : enableAppAccess promise
        * @tc.desc      : The authorized account name is an empty string
        */
        it('ActsAccountSetAppAccess_1400', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_1400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var emptyBundleName = '';
            console.info("====>add account ActsAccountSetAppAccess_1400 start====");
            await appAccountManager.createAccount("AppAccess_promise_emptyBundleName");
            console.info("====>enableAppAccess ActsAccountSetAppAccess_1400 start====");
            try{
                await appAccountManager.setAppAccess("AppAccess_promise_emptyBundleName", emptyBundleName, true);
            }
            catch(err){
                console.info("====>enableAppAccess 1400 err:" + JSON.stringify(err));
                expect(err.code == 12300002).assertEqual(true);
                console.info("====>delete account ActsAccountSetAppAccess_1400 start====");
                await appAccountManager.removeAccount("AppAccess_promise_emptyBundleName");
                console.info("====>ActsAccountSetAppAccess_1400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_1500
        * @tc.name      : disableAppAccess callback
        * @tc.desc      : Cancel authorization Accounts that have not authorized other applications
        */
        it('ActsAccountSetAppAccess_1500', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_1500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var enableBundle = "com.example.actsaccountsceneappaccess";
            appAccountManager.createAccount("AppAccess_callback_account", (err)=>{
                console.info("====>add account ActsAccountSetAppAccess_1500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAppAccess("AppAccess_callback_account", enableBundle, false, (err)=>{
                    console.info("====>setAppAccess ActsAccountSetAppAccess_1500 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.removeAccount("AppAccess_callback_account", (err)=>{
                        console.info("====>delete Account ActsAccountSetAppAccess_1500 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountSetAppAccess_1500 end====");
                        done();
                    });
                })
            })
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_1600
        * @tc.name      : disableAppAccess promise
        * @tc.desc      : Cancel authorization Accounts that have not authorized other applications
        */
        it('ActsAccountSetAppAccess_1600', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_1600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var enableBundle = "com.example.actsaccountsceneappaccess";
            console.info("====>add account ActsAccountSetAppAccess_1600 start====");
            try{
                await appAccountManager.createAccount("AppAccess_promise_account");
            }
            catch(err){
                console.error("====>createAccount ActsAccountSetAppAccess_1600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>disableAppAccess ActsAccountSetAppAccess_1600 start====");
            try{
                await appAccountManager.setAppAccess("AppAccess_promise_account", enableBundle, false);
            }
            catch(err){
                console.info("====>disableAppAccess ActsAccountSetAppAccess_1800 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount("AppAccess_promise_account");
                expect().assertFail();                
                done();
            }
            await appAccountManager.removeAccount("AppAccess_promise_account");
            console.info("====>ActsAccountSetAppAccess_1600 end====");
            done();
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_1700
        * @tc.name      : disableAppAccess callback
        * @tc.desc      : The disableAppAccess parameter bundleName does not exist
        */
        it('ActsAccountSetAppAccess_1700', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_1700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var notExistBundle = "com.example.actsaccountnotexistbundle";
            appAccountManager.createAccount("AppAccess_callback_notExistBundle", (err)=>{
                console.info("====>add account ActsAccountSetAppAccess_1700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAppAccess("AppAccess_callback_notExistBundle", notExistBundle, false, (err)=>{
                    expect(err).assertEqual(null);
                    appAccountManager.removeAccount("AppAccess_callback_notExistBundle", (err)=>{
                        console.info("====>delete Account ActsAccountSetAppAccess_1700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountSetAppAccess_1700 end====");
                        done();
                    });
                })
            })
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_1800
        * @tc.name      : disableAppAccess promise
        * @tc.desc      : The disableAppAccess parameter bundleName does not exist
        */
        it('ActsAccountSetAppAccess_1800', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_1800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var notExistBundle = "com.example.actsaccountnotexistbundle";
            console.info("====>add account ActsAccountSetAppAccess_1800 start====");
            await appAccountManager.createAccount("AppAccess_promise_notExistBundle");
            console.info("====>disableAppAccess ActsAccountSetAppAccess_1800 start====");
            try{
                await appAccountManager.setAppAccess("AppAccess_promise_notExistBundle", notExistBundle, false);
            }
            catch(err){
                console.info("====>disableAppAccess ActsAccountSetAppAccess_1800 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount("AppAccess_promise_account");
                expect().assertFail();                
                done();
            }
            console.info("====>delete account ActsAccountSetAppAccess_1800 start====");
            await appAccountManager.removeAccount("AppAccess_promise_notExistBundle");
            console.info("====>ActsAccountSetAppAccess_1600 end====");
            done();
    });

        /*
        * @tc.number    : ActsAccountSetAppAccess_1900
        * @tc.name      : disableAppAccess callback
        * @tc.desc      : The disableAppAccess parameter accountName does not exist
        */
        it('ActsAccountSetAppAccess_1900', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_1900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var notExistAccount = "AppAccess_callback_notExistAccount";
            var enableBundle = "com.example.actsaccountsceneappaccess";
            console.info("====>disableAppAccess ActsAccountSetAppAccess_1900====");
            appAccountManager.setAppAccess(notExistAccount, enableBundle, false, (err)=>{
                console.info("====>disableAppAccess ActsAccountSetAppAccess_1900 err:" + JSON.stringify(err));
                expect(err.code == 12300003).assertEqual(true);
                console.info("====>ActsAccountSetAppAccess_1900 end====");
                done();
            })
        });

        /*
        * @tc.number    : ActsAccountSetAppAccess_2000
        * @tc.name      : disableAppAccess promise
        * @tc.desc      : The disableAppAccess parameter accountName does not exist
        */
        it('ActsAccountSetAppAccess_2000', 0, async function (done) {
            console.info("====>ActsAccountSetAppAccess_2000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var notExistAccount = "AppAccess_promise_notExistAccount";
            var enableBundle = "com.example.actsaccountsceneappaccess";
            console.info("====>disableAppAccess ActsAccountSetAppAccess_2000====");
            try{
                await appAccountManager.setAppAccess(notExistAccount, enableBundle, false);
            }
            catch(err){
                console.info("====>disableAppAccess ActsAccountSetAppAccess_2000 err:" + JSON.stringify(err));
                expect(err.code == 12300003).assertEqual(true);
                console.info("====>ActsAccountSetAppAccess_2000 end====");
                done();
            }
        });
    })
}
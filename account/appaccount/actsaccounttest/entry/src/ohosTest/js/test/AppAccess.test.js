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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

const TIMEOUT = 5000;
const STRCOUNT = 1025;
const EACHTIMEOUT = 500;
export default function ActsAccountAppAccess() {
    describe('ActsAccountAppAccess', function () {

        /*
        * @tc.number    : ActsAccountAppAccess_0100
        * @tc.name      : enableAppAccess callback
        * @tc.desc      : Enable the app to access the app itself
        */
        it('ActsAccountAppAccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsAccountAppAccess_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("AppAccess_callback_itself", "extrainfo_callback_itself", (err)=>{
                console.info("====>add account ActsAccountAppAccess_0100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.enableAppAccess("AppAccess_callback_itself", "com.example.actsaccountappaccess", (err)=>{
                    console.info("====>enableAppAccess err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAccount("AppAccess_callback_itself", (err)=>{
                        console.info("====>delete Account ActsAccountAppAccess_0100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAppAccess_0100 end====");
                        done();
                    });
                })
            })
        });

        /*
        * @tc.number    : ActsAccountAppAccess_0200
        * @tc.name      : enableAppAccess promise
        * @tc.desc      : Enable the app to access the app itself
        */
        it('ActsAccountAppAccess_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsAccountAppAccess_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountAppAccess_0200 start====");
            await appAccountManager.addAccount("AppAccess_promise_itself", "extrainfo_promise_itself");
            console.info("====>enableAppAccess ActsAccountAppAccess_0200 start====");
            try{
                await appAccountManager.enableAppAccess("AppAccess_promise_itself", "com.example.actsaccountappaccess");
                console.info("====>delete account ActsAccountAppAccess_0200 start====");
                await appAccountManager.deleteAccount("AppAccess_promise_itself");
                console.info("====>ActsAccountAppAccess_0200 end====");
                done();
            }
            catch(err){
                console.info("====>enableAppAccess 0200 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>delete account ActsAccountAppAccess_0200 start====");
                await appAccountManager.deleteAccount("AppAccess_promise_itself");
                console.info("====>ActsAccountAppAccess_0200 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountAppAccess_0300
        * @tc.name      : enableAppAccess callback
        * @tc.desc      : The enabled bundleName does not exist
        */
        it('ActsAccountAppAccess_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAppAccess_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var nonExistBundle = "com.example.NonExistentBundleCallback";
            appAccountManager.addAccount("AppAccess_callback_NotExistBundle", "extrainfo_callback_NotExistBundle", (err)=>{
                console.info("====>add account ActsAccountAppAccess_0300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.enableAppAccess("AppAccess_callback_NotExistBundle", nonExistBundle, (err)=>{
                    console.info("====>enableAppAccess 0300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAccount("AppAccess_callback_NotExistBundle", (err)=>{
                        console.info("====>delete Account ActsAccountAppAccess_0300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAppAccess_0300 end====");
                        done();
                    });
                })
            })
        });

        /*
        * @tc.number    : ActsAccountAppAccess_0400
        * @tc.name      : enableAppAccess promise
        * @tc.desc      : The enabled bundleName does not exist
        */
        it('ActsAccountAppAccess_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAppAccess_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var nonExistBundle = "com.example.NonExistentBundlePromise";
            console.info("====>add account ActsAccountAppAccess_0400 start====");
            await appAccountManager.addAccount("AppAccess_promise_NotExistBundle", "extrainfo_promise_NotExistBundle");
            console.info("====>enableAppAccess ActsAccountAppAccess_0400 start====");
            try{
                await appAccountManager.enableAppAccess("AppAccess_promise_NotExistBundle", nonExistBundle);
                console.info("====>delete account ActsAccountAppAccess_0400 start====");
                await appAccountManager.deleteAccount("AppAccess_promise_NotExistBundle");
                console.info("====>ActsAccountAppAccess_0400 end====");
                done();
            }
            catch(err){
                console.error("====>enableAppAccess ActsAccountAppAccess_0400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>delete account ActsAccountAppAccess_0400 start====");
                await appAccountManager.deleteAccount("AppAccess_promise_NotExistBundle");
                console.info("====>ActsAccountAppAccess_0400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountAppAccess_0500
        * @tc.name      : enableAppAccess callback
        * @tc.desc      : The enabled account name does not exist
        */
        it('ActsAccountAppAccess_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAppAccess_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var enableBundle = "com.example.actsaccountsceneappaccess";
            var nonExistAccount = "NonExistentAccountCallback";
            appAccountManager.enableAppAccess(nonExistAccount, enableBundle, (err)=>{
                console.info("====>enableAppAccess 0500 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountAppAccess_0500 end====");
                done();
            })
        });

        /*
        * @tc.number    : ActsAccountAppAccess_0600
        * @tc.name      : enableAppAccess promise
        * @tc.desc      : The enabled account name does not exist
        */
        it('ActsAccountAppAccess_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAppAccess_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var enableBundle = "com.example.actsaccountsceneappaccess";
            var nonExistAccount = "NonExistentAccountPromise";
            console.info("====>enableAppAccess ActsAccountAppAccess_0600 start====");
            try{
                await appAccountManager.enableAppAccess("NonExistentAccountPromise", enableBundle);
            }
            catch(err){
                console.info("====>enableAppAccess 0600 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountAppAccess_0600 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountAppAccess_0700
        * @tc.name      : enableAppAccess disableAppAccess callback
        * @tc.desc      : Cancel the authorization after authorizing the account to another app
        */
        it('ActsAccountAppAccess_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAccountAppAccess_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var enableBundle = "com.example.actsaccountsceneappaccess";
            appAccountManager.addAccount("AppAccess_callback_account", (err)=>{
                console.info("====>add account ActsAccountAppAccess_0700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.enableAppAccess("AppAccess_callback_account", enableBundle, (err)=>{
                    console.info("====>enableAppAccess 0700 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.disableAppAccess("AppAccess_callback_account", enableBundle, (err)=>{
			console.info("====>disableAppAccess 0700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null)
                        appAccountManager.deleteAccount("AppAccess_callback_account", (err)=>{
                            console.info("====>delete Account ActsAccountAppAccess_0700 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAppAccess_0700 end====");
                            done();
                        });
                    })
                })
            })
        });

        /*
        * @tc.number    : ActsAccountAppAccess_0800
        * @tc.name      : enableAppAccess disableAppAccess promise
        * @tc.desc      : Cancel the authorization after authorizing the account to another account
        */
        it('ActsAccountAppAccess_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAccountAppAccess_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var enableBundle = "com.example.actsaccountsceneappaccess";
            console.info("====>add account ActsAccountAppAccess_0800 start====");
            try{
                await appAccountManager.addAccount("AppAccess_promise_account");
            }
            catch(err){
                console.error("====>addAccount ActsAccountAppAccess_0800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>enableAppAccess ActsAccountAppAccess_0800 start====");
            try{
                await appAccountManager.enableAppAccess("AppAccess_promise_account", enableBundle);
            }
            catch(err){
                console.error("====>enableAppAccess ActsAccountAppAccess_0800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>disableAppAccess ActsAccountAppAccess_0800 start====");
            await appAccountManager.disableAppAccess("AppAccess_promise_account", enableBundle);
            console.info("====>delete account ActsAccountAppAccess_0800 start====");
            await appAccountManager.deleteAccount("AppAccess_promise_account");
            console.info("====>ActsAccountAppAccess_0800 end====");
            done();
        });

        /*
        * @tc.number    : ActsAccountAppAccess_0900
        * @tc.name      : enableAppAccess callback
        * @tc.desc      : The authorized account name is a long string
        */
        it('ActsAccountAppAccess_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsAccountAppAccess_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var bigAccountName = '';
            for (var i = 0; i < STRCOUNT; i++) {
                bigAccountName += 't';
            }
            var enableBundle = "com.example.actsaccountsceneappaccess";
            appAccountManager.enableAppAccess(bigAccountName, enableBundle, (err)=>{
                console.info("====>enableAppAccess 0900 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountAppAccess_0900 end====");
                done();
            })
        });

        /*
        * @tc.number    : ActsAccountAppAccess_1000
        * @tc.name      : enableAppAccess promise
        * @tc.desc      : The authorized account name is a long string
        */
        it('ActsAccountAppAccess_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsAccountAppAccess_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var bigAccountName = '';
            for (var i = 0; i < STRCOUNT; i++) {
                bigAccountName += 't';
            }
            var enableBundle = "com.example.actsaccountsceneappaccess";
            console.info("====>enableAppAccess ActsAccountAppAccess_1000 start====");
            try{
                await appAccountManager.enableAppAccess(bigAccountName, enableBundle);
            }
            catch(err){
                console.info("====>enableAppAccess 1000 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountAppAccess_1000 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountAppAccess_1100
        * @tc.name      : enableAppAccess callback
        * @tc.desc      : The authorized bundle name is a long string
        */
        it('ActsAccountAppAccess_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsAccountAppAccess_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var bigBundleName = '';
            for (var i = 0; i < STRCOUNT; i++) {
                bigBundleName += 't';
            }
            appAccountManager.addAccount("AppAccess_callback_bigBundleName", (err)=>{
                console.info("====>add account ActsAccountAppAccess_1100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.enableAppAccess("AppAccess_callback_bigBundleName", bigBundleName, (err)=>{
                    console.info("====>enableAppAccess 1100 err:" + JSON.stringify(err));
                    expect(err.code != 0).assertEqual(true);
                    appAccountManager.deleteAccount("AppAccess_callback_bigBundleName", (err)=>{
                        console.info("====>delete Account ActsAccountAppAccess_1100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAppAccess_1100 end====");
                        done();
                    });
                })
            })
        });

        /*
        * @tc.number    : ActsAccountAppAccess_1200
        * @tc.name      : enableAppAccess promise
        * @tc.desc      : The authorized bundle name is a long string
        */
        it('ActsAccountAppAccess_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsAccountAppAccess_1200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var bigBundleName = '';
            for (var i = 0; i < STRCOUNT; i++) {
                bigBundleName += 't';
            }
            console.info("====>add account ActsAccountAppAccess_1200 start====");
            await appAccountManager.addAccount("AppAccess_promise_bigBundleName");
            console.info("====>enableAppAccess ActsAccountAppAccess_1200 start====");
            try{
                await appAccountManager.enableAppAccess("AppAccess_promise_bigBundleName", bigBundleName);
            }
            catch(err){
                console.info("====>enableAppAccess 1200 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>delete account ActsAccountAppAccess_1200 start====");
                await appAccountManager.deleteAccount("AppAccess_promise_bigBundleName");
                console.info("====>ActsAccountAppAccess_1200 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountAppAccess_1300
        * @tc.name      : enableAppAccess callback
        * @tc.desc      : The authorized account name is an empty string
        */
        it('ActsAccountAppAccess_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsAccountAppAccess_1300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var emptyBundleName = '';
            appAccountManager.addAccount("AppAccess_callback_emptyBundleName", (err)=>{
                console.info("====>add account ActsAccountAppAccess_1300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.enableAppAccess("AppAccess_callback_emptyBundleName", emptyBundleName, (err)=>{
                    console.info("====>enableAppAccess 1300 err:" + JSON.stringify(err));
                    expect(err.code != 0).assertEqual(true);
                    appAccountManager.deleteAccount("AppAccess_callback_emptyBundleName", (err)=>{
                        console.info("====>delete Account ActsAccountAppAccess_1300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAppAccess_1300 end====");
                        done();
                    });
                })
            })
        });

        /*
        * @tc.number    : ActsAccountAppAccess_1400
        * @tc.name      : enableAppAccess promise
        * @tc.desc      : The authorized account name is an empty string
        */
        it('ActsAccountAppAccess_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsAccountAppAccess_1400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var emptyBundleName = '';
            console.info("====>add account ActsAccountAppAccess_1400 start====");
            await appAccountManager.addAccount("AppAccess_promise_emptyBundleName");
            console.info("====>enableAppAccess ActsAccountAppAccess_1400 start====");
            try{
                await appAccountManager.enableAppAccess("AppAccess_promise_emptyBundleName", emptyBundleName);
            }
            catch(err){
                console.info("====>enableAppAccess 1400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>delete account ActsAccountAppAccess_1400 start====");
                await appAccountManager.deleteAccount("AppAccess_promise_emptyBundleName");
                console.info("====>ActsAccountAppAccess_1400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountAppAccess_1500
        * @tc.name      : disableAppAccess callback
        * @tc.desc      : Cancel authorization Accounts that have not authorized other applications
        */
        it('ActsAccountAppAccess_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAccountAppAccess_1500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var enableBundle = "com.example.actsaccountsceneappaccess";
            appAccountManager.addAccount("AppAccess_callback_account", (err)=>{
                console.info("====>add account ActsAccountAppAccess_1500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.disableAppAccess("AppAccess_callback_account", enableBundle, (err)=>{
                    expect(err.code != 0).assertEqual(true)
                    appAccountManager.deleteAccount("AppAccess_callback_account", (err)=>{
                        console.info("====>delete Account ActsAccountAppAccess_1500 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAppAccess_1500 end====");
                        done();
                    });
                })
            })
        });

        /*
        * @tc.number    : ActsAccountAppAccess_1600
        * @tc.name      : disableAppAccess promise
        * @tc.desc      : Cancel authorization Accounts that have not authorized other applications
        */
        it('ActsAccountAppAccess_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAccountAppAccess_1600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var enableBundle = "com.example.actsaccountsceneappaccess";
            console.info("====>add account ActsAccountAppAccess_1600 start====");
            try{
                await appAccountManager.addAccount("AppAccess_promise_account");
            }
            catch(err){
                console.error("====>addAccount ActsAccountAppAccess_1600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>disableAppAccess ActsAccountAppAccess_1600 start====");
            try{
                await appAccountManager.disableAppAccess("AppAccess_promise_account", enableBundle);
            }
            catch(err){
                console.info("====>disableAppAccess ActsAccountAppAccess_1600 err:" + JSON.stringify(err));
                console.info("====>delete account ActsAccountAppAccess_1600 start====");
                await appAccountManager.deleteAccount("AppAccess_promise_account");
                console.info("====>ActsAccountAppAccess_1600 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountAppAccess_1700
        * @tc.name      : disableAppAccess callback
        * @tc.desc      : The disableAppAccess parameter bundleName does not exist
        */
        it('ActsAccountAppAccess_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAppAccess_1700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var notExistBundle = "com.example.actsaccountnotexistbundle";
            appAccountManager.addAccount("AppAccess_callback_notExistBundle", (err)=>{
                console.info("====>add account ActsAccountAppAccess_1700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.disableAppAccess("AppAccess_callback_notExistBundle", notExistBundle, (err)=>{
                    expect(err.code != 0).assertEqual(true)
                    appAccountManager.deleteAccount("AppAccess_callback_notExistBundle", (err)=>{
                        console.info("====>delete Account ActsAccountAppAccess_1700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAppAccess_1700 end====");
                        done();
                    });
                })
            })
        });

        /*
        * @tc.number    : ActsAccountAppAccess_1800
        * @tc.name      : disableAppAccess promise
        * @tc.desc      : The disableAppAccess parameter bundleName does not exist
        */
        it('ActsAccountAppAccess_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAppAccess_1800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var notExistBundle = "com.example.actsaccountnotexistbundle";
            console.info("====>add account ActsAccountAppAccess_1800 start====");
            await appAccountManager.addAccount("AppAccess_promise_notExistBundle");
            console.info("====>disableAppAccess ActsAccountAppAccess_1800 start====");
            try{
                await appAccountManager.disableAppAccess("AppAccess_promise_notExistBundle", notExistBundle);
            }
            catch(err){
                console.info("====>disableAppAccess ActsAccountAppAccess_1800 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>delete account ActsAccountAppAccess_1800 start====");
                await appAccountManager.deleteAccount("AppAccess_promise_notExistBundle");
                console.info("====>ActsAccountAppAccess_1600 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountAppAccess_1900
        * @tc.name      : disableAppAccess callback
        * @tc.desc      : The disableAppAccess parameter accountName does not exist
        */
        it('ActsAccountAppAccess_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAppAccess_1900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var notExistAccount = "AppAccess_callback_notExistAccount";
            var enableBundle = "com.example.actsaccountsceneappaccess";
            console.info("====>disableAppAccess ActsAccountAppAccess_1900====");
            appAccountManager.disableAppAccess(notExistAccount, enableBundle, (err)=>{
                console.info("====>disableAppAccess ActsAccountAppAccess_1900 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountAppAccess_1900 end====");
                done();
            })
        });

        /*
        * @tc.number    : ActsAccountAppAccess_2000
        * @tc.name      : disableAppAccess promise
        * @tc.desc      : The disableAppAccess parameter accountName does not exist
        */
        it('ActsAccountAppAccess_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAppAccess_2000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var notExistAccount = "AppAccess_promise_notExistAccount";
            var enableBundle = "com.example.actsaccountsceneappaccess";
            console.info("====>disableAppAccess ActsAccountAppAccess_2000====");
            try{
                await appAccountManager.disableAppAccess(notExistAccount, enableBundle);
            }
            catch(err){
                console.info("====>disableAppAccess ActsAccountAppAccess_2000 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountAppAccess_2000 end====");
                done();
            }
        });
    })
}
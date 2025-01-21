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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import account from '@ohos.account.appAccount'
import bundle from '@ohos.bundle'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

const TIMEOUT = 2000;
const PERMISSION_USER_SET = 1;
const PERMISSION_USER_NAME = "ohos.permission.DISTRIBUTED_DATASYNC";
var tokenID = undefined;
export default function ActsSetCheckSyncEnable() {
    describe('ActsSetCheckSyncEnable', function () {
        beforeAll(async function (done) {
            console.info("====>beforeAll start====");
            var appInfo = await bundle.getApplicationInfo('com.example.actssetchecksyncenable', 0, 100);
            tokenID = appInfo.accessTokenId;
            console.info("accessTokenId" + appInfo.accessTokenId + " bundleName:" + appInfo.bundleName);
            var atManager = abilityAccessCtrl.createAtManager();
            var result = await atManager.grantUserGrantedPermission(tokenID, PERMISSION_USER_NAME, PERMISSION_USER_SET);
            console.info("tokenId" + tokenID + " result:" + result);
            sleep(TIMEOUT);
            console.info("====>beforeAll end====");
            done();
        })

        function sleep(delay) {
            var start = (new Date()).getTime();
            while((new Date()).getTime() - start < delay) {
                continue;
            }
        }

        /*
        * @tc.number    : ActsSetCheckSyncEnable_0100
        * @tc.name      : Check sync flag callback form
        * @tc.desc      : Get the synchronization flag of the account that has not set the synchronization flag
        */
        it('ActsSetCheckSyncEnable_0100', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_notset", (err)=>{
                console.info("====>add account ActsSetCheckSyncEnable_0100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAppAccountSyncEnable("syncenable_callback_notset", (err, data)=>{
                    console.info("====>checkAppAccountSyncEnable 0100 err:" + JSON.stringify(err));
                    console.info("====>checkAppAccountSyncEnable 0100 data:" + JSON.stringify(data));
                    expect(err).assertEqual(null);
                    expect(data).assertEqual(false);
                    appAccountManager.deleteAccount("syncenable_callback_notset", (err)=>{
                        console.info("====>delete Account ActsSetCheckSyncEnable_0100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsSetCheckSyncEnable_0100 end====");
                        done();
                    });
                })
            });
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_0200
        * @tc.name      : Check sync flag promise form
        * @tc.desc      : Get the synchronization flag of the account that has not set the synchronization flag
        */
        it('ActsSetCheckSyncEnable_0200', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckSyncEnable_0200 start====");
            try{
                await appAccountManager.addAccount("syncenable_promise_notset");
            }
            catch(err){
                console.error("====>add account ActsSetCheckSyncEnable_0200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_0200 start====");
            try{
                var data = await appAccountManager.checkAppAccountSyncEnable("syncenable_promise_notset");
            }
            catch(err){
                console.error("====>checkAppAccountSyncEnable 0200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkAppAccountSyncEnable 0200 data:" + JSON.stringify(data));
            expect(data).assertEqual(false);
            console.info("====>delete account ActsSetCheckSyncEnable_0200 start====");
            try{
                await appAccountManager.deleteAccount("syncenable_promise_notset");
            }
            catch(err){
                console.error("====>delete account 0200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckSyncEnable_0200 end====");
            done();
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_0300
        * @tc.name      : Check the set synchronization flag callback form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag to true for the account
        */
        it('ActsSetCheckSyncEnable_0300', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_settrue", (err)=>{
                console.info("====>add account ActsSetCheckSyncEnable_0300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAppAccountSyncEnable("syncenable_callback_settrue", true, (err)=>{
                    console.info("====>setAppAccountSyncEnable 0300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAppAccountSyncEnable("syncenable_callback_settrue", (err, data)=>{
                        console.info("====>checkAppAccountSyncEnable 0300 err:" + JSON.stringify(err));
                        console.info("====>checkAppAccountSyncEnable 0300 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null);
                        expect(data).assertEqual(true);
                        appAccountManager.deleteAccount("syncenable_callback_settrue", (err)=>{
                            console.info("====>delete Account ActsSetCheckSyncEnable_0300 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsSetCheckSyncEnable_0300 end====");
                            done();
                        });
                    })
                })
            });
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_0400
        * @tc.name      : Check the set synchronization flag promise form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag to true for the account
        */
        it('ActsSetCheckSyncEnable_0400', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckSyncEnable_0400 start====");
            try{
                await appAccountManager.addAccount("syncenable_promise_settrue");
            }
            catch(err){
                console.error("====>add account ActsSetCheckSyncEnable_0400 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>setAppAccountSyncEnable ActsSetCheckSyncEnable_0400 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_settrue", true);
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_0400 start====");
            try{
                var data = await appAccountManager.checkAppAccountSyncEnable("syncenable_promise_settrue");
            }
            catch(err){
                console.error("====>checkAppAccountSyncEnable 0400 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkAppAccountSyncEnable 0400 data:" + JSON.stringify(data));
            expect(data).assertEqual(true);
            console.info("====>delete account ActsSetCheckSyncEnable_0400 start====");
            try{
                await appAccountManager.deleteAccount("syncenable_promise_settrue");
            }
            catch(err){
                console.error("====>delete account 0400 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckSyncEnable_0400 end====");
            done();
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_0500
        * @tc.name      : Check the set synchronization flag callback form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag to false for the account
        */
        it('ActsSetCheckSyncEnable_0500', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_setfalse", (err)=>{
                console.info("====>add account ActsSetCheckSyncEnable_0500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAppAccountSyncEnable("syncenable_callback_setfalse", false, (err)=>{
                    console.info("====>setAppAccountSyncEnable 0500 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAppAccountSyncEnable("syncenable_callback_setfalse", (err, data)=>{
                        console.info("====>checkAppAccountSyncEnable 0500 err:" + JSON.stringify(err));
                        console.info("====>checkAppAccountSyncEnable 0500 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null);
                        expect(data).assertEqual(false);
                        appAccountManager.deleteAccount("syncenable_callback_setfalse", (err)=>{
                            console.info("====>delete Account ActsSetCheckSyncEnable_0500 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsSetCheckSyncEnable_0500 end====");
                            done();
                        });
                    })
                })
            });
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_0600
        * @tc.name      : Check the set synchronization flag promise form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag to false for the account
        */
        it('ActsSetCheckSyncEnable_0600', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckSyncEnable_0600 start====");
            try{
                await appAccountManager.addAccount("syncenable_promise_setfalse");
            }
            catch(err){
                console.error("====>add account ActsSetCheckSyncEnable_0600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>setAppAccountSyncEnable ActsSetCheckSyncEnable_0600 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_setfalse", false);
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_0600 start====");
            try{
                var data = await appAccountManager.checkAppAccountSyncEnable("syncenable_promise_setfalse");
            }
            catch(err){
                console.error("====>checkAppAccountSyncEnable 0600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkAppAccountSyncEnable 0600 data:" + JSON.stringify(data));
            expect(data).assertEqual(false);
            console.info("====>delete account ActsSetCheckSyncEnable_0600 start====");
            try{
                await appAccountManager.deleteAccount("syncenable_promise_setfalse");
            }
            catch(err){
                console.error("====>delete account 0600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckSyncEnable_0600 end====");
            done();
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_0700
        * @tc.name      : Check the set synchronization flag callback form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag for the account to false
        *                 for the first time and true for the second time
        */
        it('ActsSetCheckSyncEnable_0700', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_falsetrue", (err)=>{
                console.info("====>add account ActsSetCheckSyncEnable_0700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAppAccountSyncEnable("syncenable_callback_falsetrue", false, (err)=>{
                    console.info("====>setAppAccountSyncEnable first time 0700 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAppAccountSyncEnable("syncenable_callback_falsetrue", true, (err)=>{
                        console.info("====>setAppAccountSyncEnable second time 0700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.checkAppAccountSyncEnable("syncenable_callback_falsetrue", (err, data)=>{
                            console.info("====>checkAppAccountSyncEnable 0700 err:" + JSON.stringify(err));
                            console.info("====>checkAppAccountSyncEnable 0700 data:" + JSON.stringify(data));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual(true);
                            appAccountManager.deleteAccount("syncenable_callback_falsetrue", (err)=>{
                                console.info("====>delete Account 0700 err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsSetCheckSyncEnable_0700 end====");
                                done();
                            });
                        })
                    })
                })
            });
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_0800
        * @tc.name      : Check the set synchronization flag promise form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag for the account to false
        *                 for the first time and true for the second time
        */
        it('ActsSetCheckSyncEnable_0800', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckSyncEnable_0800 start====");
            await appAccountManager.addAccount("syncenable_promise_truefalse");
            console.info("====>setAppAccountSyncEnable first time ActsSetCheckSyncEnable_0800 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_truefalse", false);
            console.info("====>setAppAccountSyncEnable second time ActsSetCheckSyncEnable_0800 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_truefalse", true);
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_0800 start====");
            try{
                var data = await appAccountManager.checkAppAccountSyncEnable("syncenable_promise_truefalse");
            }
            catch(err){
                console.error("====>checkAppAccountSyncEnable 0800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkAppAccountSyncEnable 0800 data:" + JSON.stringify(data));
            expect(data).assertEqual(true);
            console.info("====>delete account ActsSetCheckSyncEnable_0800 start====");
            try{
                await appAccountManager.deleteAccount("syncenable_promise_truefalse");
            }
            catch(err){
                console.error("====>delete account 0800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckSyncEnable_0800 end====");
            done();
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_0900
        * @tc.name      : Check the set synchronization flag callback form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag for the account to true
        *                 for the first time and false for the second time
        */
        it('ActsSetCheckSyncEnable_0900', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_falsetrue", (err)=>{
                console.info("====>add account ActsSetCheckSyncEnable_0900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAppAccountSyncEnable("syncenable_callback_falsetrue", true, (err)=>{
                    console.info("====>setAppAccountSyncEnable first time 0900 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAppAccountSyncEnable("syncenable_callback_falsetrue", false, (err)=>{
                        console.info("====>setAppAccountSyncEnable second time 0900 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.checkAppAccountSyncEnable("syncenable_callback_falsetrue", (err, data)=>{
                            console.info("====>checkAppAccountSyncEnable 0900 err:" + JSON.stringify(err));
                            console.info("====>checkAppAccountSyncEnable 0900 data:" + JSON.stringify(data));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual(false);
                            appAccountManager.deleteAccount("syncenable_callback_falsetrue", (err)=>{
                                console.info("====>delete Account 0900 err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsSetCheckSyncEnable_0900 end====");
                                done();
                            });
                        })
                    })
                })
            });
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_1000
        * @tc.name      : Check the set synchronization flag promise form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag for the account to true
        *                 for the first time and false for the second time
        */
        it('ActsSetCheckSyncEnable_1000', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckSyncEnable_1000 start====");
            await appAccountManager.addAccount("syncenable_promise_truefalse");
            console.info("====>setAppAccountSyncEnable first time ActsSetCheckSyncEnable_1000 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_truefalse", true);
            console.info("====>setAppAccountSyncEnable second time ActsSetCheckSyncEnable_1000 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_truefalse", false);
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_1000 start====");
            try{
                var data = await appAccountManager.checkAppAccountSyncEnable("syncenable_promise_truefalse");
            }
            catch(err){
                console.error("====>checkAppAccountSyncEnable 1000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkAppAccountSyncEnable 1000 data:" + JSON.stringify(data));
            expect(data).assertEqual(false);
            console.info("====>delete account ActsSetCheckSyncEnable_1000 start====");
            try{
                await appAccountManager.deleteAccount("syncenable_promise_truefalse");
            }
            catch(err){
                console.error("====>delete account 1000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckSyncEnable_1000 end====");
            done();
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_1100
        * @tc.name      : Check the set synchronization flag callback form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag for the account to true
        *                 for the first time and true for the second time
        */
        it('ActsSetCheckSyncEnable_1100', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_truetrue", (err)=>{
                console.info("====>add account ActsSetCheckSyncEnable_1100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAppAccountSyncEnable("syncenable_callback_truetrue", true, (err)=>{
                    console.info("====>setAppAccountSyncEnable first time 1100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAppAccountSyncEnable("syncenable_callback_truetrue", true, (err)=>{
                        console.info("====>setAppAccountSyncEnable second time 1100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.checkAppAccountSyncEnable("syncenable_callback_truetrue", (err, data)=>{
                            console.info("====>checkAppAccountSyncEnable 1100 err:" + JSON.stringify(err));
                            console.info("====>checkAppAccountSyncEnable 1100 data:" + JSON.stringify(data));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual(true);
                            appAccountManager.deleteAccount("syncenable_callback_truetrue", (err)=>{
                                console.info("====>delete Account 1100 err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsSetCheckSyncEnable_1100 end====");
                                done();
                            });
                        })
                    })
                })
            });
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_1200
        * @tc.name      : Check the set synchronization flag promise form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag for the account to true
        *                 for the true time and true for the second time
        */
        it('ActsSetCheckSyncEnable_1200', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckSyncEnable_1200 start====");
            await appAccountManager.addAccount("syncenable_promise_truetrue");
            console.info("====>setAppAccountSyncEnable first time ActsSetCheckSyncEnable_1200 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_truetrue", true);
            console.info("====>setAppAccountSyncEnable second time ActsSetCheckSyncEnable_1200 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_truetrue", true);
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_1200 start====");
            try{
                var data = await appAccountManager.checkAppAccountSyncEnable("syncenable_promise_truetrue");
            }
            catch(err){
                console.error("====>checkAppAccountSyncEnable 1200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkAppAccountSyncEnable 1200 data:" + JSON.stringify(data));
            expect(data).assertEqual(true);
            console.info("====>delete account ActsSetCheckSyncEnable_1200 start====");
            try{
                await appAccountManager.deleteAccount("syncenable_promise_truetrue");
            }
            catch(err){
                console.error("====>delete account 1200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckSyncEnable_1200 end====");
            done();
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_1300
        * @tc.name      : setAppAccountSyncEnable callback form
        * @tc.desc      : Set synchronization flag for non-existent account
        */
        it('ActsSetCheckSyncEnable_1300', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>setAppAccountSyncEnable ActsSetCheckSyncEnable_1300 start====")
            var accountNotExist = "syncenable_callback_notexist";
            appAccountManager.setAppAccountSyncEnable(accountNotExist, true, (err)=>{
                console.info("====>setAppAccountSyncEnable 1300 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsSetCheckSyncEnable_1300 end====");
                done();
            });
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_1400
        * @tc.name      : setAppAccountSyncEnable promise form
        * @tc.desc      : Set synchronization flag for non-existent account
        */
        it('ActsSetCheckSyncEnable_1400', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>setAppAccountSyncEnable ActsSetCheckSyncEnable_1400 start====")
            var accountNotExist = "syncenable_promise_notexist";
            try{
                await appAccountManager.setAppAccountSyncEnable(accountNotExist, true);
            }
            catch(err){
                console.info("====>setAppAccountSyncEnable 1400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsSetCheckSyncEnable_1400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_1500
        * @tc.name      : checkAppAccountSyncEnable callback form
        * @tc.desc      : Check synchronization flag for non-existent account
        */
        it('ActsSetCheckSyncEnable_1500', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_1500 start====")
            var accountNotExist = "syncenable_callback_notexist";
            appAccountManager.checkAppAccountSyncEnable(accountNotExist, (err, data)=>{
                console.info("====>checkAppAccountSyncEnable 1500 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsSetCheckSyncEnable_1500 end====");
                done();
            });
        });

        /*
        * @tc.number    : ActsSetCheckSyncEnable_1600
        * @tc.name      : checkAppAccountSyncEnable promise form
        * @tc.desc      : Check synchronization flag for non-existent account
        */
        it('ActsSetCheckSyncEnable_1600', 0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_1600 start====")
            var accountNotExist = "syncenable_promise_notexist";
            try{
                await appAccountManager.checkAppAccountSyncEnable(accountNotExist);
            }
            catch(err){
                console.info("====>checkAppAccountSyncEnable 1600 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsSetCheckSyncEnable_1600 end====");
                done();
            }
        });
    })
}
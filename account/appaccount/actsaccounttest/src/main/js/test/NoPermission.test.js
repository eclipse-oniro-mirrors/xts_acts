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

const TIMEOUT = 5000;
const ERR_APPACCOUNT_SERVICE_PERMISSION_DENIED = 4521993;
export default function ActsAccountNoPermission() {
    describe('ActsAccountNoPermission', function () {

        /*
        * @tc.number    : ActsAccountNoPermission_0100
        * @tc.name      : setAppAccountSyncEnable callback
        * @tc.desc      : Set the added account to allow synchronization without permission
        */
        it('ActsAccountNoPermission_0100', 0, async function (done) {
            console.debug("====>ActsAccountNoPermission_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_setnopermission", (err)=>{
                console.debug("====>add account ActsAccountNoPermission_0100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAppAccountSyncEnable("syncenable_callback_setnopermission", true, (err)=>{
                    console.debug("====>setAppAccountSyncEnable 0100 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(account.ResultCode.ERROR_PERMISSION_DENIED);
                    appAccountManager.deleteAccount("syncenable_callback_setnopermission", (err)=>{
                        console.debug("====>delete Account ActsAccountNoPermission_0100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountNoPermission_0100 end====");
                        done();
                    }); 
                })
            });
        });

        /*
        * @tc.number    : ActsAccountNoPermission_0200
        * @tc.name      : setAppAccountSyncEnable promise
        * @tc.desc      : Set the added account to allow synchronization without permission
        */
        it('ActsAccountNoPermission_0200', 0, async function (done) {
            console.debug("====>ActsAccountNoPermission_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            console.debug("====>add account ActsAccountNoPermission_0200 start====");
            await appAccountManager.addAccount("syncenable_promise_setnopermission");
            console.debug("====>setAppAccountSyncEnable ActsAccountNoPermission_0200 start====");
            try{
                await appAccountManager.setAppAccountSyncEnable("syncenable_promise_setnopermission", true);
            }
            catch(err){
                console.debug("====>setAppAccountSyncEnable 0200 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(account.ResultCode.ERROR_PERMISSION_DENIED);
                console.debug("====>delete account ActsAccountNoPermission_0200 start====");
                await appAccountManager.deleteAccount("syncenable_promise_setnopermission");
                console.debug("====>ActsAccountNoPermission_0200 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountNoPermission_0300
        * @tc.name      : Check sync flag callback form
        * @tc.desc      : Check the added account synchronization without permission
        */
        it('ActsAccountNoPermission_0300', 0, async function (done) {
            console.debug("====>ActsAccountNoPermission_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_checknopermission", (err)=>{
                console.debug("====>add account ActsAccountNoPermission_0300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAppAccountSyncEnable("syncenable_callback_checknopermission", (err, data)=>{
                    console.debug("====>checkAppAccountSyncEnable 0300 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(account.ResultCode.ERROR_PERMISSION_DENIED);
                    appAccountManager.deleteAccount("syncenable_callback_checknopermission", (err)=>{
                        console.debug("====>delete Account ActsAccountNoPermission_0300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountNoPermission_0300 end====");
                        done();
                    });
                })
            });
        });

        /*
        * @tc.number    : ActsAccountNoPermission_0400
        * @tc.name      : Check sync flag promise form
        * @tc.desc      : Check the added account synchronization without permission
        */
        it('ActsAccountNoPermission_0400', 0, async function (done) {
            console.debug("====>ActsAccountNoPermission_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            console.debug("====>add account ActsAccountNoPermission_0400 start====");
            await appAccountManager.addAccount("syncenable_promise_checknopermission");
            console.debug("====>checkAppAccountSyncEnable ActsAccountNoPermission_0400 start====");
            try{
                var data = await appAccountManager.checkAppAccountSyncEnable("syncenable_promise_checknopermission");
            }
            catch(err){
                console.debug("====>checkAppAccountSyncEnable 0400 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(account.ResultCode.ERROR_PERMISSION_DENIED);
                await appAccountManager.deleteAccount("syncenable_promise_checknopermission");
                console.debug("====>ActsAccountNoPermission_0400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountNoPermission_0500
        * @tc.name      : getAllAccessibleAccounts callback
        * @tc.desc      : This application gets authorization after adding a single account without permission
        */
        it('ActsAccountNoPermission_0500', 0, async function (done) {
            console.debug("====>ActsAccountNoPermission_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            appAccountManager.addAccount("accessibleAccount_callback_nopermission", (err)=>{
                console.debug("====> add account ActsAccountNoPermission_0500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAccessibleAccounts((err, data)=>{
                    console.debug("====>getAllAccessibleAccounts 0500 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(account.ResultCode.ERROR_PERMISSION_DENIED);
                    appAccountManager.deleteAccount("accessibleAccount_callback_nopermission", (err)=>{
                        console.debug("====>delete Account ActsAccountNoPermission_0500 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountNoPermission_0500 end====");
                        done();
                    })
                });
            });
        });

        /*
        * @tc.number    : ActsAccountNoPermission_0600
        * @tc.name      : getAllAccessibleAccounts promise
        * @tc.desc      : This application gets authorization after adding a single account without permission
        */
        it('ActsAccountNoPermission_0600', 0, async function (done) {
            console.debug("====>ActsAccountNoPermission_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            console.debug("====>add account ActsAccountNoPermission_0600 start====");
            await appAccountManager.addAccount("accessibleAccount_promise_nopermission");
            console.debug("====>getAllAccessibleAccounts 0600 start====");
            try{
                var data = await appAccountManager.getAllAccessibleAccounts();
            }
            catch(err){
                console.debug("====>getAllAccessibleAccounts 0600 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(account.ResultCode.ERROR_PERMISSION_DENIED);
                await appAccountManager.deleteAccount("accessibleAccount_promise_nopermission");
                console.debug("====>ActsAccountNoPermission_0600 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountNoPermission_0700
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : This application gets its own application information after adding an account  permission
        */
        it('ActsAccountNoPermission_0700', 0, async function (done) {
            console.debug("====>ActsAccountNoPermission_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            var selfBundle = "com.example.actsaccounttest";
            appAccountManager.addAccount("getAll_callback_nopermission", (err)=>{
                console.debug("====>add account 0700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAccounts(selfBundle, (err, data)=>{
                    console.debug("====>getAllAccounts 0700 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    expect(data.length>0).assertEqual(true);
                    appAccountManager.deleteAccount("getAll_callback_nopermission", (err)=>{
                        console.debug("====>delete account 0700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountNoPermission_0700 end====");
                        done();
                    });
                })
            });
        });

        /*
        * @tc.number    : ActsAccountNoPermission_0800
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : This application gets its own application information after adding an account  permission
        */
        it('ActsAccountNoPermission_0800', 0, async function (done) {
            console.debug("====>ActsAccountNoPermission_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            var selfBundle = "com.example.actsaccounttest";
            console.debug("====>add account 0800 start====");
            await appAccountManager.addAccount("getAll_promise_nopermission");
            console.debug("====>getAllAccounts 0800 start====");
            try{
                var data = await appAccountManager.getAllAccounts(selfBundle);
                console.debug("====>getAll_promise_nopermission data:" + JSON.stringify(data))
                expect(data.length>0).assertEqual(true);
                done();
            }
            catch(err){
                console.error("====>getAllAccounts 0800 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(account.ResultCode.ERROR_PERMISSION_DENIED);
                await appAccountManager.deleteAccount("getAll_promise_nopermission");      
                console.debug("====>ActsAccountNoPermission_0800 end====");
                done();
            }          
        });
        
        /*
        * @tc.number    : ActsAccountNoPermission_0900
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : This application gets its own application information after adding an account  permission
        */
        it('ActsAccountNoPermission_0900', 0, async function (done) {
            console.debug("====>ActsAccountNoPermission_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            var selfBundle = "com.example.actsaccounttest";
            appAccountManager.addAccount("ActsAccountNoPermission_0900", (err)=>{
                console.debug("====>add account 0900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAccounts("com.example.accountauthenticator", (err, data)=>{                    
                    console.debug("====>getAllAccounts 0900 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(account.ResultCode.ERROR_PERMISSION_DENIED);
                    appAccountManager.deleteAccount("ActsAccountNoPermission_0900", (err)=>{
                        console.debug("====>delete account 0900 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountNoPermission_0900 end====");
                        done();
                    });
                })
            });
        });

        /*
        * @tc.number    : ActsAccountNoPermission_1000
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : This application gets its own application information after adding an account  permission
        */
        it('ActsAccountNoPermission_1000', 0, async function (done) {
            console.debug("====>ActsAccountNoPermission_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            console.debug("====>add account 1000 start====");
            try{
                await appAccountManager.addAccount("ActsAccountNoPermission_1000");
            }catch(err){
                console.error("====>addAccount 1000 err:" + JSON.stringify(err));
                expect().assertFalse();
                done();
            }            
            console.debug("====>getAllAccounts 1000 start====");
            try{
                var data = await appAccountManager.getAllAccounts("com.example.accountauthenticator");
                console.debug("====>getAll_promise_nopermission data:" + JSON.stringify(data))
                expect().assertFalse();
                done();
            }
            catch(err){
                console.error("====>getAllAccounts 1000 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(account.ResultCode.ERROR_PERMISSION_DENIED);
                await appAccountManager.deleteAccount("ActsAccountNoPermission_1000");      
                console.debug("====>ActsAccountNoPermission_1000 end====");
                done();
            }          
        });
    })
}
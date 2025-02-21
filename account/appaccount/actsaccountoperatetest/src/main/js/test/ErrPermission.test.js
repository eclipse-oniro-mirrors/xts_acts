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

const ERR_PERMISSION_DENIED = 201;
export default function ActsAccountErrPermission() {
    describe('ActsAccountErrPermission', function () {
        /*
        * @tc.number    : ActsAccountErrPermission_0100
        * @tc.name      : setDataSyncEnabled callback
        * @tc.desc      : Set the added account to allow synchronization without permission
        */
        it('ActsAccountErrPermission_0100', 0, async function (done) {
            console.debug("====>ActsAccountErrPermission_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            appAccountManager.createAccount("syncenable_callback_setnopermission", (err)=>{
                console.debug("====>add account ActsAccountErrPermission_0100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setDataSyncEnabled("syncenable_callback_setnopermission", true, (err)=>{
                    console.debug("====>setDataSyncEnabled 0100 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(ERR_PERMISSION_DENIED);
                    appAccountManager.removeAccount("syncenable_callback_setnopermission", (err)=>{
                        console.debug("====>delete Account ActsAccountErrPermission_0100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountErrPermission_0100 end====");
                        done();
                    }); 
                })
            });
        });

        /*
        * @tc.number    : ActsAccountErrPermission_0200
        * @tc.name      : setDataSyncEnabled promise
        * @tc.desc      : Set the added account to allow synchronization without permission
        */
        it('ActsAccountErrPermission_0200', 0, async function (done) {
            console.debug("====>ActsAccountErrPermission_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            console.debug("====>add account ActsAccountErrPermission_0200 start====");
            await appAccountManager.createAccount("syncenable_promise_setnopermission");
            console.debug("====>setDataSyncEnabled ActsAccountErrPermission_0200 start====");
            try{
                await appAccountManager.setDataSyncEnabled("syncenable_promise_setnopermission", true);
            }
            catch(err){
                console.debug("====>setDataSyncEnabled 0200 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_PERMISSION_DENIED);
                console.debug("====>delete account ActsAccountErrPermission_0200 start====");
                await appAccountManager.removeAccount("syncenable_promise_setnopermission");
                console.debug("====>ActsAccountErrPermission_0200 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountErrPermission_0300
        * @tc.name      : Check sync flag callback form
        * @tc.desc      : Check the added account synchronization without permission
        */
        it('ActsAccountErrPermission_0300', 0, async function (done) {
            console.debug("====>ActsAccountErrPermission_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            appAccountManager.createAccount("syncenable_callback_checknopermission", (err)=>{
                console.debug("====>add account ActsAccountErrPermission_0300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkDataSyncEnabled("syncenable_callback_checknopermission", (err, data)=>{
                    console.debug("====>checkDataSyncEnable 0300 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(ERR_PERMISSION_DENIED);
                    appAccountManager.removeAccount("syncenable_callback_checknopermission", (err)=>{
                        console.debug("====>delete Account ActsAccountErrPermission_0300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountErrPermission_0300 end====");
                        done();
                    });
                })
            });
        });

        /*
        * @tc.number    : ActsAccountErrPermission_0400
        * @tc.name      : Check sync flag promise form
        * @tc.desc      : Check the added account synchronization without permission
        */
        it('ActsAccountErrPermission_0400', 0, async function (done) {
            console.debug("====>ActsAccountErrPermission_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            console.debug("====>add account ActsAccountErrPermission_0400 start====");
            await appAccountManager.createAccount("syncenable_promise_checknopermission");
            console.debug("====>checkDataSyncEnable ActsAccountErrPermission_0400 start====");
            try{
                var data = await appAccountManager.checkDataSyncEnabled("syncenable_promise_checknopermission");
            }
            catch(err){
                console.debug("====>checkDataSyncEnable 0400 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_PERMISSION_DENIED);
                await appAccountManager.removeAccount("syncenable_promise_checknopermission");
                console.debug("====>ActsAccountErrPermission_0400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountErrPermission_0500
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : This application gets authorization after adding a single account without permission
        */
        it('ActsAccountErrPermission_0500', 0, async function (done) {
            console.debug("====>ActsAccountErrPermission_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            appAccountManager.createAccount("accessibleAccount_callback_nopermission", (err)=>{
                console.debug("====>add account ActsAccountErrPermission_0500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);                
                appAccountManager.getAllAccounts((err, data)=>{
                    console.debug("====>getAllAccounts 0500 err:" + JSON.stringify(err));
                    expect(data.length).assertEqual(1);
                    expect(data[0].name).assertEqual("accessibleAccount_callback_nopermission");
                    expect(data[0].owner).assertEqual("com.example.actsaccountoperatetest");
                    appAccountManager.removeAccount("accessibleAccount_callback_nopermission", (err)=>{
                        console.debug("====>delete Account ActsAccountErrPermission_0500 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountErrPermission_0500 end====");
                        done();
                    })
                });
            });
        });

        /*
        * @tc.number    : ActsAccountErrPermission_0600
        * @tc.name      : getAllAccounts promise
        * @tc.desc      : This application gets authorization after adding a single account without permission
        */
        it('ActsAccountErrPermission_0600', 0, async function (done) {
            console.debug("====>ActsAccountErrPermission_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            console.debug("====>add account ActsAccountErrPermission_0600 start====");
            await appAccountManager.createAccount("accessibleAccount_promise_nopermission");
            console.debug("====>getAllAccounts 0600 start====");
            try{
                var data = await appAccountManager.getAllAccounts();
                expect(data.length).assertEqual(1);
                expect(data[0].name).assertEqual("accessibleAccount_promise_nopermission");
                expect(data[0].owner).assertEqual("com.example.actsaccountoperatetest");
                console.debug("====>getAllAccounts 0600 err:" + JSON.stringify(data));
                await appAccountManager.removeAccount("accessibleAccount_promise_nopermission");
                console.debug("====>ActsAccountErrPermission_0600 end====");
                done();
            }
            catch(err){
                console.debug("====>getAllAccounts 0600 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountErrPermission_0700
        * @tc.name      : getAccountsByOwner callback
        * @tc.desc      : This application gets its own application information after adding an account without permission
        */
        it('ActsAccountErrPermission_0700', 0, async function (done) {
            console.debug("====>ActsAccountErrPermission_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            var selfBundle = "com.example.actsaccountoperatetest";
            appAccountManager.createAccount("getAll_callback_nopermission", (err)=>{
                console.debug("====>add account 0700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAccountsByOwner(selfBundle, (err, data)=>{
                    console.debug("====>getAccountsByOwner 0700 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    expect(data.length>0).assertEqual(true);
                    appAccountManager.removeAccount("getAll_callback_nopermission", (err)=>{
                        console.debug("====>delete account 0700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountErrPermission_0700 end====");
                        done();
                    });
                })
            });
        });

        /*
        * @tc.number    : ActsAccountErrPermission_0800
        * @tc.name      : getAccountsByOwner promise
        * @tc.desc      : This application gets its own application information after adding an account without permission
        */
        it('ActsAccountErrPermission_0800', 0, async function (done) {
            console.debug("====>ActsAccountErrPermission_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            var selfBundle = "com.example.actsaccountoperatetest";
            console.debug("====>add account 0800 start====");
            await appAccountManager.createAccount("getAll_promise_nopermission");
            console.debug("====>getAccountsByOwner 0800 start====");
            try{
                var data = await appAccountManager.getAccountsByOwner(selfBundle);
                console.debug("====>getAll_promise_nopermission data:" + JSON.stringify(data))
                expect(data.length>0).assertEqual(true);
                done();
            }
            catch(err){
                console.error("====>getAccountsByOwner 0800 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_PERMISSION_DENIED);
                await appAccountManager.removeAccount("getAll_promise_nopermission");      
                console.debug("====>ActsAccountErrPermission_0800 end====");
                done();
            }          
        });
    })
}
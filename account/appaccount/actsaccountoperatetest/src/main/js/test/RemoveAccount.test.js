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
const NAMELIMIT = 512;
const ERR_INVALID_PARAMETER = 12300002
const ERR_ACCOUNT_NO_EXIST = 12300003
const createAccountOptions = {customData:{age:'12'}}
export default function ActsAccountRemoveAccount() {
    describe('ActsAccountRemoveAccount', function () {

        /*
        * @tc.number    : ActsAccountRemoveAccount_0100
        * @tc.name      : Remove account callback form
        * @tc.desc      : Remove the added account in callback form
        */
        it('ActsAccountRemoveAccount_0100', 0, async function (done) {
            console.debug("====>ActsAccountRemoveAccount_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            appAccountManager.createAccount("removeAccount_name_callback_first", createAccountOptions, (err)=>{
                console.debug("====>add account ActsAccountRemoveAccount_0100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.removeAccount("removeAccount_name_callback_first", (err)=>{
                    console.debug("====>delete Account ActsAccountRemoveAccount_0100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.debug("====>ActsAccountRemoveAccount_0100 end====");
                    done();
                });
            });
        });

        /*
        * @tc.number    : ActsAccountRemoveAccount_0200
        * @tc.name      : Remove account promise form
        * @tc.desc      : Remove the added account in promise form
        */
        it('ActsAccountRemoveAccount_0200',0,async function (done){
            console.debug("====>ActsAccountRemoveAccount_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>add account ActsAccountcreateAccount_0200 start====");
            await appAccountManager.createAccount("removeAccount_name_promise_first",createAccountOptions);
            try{
                await appAccountManager.removeAccount("removeAccount_name_promise_first");
                console.debug("====>ActsAccountRemoveAccount_0200 end====");
                done();
            }
            catch(err){
                console.error("====>delete account ActsAccountRemoveAccount_0200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountRemoveAccount_0300
        * @tc.name      : Remove account callback form
        * @tc.desc      : Remove unadded account in callback form
        */
        it('ActsAccountRemoveAccount_0300', 0, async function (done) {
            console.debug("====>ActsAccountRemoveAccount_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat finish====");
            appAccountManager.removeAccount("removeAccount_name_callback_second", (err)=>{
                console.debug("====>delete Account ActsAccountRemoveAccount_0300 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_ACCOUNT_NO_EXIST);
                console.debug("====>ActsAccountRemoveAccount_0300 end====");
                done();
            });
        });

        /*
        * @tc.number    : ActsAccountRemoveAccount_0400
        * @tc.name      : Remove account promise form
        * @tc.desc      : Remove unadded account in promise form
        */
        it('ActsAccountRemoveAccount_0400', 0, async function(done){
            console.debug("====>ActsAccountRemoveAccount_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            try{
                await appAccountManager.removeAccount("removeAccount_name_promise_second");
            }
            catch(err){
                console.debug("====>delete account ActsAccountRemoveAccount_0400 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_ACCOUNT_NO_EXIST);
                console.debug("====>ActsAccountRemoveAccount_0400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountRemoveAccount_0500
        * @tc.name      : Remove account callback form
        * @tc.desc      : Remove the added account, the first time it can be deleted, the second time the deletion fails
        */
        it('ActsAccountRemoveAccount_0500', 0, async function (done) {
            console.debug("====>ActsAccountRemoveAccount_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("removeAccount_name_callback_third", createAccountOptions, (err)=>{
                console.debug("====>add account ActsAccountRemoveAccount_0500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.removeAccount("removeAccount_name_callback_third", (err)=>{
                    console.debug("====>delete account first time  err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.removeAccount("removeAccount_name_callback_third", (err)=>{
                        console.debug("====>delete Account second time err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(ERR_ACCOUNT_NO_EXIST);
                        console.debug("====>ActsAccountRemoveAccount_0500 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountRemoveAccount_0600
        * @tc.name      : Remove account promise form
        * @tc.desc      : Remove the added account, the first time it can be deleted, the second time the deletion fails
        */
        it('ActsAccountRemoveAccount_0600', 0, async function (done){
            console.debug("====>ActsAccountRemoveAccount_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>add account ActsAccountcreateAccount_0600 start====");
            await appAccountManager.createAccount("removeAccount_name_promise_third", createAccountOptions);
            console.debug("====>delete Account first time ActsAccountRemoveAccount_0600 start====");
            await appAccountManager.removeAccount("removeAccount_name_promise_third");
            console.debug("====>delete Account second time ActsAccountRemoveAccount_0600 start====");
            try{
                await appAccountManager.removeAccount("removeAccount_name_promise_third");
            }
            catch(err){
                console.debug("====>delete account ActsAccountRemoveAccount_0600 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_ACCOUNT_NO_EXIST);
                console.debug("====>ActsAccountRemoveAccount_0600 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountRemoveAccount_0700
        * @tc.name      : Remove account callback form
        * @tc.desc      : Remove the account name exceeds the length limit of 512 characters
        */
        it('ActsAccountRemoveAccount_0700',0, async function (done){
            console.debug("====>ActsAccountRemoveAccount_0700 start====");
            var nameLimit = '';
            for (var i = 0; i < NAMELIMIT + 1; i++) {
                nameLimit += 't';
            }
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.removeAccount(nameLimit, (err)=>{
                console.debug("====>delete Account ActsAccountRemoveAccount_0700 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
                console.debug("====>ActsAccountRemoveAccount_0700 end====");
                done();
            });
        });

        /*
        * @tc.number    : ActsAccountRemoveAccount_0800
        * @tc.name      : Remove account promise form
        * @tc.desc      : Remove the account name exceeds the length limit of 512 characters
        */
        it('ActsAccountRemoveAccount_0800', 0, async function (done){
            console.debug("====>ActsAccountRemoveAccount_0800 start====");
            var nameLimit = '';
            for (var i = 0; i < NAMELIMIT + 1; i++) {
                nameLimit += 'n';
            }
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>delete Account ActsAccountRemoveAccount_0800 start====");
            try{
                await appAccountManager.removeAccount(nameLimit);
            }
            catch(err){
                console.debug("====>delete account ActsAccountRemoveAccount_0800 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
                console.debug("====>ActsAccountRemoveAccount_0800 end====");
                done();
            }
        })

        /*
        * @tc.number    : ActsAccountRemoveAccount_0900
        * @tc.name      : Remove account callback form
        * @tc.desc      : Remove the account name is an empty string
        */
        it('ActsAccountRemoveAccount_0900',0, async function (done){
            console.debug("====>ActsAccountRemoveAccount_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.removeAccount("", (err)=>{
                console.debug("====>delete Account ActsAccountRemoveAccount_0900 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
                console.debug("====>ActsAccountRemoveAccount_0900 end====");
                done();
            });
        });

        /*
        * @tc.number    : ActsAccountRemoveAccount_1000
        * @tc.name      : Remove account promise form
        * @tc.desc      : Remove the account name is an empty string
        */
        it('ActsAccountRemoveAccount_1000', 0, async function (done){
            console.debug("====>ActsAccountRemoveAccount_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>delete Account ActsAccountRemoveAccount_1000 start====");
            try{
                await appAccountManager.removeAccount("");
            }
            catch(err){
                console.debug("====>delete account ActsAccountRemoveAccount_1000 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
                console.debug("====>ActsAccountRemoveAccount_1000 end====");
                done();
            }
        })
    })
}

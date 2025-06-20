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
const NAMELIMIT = 512;
const TIMEOUT = 5000;
export default function ActsAccountDeleteAccount() {
    describe('ActsAccountDeleteAccount', function () {

        /*
        * @tc.number    : ActsAccountDeleteAccount_0100
        * @tc.name      : Delete account callback form
        * @tc.desc      : Delete the added account in callback form
        */
        it('ActsAccountDeleteAccount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsAccountDeleteAccount_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("deleteAccount_name_callback_first", "extraInfo_callback_first", (err)=>{
                console.info("====>add account ActsAccountDeleteAccount_0100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.deleteAccount("deleteAccount_name_callback_first", (err)=>{
                    console.info("====>delete Account ActsAccountDeleteAccount_0100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.info("====>ActsAccountDeleteAccount_0100 end====");
                    done();
                });
            });
        });

        /*
        * @tc.number    : ActsAccountDeleteAccount_0200
        * @tc.name      : Delete account promise form
        * @tc.desc      : Delete the added account in promise form
        */
        it('ActsAccountDeleteAccount_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async function (done){
            console.info("====>ActsAccountDeleteAccount_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>add account ActsAccountAddAccount_0200 start====");
            await appAccountManager.addAccount("deleteAccount_name_promise_first","extraInfo_promise_first");
            try{
                await appAccountManager.deleteAccount("deleteAccount_name_promise_first");
                console.info("====>ActsAccountDeleteAccount_0200 end====");
                done();
            }
            catch(err){
                console.error("====>delete account ActsAccountDeleteAccount_0200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountDeleteAccount_0300
        * @tc.name      : Delete account callback form
        * @tc.desc      : Delete unadded account in callback form
        */
        it('ActsAccountDeleteAccount_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountDeleteAccount_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.deleteAccount("deleteAccount_name_callback_second", (err)=>{
                console.info("====>delete Account ActsAccountDeleteAccount_0300 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountDeleteAccount_0300 end====");
                done();
            });
        });

        /*
        * @tc.number    : ActsAccountDeleteAccount_0400
        * @tc.name      : Delete account promise form
        * @tc.desc      : Delete unadded account in promise form
        */
        it('ActsAccountDeleteAccount_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done){
            console.info("====>ActsAccountDeleteAccount_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            try{
                await appAccountManager.deleteAccount("deleteAccount_name_promise_second");
            }
            catch(err){
                console.info("====>delete account ActsAccountDeleteAccount_0400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountDeleteAccount_0400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountDeleteAccount_0500
        * @tc.name      : Delete account callback form
        * @tc.desc      : Delete the added account, the first time it can be deleted, the second time the deletion fails
        */
        it('ActsAccountDeleteAccount_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountDeleteAccount_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("deleteAccount_name_callback_third", "extraInfo_callback_third", (err)=>{
                console.info("====>add account ActsAccountDeleteAccount_0500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.deleteAccount("deleteAccount_name_callback_third", (err)=>{
                    console.info("====>delete account first time  err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAccount("deleteAccount_name_callback_third", (err)=>{
                        console.info("====>delete Account second time err:" + JSON.stringify(err));
                        expect(err.code != 0).assertEqual(true);
                        console.info("====>ActsAccountDeleteAccount_0500 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountDeleteAccount_0600
        * @tc.name      : Delete account promise form
        * @tc.desc      : Delete the added account, the first time it can be deleted, the second time the deletion fails
        */
        it('ActsAccountDeleteAccount_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done){
            console.info("====>ActsAccountDeleteAccount_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>add account ActsAccountAddAccount_0600 start====");
            await appAccountManager.addAccount("deleteAccount_name_promise_third", "extraInfo_promise_third");
            console.info("====>delete Account first time ActsAccountDeleteAccount_0600 start====");
            await appAccountManager.deleteAccount("deleteAccount_name_promise_third");
            console.info("====>delete Account second time ActsAccountDeleteAccount_0600 start====");
            try{
                await appAccountManager.deleteAccount("deleteAccount_name_promise_third");
            }
            catch(err){
                console.info("====>delete account ActsAccountDeleteAccount_0600 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountDeleteAccount_0600 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountDeleteAccount_0700
        * @tc.name      : Delete account callback form
        * @tc.desc      : Delete the account name exceeds the length limit of 512 characters
        */
        it('ActsAccountDeleteAccount_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done){
            console.info("====>ActsAccountDeleteAccount_0700 start====");
            var nameLimit = '';
            for (var i = 0; i < NAMELIMIT + 1; i++) {
                nameLimit += 't';
            }
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.deleteAccount(nameLimit, (err)=>{
                console.info("====>delete Account ActsAccountDeleteAccount_0700 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountDeleteAccount_0700 end====");
                done();
            });
        });

        /*
        * @tc.number    : ActsAccountDeleteAccount_0800
        * @tc.name      : Delete account promise form
        * @tc.desc      : Delete the account name exceeds the length limit of 512 characters
        */
        it('ActsAccountDeleteAccount_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done){
            console.info("====>ActsAccountDeleteAccount_0800 start====");
            var nameLimit = '';
            for (var i = 0; i < NAMELIMIT + 1; i++) {
                nameLimit += 'n';
            }
            var appAccountManager = account.createAppAccountManager();
            console.info("====>delete Account ActsAccountDeleteAccount_0800 start====");
            try{
                await appAccountManager.deleteAccount(nameLimit);
            }
            catch(err){
                console.info("====>delete account ActsAccountDeleteAccount_0800 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountDeleteAccount_0800 end====");
                done();
            }
        })

        /*
        * @tc.number    : ActsAccountDeleteAccount_0900
        * @tc.name      : Delete account callback form
        * @tc.desc      : Delete the account name is an empty string
        */
        it('ActsAccountDeleteAccount_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done){
            console.info("====>ActsAccountDeleteAccount_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.deleteAccount("", (err)=>{
                console.info("====>delete Account ActsAccountDeleteAccount_0900 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountDeleteAccount_0900 end====");
                done();
            });
        });

        /*
        * @tc.number    : ActsAccountDeleteAccount_1000
        * @tc.name      : Delete account promise form
        * @tc.desc      : Delete the account name is an empty string
        */
        it('ActsAccountDeleteAccount_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done){
            console.info("====>ActsAccountDeleteAccount_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>delete Account ActsAccountDeleteAccount_1000 start====");
            try{
                await appAccountManager.deleteAccount("");
            }
            catch(err){
                console.info("====>delete account ActsAccountDeleteAccount_1000 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountDeleteAccount_1000 end====");
                done();
            }
        })
    })
}

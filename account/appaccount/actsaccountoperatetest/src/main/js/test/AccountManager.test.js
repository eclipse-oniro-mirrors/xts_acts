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

export default function ActsAccountManager() {
    describe('ActsAccountManager', function () {
        /*
        * @tc.number    : ActsAccountManager_0100
        * @tc.name      : createAppAccountManager
        * @tc.desc      : Create two application account module objects, one object adds an application account,
        *                 the other object deletes the application account
        */
        it('ActsAccountManager_0100', 0, async function (done) {
            console.debug("====>ActsAccountManager_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            var appAccountManagerTwo = account.createAppAccountManager();
            console.debug("====>creat finish====");
            appAccountManager.createAccount("creatappaccount_name_first", (err)=>{
                console.debug("====>add account ActsAccountManager_0100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManagerTwo.removeAccount("creatappaccount_name_first", (err)=>{
                    console.debug("====>delete Account ActsAccountManager_0100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.debug("====>ActsAccountManager_0100 end====");
                    done();
                });
            });
        });

        /*
        * @tc.number    : ActsAccountManager_0200
        * @tc.name      : createAppAccountManager
        * @tc.desc      : Create two application account module objects, one object adds application accounts and
        *                 sets additional information, and the other object can obtain additional information of
        *                 the application account
        */
        it('ActsAccountManager_0200', 0, async function (done) {
            console.debug("====>ActsAccountManager_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            var appAccountManagerTwo = account.createAppAccountManager();
            console.debug("====>creat finish====");
            appAccountManager.createAccount("creatappaccount_name_second", (err)=>{
                console.debug("====>add account ActsAccountManager_0200 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManagerTwo.setAccountExtraInfo("creatappaccount_name_second", "creatappaccount_extra", (err)=>{
                    console.debug("====>setAccountExtraInfo err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAccountExtraInfo("creatappaccount_name_second", (err, data)=>{
                        console.debug("====>getAccountExtraInfo err:" + JSON.stringify(err));
                        console.debug("====>getAccountExtraInfo data:" + JSON.stringify(data));
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("creatappaccount_extra");
                        appAccountManagerTwo.removeAccount("creatappaccount_name_second", (err)=>{
                            console.debug("====>delete Account err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountManager_0200 end====");
                            done();
                        });
                    });
                });
            });
        });
    })
}
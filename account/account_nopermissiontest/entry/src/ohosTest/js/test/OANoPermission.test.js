/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

import osAccount from '@ohos.account.osAccount'

export default function ActsOANoPermissionTest() {
    describe('ActsOANoPermissionTest', function () {

        /**
         * @tc.number  : SUB_Account_OsAccount_NoPermission_0100
         * @tc.name    : test getOsAccountCount errcode 201 callback
         * @tc.desc    : no ohos.permission.MANAGE_LOCAL_ACCOUNTS.
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_OsAccount_NoPermission_0100', 0, async (done) => {
            console.info("====>SUB_Account_OsAccount_NoPermission_0100 start====");
            let accountManager = osAccount.getAccountManager();
            try {
                accountManager.getOsAccountCount((err, count) => {
                    console.info('====>getOsAccountCount failed, error: ' + JSON.stringify(err));
                    try {
                        expect(err.code).assertEqual(201);
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    done();
                });
            } catch (err) {
                console.info('====>getOsAccountCount exception: ' + JSON.stringify(err));
                expect(err.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_OsAccount_NoPermission_0200
         * @tc.name    : test getOsAccountCount errcode 201 promise
         * @tc.desc    : no ohos.permission.MANAGE_LOCAL_ACCOUNTS.
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_OsAccount_NoPermission_0200', 0, async (done) => {
            console.info("====>SUB_Account_OsAccount_NoPermission_0200 start====");
            let accountManager = osAccount.getAccountManager();
            try {
                await accountManager.getOsAccountCount();
                expect(true).assertFalse()
                done()
            } catch (err) {
                console.info('====>getOsAccountCount err: ' + JSON.stringify(err));
                expect(err.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_OsAccount_NoPermission_0300
         * @tc.name    : test getOsAccountLocalIdForDomain errcode 201 callback
         * @tc.desc    : no ohos.permission.MANAGE_LOCAL_ACCOUNTS.
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_OsAccount_NoPermission_0300', 0, async (done) => {
            console.info("====>SUB_Account_OsAccount_NoPermission_0300 start====");
            let domainInfo = { domain: 'testDomain', accountName: 'testAccountName' };
            let accountManager = osAccount.getAccountManager();
            try {
                accountManager.getOsAccountLocalIdForDomain(domainInfo, (err, localId) => {
                    console.info('====>getOsAccountLocalIdForDomain failed, error: ' + JSON.stringify(err));
                    try {
                        expect(err.code).assertEqual(201);
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    done();
                });
            } catch (err) {
                console.info('====>getOsAccountLocalIdForDomain exception: ' + JSON.stringify(err));
                expect(err.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_OsAccount_NoPermission_0400
         * @tc.name    : test getOsAccountLocalIdForDomain errcode 201 promise
         * @tc.desc    : no ohos.permission.MANAGE_LOCAL_ACCOUNTS.
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_OsAccount_NoPermission_0400', 0, async (done) => {
            console.info("====>SUB_Account_OsAccount_NoPermission_0400 start====");
            let domainInfo = { domain: 'testDomain', accountName: 'testAccountName' };
            let accountManager = osAccount.getAccountManager();
            try {
                await accountManager.getOsAccountLocalIdForDomain(domainInfo);
                expect(true).assertFalse()
                done()
            } catch (err) {
                console.info('====>checkDataSyncEnabled err: ' + JSON.stringify(err));
                expect(err.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_OsAccount_NoPermission_0500
         * @tc.name    : test queryDistributedVirtualDeviceId errcode 201 callback
         * @tc.desc    : no ohos.permission.MANAGE_LOCAL_ACCOUNTS or ohos.permission.DISTRIBUTED_DATASYNC.
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_OsAccount_NoPermission_0500', 0, async (done) => {
            console.info("====>SUB_Account_OsAccount_NoPermission_0500 start====");
            let accountManager = osAccount.getAccountManager();
            try {
                accountManager.queryDistributedVirtualDeviceId((err, virtualID) => {
                    console.info('====>queryDistributedVirtualDeviceId err: ' + JSON.stringify(err));
                    try {
                        expect(err.code).assertEqual(201);
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    done();
                });
            } catch (err) {
                console.info('====>queryDistributedVirtualDeviceId exception: ' + JSON.stringify(err));
                expect(err.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_OsAccount_NoPermission_0600
         * @tc.name    : test queryDistributedVirtualDeviceId errcode 201 promise
         * @tc.desc    : no ohos.permission.MANAGE_LOCAL_ACCOUNTS or ohos.permission.DISTRIBUTED_DATASYNC.
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_OsAccount_NoPermission_0600', 0, async (done) => {
            console.info("====>SUB_Account_OsAccount_NoPermission_0600 start====");
            let accountManager = osAccount.getAccountManager();
            try {
                await accountManager.queryDistributedVirtualDeviceId();
                expect(true).assertFalse()
                done()
            } catch (err) {
                console.info('====>checkDataSyncEnabled err: ' + JSON.stringify(err));
                expect(err.code).assertEqual(201);
                done();
            }
        });
    });
}
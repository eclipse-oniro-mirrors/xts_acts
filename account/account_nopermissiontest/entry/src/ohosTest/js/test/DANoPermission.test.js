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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

import distributedAccount from '@ohos.account.distributedAccount'

export default function ActsDANoPermissionTest() {
    describe('ActsDANoPermissionTest', function () {

        /**
         * @tc.number  : SUB_Account_DistributedAccount_NoPermission_0100
         * @tc.name    : test getOsAccountDistributedInfo errcode 201 callback
         * @tc.desc    : no ohos.permission.MANAGE_DISTRIBUTED_ACCOUNTS.
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_DistributedAccount_NoPermission_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
            console.info("====>SUB_Account_DistributedAccount_NoPermission_0100 start====");
            let accountAbility = distributedAccount.getDistributedAccountAbility();
            try {
                accountAbility.getOsAccountDistributedInfo((err, data) => {
                    console.info('====>getOsAccountDistributedInfo exception: ' + JSON.stringify(err));
                    try {
                        expect(err.code).assertEqual(201);
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    done();
                });
            } catch (err) {
                console.info('====>getOsAccountDistributedInfo exception: ' + JSON.stringify(err));
                expect(err.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_DistributedAccount_NoPermission_0200
         * @tc.name    : test getOsAccountDistributedInfo errcode 201 promise
         * @tc.desc    : no ohos.permission.MANAGE_DISTRIBUTED_ACCOUNTS.
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_DistributedAccount_NoPermission_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
            console.info("====>SUB_Account_DistributedAccount_NoPermission_0200 start====");
            const accountAbility = distributedAccount.getDistributedAccountAbility();
            try {
                await accountAbility.getOsAccountDistributedInfo();
                expect(true).assertFalse()
                done()
            } catch (err) {
                console.info('====>checkDataSyncEnabled err: ' + JSON.stringify(err));
                expect(err.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_DistributedAccount_NoPermission_0300
         * @tc.name    : test setOsAccountDistributedInfo errcode 201 callback
         * @tc.desc    : no ohos.permission.MANAGE_DISTRIBUTED_ACCOUNTS.
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_DistributedAccount_NoPermission_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
            console.info("====>SUB_Account_DistributedAccount_NoPermission_0300 start====");
            const accountAbility = distributedAccount.getDistributedAccountAbility();
            let accountInfo = { id: '12345', name: 'ZhangSan', event: 'Ohos.account.event.LOGIN' };
            try {
                accountAbility.setOsAccountDistributedInfo(accountInfo, (err) => {
                    console.info('====>setOsAccountDistributedInfo exception: ' + JSON.stringify(err));
                    try {
                        expect(err.code).assertEqual(201);
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    done();
                });
            } catch (err) {
                console.info('====>setOsAccountDistributedInfo exception: ' + JSON.stringify(err));
                expect(err.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_DistributedAccount_NoPermission_0400
         * @tc.name    : test setOsAccountDistributedInfo errcode 201 promise
         * @tc.desc    : no ohos.permission.MANAGE_DISTRIBUTED_ACCOUNTS.
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_DistributedAccount_NoPermission_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
            console.info("====>SUB_Account_DistributedAccount_NoPermission_0400 start====");
            let accountAbility = distributedAccount.getDistributedAccountAbility();
            let accountInfo = { id: '12345', name: 'ZhangSan', event: 'Ohos.account.event.LOGIN' };
            try {
                await accountAbility.setOsAccountDistributedInfo(accountInfo);
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
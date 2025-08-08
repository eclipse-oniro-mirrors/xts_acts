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

import account from '@ohos.account.appAccount'

export default function ActsAANoPermissionTest() {
    describe('ActsAANoPermissionTest', function () {

        /**
         * @tc.number  : SUB_Account_AppAccount_NoPermission_0100
         * @tc.name    : test checkDataSyncEnabled errcode 201 callback
         * @tc.desc    : no ohos.permission.DISTRIBUTED_DATASYNC.
         * @tc.level   : Level0
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_AppAccount_NoPermission_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            console.info("====>SUB_Account_AppAccount_NoPermission_0100 start====");
            let appAccountManager = account.createAppAccountManager();
            try {
                appAccountManager.checkDataSyncEnabled('ZhangSan', (err, isEnabled) => {
                    console.info('====>checkDataSyncEnabled failed, err: ' + JSON.stringify(err));
                    try {
                        expect(err.code).assertEqual(201);
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    done();
                });
            } catch (err) {
                console.info('====>checkDataSyncEnabled err: ' + JSON.stringify(err));
                expect(err.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_AppAccount_NoPermission_0200
         * @tc.name    : test checkDataSyncEnabled errcode 201 promise
         * @tc.desc    : no ohos.permission.DISTRIBUTED_DATASYNC.
         * @tc.level   : Level0
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_AppAccount_NoPermission_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            console.info("====>SUB_Account_AppAccount_NoPermission_0200 start====");
            let appAccountManager = account.createAppAccountManager();
            try {
                await appAccountManager.checkDataSyncEnabled('ZhangSan');
                expect(true).assertFalse()
                done()
            } catch (err) {
                console.info('====>checkDataSyncEnabled err: ' + JSON.stringify(err));
                expect(err.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_AppAccount_NoPermission_0300
         * @tc.name    : test setDataSyncEnabled errcode 201 callabck
         * @tc.desc    : no ohos.permission.DISTRIBUTED_DATASYNC.
         * @tc.level   : Level0
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_AppAccount_NoPermission_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            console.info("====>SUB_Account_AppAccount_NoPermission_0300 start====");
            let appAccountManager = account.createAppAccountManager();
            try {
                appAccountManager.setDataSyncEnabled('ZhangSan', true, (err) => {
                    console.info('====>setDataSyncEnabled err: ' + JSON.stringify(err));
                    try {
                        expect(err.code).assertEqual(201);
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    done();
                });
            } catch (err) {
                console.info('====>setDataSyncEnabled err: ' + JSON.stringify(err));
                expect(err.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_AppAccount_NoPermission_0400
         * @tc.name    : test setDataSyncEnabled errcode 201 promise
         * @tc.desc    : no ohos.permission.DISTRIBUTED_DATASYNC.
         * @tc.level   : Level0
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_AppAccount_NoPermission_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
            console.info("====>SUB_Account_AppAccount_NoPermission_0400 start====");
            let appAccountManager = account.createAppAccountManager();
            try {
                await appAccountManager.setDataSyncEnabled('ZhangSan', true);
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
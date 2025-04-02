/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import osAccount from '@ohos.account.osAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsOsAccountTest() {
    describe('ActsOsAccountTest', function () {
        afterEach(async function (done) {
            console.info("====>afterEach start====");
            let osAccountManager = osAccount.getAccountManager();
            let accounts = await osAccountManager.queryAllCreatedOsAccounts();
            for (let i = 0; i < accounts.length; i++) {
                let localId = accounts[i].localId
                if (localId != 100) {
                    await osAccountManager.removeOsAccount(localId);
                }
            }
            done();
        });

        /*
        * @tc.number  : ActsOsAccountCheckMultiOsAccountEnabled_0100
        * @tc.name    : test checkMultiOsAccountEnabled callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountCheckMultiOsAccountEnabled_0100', 0, async function (done) {
            console.info("====>ActsOsAccountCheckMultiOsAccountEnabled_0100 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.checkMultiOsAccountEnabled(-1);
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountCheckMultiOsAccountEnabled_0100 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountIsOsAccountConstraintEnabled_0100
        * @tc.name    : test isOsAccountConstraintEnabled
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountIsOsAccountConstraintEnabled_0100', 0, async function (done) {
            console.info("====>ActsOsAccountIsOsAccountConstraintEnabled_0100 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            let constraint = 0;
            try {
                await accountManager.isOsAccountConstraintEnabled(constraint);
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountIsOsAccountConstraintEnabled_0100 exception: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountIsOsAccountConstraintEnabled_0200
        * @tc.name    : test isOsAccountConstraintEnabled
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountIsOsAccountConstraintEnabled_0200', 0, async function (done) {
            console.info("====>ActsOsAccountIsOsAccountConstraintEnabled_0200 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            let constraint = true;
            try {
                await accountManager.isOsAccountConstraintEnabled(constraint);
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountIsOsAccountConstraintEnabled_0200 exception: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountCheckOsAccountTestable_0100
        * @tc.name    : test isOsAccountConstraintEnabled callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountCheckOsAccountTestable_0100', 0, async function (done) {
            console.info("====>ActsOsAccountCheckOsAccountTestable_0100 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.checkOsAccountTestable(0);
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountCheckOsAccountTestable_0100 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetOsAccountLocalId_0100
        * @tc.name    : test getOsAccountLocalId callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetOsAccountLocalId_0100', 0, async function (done) {
            console.info("====>ActsOsAccountGetOsAccountLocalId_0100 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.getOsAccountLocalId(0);
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetOsAccountLocalId_0100 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetOsAccountLocalIdForUid_0100
        * @tc.name    : test getOsAccountLocalIdForUid callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetOsAccountLocalIdForUid_0100', 0, async function (done) {
            console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0100 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.getOsAccountLocalIdForUid(100, -1);
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0100 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetOsAccountLocalIdForUid_0200
        * @tc.name    : test getOsAccountLocalIdForUid callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetOsAccountLocalIdForUid_0200', 0, async function (done) {
            console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0200 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.getOsAccountLocalIdForUid("0", (err, isTestable) => {
                    console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0200 failed, error: " +
                    JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (err) {
                console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0200 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetOsAccountLocalIdForUid_0300
        * @tc.name    : test getOsAccountLocalIdForUid callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetOsAccountLocalIdForUid_0300', 0, async function (done) {
            console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0300 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.getOsAccountLocalIdForUid(false, (err, isTestable) => {
                    console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0300 failed, error: " +
                    JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (err) {
                console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0300 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetOsAccountLocalIdForUid_0400
        * @tc.name    : test getOsAccountLocalIdForUid
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetOsAccountLocalIdForUid_0400', 0, async function (done) {
            console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0400 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                await accountManager.getOsAccountLocalIdForUid("100");
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0400 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetOsAccountLocalIdForUid_0500
        * @tc.name    : test getOsAccountLocalIdForUid
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetOsAccountLocalIdForUid_0500', 0, async function (done) {
            console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0500 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                await accountManager.getOsAccountLocalIdForUid(true);
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0500 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetOsAccountLocalIdForUid_0600
        * @tc.name    : test getOsAccountLocalIdForUid
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetOsAccountLocalIdForUid_0600', 0, async function (done) {
            console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0600 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                await accountManager.getOsAccountLocalIdForUid();
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetOsAccountLocalIdForUid_0600 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetActivatedOsAccountLocalIds_0100
        * @tc.name    : test getActivatedOsAccountLocalIds callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetActivatedOsAccountLocalIds_0100', 0, async function (done) {
            console.info("====>ActsOsAccountGetActivatedOsAccountLocalIds_0100 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.getActivatedOsAccountLocalIds("");
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetActivatedOsAccountLocalIds_0100 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetOsAccountLocalIdForSerialNumber_0100
        * @tc.name    : test getOsAccountLocalIdForSerialNumber callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetOsAccountLocalIdForSerialNumber_0100', 0, async function (done) {
            console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0100 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.getOsAccountLocalIdForSerialNumber(100, "");
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0100 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetOsAccountLocalIdForSerialNumber_0200
        * @tc.name    : test getOsAccountLocalIdForSerialNumber callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetOsAccountLocalIdForSerialNumber_0200', 0, async function (done) {
            console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0200 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.getOsAccountLocalIdForSerialNumber(false, (err, data) => {
                    console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0200 err: " +
                    JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (err) {
                console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0200 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetOsAccountLocalIdForSerialNumber_0300
        * @tc.name    : test getOsAccountLocalIdForSerialNumber callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetOsAccountLocalIdForSerialNumber_0300', 0, async function (done) {
            console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0200 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.getOsAccountLocalIdForSerialNumber("", (err, data) => {
                    console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0300 err: " +
                    JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (err) {
                console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0300 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetOsAccountLocalIdForSerialNumber_0400
        * @tc.name    : test getOsAccountLocalIdForSerialNumber
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetOsAccountLocalIdForSerialNumber_0400', 0, async function (done) {
            console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0400 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                await accountManager.getOsAccountLocalIdForSerialNumber("");
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0400 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetOsAccountLocalIdForSerialNumber_0500
        * @tc.name    : test getOsAccountLocalIdForSerialNumber
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetOsAccountLocalIdForSerialNumber_0500', 0, async function (done) {
            console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0500 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                await accountManager.getOsAccountLocalIdForSerialNumber(true);
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0500 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetOsAccountLocalIdForSerialNumber_0600
        * @tc.name    : test getOsAccountLocalIdForSerialNumber
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetOsAccountLocalIdForSerialNumber_0600', 0, async function (done) {
            console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0600 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                await accountManager.getOsAccountLocalIdForSerialNumber();
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetOsAccountLocalIdForSerialNumber_0600 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetSerialNumberForOsAccountLocalId_0100
        * @tc.name    : test getSerialNumberForOsAccountLocalId callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetSerialNumberForOsAccountLocalId_0100', 0, async function (done) {
            console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0100 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.getSerialNumberForOsAccountLocalId(100, "");
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0100 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetSerialNumberForOsAccountLocalId_0200
        * @tc.name    : test getSerialNumberForOsAccountLocalId callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetSerialNumberForOsAccountLocalId_0200', 0, async function (done) {
            console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0200 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.getSerialNumberForOsAccountLocalId(false, (err, data) => {
                    console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0200 err: " +
                    JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (err) {
                console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0200 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetSerialNumberForOsAccountLocalId_0300
        * @tc.name    : test getSerialNumberForOsAccountLocalId callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetSerialNumberForOsAccountLocalId_0300', 0, async function (done) {
            console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0300 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.getSerialNumberForOsAccountLocalId(-1, (err, data) => {
                    console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0300 err: " +
                    JSON.stringify(err));
                    console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0300 data: " +
                    JSON.stringify(data));
                    expect(err.code).assertEqual(12300003);
                    done();
                });
            } catch (err) {
                console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0300 error: " + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetSerialNumberForOsAccountLocalId_0400
        * @tc.name    : test getSerialNumberForOsAccountLocalId callbcak
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetSerialNumberForOsAccountLocalId_0400', 0, async function (done) {
            console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0400 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                accountManager.getSerialNumberForOsAccountLocalId(999, (err, data) => {
                    console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0400 err: " +
                    JSON.stringify(err));
                    console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0400 data: " +
                    JSON.stringify(data));
                    expect(err.code).assertEqual(12300003);
                    done();
                });
            } catch (err) {
                console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0400 error: " + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetSerialNumberForOsAccountLocalId_0500
        * @tc.name    : test getSerialNumberForOsAccountLocalId
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetSerialNumberForOsAccountLocalId_0500', 0, async function (done) {
            console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0500 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                await accountManager.getSerialNumberForOsAccountLocalId("");
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0500 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetSerialNumberForOsAccountLocalId_0600
        * @tc.name    : test getSerialNumberForOsAccountLocalId
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetSerialNumberForOsAccountLocalId_0600', 0, async function (done) {
            console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0600 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                await accountManager.getSerialNumberForOsAccountLocalId();
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0600 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetSerialNumberForOsAccountLocalId_0700
        * @tc.name    : test getSerialNumberForOsAccountLocalId
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetSerialNumberForOsAccountLocalId_0700', 0, async function (done) {
            console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0700 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                await accountManager.getSerialNumberForOsAccountLocalId(-1);
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0700 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountGetSerialNumberForOsAccountLocalId_0800
        * @tc.name    : test getSerialNumberForOsAccountLocalId
        * @tc.desc    : Verify Parameter error code
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('ActsOsAccountGetSerialNumberForOsAccountLocalId_0800', 0, async function (done) {
            console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0800 start====");
            let accountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                await accountManager.getSerialNumberForOsAccountLocalId(999);
                expect().assertFail();
                done();
            } catch (err) {
                console.info("====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0800 error: " + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                done();
            }
        });
    });
}
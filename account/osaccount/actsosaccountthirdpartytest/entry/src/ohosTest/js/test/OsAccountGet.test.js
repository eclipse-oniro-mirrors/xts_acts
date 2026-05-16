/*
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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
import osaccount from '@ohos.account.osAccount'
import bundle from '@ohos.bundle'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function ActsOsAccountThirdPartyTest_third_2() {
    describe('ActsOsAccountThirdPartyTest_third_2', function () {
        afterEach(async function (done) {
            console.info("====>afterEach start====");
            var osAccountManager = osaccount.getAccountManager();
            var accounts = await osAccountManager.queryAllCreatedOsAccounts()
            for (let i = 0; i < accounts.length; i++) {
                var localId = accounts[i].localId
                if (localId != 100) {
                    await osAccountManager.removeOsAccount(localId)
                }
            }
            done();
        })
        /**
         * @tc.name   ActsOsAccountGetIdFormUid_0100
         * @tc.number ActsOsAccountGetIdFormUid_0100
         * @tc.desc   Verify that the user localId is obtained by uid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsOsAccountGetIdFormUid_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsOsAccountGetIdFormUid_0100 start====");
            var osAccountManager = osaccount.getAccountManager();
            var testLocalId = await osAccountManager.getOsAccountLocalIdFromProcess();
            console.info("====>testLocalId:" + testLocalId)
            console.info("====>get AccountManager finish====");
            var bundleName = "com.example.actsosaccountthirdpartytest";
            var bundleInfo = await bundle.getBundleInfo(bundleName, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
            var uid = bundleInfo.uid;
            console.info("====>obtained uid:" + uid);
            osAccountManager.getOsAccountLocalIdFromUid(uid, (err, localId) => {
                console.info("====>get localId err: " + JSON.stringify(err));
                console.info("====>localId obtained by uid:" + localId);
                expect(err).assertEqual(null);
                expect(localId).assertEqual(testLocalId);
                console.info("====>ActsOsAccountGetIdFormUid_0100 end====");
                done();
            });
        });

        /**
         * @tc.name   ActsOsAccountGetIdFormUid_0200
         * @tc.number ActsOsAccountGetIdFormUid_0200
         * @tc.desc   Verify that the user localId is obtained by uid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsOsAccountGetIdFormUid_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsOsAccountGetIdFormUid_0200 start====");
            var osAccountManager = osaccount.getAccountManager();
            var testLocalId = await osAccountManager.getOsAccountLocalIdFromProcess();
            console.info("====>get AccountManager finish====");
            var bundleName = "com.example.actsosaccountthirdpartytest";
            var bundleInfo = await bundle.getBundleInfo(bundleName, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
            var uid = bundleInfo.uid;
            console.info("====>obtained uid:" + uid);
            var localId = await osAccountManager.getOsAccountLocalIdFromUid(uid);
            console.info("====>localId obtained by uid:" + localId);
            expect(localId).assertEqual(testLocalId);
            console.info("====>ActsOsAccountGetIdFormUid_0200 end====");
            done();
        });

        /**
         * @tc.name   ActsOsAccountGetIdFormUid_0300
         * @tc.number ActsOsAccountGetIdFormUid_0300
         * @tc.desc   Authentication failed to query user by uid -1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsOsAccountGetIdFormUid_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsOsAccountGetIdFormUid_0300 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            var incorrectUid = -1;
            osAccountManager.getOsAccountLocalIdFromUid(incorrectUid, (err, localId) => {
                console.info("====>get localId err: " + JSON.stringify(err));
                console.info("====>localId obtained by uid:" + localId);
                expect(err.code != 0).assertEqual(true);
                expect(localId).assertEqual(null);
                console.info("====>ActsOsAccountGetIdFormUid_0300 end====");
                done();
            });
        });

        /**
         * @tc.name   ActsOsAccountGetIdFormUid_0400
         * @tc.number ActsOsAccountGetIdFormUid_0400
         * @tc.desc   Authentication failed to query user by uid -1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsOsAccountGetIdFormUid_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsOsAccountGetIdFormUid_0400 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            var incorrectUid = -1;
            try {
                await osAccountManager.getOsAccountLocalIdFromUid(incorrectUid);
            } catch (err) {
                console.info("====>get localId by uid err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsOsAccountGetIdFormUid_0400 end====");
                done();
            }
        });

        /**
         * @tc.name   ActsOsAccountGetIdFormUid_0500
         * @tc.number ActsOsAccountGetIdFormUid_0500
         * @tc.desc   Authentication failed to query user by uid 2147483648
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountGetIdFormUid_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountGetIdFormUid_0500 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            var incorrectUid = 2147483648;
            osAccountManager.getOsAccountLocalIdFromUid(incorrectUid, (err, localId) => {
                console.info("====>get localId err: " + JSON.stringify(err));
                console.info("====>localId obtained by uid:" + localId);
                expect(err.code != 0).assertEqual(true);
                expect(localId).assertEqual(null);
                console.info("====>ActsOsAccountGetIdFormUid_0500 end====");
                done();
            });
        });

        /**
         * @tc.name   ActsOsAccountGetIdFormUid_0600
         * @tc.number ActsOsAccountGetIdFormUid_0600
         * @tc.desc   Authentication failed to query user by uid 2147483648
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountGetIdFormUid_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountGetIdFormUid_0600 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            var incorrectUid = 2147483648;
            try {
                await osAccountManager.getOsAccountLocalIdFromUid(incorrectUid);
            } catch (err) {
                console.info("====>get localId by uid err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsOsAccountGetIdFormUid_0600 end====");
                done();
            }
        });

        /**
         * @tc.name   ActsOsAccountGetIdFormProcess_0100
         * @tc.number ActsOsAccountGetIdFormProcess_0100
         * @tc.desc   Verify that the user localId obtained from the current process uid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountGetIdFormProcess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountGetIdFormProcess_0100 start====");
            var osAccountManager = osaccount.getAccountManager();
            var bundleName = "com.example.actsosaccountthirdpartytest";
            var bundleInfo = await bundle.getBundleInfo(bundleName, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
            var uid = bundleInfo.uid;
            var testLocalId = await osAccountManager.getOsAccountLocalIdFromUid(uid)
            console.info("====>get AccountManager finish====");
            osAccountManager.getOsAccountLocalIdFromProcess((err, localId) => {
                console.info("====>get localId err: " + JSON.stringify(err));
                console.info("====>localId obtained by process:" + localId);
                expect(err).assertEqual(null);
                expect(localId).assertEqual(testLocalId);
                console.info("====>ActsOsAccountGetIdFormProcess_0100 end====");
                done();
            });
        });

        /**
         * @tc.name   ActsOsAccountGetIdFormProcess_0200
         * @tc.number ActsOsAccountGetIdFormProcess_0200
         * @tc.desc   Verify that the user localId obtained from the current process uid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountGetIdFormProcess_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountGetIdFormProcess_0200 start====");
            var osAccountManager = osaccount.getAccountManager();
            var bundleName = "com.example.actsosaccountthirdpartytest";
            var bundleInfo = await bundle.getBundleInfo(bundleName, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
            var uid = bundleInfo.uid;
            var testLocalId = await osAccountManager.getOsAccountLocalIdFromUid(uid)
            console.info("====>testLocalId obtained by process:" + testLocalId)
            console.info("====>get AccountManager finish====");
            var localId = await osAccountManager.getOsAccountLocalIdFromProcess();
            console.info("====>localId obtained by process:" + localId);
            expect(localId).assertEqual(testLocalId);
            console.info("====>ActsOsAccountGetIdFormProcess_0200 end====");
            done();
        });

        /**
         * @tc.name   ActsOsAccountGetTypeFormProcess_0100
         * @tc.number ActsOsAccountGetTypeFormProcess_0100
         * @tc.desc   Verify that the user type obtained from the current process uid, getOsAccountTypeFromProcess callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountGetTypeFormProcess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountGetTypeFormProcess_0100 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            osAccountManager.getOsAccountTypeFromProcess((err, accountType) => {
                console.info("====>get type err: " + JSON.stringify(err));
                console.info("====>type obtained by process:" + JSON.stringify(accountType));
                expect(err).assertEqual(null);
                expect(accountType).assertEqual(osaccount.OsAccountType.ADMIN);
                console.info("====>ActsOsAccountGetTypeFormProcess_0100 end====");
                done();
            });
        });

        /**
         * @tc.name   ActsOsAccountGetTypeFormProcess_0200
         * @tc.number ActsOsAccountGetTypeFormProcess_0200
         * @tc.desc   Verify that the user type obtained from the current process uid, getOsAccountTypeFromProcess promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountGetTypeFormProcess_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountGetTypeFormProcess_0200 start====");
            let osAccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            try {
                let accountType = await osAccountManager.getOsAccountTypeFromProcess();
                console.info("====>type obtained by process:" + JSON.stringify(accountType));
                expect(accountType).assertEqual(osaccount.OsAccountType.ADMIN);
                console.info("====>ActsOsAccountGetTypeFormProcess_0200 end====");
                done();
            } catch (err) {
                console.info("====>get type err: " + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   ActsOsAccountLocalIdSerial_0100
         * @tc.number ActsOsAccountLocalIdSerial_0100
         * @tc.desc   Verify query serialNumber by 100 user and query 100 user by serialNumber
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountLocalIdSerial_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountLocalIdSerial_0100 start====");
            var osAccountManager = osaccount.getAccountManager();
            var testLocalId = await osAccountManager.getOsAccountLocalIdFromProcess();
            console.info("====>get AccountManager finish====");
            osAccountManager.getSerialNumberByOsAccountLocalId(testLocalId, (err, serialNumber) => {
                console.info("====>ger serialNumber err:" + JSON.stringify(err));
                console.info("====>get serialNumber:" + serialNumber + " by localId: 100");
                expect(err).assertEqual(null);
                var serialNumberStr = serialNumber.toString();
                var serialIntercept = serialNumberStr.substring(8);
                console.info("====>truncate the last eight characters: " + serialIntercept);
                osAccountManager.getOsAccountLocalIdBySerialNumber(serialNumber, (err, localId) => {
                    console.info("====>ger localId err:" + JSON.stringify(err));
                    console.info("====>get localId:" + localId + " by serialNumber: " + serialNumber);
                    expect(err).assertEqual(null);
                    expect(localId).assertEqual(testLocalId);
                    console.info("====>ActsOsAccountLocalIdSerial_0100 end====");
                    done();
                })
            })
        });

        /**
         * @tc.name   ActsOsAccountLocalIdSerial_0200
         * @tc.number ActsOsAccountLocalIdSerial_0200
         * @tc.desc   Verify query serialNumber by 100 user and query 100 user by serialNumber
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountLocalIdSerial_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountLocalIdSerial_0200 start====");
            var osAccountManager = osaccount.getAccountManager();
            var testLocalId = await osAccountManager.getOsAccountLocalIdFromProcess();
            console.info("====>get AccountManager finish====");
            var serialNumber = await osAccountManager.getSerialNumberByOsAccountLocalId(testLocalId);
            console.info("====>get serialNumber:" + serialNumber + " by localId: 100");
            var serialNumberStr = serialNumber.toString();
            var serialIntercept = serialNumberStr.substring(8);
            console.info("====>truncate the last eight characters: " + serialIntercept);
            var localId = await osAccountManager.getOsAccountLocalIdBySerialNumber(serialNumber);
            console.info("====>get localId:" + localId + " by serialNumber: " + serialNumber);
            expect(localId).assertEqual(testLocalId);
            console.info("====>ActsOsAccountLocalIdSerial_0200 end====");
            done();
        });

        /**
         * @tc.name   ActsOsAccountLocalIdSerial_0300
         * @tc.number ActsOsAccountLocalIdSerial_0300
         * @tc.desc   Verify query serialNumber by 0 user and query 0 user by serialNumber
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountLocalIdSerial_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountLocalIdSerial_0300 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            osAccountManager.getSerialNumberByOsAccountLocalId(0, (err, serialNumber) => {
                console.info("====>ger serialNumber err:" + JSON.stringify(err));
                console.info("====>get serialNumber:" + serialNumber + " by localId: 0");
                expect(err).assertEqual(null);
                var serialNumberStr = serialNumber.toString();
                var serialIntercept = serialNumberStr.substring(8);
                console.info("====>truncate the last eight characters: " + serialIntercept);
                expect(serialIntercept).assertEqual("00000000");
                osAccountManager.getOsAccountLocalIdBySerialNumber(serialNumber, (err, localId) => {
                    console.info("====>ger localId err:" + JSON.stringify(err));
                    console.info("====>get localId:" + localId + " by serialNumber: " + serialNumber);
                    expect(err).assertEqual(null);
                    expect(localId).assertEqual(0);
                    console.info("====>ActsOsAccountLocalIdSerial_0300 end====");
                    done();
                })
            })
        });

        /**
         * @tc.name   ActsOsAccountLocalIdSerial_0400
         * @tc.number ActsOsAccountLocalIdSerial_0400
         * @tc.desc   Verify query serialNumber by 0 user and query 0 user by serialNumber
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountLocalIdSerial_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountLocalIdSerial_0400 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            var serialNumber = await osAccountManager.getSerialNumberByOsAccountLocalId(0);
            console.info("====>get serialNumber:" + serialNumber + " by localId: 0");
            var serialNumberStr = serialNumber.toString();
            var serialIntercept = serialNumberStr.substring(8);
            console.info("====>truncate the last eight characters: " + serialIntercept);
            expect(serialIntercept).assertEqual("00000000");
            var localId = await osAccountManager.getOsAccountLocalIdBySerialNumber(serialNumber);
            console.info("====>get localId:" + localId + " by serialNumber: " + serialNumber);
            expect(localId).assertEqual(0);
            console.info("====>ActsOsAccountLocalIdSerial_0400 end====");
            done();
        });

        /**
         * @tc.name   ActsOsAccountLocalIdSerial_0500
         * @tc.number ActsOsAccountLocalIdSerial_0500
         * @tc.desc   Verify the query for the newly created user serialNumber and query the owning user through the
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsOsAccountLocalIdSerial_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsOsAccountLocalIdSerial_0500 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            var localId = 100;
            let isEnable = await osAccountManager.checkMultiOsAccountEnabled();
            if (isEnable != true) {
                console.info("====>ActsOsAccountLocalIdSerial_0500 not support multiple osaccouts====");
                osAccountManager.getSerialNumberByOsAccountLocalId(localId, (err, serialNumber) => {
                    console.info("====>queryOsAccountById err:" + JSON.stringify(err));
                    console.info("====>get serialNumber:" + serialNumber + " by localId: " + localId);
                    expect(err).assertEqual(null);
                    osAccountManager.getOsAccountLocalIdBySerialNumber(serialNumber, (err, getlocalId) => {
                        console.info("====>ger localId err:" + JSON.stringify(err));
                        console.info("====>get localId:" + getlocalId + " by serialNumber: " + serialNumber);
                        expect(err).assertEqual(null);
                        expect(getlocalId).assertEqual(localId);
                        console.info("====>ActsOsAccountLocalIdSerial_0500 end====");
                        done();
                    })
                })
                return;
            }
            osAccountManager.createOsAccount("osAccountNameIdSerialA", osaccount.OsAccountType.NORMAL, (err, data) => {
                console.info("====>create os account err: " + JSON.stringify(err));
                console.info("====>create os account OsAccountInfo: " + JSON.stringify(data));
                expect(err).assertEqual(null);
                expect(data.localName).assertEqual("osAccountNameIdSerialA");
                expect(data.domainInfo.accountName == "").assertEqual(true)
                expect(data.type).assertEqual(1);
                expect(data.constraints.length > 0).assertEqual(true);
                expect(data.isVerified).assertEqual(false);
                expect(data.isUnlocked).assertEqual(false);
                expect(data.distributedInfo.name != null).assertEqual(true);
                expect(data.domainInfo.domain == "").assertEqual(true);
                expect(data.photo == "").assertEqual(true);
                expect(data.createTime != "").assertEqual(true);
                expect(data.lastLoginTime >= 0).assertEqual(true);
                expect(data.serialNumber.toString().length == 16).assertEqual(true);
                expect(data.isActived).assertEqual(false);
                expect(data.isActivated).assertEqual(false);
                expect(data.isCreateCompleted).assertEqual(true)
                localId = data.localId;
                osAccountManager.isOsAccountActived(localId, (err, isActived) => {
                    console.info("====>isOsAccountActived err:" + JSON.stringify(err));
                    console.info("====>isOsAccountActived isActived:" + isActived);
                    expect(err).assertEqual(null);
                    expect(isActived).assertEqual(false);
                    osAccountManager.getSerialNumberByOsAccountLocalId(localId, (err, serialNumber) => {
                        console.info("====>queryOsAccountById err:" + JSON.stringify(err));
                        console.info("====>get serialNumber:" + serialNumber + " by localId: " + localId);
                        expect(err).assertEqual(null);
                        osAccountManager.getOsAccountLocalIdBySerialNumber(serialNumber, (err, getlocalId) => {
                            console.info("====>ger localId err:" + JSON.stringify(err));
                            console.info("====>get localId:" + getlocalId + " by serialNumber: " + serialNumber);
                            expect(err).assertEqual(null);
                            expect(getlocalId).assertEqual(localId);
                            osAccountManager.removeOsAccount(localId, (err) => {
                                console.info("====>remove localId: " + localId + " err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsOsAccountLocalIdSerial_0500 end====");
                                done();
                            })
                        })
                    })
                })
            })
        });

        /**
         * @tc.name   ActsOsAccountLocalIdSerial_0600
         * @tc.number ActsOsAccountLocalIdSerial_0600
         * @tc.desc   Verify the query for the newly created user serialNumber and query the owning user through the
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsOsAccountLocalIdSerial_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsOsAccountLocalIdSerial_0600 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            var localId = 100;
            let isEnable = await osAccountManager.checkMultiOsAccountEnabled();
            if (isEnable != true) {
                console.info("====>ActsOsAccountLocalIdSerial_0600 not support multiple osaccouts====");
                var serialNumber = await osAccountManager.getSerialNumberByOsAccountLocalId(localId);
                console.info("====>get serialNumber:" + serialNumber + " by localId: " + localId);
                var getlocalId = await osAccountManager.getOsAccountLocalIdBySerialNumber(serialNumber);
                console.info("====>get localId:" + getlocalId + " by serialNumber: " + serialNumber);
                expect(getlocalId).assertEqual(localId);
                console.info("====>ActsOsAccountLocalIdSerial_0600 end====");
                done();
                return;
            }
            var OsAccountInfo = await osAccountManager.createOsAccount("accountIdSerialB", osaccount.OsAccountType.GUEST);
            console.info("====>create os account OsAccountInfo: " + JSON.stringify(OsAccountInfo));
            expect(OsAccountInfo.localName).assertEqual("accountIdSerialB");
            localId = OsAccountInfo.localId;
            var isActived = await osAccountManager.isOsAccountActived(localId);
            console.info("====>isOsAccountActived:" + isActived);
            expect(isActived).assertEqual(false);
            var serialNumber = await osAccountManager.getSerialNumberByOsAccountLocalId(localId);
            console.info("====>get serialNumber:" + serialNumber + " by localId: " + localId);
            var getlocalId = await osAccountManager.getOsAccountLocalIdBySerialNumber(serialNumber);
            console.info("====>get localId:" + getlocalId + " by serialNumber: " + serialNumber);
            expect(getlocalId).assertEqual(localId);
            await osAccountManager.removeOsAccount(localId);
            console.info("====>ActsOsAccountLocalIdSerial_0600 end====");
            done();
        });

        /**
         * @tc.name   ActsOsAccountGetCount_0100
         * @tc.number ActsOsAccountGetCount_0100
         * @tc.desc   Verify to obtain the number os all os accounts created
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsOsAccountGetCount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsOsAccountGetCount_0100 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            var obtainCount = 0;
            var localIdFir;
            let isEnable = await osAccountManager.checkMultiOsAccountEnabled();
            if (isEnable != true) {
                console.info("====>ActsOsAccountGetCount_0100 not support multiple osaccouts====");
                osAccountManager.getCreatedOsAccountsCount((err, data) => {
                    console.info("====>obtains the number of all os accounts created err:" + JSON.stringify(err));
                    console.info("====>obtains the number of all os accounts created data:" + data);
                    expect(err).assertEqual(null);
                    expect(data).assertEqual(1);
                    console.info("====>ActsOsAccountGetCount_0100 end====");
                    done();
                })
                return;
            }
            osAccountManager.getCreatedOsAccountsCount((err, data) => {
                console.info("====>obtains the number of all os accounts created err:" + JSON.stringify(err));
                console.info("====>obtains the number of all os accounts created data:" + data);
                expect(err).assertEqual(null);
                obtainCount = data;
                osAccountManager.createOsAccount("osAccountNameIdSerialE", osaccount.OsAccountType.NORMAL, (err, data) => {
                    console.info("====>create first os account err: " + JSON.stringify(err));
                    console.info("====>create first os account OsAccountInfo: " + JSON.stringify(data));
                    localIdFir = data.localId;
                    expect(err).assertEqual(null);
                    expect(data.localName).assertEqual("osAccountNameIdSerialE");
                    osAccountManager.getCreatedOsAccountsCount((err, count) => {
                        console.info("====>obtains the number of all os accounts created err:" + JSON.stringify(err));
                        console.info("====>obtains the number of all os accounts created count:" + count);
                        expect(err).assertEqual(null);
                        count = count - 1;
                        expect(count).assertEqual(obtainCount);
                        osAccountManager.removeOsAccount(localIdFir, (err) => {
                            console.info("====>remove localId: " + localIdFir + " err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            osAccountManager.getCreatedOsAccountsCount((err, data) => {
                                console.info("====>obtains the number accounts created err:" + JSON.stringify(err));
                                console.info("====>obtains the number accounts created data:" + data);
                                expect(err).assertEqual(null);
                                expect(data).assertEqual(obtainCount);
                                console.info("====>ActsOsAccountGetCount_0100 end====");
                                done();
                            })
                        })
                    })
                })
            })
        })

        /**
         * @tc.name   ActsOsAccountGetCount_0200
         * @tc.number ActsOsAccountGetCount_0200
         * @tc.desc   Verify to obtain the number os all os accounts created
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsOsAccountGetCount_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsOsAccountGetCount_0200 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            let isEnable = await osAccountManager.checkMultiOsAccountEnabled();
            if (isEnable != true) {
                console.info("====>ActsOsAccountGetCount_0200 not support multiple osaccouts====");
                var obtainCount = await osAccountManager.getCreatedOsAccountsCount();
                console.info("====>obtains the number of all os accounts created:" + obtainCount);
                expect(obtainCount).assertEqual(1);
                console.info("====>ActsOsAccountGetCount_0200 end====");
                done();
                return;
            }
            var obtainCount = await osAccountManager.getCreatedOsAccountsCount();
            console.info("====>obtains the number of all os accounts created:" + obtainCount);
            var osAccountFir = await osAccountManager.createOsAccount("osAccountIdSerialG", osaccount.OsAccountType.NORMAL);
            console.info("====>create first os account OsAccountInfo: " + JSON.stringify(osAccountFir));
            var localIdFir = osAccountFir.localId;
            expect(osAccountFir.localName).assertEqual("osAccountIdSerialG");
            var countFir = await osAccountManager.getCreatedOsAccountsCount();
            console.info("====>obtains the number of all os accounts created count:" + countFir);
            countFir = countFir - 1;
            expect(countFir).assertEqual(obtainCount);
            await osAccountManager.removeOsAccount(localIdFir);
            console.info("====>remove localId: " + localIdFir);
            var countSec = await osAccountManager.getCreatedOsAccountsCount();
            console.info("====>obtains the number accounts created count:" + countSec);
            expect(countSec).assertEqual(obtainCount);
            console.info("====>ActsOsAccountGetCount_0200 end====");
            done();
        })

        /**
         * @tc.name   ActsOsAccountQueryActivedOsAccountIds_0100
         * @tc.number ActsOsAccountQueryActivedOsAccountIds_0100
         * @tc.desc   query activated osAccount Ids, queryActivatedOsAccountIds callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountQueryActivedOsAccountIds_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountQueryActivedOsAccountIds_0100 start====");
            let osAccountManager = osaccount.getAccountManager();
            osAccountManager.queryActivatedOsAccountIds((err, dataArray) => {
                console.info("====>ActsOsAccountGQueryActicedOsAccountIds_0100 err: " + JSON.stringify(err));
                console.info("====>ActsOsAccountGQueryActicedOsAccountIds_0100 dataArray: " + dataArray);
                expect(err).assertEqual(null);
                expect(dataArray.length > 0).assertTrue();
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountQueryActivedOsAccountIds_0200
         * @tc.number ActsOsAccountQueryActivedOsAccountIds_0200
         * @tc.desc   query activated osAccount Ids, queryActivatedOsAccountIds promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountQueryActivedOsAccountIds_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountQueryActivedOsAccountIds_0200 start====");
            let osAccountManager = osaccount.getAccountManager();
            console.info("get AccountManager finish====");
            try {
                let dataArray = await osAccountManager.queryActivatedOsAccountIds();
                console.info("====>QueryActivedOsAccountIds_0200 queryActivatedOsAccountIds data: " + dataArray);
                expect(dataArray.length > 0).assertTrue();
                done();
            } catch (err) {
                console.info("====>QueryActivedOsAccountIds_0200 queryActivatedOsAccountIds err: " + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        })


        /**
         * @tc.name   ActsOsAccountConstraints_3100
         * @tc.number ActsOsAccountConstraints_0300
         * @tc.desc   get 0 local user all constraints
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountConstraints_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountConstraints_3100 start====");
            var AccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            AccountManager.getOsAccountAllConstraints(0, (err, constraints) => {
                console.info("====>getOsAccountAllConstraints err:" + JSON.stringify(err));
                console.info("====>getOsAccountAllConstraints:" + JSON.stringify(constraints));
                expect(err).assertEqual(null);
                expect(constraints.length).assertEqual(0);
                console.info("====>ActsOsAccountConstraints_3100 end====");
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountConstraints_3200
         * @tc.number ActsOsAccountConstraints_3200
         * @tc.desc   get 0 local user all constraints
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountConstraints_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountConstraints_3200 start====");
            var AccountManager = osaccount.getAccountManager();
            console.info("get AccountManager finish====");
            AccountManager.getOsAccountAllConstraints(0).then((data) => {
                console.info("====>ActsOsAccountConstraints_3200 getOsAccountAllConstraints data:" + data);
                expect(data.length).assertEqual(0);
                done();
            }).catch((err) => {
                console.info("====>ActsOsAccountConstraints_3200 getOsAccountAllConstraints err:" + JSON.stringify(err));
                expect().assertFalse()
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountConstraints_3101
         * @tc.number ActsOsAccountConstraints_3101
         * @tc.desc   get 100 local user all constraints
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountConstraints_3101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountConstraints_3101 start====");
            var AccountManager = osaccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            AccountManager.getOsAccountAllConstraints(100, (err, constraints) => {
                console.info("====>getOsAccountAllConstraints err:" + JSON.stringify(err));
                console.info("====>getOsAccountAllConstraints:" + JSON.stringify(constraints));
                expect(err).assertEqual(null);
                expect(constraints.length > 0).assertTrue();
                console.info("====>ActsOsAccountConstraints_3101 end====");
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountConstraints_3201
         * @tc.number ActsOsAccountConstraints_3201
         * @tc.desc   get 100 local user all constraints
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountConstraints_3201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountConstraints_3201 start====");
            var AccountManager = osaccount.getAccountManager();
            console.info("get AccountManager finish====");
            AccountManager.getOsAccountAllConstraints(100).then((data) => {
                console.info("====>ActsOsAccountConstraints_3201 getOsAccountAllConstraints data:" + data);
                expect(data.length > 0).assertTrue();
                done();
            }).catch((err) => {
                console.info("====>ActsOsAccountConstraints_3201 getOsAccountAllConstraints err:" + JSON.stringify(err));
                expect().assertFalse()
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountDomainTest_0300
         * @tc.number ActsAccountDomainTest_0300
         * @tc.desc   Test createOsAccountForDomain getOsAccountLocalIdFromDomain API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountDomainTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountDomainTest_0100 start====");
            var osAccountManager = osaccount.getAccountManager();
            osAccountManager.getOsAccountLocalIdFromDomain({ domain: "", accountName: "" }, (err) => {
                console.info("====>ActsOsAccountDomainTest_0300 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true)
                console.info("====>ActsOsAccountDomainTest_0300 end====");
                done();
            })
        });

        /**
         * @tc.name   ActsOsAccountDomainTest_0400
         * @tc.number ActsAccountDomainTest_0400
         * @tc.desc   Test createOsAccountForDomain getOsAccountLocalIdFromDomain API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountDomainTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountDomainTest_0400 start====");
            var osAccountManager = osaccount.getAccountManager();
            osAccountManager.getOsAccountLocalIdFromDomain({ domain: "", accountName: "" }).then((accountID) => {
                console.info("ActsOsAccountDomainTest_0400 accountID:" + JSON.stringify(accountID))
                done();
            }).catch((err) => {
                console.info("ActsOsAccountDomainTest_0400 err:" + JSON.stringify(err))
                expect(err.code != 0).assertEqual(true)
                done();
            })
        });

        /**
         * @tc.name   ActsOsAccountQuery_2100
         * @tc.number ActsOsAccountQuery_1700
         * @tc.desc   Get the os account information to which the application belongs
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountQuery_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountQuery_2100 start====");
            var AccountManager = osaccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.queryCurrentOsAccount((err, data) => {
                console.info("====>queryCurrentOsAccount err:" + JSON.stringify(err));
                console.info("====>queryCurrentOsAccount data:" + JSON.stringify(data));
                expect(err).assertEqual(null);
                console.info("====>ActsOsAccountQuery_2100 end====");
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountQuery_2200
         * @tc.number ActsOsAccountQuery_1800
         * @tc.desc   Get the os account information to which the application belongs
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountQuery_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountQuery_2200 start====");
            var AccountManager = osaccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var data = await AccountManager.queryCurrentOsAccount();
            console.info("====>queryCurrentOsAccount data:" + JSON.stringify(data));
            expect(data.localId).assertEqual(100);
            expect(data.type).assertEqual(0);
            var serialNumberStr = data.serialNumber.toString();
            var serialIntercept = serialNumberStr.substring(8);
            console.info("====>truncate the last eight characters: " + serialIntercept);
            expect(data.isCreateCompleted).assertTrue();
            console.info("====>ActsOsAccountQuery_2200 end====");
            done();
        })


        /**
         * @tc.name   ActsOsAccountConstraints_3300
         * @tc.number ActsOsAccountPermission_3300
         * @tc.desc   the application call interface does not meet the permissions
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountConstraints_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountConstraints_3300 start====");
            var AccountManager = osaccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.isOsAccountConstraintEnable(100, "constraint.bluetooth", (err, result) => {
                console.info("====>isOsAccountConstraintEnable err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                expect(result).assertEqual(true);
                console.info("====>ActsOsAccountConstraints_3300 end====");
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountConstraints_3400
         * @tc.number ActsOsAccountPermission_3400
         * @tc.desc   the application call interface does not meet the permissions
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountConstraints_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountConstraints_3400 start====");
            var AccountManager = osaccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                let data = await AccountManager.isOsAccountConstraintEnable(100, "constraint.bluetooth");
                console.info("====>isOsAccountConstraintEnable data:" + JSON.stringify(data));
                expect(data).assertEqual(true);
                done();
            } catch (err) {
                console.info("====>isOsAccountConstraintEnable err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                console.info("====>ActsOsAccountConstraints_3400 end====");
                done();
            }
        })

        /**
         * @tc.name   ActsOsAccountConstraints_3500
         * @tc.number ActsOsAccountConstraints_3500
         * @tc.desc   check isOsAccountConstraintEnable interface for callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountConstraints_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountConstraints_3500 start====");
            var AccountManager = osaccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.isOsAccountConstraintEnable(100, "constraint.fun", (err, result) => {
                console.info("====>isOsAccountConstraintEnable err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                expect(result).assertEqual(false);
                console.info("====>ActsOsAccountConstraints_3500 end====");
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountConstraints_3600
         * @tc.number ActsOsAccountConstraints_3600
         * @tc.desc   check isOsAccountConstraintEnable interface for promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountConstraints_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountConstraints_3600 start====");
            var AccountManager = osaccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                let data = await AccountManager.isOsAccountConstraintEnable(100, "constraint.fun");
                console.info("====>isOsAccountConstraintEnable data:" + JSON.stringify(data));
                expect(data).assertEqual(false);
                done();
            } catch (err) {
                console.info("====>isOsAccountConstraintEnable err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                console.info("====>ActsOsAccountConstraints_3600 end====");
                done();
            }
        })
    })
}

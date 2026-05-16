/*
 * Copyright (C) 2024-2025 Huawei Device Co., Ltd.
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

import osAccount from '@ohos.account.osAccount'

export default function ActsOANoPermissionTest() {
    describe('ActsOANoPermissionTest', function () {

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_0100
         * @tc.number SUB_Account_OsAccount_NoPermission_0100
         * @tc.desc   no ohos.permission.MANAGE_LOCAL_ACCOUNTS.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
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
         * @tc.name   SUB_Account_OsAccount_NoPermission_0200
         * @tc.number SUB_Account_OsAccount_NoPermission_0200
         * @tc.desc   no ohos.permission.MANAGE_LOCAL_ACCOUNTS.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
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
         * @tc.name   SUB_Account_OsAccount_NoPermission_0300
         * @tc.number SUB_Account_OsAccount_NoPermission_0300
         * @tc.desc   no ohos.permission.MANAGE_LOCAL_ACCOUNTS.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
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
         * @tc.name   SUB_Account_OsAccount_NoPermission_0400
         * @tc.number SUB_Account_OsAccount_NoPermission_0400
         * @tc.desc   no ohos.permission.MANAGE_LOCAL_ACCOUNTS.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
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
         * @tc.name   SUB_Account_OsAccount_NoPermission_0500
         * @tc.number SUB_Account_OsAccount_NoPermission_0500
         * @tc.desc   no ohos.permission.MANAGE_LOCAL_ACCOUNTS or ohos.permission.DISTRIBUTED_DATASYNC.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
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
         * @tc.name   SUB_Account_OsAccount_NoPermission_0600
         * @tc.number SUB_Account_OsAccount_NoPermission_0600
         * @tc.desc   no ohos.permission.MANAGE_LOCAL_ACCOUNTS or ohos.permission.DISTRIBUTED_DATASYNC.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
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

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_0700
         * @tc.number SUB_Account_OsAccount_NoPermission_0700
         * @tc.desc   permission check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_0700 ";
                console.info(tag + "start====");
                let osAccountManager = osAccount.getAccountManager();
                console.info(tag + "start checkOsAccountActivated");
                try {
                    osAccountManager.checkOsAccountActivated(101, (err, data) => {
                        console.info(tag + "err: " + JSON.stringify(err));
                        console.info(tag + "data: " + JSON.stringify(data));
                        try {
                            expect(err.code).assertEqual(201);
                            console.info(tag + "end====");
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        done();
                    });
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_0800
         * @tc.number SUB_Account_OsAccount_NoPermission_0800
         * @tc.desc   permission check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_0800 ";
                console.info(tag + "start====");
                try {
                    let osAccountManager = osAccount.getAccountManager();
                    console.info(tag + "start checkOsAccountActivated");
                    let data = await osAccountManager.checkOsAccountActivated(101);
                    console.info(tag + "data: " + JSON.stringify(data));
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    console.info(tag + "end====");
                    expect(err.code).assertEqual(201);
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_0900
         * @tc.number SUB_Account_OsAccount_NoPermission_0900
         * @tc.desc   permission check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_0900 ";
                console.info(tag + "start====");
                let osAccountManager = osAccount.getAccountManager();
                console.info(tag + "start checkOsAccountConstraintEnabled");
                try {
                    osAccountManager.checkOsAccountConstraintEnabled(101, "constraint.wifi", (err, data) => {
                        console.info(tag + "err: " + JSON.stringify(err));
                        console.info(tag + "data: " + JSON.stringify(data));
                        try {
                            expect(err.code).assertEqual(201);
                            console.info(tag + "end====");
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        done();
                    });
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_1000
         * @tc.number SUB_Account_OsAccount_NoPermission_1000
         * @tc.desc   permission check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_1000 ";
                console.info(tag + "start====");
                try {
                    let osAccountManager = osAccount.getAccountManager();
                    console.info(tag + "start checkOsAccountConstraintEnabled");
                    let data = await osAccountManager.checkOsAccountConstraintEnabled(101, "constraint.wifi");
                    console.info(tag + "data: " + JSON.stringify(data));
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    console.info(tag + "end====");
                    expect(err.code).assertEqual(201);
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_1100
         * @tc.number SUB_Account_OsAccount_NoPermission_1100
         * @tc.desc   permission check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_1100 ";
                console.info(tag + "start====");
                let osAccountManager = osAccount.getAccountManager();
                console.info(tag + "start checkOsAccountVerified");
                try {
                    osAccountManager.checkOsAccountVerified(101, (err, data) => {
                        console.info(tag + "err: " + JSON.stringify(err));
                        console.info(tag + "data: " + JSON.stringify(data));
                        try {
                            expect(err.code).assertEqual(201);
                            console.info(tag + "end====");
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        done();
                    });
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_1200
         * @tc.number SUB_Account_OsAccount_NoPermission_1200
         * @tc.desc   permission check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_1200 ";
                console.info(tag + "start====");
                try {
                    let osAccountManager = osAccount.getAccountManager();
                    console.info(tag + "start checkOsAccountVerified");
                    let data = await osAccountManager.checkOsAccountVerified(101);
                    console.info(tag + "data: " + JSON.stringify(data));
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    console.info(tag + "end====");
                    expect(err.code).assertEqual(201);
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_1300
         * @tc.number SUB_Account_OsAccount_NoPermission_1300
         * @tc.desc   permission check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_1300 ";
                console.info(tag + "start====");
                let osAccountManager = osAccount.getAccountManager();
                console.info(tag + "start getOsAccountConstraints");
                try {
                    osAccountManager.getOsAccountConstraints(101, (err, data) => {
                        console.info(tag + "err: " + JSON.stringify(err));
                        console.info(tag + "data: " + JSON.stringify(data));
                        try {
                            expect(err.code).assertEqual(201);
                            console.info(tag + "end====");
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        done();
                    });
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_1400
         * @tc.number SUB_Account_OsAccount_NoPermission_1400
         * @tc.desc   permission check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_1400 ";
                console.info(tag + "start====");
                try {
                    let osAccountManager = osAccount.getAccountManager();
                    console.info(tag + "start getOsAccountConstraints");
                    let data = await osAccountManager.getOsAccountConstraints(101);
                    console.info(tag + "data: " + JSON.stringify(data));
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    console.info(tag + "end====");
                    expect(err.code).assertEqual(201);
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_1500
         * @tc.number SUB_Account_OsAccount_NoPermission_1500
         * @tc.desc   permission check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_1500 ";
                console.info(tag + "start====");
                let osAccountManager = osAccount.getAccountManager();
                console.info(tag + "start getCurrentOsAccount");
                try {
                    osAccountManager.getCurrentOsAccount((err, data) => {
                        console.info(tag + "err: " + JSON.stringify(err));
                        console.info(tag + "data: " + JSON.stringify(data));
                        try {
                            expect(err.code).assertEqual(201);
                            console.info(tag + "end====");
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        done();
                    });
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_1600
         * @tc.number SUB_Account_OsAccount_NoPermission_1600
         * @tc.desc   permission check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_1600 ";
                console.info(tag + "start====");
                let osAccountManager = osAccount.getAccountManager();
                console.info(tag + "start getCurrentOsAccount");
                try {
                    let data = await osAccountManager.getCurrentOsAccount();
                    console.info(tag + "data: " + JSON.stringify(data));
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    console.info(tag + "end====");
                    expect(err.code).assertEqual(201);
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_1700
         * @tc.number SUB_Account_OsAccount_NoPermission_1700
         * @tc.desc   permission check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_1700 ";
                console.info(tag + "start====");
                let osAccountManager = osAccount.getAccountManager();
                console.info(tag + "start getCurrentOsAccount");
                try {
                    let data = await osAccountManager.getOsAccountDomainInfo(101);
                    console.info(tag + "data: " + JSON.stringify(data));
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    console.info(tag + "end====");
                    expect(err.code).assertEqual(201);
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_1800
         * @tc.number SUB_Account_OsAccount_NoPermission_1800
         * @tc.desc   no ohos.permission.MANAGE_LOCAL_ACCOUNTS or ohos.permission.MANAGE_DOMAIN_ACCOUNTS.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_1800 ";
                console.info(tag + "start====");
                let oldDomainInfo = { domain: 'testDomain', accountName: 'oldtestAccountName' };
                let newDomainInfo = { domain: 'testDomain', accountName: 'newtestAccountName' };
                try {
                    console.info(tag + "start updateAccountInfo");
                    await osAccount.DomainAccountManager.updateAccountInfo(oldDomainInfo, newDomainInfo);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    if (err.code == 801) {
                        console.info(tag + "Current device not support API: updateAccountInfo");
                    } else {
                        expect(err.code).assertEqual(201);
                    }
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_1900
         * @tc.number SUB_Account_OsAccount_NoPermission_1900
         * @tc.desc   no ohos.permission.MANAGE_DOMAIN_ACCOUNT_SERVER_CONFIGS.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_1900 ";
                console.info(tag + "start====");
                let configParams = {
                    'uri': 'test.example.com',
                    'port': 100
                };
                try {
                    console.info(tag + "start addServerConfig");
                    await osAccount.DomainServerConfigManager.addServerConfig(configParams);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    if (err.code == 801) {
                        console.info(tag + "Current device not support API: addServerConfig");
                    } else {
                        expect(err.code).assertEqual(201);
                    }
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_2000
         * @tc.number SUB_Account_OsAccount_NoPermission_2000
         * @tc.desc   no ohos.permission.MANAGE_DOMAIN_ACCOUNT_SERVER_CONFIGS.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_2000 ";
                console.info(tag + "start====");
                let configId = "configId";
                try {
                    console.info(tag + "start removeServerConfig");
                    await osAccount.DomainServerConfigManager.removeServerConfig(configId);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    if (err.code == 801) {
                        console.info(tag + "Current device not support API: removeServerConfig");
                    } else {
                        expect(err.code).assertEqual(201);
                    }
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_2100
         * @tc.number SUB_Account_OsAccount_NoPermission_2100
         * @tc.desc   no ohos.permission.MANAGE_DOMAIN_ACCOUNT_SERVER_CONFIGS.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_2100 ";
                console.info(tag + "start====");
                let configId = "configId";
                let configParams = {
                    'uri': 'test.example.com',
                    'port': 100
                };
                try {
                    console.info(tag + "start updateServerConfig");
                    await osAccount.DomainServerConfigManager.updateServerConfig(configId, configParams);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    if (err.code == 801) {
                        console.info(tag + "Current device not support API: updateServerConfig");
                    } else {
                        expect(err.code).assertEqual(201);
                    }
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_2200
         * @tc.number SUB_Account_OsAccount_NoPermission_2200
         * @tc.desc   no ohos.permission.MANAGE_DOMAIN_ACCOUNT_SERVER_CONFIGS.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_2200 ";
                console.info(tag + "start====");
                let configId = "configId";
                try {
                    console.info(tag + "start getServerConfig");
                    await osAccount.DomainServerConfigManager.getServerConfig(configId);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    if (err.code == 801) {
                        console.info(tag + "Current device not support API: getServerConfig");
                    } else {
                        expect(err.code).assertEqual(201);
                    }
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_2300
         * @tc.number SUB_Account_OsAccount_NoPermission_2300
         * @tc.desc   no ohos.permission.MANAGE_DOMAIN_ACCOUNT_SERVER_CONFIGS.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_2300 ";
                console.info(tag + "start====");
                try {
                    console.info(tag + "start getAllServerConfigs");
                    await osAccount.DomainServerConfigManager.getAllServerConfigs();
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    if (err.code == 801) {
                        console.info(tag + "Current device not support API: getAllServerConfigs");
                    } else {
                        expect(err.code).assertEqual(201);
                    }
                    done();
                }
            });

        /**
         * @tc.name   SUB_Account_OsAccount_NoPermission_2400
         * @tc.number SUB_Account_OsAccount_NoPermission_2400
         * @tc.desc   no ohos.permission.MANAGE_DOMAIN_ACCOUNT_SERVER_CONFIGS.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_Account_OsAccount_NoPermission_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done) => {
                let tag = "====>SUB_Account_OsAccount_NoPermission_2400 ";
                console.info(tag + "start====");
                let accountInfo = {
                    'accountName': 'demoName',
                    'accountId': 'demoId',
                    'domain': 'demoDomain'
                };
                console.info(tag + "start====");
                try {
                    console.info(tag + "start getAccountServerConfig");
                    await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.info(tag + "catch err: " + JSON.stringify(err));
                    if (err.code == 801) {
                        console.info(tag + "Current device not support API: getAccountServerConfig");
                    } else {
                        expect(err.code).assertEqual(201);
                    }
                    done();
                }
            });
    });
}
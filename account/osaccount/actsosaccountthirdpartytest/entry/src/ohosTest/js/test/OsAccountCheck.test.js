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
import osAccount from '@ohos.account.osAccount'
import distributedAccount from '@ohos.account.distributedAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

const TIMEOUT = 1000;
const ERR_PERMISSION_DENIED = 201;
const ERR_PARAMETER_CHECK_FAILED = 401;
const ERR_SYSTEM_SERVICE_ABNORMAL = 12300001;
const ERR_INVALID_PARAMETER = 12300002;
const ERR_ACCOUNT_NOT_EXIST = 12300003;
export default function ActsOsAccountThirdPartyTest_third_3() {
    describe('ActsOsAccountThirdPartyTest_third_3', function () {
        /**
         * @tc.name   ActsOsAccountDeviceId_0100
         * @tc.number ActsOsAccountDeviceId_0100
         * @tc.desc   get distributed virtual device ID
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsOsAccountDeviceId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsOsAccountDeviceId_0100 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            const accountAbility = distributedAccount.getDistributedAccountAbility();
            accountAbility.updateOsAccountDistributedInfo(
                {
                    name: 'ZhangSan',
                    id: '12345',
                    event: "Ohos.account.event.LOGIN"
                }, (err) => {
                    console.info("====>update distributedInfo err:" + JSON.stringify(err));
                    AccountManager.queryDistributedVirtualDeviceId((err, id) => {
                        console.info("====>queryDistributedVirtualDeviceId err:" + JSON.stringify(err));
                        console.info("====>queryDistributedVirtualDeviceId deviceId:" + id);
                        expect(err).assertEqual(null);
                        expect(id !== 'ohosAnonymousUid').assertTrue()
                        console.info("====>ActsOsAccountDeviceId_0100 end====");
                        done();
                    })
                })
        })

        /**
         * @tc.name   ActsOsAccountDeviceId_0200
         * @tc.number ActsOsAccountDeviceId_0200
         * @tc.desc   get distributed virtual device ID
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsOsAccountDeviceId_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsOsAccountDeviceId_0200 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            const accountAbility = distributedAccount.getDistributedAccountAbility();
            accountAbility.updateOsAccountDistributedInfo(
                {
                    name: 'ZhangSan',
                    id: '12345',
                    event: "Ohos.account.event.LOGIN"
                }, async (err) => {
                    console.info("====>update distributedInfo err:" + JSON.stringify(err));
                    console.info("====>queryDistributedVirtualDeviceId start====");
                    var id = await AccountManager.queryDistributedVirtualDeviceId();
                    console.info("====>queryDistributedVirtualDeviceId:" + id);
                    expect(id !== 'ohosAnonymousUid').assertTrue()
                    console.info("====>ActsOsAccountDeviceId_0200 end====");
                    done();
                })
        })

        /**
         * @tc.name   ActsOsAccountCheckActived_0100
         * @tc.number ActsOsAccountCheckActived_0100
         * @tc.desc   Verify query 0 user status is true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsOsAccountCheckActived_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsOsAccountCheckActived_0100 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.checkOsAccountActivated(0, (err, isActived) => {
                console.info("====>checkOsAccountActivated err:" + JSON.stringify(err));
                console.info("====>checkOsAccountActivated isActived:" + isActived);
                expect(err).assertEqual(null);
                expect(isActived).assertEqual(true);
                console.info("====>ActsOsAccountCheckActived_0100 end");
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountCheckActived_0200
         * @tc.number ActsOsAccountCheckActived_0200
         * @tc.desc   checkOsAccountActivated promise Verify query 0 user status is true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsOsAccountCheckActived_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsOsAccountCheckActived_0200 start====");
            let AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                let isActived = await AccountManager.checkOsAccountActivated(0);
                console.info("====>checkOsAccountActivated:" + isActived);
                expect(isActived).assertEqual(true);
                console.info("====>ActsOsAccountCheckActived_0200 end");
                done();
            } catch (err) {
                console.info("====>catch checkOsAccountActivated err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.name   ActsOsAccountCheckActived_0300
         * @tc.number ActsOsAccountCheckActived_0300
         * @tc.desc   Authentication failed to query the active status of the user that does not exist
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckActived_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountCheckActived_0300 start");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var nonExistLocalId = 1000;
            AccountManager.checkOsAccountActivated(nonExistLocalId, (err) => {
                console.info("====>checkOsAccountActivated err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_ACCOUNT_NOT_EXIST);
                console.info("====>ActsOsAccountCheckActived_0300 end");
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountCheckActived_0400
         * @tc.number ActsOsAccountCheckActived_0400
         * @tc.desc   Authentication failed to query the active status of the user that does not exist
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckActived_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountCheckActived_0400 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var nonExistLocalId = 1000;
            try {
                await AccountManager.checkOsAccountActivated(nonExistLocalId);
            } catch (err) {
                console.info("====>checkOsAccountActivated err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_ACCOUNT_NOT_EXIST);
                console.info("====>ActsOsAccountCheckActived_0400 end");
                done();
            }
        })

        /**
         * @tc.name   ActsOsAccountCheckActived_0500
         * @tc.number ActsOsAccountCheckActived_0500
         * @tc.desc   Verify that the query active state is not received with parameter type mismatch
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckActived_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountCheckActived_0500 start");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var localIdStr = "100";
            try {
                AccountManager.checkOsAccountActivated(localIdStr, () => {
                    expect().assertFail();
                    done();
                })
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAMETER_CHECK_FAILED)
                done();
            }
        })

        /**
         * @tc.name   ActsOsAccountCheckActived_0600
         * @tc.number ActsOsAccountCheckActived_0600
         * @tc.desc   Verify that the query active state is not received with parameter type mismatch
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckActived_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountCheckActived_0600 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var localIdStr = "100";
            try {
                AccountManager.checkOsAccountActivated(localIdStr).then(() => {
                    expect().assertFail();
                    done();
                })
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAMETER_CHECK_FAILED)
                done();
            }
        })

        /**
         * @tc.name   ActsOsAccountCheckActived_0700
         * @tc.number ActsOsAccountCheckActived_0700
         * @tc.desc   Verify that the query active state is not received with parameter undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckActived_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountCheckActived_0700 start");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                AccountManager.checkOsAccountActivated(undefined, () => {
                    expect().assertFail();
                    done();
                })
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAMETER_CHECK_FAILED)
                done();
            }
        })

        /**
         * @tc.name   ActsOsAccountCheckActived_0800
         * @tc.number ActsOsAccountCheckActived_0800
         * @tc.desc   Verify that the query active state is not received with parameter undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckActived_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountCheckActived_0800 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>ActsOsAccountCheckActived_0800 get os AccountManager finish====");
            try {
                AccountManager.checkOsAccountActivated(undefined).then(() => {
                    expect().assertFail();
                    done();
                })
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAMETER_CHECK_FAILED)
                done();
            }
        })

        /**
         * @tc.name   ActsOsAccountCheckMulty_0100
         * @tc.number ActsOsAccountCheckMulty_0100
         * @tc.desc   Check whether the function of supporting multiple os account is enabled
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ActsOsAccountCheckMulty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsOsAccountCheckMulty_0100 start====");
            let AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.checkMultiOsAccountEnabled((err, isEnable) => {
                console.info("====>checkMultiOsAccountEnabled err:" + JSON.stringify(err));
                console.info("====>checkMultiOsAccountEnabled isEnable:" + isEnable);
                if (isEnable != true) {
                    expect(isEnable).assertFalse();
                    console.info("====>ActsOsAccountCheckMulty_0100 end====");
                    done();
                    return;
                }
                AccountManager.checkMultiOsAccountEnabled((err, data) => {
                    console.info("====>checkMultiOsAccountEnabled data:" + data);
                    expect(data).assertTrue();
                    console.info("====>ActsOsAccountCheckMulty_0100 end====");
                    done();
                });
            });
        });

        /**
         * @tc.name   ActsOsAccountCheckMulty_0200
         * @tc.number ActsOsAccountCheckMulty_0200
         * @tc.desc   Check whether the function of supporting multiple os account is enabled
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ActsOsAccountCheckMulty_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsOsAccountCheckMulty_0200 start====");
            let AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            let isEnable = await AccountManager.checkMultiOsAccountEnabled();
            if (isEnable != true) {
                expect(isEnable).assertFalse();
                console.info("====>ActsOsAccountCheckMulty_0200 end====");
                done();
                return;
            }
            try {
                let data = await AccountManager.checkMultiOsAccountEnabled();
                console.info("====>checkMultiOsAccountEnabled data:" + JSON.stringify(data));
                expect(data).assertTrue();
                console.info("====>ActsOsAccountCheckMulty_0200 end====");
                done();
            } catch (err) {
                console.info("====>catch checkMultiOsAccountEnabled err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   ActsOsAccountCheckVerified_0100
         * @tc.number ActsOsAccountCheckVerified_0100
         * @tc.desc   Verify that the initial state query is unlocked to false checkOsAccountVerified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckVerified_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>checkOsAccountVerified_0100 start====");
            let AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.checkOsAccountVerified((err, isEnable) => {
                console.info("====>checkOsAccountVerified err:" + JSON.stringify(err));
                console.info("====>checkOsAccountVerified isEnable:" + isEnable);
                if (isEnable != true) {
                    expect(isEnable).assertFalse();
                    console.info("====>checkOsAccountVerified_0100 end====");
                    done();
                    return;
                }
                AccountManager.checkOsAccountVerified((err, data) => {
                    console.info("====>checkOsAccountVerified data:" + data);
                    expect(data).assertTrue();
                    console.info("====>ActsOsAccountCheckVerified_0100 end====");
                    done();
                });
            });
        });

        /**
         * @tc.name   ActsOsAccountCheckVerified_0200
         * @tc.number ActsOsAccountCheckVerified_0200
         * @tc.desc   Verify that the initial state query is unlocked to false checkOsAccountVerified promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckVerified_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>checkOsAccountVerified_0200 start====");
            let AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            let isEnable = await AccountManager.checkOsAccountVerified();
            if (isEnable != true) {
                expect(isEnable).assertFalse();
                console.info("====>ActsOsAccountCheckVerified_0200 end====");
                done();
                return;
            }
            try {
                let checkOsAccountVerified = await AccountManager.checkOsAccountVerified();
                console.info("====>checkOsAccountVerified data:" + JSON.stringify(checkOsAccountVerified));
                expect(checkOsAccountVerified).assertTrue();
                console.info("====>ActsOsAccountCheckVerified_0200 end====");
                done();
            } catch (err) {
                console.info("====>catch checkMultiOsAccountEnabled err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   ActsOsAccountCheckVerified_0300
         * @tc.number ActsOsAccountCheckVerified_0300
         * @tc.desc   Verify that the initial state query 0 user is unlocked to false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsOsAccountCheckVerified_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsOsAccountCheckVerified_0300 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.checkOsAccountVerified(0, (err, data) => {
                console.info("====>checkOsAccountVerified err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                expect(data).assertFalse();
                console.info("====>ActsOsAccountCheckVerified_0300 end====");
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountCheckVerified_0400
         * @tc.number ActsOsAccountCheckVerified_0400
         * @tc.desc   Verify that the initial state query 0 user is unlocked to false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsOsAccountCheckVerified_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsOsAccountCheckVerified_0400 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var checkOsAccountVerified = await AccountManager.checkOsAccountVerified(0);
            console.info("====>checkOsAccountVerified data:" + JSON.stringify(checkOsAccountVerified));
            expect(checkOsAccountVerified).assertFalse();
            console.info("====>ActsOsAccountCheckVerified_0400 end====");
            done();
        })

        /**
         * @tc.name   ActsOsAccountCheckVerified_0500
         * @tc.number ActsOsAccountCheckVerified_0500
         * @tc.desc   Verify query "100" user is unlocked failed
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckVerified_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountCheckVerified_0500 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var localIdStr = "100";
            try {
                AccountManager.checkOsAccountVerified(localIdStr, () => {
                    expect().assertFail();
                    done();
                })
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAMETER_CHECK_FAILED);
                console.info("====>ActsOsAccountCheckVerified_0500 end====");
                done();
            }
        })

        /**
         * @tc.name   ActsOsAccountCheckVerified_0600
         * @tc.number ActsOsAccountCheckVerified_0600
         * @tc.desc   Verify query "100" user is unlocked failed
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckVerified_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountCheckVerified_0600 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var localIdStr = "100";
            try {
                AccountManager.checkOsAccountVerified(localIdStr).then(() => {
                    expect().assertFail();
                    done();
                })
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAMETER_CHECK_FAILED)
                console.info("====>ActsOsAccountCheckVerified_0600 end====");
                done();
            }
        })

        /**
         * @tc.name   ActsOsAccountCheckVerified_0700
         * @tc.number ActsOsAccountCheckVerified_0700
         * @tc.desc   Verify query undefined user is unlocked failed
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckVerified_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountCheckVerified_0700 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var localIdUndefined = undefined;
            try {
                AccountManager.checkOsAccountVerified(localIdUndefined, () => {
                    console.info("====>ActsOsAccountCheckVerified_0800 end====");
                    done();
                })
            } catch (err) {
                expect().assertFail();
                console.info("====>ActsOsAccountCheckVerified_0700 end====");
                done();
            }
        })

        /**
         * @tc.name   ActsOsAccountCheckVerified_0800
         * @tc.number ActsOsAccountCheckVerified_0800
         * @tc.desc   Verify query undefined user is unlocked failed
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckVerified_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountCheckVerified_0800 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var localIdUndefined = undefined;
            try {
                AccountManager.checkOsAccountVerified(localIdUndefined).then(() => {
                    console.info("====>ActsOsAccountCheckVerified_0800 end====");
                    done();
                })
            } catch (err) {
                expect().assertFail();
                console.info("====>ActsOsAccountCheckVerified_0800 end====");
                done();
            }
        })

        /**
         * @tc.name   ActsOsAccountCheckVerified_0900
         * @tc.number ActsOsAccountCheckVerified_0900
         * @tc.desc   Verify query does not exist user unlock failed
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckVerified_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountCheckVerified_0900 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var osAccountLocalId = 1000;
            AccountManager.checkOsAccountVerified(osAccountLocalId, (err) => {
                console.info("====>checkOsAccountVerified err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_ACCOUNT_NOT_EXIST)
                console.info("====>ActsOsAccountCheckVerified_0900 end====");
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountCheckVerified_1000
         * @tc.number ActsOsAccountCheckVerified_1000
         * @tc.desc   Verify query does not exist user unlock failed
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsOsAccountCheckVerified_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsOsAccountCheckVerified_1000 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var osAccountLocalId = 1000;
            try {
                await AccountManager.checkOsAccountVerified(osAccountLocalId);
            } catch (err) {
                console.info("====>checkOsAccountVerified err:" + JSON.stringify(err));
                expect(err.code).assertEqual(ERR_ACCOUNT_NOT_EXIST)
                console.info("====>ActsOsAccountCheckVerified_1000 end====");
                done();
            }
        })

        /**
         * @tc.name   ActsOsAccountCheckTest_0100
         * @tc.number ActsOsAccountCheckTest_0100
         * @tc.desc   check whether this OS account is a test OS account checkOsAccountTestable callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsOsAccountCheckTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsOsAccountCheckTest_0100 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.checkOsAccountTestable((err, data) => {
                console.info("====>checkOsAccountTestable err:" + JSON.stringify(err));
                console.info("====>checkOsAccountTestable data:" + JSON.stringify(data));
                expect(err).assertEqual(null);
                expect(data).assertFalse();
                console.info("====>ActsOsAccountCheckTest_0100 end====");
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountCheckTest_0200
         * @tc.number ActsOsAccountCheckTest_0200
         * @tc.desc   check whether this OS account is a test OS account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsOsAccountCheckTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsOsAccountCheckTest_0200 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var isTest = await AccountManager.checkOsAccountTestable();
            expect(isTest).assertFalse();
            console.info("====>ActsOsAccountCheckTest_0200 end====");
            done();
        })

        /**
         * @tc.name   ActsOsAccountIsOsAccountUnlocked_0100
         * @tc.number ActsOsAccountIsOsAccountUnlocked_0100
         * @tc.desc   Verify that the initial state query is unlocked to false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ActsOsAccountIsOsAccountUnlocked_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsOsAccountIsOsAccountUnlocked_0100 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var IsOsAccountUnlocked = await AccountManager.isOsAccountUnlocked();
            console.info("====>IsOsAccountUnlocked data:" + JSON.stringify(IsOsAccountUnlocked));
            expect(IsOsAccountUnlocked).assertEqual(true);
            console.info("====>ActsOsAccountIsOsAccountUnlocked_0100 end====");
            done();
        })

        /**
         * @tc.name   ActsOsAccountCheckActived_0900
         * @tc.number ActsOsAccountCheckActived_0900
         * @tc.desc   checkOsAccountActivated false callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsOsAccountCheckActived_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsOsAccountCheckActived_0900 start====");
            let osAccountManager = osAccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            let isEnable = await osAccountManager.checkMultiOsAccountEnabled();
            if (isEnable != true) {
                console.info("====>ActsOsAccountCheckActived_0900 not support multiple osaccouts====");
                done();
                return;
            }
            osAccountManager.createOsAccount("CheckActived_0900", osAccount.OsAccountType.NORMAL, (err, info) => {
                console.info("====>create os account err: " + JSON.stringify(err));
                console.info("====>create os account OsAccountInfo: " + JSON.stringify(info));
                let id = info.localId;
                osAccountManager.checkOsAccountActivated(id, (err, data) => {
                    console.info("====>queryOsAccountById err:" + JSON.stringify(err));
                    console.info("====>get data:" + data + " by localId: " + id);
                    expect(data).assertFalse();
                    osAccountManager.removeOsAccount(id, (err) => {
                        console.info("====>remove localId: " + id + " err:" + JSON.stringify(err));
                        console.info("====>ActsOsAccountCheckActived_0900 end====");
                        done();
                    });
                });
            });
        });

        /**
         * @tc.name   ActsOsAccountCheckActived_1000
         * @tc.number ActsOsAccountCheckActived_1000
         * @tc.desc   checkOsAccountActivated false promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsOsAccountCheckActived_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsOsAccountCheckActived_1000 start====");
            let osAccountManager = osAccount.getAccountManager();
            console.info("====>get AccountManager finish====");
            let isEnable = await osAccountManager.checkMultiOsAccountEnabled();
            if (isEnable != true) {
                console.info("====>ActsOsAccountCheckActived_1000 not support multiple osaccouts====");
                done();
                return;
            }
            try {
                let info = await osAccountManager.createOsAccount("CheckActived_1000", osAccount.OsAccountType.NORMAL);
                console.info("====>create os account OsAccountInfo: " + JSON.stringify(info));
                let id = info.localId;
                let data = await osAccountManager.checkOsAccountActivated(id);
                console.info("====>get data:" + data + " by localId: " + id);
                expect(data).assertFalse();
                await osAccountManager.removeOsAccount(id);
                console.info("====>remove localId: " + id + " success");
                done();
            } catch (err) {
                console.info("====>catch error: " + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   ActsOsAccountCheckVerified_1100
         * @tc.number ActsOsAccountCheckVerified_1100
         * @tc.desc   Verify that the initial state query u100 is unlocked to true, checkOsAccountVerified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsOsAccountCheckVerified_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsOsAccountCheckVerified_1100 start====");
            let AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.checkOsAccountVerified(100, (err, data) => {
                console.info("====>checkOsAccountVerified err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                expect(data).assertTrue();
                console.info("====>ActsOsAccountCheckVerified_1100 end====");
                done();
            })
        })

        /**
         * @tc.name   ActsOsAccountCheckVerified_1200
         * @tc.number ActsOsAccountCheckVerified_1200
         * @tc.desc   Verify that the initial state query u100 is unlocked to true, checkOsAccountVerified promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsOsAccountCheckVerified_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsOsAccountCheckVerified_1200 start====");
            let AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                let checkOsAccountVerified = await AccountManager.checkOsAccountVerified(100);
                console.info("====>checkOsAccountVerified data:" + JSON.stringify(checkOsAccountVerified));
                expect(checkOsAccountVerified).assertTrue();
                console.info("====>ActsOsAccountCheckVerified_1200 end====");
                done();
            } catch (err) {
                console.info("====>catch error: " + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        })
    })
}

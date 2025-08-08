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
        /*
        * @tc.number  : ActsOsAccountDeviceId_0100
        * @tc.name    : queryDistributedVirtualDeviceId callback
        * @tc.desc    : get distributed virtual device ID
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

        /*
        * @tc.number  : ActsOsAccountDeviceId_0200
        * @tc.name    : queryDistributedVirtualDeviceId promise
        * @tc.desc    : get distributed virtual device ID
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

        /*
        * @tc.number  : ActsOsAccountCheckActived_0100
        * @tc.name    : checkOsAccountActivated callback
        * @tc.desc    : Verify query 0 user status is true
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

        /*
        * @tc.number  : ActsOsAccountCheckActived_0200
        * @tc.name    : checkOsAccountActivated promise
        * @tc.desc    : Verify query 0 user status is true
        */
        it('ActsOsAccountCheckActived_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsOsAccountCheckActived_0200 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                var isActived = await AccountManager.checkOsAccountActivated(0);
            } catch (err) {
                console.info("====>catch checkOsAccountActivated err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkOsAccountActivated:" + isActived);
            expect(isActived).assertEqual(true);
            console.info("====>ActsOsAccountCheckActived_0200 end");
            done();
        })

        /*
        * @tc.number  : ActsOsAccountCheckActived_0300
        * @tc.name    : checkOsAccountActivated callback
        * @tc.desc    : Authentication failed to query the active status of the user that does not exist
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

        /*
        * @tc.number  : ActsOsAccountCheckActived_0400
        * @tc.name    : checkOsAccountActivated promise
        * @tc.desc    : Authentication failed to query the active status of the user that does not exist
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

        /*
        * @tc.number  : ActsOsAccountCheckActived_0500
        * @tc.name    : checkOsAccountActivated callback
        * @tc.desc    : Verify that the query active state is not received with parameter type mismatch
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

        /*
        * @tc.number  : ActsOsAccountCheckActived_0600
        * @tc.name    : checkOsAccountActivated promise
        * @tc.desc    : Verify that the query active state is not received with parameter type mismatch
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

        /*
        * @tc.number  : ActsOsAccountCheckActived_0700
        * @tc.name    : checkOsAccountActivated callback
        * @tc.desc    : Verify that the query active state is not received with parameter undefined
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

        /*
        * @tc.number  : ActsOsAccountCheckActived_0800
        * @tc.name    : checkOsAccountActivated promise
        * @tc.desc    : Verify that the query active state is not received with parameter undefined
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

        /*
        * @tc.number  : ActsOsAccountCheckMulty_0100
        * @tc.name    : checkMultiOsAccountEnabled callback
        * @tc.desc    : Check whether the function of supporting multiple os account is enabled
        */
        it('ActsOsAccountCheckMulty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsOsAccountCheckMulty_0100 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.checkMultiOsAccountEnabled((err, data) => {
                console.info("====>checkMultiOsAccountEnabled err:" + JSON.stringify(err));
                console.info("====>checkMultiOsAccountEnabled data:" + data);
                expect(err).assertEqual(null);
                expect(data !== null).assertTrue();
                console.info("====>ActsOsAccountCheckMulty_0100 end====");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountCheckMulty_0200
        * @tc.name    : checkMultiOsAccountEnabled promise
        * @tc.desc    : Check whether the function of supporting multiple os account is enabled
        */
        it('ActsOsAccountCheckMulty_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsOsAccountCheckMulty_0200 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                var data = await AccountManager.checkMultiOsAccountEnabled();
            } catch (err) {
                console.info("====>catch checkMultiOsAccountEnabled err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkMultiOsAccountEnabled data:" + JSON.stringify(data));
            expect(data !== null).assertTrue();
            console.info("====>ActsOsAccountCheckMulty_0200 end====");
            done();
        })

        /*
        * @tc.number  : ActsOsAccountCheckVerified_0100
        * @tc.name    : checkOsAccountVerified callback
        * @tc.desc    : Verify that the initial state query is unlocked to false
        */
        it('ActsOsAccountCheckVerified_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>checkOsAccountVerified_0100 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.checkOsAccountVerified((err, data) => {
                console.info("====>checkOsAccountVerified err:" + JSON.stringify(err));
                console.info("====>checkOsAccountVerified data:" + data);
                expect(err).assertEqual(null);
                expect(data).assertEqual(true);
                console.info("====>ActsOsAccountCheckVerified_0100 end====");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountCheckVerified_0200
        * @tc.name    : checkOsAccountVerified promise
        * @tc.desc    : Verify that the initial state query is unlocked to false
        */
        it('ActsOsAccountCheckVerified_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>checkOsAccountVerified_0200 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var checkOsAccountVerified = await AccountManager.checkOsAccountVerified();
            console.info("====>checkOsAccountVerified data:" + JSON.stringify(checkOsAccountVerified));
            expect(checkOsAccountVerified).assertEqual(true);
            console.info("====>ActsOsAccountCheckVerified_0200 end====");
            done();
        })

        /*
        * @tc.number  : ActsOsAccountCheckVerified_0300
        * @tc.name    : checkOsAccountVerified callback
        * @tc.desc    : Verify that the initial state query 0 user is unlocked to false
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

        /*
        * @tc.number  : ActsOsAccountCheckVerified_0400
        * @tc.name    : checkOsAccountVerified promise
        * @tc.desc    : Verify that the initial state query 0 user is unlocked to false
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

        /*
        * @tc.number  : ActsOsAccountCheckVerified_0500
        * @tc.name    : checkOsAccountVerified callback
        * @tc.desc    : Verify query "100" user is unlocked failed
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

        /*
        * @tc.number  : ActsOsAccountCheckVerified_0600
        * @tc.name    : checkOsAccountVerified promise
        * @tc.desc    : Verify query "100" user is unlocked failed
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

        /*
        * @tc.number  : ActsOsAccountCheckVerified_0700
        * @tc.name    : checkOsAccountVerified callback
        * @tc.desc    : Verify query undefined user is unlocked failed
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

        /*
        * @tc.number  : ActsOsAccountCheckVerified_0800
        * @tc.name    : checkOsAccountVerified promise
        * @tc.desc    : Verify query undefined user is unlocked failed
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

        /*
        * @tc.number  : ActsOsAccountCheckVerified_0900
        * @tc.name    : checkOsAccountVerified callback
        * @tc.desc    : Verify query does not exist user unlock failed
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

        /*
        * @tc.number  : ActsOsAccountCheckVerified_1000
        * @tc.name    : checkOsAccountVerified promise
        * @tc.desc    : Verify query does not exist user unlock failed
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

        /*
        * @tc.number  : ActsOsAccountCheckTest_0100
        * @tc.name    : checkOsAccountTestable callback
        * @tc.desc    : check whether this OS account is a test OS account
        */
        it('ActsOsAccountCheckTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsOsAccountCheckTest_0100 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.checkOsAccountTestable((err, data) => {
                console.info("====>checkOsAccountTestable err:" + JSON.stringify(err));
                console.info("====>checkOsAccountTestable data:" + JSON.stringify(data));
                expect(err).assertEqual(null);
                expect(data).assertEqual(false);
                console.info("====>ActsOsAccountCheckTest_0100 end====");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountCheckTest_0200
        * @tc.name    : checkOsAccountTestable promise
        * @tc.desc    : check whether this OS account is a test OS account
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

        /*
        * @tc.number  : ActsOsAccountIsOsAccountUnlocked_0100
        * @tc.name    : IsOsAccountUnlocked promise
        * @tc.desc    : Verify that the initial state query is unlocked to false
        * @tc.level   : Level0
        * @tc.size    : MediumTest
        * @tc.type    : Function
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
    })
}
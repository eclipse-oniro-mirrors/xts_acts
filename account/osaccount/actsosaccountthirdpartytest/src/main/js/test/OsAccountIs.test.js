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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

const TIMEOUT = 1000;
export default function ActsOsAccountThirdPartyTest_third_1() {
    describe('ActsOsAccountThirdPartyTest_third_1', function () {

        /*
        * @tc.number  : ActsOsAccountDeviceId_0100
        * @tc.name    : getDistributedVirtualDeviceId callback
        * @tc.desc    : get distributed virtual device ID
        */
        it('ActsOsAccountDeviceId_0100', 0, async function (done) {
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
                    AccountManager.getDistributedVirtualDeviceId((err, id) => {
                        console.info("====>getDistributedVirtualDeviceId err:" + JSON.stringify(err));
                        console.info("====>getDistributedVirtualDeviceId deviceId:" + id);
                        expect(err).assertEqual(null);
                        expect(id !== 'ohosAnonymousUid').assertTrue()
                        console.info("====>ActsOsAccountDeviceId_0100 end====");
                        done();
                    })
                })
        })

        /*
        * @tc.number  : ActsOsAccountDeviceId_0200
        * @tc.name    : getDistributedVirtualDeviceId promise
        * @tc.desc    : get distributed virtual device ID
        */
        it('ActsOsAccountDeviceId_0200', 0, async function (done) {
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
                    console.info("====>getDistributedVirtualDeviceId start====");
                    var id = await AccountManager.getDistributedVirtualDeviceId();
                    console.info("====>getDistributedVirtualDeviceId:" + id);
                    expect(id !== 'ohosAnonymousUid').assertTrue()
                    console.info("====>ActsOsAccountDeviceId_0200 end====");
                    done();
                })
        })

        /*
        * @tc.number  : ActsOsAccountIsActived_0100
        * @tc.name    : isOsAccountActived callback
        * @tc.desc    : Verify query 0 user status is true
        */
        it('ActsOsAccountIsActived_0100', 0, async function (done) {
            console.info("====>ActsOsAccountIsActived_0100 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.isOsAccountActived(0, (err, isActived) => {
                console.info("====>isOsAccountActived err:" + JSON.stringify(err));
                console.info("====>isOsAccountActived isActived:" + isActived);
                expect(err).assertEqual(null);
                expect(isActived).assertEqual(true);
                console.info("====>ActsOsAccountIsActived_0100 end");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountIsActived_0200
        * @tc.name    : isOsAccountActived promise
        * @tc.desc    : Verify query 0 user status is true
        */
        it('ActsOsAccountIsActived_0200', 0, async function (done) {
            console.info("====>ActsOsAccountIsActived_0200 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                var isActived = await AccountManager.isOsAccountActived(0);
            } catch (err) {
                console.info("====>catch isOsAccountActived err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>isOsAccountActived:" + isActived);
            expect(isActived).assertEqual(true);
            console.info("====>ActsOsAccountIsActived_0200 end");
            done();
        })

        /*
        * @tc.number  : ActsOsAccountIsActived_0300
        * @tc.name    : isOsAccountActived callback
        * @tc.desc    : Authentication failed to query the active status of the user that does not exist
        */
        it('ActsOsAccountIsActived_0300', 0, async function (done) {
            console.info("====>ActsOsAccountIsActived_0300 start");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var nonExistLocalId = 1000;
            AccountManager.isOsAccountActived(nonExistLocalId, (err) => {
                console.info("====>isOsAccountActived err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsOsAccountIsActived_0300 end");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountIsActived_0400
        * @tc.name    : isOsAccountActived promise
        * @tc.desc    : Authentication failed to query the active status of the user that does not exist
        */
        it('ActsOsAccountIsActived_0400', 0, async function (done) {
            console.info("====>ActsOsAccountIsActived_0400 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var nonExistLocalId = 1000;
            try {
                await AccountManager.isOsAccountActived(nonExistLocalId);
            } catch (err) {
                console.info("====>isOsAccountActived err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsOsAccountIsActived_0400 end");
                done();
            }
        })

        /*
        * @tc.number  : ActsOsAccountIsActived_0500
        * @tc.name    : isOsAccountActived callback
        * @tc.desc    : Verify that the query active state is not received with parameter type mismatch
        */
        it('ActsOsAccountIsActived_0500', 0, async function (done) {
            console.info("====>ActsOsAccountIsActived_0500 start");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var localIdStr = "100";
            AccountManager.isOsAccountActived(localIdStr, (err, data) => {
                console.info("====>receive isOsAccountActived err: " + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true)
                console.info("====>receive isOsAccountActived data: " + JSON.stringify(data));
                done();
            });
        })

        /*
        * @tc.number  : ActsOsAccountIsActived_0600
        * @tc.name    : isOsAccountActived promise
        * @tc.desc    : Verify that the query active state is not received with parameter type mismatch
        */
        it('ActsOsAccountIsActived_0600', 0, async function (done) {
            console.info("====>ActsOsAccountIsActived_0600 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var localIdStr = "100";
            AccountManager.isOsAccountActived(localIdStr).then((data) => {
                console.info("====>get active status is: " + JSON.stringify(data));
                done();
            }).catch((err) => {
                expect(err.code != 0).assertEqual(true)
                console.info("====>ActsOsAccountIsActived_0600 err:" + JSON.stringify(err));
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountIsActived_0700
        * @tc.name    : isOsAccountActived callback
        * @tc.desc    : Verify that the query active state is not received with parameter undefined
        */
        it('ActsOsAccountIsActived_0700', 0, async function (done) {
            console.info("====>ActsOsAccountIsActived_0700 start");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.isOsAccountActived(undefined, (err, data) => {
                console.info("====>ActsOsAccountIsActived_0700 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true)
                console.info("====>receive isOsAccountActived data: " + JSON.stringify(data));
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountIsActived_0800
        * @tc.name    : isOsAccountActived promise
        * @tc.desc    : Verify that the query active state is not received with parameter undefined
        */
        it('ActsOsAccountIsActived_0800', 0, async function (done) {
            console.info("====>ActsOsAccountIsActived_0800 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>ActsOsAccountIsActived_0800 get os AccountManager finish====");
            AccountManager.isOsAccountActived(undefined).then((data) => {
                console.info("====>ActsOsAccountIsActived_0800 get active status is: " + JSON.stringify(data));
                done();
            }).catch((err) => {
                console.info("====>ActsOsAccountIsActived_0800 err:" + JSON.stringify(err))
                expect(err != 0).assertEqual(true);
                console.info("====>ActsOsAccountIsActived_0800 end====");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountIsMulty_0100
        * @tc.name    : isMultiOsAccountEnable callback
        * @tc.desc    : Check whether the function of supporting multiple os account is enabled
        */
        it('ActsOsAccountIsMulty_0100', 0, async function (done) {
            console.info("====>ActsOsAccountIsMulty_0100 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.isMultiOsAccountEnable((err, data) => {
                console.info("====>isMultiOsAccountEnable err:" + JSON.stringify(err));
                console.info("====>isMultiOsAccountEnable data:" + data);
                expect(err).assertEqual(null);
                expect(data !== null).assertTrue();
                console.info("====>ActsOsAccountIsMulty_0100 end====");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountIsMulty_0200
        * @tc.name    : isMultiOsAccountEnable promise
        * @tc.desc    : Check whether the function of supporting multiple os account is enabled
        */
        it('ActsOsAccountIsMulty_0200', 0, async function (done) {
            console.info("====>ActsOsAccountIsMulty_0200 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            try {
                var data = await AccountManager.isMultiOsAccountEnable();
            } catch (err) {
                console.info("====>catch isMultiOsAccountEnable err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>isMultiOsAccountEnable data:" + JSON.stringify(data));
            expect(data !== null).assertTrue();
            console.info("====>ActsOsAccountIsMulty_0200 end====");
            done();
        })

        /*
        * @tc.number  : ActsOsAccountVerified_0100
        * @tc.name    : isOsAccountVerified callback
        * @tc.desc    : Verify that the initial state query is unlocked to false
        */
        it('ActsOsAccountVerified_0100', 0, async function (done) {
            console.info("====>isOsAccountVerified_0100 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.isOsAccountVerified((err, data) => {
                console.info("====>isOsAccountVerified err:" + JSON.stringify(err));
                console.info("====>isOsAccountVerified data:" + data);
                expect(err).assertEqual(null);
                expect(data).assertEqual(true);
                console.info("====>ActsOsAccountVerified_0100 end====");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountVerified_0200
        * @tc.name    : isOsAccountVerified promise
        * @tc.desc    : Verify that the initial state query is unlocked to false
        */
        it('ActsOsAccountVerified_0200', 0, async function (done) {
            console.info("====>isOsAccountVerified_0200 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var isVerified = await AccountManager.isOsAccountVerified();
            console.info("====>isOsAccountVerified data:" + isVerified);
            expect(isVerified).assertEqual(true);
            console.info("====>ActsOsAccountVerified_0200 end====");
            done();
        })

        /*
        * @tc.number  : ActsOsAccountIsVerified_0300
        * @tc.name    : isOsAccountVerified callback
        * @tc.desc    : Verify that the initial state query 0 user is unlocked to false
        */
        it('ActsOsAccountIsVerified_0300', 0, async function (done) {
            console.info("====>ActsOsAccountIsVerified_0300 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.isOsAccountVerified(0, (err, data) => {
                console.info("====>isOsAccountVerified err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                expect(data).assertFalse();
                console.info("====>ActsOsAccountIsVerified_0300 end====");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountIsVerified_0400
        * @tc.name    : isOsAccountVerified promise
        * @tc.desc    : Verify that the initial state query 0 user is unlocked to false
        */
        it('ActsOsAccountIsVerified_0400', 0, async function (done) {
            console.info("====>ActsOsAccountIsVerified_0400 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var isVerified = await AccountManager.isOsAccountVerified(0);
            expect(isVerified).assertFalse();
            console.info("====>ActsOsAccountIsVerified_0400 end====");
            done();
        })

        /*
        * @tc.number  : ActsOsAccountIsVerified_0500
        * @tc.name    : isOsAccountVerified callback
        * @tc.desc    : Verify query "100" user is unlocked failed
        */
        it('ActsOsAccountIsVerified_0500', 0, async function (done) {
            console.info("====>ActsOsAccountIsVerified_0500 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var localIdStr = "100";
            AccountManager.isOsAccountVerified(localIdStr, (err, data) => {
                console.info("====>error received callback====");
                console.info("====>receive isOsAccountVerified err: " + JSON.stringify(err));
                expect(err).assertEqual(null);
                expect(data).assertEqual(true);
                console.info("====>receive isOsAccountVerified data: " + JSON.stringify(data));
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountIsVerified_0600
        * @tc.name    : isOsAccountVerified promise
        * @tc.desc    : Verify query "100" user is unlocked failed
        */
        it('ActsOsAccountIsVerified_0600', 0, async function (done) {
            console.info("====>ActsOsAccountIsVerified_0600 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var localIdStr = "100";
            AccountManager.isOsAccountVerified(localIdStr).then((data) => {
                expect(data).assertEqual(true);                                    //
                console.info("====>ActsOsAccountIsVerified_0600 end====");
                done();
            }).catch((err) => {
                console.info("====>get verified err: " + JSON.stringify(err));
                expect().assertFail()
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountIsVerified_0700
        * @tc.name    : isOsAccountVerified callback
        * @tc.desc    : Verify query undefined user is unlocked failed
        */
        it('ActsOsAccountIsVerified_0700', 0, async function (done) {
            console.info("====>ActsOsAccountIsVerified_0700 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var localIdUndefined = undefined;
            AccountManager.isOsAccountVerified(localIdUndefined, (err, data) => {
                console.info("====>ActsOsAccountIsVerified_0700 isOsAccountVerified_err:" + JSON.stringify(err))
                expect(err).assertEqual(null);
                console.info("====>ActsOsAccountIsVerified_0700 isOsAccountVerified_data:" + JSON.stringify(data))
                expect(data).assertEqual(true)
                console.info("====>ActsOsAccountIsVerified_0700 end====");
                done();
            });
        })

        /*
        * @tc.number  : ActsOsAccountIsVerified_0800
        * @tc.name    : isOsAccountVerified promise
        * @tc.desc    : Verify query undefined user is unlocked failed
        */
        it('ActsOsAccountIsVerified_0800', 0, async function (done) {
            console.info("====>ActsOsAccountIsVerified_0800 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var localIdUndefined = undefined;
            AccountManager.isOsAccountVerified(localIdUndefined).then((data) => {
                console.info("====>ActsOsAccountIsVerified_0800 isOsAccountVerified_data:" + JSON.stringify(data))
                expect(data).assertEqual(true)
                console.info("====>ActsOsAccountIsVerified_0700 end====");
                done();
            }).catch((err) => {
                console.info("====>ActsOsAccountIsVerified_0700 isOsAccountVerified_err:" + JSON.stringify(err))
                expect(err.code != 0).assertEqual(true)
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountIsVerified_0900
        * @tc.name    : isOsAccountVerified callback
        * @tc.desc    : Verify query does not exist user unlock failed
        */
        it('ActsOsAccountIsVerified_0900', 0, async function (done) {
            console.info("====>ActsOsAccountIsVerified_0900 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var osAccountLocalId = 1000;
            AccountManager.isOsAccountVerified(osAccountLocalId, (err) => {
                console.info("====>isOsAccountVerified err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsOsAccountIsVerified_0900 end====");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountIsVerified_1000
        * @tc.name    : isOsAccountVerified promise
        * @tc.desc    : Verify query does not exist user unlock failed
        */
        it('ActsOsAccountIsVerified_1000', 0, async function (done) {
            console.info("====>ActsOsAccountIsVerified_1000 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var osAccountLocalId = 1000;
            try {
                await AccountManager.isOsAccountVerified(osAccountLocalId);
            } catch (err) {
                console.info("====>isOsAccountVerified err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsOsAccountIsVerified_1000 end====");
                done();
            }
        })

        /*
        * @tc.number  : ActsOsAccountIsTest_0100
        * @tc.name    : isTestOsAccount callback
        * @tc.desc    : check whether this OS account is a test OS account
        */
        it('ActsOsAccountIsTest_0100', 0, async function (done) {
            console.info("====>ActsOsAccountIsTest_0100 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            AccountManager.isTestOsAccount((err, data) => {
                console.info("====>isTestOsAccount err:" + JSON.stringify(err));
                console.info("====>isTestOsAccount data:" + JSON.stringify(data));
                expect(err).assertEqual(null);
                expect(data).assertEqual(false);
                console.info("====>ActsOsAccountIsTest_0100 end====");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountIsTest_0200
        * @tc.name    : isTestOsAccount promise
        * @tc.desc    : check whether this OS account is a test OS account
        */
        it('ActsOsAccountIsTest_0200', 0, async function (done) {
            console.info("====>ActsOsAccountIsTest_0200 start====");
            var AccountManager = osAccount.getAccountManager();
            console.info("====>get os AccountManager finish====");
            var isTest = await AccountManager.isTestOsAccount();
            expect(isTest).assertFalse();
            console.info("====>ActsOsAccountIsTest_0200 end====");
            done();
        })
    })
}
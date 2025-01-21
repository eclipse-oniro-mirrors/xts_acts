/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, done } from '@ohos/hypium'

import account from '@ohos.account.distributedAccount'
const LOGININFO = {
    name: 'ZhangSan',
    id: '12345',
    event: "Ohos.account.event.LOGIN"
}
const LOGOUTINFO = {
    name: 'ZhangSan',
    id: '12345',
    event: "Ohos.account.event.LOGOUT"
}
export default function AccountTest() {
    describe('AccountTest', function () {
        beforeEach(function () {
        })
        afterEach(function () {
        })

        /**
        * @tc.number     ActsDistributedAccountDeviceId_0100
        * @tc.name       Test query the distribruted id by callback.
        * @tc.desc       Test distributedAccount.queryOsAccountDistributedInfo API functionality by callback.
        */
        it('ActsDistributedAccountDeviceId_0100', 0, async function(done){
            console.log("====>test query distribtued id start");
            const distributedId = '5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5'; //'12345'sha256的值
            const accountAbility = account.getDistributedAccountAbility();
            accountAbility.updateOsAccountDistributedInfo(LOGININFO, (err)=>{
                console.log("====>update distributedInfo err:" + JSON.stringify(err));
                accountAbility.queryOsAccountDistributedInfo((err, distributedInfo)=>{
                    console.log("====>query distributedInfo err:" + JSON.stringify(err));
                    console.log("====>query distributedInfo:" + JSON.stringify(distributedInfo));
                    expect(distributedInfo.name).assertEqual('ZhangSan');
                    expect(distributedInfo.id).assertEqual(distributedId);
                    console.debug('success')
                    accountAbility.updateOsAccountDistributedInfo(LOGOUTINFO, (err)=>{
                        console.debug('====>ActsDistributedAccountDeviceId_0100 logout_result:'+ JSON.stringify(err))
                        expect(err).assertEqual(undefined)
                        console.log("====>test query distribtued id end");
                        done();
                    })

                })
            })
        })

        /**
        * @tc.number     SUB_Account_distributedAccount_JS_API_0100
        * @tc.name       Test distributedAccount.getDistributedAccountAbility.
        * @tc.desc      Test distributedAccount.getDistributedAccountAbility API functionality.
        */
        it('account_getDistributedAccountAbility_test', 0, async function (done) {
            var ret = false;
            const accountAbility = account.getDistributedAccountAbility()
            console.debug("====>account_getDistributedAccountAbility_test result:" + JSON.stringify(accountAbility))
            if(accountAbility !== null){
                ret = true;
            }
            expect(ret).assertTrue()
            done();
        })

        /**
        * @tc.number     SUB_Account_distributedAccount_JS_API_0200
        * @tc.name       Test distributedAccount.queryOsAccountDistributedInfo.
        * @tc.desc       Test distributedAccount.queryOsAccountDistributedInfo API functionality.
        */
        it('account_queryOsAccountDistributedInfo_test001', 0, async function (done) {
            let accountAbility = account.getDistributedAccountAbility()
            accountAbility.queryOsAccountDistributedInfo().then(function (data) {
                console.debug('====>account_queryOsAccountDistributedInfo_test001 data:' + JSON.stringify(data))
                expect(data.name).assertEqual('ohosAnonymousName')
                expect(data.id).assertEqual('ohosAnonymousUid')
                done();
            });
        })

        /**
        * @tc.number     SUB_Account_distributedAccount_JS_API_0300
        * @tc.name       Test distributedAccount.queryOsAccountDistributedInfo by callback.
        * @tc.desc       Test distributedAccount.queryOsAccountDistributedInfo API functionality by callback.
        */
        it('account_queryOsAccountDistributedInfo_test002', 0, async function (done) {
            let accountAbility = account.getDistributedAccountAbility()
            accountAbility.queryOsAccountDistributedInfo(function (err, data) {
                console.debug('====>account_queryOsAccountDistributedInfo_test002 err:' + JSON.stringify(err))
                console.debug('====>account_queryOsAccountDistributedInfo_test002 data:' + JSON.stringify(data))
                expect(err).assertEqual(undefined)
                expect(data.name).assertEqual('ohosAnonymousName')
                expect(data.id).assertEqual('ohosAnonymousUid')
                done();
            });
        })

        /**
        * @tc.number     SUB_Account_distributedAccount_JS_API_0400
        * @tc.name       Test distributedAccount.updateOsAccountDistributedInfo.
        * @tc.desc       Test distributedAccount.updateOsAccountDistributedInfo API functionality.
        */
        it('account_updateOsAccountDistributedInfo_test001', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let data = null
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:data
            };
            accountAbility.updateOsAccountDistributedInfo(obj).then(function () {
                accountAbility.queryOsAccountDistributedInfo(function (err, data) {
                    console.debug('====>account_updateOsAccountDistributedInfo_test001 data:' + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id).assertEqual('12345')
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOUT'
                    };
                    accountAbility.updateOsAccountDistributedInfo(obj).then(function (err) {
                        expect(err).assertEqual(undefined)
                    });
                });
            });
            accountAbility.queryOsAccountDistributedInfo(function (data) {

                expect(data).assertEqual(undefined)
                done();
            })
        })

        /**
        * @tc.number     SUB_Account_distributedAccount_JS_API_0200
        * @tc.name       Test distributedAccount.updateOsAccountDistributedInfo by callback.
        * @tc.desc       Test distributedAccount.updateOsAccountDistributedInfo API functionality by callback.
        */
        it('account_updateOsAccountDistributedInfo_test002', 0,  async function (done)  {
            var accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{}
            };
            accountAbility.updateOsAccountDistributedInfo(obj, function () {
                accountAbility.queryOsAccountDistributedInfo(function (err, data) {
                    console.debug("====>account_updateOsAccountDistributedInfo_test002 data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id).assertEqual('5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5')
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOUT'
                    };
                    accountAbility.updateOsAccountDistributedInfo(obj).then(function (data) {
                        expect(data).assertEqual(undefined)
                        done();
                    });
                });
            });
        })

        /**
        * @tc.number     SUB_Account_distributedAccount_JS_API_0300
        * @tc.name       Test distributedAccount.updateOsAccountDistributedInfo by callback.
        * @tc.desc       Test distributedAccount.updateOsAccountDistributedInfo API functionality by callback.
        */
        it('account_updateOsAccountDistributedInfo_test003', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let data = null
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.TOKEN_INVALID',
                scalableData:data
            };
            accountAbility.updateOsAccountDistributedInfo(obj, function (result) {
                console.debug("====>account_updateOsAccountDistributedInfo_test003 update_err:" + JSON.stringify(result))
                accountAbility.queryOsAccountDistributedInfo(obj).then(function (data) {
                    console.debug("====>account_updateOsAccountDistributedInfo_test003 data:" + JSON.stringify(data))
                    expect(data.name).assertEqual("ohosAnonymousName")
                    done();
                })
            });
        })

        /**
        * @tc.number     SUB_Account_distributedAccount_JS_API_0500
        * @tc.name       Test distributedAccount.updateOsAccountDistributedInfo by callback.
        * @tc.desc       Test distributedAccount.updateOsAccountDistributedInfo API functionality by callback.
        */
        it('account_updateOsAccountDistributedInfo_test004', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{}
            };
            accountAbility.updateOsAccountDistributedInfo(obj, function (err) {
                console.debug("====>account_updateOsAccountDistributedInfo_test004 update_err:" + JSON.stringify(err))
                accountAbility.queryOsAccountDistributedInfo(function (err, data) {
                    console.debug("====>account_updateOsAccountDistributedInfo_test004 query_err:" + JSON.stringify(err))
                    console.debug("====>account_updateOsAccountDistributedInfo_test004 query_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id).assertEqual('5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5')
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    accountAbility.updateOsAccountDistributedInfo(obj).then(function (err) {
                        expect(err).assertEqual(undefined)
                        done();
                    });
                });
            });
        })
    })
}

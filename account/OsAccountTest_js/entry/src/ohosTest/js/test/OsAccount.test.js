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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

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
         * @tc.name   ActsDistributedAccountDeviceId_0100
         * @tc.number ActsDistributedAccountDeviceId_0100
         * @tc.desc   Test distributedAccount.queryOsAccountDistributedInfo API functionality by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsDistributedAccountDeviceId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done){
            console.info('====>ActsDistributedAccountDeviceId_0100 start====')
            try {
                console.log("====>test query distribtued id start");
                const accountAbility = account.getDistributedAccountAbility();
                accountAbility.updateOsAccountDistributedInfo(LOGININFO, (err)=>{
                    console.log("====>update distributedInfo err:" + JSON.stringify(err));
                    accountAbility.queryOsAccountDistributedInfo((err, distributedInfo)=>{
                        console.log("====>query distributedInfo err:" + JSON.stringify(err));
                        console.log("====>query distributedInfo:" + JSON.stringify(distributedInfo));
                        expect(distributedInfo.name).assertEqual('ZhangSan');
                        expect(distributedInfo.id !== 'ohosAnonymousUid').assertTrue()
                        let uid = distributedInfo.id
                        accountAbility.queryOsAccountDistributedInfo((err, distributedInfo)=>{
                            console.log("====>query distributedInfo err:" + JSON.stringify(err));
                            console.log("====>query distributedInfo:" + JSON.stringify(distributedInfo));
                            expect(distributedInfo.name).assertEqual('ZhangSan');
                            expect(distributedInfo.id).assertEqual(uid)
                            console.info('success')
                            accountAbility.updateOsAccountDistributedInfo(LOGOUTINFO, (err)=>{
                                console.info('====>ActsDistributedAccountDeviceId_0100 logout_result:'+ JSON.stringify(err))
                                expect(err).assertEqual(undefined)
                                console.log("====>test query distribtued id end");
                                done();
                            })
                        })
                    })
                })
            } catch (err){
                console.info('====>ActsDistributedAccountDeviceId_0100 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }

        })

        /**
         * @tc.name   account_getDistributedAccountAbility_test
         * @tc.number SUB_Account_distributedAccount_JS_API_0100
         * @tc.desc   Test distributedAccount.getDistributedAccountAbility API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('account_getDistributedAccountAbility_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('====>account_getDistributedAccountAbility_test start====')
            try {
                var ret = false;
                const accountAbility = account.getDistributedAccountAbility()
                console.info("====>account_getDistributedAccountAbility_test result:" + JSON.stringify(accountAbility))
                if(accountAbility !== null){
                    ret = true;
                }
                expect(ret).assertTrue()
                done();
            } catch (err){
                console.info('====>ActsDistributedAccountDeviceId_0100 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
         * @tc.name   account_queryOsAccountDistributedInfo_test001
         * @tc.number SUB_Account_distributedAccount_JS_API_0200
         * @tc.desc   Test distributedAccount.queryOsAccountDistributedInfo API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('account_queryOsAccountDistributedInfo_test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            console.info('====>account_queryOsAccountDistributedInfo_test001 start====')
            try {
                let accountAbility = account.getDistributedAccountAbility()
                accountAbility.queryOsAccountDistributedInfo().then(function (data) {
                    console.info('====>account_queryOsAccountDistributedInfo_test001 data:' + JSON.stringify(data))
                    expect(data.name).assertEqual('ohosAnonymousName')
                    expect(data.id).assertEqual('ohosAnonymousUid')
                    done();
                });
            } catch (err){
                console.info('====>account_queryOsAccountDistributedInfo_test001 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
         * @tc.name   account_queryOsAccountDistributedInfo_test002
         * @tc.number SUB_Account_distributedAccount_JS_API_0300
         * @tc.desc   Test distributedAccount.queryOsAccountDistributedInfo API functionality by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('account_queryOsAccountDistributedInfo_test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            console.info('====>account_queryOsAccountDistributedInfo_test002 start')
            try {
                let accountAbility = account.getDistributedAccountAbility()
                accountAbility.queryOsAccountDistributedInfo(function (err, data) {
                    console.info('====>account_queryOsAccountDistributedInfo_test002 err:' + JSON.stringify(err))
                    console.info('====>account_queryOsAccountDistributedInfo_test002 data:' + JSON.stringify(data))
                    expect(err).assertEqual(undefined)
                    expect(data.name).assertEqual('ohosAnonymousName')
                    expect(data.id).assertEqual('ohosAnonymousUid')
                    done();
                });
            } catch (err){
                console.info('====>account_queryOsAccountDistributedInfo_test002 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
         * @tc.name   account_updateOsAccountDistributedInfo_test001
         * @tc.number SUB_Account_distributedAccount_JS_API_0400
         * @tc.desc   Test distributedAccount.updateOsAccountDistributedInfo API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('account_updateOsAccountDistributedInfo_test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            console.info('====>account_updateOsAccountDistributedInfo_test001 start====')
            const accountAbility = account.getDistributedAccountAbility()
            let data = null
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:data
            };
            try {
                await accountAbility.updateOsAccountDistributedInfo(obj).then(function () {
                    accountAbility.queryOsAccountDistributedInfo(async function (err, data) {
                        console.info('====>account_updateOsAccountDistributedInfo_test001 data:' + JSON.stringify(data))
                        expect(data.name).assertEqual('ZhangSan')
                        expect(data.id !== 'ohosAnonymousUid').assertTrue()
                        let obj = {
                            id: '12345',
                            name: 'ZhangSan',
                            event: 'Ohos.account.event.LOGOUT'
                        };
                        await accountAbility.updateOsAccountDistributedInfo(obj).then(function (err) {
                            expect(err).assertEqual(undefined)
							done();
                        });
                    });
                });
            } catch (err){
                console.info('====>account_updateOsAccountDistributedInfo_test001 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
         * @tc.name   account_updateOsAccountDistributedInfo_test002
         * @tc.number SUB_Account_distributedAccount_JS_API_0500
         * @tc.desc   Test distributedAccount.updateOsAccountDistributedInfo API functionality by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('account_updateOsAccountDistributedInfo_test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async function (done)  {
            console.info('====>account_updateOsAccountDistributedInfo_test002 start====')
            var accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{}
            };
            try {
                accountAbility.updateOsAccountDistributedInfo(obj, function () {
                    accountAbility.queryOsAccountDistributedInfo(async function (err, data) {
                        console.info("====>account_updateOsAccountDistributedInfo_test002 data:" + JSON.stringify(data))
                        expect(data.name).assertEqual('ZhangSan')
                        expect(data.id !== 'ohosAnonymousUid').assertTrue()
                        let obj = {
                            id: '12345',
                            name: 'ZhangSan',
                            event: 'Ohos.account.event.LOGOUT'
                        };
                        await accountAbility.updateOsAccountDistributedInfo(obj).then(function (err) {
                            expect(err).assertEqual(undefined)
                            done();
                        });
                    });
                });
            } catch (err){
                console.info('====>account_updateOsAccountDistributedInfo_test002 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
         * @tc.name   account_updateOsAccountDistributedInfo_test003
         * @tc.number SUB_Account_distributedAccount_JS_API_0600
         * @tc.desc   Test distributedAccount.updateOsAccountDistributedInfo API functionality by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('account_updateOsAccountDistributedInfo_test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            console.info('====>account_updateOsAccountDistributedInfo_test003 start====')
            const accountAbility = account.getDistributedAccountAbility()
            let data = null
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.TOKEN_INVALID',
                scalableData:data
            };
            try {
                accountAbility.updateOsAccountDistributedInfo(obj, async function (result) {
                    console.info("====>account_updateOsAccountDistributedInfo_test003 update_err:" + JSON.stringify(result))
                    await accountAbility.queryOsAccountDistributedInfo(obj).then(function (data) {
                        console.info("====>account_updateOsAccountDistributedInfo_test003 data:" + JSON.stringify(data))
                        expect(data.name).assertEqual("ohosAnonymousName")
                        done();
                    })
                });
            } catch (err){
                console.info('====>account_updateOsAccountDistributedInfo_test003 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
         * @tc.name   account_updateOsAccountDistributedInfo_test004
         * @tc.number SUB_Account_distributedAccount_JS_API_0700
         * @tc.desc   Test distributedAccount.updateOsAccountDistributedInfo API functionality by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('account_updateOsAccountDistributedInfo_test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            console.info('====>account_updateOsAccountDistributedInfo_test004 start====')
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{}
            };
            try {
                accountAbility.updateOsAccountDistributedInfo(obj, function (err) {
                    console.info("====>account_updateOsAccountDistributedInfo_test004 update_err:" + JSON.stringify(err))
                    accountAbility.queryOsAccountDistributedInfo(async function (err, data) {
                        console.info("====>account_updateOsAccountDistributedInfo_test004 query_err:" + JSON.stringify(err))
                        console.info("====>account_updateOsAccountDistributedInfo_test004 query_data:" + JSON.stringify(data))
                        expect(data.name).assertEqual('ZhangSan')
                        expect(data.id !== 'ohosAnonymousUid').assertTrue()
                        let obj = {
                            id: '12345',
                            name: 'ZhangSan',
                            event: 'Ohos.account.event.LOGOFF'
                        };
                        await accountAbility.updateOsAccountDistributedInfo(obj).then(function (err) {
                            expect(err).assertEqual(undefined)
                            done();
                        });
                    });
                });
            } catch (err){
                console.info('====>account_updateOsAccountDistributedInfo_test004 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
         * @tc.name   account_updateOsAccountDistributedInfo_test005
         * @tc.number SUB_Account_distributedAccount_JS_API_0800
         * @tc.desc   Test distributedAccount.updateOsAccountDistributedInfo API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('account_updateOsAccountDistributedInfo_test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info('====>account_updateOsAccountDistributedInfo_test005 start====')
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:undefined,
                nickname:undefined,
                avatar:undefined,
                status:undefined
            };
            try {
                await accountAbility.updateOsAccountDistributedInfo(obj).then(function () {
                    accountAbility.queryOsAccountDistributedInfo(async function (err, data) {
                        console.info('====>account_updateOsAccountDistributedInfo_test005 data:' + JSON.stringify(data))
                        expect(data.name).assertEqual('ZhangSan')
                        expect(data.id !== 'ohosAnonymousUid').assertTrue()
                        let obj = {
                            id: '12345',
                            name: 'ZhangSan',
                            event: 'Ohos.account.event.LOGOUT',
                            scalableData:undefined,
                            nickname:undefined,
                            avatar:undefined,
                            status:undefined
                        };
                        await accountAbility.updateOsAccountDistributedInfo(obj).then(function (err) {
                            expect(err).assertEqual(undefined)
                            done()
                        });
                    });
                });
            } catch (err){
                console.info('====>account_updateOsAccountDistributedInfo_test005 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
         * @tc.name   account_updateOsAccountDistributedInfo_test006
         * @tc.number SUB_Account_distributedAccount_JS_API_0900
         * @tc.desc   Test distributedAccount.updateOsAccountDistributedInfo API functionality by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('account_updateOsAccountDistributedInfo_test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async function (done)  {
            console.info('====>account_updateOsAccountDistributedInfo_test006 start====')
            var accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:undefined,
                nickname:undefined,
                avatar:undefined,
                status:undefined
            };
            try {
                accountAbility.updateOsAccountDistributedInfo(obj, function () {
                    accountAbility.queryOsAccountDistributedInfo(async function (err, data) {
                        console.info("====>account_updateOsAccountDistributedInfo_test006 data:" + JSON.stringify(data))
                        expect(data.name).assertEqual('ZhangSan')
                        expect(data.id !== 'ohosAnonymousUid').assertTrue()
                        let obj = {
                            id: '12345',
                            name: 'ZhangSan',
                            event: 'Ohos.account.event.LOGOUT'
                        };
                        await accountAbility.updateOsAccountDistributedInfo(obj).then(function (data) {
                            expect(data).assertEqual(undefined)
                            done();
                        });
                    });
                });
            } catch (err){
                console.info('====>account_updateOsAccountDistributedInfo_test006 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
         * @tc.name   account_updateOsAccountDistributedInfo_test007
         * @tc.number SUB_Account_distributedAccount_JS_API_1000
         * @tc.desc   Test distributedAccount.updateOsAccountDistributedInfo API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('account_updateOsAccountDistributedInfo_test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info('====>account_updateOsAccountDistributedInfo_test007 start====')
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:null,
                nickname:null,
                avatar:null,
                status:null
            };
            try {
                await accountAbility.updateOsAccountDistributedInfo(obj).then(function () {
                    accountAbility.queryOsAccountDistributedInfo(async function (err, data) {
                        console.info('====>account_updateOsAccountDistributedInfo_test007 data:' + JSON.stringify(data))
                        expect(data.name).assertEqual('ZhangSan')
                        expect(data.id !== 'ohosAnonymousUid').assertTrue()
                        let obj = {
                            id: '12345',
                            name: 'ZhangSan',
                            event: 'Ohos.account.event.LOGOUT'
                        };
                        await accountAbility.updateOsAccountDistributedInfo(obj).then(function (err) {
                            expect(err).assertEqual(undefined)
                            done()
                        });
                    });
                });
            } catch (err){
                console.info('====>account_updateOsAccountDistributedInfo_test007 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
         * @tc.name   account_updateOsAccountDistributedInfo_test008
         * @tc.number SUB_Account_distributedAccount_JS_API_1100
         * @tc.desc   Test distributedAccount.updateOsAccountDistributedInfo API functionality by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('account_updateOsAccountDistributedInfo_test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async function (done)  {
            console.info('====>account_updateOsAccountDistributedInfo_test008 start====')
            var accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:null,
                nickname:null,
                avatar:null,
                status:null
            };
            try {
                accountAbility.updateOsAccountDistributedInfo(obj, function () {
                    accountAbility.queryOsAccountDistributedInfo(async function (err, data) {
                        console.info("====>account_updateOsAccountDistributedInfo_test008 data:" + JSON.stringify(data))
                        expect(data.name).assertEqual('ZhangSan')
                        expect(data.id !== 'ohosAnonymousUid').assertTrue()
                        let obj = {
                            id: '12345',
                            name: 'ZhangSan',
                            event: 'Ohos.account.event.LOGOUT'
                        };
                        await accountAbility.updateOsAccountDistributedInfo(obj).then(function (data) {
                            expect(data).assertEqual(undefined)
                            done();
                        });
                    });
                });
            } catch (err){
                console.info('====>account_updateOsAccountDistributedInfo_test008 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
         * @tc.name   account_updateOsAccountDistributedInfo_test009
         * @tc.number SUB_Account_distributedAccount_JS_API_1200
         * @tc.desc   Test distributedAccount.updateOsAccountDistributedInfo API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('account_updateOsAccountDistributedInfo_test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info('====>account_updateOsAccountDistributedInfo_test009 start====')
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN'
            };
            try {
                await accountAbility.updateOsAccountDistributedInfo(obj).then(function () {
                    accountAbility.queryOsAccountDistributedInfo(async function (err, data) {
                        console.info('====>account_updateOsAccountDistributedInfo_test009 data:' + JSON.stringify(data))
                        expect(data.name).assertEqual('ZhangSan')
                        expect(data.id !== 'ohosAnonymousUid').assertTrue()
                        let obj = {
                            id: '12345',
                            name: 'ZhangSan',
                            event: 'Ohos.account.event.LOGOUT'
                        };
                        await accountAbility.updateOsAccountDistributedInfo(obj).then(function (err) {
                            expect(err).assertEqual(undefined)
                            done()
                        });
                    });
                });
            } catch (err){
                console.info('====>account_updateOsAccountDistributedInfo_test009 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
         * @tc.name   account_updateOsAccountDistributedInfo_test010
         * @tc.number SUB_Account_distributedAccount_JS_API_1300
         * @tc.desc   Test distributedAccount.updateOsAccountDistributedInfo API functionality by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('account_updateOsAccountDistributedInfo_test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async function (done)  {
            console.info('====>account_updateOsAccountDistributedInfo_test010 start====')
            var accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN'
            };
            try {
                accountAbility.updateOsAccountDistributedInfo(obj, function () {
                    accountAbility.queryOsAccountDistributedInfo(async function (err, data) {
                        console.info("====>account_updateOsAccountDistributedInfo_test010 data:" + JSON.stringify(data))
                        expect(data.name).assertEqual('ZhangSan')
                        expect(data.id !== 'ohosAnonymousUid').assertTrue()
                        let obj = {
                            id: '12345',
                            name: 'ZhangSan',
                            event: 'Ohos.account.event.LOGOUT'
                        };
                        await accountAbility.updateOsAccountDistributedInfo(obj).then(function (data) {
                            expect(data).assertEqual(undefined)
                            done();
                        });
                    });
                });
            } catch (err){
                console.info('====>account_updateOsAccountDistributedInfo_test010 err:' + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })
    })
}

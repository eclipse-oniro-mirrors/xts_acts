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
const LIMIT = 1024
export default function ActsDAGetSetTest() {
    describe('ActsDAGetSetTest', function () {
        beforeEach(function () {
        })
        afterEach(function () {
        })

        /**
        * @tc.number     ActsDADeviceId_0100
        * @tc.name       Test query the distribruted id by callback.
        * @tc.desc       Test distributedAccount.getOsAccountDistributedInfo API functionality by callback.
        */
        it('ActsDADeviceId_0100', 0, async function(done){
            console.log("====>ActsDADeviceId_0100 test query distribtued id start");
            const distributedId = '5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5'; //'12345'sha256的值
            const accountAbility = account.getDistributedAccountAbility();
            accountAbility.setOsAccountDistributedInfo(LOGININFO, (err)=>{
                console.log("====>ActsDADeviceId_0100 set distributedInfo err:" + JSON.stringify(err));
                accountAbility.getOsAccountDistributedInfo((err, distributedInfo)=>{
                    console.log("====>ActsDADeviceId_0100 get distributedInfo err:" + JSON.stringify(err));
                    console.log("====>ActsDADeviceId_0100 get distributedInfo:" + JSON.stringify(distributedInfo));
                    expect(distributedInfo.name).assertEqual('ZhangSan');
                    expect(distributedInfo.id).assertEqual(distributedId);
                    accountAbility.setOsAccountDistributedInfo(LOGOUTINFO, (err)=>{
                        console.debug('====>ActsDADeviceId_0100 logout_result:'+ JSON.stringify(err))
                        expect(err).assertEqual(null)
                        console.log("====>test query distribtued id end");
                        done();
                    })
                })
            })
        })

        /**
        * @tc.number     getDistributedAccountAbility_test
        * @tc.name       Test distributedAccount.getDistributedAccountAbility.
        * @tc.desc      Test distributedAccount.getDistributedAccountAbility API functionality.
        */
        it('getDistributedAccountAbility_test', 0, async function (done) {
            var ret = false;
            const accountAbility = account.getDistributedAccountAbility()
            console.debug("====>getDistributedAccountAbility_test result:" + JSON.stringify(accountAbility))
            if(accountAbility !== null){
                ret = true;
            }
            expect(ret).assertTrue()
            done();
        })

        /**
        * @tc.number     getOsAccountDistributedInfo_test001
        * @tc.name       Test distributedAccount.getOsAccountDistributedInfo.
        * @tc.desc       Test distributedAccount.getOsAccountDistributedInfo API functionality.
        */
        it('getOsAccountDistributedInfo_test001', 0, async function (done) {
            let accountAbility = account.getDistributedAccountAbility()
            accountAbility.getOsAccountDistributedInfo().then(function (data) {
                console.debug('====>getOsAccountDistributedInfo_test001 data:' + JSON.stringify(data))
                expect(data.name).assertEqual('ohosAnonymousName')
                expect(data.id).assertEqual('ohosAnonymousUid')
                done();
            });
        })

        /**
        * @tc.number     getOsAccountDistributedInfo_test002
        * @tc.name       Test distributedAccount.getOsAccountDistributedInfo by callback.
        * @tc.desc       Test distributedAccount.getOsAccountDistributedInfo API functionality by callback.
        */
        it('getOsAccountDistributedInfo_test002', 0, async function (done) {
            let accountAbility = account.getDistributedAccountAbility()
            accountAbility.getOsAccountDistributedInfo(function (err, data) {
                console.debug('====>getOsAccountDistributedInfo_test002 err:' + JSON.stringify(err))
                console.debug('====>getOsAccountDistributedInfo_test002 data:' + JSON.stringify(data))
                expect(err).assertEqual(null)
                expect(data.name).assertEqual('ohosAnonymousName')
                expect(data.id).assertEqual('ohosAnonymousUid')
                done();
            });
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test001
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality.
        */
        it('setOsAccountDistributedInfo_test001', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{}
            };
            accountAbility.setOsAccountDistributedInfo(obj).then(function () {
                accountAbility.getOsAccountDistributedInfo(function (err, data) {
                    console.debug('====>setOsAccountDistributedInfo_test001 ccerr:' + JSON.stringify(err))
                    console.debug('====>setOsAccountDistributedInfo_test001 data:' + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id).assertEqual('5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5')
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOUT'
                    };
                    accountAbility.setOsAccountDistributedInfo(obj).then(function () {
                        accountAbility.getOsAccountDistributedInfo(function (err, data) {
                            console.debug('====>setOsAccountDistributedInfo_test001 get ccerr:' + JSON.stringify(err))
                            console.debug('====>setOsAccountDistributedInfo_test001 get ccdata:' + JSON.stringify(data))
                            expect(err).assertEqual(null)
                            done();
                        })
                    }).catch((err) => {
                        console.debug('====>setOsAccountDistributedInfo_test001 ccerr:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    })
                });
            });
            
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test002
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo by callback.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        */
        it('setOsAccountDistributedInfo_test002', 0,  async function (done)  {
            var accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{}
            };
            accountAbility.setOsAccountDistributedInfo(obj, function (err) {
                console.debug('====>setOsAccountDistributedInfo_test002 ccerr callback:' + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfo(function (err, data) {
                    console.debug('====>setOsAccountDistributedInfo_test002 get ccerr:' + JSON.stringify(err))
                    console.debug("====>setOsAccountDistributedInfo_test002 get data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id).assertEqual('5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5')
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOUT'
                    };
                    accountAbility.setOsAccountDistributedInfo(obj).then(function () {
                        done();
                    }).catch((err) => {
                        console.debug('====>setOsAccountDistributedInfo_test002 set ccerr:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    });
                });
            });
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test003
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo by callback.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        */
        it('setOsAccountDistributedInfo_test003', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.TOKEN_INVALID',
                scalableData:{}
            };
            accountAbility.setOsAccountDistributedInfo(obj, async (err)=> {
                console.debug("====>setOsAccountDistributedInfo_test003 set_err:" + JSON.stringify(err))
                expect(err.code).assertEqual(12300001)
                done();
            });
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test004
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo by callback.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        */
        it('setOsAccountDistributedInfo_test004', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{}
            };
            accountAbility.setOsAccountDistributedInfo(obj, async (err)=>{
                console.debug("====>setOsAccountDistributedInfo_test004 update_err:" + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfo(async (err, data) => {
                    console.debug("====>setOsAccountDistributedInfo_test004 query_err:" + JSON.stringify(err))
                    console.debug("====>setOsAccountDistributedInfo_test004 query_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id).assertEqual('5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5')
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    try{
                        await accountAbility.setOsAccountDistributedInfo(obj)
                        console.debug('====>setOsAccountDistributedInfo_test004 end')
                        done();
                    }catch(err){
                        console.debug('====>setOsAccountDistributedInfo_test004 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    }
                });
            });
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test005
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo by callback.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                    normal nickname
        */
        it('setOsAccountDistributedInfo_test005', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{},
                nickname:'test'
            };
            accountAbility.setOsAccountDistributedInfo(obj, function (err) {
                console.debug("====>updateOsAccountDistributedInfo_test005 set_err:" + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfo(async (err, data) => {
                    console.debug("====>updateOsAccountDistributedInfo_test005 get_err:" + JSON.stringify(err))
                    console.debug("====>updateOsAccountDistributedInfo_test005 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id).assertEqual('5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5')
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.debug("====>start LOGOFF")
                    try{
                        await accountAbility.setOsAccountDistributedInfo(obj)
                        console.debug('====>setOsAccountDistributedInfo_test005 end')
                        done();
                    }catch(err){
                        console.debug('====>setOsAccountDistributedInfo_test005 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    }
                });
            });
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test006
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo by promise.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *                   normal nickname
        */
        it('setOsAccountDistributedInfo_test006', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData: {},
                nickname: 'test'
            };
            accountAbility.setOsAccountDistributedInfo(obj).then(() => {
                accountAbility.getOsAccountDistributedInfo(function (err, data) {
                    console.debug("====>setOsAccountDistributedInfo_test006 get_err:" + JSON.stringify(err))
                    console.debug("====>setOsAccountDistributedInfo_test006 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id).assertEqual('5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5')
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.debug("====>start LOGOFF")
                    accountAbility.setOsAccountDistributedInfo(obj).then(function (err) {
                        console.debug("====>LOGOFF err:" + JSON.stringify(err))
                        expect(err).assertEqual(null)
                        done();
                    });
                })
                    .catch((err) => {
                        console.debug("====>setOsAccountDistributedInfo_test006 update_err:" + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    })
            })
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test007
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo by callback.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                    normal avatar
        */
        it('setOsAccountDistributedInfo_test007', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{},
                avatar:'test'
            };
            accountAbility.setOsAccountDistributedInfo(obj, (err) => {
                console.debug("====>setOsAccountDistributedInfo_test007 set_err:" + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfo(async (err, data) =>{
                    console.debug("====>setOsAccountDistributedInfo_test007 get_err:" + JSON.stringify(err))
                    console.debug("====>setOsAccountDistributedInfo_test007 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id).assertEqual('5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5')
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.debug("====>start LOGOFF")
                    try{
                        await accountAbility.setOsAccountDistributedInfo(obj)
                        console.debug('====>setOsAccountDistributedInfo_test007 end')
                        done();
                    }catch(err){
                        console.debug('====>setOsAccountDistributedInfo_test007 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    }
                });
            });
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test008
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo by promise.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *                   normal avatar
        */
        it('setOsAccountDistributedInfo_test008', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{},
                avatar:'test'
            };
            accountAbility.setOsAccountDistributedInfo(obj).then(() => {
                accountAbility.getOsAccountDistributedInfo((err, data) => {
                    console.debug("====>setOsAccountDistributedInfo_test008 get_err:" + JSON.stringify(err))
                    console.debug("====>setOsAccountDistributedInfo_test008 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id).assertEqual('5994471ABB01112AFCC18159F6CC74B4F511B99806DA59B3CAF5A9C173CACFC5')
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.debug("====>start LOGOFF")
                    accountAbility.setOsAccountDistributedInfo(obj).then(() => {
                        console.debug('====>setOsAccountDistributedInfo_test008 end')
                        done();
                    }).catch((err) => {
                        console.debug('====>setOsAccountDistributedInfo_test008 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    })
                });
            }).catch(() => {
                console.debug("====>setOsAccountDistributedInfo_test008 throw_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test009
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo by callback.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                   overlength nickname 21
        */
        it('setOsAccountDistributedInfo_test009', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            var limitNickName = '';
            for (var i = 0; i < 1025; i++) {
                limitNickName += 'n';
            }
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{},
                nickname:limitNickName,
                avatar:'test'
            };
            accountAbility.setOsAccountDistributedInfo(obj, (err)=>{
                console.debug("====>setOsAccountDistributedInfo_test009 set_err:" + JSON.stringify(err))
                expect(err.code).assertEqual(12300001);
                done();
            })
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test010
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo by promise.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *               overlength nickname 21
        */
        it('setOsAccountDistributedInfo_test010', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            var limitNickName = '';
            for (var i = 0; i < 1025; i++) {
                limitNickName += 'n';
            }
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{},
                nickname:limitNickName,
                avatar:'test'
            };
            accountAbility.setOsAccountDistributedInfo(obj).then(() => {
                console.debug("====>setOsAccountDistributedInfo_test010 err:" + JSON.stringify(err))
                expect().assertFail()
                done();
            }).catch((err) => {
                console.debug("====>setOsAccountDistributedInfo_test010 throw_err:" + JSON.stringify(err))
                expect(err.code).assertEqual(12300001);
                done();
            })
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test011
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo by callback.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                   overlength avatar 3*1024*1024+1
        */
        it('setOsAccountDistributedInfo_test011', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            var limitAvatar = ''.padEnd(10 * 1024 * 1024 + 1, 'o')          
            console.debug('====>setOsAccountDistributedInfo_test011 avatar_length:' + limitAvatar.length)
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{},
                avatar: limitAvatar
            };
            console.debug(JSON.stringify(obj))
            accountAbility.setOsAccountDistributedInfo(obj, (err)=>{
                console.debug("====>setOsAccountDistributedInfo_test011 update_err:" + JSON.stringify(err))
                expect(err.code).assertEqual(12300001);
                done();
            })
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test012
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo by peomise.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality by peomise.
        *                   overlength avatar 3*1024*1024+1
        */
        it('setOsAccountDistributedInfo_test012', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            var limitAvatar = ''.padEnd(10 * 1024 * 1024 + 1, 'o')          
            console.debug(limitAvatar.length)
            console.debug('====>setOsAccountDistributedInfo_test012 avatar_length:' + limitAvatar.length)
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{},
                avatar: limitAvatar
            };
            try{
                await accountAbility.setOsAccountDistributedInfo(obj)
                console.debug("====>setOsAccountDistributedInfo_test012 set_err:" + JSON.stringify(err))
                expect().assertFail()
                done();
            }catch(err){
                console.debug("====>setOsAccountDistributedInfo_test012 throw_err:" + JSON.stringify(err))
                expect(err.code).assertEqual(12300001);
                done();
            }
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test013
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo by callback.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                   overlength scalableData
        */
        it('setOsAccountDistributedInfo_test013', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            var limitInfo = {};
            for (var i = 0; i < 513; i++) {
                limitInfo = Object.assign(limitInfo, {[i]:i})
            }
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:limitInfo,
            };
            console.debug(JSON.stringify(obj))
            accountAbility.setOsAccountDistributedInfo(obj, (err)=>{
                console.debug("====>setOsAccountDistributedInfo_test013 update_err:" + JSON.stringify(err))
                expect(err.code).assertEqual(12300001);
                done();
            })
        })

        /**
        * @tc.number     setOsAccountDistributedInfo_test014
        * @tc.name       Test distributedAccount.setOsAccountDistributedInfo by promise.
        * @tc.desc       Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *                 overlength scalableData
        */
        it('setOsAccountDistributedInfo_test014', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            var limitInfo = {};
            for (var i = 0; i < 513; i++) {
                limitInfo = Object.assign(limitInfo, {[i]:i})
            }
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:limitInfo,
            };
            try{
                await accountAbility.setOsAccountDistributedInfo(obj)
                expect().assertFail()
                done();
            }catch(err){
                console.debug("====>setOsAccountDistributedInfo_test014 throw_err:" + JSON.stringify(err))
                expect(err.code).assertEqual(12300001)
                done();
            }
        })
    })
}

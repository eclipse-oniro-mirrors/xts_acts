/*
 * Copyright (C) 2021-2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

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

export default function ActsDAGetSetTest() {
    describe('ActsDAGetSetTest', function () {
        beforeEach(function () {
        })
        afterEach(function () {
        })

        /**
        * @tc.number   : ActsDADeviceId_0100
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.getOsAccountDistributedInfo API functionality by callback.
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('ActsDADeviceId_0100', 0, async function(done){
            console.log("====>ActsDADeviceId_0100 test query distribtued id start");
            const accountAbility = account.getDistributedAccountAbility();
            accountAbility.setOsAccountDistributedInfo(LOGININFO, (err)=>{
                console.log("====>ActsDADeviceId_0100 set distributedInfo err:" + JSON.stringify(err));
                accountAbility.getOsAccountDistributedInfo((err, distributedInfo)=>{
                    console.log("====>ActsDADeviceId_0100 get distributedInfo err:" + JSON.stringify(err));
                    console.log("====>ActsDADeviceId_0100 get distributedInfo:" + JSON.stringify(distributedInfo));
                    expect(distributedInfo.name).assertEqual('ZhangSan');
                    expect(distributedInfo.id !== 'ohosAnonymousUid').assertTrue()
                    let uid = distributedInfo.id
                    accountAbility.getOsAccountDistributedInfo((err, distributedInfo)=>{
                        console.log("====>ActsDADeviceId_0100 get distributedInfo err:" + JSON.stringify(err));
                        console.log("====>ActsDADeviceId_0100 get distributedInfo:" + JSON.stringify(distributedInfo));
                        expect(distributedInfo.name).assertEqual('ZhangSan');
                        expect(distributedInfo.id).assertEqual(uid)
                        accountAbility.setOsAccountDistributedInfo(LOGOUTINFO, (err)=>{
                            console.info('====>ActsDADeviceId_0100 logout_result:'+ JSON.stringify(err))
                            expect(err).assertEqual(null)
                            console.log("====>test query distribtued id end");
                            done();
                        })
                    })
                })
            })
        })

        /**
        * @tc.number   : getDistributedAccountAbility_test
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.getDistributedAccountAbility API functionality.
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('getDistributedAccountAbility_test', 0, async function (done) {
            var ret = false;
            const accountAbility = account.getDistributedAccountAbility()
            console.info("====>getDistributedAccountAbility_test result:" + JSON.stringify(accountAbility))
            if(accountAbility !== null){
                ret = true;
            }
            expect(ret).assertTrue()
            done();
        })

        /**
        * @tc.number   : getOsAccountDistributedInfo_test001
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.getOsAccountDistributedInfo API functionality.
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('getOsAccountDistributedInfo_test001', 0, async function (done) {
            let accountAbility = account.getDistributedAccountAbility()
            accountAbility.getOsAccountDistributedInfo().then( (data) => {
                console.info('====>getOsAccountDistributedInfo_test001 data:' + JSON.stringify(data))
                expect(data.name).assertEqual('ohosAnonymousName')
                expect(data.id).assertEqual('ohosAnonymousUid')
                expect(data.status).assertEqual(0)
                done();
            });
        })

        /**
        * @tc.number   : getOsAccountDistributedInfo_test002
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.getOsAccountDistributedInfo API functionality by callback.
               * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('getOsAccountDistributedInfo_test002', 0, async function (done) {
            let accountAbility = account.getDistributedAccountAbility()
            accountAbility.getOsAccountDistributedInfo((err, data) => {
                console.info('====>getOsAccountDistributedInfo_test002 err:' + JSON.stringify(err))
                console.info('====>getOsAccountDistributedInfo_test002 data:' + JSON.stringify(data))
                expect(err).assertEqual(null)
                expect(data.name).assertEqual('ohosAnonymousName')
                expect(data.id).assertEqual('ohosAnonymousUid')
                expect(data.status).assertEqual(0)
                done();
            });
        })

        /**
        * @tc.number   : getOsAccountDistributedInfoByLocalId_test001
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.getOsAccountDistributedInfo API functionality.
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('getOsAccountDistributedInfoByLocalId_test001', 0, async function (done) {
            let accountAbility = account.getDistributedAccountAbility()
            accountAbility.getOsAccountDistributedInfoByLocalId(100).then(function (data) {
                console.info('====>getOsAccountDistributedInfoByLocalId_test001 data:' + JSON.stringify(data))
                expect(data.name).assertEqual('ohosAnonymousName')
                expect(data.id).assertEqual('ohosAnonymousUid')
                expect(data.status).assertEqual(0)
                done();
            });
        })

        /**
        * @tc.number   : getOsAccountDistributedInfoByLocalId_test002
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.getOsAccountDistributedInfo API functionality by callback.
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('getOsAccountDistributedInfoByLocalId_test002', 0, async function (done) {
            let accountAbility = account.getDistributedAccountAbility()
            accountAbility.getOsAccountDistributedInfoByLocalId(100, function (err, data) {
                console.info('====>getOsAccountDistributedInfoByLocalId_test002 err:' + JSON.stringify(err))
                console.info('====>getOsAccountDistributedInfoByLocalId_test002 data:' + JSON.stringify(data))
                expect(err).assertEqual(null)
                expect(data.name).assertEqual('ohosAnonymousName')
                expect(data.id).assertEqual('ohosAnonymousUid')
                expect(data.status).assertEqual(0)
                done();
            });
        })

        /**
        * @tc.number   : setOsAccountDistributedInfo_test001
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality.
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
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
                    console.info('====>setOsAccountDistributedInfo_test001 ccerr:' + JSON.stringify(err))
                    console.info('====>setOsAccountDistributedInfo_test001 data:' + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOUT'
                    };
                    accountAbility.setOsAccountDistributedInfo(obj).then(function () {
                        accountAbility.getOsAccountDistributedInfo(function (err, data) {
                            console.info('====>setOsAccountDistributedInfo_test001 get ccerr:' + JSON.stringify(err))
                            console.info('====>setOsAccountDistributedInfo_test001 get ccdata:' + JSON.stringify(data))
                            expect(err).assertEqual(null)
                            done();
                        })
                    }).catch((err) => {
                        console.info('====>setOsAccountDistributedInfo_test001 ccerr:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    })
                });
            });
            
        })

        /**
        * @tc.number   : setOsAccountDistributedInfo_test002
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
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
                console.info('====>setOsAccountDistributedInfo_test002 ccerr callback:' + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfo(function (err, data) {
                    console.info('====>setOsAccountDistributedInfo_test002 get ccerr:' + JSON.stringify(err))
                    console.info("====>setOsAccountDistributedInfo_test002 get data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOUT'
                    };
                    accountAbility.setOsAccountDistributedInfo(obj).then(function () {
                        done();
                    }).catch((err) => {
                        console.info('====>setOsAccountDistributedInfo_test002 set ccerr:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    });
                });
            });
        })

        /**
        * @tc.number   : setOsAccountDistributedInfo_test003
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test setOsAccountDistributedInfo 12300003 errcode.
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('setOsAccountDistributedInfo_test003', 0, async function (done) {
            let accountAbility = account.getDistributedAccountAbility();
            let tokenInvalidInfo = {
                name: 'ZhangSan',
                id: '12345',
                event: "Ohos.account.event.TOKEN_INVALID"
            }
            try {
                accountAbility.setOsAccountDistributedInfo(tokenInvalidInfo, (err) => {
                    console.info('====>setOsAccountDistributedInfo_test003 err: ' + JSON.stringify(err));
                    try {
                        expect(err.code).assertEqual(12300003);
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    done();
                });
            } catch (err) {
                console.info('====>setOsAccountDistributedInfo_test003 catch exception: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.number   : setOsAccountDistributedInfo_test004
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
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
                console.info("====>setOsAccountDistributedInfo_test004 update_err:" + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfo(async (err, data) => {
                    console.info("====>setOsAccountDistributedInfo_test004 query_err:" + JSON.stringify(err))
                    console.info("====>setOsAccountDistributedInfo_test004 query_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    try{
                        await accountAbility.setOsAccountDistributedInfo(obj)
                        console.info('====>setOsAccountDistributedInfo_test004 end')
                        done();
                    }catch(err){
                        console.info('====>setOsAccountDistributedInfo_test004 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    }
                });
            });
        })

        /**
        * @tc.number   : setOsAccountDistributedInfo_test005
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                    normal nickname
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
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
                console.info("====>updateOsAccountDistributedInfo_test005 set_err:" + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfo(async (err, data) => {
                    console.info("====>updateOsAccountDistributedInfo_test005 get_err:" + JSON.stringify(err))
                    console.info("====>updateOsAccountDistributedInfo_test005 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.info("====>start LOGOFF")
                    try{
                        await accountAbility.setOsAccountDistributedInfo(obj)
                        console.info('====>setOsAccountDistributedInfo_test005 end')
                        done();
                    }catch(err){
                        console.info('====>setOsAccountDistributedInfo_test005 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    }
                });
            });
        })

        /**
        * @tc.number   : setOsAccountDistributedInfo_test006
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *                   normal nickname
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
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
                    console.info("====>setOsAccountDistributedInfo_test006 get_err:" + JSON.stringify(err))
                    console.info("====>setOsAccountDistributedInfo_test006 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.info("====>start LOGOFF")
                    accountAbility.setOsAccountDistributedInfo(obj).then(function (err) {
                        console.info("====>LOGOFF err:" + JSON.stringify(err))
                        expect(err).assertEqual(null)
                        done();
                    });
                }).catch((err) => {
                    console.info("====>setOsAccountDistributedInfo_test006 update_err:" + JSON.stringify(err))
                    expect().assertFail();
                    done();
                })
            })
        })

        /**
        * @tc.number   : setOsAccountDistributedInfo_test007
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                    normal avatar
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
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
                console.info("====>setOsAccountDistributedInfo_test007 set_err:" + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfo(async (err, data) =>{
                    console.info("====>setOsAccountDistributedInfo_test007 get_err:" + JSON.stringify(err))
                    console.info("====>setOsAccountDistributedInfo_test007 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.info("====>start LOGOFF")
                    try{
                        await accountAbility.setOsAccountDistributedInfo(obj)
                        console.info('====>setOsAccountDistributedInfo_test007 end')
                        done();
                    }catch(err){
                        console.info('====>setOsAccountDistributedInfo_test007 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    }
                });
            });
        })

        /**
        * @tc.number   : setOsAccountDistributedInfo_test008
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *                   normal avatar
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
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
                    console.info("====>setOsAccountDistributedInfo_test008 get_err:" + JSON.stringify(err))
                    console.info("====>setOsAccountDistributedInfo_test008 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.info("====>start LOGOFF")
                    accountAbility.setOsAccountDistributedInfo(obj).then(() => {
                        console.info('====>setOsAccountDistributedInfo_test008 end')
                        done();
                    }).catch((err) => {
                        console.info('====>setOsAccountDistributedInfo_test008 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    })
                });
            }).catch((err) => {
                console.info("====>setOsAccountDistributedInfo_test008 throw_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        })

        /**
        * @tc.number   : setOsAccountDistributedInfo_test009
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                   overlength nickname 21
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
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
                console.info("====>setOsAccountDistributedInfo_test009 set_err:" + JSON.stringify(err))
                expect(err.code).assertEqual(12300002);
                done();
            })
        })

        /**
        * @tc.number   : setOsAccountDistributedInfo_test010
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *               overlength nickname 21
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
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
            accountAbility.setOsAccountDistributedInfo(obj).then((err) => {
                console.info("====>setOsAccountDistributedInfo_test010 err:" + JSON.stringify(err))
                expect().assertFail()
                done();
            }).catch((err) => {
                console.info("====>setOsAccountDistributedInfo_test010 throw_err:" + JSON.stringify(err))
                expect(err.code).assertEqual(12300002);
                done();
            })
        })

        /**
        * @tc.number   : setOsAccountDistributedInfo_test011
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                   overlength avatar 3*1024*1024+1
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('setOsAccountDistributedInfo_test011', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            var limitAvatar = ''.padEnd(10 * 1024 * 1024 + 1, 'o')          
            console.info('====>setOsAccountDistributedInfo_test011 avatar_length:' + limitAvatar.length)
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{},
                avatar: limitAvatar
            };
            accountAbility.setOsAccountDistributedInfo(obj, (err)=>{
                console.info("====>setOsAccountDistributedInfo_test011 update_err:" + JSON.stringify(err))
                expect(err.code).assertEqual(12300002);
                done();
            })
        })

        /**
        * @tc.number   : setOsAccountDistributedInfo_test012
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by peomise.
        *                   overlength avatar 3*1024*1024+1
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('setOsAccountDistributedInfo_test012', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            var limitAvatar = ''.padEnd(10 * 1024 * 1024 + 1, 'o')
            console.info('====>setOsAccountDistributedInfo_test012 avatar_length:' + limitAvatar.length)
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                scalableData:{},
                avatar: limitAvatar
            };
            try{
                await accountAbility.setOsAccountDistributedInfo(obj)
                console.info("====>setOsAccountDistributedInfo_test012 set_err")
                expect().assertFail()
                done();
            }catch(err){
                console.info("====>setOsAccountDistributedInfo_test012 throw_err:" + JSON.stringify(err))
                expect(err.code).assertEqual(12300002);
                done();
            }
        })

        /**
        * @tc.number   : setOsAccountDistributedInfo_test013
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                   overlength scalableData
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
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
            accountAbility.setOsAccountDistributedInfo(obj, (err)=>{
                console.info("====>setOsAccountDistributedInfo_test013 update_err:" + JSON.stringify(err))
                expect(err.code).assertEqual(12300002);
                done();
            })
        })

        /**
        * @tc.number   : setOsAccountDistributedInfo_test014
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *                 overlength scalableData
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
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
                console.info("====>setOsAccountDistributedInfo_test014 throw_err:" + JSON.stringify(err))
                expect(err.code).assertEqual(12300002)
                done();
            }
        })

        /**
        * @tc.number   : setOsAccountDistributedInfoByLocalId_test0100
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                    setOsAccountDistributedInfoByLocalId callback
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('setOsAccountDistributedInfoByLocalId_test0100', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                status: 0
            };
            accountAbility.setOsAccountDistributedInfoByLocalId(100, obj, (err) => {
                console.info("====>setOsAccountDistributedInfoByLocalId_test0100 set_err:" + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfoByLocalId(100, async (err, data) =>{
                    console.info("====>setOsAccountDistributedInfoByLocalId_test0100 get_err:" + JSON.stringify(err))
                    console.info("====>setOsAccountDistributedInfoByLocalId_test0100 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF',
                        status: 0
                    };
                    console.info("====>start LOGOFF")
                    try{
                        await accountAbility.setOsAccountDistributedInfoByLocalId(100, obj)
                        console.info('====>setOsAccountDistributedInfoByLocalId_test0100 end')
                        done();
                    }catch(err){
                        console.info('====>setOsAccountDistributedInfoByLocalId_test0100 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    }
                });
            });
        })

        /**
        * @tc.number   : setOsAccountDistributedInfoByLocalId_test0200
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *                   setOsAccountDistributedInfoByLocalId promise
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('setOsAccountDistributedInfoByLocalId_test0200', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN',
                status: 0
            };
            accountAbility.setOsAccountDistributedInfoByLocalId(100, obj).then(() => {
                accountAbility.getOsAccountDistributedInfoByLocalId(100, (err, data) => {
                    console.info("====>setOsAccountDistributedInfoByLocalId_test0200 get_err:" + JSON.stringify(err))
                    console.info("====>setOsAccountDistributedInfoByLocalId_test0200 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF',
                        status: 0
                    };
                    console.info("====>start LOGOFF")
                    accountAbility.setOsAccountDistributedInfoByLocalId(100, obj).then(() => {
                        console.info('====>setOsAccountDistributedInfoByLocalId_test0200 end')
                        done();
                    }).catch((err) => {
                        console.info('====>setOsAccountDistributedInfoByLocalId_test0200 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    })
                });
            }).catch((err) => {
                console.info("====>setOsAccountDistributedInfoByLocalId_test0200 throw_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        })

        /**
        * @tc.number   : DistributedAccountEnum_0100
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount Enum.
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('DistributedAccountEnum_0100', 0, async function (done) {
            try {
                expect(0).assertEqual(account.DistributedAccountStatus.NOT_LOGGED_IN)
                console.info("====>DistributedAccountEnum_0100 success:")
                done()
            } catch (err) {
                console.info("====>DistributedAccountEnum_0100 throw_err:" + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
        * @tc.number   : DistributedAccountEnum_0200
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount Enum.
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('DistributedAccountEnum_0200', 0, async function (done) {
            try {
                expect(1).assertEqual(account.DistributedAccountStatus.LOGGED_IN)
                console.info("====>DistributedAccountEnum_0200 success:")
                done()
            } catch (err) {
                console.info("====>DistributedAccountEnum_0200 throw_err:" + JSON.stringify(err))
                expect().assertFail()
                done()
            }
        })

        /**
        * @tc.number   : DistributedAccountOptionalParameter_0100
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                    OptionalParameter
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('DistributedAccountOptionalParameter_0100', 0, async function (done) {
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
            accountAbility.setOsAccountDistributedInfo(obj, (err) => {
                console.info("====>DistributedAccountOptionalParameter_0100 set_err:" + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfo(async (err, data) =>{
                    console.info("====>DistributedAccountOptionalParameter_0100 get_err:" + JSON.stringify(err))
                    console.info("====>DistributedAccountOptionalParameter_0100 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.info("====>start LOGOFF")
                    try{
                        await accountAbility.setOsAccountDistributedInfo(obj)
                        console.info('====>DistributedAccountOptionalParameter_0100 end')
                        done();
                    }catch(err){
                        console.info('====>DistributedAccountOptionalParameter_0100 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    }
                });
            });
        })

        /**
        * @tc.number   : DistributedAccountOptionalParameter_0200
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *                   OptionalParameter
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('DistributedAccountOptionalParameter_0200', 0, async function (done) {
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
            accountAbility.setOsAccountDistributedInfo(obj).then(() => {
                accountAbility.getOsAccountDistributedInfo((err, data) => {
                    console.info("====>DistributedAccountOptionalParameter_0200 get_err:" + JSON.stringify(err))
                    console.info("====>DistributedAccountOptionalParameter_0200 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF',
                    };
                    console.info("====>start LOGOFF")
                    accountAbility.setOsAccountDistributedInfo(obj).then(() => {
                        console.info('====>DistributedAccountOptionalParameter_0200 end')
                        done();
                    }).catch((err) => {
                        console.info('====>DistributedAccountOptionalParameter_0200 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    })
                });
            }).catch((err) => {
                console.info("====>DistributedAccountOptionalParameter_0200 throw_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        })

        /**
        * @tc.number   : DistributedAccountOptionalParameter_0300
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                    OptionalParameter
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('DistributedAccountOptionalParameter_0300', 0, async function (done) {
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
            accountAbility.setOsAccountDistributedInfo(obj, (err) => {
                console.info("====>setOsAccountDistributedInfo_test017 set_err:" + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfo(async (err, data) =>{
                    console.info("====>DistributedAccountOptionalParameter_0300 get_err:" + JSON.stringify(err))
                    console.info("====>DistributedAccountOptionalParameter_0300 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.info("====>start LOGOFF")
                    try{
                        await accountAbility.setOsAccountDistributedInfo(obj)
                        console.info('====>DistributedAccountOptionalParameter_0300 end')
                        done();
                    }catch(err){
                        console.info('====>DistributedAccountOptionalParameter_0300 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    }
                });
            });
        })

        /**
        * @tc.number   : DistributedAccountOptionalParameter_0400
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *                   OptionalParameter
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('DistributedAccountOptionalParameter_0400', 0, async function (done) {
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
            accountAbility.setOsAccountDistributedInfo(obj).then(() => {
                accountAbility.getOsAccountDistributedInfo((err, data) => {
                    console.info("====>DistributedAccountOptionalParameter_0400 get_err:" + JSON.stringify(err))
                    console.info("====>DistributedAccountOptionalParameter_0400 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF',
                    };
                    console.info("====>start LOGOFF")
                    accountAbility.setOsAccountDistributedInfo(obj).then(() => {
                        console.info('====>DistributedAccountOptionalParameter_0400 end')
                        done();
                    }).catch((err) => {
                        console.info('====>DistributedAccountOptionalParameter_0400 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    })
                });
            }).catch((err) => {
                console.info("====>DistributedAccountOptionalParameter_0400 throw_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        })

        /**
        * @tc.number   : DistributedAccountOptionalParameter_0500
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                    OptionalParameter
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('DistributedAccountOptionalParameter_0500', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN'
            };
            accountAbility.setOsAccountDistributedInfo(obj, (err) => {
                console.info("====>DistributedAccountOptionalParameter_0500 set_err:" + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfo(async (err, data) =>{
                    console.info("====>DistributedAccountOptionalParameter_0500 get_err:" + JSON.stringify(err))
                    console.info("====>DistributedAccountOptionalParameter_0500 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.info("====>start LOGOFF")
                    try{
                        await accountAbility.setOsAccountDistributedInfo(obj)
                        console.info('====>DistributedAccountOptionalParameter_0500 end')
                        done();
                    }catch(err){
                        console.info('====>DistributedAccountOptionalParameter_0500 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    }
                });
            });
        })

        /**
        * @tc.number   : DistributedAccountOptionalParameter_0600
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *                   OptionalParameter
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('DistributedAccountOptionalParameter_0600', 0, async function (done) {
            const accountAbility = account.getDistributedAccountAbility()
            let obj = {
                id: '12345',
                name: 'ZhangSan',
                event: 'Ohos.account.event.LOGIN'
            };
            accountAbility.setOsAccountDistributedInfo(obj).then(() => {
                accountAbility.getOsAccountDistributedInfo((err, data) => {
                    console.info("====>DistributedAccountOptionalParameter_0600 get_err:" + JSON.stringify(err))
                    console.info("====>DistributedAccountOptionalParameter_0600 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF',
                    };
                    console.info("====>start LOGOFF")
                    accountAbility.setOsAccountDistributedInfo(obj).then(() => {
                        console.info('====>DistributedAccountOptionalParameter_0600 end')
                        done();
                    }).catch((err) => {
                        console.info('====>DistributedAccountOptionalParameter_0600 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    })
                });
            }).catch((err) => {
                console.info("====>DistributedAccountOptionalParameter_0600 throw_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        })

        /**
        * @tc.number   : DistributedAccountOptionalParameter_0700
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                    setOsAccountDistributedInfoByLocalId callback null OptionParameter
        * @tc.level    : Level3
        * @tc.size     : MediumTest
        * @tc.type     : Function
        */
        it('DistributedAccountOptionalParameter_0700', 0, async function (done) {
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
            accountAbility.setOsAccountDistributedInfoByLocalId(100, obj, (err) => {
                console.info("====>DistributedAccountOptionalParameter_0700 set_err:" + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfoByLocalId(100, async (err, data) =>{
                    console.info("====>DistributedAccountOptionalParameter_0700 get_err:" + JSON.stringify(err))
                    console.info("====>DistributedAccountOptionalParameter_0700 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.info("====>start LOGOFF")
                    try{
                        await accountAbility.setOsAccountDistributedInfoByLocalId(100, obj)
                        console.info('====>DistributedAccountOptionalParameter_0700 end')
                        done();
                    }catch(err){
                        console.info('====>DistributedAccountOptionalParameter_0700 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    }
                });
            });
        })

        /**
        * @tc.number   : DistributedAccountOptionalParameter_0800
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *                   setOsAccountDistributedInfoByLocalId promise null OptionParameter
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('DistributedAccountOptionalParameter_0800', 0, async function (done) {
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
            accountAbility.setOsAccountDistributedInfoByLocalId(100, obj).then(() => {
                accountAbility.getOsAccountDistributedInfoByLocalId(100, (err, data) => {
                    console.info("====>DistributedAccountOptionalParameter_0800 get_err:" + JSON.stringify(err))
                    console.info("====>DistributedAccountOptionalParameter_0800 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.info("====>start LOGOFF")
                    accountAbility.setOsAccountDistributedInfoByLocalId(100, obj).then(() => {
                        console.info('====>DistributedAccountOptionalParameter_0800 end')
                        done();
                    }).catch((err) => {
                        console.info('====>DistributedAccountOptionalParameter_0800 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    })
                });
            }).catch((err) => {
                console.info("====>DistributedAccountOptionalParameter_0800 throw_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        })

        /**
        * @tc.number   : DistributedAccountOptionalParameter_0900
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
        *                    setOsAccountDistributedInfoByLocalId callback undefined OptionParameter
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('DistributedAccountOptionalParameter_0900', 0, async function (done) {
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
            accountAbility.setOsAccountDistributedInfoByLocalId(100, obj, (err) => {
                console.info("====>DistributedAccountOptionalParameter_0900 set_err:" + JSON.stringify(err))
                accountAbility.getOsAccountDistributedInfoByLocalId(100, async (err, data) =>{
                    console.info("====>DistributedAccountOptionalParameter_0900 get_err:" + JSON.stringify(err))
                    console.info("====>DistributedAccountOptionalParameter_0900 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.info("====>start LOGOFF")
                    try{
                        await accountAbility.setOsAccountDistributedInfoByLocalId(100, obj)
                        console.info('====>DistributedAccountOptionalParameter_0900 end')
                        done();
                    }catch(err){
                        console.info('====>DistributedAccountOptionalParameter_0900 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    }
                });
            });
        })

        /**
        * @tc.number   : DistributedAccountOptionalParameter_1000
        * @tc.name     : testDistributedFunction
        * @tc.desc     : Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
        *                   setOsAccountDistributedInfoByLocalId promise undefined OptionParameter
        * @tc.level   : Level3
        * @tc.size    : MediumTest
        * @tc.type    : Function
        */
        it('DistributedAccountOptionalParameter_1000', 0, async function (done) {
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
            accountAbility.setOsAccountDistributedInfoByLocalId(100, obj).then(() => {
                accountAbility.getOsAccountDistributedInfoByLocalId(100, (err, data) => {
                    console.info("====>DistributedAccountOptionalParameter_1000 get_err:" + JSON.stringify(err))
                    console.info("====>DistributedAccountOptionalParameter_1000 get_data:" + JSON.stringify(data))
                    expect(data.name).assertEqual('ZhangSan')
                    expect(data.id !== 'ohosAnonymousUid').assertTrue()
                    expect(data.status).assertEqual(1)
                    let obj = {
                        id: '12345',
                        name: 'ZhangSan',
                        event: 'Ohos.account.event.LOGOFF'
                    };
                    console.info("====>start LOGOFF")
                    accountAbility.setOsAccountDistributedInfoByLocalId(100, obj).then(() => {
                        console.info('====>DistributedAccountOptionalParameter_1000 end')
                        done();
                    }).catch((err) => {
                        console.info('====>DistributedAccountOptionalParameter_1000 err:' + JSON.stringify(err))
                        expect().assertFail();
                        done();
                    })
                });
            }).catch((err) => {
                console.info("====>DistributedAccountOptionalParameter_1000 throw_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        });
        
        /**
         * @tc.number  : SUB_Account_DistributedAccount_ErrCode_0100
         * @tc.name    : testParameterVerify
         * @tc.desc    : Test getOsAccountDistributedInfo no parameter interface but call with parameter null
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_DistributedAccount_ErrCode_0100', 3, async function (done) {
            console.info("====>SUB_Account_DistributedAccount_ErrCode_0100 start====");
            let accountAbility = account.getDistributedAccountAbility();
            try {
                accountAbility.getOsAccountDistributedInfo(null, (err, data) => {
                    console.info('====>SUB_Account_DistributedAccount_ErrCode_0100 exception: ' + JSON.stringify(err));
                    try {
                        expect().assertFail();
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    done();
                });
                done();
            } catch (err) {
                console.info('====>SUB_Account_DistributedAccount_ErrCode_0100 catch exception: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_DistributedAccount_ErrCode_0200
         * @tc.name    : testParameterVerify
         * @tc.desc    : Test getOsAccountDistributedInfo callback 401 errcode.
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_DistributedAccount_ErrCode_0200', 3, async function (done) {
            console.info("====>SUB_Account_DistributedAccount_ErrCode_0200 start====");
            let accountAbility = account.getDistributedAccountAbility();
            try {
                accountAbility.getOsAccountDistributedInfo("", (err, data) => {
                    console.info('====>SUB_Account_DistributedAccount_ErrCode_0200 exception: ' + JSON.stringify(err));
                    try {
                        expect().assertFail();
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    done();
                });
            } catch (err) {
                console.info('====>SUB_Account_DistributedAccount_ErrCode_0200 catch exception: ' + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_DistributedAccount_ErrCode_0300
         * @tc.name    : testParameterVerify
         * @tc.desc    : Test getOsAccountDistributedInfo callback 401 errcode.
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_DistributedAccount_ErrCode_0300', 3, async function (done) {
            console.info("====>SUB_Account_DistributedAccount_ErrCode_0300 start====");
            let accountAbility = account.getDistributedAccountAbility();
            try {
                accountAbility.getOsAccountDistributedInfo(true, (err, data) => {
                    console.info('====>SUB_Account_DistributedAccount_ErrCode_0300 exception: ' + JSON.stringify(err));
                    try {
                        expect().assertFail();
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    done();
                });
            } catch (err) {
                console.info('====>SUB_Account_DistributedAccount_ErrCode_0300 catch exception: ' + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_DistributedAccount_ErrCode_0400
         * @tc.name    : testParameterVerify
         * @tc.desc    : Test getOsAccountDistributedInfo callback 401 errcode.
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_DistributedAccount_ErrCode_0400', 3, async function (done) {
            console.info("====>SUB_Account_DistributedAccount_ErrCode_0400 start====");
            let accountAbility = account.getDistributedAccountAbility();
            try {
                accountAbility.getOsAccountDistributedInfo(0, (err, data) => {
                    console.info('====>SUB_Account_DistributedAccount_ErrCode_0400 exception: ' + JSON.stringify(err));
                    try {
                        expect().assertFail();
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    done();
                });
            } catch (err) {
                console.info('====>SUB_Account_DistributedAccount_ErrCode_0400 catch exception: ' + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /**
         * @tc.number  : SUB_Account_DistributedAccount_ErrCode_0500
         * @tc.name    : testParameterVerify
         * @tc.desc    : Test getOsAccountDistributedInfo no parameter interface but call with parameter undefined
         * @tc.level   : Level3
         * @tc.size    : MediumTest
         * @tc.type    : Function
         */
        it('SUB_Account_DistributedAccount_ErrCode_0500', 3, async function (done) {
            console.info("====>SUB_Account_DistributedAccount_ErrCode_0500 start====");
            let accountAbility = account.getDistributedAccountAbility();
            try {
                accountAbility.getOsAccountDistributedInfo(undefined, (err, data) => {
                    console.info('====>SUB_Account_DistributedAccount_ErrCode_0500 exception: ' + JSON.stringify(err));
                    try {
                        expect().assertFail();
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    done();
                });
                done();
            } catch (err) {
                console.info('====>SUB_Account_DistributedAccount_ErrCode_0500 catch exception: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });
    });
}

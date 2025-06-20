/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import account from '@ohos.account.appAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

const TIMEOUT = 5000;
const STRCOUNT = 1025;
const EACHTIMEOUT = 500;
export default function ActsAccountErrCode() {
    describe('ActsAccountErrCode', function () {

        /*
        * @tc.number    : ActsAccountErrCode_0100
        * @tc.name      : createAccount callback
        * @tc.desc      : test the number of parameters does not match (需要的参数顺序正确,后面有多余的,不报错)
        */
        it('ActsAccountErrCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0100 creat finish====");
            try {
                appAccountManager.createAccount("test_account_name", {"test_key":"test_extrainfo"}, (err)=>{
                    console.info("====>ActsAccountErrCode_0100 create account callback err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.removeAccount("test_account_name", (err)=>{
                        console.info("====>ActsAccountErrCode_0100 delete Account err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountErrCode_0100 end====");
                        done();
                    });
                }, "test_more_param")
            } catch(err) {
                console.info("====>ActsAccountErrCode_0100 create account catch err:" + JSON.stringify(err));
                expect().assertFail();
                console.info("====>ActsAccountErrCode_0100 end====");
                done();
            }

        });

        /*
        * @tc.number    : ActsAccountErrCode_0200
        * @tc.name      : createAccount callback
        * @tc.desc      : test the number of parameters does not match(需要的参数顺序中有多余类型参数)
        */
        it('ActsAccountErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0200 creat finish====");
            try {
                appAccountManager.createAccount("test_account_name", {"test_key":"test_extrainfo"}, "test_more_param", (err)=>{
                    console.info("====>ActsAccountErrCode_0200 create account callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_0200 create account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_0200 end====");
                done();
            }

        });

        /*
        * @tc.number    : ActsAccountErrCode_0300
        * @tc.name      : createAccount callback
        * @tc.desc      : test the number of parameters does not match(需要的参数数量少于预期)
        */
        it('ActsAccountErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0300 creat finish====");
            try {
                appAccountManager.createAccount((err)=>{
                    console.info("====>ActsAccountErrCode_0300 create account callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_0300 create account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_0300 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountErrCode_0400
        * @tc.name      : createAccount callback
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0400 creat finish====");
            try {
                appAccountManager.createAccount(123456, {"test_key":"test_extrainfo"}, (err)=>{
                    console.info("====>ActsAccountErrCode_0400 create account callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_0400 create account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_0400 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_0500
        * @tc.name      : createAccount callback
        * @tc.desc      : test the type of parameters does not match(extrainfo不匹配)
        */
        it('ActsAccountErrCode_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0500 creat finish====");
            try {
                appAccountManager.createAccount("test_account_name", "  ", (err)=>{
                    console.info("====>ActsAccountErrCode_0500 create account callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_0500 create account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_0500 end====");
                done();
            } 
        });

        /*
        * @tc.number    : ActsAccountErrCode_0510
        * @tc.name      : createAccount callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0510 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0510 creat finish====");
            try {
                appAccountManager.createAccount(123456, {"test_key":"test_extrainfo"}, 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_0510 create account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_0510 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_0600
        * @tc.name      : createAccount promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0600 creat finish====");
            try {
                appAccountManager.createAccount();
            } catch(err) {
                console.info("====>ActsAccountErrCode_0600 create account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_0600 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_0610
        * @tc.name      : createAccount promise
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0610 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0610 creat finish====");
            try {
                appAccountManager.createAccount(123456);
            } catch(err) {
                console.info("====>ActsAccountErrCode_0610 create account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_0610 end====");
                done();
            }  
        });

        //createAccountImplicitly
        /*
        * @tc.number    : ActsAccountErrCode_0700
        * @tc.name      : createAccountImplicitly callback
        * @tc.desc      : test the number of parameters does not match(extrainfo不匹配)
        */
        it('ActsAccountErrCode_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0700 creat finish====");
            try {
                appAccountManager.createAccountImplicitly({
                    onResult: (resultCode, resultData)=>{
                        console.info("====>ActsAccountErrCode_0700 authenticate resultCode:" + JSON.stringify(resultCode));
                        console.info("====>ActsAccountErrCode_0700 authenticate resultData:" + JSON.stringify(resultData));
                        done();
                    },
                    onRequestRedirected: null
                });
            } catch(err) {
                console.info("====>ActsAccountErrCode_0700 create account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_0700 end====");
                done();
            }  
        });
        
        /*
        * @tc.number    : ActsAccountErrCode_0800
        * @tc.name      : createAccountImplicitly callback
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0800 creat finish====");
            try {
                appAccountManager.createAccountImplicitly(123456, {}, {
                    onResult: null,
                    onRequestRedirected: null
                });
            } catch(err) {
                console.info("====>ActsAccountErrCode_0800 create account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_0800 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_0810
        * @tc.name      : createAccountImplicitly callback
        * @tc.desc      : test the type of parameters does not match(options不匹配)
        */
        it('ActsAccountErrCode_0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0810 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0810 creat finish====");
            try {
                appAccountManager.createAccountImplicitly("test_owner", "test_options", {
                    onResult: null,
                    onRequestRedirected: null
                });
            } catch(err) {
                console.info("====>ActsAccountErrCode_0810 create account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_0810 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_0820
        * @tc.name      : createAccountImplicitly callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0820 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0820 creat finish====");
            var options = {authType: "test_authType"};
            try {
                appAccountManager.createAccountImplicitly("test_owner", options, 1233);
            } catch(err) {
                console.info("====>ActsAccountErrCode_0820 create account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_0820 end====");
                done();
            }  
        });

        //removeAccount
        /*
        * @tc.number    : ActsAccountErrCode_0900
        * @tc.name      : removeAccount callback
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0900 creat finish====");
            try {
                appAccountManager.removeAccount(123456, (err)=>{
                    console.info("====>ActsAccountErrCode_0900 remove account callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_0900 remove account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_0900 end====");
                done();
            }  
        });

        //removeAccount
        /*
        * @tc.number    : ActsAccountErrCode_0910
        * @tc.name      : removeAccount callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_0910 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_0910 creat finish====");
            try {
                appAccountManager.removeAccount("test_name", 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_0910 remove account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_0910 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_1000
        * @tc.name      : removeAccount callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1000 creat finish====");
            try {
                appAccountManager.removeAccount((err)=>{
                    console.info("====>ActsAccountErrCode_1000 remove account callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_1000 remove account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1000 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_1100
        * @tc.name      : removeAccount promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1100 creat finish====");
            try {
                appAccountManager.removeAccount(123456)
            } catch(err) {
                console.info("====>ActsAccountErrCode_1100 remove account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1100 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_1200
        * @tc.name      : removeAccount callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1200 creat finish====");
            try {
                appAccountManager.removeAccount();
            } catch(err) {
                console.info("====>ActsAccountErrCode_1200 remove account catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1200 end====");
                done();
            }  
        });

        //setAppAccess
        /*
        * @tc.number    : ActsAccountErrCode_1300
        * @tc.name      : setAppAccess callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1300 creat finish====");
            try {
                appAccountManager.setAppAccess((err)=>{
                    console.info("====>ActsAccountErrCode_1300 setAppAccess callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_1300 setAppAccess catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1300 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_1400
        * @tc.name      : setAppAccess callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1400 creat finish====");
            try {
                appAccountManager.setAppAccess(123456, "test_owner", false, (err)=>{
                    console.info("====>ActsAccountErrCode_1400 setAppAccess callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_1400 setAppAccess catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1400 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_1410
        * @tc.name      : setAppAccess callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_1410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1410 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1410 creat finish====");
            try {
                appAccountManager.setAppAccess("test_name", "test_owner", false, 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_1410 setAppAccess catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1410 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_1500
        * @tc.name      : setAppAccess promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1500 creat finish====");
            try {
                appAccountManager.setAppAccess();
            } catch(err) {
                console.info("====>ActsAccountErrCode_1500 setAppAccess catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1500 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_1600
        * @tc.name      : setAppAccess promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1600 creat finish====");
            try {
                appAccountManager.setAppAccess(123456, "test_owner", false);
            } catch(err) {
                console.info("====>ActsAccountErrCode_1600 setAppAccess catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1600 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_1610
        * @tc.name      : setAppAccess promise
        * @tc.desc      : test the type of parameters does not match(bundlename不匹配)
        */
        it('ActsAccountErrCode_1610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1610 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1610 creat finish====");
            try {
                appAccountManager.setAppAccess("test_name", 12345, false);
            } catch(err) {
                console.info("====>ActsAccountErrCode_1610 setAppAccess catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1610 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_1620
        * @tc.name      : setAppAccess promise
        * @tc.desc      : test the type of parameters does not match(isAccessible不匹配)
        */
        it('ActsAccountErrCode_1620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1620 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1620 creat finish====");
            try {
                appAccountManager.setAppAccess("test_name", "test_owner", "123");
            } catch(err) {
                console.info("====>ActsAccountErrCode_1620 setAppAccess catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1620 end====");
                done();
            }  
        });

        //checkDataSyncEnabled
        /*
        * @tc.number    : ActsAccountErrCode_1700
        * @tc.name      : checkDataSyncEnabled callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1700 creat finish====");
            try {
                appAccountManager.checkDataSyncEnabled((err,  data)=>{
                    console.info("====>ActsAccountErrCode_1700 checkDataSyncEnabled callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_1700 checkDataSyncEnabled catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1700 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_1800
        * @tc.name      : checkDataSyncEnabled callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1800 creat finish====");
            try {
                appAccountManager.checkDataSyncEnabled(123456, (err, data)=>{
                    console.info("====>ActsAccountErrCode_1800 checkDataSyncEnabled callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_1800 checkDataSyncEnabled catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1800 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_1810
        * @tc.name      : checkDataSyncEnabled callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_1810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1810 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1810 creat finish====");
            try {
                appAccountManager.checkDataSyncEnabled("test_name", 123456);
            } catch(err) {
                console.info("====>ActsAccountErrCode_1810 checkDataSyncEnabled catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1810 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_1900
        * @tc.name      : checkDataSyncEnabled promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_1900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_1900 creat finish====");
            try {
                appAccountManager.checkDataSyncEnabled();
            } catch(err) {
                console.info("====>ActsAccountErrCode_1900 checkDataSyncEnabled catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_1900 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_2000
        * @tc.name      : checkDataSyncEnabled promise
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2000 creat finish====");
            try {
                appAccountManager.checkDataSyncEnabled(123456);
            } catch(err) {
                console.info("====>ActsAccountErrCode_2000 checkDataSyncEnabled catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2000 end====");
                done();
            }  
        });

        //setCredential
        /*
        * @tc.number    : ActsAccountErrCode_2100
        * @tc.name      : setCredential callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2100 creat finish====");
            try {
                appAccountManager.setCredential((err)=>{
                    console.info("====>ActsAccountErrCode_2100 setCredential callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_2100 setCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2100 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_2200
        * @tc.name      : setCredential callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2200 creat finish====");
            try {
                appAccountManager.setCredential(123456, "test_credential_type", "test_credential", (err)=>{
                    console.info("====>ActsAccountErrCode_2200 setCredential callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_2200 setCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2200 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_2210
        * @tc.name      : setCredential callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_2210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2210 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2210 creat finish====");
            try {
                appAccountManager.setCredential("test_name", "test_credential_type", "test_credential", 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_2210 setCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2210 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_2300
        * @tc.name      : setCredential promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2300 creat finish====");
            try {
                appAccountManager.setCredential();
            } catch(err) {
                console.info("====>ActsAccountErrCode_2300 setCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2300 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_2400
        * @tc.name      : setCredential promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2400 creat finish====");
            try {
                appAccountManager.setCredential(123456, "test_credential_type", "test_credential");
            } catch(err) {
                console.info("====>ActsAccountErrCode_2400 setCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2400 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_2410
        * @tc.name      : setCredential promise
        * @tc.desc      : test the type of parameters does not match(credentialType不匹配)
        */
        it('ActsAccountErrCode_2410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2410 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2410 creat finish====");
            try {
                appAccountManager.setCredential("test_name", 12345, "test_credential");
            } catch(err) {
                console.info("====>ActsAccountErrCode_2410 setCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2410 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_2420
        * @tc.name      : setCredential promise
        * @tc.desc      : test the type of parameters does not match(credential不匹配)
        */
        it('ActsAccountErrCode_2420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2420 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2420 creat finish====");
            try {
                appAccountManager.setCredential("test_name", "test_credential_type", 12345);
            } catch(err) {
                console.info("====>ActsAccountErrCode_2420 setCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2420 end====");
                done();
            }  
        });

        //setDataSyncEnabled
        /*
        * @tc.number    : ActsAccountErrCode_2500
        * @tc.name      : setDataSyncEnabled callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2500 creat finish====");
            try {
                appAccountManager.setDataSyncEnabled((err)=>{
                    console.info("====>ActsAccountErrCode_2500 setDataSyncEnabled callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_2500 setDataSyncEnabled catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2500 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_2600
        * @tc.name      : setDataSyncEnabled callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2600 creat finish====");
            try {
                appAccountManager.setDataSyncEnabled(123456, false, (err)=>{
                    console.info("====>ActsAccountErrCode_2600 setDataSyncEnabled callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_2600 setDataSyncEnabled catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2600 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_2610
        * @tc.name      : setDataSyncEnabled callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_2610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2610 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2610 creat finish====");
            try {
                appAccountManager.setDataSyncEnabled("test_name", false, 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_2610 setDataSyncEnabled catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2610 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_2700
        * @tc.name      : setDataSyncEnabled promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2700 creat finish====");
            try {
                appAccountManager.setDataSyncEnabled();
            } catch(err) {
                console.info("====>ActsAccountErrCode_2700 setDataSyncEnabled catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2700 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_2800
        * @tc.name      : setDataSyncEnabled promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2800 creat finish====");
            try {
                appAccountManager.setDataSyncEnabled(123456, false);
            } catch(err) {
                console.info("====>ActsAccountErrCode_2800 setDataSyncEnabled catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2800 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_2810
        * @tc.name      : setDataSyncEnabled promise
        * @tc.desc      : test the type of parameters does not match(isEnable不匹配)
        */
        it('ActsAccountErrCode_2810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2810 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2810 creat finish====");
            try {
                appAccountManager.setDataSyncEnabled("test_name", "false");
            } catch(err) {
                console.info("====>ActsAccountErrCode_2810 setDataSyncEnabled catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2810 end====");
                done();
            }  
        });

        //setCustomData
        /*
        * @tc.number    : ActsAccountErrCode_2900
        * @tc.name      : setCustomData callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_2900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_2900 creat finish====");
            try {
                appAccountManager.setCustomData((err)=>{
                    console.info("====>ActsAccountErrCode_2900 setCustomData callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_2900 setCustomData catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_2900 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_3000
        * @tc.name      : setCustomData callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_3000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_3000 creat finish====");
            try {
                appAccountManager.setCustomData(123456, "test_key", "test_value", (err)=>{
                    console.info("====>ActsAccountErrCode_3000 setCustomData callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_3000 setCustomData catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_3000 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_3010
        * @tc.name      : setCustomData callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_3010 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_3010 creat finish====");
            try {
                appAccountManager.setCustomData("test_name", "test_key", "test_value", 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_3010 setCustomData catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_3010 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_3100
        * @tc.name      : setCustomData promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_3100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_3100 creat finish====");
            try {
                appAccountManager.setCustomData();
            } catch(err) {
                console.info("====>ActsAccountErrCode_3100 setCustomData catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_3100 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_3200
        * @tc.name      : setCustomData promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_3200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_3200 creat finish====");
            try {
                appAccountManager.setCustomData(123456, "test_key", "test_value");
            } catch(err) {
                console.info("====>ActsAccountErrCode_3200 setCustomData catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_3200 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_3210
        * @tc.name      : setCustomData promise
        * @tc.desc      : test the type of parameters does not match(key不匹配)
        */
        it('ActsAccountErrCode_3210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_3210 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_3210 creat finish====");
            try {
                appAccountManager.setCustomData("test_name", 12345, "test_value");
            } catch(err) {
                console.info("====>ActsAccountErrCode_3210 setCustomData catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_3210 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_3220
        * @tc.name      : setCustomData promise
        * @tc.desc      : test the type of parameters does not match(value不匹配)
        */
        it('ActsAccountErrCode_3220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_3220 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_3220 creat finish====");
            try {
                appAccountManager.setCustomData("test_name", "test_key", 12345);
            } catch(err) {
                console.info("====>ActsAccountErrCode_3220 setCustomData catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_3220 end====");
                done();
            }  
        });

        //getAllAccounts
        /*
        * @tc.number    : ActsAccountErrCode_3300
        * @tc.name      : getAllAccounts callback
        * @tc.desc      : test the type of parameters does not match
        */

        //getAccountsByOwner
        /*
        * @tc.number    : ActsAccountErrCode_3500
        * @tc.name      : getAccountsByOwner callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_3500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_3500 creat finish====");
            try {
                appAccountManager.getAccountsByOwner((err, data)=>{
                    console.info("====>ActsAccountErrCode_3500 getAccountsByOwner callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_3500 getAccountsByOwner catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_3500 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_3600
        * @tc.name      : getAccountsByOwner callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_3600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_3600 creat finish====");
            try {
                appAccountManager.getAccountsByOwner(123456, (err, data)=>{
                    console.info("====>ActsAccountErrCode_3600 getAccountsByOwner callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_3600 getAccountsByOwner catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_3600 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_3610
        * @tc.name      : getAccountsByOwner callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_3610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_3610 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_3610 creat finish====");
            try {
                appAccountManager.getAccountsByOwner("test_owner", 1234)
            } catch(err) {
                console.info("====>ActsAccountErrCode_3610 getAccountsByOwner catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_3610 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_3700
        * @tc.name      : getAccountsByOwner promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_3700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_3700 creat finish====");
            try {
                appAccountManager.getAccountsByOwner();
            } catch(err) {
                console.info("====>ActsAccountErrCode_3700 getAccountsByOwner catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_3700 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_3800
        * @tc.name      : getAccountsByOwner promise
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_3800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_3800 creat finish====");
            try {
                appAccountManager.getAccountsByOwner(123456);
            } catch(err) {
                console.info("====>ActsAccountErrCode_3800 getAccountsByOwner catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_3800 end====");
                done();
            }  
        });

        //getCredential
        /*
        * @tc.number    : ActsAccountErrCode_3900
        * @tc.name      : getCredential callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_3900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_3900 creat finish====");
            try {
                appAccountManager.getCredential((err, data)=>{
                    console.info("====>ActsAccountErrCode_3900 getCredential callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_3900 getCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_3900 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_4000
        * @tc.name      : getCredential callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4000 creat finish====");
            try {
                appAccountManager.getCredential(123456, "test_credential_type", (err, data)=>{
                    console.info("====>ActsAccountErrCode_4000 getCredential callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_4000 getCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4000 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_4010
        * @tc.name      : getCredential callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_4010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4010 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4010 creat finish====");
            try {
                appAccountManager.getCredential("test_name", "test_credential_type", 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_4010 getCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4010 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_4100
        * @tc.name      : getCredential promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4100 creat finish====");
            try {
                appAccountManager.getCredential();
            } catch(err) {
                console.info("====>ActsAccountErrCode_4100 getCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4100 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_4200
        * @tc.name      : getCredential promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4200 creat finish====");
            try {
                appAccountManager.getCredential(123456, "test_credential_type");
            } catch(err) {
                console.info("====>ActsAccountErrCode_4200 getCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4200 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_4210
        * @tc.name      : getCredential promise
        * @tc.desc      : test the type of parameters does not match(credentialType不匹配)
        */
        it('ActsAccountErrCode_4210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4210 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4210 creat finish====");
            try {
                appAccountManager.getCredential("test_name", 12345);
            } catch(err) {
                console.info("====>ActsAccountErrCode_4210 getCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4210 end====");
                done();
            }  
        });

        //getCustomData
        /*
        * @tc.number    : ActsAccountErrCode_4300
        * @tc.name      : getCustomData callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4300 creat finish====");
            try {
                appAccountManager.getCustomData((err, data)=>{
                    console.info("====>ActsAccountErrCode_4300 getCustomData callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_4300 getCustomData catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4300 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_4400
        * @tc.name      : getCustomData callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4400 creat finish====");
            try {
                appAccountManager.getCustomData(123456, "test_key", (err, data)=>{
                    console.info("====>ActsAccountErrCode_4400 getCustomData callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_4400 getCustomData catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4400 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_4410
        * @tc.name      : getCustomData callback
        * @tc.desc      : test the type of parameters does not match
        */
         it('ActsAccountErrCode_4410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4410 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4410 creat finish====");
            try {
                appAccountManager.getCustomData("test_name", "test_key", 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_4410 getCustomData catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4410 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_4500
        * @tc.name      : getCustomData promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4500 creat finish====");
            try {
                appAccountManager.getCustomData();
            } catch(err) {
                console.info("====>ActsAccountErrCode_4500 getCustomData catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4500 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_4600
        * @tc.name      : getCustomData promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4600 creat finish====");
            try {
                appAccountManager.getCustomData(123456, "test_key");
            } catch(err) {
                console.info("====>ActsAccountErrCode_4600 getCustomData catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4600 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_4610
        * @tc.name      : getCustomData promise
        * @tc.desc      : test the type of parameters does not match(key不匹配)
        */
        it('ActsAccountErrCode_4610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4610 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4610 creat finish====");
            try {
                appAccountManager.getCustomData("test_name", 12345);
            } catch(err) {
                console.info("====>ActsAccountErrCode_4610 getCustomData catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4610 end====");
                done();
            }  
        });


        //getCustomDataSync
        /*
        * @tc.number    : ActsAccountErrCode_4700
        * @tc.name      : getCustomDataSync
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4700 creat finish====");
            try {
                appAccountManager.getCustomDataSync(123456, "test_key");
            } catch(err) {
                console.info("====>ActsAccountErrCode_4700 getCustomDataSync catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4700 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_4710
        * @tc.name      : getCustomDataSync
        * @tc.desc      : test the type of parameters does not match(key不匹配)
        */
        it('ActsAccountErrCode_4710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4710 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4710 creat finish====");
            try {
                appAccountManager.getCustomDataSync("test_name", 12345);
            } catch(err) {
                console.info("====>ActsAccountErrCode_4710 getCustomDataSync catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4710 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_4800
        * @tc.name      : getCustomDataSync
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4800 creat finish====");
            try {
                appAccountManager.getCustomDataSync();
            } catch(err) {
                console.info("====>ActsAccountErrCode_4800 getCustomDataSync catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_4800 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_4900
        * @tc.name      : getCustomDataSync
        * @tc.desc      : test service error
        */
        it('ActsAccountErrCode_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_4900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_4900 creat finish====");
            try {
                appAccountManager.getCustomDataSync("test_no_account", "test_key");
            } catch(err) {
                console.info("====>ActsAccountErrCode_4900 getCustomDataSync catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                console.info("====>ActsAccountErrCode_4900 end====");
                done();
            }  
        });

        //auth
        /*
        * @tc.number    : ActsAccountErrCode_5000
        * @tc.name      : auth callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5000 creat finish====");
            try {
                appAccountManager.auth("test_name");
            } catch(err) {
                console.info("====>ActsAccountErrCode_5000 auth catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5000 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5100
        * @tc.name      : auth callback
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5100 creat finish====");
            try {
                appAccountManager.auth(12346, "test_owner", "test_authtype", {
                    onResult: null,
                    onRequestRedirected: null
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_5100 auth catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5100 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5110
        * @tc.name      : auth callback
        * @tc.desc      : test the type of parameters does not match(owner不匹配)
        */
        it('ActsAccountErrCode_5110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5110 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5110 creat finish====");
            try {
                appAccountManager.auth("test_name", 12346, "test_authtype", {
                    onResult: null,
                    onRequestRedirected: null
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_5110 auth catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5110 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5120
        * @tc.name      : auth callback
        * @tc.desc      : test the type of parameters does not match(authtype不匹配)
        */
        it('ActsAccountErrCode_5120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5120 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5120 creat finish====");
            try {
                appAccountManager.auth("test_name", "test_owner", 123456, {
                    onResult: null,
                    onRequestRedirected: null
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_5120 auth catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5120 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5130
        * @tc.name      : auth callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_5130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5130 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5130 creat finish====");
            try {
                appAccountManager.auth("test_name", "test_owner", 123456, "callback");
            } catch(err) {
                console.info("====>ActsAccountErrCode_5130 auth catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5130 end====");
                done();
            }  
        });

        //getAuthToken
        /*
        * @tc.number    : ActsAccountErrCode_5200
        * @tc.name      : getAuthToken callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5200 creat finish====");
            try {
                appAccountManager.getAuthToken((err, data)=>{
                    console.info("====>ActsAccountErrCode_5200 getAuthToken callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_5200 getAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5200 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5300
        * @tc.name      : getAuthToken callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5300 creat finish====");
            try {
                appAccountManager.getAuthToken("test_name", "test_owner", 12345, (err, data)=>{
                    console.info("====>ActsAccountErrCode_5300 getAuthToken callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_5300 getAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5300 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5310
        * @tc.name      : getAuthToken callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_5310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5310 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5310 creat finish====");
            try {
                appAccountManager.getAuthToken("test_name", "test_owner", "test_authType", 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_5310 getAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5310 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5400
        * @tc.name      : getAuthToken promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5400 creat finish====");
            try {
                var authToken = appAccountManager.getAuthToken();
            } catch(err) {
                console.info("====>ActsAccountErrCode_5400 getAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5400 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5500
        * @tc.name      : getAuthToken promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5500 creat finish====");
            try {
                var authToken = appAccountManager.getAuthToken(12345, "test_owner", "test_authtype");
            } catch(err) {
                console.info("====>ActsAccountErrCode_5500 getAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5500 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5510
        * @tc.name      : getAuthToken promise
        * @tc.desc      : test the type of parameters does not match(owner不匹配)
        */
        it('ActsAccountErrCode_5510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5510 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5510 creat finish====");
            try {
                var authToken = appAccountManager.getAuthToken("test_name", 12345, "test_authType");
            } catch(err) {
                console.info("====>ActsAccountErrCode_5510 getAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5510 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5520
        * @tc.name      : getAuthToken promise
        * @tc.desc      : test the type of parameters does not match(owner不匹配)
        */
        it('ActsAccountErrCode_5520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5520 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5520 creat finish====");
            try {
                var authToken = appAccountManager.getAuthToken("test_name", "test_owner", 12345);
            } catch(err) {
                console.info("====>ActsAccountErrCode_5520 getAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5520 end====");
                done();
            }  
        });

        //setAuthToken
        /*
        * @tc.number    : ActsAccountErrCode_5600
        * @tc.name      : setAuthToken callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5600 creat finish====");
            try {
                appAccountManager.setAuthToken((err)=>{
                    console.info("====>ActsAccountErrCode_5600 setAuthToken callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_5600 setAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5600 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5700
        * @tc.name      : setAuthToken callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5700 creat finish====");
            try {
                appAccountManager.setAuthToken("test_name", 123456, "test_token", (err)=>{
                    console.info("====>ActsAccountErrCode_5700 setAuthToken callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_5700 setAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5700 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5710
        * @tc.name      : setAuthToken callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_5710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5710 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5710 creat finish====");
            try {
                appAccountManager.setAuthToken("test_name", "test_authType", "test_token", 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_5710 setAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5710 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5400
        * @tc.name      : setAuthToken promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5800 creat finish====");
            try {
                appAccountManager.setAuthToken();
            } catch(err) {
                console.info("====>ActsAccountErrCode_5800 setAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5800 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5900
        * @tc.name      : setAuthToken promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5900 creat finish====");
            try {
                appAccountManager.setAuthToken(12345, "test_authType", "test_token");
            } catch(err) {
                console.info("====>ActsAccountErrCode_5900 setAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5900 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5910
        * @tc.name      : setAuthToken promise
        * @tc.desc      : test the type of parameters does not match(authType不匹配)
        */
        it('ActsAccountErrCode_5910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5910 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5910 creat finish====");
            try {
                appAccountManager.setAuthToken("test_name", 123456, "test_token");
            } catch(err) {
                console.info("====>ActsAccountErrCode_5910 setAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5910 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_5920
        * @tc.name      : setAuthToken promise
        * @tc.desc      : test the type of parameters does not match(token不匹配)
        */
        it('ActsAccountErrCode_5920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_5920 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_5920 creat finish====");
            try {
                appAccountManager.setAuthToken("test_name", "test_authType", 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_5920 setAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_5920 end====");
                done();
            }  
        });

        //deleteAuthToken
        /*
        * @tc.number    : ActsAccountErrCode_6000
        * @tc.name      : deleteAuthToken callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6000 creat finish====");
            try {
                appAccountManager.deleteAuthToken((err)=>{
                    console.info("====>ActsAccountErrCode_6000 deleteAuthToken callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_6000 deleteAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6000 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6100
        * @tc.name      : deleteAuthToken callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6100 creat finish====");
            try {
                appAccountManager.deleteAuthToken("test_name", "test_owner", 123456, "test_token", (err)=>{
                    console.info("====>ActsAccountErrCode_6100 deleteAuthToken callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_6100 deleteAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6100 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6110
        * @tc.name      : deleteAuthToken callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_6110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6110 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6110 creat finish====");
            try {
                appAccountManager.deleteAuthToken("test_name", "test_owner", "test_authType", "test_token", 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_6110 deleteAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6110 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6200
        * @tc.name      : deleteAuthToken promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6200 creat finish====");
            try {
                appAccountManager.deleteAuthToken();
            } catch(err) {
                console.info("====>ActsAccountErrCode_6200 deleteAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6200 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6300
        * @tc.name      : deleteAuthToken promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6300 creat finish====");
            try {
                appAccountManager.deleteAuthToken(1234, "test_owner", "test_authType", "test_token");
            } catch(err) {
                console.info("====>ActsAccountErrCode_6300 deleteAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6300 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6310
        * @tc.name      : deleteAuthToken promise
        * @tc.desc      : test the type of parameters does not match(owner不匹配)
        */
        it('ActsAccountErrCode_6310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6310 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6310 creat finish====");
            try {
                appAccountManager.deleteAuthToken("test_name", 123456, "test_authType", "test_token");
            } catch(err) {
                console.info("====>ActsAccountErrCode_6310 deleteAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6310 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6320
        * @tc.name      : deleteAuthToken promise
        * @tc.desc      : test the type of parameters does not match(authType不匹配)
        */
        it('ActsAccountErrCode_6320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6320 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6320 creat finish====");
            try {
                appAccountManager.deleteAuthToken("test_name", "test_owner", 1234, "test_token");
            } catch(err) {
                console.info("====>ActsAccountErrCode_6320 deleteAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6320 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6330
        * @tc.name      : deleteAuthToken promise
        * @tc.desc      : test the type of parameters does not match(token不匹配)
        */
        it('ActsAccountErrCode_6330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6330 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6330 creat finish====");
            try {
                appAccountManager.deleteAuthToken("test_name", "test_owner", "test_authType", 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_6330 deleteAuthToken catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6330 end====");
                done();
            }  
        });

        //setAuthTokenVisibility
        /*
        * @tc.number    : ActsAccountErrCode_6000
        * @tc.name      : setAuthTokenVisibility callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6400 creat finish====");
            try {
                appAccountManager.setAuthTokenVisibility((err)=>{
                    console.info("====>ActsAccountErrCode_6400 setAuthTokenVisibility callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_6400 setAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6400 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6500
        * @tc.name      : setAuthTokenVisibility callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6500 creat finish====");
            try {
                appAccountManager.setAuthTokenVisibility("test_name", "test_authType", 123456, true, (err)=>{
                    console.info("====>ActsAccountErrCode_6500 setAuthTokenVisibility callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_6500 setAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6500 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6510
        * @tc.name      : setAuthTokenVisibility callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_6510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6510 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6510 creat finish====");
            try {
                appAccountManager.setAuthTokenVisibility("test_name", "test_authType", "test_bundleName", true, 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_6510 setAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6510 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6600
        * @tc.name      : setAuthTokenVisibility promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6600 creat finish====");
            try {
                appAccountManager.setAuthTokenVisibility();
            } catch(err) {
                console.info("====>ActsAccountErrCode_6600 setAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6600 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6700
        * @tc.name      : setAuthTokenVisibility promise
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6700 creat finish====");
            try {
                appAccountManager.setAuthTokenVisibility("test_name", "test_authType", 123456, true);
            } catch(err) {
                console.info("====>ActsAccountErrCode_6700 setAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6700 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6710
        * @tc.name      : setAuthTokenVisibility promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_6710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6710 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6710 creat finish====");
            try {
                appAccountManager.setAuthTokenVisibility(12345, "test_authType", "test_bundleName", true);
            } catch(err) {
                console.info("====>ActsAccountErrCode_6710 setAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6710 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6710
        * @tc.name      : setAuthTokenVisibility promise
        * @tc.desc      : test the type of parameters does not match(authType不匹配)
        */
        it('ActsAccountErrCode_6720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6720 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6720 creat finish====");
            try {
                appAccountManager.setAuthTokenVisibility("test_name", 1234, "test_bundleName", true);
            } catch(err) {
                console.info("====>ActsAccountErrCode_6720 setAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6720 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6720
        * @tc.name      : setAuthTokenVisibility promise
        * @tc.desc      : test the type of parameters does not match(bundleName不匹配)
        */
        it('ActsAccountErrCode_6730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6730 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6730 creat finish====");
            try {
                appAccountManager.setAuthTokenVisibility("test_name", "test_authType", 123456, true);
            } catch(err) {
                console.info("====>ActsAccountErrCode_6730 setAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6730 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6730
        * @tc.name      : setAuthTokenVisibility promise
        * @tc.desc      : test the type of parameters does not match(isVisible不匹配)
        */
        it('ActsAccountErrCode_6740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6740 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6740 creat finish====");
            try {
                appAccountManager.setAuthTokenVisibility("test_name", "test_authType", "test_bundleName", "231");
            } catch(err) {
                console.info("====>ActsAccountErrCode_6740 setAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6740 end====");
                done();
            }  
        });

        

        //getAllAuthTokens
        /*
        * @tc.number    : ActsAccountErrCode_6800
        * @tc.name      : getAllAuthTokens callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6800 creat finish====");
            try {
                appAccountManager.getAllAuthTokens("test_name", (err, data)=>{
                    console.info("====>ActsAccountErrCode_6800 getAllAuthTokens callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_6800 getAllAuthTokens catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6800 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6900
        * @tc.name      : getAllAuthTokens callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6900 creat finish====");
            try {
                appAccountManager.getAllAuthTokens("test_name", 123456, (err, data)=>{
                    console.info("====>ActsAccountErrCode_6900 getAllAuthTokens callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_6900 getAllAuthTokens catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6900 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6910
        * @tc.name      : getAllAuthTokens callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_6910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6910 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_6910 creat finish====");
            try {
                appAccountManager.getAllAuthTokens("test_name", "test_owner", 124);
            } catch(err) {
                console.info("====>ActsAccountErrCode_6910 getAllAuthTokens catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_6910 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_7000
        * @tc.name      : getAllAuthTokens promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7000 creat finish====");
            try {
                var authTokenInfo = appAccountManager.getAllAuthTokens("test_name");
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>ActsAccountErrCode_7000 getAllAuthTokens catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7000 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_7100
        * @tc.name      : getAllAuthTokens promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7100 creat finish====");
            try {
                var authTokenInfo = appAccountManager.getAllAuthTokens(123456, "test_owner");
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>ActsAccountErrCode_7100 getAllAuthTokens catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7100 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_7110
        * @tc.name      : getAllAuthTokens promise
        * @tc.desc      : test the type of parameters does not match(owner不匹配)
        */
        it('ActsAccountErrCode_7110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7110 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7110 creat finish====");
            try {
                var authTokenInfo = appAccountManager.getAllAuthTokens("test_name", 123456);
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>ActsAccountErrCode_7110 getAllAuthTokens catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7110 end====");
                done();
            }  
        });

        //getAuthList
        /*
        * @tc.number    : ActsAccountErrCode_7200
        * @tc.name      : getAuthList callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7200 creat finish====");
            try {
                appAccountManager.getAuthList("test_name", (err, data)=>{
                    console.info("====>ActsAccountErrCode_7200 getAuthList callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_7200 getAuthList catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7200 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_7300
        * @tc.name      : getAuthList callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7300 creat finish====");
            try {
                appAccountManager.getAuthList("test_name", 123456, (err, data)=>{
                    console.info("====>ActsAccountErrCode_7300 getAuthList callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_7300 getAuthList catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7300 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_7310
        * @tc.name      : getAuthList callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_7310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7310 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7310 creat finish====");
            try {
                appAccountManager.getAuthList("test_name", "test_authType", 123456);
            } catch(err) {
                console.info("====>ActsAccountErrCode_7310 getAuthList catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7310 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_7400
        * @tc.name      : getAuthList promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7400 creat finish====");
            try {
                var authList = appAccountManager.getAuthList("test_name");
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>ActsAccountErrCode_7400 getAuthList catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7400 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_7500
        * @tc.name      : getAuthList promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7500 creat finish====");
            try {
                var authList = appAccountManager.getAuthList(123456, "test_authType");
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>ActsAccountErrCode_7500 getAuthList catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7500 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_7510
        * @tc.name      : getAuthList promise
        * @tc.desc      : test the type of parameters does not match(authType不匹配)
        */
        it('ActsAccountErrCode_7510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7510 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7510 creat finish====");
            try {
                var authList = appAccountManager.getAuthList("test_name", 123456);
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>ActsAccountErrCode_7510 getAuthList catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7510 end====");
                done();
            }  
        });

        //getAuthCallback
        /*
        * @tc.number    : ActsAccountErrCode_7600
        * @tc.name      : getAuthCallback callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7600 creat finish====");
            try {
                appAccountManager.getAuthCallback((err, databack)=>{
                    console.info("====>ActsAccountErrCode_7600 getAuthCallback callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_7600 getAuthCallback catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7600 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_7700
        * @tc.name      : getAuthCallback callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7700 creat finish====");
            try {
                appAccountManager.getAuthCallback(123456, (err, data)=>{
                    console.info("====>ActsAccountErrCode_7700 getAuthCallback callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_7700 getAuthCallback catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7700 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_7710
        * @tc.name      : getAuthCallback callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_7710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7710 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7710 creat finish====");
            try {
                appAccountManager.getAuthCallback("test_sessionId", 123456);
            } catch(err) {
                console.info("====>ActsAccountErrCode_7710 getAuthCallback catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7710 end====");
                done();
            }  
        }); 

        /*
        * @tc.number    : ActsAccountErrCode_7800
        * @tc.name      : getAuthCallback promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7800 creat finish====");
            try {
                var authCallback = appAccountManager.getAuthCallback();
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>ActsAccountErrCode_7800 getAuthCallback catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7800 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_7900
        * @tc.name      : getAuthCallback promise
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_7900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_7900 creat finish====");
            try {
                var authCallback = appAccountManager.getAuthCallback(123456);
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>ActsAccountErrCode_7900 getAuthCallback catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_7900 end====");
                done();
            }  
        });

        //queryAuthenticatorInfo
        /*
        * @tc.number    : ActsAccountErrCode_8000
        * @tc.name      : queryAuthenticatorInfo callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8000 creat finish====");
            try {
                appAccountManager.queryAuthenticatorInfo((err, authenticatorInfo)=>{
                    console.info("====>ActsAccountErrCode_8000 queryAuthenticatorInfo callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_8000 queryAuthenticatorInfo catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8000 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_8100
        * @tc.name      : queryAuthenticatorInfo callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8100 creat finish====");
            try {
                appAccountManager.queryAuthenticatorInfo(123456, (err, authenticatorInfo)=>{
                    console.info("====>ActsAccountErrCode_8100 queryAuthenticatorInfo callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_8100 queryAuthenticatorInfo catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8100 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_8110
        * @tc.name      : queryAuthenticatorInfo callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_8110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8110 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8110 creat finish====");
            try {
                appAccountManager.queryAuthenticatorInfo("test_owner", 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_8110 queryAuthenticatorInfo catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8110 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_8200
        * @tc.name      : queryAuthenticatorInfo promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8200 creat finish====");
            try {
                var authenticatorInfo = appAccountManager.queryAuthenticatorInfo();
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>ActsAccountErrCode_8200 queryAuthenticatorInfo catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8200 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_8300
        * @tc.name      : queryAuthenticatorInfo promise
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8300 creat finish====");
            try {
                var authenticatorInfo = appAccountManager.queryAuthenticatorInfo(123456);
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>ActsAccountErrCode_8300 queryAuthenticatorInfo catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8300 end====");
                done();
            }  
        });

        
        //deleteCredential 
        /*
        * @tc.number    : ActsAccountErrCode_8400
        * @tc.name      : deleteCredential callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8400 creat finish====");
            try {
                appAccountManager.deleteCredential("test_name", (err)=>{
                    console.info("====>ActsAccountErrCode_8400 deleteCredential callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_8400 deleteCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8400 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_8500
        * @tc.name      : deleteCredential callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8500 creat finish====");
            try {
                appAccountManager.deleteCredential("test_name", 123456, (err)=>{
                    console.info("====>ActsAccountErrCode_8500 deleteCredential callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_8500 deleteCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8500 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_8510
        * @tc.name      : deleteCredential callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_8510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8510 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8510 creat finish====");
            try {
                appAccountManager.deleteCredential("test_name", "test_credentialType", 122);
            } catch(err) {
                console.info("====>ActsAccountErrCode_8510 deleteCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8510 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_8600
        * @tc.name      : deleteCredential promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8600 creat finish====");
            try {
                appAccountManager.deleteCredential();
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>ActsAccountErrCode_8600 deleteCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8600 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_8700
        * @tc.name      : deleteCredential promise
        * @tc.desc      : test the type of parameters does not match(credentialType不匹配)
        */
        it('ActsAccountErrCode_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8700 creat finish====");
            try {
                appAccountManager.deleteCredential("test_name", 123456);
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>ActsAccountErrCode_8700 deleteCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8700 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_8710
        * @tc.name      : deleteCredential promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_8710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8710 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8710 creat finish====");
            try {
                appAccountManager.deleteCredential(12345, "test_credentialType");
                expect().assertFail();
                done();
            } catch(err) {
                console.info("====>ActsAccountErrCode_8710 deleteCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8710 end====");
                done();
            }  
        });

        //verifyCredential
        /*
        * @tc.number    : ActsAccountErrCode_8800
        * @tc.name      : verifyCredential callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8800 creat finish====");
            try {
                appAccountManager.verifyCredential("test_name", {
                    onResult:null,
                    onRequestRedirected:null,
                    onRequestContinued: function(){ 
                        console.info("====>ActsAccountErrCode_8800 verifyCredential_onRequestContinued")
                        }   
                    })
            } catch(err) {
                console.info("====>ActsAccountErrCode_8800 verifyCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8800 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_8900
        * @tc.name      : verifyCredential callback
        * @tc.desc      : test the type of parameters does not match(owner不匹配)
        */
        it('ActsAccountErrCode_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8900 creat finish====");
            try {
                appAccountManager.verifyCredential("test_name", 123456, {
                    onResult:null,
                    onRequestRedirected:null,
                    onRequestContinued: function(){ 
                        console.info("====>ActsAccountErrCode_8900 verifyCredential_onRequestContinued")
                        }   
                    })
            } catch(err) {
                console.info("====>ActsAccountErrCode_8900 verifyCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8900 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_8910
        * @tc.name      : verifyCredential callback
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
         it('ActsAccountErrCode_8910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8910 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8910 creat finish====");
            try {
                appAccountManager.verifyCredential(12345, "test_owner", {
                    onResult:null,
                    onRequestRedirected:null,
                    onRequestContinued: function(){ 
                        console.info("====>ActsAccountErrCode_8910 verifyCredential_onRequestContinued")
                        }   
                    })
            } catch(err) {
                console.info("====>ActsAccountErrCode_89100 verifyCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_89100 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_8920
        * @tc.name      : verifyCredential callback
        * @tc.desc      : test the type of parameters does not match(option不匹配)
        */
        it('ActsAccountErrCode_8920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8920 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8920 creat finish====");
            try {
                appAccountManager.verifyCredential("test_name", "test_owner", 1244, {
                    onResult:null,
                    onRequestRedirected:null,
                    onRequestContinued: function(){ 
                        console.info("====>ActsAccountErrCode_8920 verifyCredential_onRequestContinued")
                        }   
                    })
            } catch(err) {
                console.info("====>ActsAccountErrCode_8920 verifyCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8920 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_8930
        * @tc.name      : verifyCredential callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_8930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_8930 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_8930 creat finish====");
            var options = {credentialType: "PIN", credential: "123456"}
            try {
                appAccountManager.verifyCredential("test_name", "test_owner", options, 1234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_8930 verifyCredential catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_8930 end====");
                done();
            }  
        });

        
        //setAuthenticatorProperties
        /*
        * @tc.number    : ActsAccountErrCode_9000
        * @tc.name      : setAuthenticatorProperties callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_9000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_9000 creat finish====");
            try {
                appAccountManager.setAuthenticatorProperties({
                    onResult:null,
                    onRequestRedirected:null,
                    onRequestContinued: function(){ 
                        console.info("====>ActsAccountErrCode_9000 setAuthenticatorProperties")
                        }   
                    })
            } catch(err) {
                console.info("====>ActsAccountErrCode_9000 setAuthenticatorProperties catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_9000 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_9100
        * @tc.name      : setAuthenticatorProperties callback
        * @tc.desc      : test the type of parameters does not match(owner不匹配)
        */
        it('ActsAccountErrCode_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_9100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_9100 creat finish====");
            try {
                appAccountManager.setAuthenticatorProperties(123456, {
                    onResult:null,
                    onRequestRedirected:null,
                    onRequestContinued: function(){ 
                        console.info("====>ActsAccountErrCode_9100 setAuthenticatorProperties")
                        }   
                    })
            } catch(err) {
                console.info("====>ActsAccountErrCode_9100 setAuthenticatorProperties catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_9100 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_9110
        * @tc.name      : setAuthenticatorProperties callback
        * @tc.desc      : test the type of parameters does not match(option不匹配)
        */
        it('ActsAccountErrCode_9110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_9110 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_9110 creat finish====");
            try {
                appAccountManager.setAuthenticatorProperties("test_owner", 12345, {
                    onResult:null,
                    onRequestRedirected:null,
                    onRequestContinued: function(){ 
                        console.info("====>ActsAccountErrCode_9110 setAuthenticatorProperties")
                        }   
                    })
            } catch(err) {
                console.info("====>ActsAccountErrCode_9110 setAuthenticatorProperties catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_9110 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_9120
        * @tc.name      : setAuthenticatorProperties callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_9120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_9120 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_9120 creat finish====");
            var options = {credentialType: "PIN", credential: "123456"}
            try {
                appAccountManager.setAuthenticatorProperties("test_owner", options, 124);
            } catch(err) {
                console.info("====>ActsAccountErrCode_9120 setAuthenticatorProperties catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_9120 end====");
                done();
            }  
        });

        //on
        /*
        * @tc.number    : ActsAccountErrCode_9200
        * @tc.name      : on callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_9200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_9200 creat finish====");
            try {
                appAccountManager.on('accountChange', function(data){
                    console.info("====>ActsAccountErrCode_9200 on catch err:" + JSON.stringify(data));
                });
            } catch(err) {
                console.info("====>ActsAccountErrCode_9200 on catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_9200 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_9300
        * @tc.name      : on callback
        * @tc.desc      : test the type of parameters does not match(Array<owner>不匹配)
        */
        it('ActsAccountErrCode_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_9300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_9300 creat finish====");
            try {
                appAccountManager.on('accountChange', 12356, function(data){
                    console.info("====>ActsAccountErrCode_9300 on catch err:" + JSON.stringify(data));
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_9300 on catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_9300 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_9400
        * @tc.name      : on callback
        * @tc.desc      : test the type of parameters does not match(accountChange不匹配)
        */
        it('ActsAccountErrCode_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_9400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_9400 creat finish====");
            try {
                appAccountManager.on(12345, ["test_owner"], function(data){
                    console.info("====>ActsAccountErrCode_9400 on catch err:" + JSON.stringify(data));
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_9400 on catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_9400 end====");
                done();
            }  
        });

        //off
        /*
        * @tc.number    : ActsAccountErrCode_9500
        * @tc.name      : off callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_9500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_9500 creat finish====");
            try {
                appAccountManager.off();
            } catch(err) {
                console.info("====>ActsAccountErrCode_9500 off catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_9500 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_9600
        * @tc.name      : off callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_9600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_9600 creat finish====");
            try {
                appAccountManager.off(123456);
            } catch(err) {
                console.info("====>ActsAccountErrCode_9600 off catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_9600 end====");
                done();
            }  
        });

        //checkAuthTokenVisibility
        /*
        * @tc.number    : ActsAccountErrCode_6000
        * @tc.name      : checkAuthTokenVisibility callback
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_9700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_9700 creat finish====");
            try {
                appAccountManager.checkAuthTokenVisibility((err)=>{
                    console.info("====>ActsAccountErrCode_9700 checkAuthTokenVisibility callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_9700 checkAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_9700 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_9800
        * @tc.name      : checkAuthTokenVisibility callback
        * @tc.desc      : test the type of parameters does not match
        */
        it('ActsAccountErrCode_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_9800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_9800 creat finish====");
            try {
                appAccountManager.checkAuthTokenVisibility("test_name", "test_authType", 123456, (err)=>{
                    console.info("====>ActsAccountErrCode_9800 checkAuthTokenVisibility callback err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            } catch(err) {
                console.info("====>ActsAccountErrCode_9800 checkAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_9800 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_9810
        * @tc.name      : checkAuthTokenVisibility callback
        * @tc.desc      : test the type of parameters does not match(callback不匹配)
        */
        it('ActsAccountErrCode_9810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_9810 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_9810 creat finish====");
            try {
                appAccountManager.checkAuthTokenVisibility("test_name", "test_authType", "test_bundleName", 12234);
            } catch(err) {
                console.info("====>ActsAccountErrCode_9810 checkAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_9810 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6600
        * @tc.name      : checkAuthTokenVisibility promise
        * @tc.desc      : test the number of parameters does not match
        */
        it('ActsAccountErrCode_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_9900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_9900 creat finish====");
            try {
                var visibility = appAccountManager.checkAuthTokenVisibility("test_name");
            } catch(err) {
                console.info("====>ActsAccountErrCode_9900 checkAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_9900 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_10000
        * @tc.name      : checkAuthTokenVisibility promise
        * @tc.desc      : test the type of parameters does not match(name不匹配)
        */
        it('ActsAccountErrCode_10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_6700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_10000 creat finish====");
            try {
                var visibility = appAccountManager.checkAuthTokenVisibility(12345, "test_authType", "test_bundleName");
            } catch(err) {
                console.info("====>ActsAccountErrCode_10000 checkAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_10000 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6710
        * @tc.name      : checkAuthTokenVisibility promise
        * @tc.desc      : test the type of parameters does not match(authType不匹配)
        */
        it('ActsAccountErrCode_10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_10010 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_10010 creat finish====");
            try {
                var visibility = appAccountManager.checkAuthTokenVisibility("test_name", 1234, "test_bundleName");
            } catch(err) {
                console.info("====>ActsAccountErrCode_10010 checkAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_10010 end====");
                done();
            }  
        });

        /*
        * @tc.number    : ActsAccountErrCode_6720
        * @tc.name      : checkAuthTokenVisibility promise
        * @tc.desc      : test the type of parameters does not match(authType不匹配)
        */
        it('ActsAccountErrCode_10020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountErrCode_10020 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountErrCode_10020 creat finish====");
            try {
                var visibility = appAccountManager.checkAuthTokenVisibility("test_name", "test_authType", 12345);
            } catch(err) {
                console.info("====>ActsAccountErrCode_10020 checkAuthTokenVisibility catch err:" + JSON.stringify(err));
                expect(err.code).assertEqual(401);
                console.info("====>ActsAccountErrCode_10020 end====");
                done();
            }  
        });

    })
}
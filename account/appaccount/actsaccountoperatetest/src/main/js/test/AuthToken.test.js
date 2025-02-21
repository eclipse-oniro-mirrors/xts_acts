/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import account from '@ohos.account.appAccount'
import resmgr from '@ohos.resourceManager'
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import {AccountErrCode} from './AccountErrCode.test.js'

const LENGTHLIMIT = 512;
const TOKENLENGTHLIMIT = 1024;
const AUTHTYPELENGTHLIMIT = 1024;
const OWNERLENGTHLIMIT = 1024;
const ERR_JS_AUTH_TYPE_NOT_FOUND = 12300107;
const OWNERSELF = "com.example.actsaccountoperatetest";
export default function ActsAccountAuthToken() {
    describe('ActsAccountAuthToken', function () {

        /*
            * @tc.number    : testGetEntriesString101
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */

        var valid_owner_name = "com.example.actsaccountOauthtoken";
        it('ActsAccountAuthToken_9100', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_9100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_tokenTest_name",(err,)=>{
                console.debug("====>ActsAccountAuthToken_9100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_tokenTest_name","authType1","test_token1",(err)=>{
                    console.debug("====>ActsAccountAuthToken_9100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthToken("account_tokenTest_name","authType1","test_token2",(err)=>{
                        console.debug("====>ActsAccountAuthToken_9100 setAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setAuthTokenVisibility("account_tokenTest_name","authType1",valid_owner_name,true,(err)=>{
                            console.debug("====>ActsAccountAuthToken_9100 setAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.setAuthToken("account_tokenTest_name","authType2","test_token2",(err)=>{
                                console.debug("====>ActsAccountAuthToken_9100 setAuthToken err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                    console.debug("====>ActsAccountAuthToken_9100 getAllAuthTokens err:" + JSON.stringify(err));
                                    console.debug("====>ActsAccountAuthToken_9100 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                    expect(err).assertEqual(null);
                                    expect(ArrayData.length).assertEqual(2);
                                    appAccountManager.deleteAuthToken("account_tokenTest_name",OWNERSELF,"authType1","test_token2",(err)=>{
                                        console.debug("====>ActsAccountAuthToken_9100 deleteAuthToken err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        appAccountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                            console.debug("====>ActsAccountAuthToken_9100 getAllAuthTokens err:" + JSON.stringify(err));
                                            console.debug("====>ActsAccountAuthToken_9100 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                            expect(err).assertEqual(null);
                                            expect(ArrayData.length).assertEqual(1);
                                            appAccountManager.removeAccount("account_tokenTest_name",(err)=>{
                                                console.debug("====>ActsAccountAuthToken_9100 removeAccount err:" + JSON.stringify(err));
                                                expect(err).assertEqual(null);
                                                console.debug("====>ActsAccountAuthToken_9100 end====");
                                                done();
                                                appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                                                    console.debug("====>ActsAccountAuthToken_9100 getAuthToken err:" + JSON.stringify(err));
                                                    console.debug("====>ActsAccountAuthToken_9100 getAuthToken data:" + data);
                                                    expect(err.code).assertEqual(AccountErrCode.ERR_JS_ACCOUNT_NOT_FOUND);
                                                    console.debug("====>ActsAccountAuthToken_9100 end====");
                                                    done();
                                                });
                                            });    
                                        }); 
                                    });   
                                });  
                            }); 
                        });
                    });
                });
            });
        });


        it('ActsAccountAuthToken_9000', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_9000 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_tokenTest_name",(err,)=>{
                console.debug("====>ActsAccountAuthToken_9000 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_tokenTest_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_9000 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                        console.debug("====>ActsAccountAuthToken_9000 getAuthToken err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_9000 getAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("test_token");
                        appAccountManager.setAuthTokenVisibility("account_tokenTest_name","authType",valid_owner_name,true,(err)=>{
                            console.debug("====>ActsAccountAuthToken_9000 setAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getAuthList("account_tokenTest_name","authType",(err,dataArray)=>{
                                console.debug("====>ActsAccountAuthToken_9000 getAuthList err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_9000 getAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(1);
                                expect(dataArray[0]).assertEqual(valid_owner_name);
                                appAccountManager.deleteAuthToken("account_tokenTest_name",OWNERSELF,"authType","test_token",(err)=>{
                                    console.debug("====>ActsAccountAuthToken_9000 deleteAuthToken err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    appAccountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                        console.debug("====>ActsAccountAuthToken_9000 getAllAuthTokens err:" + JSON.stringify(err));
                                        console.debug("====>ActsAccountAuthToken_9000 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                        expect(err).assertEqual(null);
                                        expect(ArrayData.length).assertEqual(0);
                                        appAccountManager.setAuthTokenVisibility("account_tokenTest_name","authType",OWNERSELF,false,(err)=>{
                                            console.debug("====>ActsAccountAuthToken_9000 setAuthTokenVisibility err:" + JSON.stringify(err));
                                            expect(err.code).assertEqual(12300002);
                                            appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                                                console.debug("====>ActsAccountAuthToken_9000 getAuthToken err:" + JSON.stringify(err));
                                                console.debug("====>ActsAccountAuthToken_9000 getAuthToken data:" + data);
                                                expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND);
                                                expect(data).assertEqual(null);
                                                appAccountManager.removeAccount("account_tokenTest_name",(err)=>{
                                                    console.debug("====>ActsAccountAuthToken_9000 removeAccount err:" + JSON.stringify(err));
                                                    expect(err).assertEqual(null);
                                                    console.debug("====>ActsAccountAuthToken_9000 end====");
                                                    done();
                                                });
                                            });    
                                        }); 
                                    });   
                                });  
                            }); 
                        });
                    });
                });
            });
        });



        it('ActsAccountAuthToken_7100', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_7100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_7100 createAccount start====");
            appAccountManager.createAccount("account_tokenTest_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_7100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_tokenTest_name","authType1","test_token1",(err)=>{
                    console.debug("====>ActsAccountAuthToken_7100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthToken("account_tokenTest_name","authType1","test_token2",(err)=>{
                        console.debug("====>ActsAccountAuthToken_7100 setAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setAuthToken("account_tokenTest_name","authType2","test_token2",(err)=>{
                            console.debug("====>ActsAccountAuthToken_7100 setAuthToken err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                console.debug("====>ActsAccountAuthToken_7100 getAllAuthTokens err:" + JSON.stringify(err));
                                console.debug("====>ActsAccountAuthToken_7100 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                expect(err).assertEqual(null);
                                expect(ArrayData.length).assertEqual(2);
                                expect(ArrayData[0].authType).assertEqual("authType1");
                                expect(ArrayData[0].token).assertEqual("test_token2");
                                expect(ArrayData[1].authType).assertEqual("authType2");
                                expect(ArrayData[1].token).assertEqual("test_token2");
                                appAccountManager.deleteAuthToken("account_tokenTest_name",OWNERSELF,"authType1","test_token2",(err)=>{
                                    console.debug("====>ActsAccountAuthToken_7100 deleteAuthToken err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    appAccountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                        console.debug("====>ActsAccountAuthToken_7100 getAllAuthTokens err:" + JSON.stringify(err));
                                        console.debug("====>ActsAccountAuthToken_7100 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                        expect(err).assertEqual(null);
                                        expect(ArrayData.length).assertEqual(1);
                                        expect(ArrayData[0].authType).assertEqual("authType2");
                                        expect(ArrayData[0].token).assertEqual("test_token2");
                                        appAccountManager.removeAccount("account_tokenTest_name",(err)=>{
                                            console.debug("====>ActsAccountAuthToken_7100 removeAccount err:" + JSON.stringify(err));
                                            expect(err).assertEqual(null);
                                            appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                                                console.debug("====>ActsAccountAuthToken_7100 getAuthToken err:" + JSON.stringify(err));
                                                console.debug("====>ActsAccountAuthToken_7100 getAuthToken data:" + data);
                                                expect(err.code!=0).assertEqual(true);
                                                expect(data).assertEqual(null);
                                                console.debug("====>ActsAccountAuthToken_7100 end====");
                                                done();
                                            });
                                        });
                                    });    
                                }); 
                            });
                        });
                    });
                });
            });
        });


        it('ActsAccountAuthToken_7200', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_7200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_tokenTest_name",(err,)=>{
                console.debug("====>ActsAccountAuthToken_7200 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_tokenTest_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_7200 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                        console.debug("====>ActsAccountAuthToken_7200 getAuthToken err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_7200 getAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("test_token");
                        appAccountManager.getAuthList("account_tokenTest_name","authType",(err,dataArray)=>{
                            console.debug("====>ActsAccountAuthToken_7200 getAuthList err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_7200 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray.length).assertEqual(0);
                            appAccountManager.removeAccount("account_tokenTest_name",(err)=>{
                                console.debug("====>ActsAccountAuthToken_7200 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_7200 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });

        it('ActsAccountAuthToken_7300', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_7300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_7300 createAccount start====");
            appAccountManager.createAccount("account_tokenTest_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_7300 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_tokenTest_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_7300 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                        console.debug("====>ActsAccountAuthToken_7300 getAuthToken err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_7300 getAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("test_token");
                        appAccountManager.checkAuthTokenVisibility("account_tokenTest_name","authType",OWNERSELF,(err,stateBack)=>{
                            console.debug("====>ActsAccountAuthToken_7300 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            console.debug("====>ActsAccountAuthToken_7300 checkAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(true);
                            appAccountManager.setAuthTokenVisibility("account_tokenTest_name","authType",OWNERSELF,false,(err)=>{
                                console.debug("====>ActsAccountAuthToken_7300 setAuthTokenVisibility err:" + JSON.stringify(err));
                                expect(err.code).assertEqual(12300002);
                                appAccountManager.checkAuthTokenVisibility("account_tokenTest_name","authType",OWNERSELF,(err,stateBack)=>{
                                    console.debug("====>ActsAccountAuthToken_7300 checkAuthTokenVisibility err:" + JSON.stringify(err));
                                    console.debug("====>ActsAccountAuthToken_7300 checkAuthTokenVisibility stateBack:" + stateBack);
                                    expect(err).assertEqual(null);
                                    expect(stateBack).assertEqual(true);
                                    appAccountManager.deleteAuthToken("account_tokenTest_name",OWNERSELF,"authType","test_token",(err)=>{
                                        console.debug("====>ActsAccountAuthToken_7300 deleteAuthToken err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        appAccountManager.removeAccount("account_tokenTest_name",(err)=>{
                                            console.debug("====>ActsAccountAuthToken_7300 removeAccount err:" + JSON.stringify(err));
                                            expect(err).assertEqual(null);
                                            console.debug("====>ActsAccountAuthToken_7300 end====");
                                            done();
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });

        it('ActsAccountAuthToken_7400', 0, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT + 1; i++){
                limitAuthType += 'c';
            }
            console.debug("====>ActsAccountAuthToken_7400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_7400 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_limit",(err)=>{
                console.debug("====>ActsAccountAuthToken_7400 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_limit","authType","callback_authType_limit_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_7400 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_authType_limit",OWNERSELF,limitAuthType,"callback_authType_limit_token",(err)=>{
                        console.debug("====>ActsAccountAuthToken_7400 getAuthToken err:" + JSON.stringify(err));
                        expect(err.code!=0).assertEqual(true);
                        appAccountManager.removeAccount("account_callback_authType_limit",(err)=>{
                            console.debug("====>ActsAccountAuthToken_7400 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_7400 end====");
                            done();
                        });
                    });
                });
            });
        });


        it('ActsAccountAuthToken_7500', 0, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT + 1; i++){
                limitAuthType += 'c';
            }
            console.debug("====>ActsAccountAuthToken_7500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_7500 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_limit");
            console.debug("====>ActsAccountAuthToken_7500 getAuthToken start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_authType_limit",OWNERSELF,limitAuthType,"promise_authType_limit_token");
            }
            catch(err){
                console.debug("====>ActsAccountAuthToken_7500 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_7500 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_authType_limit");
                console.debug("====>ActsAccountAuthToken_7500 end====");
                done();
            }
        });



        it('ActsAccountAuthToken_7600', 0, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT; i++){
                limitAuthType += 'c';
            }
            console.debug("====>ActsAccountAuthToken_7600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_7600 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_limit",(err)=>{
                console.debug("====>ActsAccountAuthToken_7600 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_limit",limitAuthType,"callback_authType_limit_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_7600 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_authType_limit",OWNERSELF,limitAuthType,"callback_authType_limit_token",(err)=>{
                        console.debug("====>ActsAccountAuthToken_7600 getAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_authType_limit",(err)=>{
                            console.debug("====>ActsAccountAuthToken_7600 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_7600 end====");
                            done();
                        });
                    });
                });
            });
        });

        it('ActsAccountAuthToken_7700', 0, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT; i++){
                limitAuthType += 'c';
            }
            console.debug("====>ActsAccountAuthToken_7700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_7700 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_limit")
            console.debug("====>ActsAccountAuthToken_7700 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_authType_limit",limitAuthType,"promise_authType_limit_token");
            console.debug("====>ActsAccountAuthToken_7700 deleteAuthToken start====");
            await appAccountManager.deleteAuthToken("account_promise_authType_limit",OWNERSELF,limitAuthType,"promise_authType_limit_token")
            console.debug("====>ActsAccountAuthToken_7700 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_authType_limit")
            console.debug("====>ActsAccountAuthToken_7700 end====");
            done();

        });


        
        it('ActsAccountAuthToken_7800', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_7800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_7800 createAccount start====");
            appAccountManager.createAccount("account_callback_empty_authType",(err)=>{
                console.debug("====>ActsAccountAuthToken_7800 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_empty_authType","authType","callback_empty_authType_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_7800 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_empty_authType",OWNERSELF,"","callback_empty_authType_token",(err)=>{
                        console.debug("====>ActsAccountAuthToken_7800 deleteAuthToken err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND);
                        appAccountManager.getAuthToken("account_callback_empty_authType",OWNERSELF,"authType",(err,data)=>{
                            console.debug("====>ActsAccountAuthToken_7800 getAuthToken err:" + JSON.stringify(err));
                            console.debug("====>ActsAccountAuthToken_7800 getAuthToken data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_empty_authType_token");
                            appAccountManager.removeAccount("account_callback_empty_authType",(err)=>{
                                console.debug("====>ActsAccountAuthToken_7800 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_7800 end====");
                                done();
                            });
                        });
                    });
                });
            });
        });

        it('ActsAccountAuthToken_7900', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_7900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_7900 createAccount start====");
            await appAccountManager.createAccount("account_promise_empty_authType");
            console.debug("====>ActsAccountAuthToken_7900 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_empty_authType","authType","promise_empty_authType_token");
            
            try {
                console.debug("====>ActsAccountAuthToken_7900 deleteAuthToken start====");
                await appAccountManager.deleteAuthToken("account_promise_empty_authType",OWNERSELF,"","promise_empty_authType_token");
            } catch(err) {
                console.debug("====>ActsAccountAuthToken_7900 deleteAuthToken err:" + JSON.stringify(err));
                expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND);
                console.debug("====>ActsAccountAuthToken_7900 getAuthToken start====");
                var data = await appAccountManager.getAuthToken("account_promise_empty_authType",OWNERSELF,"authType");
                expect(data).assertEqual("promise_empty_authType_token");
                console.debug("====>ActsAccountAuthToken_7900 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_empty_authType");
                console.debug("====>ActsAccountAuthToken_7900 end====");
                done();

            }
        });


        it('ActsAccountAuthToken_8000', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_8000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_8000 createAccount start====");
            appAccountManager.createAccount("account_callback_setSameAuthType",(err)=>{
                console.debug("====>ActsAccountAuthToken_8000 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_token1",(err)=>{
                    console.debug("====>ActsAccountAuthToken_8000 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_token2",(err)=>{
                        console.debug("====>ActsAccountAuthToken_8000 setAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthToken("account_callback_setSameAuthType",OWNERSELF,"authType",(err,data)=>{
                            console.debug("====>ActsAccountAuthToken_8000 getAuthToken err:" + JSON.stringify(err));
                            console.debug("====>ActsAccountAuthToken_8000 getAuthToken data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_setSameAuthType_token2");
                            appAccountManager.deleteAuthToken("account_callback_setSameAuthType",OWNERSELF,"authType","callback_setSameAuthType_token1",(err,data)=>{
                                console.debug("====>ActsAccountAuthToken_8000 deleteAuthToken err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.removeAccount("account_callback_setSameAuthType",(err)=>{
                                    console.debug("====>ActsAccountAuthToken_8000 removeAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.debug("====>ActsAccountAuthToken_8000 end====");
                                    done();
                                }); 
                            }); 
                        });
                    });
                });
            });
        });


        it('ActsAccountAuthToken_8100', 0, async function (done) {
            var limitName = '';
            for(var i = 0;i < LENGTHLIMIT + 1; i++){
                limitName += 'c';
            }
            console.debug("====>ActsAccountAuthToken_8100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_8100 getAllAuthTokens start====");
            appAccountManager.getAllAuthTokens(limitName, OWNERSELF).then((ArrayData)=>{
                console.debug("====>ActsAccountAuthToken_8100 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));           
                expect(ArrayData.length).assertEqual(0);
                console.debug("====>ActsAccountAuthToken_8100 ====");
                done();
            }).catch((err)=>{
                expect(err.code!=0).assertEqual(true);
                done();
            })
        });
        
        it('ActsAccountAuthToken_8200', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_8200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_8200 getAllAuthTokens start====");
            appAccountManager.getAllAuthTokens("", OWNERSELF,(err,ArrayData)=>{
                console.debug("====>ActsAccountAuthToken_8200 getAllAuthTokens err:" + JSON.stringify(err));
                console.debug("====>ActsAccountAuthToken_8200 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_8200 ====");
                done();
            });
        });

        it('ActsAccountAuthToken_8300', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_8300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_8300 getAllAuthTokens start====");
            appAccountManager.getAllAuthTokens("acount_no_setToken", OWNERSELF,(err,ArrayData)=>{
                console.debug("====>ActsAccountAuthToken_8300 getAllAuthTokens err:" + JSON.stringify(err));
                console.debug("====>ActsAccountAuthToken_8300 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                expect(err.code!=0).assertEqual(true);
                expect(ArrayData).assertEqual(null);
                console.debug("====>ActsAccountAuthToken_8300 end====");
                done();
            });
        });



        it('ActsAccountAuthToken_8400', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_8400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_8400 createAccount start====");
            appAccountManager.createAccount("acount_no_setToken",(err)=>{
                console.debug("====>ActsAccountAuthToken_8400 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAuthTokens("acount_no_setToken", OWNERSELF,(err,ArrayData)=>{
                    console.debug("====>ActsAccountAuthToken_8400 getAllAuthTokens err:" + JSON.stringify(err));
                    console.debug("====>ActsAccountAuthToken_8400 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err).assertEqual(null);
                    expect(ArrayData.length).assertEqual(0);
                    appAccountManager.removeAccount("acount_no_setToken",(err)=>{
                        console.debug("====>ActsAccountAuthToken_8400 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountAuthToken_8400 end====");
                        done();
                    });
                });
            });
        });



        it('ActsAccountAuthToken_8500', 0, async function (done) {
            var limitName = '';
            for(var i = 0;i < LENGTHLIMIT; i++){
                limitName += 'c';
            }
            console.debug("====>ActsAccountAuthToken_8500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_8500 createAccount start====");
            appAccountManager.createAccount(limitName,(err)=>{
                console.debug("====>ActsAccountAuthToken_8500 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken(limitName,"authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_8500 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAllAuthTokens(limitName, OWNERSELF,(err,ArrayData)=>{
                        console.debug("====>ActsAccountAuthToken_8500 getAllAuthTokens err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_8500 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                        expect(err).assertEqual(null);
                        expect(ArrayData.length).assertEqual(1);
                        expect(ArrayData[0].authType).assertEqual("authType");
                        expect(ArrayData[0].token).assertEqual("test_token");
                        appAccountManager.removeAccount(limitName,(err)=>{
                            console.debug("====>ActsAccountAuthToken_8500 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_8500 end====");
                            done();
                        });
                    });
                });
            });
        });


        it('ActsAccountAuthToken_8600', 0, async function (done) {
            var limitOwner = '';
            for(var i = 0;i < OWNERLENGTHLIMIT + 1; i++){
                limitOwner += 'c';
            }
            console.debug("====>ActsAccountAuthToken_8600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_8600 createAccount start====");
            appAccountManager.createAccount("account_callback_getAllAuthTokens_test",(err)=>{
                console.debug("====>ActsAccountAuthToken_8600 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test",limitOwner,(err,ArrayData)=>{
                    console.debug("====>ActsAccountAuthToken_8600 getAllAuthTokens err:" + JSON.stringify(err));
                    console.debug("====>ActsAccountAuthToken_8600 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err.code!=0).assertEqual(true);
                    expect(ArrayData).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_getAllAuthTokens_test",(err)=>{
                        console.debug("====>ActsAccountAuthToken_8600 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountAuthToken_8600 end====");
                        done();
                    });
                });
            });
        });
        

        it('ActsAccountAuthToken_8700', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_8700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_8700 createAccount start====");
            appAccountManager.createAccount("account_callback_getAllAuthTokens_test",(err)=>{
                console.debug("====>ActsAccountAuthToken_8700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test","",(err,ArrayData)=>{
                    console.debug("====>ActsAccountAuthToken_8700 getAllAuthTokens err:" + JSON.stringify(err));
                    console.debug("====>ActsAccountAuthToken_8700 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err.code!=0).assertEqual(true);
                    expect(ArrayData).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_getAllAuthTokens_test",(err)=>{
                        console.debug("====>ActsAccountAuthToken_8700 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountAuthToken_8700 end====");
                        done();
                    });
                });
            });
        });

        
        it('ActsAccountAuthToken_8800', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_8800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_8800 createAccount start====");
            appAccountManager.createAccount("account_callback_getAllAuthTokens_test",(err)=>{
                console.debug("====>ActsAccountAuthToken_8800 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test","invalid_owner",(err,ArrayData)=>{
                    console.debug("====>ActsAccountAuthToken_8800 getAllAuthTokens err:" + JSON.stringify(err));
                    console.debug("====>ActsAccountAuthToken_8800 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err.code!=0).assertEqual(true);
                    expect(ArrayData).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_getAllAuthTokens_test",(err)=>{
                        console.debug("====>ActsAccountAuthToken_8800 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountAuthToken_8800 end====");
                        done();
                    });
                });
            });
        });

        it('ActsAccountAuthToken_8900', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_8900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_8900 createAccount start====");
            appAccountManager.createAccount("account_callback_getAllAuthTokens_test",(err)=>{
                console.debug("====>ActsAccountAuthToken_8900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test"," ",(err,ArrayData)=>{
                    console.debug("====>ActsAccountAuthToken_8900 getAllAuthTokens err:" + JSON.stringify(err));
                    console.debug("====>ActsAccountAuthToken_8900 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err.code!=0).assertEqual(true);
                    expect(ArrayData).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_getAllAuthTokens_test",(err)=>{
                        console.debug("====>ActsAccountAuthToken_8900 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountAuthToken_8900 end====");
                        done();
                    });
                });
            });
        });




        it('ActsAccountAuthToken_0100', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_0100 createAccount start====");
            appAccountManager.createAccount("account_callback_normal",(err)=>{
                console.debug("====>ActsAccountAuthToken_0100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_normal","authType","callback_normal_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_0100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_normal",OWNERSELF,"authType",(err,data)=>{
                        console.debug("====>ActsAccountAuthToken_0100 getAuthToken err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_0100 getAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("callback_normal_token");
                        appAccountManager.checkAuthTokenVisibility("account_callback_normal","authType",OWNERSELF,(err,stateBack)=>{
                            console.debug("====>ActsAccountAuthToken_0100 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            console.debug("====>ActsAccountAuthToken_0100 checkAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(true);
                            appAccountManager.deleteAuthToken("account_callback_normal",OWNERSELF,"authType","callback_normal_token",(err)=>{
                                console.debug("====>ActsAccountAuthToken_0100 deleteAuthToken err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.removeAccount("account_callback_normal",(err)=>{
                                    console.debug("====>ActsAccountAuthToken_0100 removeAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.debug("====>ActsAccountAuthToken_0100 end====");
                                    done();
                                });
                            });
                        });
                    });
                });
            });
        });


        it('ActsAccountAuthToken_0200', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_0200 createAccount start====");
            await appAccountManager.createAccount("account_promise_normal");
            console.debug("====>ActsAccountAuthToken_0200 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_normal","authType","promise_normal_token");
            console.debug("====>ActsAccountAuthToken_0200 getAuthToken start====");
            var data1 = await appAccountManager.getAuthToken("account_promise_normal",OWNERSELF,"authType");
            console.debug("====>getAuthToken ActsAccountAuthToken_0200 data:" + data1);
            expect(data1).assertEqual("promise_normal_token");
            console.debug("====>ActsAccountAuthToken_0200 checkAuthTokenVisibility start====");
            var state = await appAccountManager.checkAuthTokenVisibility("account_promise_normal","authType",OWNERSELF);
            console.debug("====>checkAuthTokenVisibility ActsAccountAuthToken_0200 state:" + state);
            expect(state).assertEqual(true);
            console.debug("====>ActsAccountAuthToken_0200 deleteAuthToken start====");
            await appAccountManager.deleteAuthToken("account_promise_normal",OWNERSELF,"authType","promise_normal_token");
            console.debug("====>ActsAccountAuthToken_0200 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_normal");
            console.debug("====>ActsAccountAuthToken_0200 end====");
            done();
        });




        it('ActsAccountAuthToken_0300', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_0300 getAuthToken start====");
            appAccountManager.createAccount("account_callback_noSetToken",(err)=>{
                console.debug("====>ActsAccountAuthToken_0300 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAuthToken("account_callback_noSetToken",OWNERSELF,"authType",(err,data)=>{
                    console.debug("====>ActsAccountAuthToken_0300 getAuthToken err:" + JSON.stringify(err));
                    console.debug("====>ActsAccountAuthToken_0300 getAuthToken data:" + data);
                    expect(err.code!=0).assertEqual(true);
                    expect(data).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_noSetToken",(err)=>{
                        console.debug("====>ActsAccountAuthToken_0300 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountAuthToken_0300 end====");
                        done();
                    });
                });
            });
        });

        it('ActsAccountAuthToken_0400', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_0400 createAccount start====");
            await appAccountManager.createAccount("account_promise_noSetToken");
            console.debug("====>ActsAccountAuthToken_0400 getAuthToken start====");
            try{
                await appAccountManager.getAuthToken("account_promise_noSetToken",OWNERSELF,"authType");
            }
            catch(err){
                console.debug("====>ActsAccountAuthToken_0400 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_0400 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_noSetToken");
                console.debug("====>ActsAccountAuthToken_0400 end====");
                done();
            }
        });


        it('ActsAccountAuthToken_0500', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_0500 getAuthToken start====");
            appAccountManager.getAuthToken("noAdd_account_callback",OWNERSELF,"authType",(err,data)=>{
                console.debug("====>ActsAccountAuthToken_0500 getAuthToken err:" + JSON.stringify(err));
                console.debug("====>ActsAccountAuthToken_0500 getAuthToken data:" + data);
                expect(err.code!=0).assertEqual(true);
                expect(data).assertEqual(null);
                done();
            });
        });

        it('ActsAccountAuthToken_0600', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_0600 getAuthToken start====");
            try{
                await appAccountManager.getAuthToken("noAdd_account_promise",OWNERSELF,"authType");
            }
            catch(err){
                console.debug("====>ActsAccountAuthToken_0600 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_0600 end====");
                done();
            }
        });


        it('ActsAccountAuthToken_0700', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_0700 createAccount start====");
            appAccountManager.createAccount("account_callback_setSameAuthType",(err)=>{
                console.debug("====>ActsAccountAuthToken_0700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_0700 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_token",(err)=>{
                        console.debug("====>ActsAccountAuthToken_0700 setAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthToken("account_callback_setSameAuthType",OWNERSELF,"authType",(err,data)=>{
                            console.debug("====>ActsAccountAuthToken_0700 getAuthToken err:" + JSON.stringify(err));
                            console.debug("====>ActsAccountAuthToken_0700 getAuthToken data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_setSameAuthType_token");
                            appAccountManager.setAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_DiffToken",(err)=>{
                                console.debug("====>ActsAccountAuthToken_0700 setAuthToken err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.getAuthToken("account_callback_setSameAuthType",OWNERSELF,"authType",(err,data)=>{
                                    console.debug("====>ActsAccountAuthToken_0700 getAuthToken err:" + JSON.stringify(err));
                                    console.debug("====>ActsAccountAuthToken_0700 getAuthToken data:" + data);
                                    expect(err).assertEqual(null);
                                    expect(data).assertEqual("callback_setSameAuthType_DiffToken");
                                    appAccountManager.removeAccount("account_callback_setSameAuthType",(err)=>{
                                        console.debug("====>ActsAccountAuthToken_0700 removeAccount err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        console.debug("====>ActsAccountAuthToken_0700 end====");
                                        done();
                                    });
                                });
                            });   
                        });
                    });
                });
            });
        });




        it('ActsAccountAuthToken_0800', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_0800 createAccount start====");
            await appAccountManager.createAccount("account_promise_setSameAuthType");
            console.debug("====>ActsAccountAuthToken_0800 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_setSameAuthType","authType","promise_setSameAuthType_token");
            console.debug("====>ActsAccountAuthToken_0800 repeat setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_setSameAuthType","authType","promise_setSameAuthType_token");
            var data1 = await appAccountManager.getAuthToken("account_promise_setSameAuthType",OWNERSELF,"authType");
            console.debug("====>getAuthToken ActsAccountAuthToken_0800 data:" + data1);
            expect(data1).assertEqual("promise_setSameAuthType_token");
            console.debug("====>ActsAccountAuthToken_0800 repeat set diffToken setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_setSameAuthType","authType","promise_setSameAuthType_DiffToken");
            var data2 = await appAccountManager.getAuthToken("account_promise_setSameAuthType",OWNERSELF,"authType");
            console.debug("====>getAuthToken ActsAccountAuthToken_0800 data:" + data2);
            expect(data2).assertEqual("promise_setSameAuthType_DiffToken");
            console.debug("====>ActsAccountAuthToken_0800 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_setSameAuthType");
            console.debug("====>ActsAccountAuthToken_0800 end====");
            done();
        });



        it('ActsAccountAuthToken_0900', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_setDiff", (err)=>{
                console.debug("====>createAccount ActsAccountAuthToken_0900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_setDiff","authType1","callback_setDiff_token1",(err)=>{
                    console.debug("====>getAuthToken ActsAccountAuthToken_0900 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthToken("account_callback_setDiff","authType2","callback_setDiff_token2",(err)=>{
                        console.debug("====>getAuthToken ActsAccountAuthToken_0900 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthToken("account_callback_setDiff",OWNERSELF,"authType1", (err, data)=>{
                            console.debug("====>getAuthToken ActsAccountAuthToken_0900 err:" + JSON.stringify(err));
                            console.debug("====>getAuthToken ActsAccountAuthToken_0900 data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_setDiff_token1");
                            appAccountManager.getAuthToken("account_callback_setDiff",OWNERSELF,"authType2", (err, data)=>{
                                console.debug("====>getAuthToken ActsAccountAuthToken_0900 err:" + JSON.stringify(err));
                                console.debug("====>getAuthToken ActsAccountAuthToken_0900 data:" + data);
                                expect(err).assertEqual(null);
                                expect(data).assertEqual("callback_setDiff_token2");
                                appAccountManager.removeAccount("account_callback_setDiff", (err)=>{
                                    console.debug("====>removeAccount ActsAccountAuthToken_0900 err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.debug("====>ActsAccountAuthToken_0900 end====");
                                    done();
                                });   
                            });    
                        });
                    });
                });    
            });
        });



        it('ActsAccountAuthToken_1000', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_1000 createAccount start====");
            await appAccountManager.createAccount("account_promise_setDiff");
            console.debug("====>setAuthToken ActsAccountAuthToken_1000 start====");
            await appAccountManager.setAuthToken("account_promise_setDiff","aythType1","promise_setDiff_token1");
            console.debug("====>setAuthToken ActsAccountAuthToken_1000 start====");
            await appAccountManager.setAuthToken("account_promise_setDiff","aythType2","promise_setDiff_token2");

            console.debug("====>getAuthToken ActsAccountAuthToken_1000 start====");
            var data1 = await appAccountManager.getAuthToken("account_promise_setDiff",OWNERSELF,"aythType1");
            console.debug("====>getAuthToken getOld ActsAccountAuthToken_1000 data:" + data1);
            expect(data1).assertEqual("promise_setDiff_token1");
            console.debug("====>getAuthToken ActsAccountAuthToken_1000 start====");
            var data2 = await appAccountManager.getAuthToken("account_promise_setDiff",OWNERSELF,"aythType2");
            console.debug("====>getAuthToken getNew ActsAccountAuthToken_1000 data:" + data2);
            expect(data2).assertEqual("promise_setDiff_token2");

            console.debug("====>deleteAuthToken ActsAccountAuthToken_1000 start====");
            await appAccountManager.deleteAuthToken("account_promise_setDiff",OWNERSELF,"aythType1","promise_setDiff_token1");
            console.debug("====>deleteAuthToken ActsAccountAuthToken_1000 start====");
            await appAccountManager.deleteAuthToken("account_promise_setDiff",OWNERSELF,"aythType2","promise_setDiff_token2");
            console.debug("====>ActsAccountAuthToken_1000 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_setDiff");
            console.debug("====>ActsAccountAuthToken_1000 end====");
            done();
        });



        it('ActsAccountAuthToken_1100', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_setDeleteGet", (err)=>{
                console.debug("====>createAccount ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_setDeleteGet","old_authType","callback_setDeleteGet_token",(err)=>{
                    console.debug("====>getAuthToken ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthToken("account_callback_setDeleteGet","new_authType","callback_setDeleteGet_token",(err)=>{
                        console.debug("====>getAuthToken ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"old_authType", (err, data)=>{
                            console.debug("====>getAuthToken getOld ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                            console.debug("====>getAuthToken getOld ActsAccountAuthToken_1100 data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_setDeleteGet_token");
                            appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"new_authType", (err, data)=>{
                                console.debug("====>getAuthToken getNew ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                console.debug("====>getAuthToken getNew ActsAccountAuthToken_1100 data:" + data);
                                expect(err).assertEqual(null);
                                expect(data).assertEqual("callback_setDeleteGet_token");
                                appAccountManager.deleteAuthToken("account_callback_setDeleteGet",OWNERSELF,"old_authType","callback_setDeleteGet_token",(err)=>{
                                    console.debug("====>deleteAuthToken deleteOld ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                    appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"old_authType", (err, data)=>{
                                        console.debug("====>getAuthToken getOld ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                        console.debug("====>getAuthToken getOld ActsAccountAuthToken_1100 data:" + data);
                                        expect(err.code!=0).assertEqual(true);
                                        expect(data).assertEqual(null);
                                        appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"new_authType", (err, data)=>{
                                            console.debug("====>getAuthToken getNew ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                            console.debug("====>getAuthToken getNew ActsAccountAuthToken_1100 data:" + data);
                                            expect(err).assertEqual(null);
                                            expect(data).assertEqual("callback_setDeleteGet_token");
                                            appAccountManager.deleteAuthToken("account_callback_setDeleteGet",OWNERSELF,"new_authType","callback_setDeleteGet_token",(err)=>{
                                                console.debug("====>deleteAuthToken deleteNew ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                                appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"old_authType", (err, data)=>{
                                                    console.debug("====>getAuthToken getOld ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                                    console.debug("====>getAuthToken getOld ActsAccountAuthToken_1100 data:" + data);
                                                    expect(err.code!=0).assertEqual(true);
                                                    expect(data).assertEqual(null);
                                                    appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"new_authType", (err, data)=>{
                                                        console.debug("====>getAuthToken getNew ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                                        console.debug("====>getAuthToken getNew ActsAccountAuthToken_1100 data:" + data);
                                                        expect(err.code!=0).assertEqual(true);
                                                        expect(data).assertEqual(null);
                                                        appAccountManager.removeAccount("account_callback_setDeleteGet", (err)=>{
                                                            console.debug("====>removeAccount ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                                            expect(err).assertEqual(null);
                                                            console.debug("====>ActsAccountAuthToken_1100 end====");
                                                            done();
                                                        });   
                                                    });
                                                })
                                            });
                                        });
                                    });
                                });
                            });    
                        });
                    });
                });    
            });
        });


        it('ActsAccountAuthToken_1200', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_1200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_1200 createAccount start====");
            await appAccountManager.createAccount("account_promise_setDeleteGet");

            console.debug("====>setAuthToken setOld ActsAccountAuthToken_1200 start====");
            await appAccountManager.setAuthToken("account_promise_setDeleteGet","old_authType","promise_setDeleteGet_token");
            console.debug("====>setAuthToken setNew ActsAccountAuthToken_1200 start====");
            await appAccountManager.setAuthToken("account_promise_setDeleteGet","new_authType","promise_setDeleteGet_token");

            console.debug("====>getAuthToken ActsAccountAuthToken_1200 start====");
            var data1BeforeDel = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"old_authType");
            console.debug("====>getAuthToken getOld ActsAccountAuthToken_1200 data1BeforeDel:" + data1BeforeDel);
            expect(data1BeforeDel).assertEqual("promise_setDeleteGet_token");
            console.debug("====>getAuthToken ActsAccountAuthToken_1200 start====");
            var data2BeforeDel = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"new_authType");
            console.debug("====>getAuthToken getNew ActsAccountAuthToken_1200 data2BeforeDel:" + data2BeforeDel);
            expect(data2BeforeDel).assertEqual("promise_setDeleteGet_token");

            console.debug("====>deleteAuthToken deleteOld ActsAccountAuthToken_1200 start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_setDeleteGet",OWNERSELF,"old_authType","promise_setDeleteGet_token");
            }
            catch(err){
                console.debug("====>deleteAuthToken ActsAccountAuthToken_1200 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
            }

            console.debug("====>getAuthToken ActsAccountAuthToken_1200 start====");
            try{
                var data1AfterDel = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"old_authType",);
                console.debug("====>getAuthToken getOld ActsAccountAuthToken_1200 data1_AfterDel:" + data1AfterDel);
                expect().assertFail();
            }
            catch(err){
                console.debug("====>getAuthToken getOld ActsAccountAuthToken_1200 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);                
            }
            console.debug("====>getAuthToken ActsAccountAuthToken_1200 start====");
            try{
                var data2AfterDel = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"new_authType",);
                console.debug("====>getAuthToken getOld ActsAccountAuthToken_1200 data2_AfterDel:" + data2AfterDel);
                expect(data2AfterDel).assertEqual("promise_setDeleteGet_token");
            }
            catch(err){
                console.debug("====>getAuthToken getNew ActsAccountAuthToken_1200 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
            }
            console.debug("====>deleteAuthToken deleteNew ActsAccountAuthToken_1200 start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_setDeleteGet",OWNERSELF,"new_authType","promise_setDeleteGet_token");
            }
            catch(err){
                console.debug("====>deleteAuthToken ActsAccountAuthToken_1200 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
            }

            console.debug("====>getAuthToken getOld ActsAccountAuthToken_1200 start====");
            try{
                var data1AgainDel = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"old_authType",);
                console.debug("====>getAuthToken getOld ActsAccountAuthToken_1200 data1_AgainDel:" + data1AgainDel);
                expect().assertFail();
            }
            catch(err){
                console.debug("====>getAuthToken getOld ActsAccountAuthToken_1200 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
            }
            console.debug("====>getAuthToken getNew ActsAccountAuthToken_1200 start====");
            try{
                var data2AgainDel = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"new_authType",);
                console.debug("====>getAuthToken getOld ActsAccountAuthToken_1200 data2_AgainDel:" + data2AgainDel);
                expect().assertFail();
            }
            catch(err){
                console.debug("====>getAuthToken getNew ActsAccountAuthToken_1200 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
            }
            await appAccountManager.removeAccount("account_promise_setDeleteGet");
            console.debug("====>ActsAccountAuthToken_1200 end====");
            done();

        });


        it('ActsAccountAuthToken_1300', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_1300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_setDeleteGet", (err)=>{
            console.debug("====>createAccount ActsAccountAuthToken_1300 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_setDeleteGet","authType","account_callback_setDeleteGet_token",(err)=>{
                    console.debug("====>getAuthToken ActsAccountAuthToken_1300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_setDeleteGet",OWNERSELF,"authType","account_callback_setDeleteGet_token",(err)=>{
                        console.debug("====>deleteAuthToken ActsAccountAuthToken_1300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"authType", (err, data)=>{
                            console.debug("====>getAuthToken ActsAccountAuthToken_1300 err:" + JSON.stringify(err));
                            console.debug("====>getAuthToken ActsAccountAuthToken_1300 data:" + data);
                            expect(err.code != 0).assertEqual(true);
                            expect(data).assertEqual(null);
                            appAccountManager.removeAccount("account_callback_setDeleteGet", (err)=>{
                                console.debug("====>removeAccount ActsAccountAuthToken_1300 err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_1300 end====");
                                done();
                            });
                        });
                    });
                });
            });
        });


        it('ActsAccountAuthToken_1400', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_1400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_1400 createAccount start====");
            await appAccountManager.createAccount("account_promise_setDeleteGet");
            console.debug("====>setAuthToken ActsAccountAuthToken_1400 start====");
            await appAccountManager.setAuthToken("account_promise_setDeleteGet","authType","promise_setDeleteGet_token");
            console.debug("====>deleteAuthToken ActsAccountAuthToken_1400 start====");
            await appAccountManager.deleteAuthToken("account_promise_setDeleteGet",OWNERSELF,"authType","promise_setDeleteGet_token");
            console.debug("====>getAuthToken ActsAccountAuthToken_1400 start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"authType");
            }
            catch(err){
                console.debug("====>getAuthToken ActsAccountAuthToken_1400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.debug("====>getAuthToken ActsAccountAuthToken_1400 data:" + data);
                console.debug("====>ActsAccountAuthToken_1400 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_setDeleteGet");
                console.debug("====>ActsAccountAuthToken_1400 end====");
                done();
            }
        });


        it('ActsAccountAuthToken_1500', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_1500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.setAuthToken("account_callback_accountNotExit","authType","account_callback_accountNotExit_token", (err)=>{
                console.debug("====>setAuthToken ActsAccountAuthToken_1500 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_1500 end====");
                done();
            });
        });

        it('ActsAccountAuthToken_1600', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_1600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>setAuthToken ActsAccountAuthToken_1600 start====");
            try{
                await appAccountManager.setAuthToken("account_promise_accountNotExit","authType","account_promise_accountNotExit_token");
            }
            catch(err){
                console.debug("====>setAuthToken ActsAccountAuthToken_1600 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_1600 end====");
                done();
            }
        });



        it('ActsAccountAuthToken_1700', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_1700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.deleteAuthToken("account_callback_accountNotExit",OWNERSELF,"authType","account_callback_accountNotExit_token", (err)=>{
                console.debug("====>deleteAuthToken ActsAccountAuthToken_1700 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_1700 end====");
                done();
            });
        });

        it('ActsAccountAuthToken_1800', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_1800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>deleteAuthToken ActsAccountAuthToken_1800 start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_accountNotExit",OWNERSELF,"authType","account_promise_accountNotExit_token");
            }
            catch(err){
                console.debug("====>deleteAuthToken ActsAccountAuthToken_1800 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_1800 end====");
                done();
            }
        });



        it('ActsAccountAuthToken_1900', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_1900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_repeatDelete", (err)=>{
                console.debug("====>createAccount ActsAccountAuthToken_1900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.deleteAuthToken("account_callback_repeatDelete",OWNERSELF,"aythType","promise_repeatDelete_token",(err)=>{
                    console.debug("====>deleteAuthToken  ActsAccountAuthToken_1900 err:" + JSON.stringify(err));
                    appAccountManager.getAuthToken("account_callback_repeatDelete",OWNERSELF,"authType", (err, data)=>{
                        console.debug("====>getAuthToken ActsAccountAuthToken_1900 err:" + JSON.stringify(err));
                        console.debug("====>getAuthToken ActsAccountAuthToken_1900 data:" + data);
                        expect(err.code != 0).assertEqual(true);
                        expect(data).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_repeatDelete", (err)=>{
                            console.debug("====>removeAccount ActsAccountAuthToken_1900 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_1900 end====");
                            done();
                        });
                    });
                });
            });
        });


        it('ActsAccountAuthToken_2000', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_2000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_2000 createAccount start====");
            await appAccountManager.createAccount("account_promise_noExitToken");
            console.debug("====>deleteAuthToken ActsAccountAuthToken_2000 start====");
            await appAccountManager.deleteAuthToken("account_promise_noExitToken",OWNERSELF,"aythType","test_token").catch((err)=>{
            console.debug("====>deleteAuthToken ActsAccountAuthToken_2000 err:" + JSON.stringify(err));
            });
            console.debug("====>getAuthToken ActsAccountAuthToken_2000 start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_noExitToken",OWNERSELF,"authType");
            }
            catch(err){
                console.debug("====>getAuthToken ActsAccountAuthToken_2000 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_2000 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_noExitToken");
                console.debug("====>ActsAccountAuthToken_2000 end====");
                done();
            }
        });


        it('ActsAccountAuthToken_2100', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_2100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_repeatDelete", (err)=>{
            console.debug("====>createAccount ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_repeatDelete","authType","",(err)=>{
                    console.debug("====>getAuthToken ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_repeatDelete",OWNERSELF,"aythType","promise_repeatDelete_token",(err)=>{
                        console.debug("====>deleteAuthToken first ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
                        appAccountManager.getAuthToken("account_callback_repeatDelete",OWNERSELF,"authType", (err, data)=>{
                            console.debug("====>getAuthToken first ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
                            console.debug("====>getAuthToken first ActsAccountAuthToken_2100 data:" + data);
                            expect(err.code != 0).assertEqual(true);
                            expect(data).assertEqual(null);
                            appAccountManager.deleteAuthToken("account_callback_repeatDelete",OWNERSELF,"aythType","promise_repeatDelete_token",(err)=>{
                                console.debug("====>deleteAuthToken second ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
                                appAccountManager.getAuthToken("account_callback_repeatDelete",OWNERSELF,"authType", (err, data)=>{
                                    console.debug("====>getAuthToken second ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
                                    console.debug("====>getAuthToken second ActsAccountAuthToken_2100 data:" + data);
                                    expect(err.code != 0).assertEqual(true);
                                    expect(data).assertEqual(null);
                                    appAccountManager.removeAccount("account_callback_repeatDelete", (err)=>{
                                        console.debug("====>removeAccount ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        console.debug("====>ActsAccountAuthToken_2100 end====");
                                        done();
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });



        it('ActsAccountAuthToken_2200', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_2200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_2200 createAccount start====");
            await appAccountManager.createAccount("account_promise_repeatDelete");
            console.debug("====>setAuthToken ActsAccountAuthToken_2200 start====");
            await appAccountManager.setAuthToken("account_promise_repeatDelete","aythType","promise_repeatDelete_token");
            console.debug("====>deleteAuthToken first ActsAccountAuthToken_2200 start====");
            await appAccountManager.deleteAuthToken("account_promise_repeatDelete",OWNERSELF,"aythType","promise_repeatDelete_token");            
            try{
                console.debug("====>deleteAuthToken second ActsAccountAuthToken_2200 start====");
                await appAccountManager.deleteAuthToken("account_promise_repeatDelete",OWNERSELF,"aythType","promise_repeatDelete_token");
            }catch(err){
                console.debug("====>deleteAuthToken second ActsAccountAuthToken_2200 err:" + JSON.stringify(err));
                expect(err.code == ERR_JS_AUTH_TYPE_NOT_FOUND).assertEqual(true);
            }  
            try{
                console.debug("====>getAuthToken ActsAccountAuthToken_2200 start====");
                var data = await appAccountManager.getAuthToken("account_promise_repeatDelete",OWNERSELF,"authType");
                done();
            }
            catch(err){
                console.debug("====>getAuthToken ActsAccountAuthToken_2200 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_2200 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_repeatDelete");
                console.debug("====>ActsAccountAuthToken_2200 end====");
                done();
            }
        });


        it('ActsAccountAuthToken_2300', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_2300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_setEmptyToken", (err)=>{
            console.debug("====>createAccount ActsAccountAuthToken_2300 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_setEmptyToken","authType","",(err)=>{
                    console.debug("====>getAuthToken ActsAccountAuthToken_2300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_setEmptyToken",OWNERSELF,"authType", (err, data)=>{
                        console.debug("====>getAuthToken ActsAccountAuthToken_2300 err:" + JSON.stringify(err));
                        console.debug("====>getAuthToken ActsAccountAuthToken_2300 data:" + data);
                        expect(err.code != 0).assertEqual(true);
                        expect(data).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_setEmptyToken", (err)=>{
                            console.debug("====>removeAccount ActsAccountAuthToken_2300 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_2300 end====");
                            done();
                        });
                    });
                });
            });
        });


        it('ActsAccountAuthToken_2400', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_2400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_2400 createAccount start====");
            await appAccountManager.createAccount("account_promise_setEmptyToken");
            console.debug("====>setAuthToken ActsAccountAuthToken_2400 start====");
            await appAccountManager.setAuthToken("account_promise_setEmptyToken","aythType","");
            console.debug("====>getAuthToken ActsAccountAuthToken_2400 start====");
            try{
                await appAccountManager.getAuthToken("account_promise_setEmptyToken","authType",limitToken);
            }
            catch(err){
                console.debug("====>getAuthToken ActsAccountAuthToken_2400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_2400 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_setEmptyToken");
                console.debug("====>ActsAccountAuthToken_2400 end====");
                done();
            }
        });



        it('ActsAccountAuthToken_2500', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_2500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_spaceToken", (err)=>{
            console.debug("====>createAccount ActsAccountAuthToken_2500 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_spaceToken","authType"," ",(err)=>{
                    console.debug("====>getAuthToken ActsAccountAuthToken_2500 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_spaceToken",OWNERSELF,"authType", (err, data)=>{
                        console.debug("====>getAuthToken ActsAccountAuthToken_2500 err:" + JSON.stringify(err));
                        console.debug("====>getAuthToken ActsAccountAuthToken_2500 data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual(" ");
                        appAccountManager.removeAccount("account_callback_spaceToken", (err)=>{
                            console.debug("====>removeAccount ActsAccountAuthToken_2500 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_2500 end====");
                            done();
                        });
                    });
                });
            });
        });


        it('ActsAccountAuthToken_2600', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_2600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_2600 createAccount start====");
            await appAccountManager.createAccount("account_promise_spaceToken");
            console.debug("====>setAuthToken ActsAccountAuthToken_2600 start====");
            await appAccountManager.setAuthToken("account_promise_spaceToken","aythType"," ");
            console.debug("====>getAuthToken ActsAccountAuthToken_2600 start====");
            var data = await appAccountManager.getAuthToken("account_promise_spaceToken",OWNERSELF,"aythType");
            expect(data).assertEqual(" ");
            console.debug("====>ActsAccountAuthToken_2600 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_spaceToken");
            console.debug("====>ActsAccountAuthToken_2600 end====");
            done();
        });



        it('ActsAccountAuthToken_2700', 0, async function(done) {
            var limitToken = '';
                for (let i = 0; i < TOKENLENGTHLIMIT + 1; i++) {
                    limitToken += 't';
                }
            console.debug("====>ActsAccountAuthToken_2700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_exceed_limitToken", (err)=>{
            console.debug("====>createAccount ActsAccountAuthToken_2700 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_exceed_limitToken","authType",limitToken,(err)=>{
                    console.debug("====>getAuthToken ActsAccountAuthToken_2700 err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    appAccountManager.removeAccount("account_callback_exceed_limitToken", (err)=>{
                        console.debug("====>removeAccount ActsAccountAuthToken_2700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountAuthToken_2700 end====");
                        done();
                    });
                });
            });
        });


        it('ActsAccountAuthToken_2800', 0, async function(done) {
            var limitToken = '';
                for (let i = 0; i < TOKENLENGTHLIMIT + 1; i++) {
                    limitToken += 't';
                }
            console.debug("====>ActsAccountAuthToken_2800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_2800 createAccount start====");
            await appAccountManager.createAccount("account_promise_exceed_limitToken");
            console.debug("====>setAuthToken ActsAccountAuthToken_2800 start====");
            try{
                await appAccountManager.setAuthToken("account_promise_exceed_limitToken","authType",limitToken);
            }
            catch(err){
                console.debug("====>setAuthToken ActsAccountAuthToken_2800 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_2800 removeAccount start====");
                appAccountManager.removeAccount("account_promise_exceed_limitToken");
                console.debug("====>ActsAccountAuthToken_2800 end====");
                done();
            }
        });


        it('ActsAccountAuthToken_2900', 0, async function(done) {
            var limitToken = '';
                for (let i = 0; i < TOKENLENGTHLIMIT; i++) {
                    limitToken += 't';
                }
            console.debug("====>ActsAccountAuthToken_2900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_limitToken", (err)=>{
            console.debug("====>createAccount ActsAccountAuthToken_2900 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_limitToken","authType",limitToken,(err)=>{
                    console.debug("====>getAuthToken ActsAccountAuthToken_2900 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_limitToken",OWNERSELF,"authType", (err, data)=>{
                        console.debug("====>getAuthToken ActsAccountAuthToken_2900 err:" + JSON.stringify(err));
                        console.debug("====>getAuthToken ActsAccountAuthToken_2900 data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual(limitToken);
                        appAccountManager.removeAccount("account_callback_limitToken", (err)=>{
                            console.debug("====>removeAccount ActsAccountAuthToken_2900 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_2900 end====");
                            done();
                        });
                    });
                });
            });
        });


        it('ActsAccountAuthToken_3000', 0, async function(done) {
            var limitToken = '';
                for (let i = 0; i < TOKENLENGTHLIMIT; i++) {
                    limitToken += 't';
                }
            console.debug("====>ActsAccountAuthToken_3000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_3000 createAccount start====");
            await appAccountManager.createAccount("account_promise_limitToken");
            console.debug("====>setAuthToken ActsAccountAuthToken_3000 start====");
            await appAccountManager.setAuthToken("account_promise_limitToken","authType",limitToken);
            console.debug("====>getAuthToken ActsAccountAuthToken_3000 start====");
            var data = await appAccountManager.getAuthToken("account_promise_limitToken",OWNERSELF,"authType");
            expect(data).assertEqual(limitToken);
            console.debug("====>ActsAccountAuthToken_3000 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_limitToken");
            console.debug("====>ActsAccountAuthToken_3000 end====");
            done();
        });


        it('ActsAccountAuthToken_3100', 0, async function(done) {
            var limitAuthType = '';
                for (let i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
                    limitAuthType += 't';
                }
            console.debug("====>ActsAccountAuthToken_3100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_limitAuthType", (err)=>{
            console.debug("====>createAccount ActsAccountAuthToken_3100 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_limitAuthType",limitAuthType,"account_callback_limitAuthType_token",(err, data)=>{
                    console.debug("====>getAuthToken ActsAccountAuthToken_3100 err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    appAccountManager.removeAccount("account_callback_limitAuthType", (err)=>{
                        console.debug("====>removeAccount ActsAccountAuthToken_3100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountAuthToken_3100 end====");
                        done();
                    });
                });
            });
        });


        it('ActsAccountAuthToken_3200', 0, async function(done) {
            var limitAuthType = '';
                for (let i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
                    limitAuthType += 't';
                }
            console.debug("====>ActsAccountAuthToken_3400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_3400 createAccount start====");
            await appAccountManager.createAccount("account_promise_exceed_limitAuthType");
            console.debug("====>setAuthToken ActsAccountAuthToken_3400 start====");
            try{
                await appAccountManager.setAuthToken("account_promise_exceed_limitAuthType",limitAuthType,"account_promise_limitAuthType_token");
            }
            catch(err){
                console.debug("====>setAuthToken ActsAccountAuthToken_3400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_3400 removeAccount start====");
                appAccountManager.removeAccount("account_promise_exceed_limitAuthType");
                console.debug("====>ActsAccountAuthToken_3400 end====");
                done();
            }
        });



        it('ActsAccountAuthToken_3300', 0, async function(done) {
            var limitAuthType = '';
                for (let i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
                    limitAuthType += 't';
                }
            console.debug("====>ActsAccountAuthToken_3300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_limitAuthType", (err)=>{
            console.debug("====>createAccount ActsAccountAuthToken_3300 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.getAuthToken("account_callback_limitAuthType","com.example.actsaccounttest",limitAuthType, (err, data)=>{
                    console.debug("====>getAuthToken ActsAccountAuthToken_3300 err:" + JSON.stringify(err));
                    console.debug("====>getAuthToken ActsAccountAuthToken_3300 data:" + data);
                    expect(err.code!=0).assertEqual(true);
                    appAccountManager.removeAccount("account_callback_limitAuthType", (err)=>{
                        console.debug("====>removeAccount ActsAccountAuthToken_3300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountAuthToken_3300 end====");
                        done();
                    });
                });
            });
        });

        it('ActsAccountAuthToken_3400', 0, async function(done) {
            var limitAuthType = '';
                for (let i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
                    limitAuthType += 't';
                }
            console.debug("====>ActsAccountAuthToken_3400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_3400 createAccount start====");
            await appAccountManager.createAccount("account_promise_limitAuthType");
            console.debug("====>getAuthToken ActsAccountAuthToken_3400 start====");
            try{
                await appAccountManager.getAuthToken("account_promise_limitAuthType",OWNERSELF,limitAuthType);
            }
            catch(err){
                console.debug("====>getAuthToken ActsAccountAuthToken_3400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_3400 removeAccount start====");
                appAccountManager.removeAccount("account_promise_limitAuthType");
                console.debug("====>ActsAccountAuthToken_3400 end====");
                done();
            }
        });



        /*
        * @tc.number     : ActsAccountAuthToken_2700
        * @tc.name       : Test auth token in callback form
        * @tc.desc       : 设置一个authType长度刚好为限制长度的token  查询
        */
        it('ActsAccountAuthToken_3500', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_3500 start====");
            var limitAuthType = '';
            for (let i = 0; i < AUTHTYPELENGTHLIMIT; i++) {
                limitAuthType += 't';
            }
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_3500 create finish====");
            appAccountManager.createAccount("account_callback_limitAuthType", (err)=>{
                console.debug("====>add account ActsAccountAuthToken_3500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_limitAuthType",limitAuthType,"account_callback_limitAuthType_token", (err)=>{
                    console.debug("====>setAuthToken ActsAccountAuthToken_3500 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_limitAuthType","com.example.actsaccountoperatetest",limitAuthType, (err, data)=>{
                        console.debug("====>getAuthToken ActsAccountAuthToken_3500 err:" + JSON.stringify(err));
                        console.debug("====>getAuthToken ActsAccountAuthToken_3500 data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("account_callback_limitAuthType_token");
                        appAccountManager.removeAccount("account_callback_limitAuthType", (err)=>{
                            console.debug("====>delete Account ActsAccountAuthToken_3500 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_3500 end====");
                            done();
                        });
                    });
                });
            });
        });
        
        /*
        * @tc.number     : ActsAccountAuthToken_2800
        * @tc.name       : Test auth token in promise form
        * @tc.desc       : 设置一个authType长度刚好为限制长度的token
        */
        
        /*
        * @tc.number     : ActsAccountAuthToken_2900
        * @tc.name       : Test auth token in callback form
        * @tc.desc       : Clear token parameter name is an empty string
        */
        //测试 删除一个账号名为空的token callback方式
        it('ActsAccountAuthToken_4100', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_4100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_4100 create finish====");
            appAccountManager.deleteAuthToken(" ","com.example.actsaccounttest","authType","account_notExist_token", (err)=>{
                console.debug("====>clearauthToken ActsAccountAuthToken_4100 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_4100 end====");
                done();
            });
        });
        
        /*
        * @tc.number     : ActsAccountAuthToken_3000
        * @tc.name       : Test auth token in promise form
        * @tc.desc       : Clear token parameter name is an empty string
        */
        //测试 删除一个账号名为空的token promise方式
        it('ActsAccountAuthToken_4200', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_4200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_4200 create finish====");
            console.debug("====>clearauthToken ActsAccountAuthToken_4200 start====");
            try{
                await appAccountManager.deleteAuthToken("","com.example.actsaccounttest","authType","account_notExist_token");
            }
            catch(err){
                console.debug("====>deleteAuthToken ActsAccountAuthToken_4200 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_4200 end====");
                done();
            }
        });
        
        /*
        * @tc.number     : ActsAccountAuthToken_3100
        * @tc.name       : Test auth token in callback form
        * @tc.desc       : The clear token parameter name is a space string
        */
        it('ActsAccountAuthToken_4300', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_4300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_4300 create finish====");
            appAccountManager.deleteAuthToken(" ","com.example.actsaccounttest","authType","account_notExist_token", (err)=>{
                console.debug("====>clearauthToken ActsAccountAuthToken_4300 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_4300 end====");
                done();
            });
        });
        
        /*
        * @tc.number     : ActsAccountAuthToken_3200
        * @tc.name       : Test auth token in promise form
        * @tc.desc       : The clear token parameter name is a space string
        */
        it('ActsAccountAuthToken_4400', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_4400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_4400 create finish====");
            console.debug("====>clearauthToken ActsAccountAuthToken_4400 start====");
            try{
                await appAccountManager.deleteAuthToken(" ","com.example.actsaccounttest","authType","account_notExist_token");
            }
            catch(err){
                console.debug("====>deleteAuthToken ActsAccountAuthToken_4400 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_4400 end====");
                done();
            }
        });
    
        /*
        * @tc.number     : ActsAccountAuthToken_3300
        * @tc.name       : Test auth token in callback form
        * @tc.desc       : Clear the token parameter name exceeds the length limit of 1024 characters
        */
        it('ActsAccountAuthToken_4500', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_4500 start====");
            var nameLimit = '';
            for (let i = 0; i < LENGTHLIMIT + 1; i++) {
                nameLimit += 't';
            }
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_4500 create finish====");
            appAccountManager.deleteAuthToken(nameLimit,"com.example.actsaccounttest","authType","account_notExist_token", (err)=>{
                console.debug("====>clearauthToken ActsAccountAuthToken_4500 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_4500 end====");
                done();
            });
        });
    
        /*
        * @tc.number     : ActsAccountAuthToken_3400
        * @tc.name       : Test auth token in promise form
        * @tc.desc       : Clear the token parameter name exceeds the length limit of 1024 characters
        */
        it('ActsAccountAuthToken_4600', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_4600 start====");
            var nameLimit = '';
            for (let i = 0; i < LENGTHLIMIT + 1; i++) {
                nameLimit += 't';
            }
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_4600 create finish====");
            console.debug("====>deleteAuthToken ActsAccountAuthToken_4600 start====");
            try{
                await appAccountManager.deleteAuthToken(nameLimit,"com.example.actsaccounttest","authType","account_notExist_token");
            }
            catch(err){
                console.debug("====>deleteAuthToken ActsAccountAuthToken_4600 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_4600 end====");
                done();
            }
        });
    
        //查询无效包名owner（为其他字符串时）账号的token callback方式
        it('ActsAccountAuthToken_4700', 0, async function(done) {
            console.debug("====>ActsAccountAuthToken_4700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_4700 create finish====");
            appAccountManager.createAccount("account_callback_invalid_owner", (err)=>{
                console.debug("====>add account ActsAccountAuthToken_4700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAuthToken("account_callback_invalid_owner","invalid_owner","authType", (err, data)=>{
                    console.debug("====>getAuthToken ActsAccountAuthToken_4700 err:" + JSON.stringify(err));
                    console.debug("====>getAuthToken ActsAccountAuthToken_4700 data:" + data);
                    expect(err.code!=0).assertEqual(true);
                    expect(data).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_invalid_owner", (err)=>{
                        console.debug("====>delete account ActsAccountAuthToken_4700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountAuthToken_4700 end====");
                        done();
                    });
                });
            });
        });


        it('ActsAccountAuthToken_3600', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_3600 start====");
            var limitAuthType = '';
            for (var i = 0; i < AUTHTYPELENGTHLIMIT; i++) {
                limitAuthType += 't';
            }
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_3600 createAccount start====");
            await appAccountManager.createAccount("account_promise_limitAuthType");
            console.debug("====>ActsAccountAuthToken_3600 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_limitAuthType",limitAuthType,"account_promise_limitAuthType_token");
            console.debug("====>ActsAccountAuthToken_3600 getAuthToken start====");
            var data = await appAccountManager.getAuthToken("account_promise_limitAuthType",OWNERSELF,limitAuthType);
            expect(data).assertEqual("account_promise_limitAuthType_token");
            console.debug("====>ActsAccountAuthToken_3600 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_limitAuthType");
            console.debug("====>ActsAccountAuthToken_3600 end====");
            done();
        });
    
        
        it('ActsAccountAuthToken_3700', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_3700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_3700 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_empty",(err)=>{
                console.debug("====>ActsAccountAuthToken_3700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_empty","","account_callback_authType_empty_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_3700 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_authType_empty",OWNERSELF,"",(err,data)=>{
                        console.debug("====>ActsAccountAuthToken_3700 getAuthToken err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_3700 getAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("account_callback_authType_empty_token");
                        appAccountManager.removeAccount("account_callback_authType_empty",(err)=>{
                            console.debug("====>ActsAccountAuthToken_3700 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_3700 end====");
                            done();
                        });
                    });
                });
            });
        });
        
        it('ActsAccountAuthToken_3800', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_3800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_3800 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_empty");
            console.debug("====>ActsAccountAuthToken_3800 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_authType_empty","","account_promise_authType_empty_token");
            console.debug("====>ActsAccountAuthToken_3800 getAuthToken start====");
            var data = await appAccountManager.getAuthToken("account_promise_authType_empty",OWNERSELF,"");
            expect(data).assertEqual("account_promise_authType_empty_token");
            console.debug("====>ActsAccountAuthToken_3800 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_authType_empty");
            console.debug("====>ActsAccountAuthToken_3800 end====");
            done();
        });
    
        it('ActsAccountAuthToken_3900', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_3900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_3900 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_space",(err)=>{
                console.debug("====>ActsAccountAuthToken_3900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_space"," ","account_callback_authType_space_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_3900 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_authType_space",OWNERSELF," ",(err,data)=>{
                        console.debug("====>ActsAccountAuthToken_3900 getAuthToken err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_3900 getAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("account_callback_authType_space_token");
                        appAccountManager.removeAccount("account_callback_authType_space",(err)=>{
                            console.debug("====>ActsAccountAuthToken_3900 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_3900 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_4000', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_4000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_4000 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_space");
            console.debug("====>ActsAccountAuthToken_4000 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_authType_space"," ","account_promise_authType_space_token");
            console.debug("====>ActsAccountAuthToken_4000 getAuthToken start====");
            var data = await appAccountManager.getAuthToken("account_promise_authType_space",OWNERSELF," ");
            expect(data).assertEqual("account_promise_authType_space_token");
            console.debug("====>ActsAccountAuthToken_4000 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_authType_space");
            console.debug("====>ActsAccountAuthToken_4000 end====");
            done();
        });
    
    
        it('ActsAccountAuthToken_4800', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_4800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_4800 createAccount start====");
            await appAccountManager.createAccount("account_promise_invalid_owner");
            console.debug("====>ActsAccountAuthToken_4800 getAuthToken start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_invalid_owner","invalid_owner","authType");
            }
            catch(err){
                console.debug("====>ActsAccountAuthToken_4800 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_4800 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_invalid_owner");
                console.debug("====>ActsAccountAuthToken_4800 end====");
                done();
            }
        });
    
        it('ActsAccountAuthToken_4900', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_4900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_4900 createAccount start====");
            appAccountManager.createAccount("account_callback_owner_empty",(err)=>{
                console.debug("====>ActsAccountAuthToken_4900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAuthToken("account_callback_owner_empty","","authType",(err,data)=>{
                    console.debug("====>ActsAccountAuthToken_4900 getAuthToken err:" + JSON.stringify(err));
                    console.debug("====>ActsAccountAuthToken_4900 getAuthToken data:" + data);
                    expect(err.code!=0).assertEqual(true);
                    expect(data).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_owner_empty",(err)=>{
                        console.debug("====>ActsAccountAuthToken_4900 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountAuthToken_4900 end====");
                        done();
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_5000', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_5000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_5000 createAccount start====");
            await appAccountManager.createAccount("account_promise_owner_empty");
            console.debug("====>ActsAccountAuthToken_5000 getAuthToken start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_owner_empty","","authType");
            }
            catch(err){
                console.debug("====>ActsAccountAuthToken_5000 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_5000 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_owner_empty");
                console.debug("====>ActsAccountAuthToken_5000 end====");
                done();
            }
        });
    
        it('ActsAccountAuthToken_5100', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_5100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_5100 createAccount start====");
            appAccountManager.createAccount("account_callback_owner_space",(err)=>{
                console.debug("====>ActsAccountAuthToken_5100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAuthToken("account_callback_owner_space"," ","authType",(err,data)=>{
                    console.debug("====>ActsAccountAuthToken_5100 getAuthToken err:" + JSON.stringify(err));
                    console.debug("====>ActsAccountAuthToken_5100 getAuthToken data:" + data);
                    expect(err.code!=0).assertEqual(true);
                    expect(data).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_owner_space",(err)=>{
                        console.debug("====>ActsAccountAuthToken_5100 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountAuthToken_5100 end====");
                        done();
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_5200', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_5200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_5200 createAccount start====");
            await appAccountManager.createAccount("account_callback_owner_space");
            console.debug("====>ActsAccountAuthToken_5200 getAuthToken start====");
            try{
                var data = await appAccountManager.getAuthToken("account_callback_owner_space"," ","authType");
            }
            catch(err){
                console.debug("====>ActsAccountAuthToken_5200 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_5200 removeAccount start====");
                await appAccountManager.removeAccount("account_callback_owner_space");
                console.debug("====>ActsAccountAuthToken_5200 end====");
                done();
            }
        });
    
        it('ActsAccountAuthToken_5300', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_5300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_5300 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_invalid",(err)=>{
                console.debug("====>ActsAccountAuthToken_5300 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_invalid","authType","account_callback_authType_invalid_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_5300 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_authType_invalid",OWNERSELF,"invalid_authType",(err,data)=>{
                        console.debug("====>ActsAccountAuthToken_5300 getAuthToken err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_5300 getAuthToken data:" + data);
                        expect(err.code!=0).assertEqual(true);
                        expect(data).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_authType_invalid",(err)=>{
                            console.debug("====>ActsAccountAuthToken_5300 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_5300 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_5400', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_5400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_5400 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_invalid");
            console.debug("====>ActsAccountAuthToken_5400 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_authType_invalid","authType","account_promise_authType_invalid_token");
            console.debug("====>ActsAccountAuthToken_5400 getAuthToken start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_authType_invalid",OWNERSELF,"invalid_authType");
            }
            catch(err){
                console.debug("====>ActsAccountAuthToken_5400 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_5400 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_authType_invalid");
                console.debug("====>ActsAccountAuthToken_5400 end====");
                done();
            }
        });
    
        it('ActsAccountAuthToken_5500', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_5500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_5500 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_empty",(err)=>{
                console.debug("====>ActsAccountAuthToken_5500 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_empty","authType","account_callback_authType_empty_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_5500 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_authType_empty",OWNERSELF,"",(err,data)=>{
                        console.debug("====>ActsAccountAuthToken_5500 getAuthToken err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_5500 getAuthToken data:" + data);
                        expect(err.code!=0).assertEqual(true);
                        expect(data).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_authType_empty",(err)=>{
                            console.debug("====>ActsAccountAuthToken_5500 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_5500 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_5600', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_5600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_5600 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_empty");
            console.debug("====>ActsAccountAuthToken_5600 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_authType_empty","authType","account_promise_authType_empty_token");
            console.debug("====>ActsAccountAuthToken_5600 getAuthToken start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_authType_empty",OWNERSELF,"");
            }
            catch(err){
                console.debug("====>ActsAccountAuthToken_5600 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_5600 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_authType_empty");
                console.debug("====>ActsAccountAuthToken_5600 end====");
                done();
            }
        });
    
        it('ActsAccountAuthToken_5700', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_5700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_5700 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_space",(err)=>{
                console.debug("====>ActsAccountAuthToken_5700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_space","authType","account_callback_authType_space_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_5700 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_authType_space",OWNERSELF," ",(err,data)=>{
                        console.debug("====>ActsAccountAuthToken_5700 getAuthToken err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_5700 getAuthToken data:" + data);
                        expect(err.code!=0).assertEqual(true);
                        expect(data).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_authType_space",(err)=>{
                            console.debug("====>ActsAccountAuthToken_5700 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_5700 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_5800', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_5800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_5800 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_space");
            console.debug("====>ActsAccountAuthToken_5800 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_authType_space","authType","account_promise_authType_space_token");
            console.debug("====>ActsAccountAuthToken_5800 getAuthToken start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_authType_space",OWNERSELF," ");
            }
            catch(err){
                console.debug("====>ActsAccountAuthToken_5800 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_5800 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_authType_space");
                console.debug("====>ActsAccountAuthToken_5800 end====");
                done();
            }
        });
    
        it('ActsAccountAuthToken_5900', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_5900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_5900 createAccount start====");
            appAccountManager.createAccount("account_callback_owner_invalid",(err)=>{
                console.debug("====>ActsAccountAuthToken_5900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_owner_invalid","authType","account_callback_owner_invalid_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_5900 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_owner_invalid","invalid_owner","authType","account_callback_owner_invalid_token",(err)=>{
                        console.debug("====>ActsAccountAuthToken_5900 getAuthToken err:" + JSON.stringify(err));
                        expect(err.code!=0).assertEqual(true);
                        appAccountManager.removeAccount("account_callback_owner_invalid",(err)=>{
                            console.debug("====>ActsAccountAuthToken_5900 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_5900 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_6000', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_6000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_6000 createAccount start====");
            await appAccountManager.createAccount("account_promise_owner_invalid");
            console.debug("====>ActsAccountAuthToken_6000 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_owner_invalid","authType","account_promise_owner_invalid_token");
            console.debug("====>ActsAccountAuthToken_6000 getAuthToken start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_owner_invalid","invalid_owner","authType","account_promise_owner_invalid_token");
            }
            catch(err){
                console.debug("====>ActsAccountAuthToken_6000 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_6000 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_owner_invalid");
                console.debug("====>ActsAccountAuthToken_6000 end====");
                done();
            }
        });
    
        it('ActsAccountAuthToken_6100', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_6100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_6100 createAccount start====");
            appAccountManager.createAccount("account_callback_owner_empty",(err)=>{
                console.debug("====>ActsAccountAuthToken_6100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_owner_empty","authType","account_callback_owner_empty_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_6100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_owner_empty","","authType","account_callback_owner_empty_token",(err)=>{
                        console.debug("====>ActsAccountAuthToken_6100 getAuthToken err:" + JSON.stringify(err));
                        expect(err.code!=0).assertEqual(true);
                        appAccountManager.removeAccount("account_callback_owner_empty",(err)=>{
                            console.debug("====>ActsAccountAuthToken_6100 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_6100 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_6200', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_6200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_6200 createAccount start====");
            await appAccountManager.createAccount("account_promise_owner_empty");
            console.debug("====>ActsAccountAuthToken_6200 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_owner_empty","authType","account_promise_owner_empty_token");
            console.debug("====>ActsAccountAuthToken_6200 getAuthToken start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_owner_empty","","authType","account_promise_owner_empty_token");
            }
            catch(err){
                console.debug("====>ActsAccountAuthToken_6200 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_6200 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_owner_empty");
                console.debug("====>ActsAccountAuthToken_6200 end====");
                done();
            }
        });
    
        it('ActsAccountAuthToken_6300', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_6300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_6300 createAccount start====");
            appAccountManager.createAccount("account_callback_owner_space",(err)=>{
                console.debug("====>ActsAccountAuthToken_6300 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_owner_space","authType","account_callback_owner_space_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_6300 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_owner_space"," ","authType","account_callback_owner_space_token",(err)=>{
                        console.debug("====>ActsAccountAuthToken_6300 getAuthToken err:" + JSON.stringify(err));
                        expect(err.code!=0).assertEqual(true);
                        appAccountManager.removeAccount("account_callback_owner_space",(err)=>{
                            console.debug("====>ActsAccountAuthToken_6300 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_6300 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_6400', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_6400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_6400 createAccount start====");
            await appAccountManager.createAccount("account_promise_owner_space");
            console.debug("====>ActsAccountAuthToken_6400 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_owner_space","authType","account_promise_owner_space_token");
            console.debug("====>ActsAccountAuthToken_6400 getAuthToken start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_owner_space"," ","authType","account_promise_owner_space_token");
            }
            catch(err){
                console.debug("====>ActsAccountAuthToken_6400 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_6400 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_owner_space");
                console.debug("====>ActsAccountAuthToken_6400 end====");
                done();
            }
        });
    
        it('ActsAccountAuthToken_6500', 0, async function (done) {
            var limitToken = '';
            for(var i = 0;i < TOKENLENGTHLIMIT + 1; i++){
                limitToken += 'c';
            }
            console.debug("====>ActsAccountAuthToken_6500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_6500 createAccount start====");
            appAccountManager.createAccount("account_callback_token_exceedLimit",(err)=>{
                console.debug("====>ActsAccountAuthToken_6500 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.deleteAuthToken("account_callback_token_exceedLimit",OWNERSELF,"authType",limitToken,(err)=>{
                    console.debug("====>ActsAccountAuthToken_6500 getAuthToken err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    appAccountManager.removeAccount("account_callback_token_exceedLimit",(err)=>{
                        console.debug("====>ActsAccountAuthToken_6500 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountAuthToken_6500 end====");
                        done();
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_6600', 0, async function (done) {
            var limitToken = '';
            for(var i = 0;i < TOKENLENGTHLIMIT + 1; i++){
                limitToken += 'c';
            }
            console.debug("====>ActsAccountAuthToken_6600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_6600 createAccount start====");
            await appAccountManager.createAccount("account_promise_token_exceedLimit");
            console.debug("====>ActsAccountAuthToken_6600 deleteAuthToken start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_token_exceedLimit",OWNERSELF,"authType",limitToken);
            }
            catch(err){
                console.debug("====>ActsAccountAuthToken_6600 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.debug("====>ActsAccountAuthToken_6600 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_token_exceedLimit");
                console.debug("====>ActsAccountAuthToken_6600 end====");
                done();
            }
        });
    
        it('ActsAccountAuthToken_6700', 0, async function (done) {
            var limitToken = '';
            for(var i = 0;i < TOKENLENGTHLIMIT; i++){
                limitToken += 'c';
            }
            console.debug("====>ActsAccountAuthToken_6700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_6700 createAccount start====");
            appAccountManager.createAccount("account_callback_token_limit",(err)=>{
                console.debug("====>ActsAccountAuthToken_6700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_token_limit","authType",limitToken,(err)=>{
                    console.debug("====>ActsAccountAuthToken_6700 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_token_limit",OWNERSELF,"authType",limitToken,(err)=>{
                        console.debug("====>ActsAccountAuthToken_6700 getAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_token_limit",(err)=>{
                            console.debug("====>ActsAccountAuthToken_6700 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_6700 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_6800', 0, async function (done) {
            var limitToken = '';
            for(var i = 0;i < TOKENLENGTHLIMIT; i++){
                limitToken += 'c';
            }
            console.debug("====>ActsAccountAuthToken_6800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_6800 createAccount start====");
            await appAccountManager.createAccount("account_promise_token_limit");
            console.debug("====>ActsAccountAuthToken_6800 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_token_limit","authType",limitToken);
            console.debug("====>ActsAccountAuthToken_6800 deleteAuthToken start====");
            await appAccountManager.deleteAuthToken("account_promise_token_limit",OWNERSELF,"authType",limitToken);
            console.debug("====>ActsAccountAuthToken_6800 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_token_limit");
            console.debug("====>ActsAccountAuthToken_6800 end====");
            done();
        });
    
        it('ActsAccountAuthToken_6900', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_6900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_6900 createAccount start====");
            appAccountManager.createAccount("account_callback_delete_space",(err)=>{
                console.debug("====>ActsAccountAuthToken_6900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_delete_space","authType","account_callback_delete_space_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_6900 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_delete_space", OWNERSELF,"authType", "",(err)=>{
                        console.debug("====>ActsAccountAuthToken_6900 deleteAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null)
                        appAccountManager.getAuthToken("account_callback_delete_space", OWNERSELF, "authType",(err,data)=>{
                            console.debug("====>ActsAccountAuthToken_6900 getAuthToken err:" + JSON.stringify(err));
                            console.debug("====>ActsAccountAuthToken_6900 getAuthToken data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("account_callback_delete_space_token");
                            appAccountManager.removeAccount("account_callback_delete_space",(err)=>{
                                console.debug("====>ActsAccountAuthToken_6900 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_6900 end====");
                                done();
                            });
                        });
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_7000', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_7000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>ActsAccountAuthToken_7000 createAccount start====");
            await appAccountManager.createAccount("account_promise_delete_space");
            console.debug("====>ActsAccountAuthToken_7000 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_delete_space","authType","account_promise_delete_space_token");
            console.debug("====>ActsAccountAuthToken_7000 deleteAuthToken start====");
            await appAccountManager.deleteAuthToken("account_promise_delete_space",OWNERSELF,"authType","");
            console.debug("====>ActsAccountAuthToken_7000 getAuthToken start====");
            var data = await appAccountManager.getAuthToken("account_promise_delete_space",OWNERSELF,"authType");
            expect(data).assertEqual("account_promise_delete_space_token");
            console.debug("====>ActsAccountAuthToken_7000 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_delete_space");
            console.debug("====>ActsAccountAuthToken_7000 end====");
            done();            
        });
    
        it('ActsAccountAuthToken_9200', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_9200 start====");
            var appAccountManager = account.createAppAccountManager();  
            appAccountManager.getAuthCallback("test_sessionId").then(()=>{
                expect().assertFail();
                done();
            })                    
            .catch((err)=>{
                console.debug("====>ActsAccountAuthToken_9200 getAuthCalback err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true)
                done();
            })
        });
    
        it('ActsAccountAuthToken_9300', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_9300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.getAuthCallback("").then(()=>{
                expect().assertFail();
                done();
            })                    
            .catch((err)=>{
                console.debug("====>ActsAccountAuthToken_9300 getAuthCalback err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true)
                done();
            })
        });
    
        it('ActsAccountAuthToken_9400', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_9400 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.getAuthCallback(" ").then(()=>{
                expect().assertFail();
                done();
            })                    
            .catch((err)=>{
                console.debug("====>ActsAccountAuthToken_9400 getAuthCalback err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true)
                done();
            })
        });
    
        it('ActsAccountAuthToken_9500', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_9500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.queryAuthenticatorInfo(OWNERSELF,(err)=>{
                console.debug("====>ActsAccountAuthToken_9500 queryAuthenticatorInfo err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                done();
            });
        });
    
        it('ActsAccountAuthToken_9600', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_9600 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.queryAuthenticatorInfo("",(err)=>{
                console.debug("====>ActsAccountAuthToken_9600 queryAuthenticatorInfo err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                done();
            });
        });
    
        it('ActsAccountAuthToken_9700', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_9700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.queryAuthenticatorInfo(" ",(err)=>{
                console.debug("====>ActsAccountAuthToken_9700 queryAuthenticatorInfo err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                done();
            });
        });
    
        it('ActsAccountAuthToken_9800', 0, async function (done) {
            var limiOwner = '';
            for(var i = 0;i < OWNERLENGTHLIMIT + 1; i++){
                limiOwner += 't';
            }
            console.debug("====>ActsAccountAuthToken_9800 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.queryAuthenticatorInfo(limiOwner,(err)=>{
                console.debug("====>ActsAccountAuthToken_9800 queryAuthenticatorInfo err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                done();
            });
        });
    
        it('ActsAccountAuthToken_9900', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_9900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err,)=>{
                console.debug("====>ActsAccountAuthToken_9900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);            
                appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","authType",valid_owner_name,true).then(()=>{
                    expect().assertFail();
                    done();
                }).catch((err)=>{
                    console.debug("====>ActsAccountAuthToken_9900 setAuthTokenVisibility err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND); 
                    appAccountManager.getAuthToken("account_setAuthTokenVisibility_name",OWNERSELF,"authType",(err,data)=>{
                        console.debug("====>ActsAccountAuthToken_9900 getAuthToken err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_9900 getAuthToken data:" + data);
                        expect(err.code!=0).assertEqual(true);                        
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                            console.debug("====>ActsAccountAuthToken_9900 getAuthList err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND);                        
                            appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                console.debug("====>ActsAccountAuthToken_9900 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);                            
                                console.debug("====>ActsAccountAuthToken_9900 end====");
                                done();
                            });
                        });
                    });
                })
            });
        });
    
        it('ActsAccountAuthToken_10000', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_10000 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err,)=>{
                console.debug("====>ActsAccountAuthToken_10000 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_10000 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    try{
                        appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","authType","test_BundleName","true",(err)=>{
                            expect().assertFail();
                            done();
                        });
                    }catch(err){
                        expect(err.code == 401).assertEqual(true);
                        console.debug("====>ActsAccountAuthToken_10000 setAuthTokenVisibility err:" + JSON.stringify(err));
                        appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                            console.debug("====>ActsAccountAuthToken_10000 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_10000 end====");
                            done();
                        });
                    }
                    
                });
            });
        });
    
        it('ActsAccountAuthToken_10100', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_10100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_10100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_10100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    try{
                        appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","authType","test_BundleName","invalid_string",(err)=>{
                            console.debug("====>ActsAccountAuthToken_10100 setAuthTokenVisibility err:" + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        });
                    }catch(err){
                        console.debug("====>ActsAccountAuthToken_10100 setAuthTokenVisibility throw_err:" + JSON.stringify(err));
                        expect(err.code == 401).assertEqual(true);
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                            console.debug("====>ActsAccountAuthToken_10100 getAuthList err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_10100 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray.length).assertEqual(0);
                            appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                console.debug("====>ActsAccountAuthToken_10100 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_10100 end====");
                                done();
                            });
                        });
                    }                        
                });
            });
        });
    
        it('ActsAccountAuthToken_10200', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_10200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_10200 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_10200 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","authType","",true,(err)=>{
                        console.debug("====>ActsAccountAuthToken_10200 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err.code==12300002).assertEqual(true);
                        appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                            console.debug("====>ActsAccountAuthToken_10200 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_10200 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_10300', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_10300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_10300 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_10300 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","authType"," ",true,(err)=>{
                        console.debug("====>ActsAccountAuthToken_10300 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(12400001);
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                            console.debug("====>ActsAccountAuthToken_10300 getAuthList err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_10300 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray.length).assertEqual(0);
                            appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                console.debug("====>ActsAccountAuthToken_10300 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_10300 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
        
        it('ActsAccountAuthToken_10400', 0, async function (done) {
            var limitBundleName = '';
            for(var i = 0;i < OWNERLENGTHLIMIT + 1; i++){
                limitBundleName += 't';
            }
            console.debug("====>ActsAccountAuthToken_10400 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_10400 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_10400 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","authType",limitBundleName,true,(err)=>{
                        console.debug("====>ActsAccountAuthToken_10400 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(12300002);
                        appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                            console.debug("====>ActsAccountAuthToken_10400 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_10400 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_10500', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_10500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_10500 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_10500 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","",valid_owner_name,true,(err)=>{
                        console.debug("====>ActsAccountAuthToken_10500 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name","",(err,dataArray)=>{
                            console.debug("====>ActsAccountAuthToken_10500 getAuthList err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_10500 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray.length).assertEqual(1);
                            expect(dataArray[0]).assertEqual(valid_owner_name);
                            appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                console.debug("====>ActsAccountAuthToken_10500 getAuthList authType:\"authType\" err:" + JSON.stringify(err));
                                expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND);
                                appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                    console.debug("====>ActsAccountAuthToken_10500 removeAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.debug("====>ActsAccountAuthToken_10500 end====");
                                    done();
                                });
                            });
                        });    
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_10600', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_10600 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_10600 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name"," ","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_10600 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name"," ",valid_owner_name,true,(err)=>{
                        console.debug("====>ActsAccountAuthToken_10600 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name"," ",(err,dataArray)=>{
                            console.debug("====>ActsAccountAuthToken_10600 getAuthList err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_10600 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray.length).assertEqual(1);
                            expect(dataArray[0]).assertEqual(valid_owner_name);
                            appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                console.debug("====>ActsAccountAuthToken_10600 getAuthList authType:\"authType\" err:" + JSON.stringify(err));
                                expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND);
                                console.debug("====>ActsAccountAuthToken_10600 getAuthList authType:\"authType\" dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray).assertEqual(null);
                                appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                    console.debug("====>ActsAccountAuthToken_10600 removeAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.debug("====>ActsAccountAuthToken_10600 end====");
                                    done();
                                });
                            });
                        });    
                    });
                });
            });
        });
    
    
        it('ActsAccountAuthToken_10700', 0, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT + 1; i++){
                limitAuthType += 't';
            }
            console.debug("====>ActsAccountAuthToken_10700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_10700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_10700 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name",limitAuthType,"test_bundleName",true,(err)=>{
                        console.debug("====>ActsAccountAuthToken_10700 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(12300002);
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                            console.debug("====>ActsAccountAuthToken_10700 getAuthList authType:\"authType\" err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_10700 getAuthList authType:\"authType\" dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray.length).assertEqual(0);
                            appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                console.debug("====>ActsAccountAuthToken_10700 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_10700 end====");
                                done();
                            });
                        }); 
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_10800', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_10800 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_10800 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_10800 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","invalid_authType",valid_owner_name,true,(err)=>{
                        console.debug("====>ActsAccountAuthToken_10800 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(12300107);
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name","invalid_authType",(err,dataArray)=>{
                            console.debug("====>ActsAccountAuthToken_10800 getAuthList err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(12300107);
                            console.debug("====>ActsAccountAuthToken_10800 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray).assertEqual(null);
                            appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                console.debug("====>ActsAccountAuthToken_10800 getAuthList authType:\"authType\" err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_10800 getAuthList authType:\"authType\" dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(0);
                                appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                    console.debug("====>ActsAccountAuthToken_10800 removeAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.debug("====>ActsAccountAuthToken_10800 end====");
                                    done();
                                });
                            });
                        });    
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_10900', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_10900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.setAuthTokenVisibility("","authType",valid_owner_name,true,(err)=>{
                console.debug("====>ActsAccountAuthToken_10900 setAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                done();
            });
        });
    
        it('ActsAccountAuthToken_11000', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_11000 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.setAuthTokenVisibility(" ","authType",valid_owner_name,true,(err)=>{
                console.debug("====>ActsAccountAuthToken_11000 setAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                done();
            });
        });
    
        it('ActsAccountAuthToken_11100', 0, async function (done) {
            var limitName = '';
            for(var i = 0; i < LENGTHLIMIT + 1; i++){
                limitName += 't';
            }
            console.debug("====>ActsAccountAuthToken_11100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.setAuthTokenVisibility(limitName,"authType",valid_owner_name,true,(err)=>{
                console.debug("====>ActsAccountAuthToken_11100 setAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                done();
            });
        });
    
        it('ActsAccountAuthToken_11200', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_11200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.setAuthTokenVisibility("no_add_account","authType",valid_owner_name,true,(err)=>{
                console.debug("====>ActsAccountAuthToken_11200 setAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                done();
            });
        });
    
        it('ActsAccountAuthToken_11300', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_11300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.checkAuthTokenVisibility("","authType",valid_owner_name,(err,stateBack)=>{
                console.debug("====>ActsAccountAuthToken_11300 checkAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                done();
            });
        });
    
        it('ActsAccountAuthToken_11400', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_11400 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.checkAuthTokenVisibility(" ","authType",valid_owner_name,(err,stateBack)=>{
                console.debug("====>ActsAccountAuthToken_11400 checkAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                done();
            });
        });
    
        it('ActsAccountAuthToken_11500', 0, async function (done) {
            var limitName = '';
            for(var i = 0; i < LENGTHLIMIT + 1; i++){
                limitName += 't';
            }
            console.debug("====>ActsAccountAuthToken_11500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.checkAuthTokenVisibility(limitName,"authType",valid_owner_name,(err,stateBack)=>{
                console.debug("====>ActsAccountAuthToken_11500 checkAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                done();
            });
        });
    
        it('ActsAccountAuthToken_11600', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_11600 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.checkAuthTokenVisibility("no_add_account","authType",valid_owner_name,(err,stateBack)=>{
                console.debug("====>ActsAccountAuthToken_11600 checkAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                done();
            });
        });
    
        it('ActsAccountAuthToken_11700', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_11700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_11700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name","","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_11700 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","",valid_owner_name,(err,stateBack)=>{
                        console.debug("====>ActsAccountAuthToken_11700 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_11700 checkAuthTokenVisibility stateBack:" + stateBack);
                        expect(err).assertEqual(null);
                        expect(stateBack).assertEqual(false);
                        appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","",OWNERSELF,(err,stateBack)=>{
                            console.debug("====>ActsAccountAuthToken_11700 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            console.debug("====>ActsAccountAuthToken_11700 checkAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(true);
                            appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                                console.debug("====>ActsAccountAuthToken_11700 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_11700 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_11800', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_11800 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_11800 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name"," ","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_11800 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name"," ",valid_owner_name,(err,stateBack)=>{
                        console.debug("====>ActsAccountAuthToken_11800 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_11800 checkAuthTokenVisibility stateBack:" + stateBack);
                        expect(err).assertEqual(null);
                        expect(stateBack).assertEqual(false);
                        appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name"," ",OWNERSELF,(err,stateBack)=>{
                            console.debug("====>ActsAccountAuthToken_11800 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            console.debug("====>ActsAccountAuthToken_11800 checkAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(true);
                            appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                                console.debug("====>ActsAccountAuthToken_11800 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_11800 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_11900', 0, async function (done) {
            var limitAuthType ='';
            for(var i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++){
                limitAuthType += 't';
            }
            console.debug("====>ActsAccountAuthToken_11900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_11900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_11900 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name",limitAuthType,valid_owner_name,(err,stateBack)=>{
                        console.debug("====>ActsAccountAuthToken_11900 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err.code!=0).assertEqual(true);
                        appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name",limitAuthType,OWNERSELF,(err,stateBack)=>{
                            console.debug("====>ActsAccountAuthToken_11900 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err.code!=0).assertEqual(true);
                            appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                                console.debug("====>ActsAccountAuthToken_11900 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_11900 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_12000', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_12000 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_12000 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_12000 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","invalid_authType",valid_owner_name,(err,stateBack)=>{
                        console.debug("====>ActsAccountAuthToken_12000 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_12000 checkAuthTokenVisibility stateBack:" + stateBack);
                        expect(err.code).assertEqual(12300107);
                        appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","invalid_authType",OWNERSELF,(err,stateBack)=>{
                            console.debug("====>ActsAccountAuthToken_12000 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            console.debug("====>ActsAccountAuthToken_12000 checkAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(true);
                            appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                                console.debug("====>ActsAccountAuthToken_12000 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_12000 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_12100', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_12100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_12100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_12100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","authType","",(err,stateBack)=>{
                        console.debug("====>ActsAccountAuthToken_12100 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_12100 checkAuthTokenVisibility stateBack:" + stateBack);
                        expect(err.code!=0).assertEqual(true);
                        appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                            console.debug("====>ActsAccountAuthToken_12100 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_12100 end====");
                            done();
                        });    
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_12200', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_12200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_12200 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_12200 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","authType"," ",(err,stateBack)=>{
                        console.debug("====>ActsAccountAuthToken_12200 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_12200 checkAuthTokenVisibility stateBack:" + stateBack);
                        expect(err).assertEqual(null);
                        expect(stateBack).assertEqual(false);
                        appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                            console.debug("====>ActsAccountAuthToken_12200 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_12200 end====");
                            done();
                        });    
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_12300', 0, async function (done) {
            var limitBundleName = '';
            for(var i = 0; i < OWNERLENGTHLIMIT + 1; i++){
                limitBundleName += 't';
            }
            console.debug("====>ActsAccountAuthToken_12300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_12300 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_12300 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","authType",limitBundleName,(err,stateBack)=>{
                        console.debug("====>ActsAccountAuthToken_12300 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_12300 checkAuthTokenVisibility stateBack:" + stateBack);
                        expect(err.code!=0).assertEqual(true);
                        appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                            console.debug("====>ActsAccountAuthToken_12300 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsAccountAuthToken_12300 end====");
                            done();
                        });    
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_12400', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_12400 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_testgetAuthList_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_12400 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_testgetAuthList_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_12400 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_testgetAuthList_name","authType",valid_owner_name,true,(err)=>{
                        console.debug("====>ActsAccountAuthToken_12400 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthList("account_testgetAuthList_name","",(err,dataArray)=>{
                            console.debug("====>ActsAccountAuthToken_12400 getAuthList err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND);
                            appAccountManager.removeAccount("account_testgetAuthList_name",(err)=>{
                                console.debug("====>ActsAccountAuthToken_12400 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_12400 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_12500', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_12500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_testgetAuthList_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_12500 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_testgetAuthList_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_12500 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_testgetAuthList_name","authType",valid_owner_name,true,(err)=>{
                        console.debug("====>ActsAccountAuthToken_12500 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthList("account_testgetAuthList_name"," ",(err,dataArray)=>{
                            console.debug("====>ActsAccountAuthToken_12500 getAuthList err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND);
                            appAccountManager.removeAccount("account_testgetAuthList_name",(err)=>{
                                console.debug("====>ActsAccountAuthToken_12500 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_12500 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_12600', 0, async function (done) {
            var limitAuthType ='';
            for(var i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++){
                limitAuthType += 't';
            }
            console.debug("====>ActsAccountAuthToken_12600 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_testgetAuthList_name",(err)=>{
                console.debug("====>ActsAccountAuthToken_12600 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_testgetAuthList_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_12600 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_testgetAuthList_name","authType",valid_owner_name,true,(err)=>{
                        console.debug("====>ActsAccountAuthToken_12600 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthList("account_testgetAuthList_name",limitAuthType,(err,dataArray)=>{
                            console.debug("====>ActsAccountAuthToken_12600 getAuthList err:" + JSON.stringify(err));
                            expect(err.code!=0).assertEqual(true);
                            console.debug("====>ActsAccountAuthToken_12600 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray).assertEqual(null);
                            appAccountManager.removeAccount("account_testgetAuthList_name",(err)=>{
                                console.debug("====>ActsAccountAuthToken_12600 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.debug("====>ActsAccountAuthToken_12600 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_12700', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_12700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.getAuthList("","authType").then((dataArray)=>{
                console.debug("====>ActsAccountAuthToken_12700 getAuthList dataArray:" + JSON.stringify(dataArray));                
                expect(dataArray.length).assertEqual(0);
                done();
            }).catch((err)=>{
                expect(err.code!=0).assertEqual(true);
                done();
            })
        });
    
        it('ActsAccountAuthToken_12800', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_12800 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.getAuthList(" ","authType",(err,dataArray)=>{
                console.debug("====>ActsAccountAuthToken_12800 getAuthList err:" + JSON.stringify(err));
                console.debug("====>ActsAccountAuthToken_12800 getAuthList dataArray:" + JSON.stringify(dataArray));
                expect(err.code!=0).assertEqual(true);
                expect(dataArray).assertEqual(null);
                done();
            });
        });
    
        it('ActsAccountAuthToken_12900', 0, async function (done) {
            var limitName = '';
            for(var i = 0; i < LENGTHLIMIT + 1; i++){
                limitName += 't';
            }
            console.debug("====>ActsAccountAuthToken_12900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.getAuthList(limitName,"authType",(err,dataArray)=>{
                console.debug("====>ActsAccountAuthToken_12900 getAuthList err:" + JSON.stringify(err));
                console.debug("====>ActsAccountAuthToken_12900 getAuthList dataArray:" + JSON.stringify(dataArray));
                expect(err.code!=0).assertEqual(true);
                expect(dataArray).assertEqual(null);
                done();
            });
        });
    
        it('ActsAccountAuthToken_13000', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_13000 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.getAuthList("no_add_account","authType",(err,dataArray)=>{
                console.debug("====>ActsAccountAuthToken_13000 getAuthList err:" + JSON.stringify(err));
                console.debug("====>ActsAccountAuthToken_13000 getAuthList dataArray:" + JSON.stringify(dataArray));
                expect(err.code!=0).assertEqual(true);
                expect(dataArray).assertEqual(null);
                done();
            });
        });
    
        it('ActsAccountAuthToken_13100', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_13100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_tokenTest_name",(err,)=>{
                console.debug("====>ActsAccountAuthToken_13100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_tokenTest_name","authType","test_token",(err)=>{
                    console.debug("====>ActsAccountAuthToken_13100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                        console.debug("====>ActsAccountAuthToken_13100 getAuthToken err:" + JSON.stringify(err));
                        console.debug("====>ActsAccountAuthToken_13100 getAuthToken stateBack:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("test_token");
                        appAccountManager.checkAuthTokenVisibility("account_tokenTest_name","authType",valid_owner_name,(err,stateBack)=>{
                            console.debug("====>ActsAccountAuthToken_13100 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            console.debug("====>ActsAccountAuthToken_13100 checkAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(false);
                            appAccountManager.getAuthList("account_tokenTest_name","authType",(err,dataArray)=>{
                                console.debug("====>ActsAccountAuthToken_13100 getAuthList err:" + JSON.stringify(err));
                                console.debug("====>ActsAccountAuthToken_13100 getAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(err).assertEqual(null);
                                expect(dataArray.length).assertEqual(0);
                                appAccountManager.setAuthTokenVisibility("account_tokenTest_name","authType",valid_owner_name,true,(err)=>{
                                    console.debug("====>ActsAccountAuthToken_13100 setAuthTokenVisibility err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    appAccountManager.checkAuthTokenVisibility("account_tokenTest_name","authType",valid_owner_name,(err,stateBack)=>{
                                        console.debug("====>ActsAccountAuthToken_13100 checkAuthTokenVisibility err:" + JSON.stringify(err));
                                        console.debug("====>ActsAccountAuthToken_13100 checkAuthTokenVisibility stateBack:" + stateBack);
                                        expect(err).assertEqual(null);
                                        expect(stateBack).assertEqual(true);
                                        appAccountManager.getAuthList("account_tokenTest_name","authType",(err,dataArray)=>{
                                            console.debug("====>ActsAccountAuthToken_13100 getAuthList err:" + JSON.stringify(err));
                                            console.debug("====>ActsAccountAuthToken_13100 getAuthList dataArray:" + JSON.stringify(dataArray));
                                            expect(err).assertEqual(null);
                                            expect(dataArray.length).assertEqual(1);
                                            expect(dataArray[0]).assertEqual(valid_owner_name);
                                            appAccountManager.removeAccount("account_tokenTest_name",(err)=>{
                                                console.debug("====>ActsAccountAuthToken_13100 removeAccount err:" + JSON.stringify(err));
                                                expect(err).assertEqual(null);
                                                console.debug("====>ActsAccountAuthToken_13100 end====");
                                                done();
                                            });
                                        });
                                    });     
                                });
                            });
                        }); 
                    });
                });
            });
        });
    
        it('ActsAccountAuthToken_13200', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_13200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.queryAuthenticatorInfo("com.example.actsaccountOauthtoken",(err,dataInfo)=>{
                console.debug("====>ActsAccountAuthToken_13200 queryAuthenticatorInfo err:" + JSON.stringify(err));
                console.debug("====>ActsAccountAuthToken_13200 queryAuthenticatorInfo dataInfo:" + JSON.stringify(dataInfo));
                expect(err).assertEqual(null);
                expect(isNaN(dataInfo.iconId)).assertFalse();
                expect(isNaN(dataInfo.labelId)).assertFalse();
                done();
            });
        });
    
        it('ActsAccountAuthToken_13300', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_13300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.auth("authenticate_test_account","com.example.actsaccountOauthtoken","authType",{},{
                onResult: (resultCode, resultData)=>{
                    console.debug("====>ActsAccountAuthToken_13300 authenticate resultCode:" + JSON.stringify(resultCode));
                    console.debug("====>ActsAccountAuthToken_13300 authenticate resultData:" + JSON.stringify(resultData));
                    expect(resultCode.code).assertEqual(0);
                    expect(resultData.name).assertEqual("authenticate_test_account");
                    expect(resultData.authType).assertEqual("authType");
                    expect(resultData.token).assertEqual("serviceApp/authenticate/Token");
                    done();
                },
                onRequestRedirected: null
            });
            done();
        });
    
        it('ActsAccountAuthToken_13400', 0, async function (done) {
            console.debug("====>ActsAccountAuthToken_13400 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccountImplicitly("com.example.actsaccountOauthtoken",{},{
                onResult: (resultCode, resultData) =>{
                    console.debug("====>ActsAccountAuthToken_13400 authenticate resultCode:" + JSON.stringify(resultCode));
                    console.debug("====>ActsAccountAuthToken_13400 authenticate resultData:" + JSON.stringify(resultData));
                    expect(resultCode.code).assertEqual(0);
                    expect(resultData.name).assertEqual("authenticate_test_account");
                    expect(resultData.authType).assertEqual("authType");
                    expect(resultData.token).assertEqual("serviceApp/authenticate/Token");
                    done();
                },
                onRequestRedirected: (request) =>{
                    console.debug("====>ActsAccountAuthToken_13400 onRequestRedirected request:" + JSON.stringify(request));
                    let abilityStartSetting = {
                        want:request
                    }
                    featureAbility.startAbility(abilityStartSetting, (err, result)=>{
                        console.debug("====>ActsAccountAuthToken_13400 onRequestRedirected err:" + JSON.stringify(err));
                    });
                    done();
                }
            });
            done();
        });
    })
}

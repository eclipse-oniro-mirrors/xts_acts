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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import {AccountErrCode} from './AccountErrCode.test.js'

const LENGTHLIMIT = 512;
const TOKENLENGTHLIMIT = 1024;
const AUTHTYPELENGTHLIMIT = 1024;
const OWNERLENGTHLIMIT = 1024;
const ERR_JS_AUTH_TYPE_NOT_FOUND = 12300107;
const OWNERSELF = "com.example.actsaccountoperatetest";
export default function ActsAccountAuthToken() {
    describe('ActsAccountAuthToken', function () {


        var valid_owner_name = "com.example.actsaccountOauthtoken";
        /**
         * @tc.name   ActsAccountAuthToken_9100
         * @tc.number ActsAccountAuthToken_9100
         * @tc.desc   ActsAccountAuthToken_9100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_9100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_tokenTest_name",(err,)=>{
                console.info("====>ActsAccountAuthToken_9100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_tokenTest_name","authType1","test_token1",(err)=>{
                    console.info("====>ActsAccountAuthToken_9100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthToken("account_tokenTest_name","authType1","test_token2",(err)=>{
                        console.info("====>ActsAccountAuthToken_9100 setAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setAuthTokenVisibility("account_tokenTest_name","authType1",valid_owner_name,true,(err)=>{
                            console.info("====>ActsAccountAuthToken_9100 setAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.setAuthToken("account_tokenTest_name","authType2","test_token2",(err)=>{
                                console.info("====>ActsAccountAuthToken_9100 setAuthToken err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                    console.info("====>ActsAccountAuthToken_9100 getAllAuthTokens err:" + JSON.stringify(err));
                                    console.info("====>ActsAccountAuthToken_9100 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                    expect(err).assertEqual(null);
                                    expect(ArrayData.length).assertEqual(2);
                                    appAccountManager.deleteAuthToken("account_tokenTest_name",OWNERSELF,"authType1","test_token2",(err)=>{
                                        console.info("====>ActsAccountAuthToken_9100 deleteAuthToken err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        appAccountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                            console.info("====>ActsAccountAuthToken_9100 getAllAuthTokens err:" + JSON.stringify(err));
                                            console.info("====>ActsAccountAuthToken_9100 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                            expect(err).assertEqual(null);
                                            expect(ArrayData.length).assertEqual(1);
                                            appAccountManager.removeAccount("account_tokenTest_name",(err)=>{
                                                console.info("====>ActsAccountAuthToken_9100 removeAccount err:" + JSON.stringify(err));
                                                expect(err).assertEqual(null);
                                                console.info("====>ActsAccountAuthToken_9100 end====");
                                                appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                                                    console.info("====>ActsAccountAuthToken_9100 getAuthToken err:" + JSON.stringify(err));
                                                    console.info("====>ActsAccountAuthToken_9100 getAuthToken data:" + data);
                                                    expect(err.code).assertEqual(AccountErrCode.ERR_JS_ACCOUNT_NOT_FOUND);
                                                    console.info("====>ActsAccountAuthToken_9100 end====");
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


        /**
         * @tc.name   ActsAccountAuthToken_9000
         * @tc.number ActsAccountAuthToken_9000
         * @tc.desc   ActsAccountAuthToken_9000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_9000 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_tokenTest_name",(err,)=>{
                console.info("====>ActsAccountAuthToken_9000 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_tokenTest_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_9000 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                        console.info("====>ActsAccountAuthToken_9000 getAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_9000 getAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("test_token");
                        appAccountManager.setAuthTokenVisibility("account_tokenTest_name","authType",valid_owner_name,true,(err)=>{
                            console.info("====>ActsAccountAuthToken_9000 setAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getAuthList("account_tokenTest_name","authType",(err,dataArray)=>{
                                console.info("====>ActsAccountAuthToken_9000 getAuthList err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_9000 getAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(1);
                                expect(dataArray[0]).assertEqual(valid_owner_name);
                                appAccountManager.deleteAuthToken("account_tokenTest_name",OWNERSELF,"authType","test_token",(err)=>{
                                    console.info("====>ActsAccountAuthToken_9000 deleteAuthToken err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    appAccountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                        console.info("====>ActsAccountAuthToken_9000 getAllAuthTokens err:" + JSON.stringify(err));
                                        console.info("====>ActsAccountAuthToken_9000 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                        expect(err).assertEqual(null);
                                        expect(ArrayData.length).assertEqual(0);
                                        appAccountManager.setAuthTokenVisibility("account_tokenTest_name","authType",OWNERSELF,false,(err)=>{
                                            console.info("====>ActsAccountAuthToken_9000 setAuthTokenVisibility err:" + JSON.stringify(err));
                                            expect(err.code).assertEqual(12300002);
                                            appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                                                console.info("====>ActsAccountAuthToken_9000 getAuthToken err:" + JSON.stringify(err));
                                                console.info("====>ActsAccountAuthToken_9000 getAuthToken data:" + data);
                                                expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND);
                                                expect(data).assertEqual(null);
                                                appAccountManager.removeAccount("account_tokenTest_name",(err)=>{
                                                    console.info("====>ActsAccountAuthToken_9000 removeAccount err:" + JSON.stringify(err));
                                                    expect(err).assertEqual(null);
                                                    console.info("====>ActsAccountAuthToken_9000 end====");
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



        /**
         * @tc.name   ActsAccountAuthToken_7100
         * @tc.number ActsAccountAuthToken_7100
         * @tc.desc   ActsAccountAuthToken_7100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAccountAuthToken_7100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_7100 createAccount start====");
            appAccountManager.createAccount("account_tokenTest_name",(err)=>{
                console.info("====>ActsAccountAuthToken_7100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_tokenTest_name","authType1","test_token1",(err)=>{
                    console.info("====>ActsAccountAuthToken_7100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthToken("account_tokenTest_name","authType1","test_token2",(err)=>{
                        console.info("====>ActsAccountAuthToken_7100 setAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setAuthToken("account_tokenTest_name","authType2","test_token2",(err)=>{
                            console.info("====>ActsAccountAuthToken_7100 setAuthToken err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                console.info("====>ActsAccountAuthToken_7100 getAllAuthTokens err:" + JSON.stringify(err));
                                console.info("====>ActsAccountAuthToken_7100 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                expect(err).assertEqual(null);
                                expect(ArrayData.length).assertEqual(2);
                                expect(ArrayData[0].authType).assertEqual("authType1");
                                expect(ArrayData[0].token).assertEqual("test_token2");
                                expect(ArrayData[1].authType).assertEqual("authType2");
                                expect(ArrayData[1].token).assertEqual("test_token2");
                                appAccountManager.deleteAuthToken("account_tokenTest_name",OWNERSELF,"authType1","test_token2",(err)=>{
                                    console.info("====>ActsAccountAuthToken_7100 deleteAuthToken err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    appAccountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                        console.info("====>ActsAccountAuthToken_7100 getAllAuthTokens err:" + JSON.stringify(err));
                                        console.info("====>ActsAccountAuthToken_7100 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                        expect(err).assertEqual(null);
                                        expect(ArrayData.length).assertEqual(1);
                                        expect(ArrayData[0].authType).assertEqual("authType2");
                                        expect(ArrayData[0].token).assertEqual("test_token2");
                                        appAccountManager.removeAccount("account_tokenTest_name",(err)=>{
                                            console.info("====>ActsAccountAuthToken_7100 removeAccount err:" + JSON.stringify(err));
                                            expect(err).assertEqual(null);
                                            appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                                                console.info("====>ActsAccountAuthToken_7100 getAuthToken err:" + JSON.stringify(err));
                                                console.info("====>ActsAccountAuthToken_7100 getAuthToken data:" + data);
                                                expect(err.code!=0).assertEqual(true);
                                                expect(data).assertEqual(null);
                                                console.info("====>ActsAccountAuthToken_7100 end====");
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


        /**
         * @tc.name   ActsAccountAuthToken_7200
         * @tc.number ActsAccountAuthToken_7200
         * @tc.desc   ActsAccountAuthToken_7200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_7200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_tokenTest_name",(err,)=>{
                console.info("====>ActsAccountAuthToken_7200 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_tokenTest_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_7200 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                        console.info("====>ActsAccountAuthToken_7200 getAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_7200 getAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("test_token");
                        appAccountManager.getAuthList("account_tokenTest_name","authType",(err,dataArray)=>{
                            console.info("====>ActsAccountAuthToken_7200 getAuthList err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_7200 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray.length).assertEqual(0);
                            appAccountManager.removeAccount("account_tokenTest_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_7200 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_7200 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_7201
         * @tc.number ActsAccountAuthToken_7201
         * @tc.desc   test getAuthList promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_7201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_7201 start====");
            let appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_7201 createAccount start====");
            try {
                await appAccountManager.createAccount("account_tokenTest_name");
                console.info("====>ActsAccountAuthToken_7201 setAuthToken start====");
                await appAccountManager.setAuthToken("account_tokenTest_name","authType","test_token");
                console.info("====>ActsAccountAuthToken_7201 getAuthList start====");
                let dataArray = await appAccountManager.getAuthList("account_tokenTest_name","authType");
                console.info("====>ActsAccountAuthToken_7201 getAuthList dataArray:" + JSON.stringify(dataArray));
                expect(dataArray.length).assertEqual(0);
                console.info("====>ActsAccountAuthToken_7201 removeAccount start====");
                await appAccountManager.removeAccount("account_tokenTest_name");
                console.info("====>ActsAccountAuthToken_7201 end====");
                done();
            } catch (err) {
                console.info("====>ActsAccountAuthToken_7201 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   ActsAccountAuthToken_7300
         * @tc.number ActsAccountAuthToken_7300
         * @tc.desc   ActsAccountAuthToken_7300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_7300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_7300 createAccount start====");
            appAccountManager.createAccount("account_tokenTest_name",(err)=>{
                console.info("====>ActsAccountAuthToken_7300 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_tokenTest_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_7300 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                        console.info("====>ActsAccountAuthToken_7300 getAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_7300 getAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("test_token");
                        appAccountManager.checkAuthTokenVisibility("account_tokenTest_name","authType",OWNERSELF,(err,stateBack)=>{
                            console.info("====>ActsAccountAuthToken_7300 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountAuthToken_7300 checkAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(true);
                            appAccountManager.setAuthTokenVisibility("account_tokenTest_name","authType",OWNERSELF,false,(err)=>{
                                console.info("====>ActsAccountAuthToken_7300 setAuthTokenVisibility err:" + JSON.stringify(err));
                                expect(err.code).assertEqual(12300002);
                                appAccountManager.checkAuthTokenVisibility("account_tokenTest_name","authType",OWNERSELF,(err,stateBack)=>{
                                    console.info("====>ActsAccountAuthToken_7300 checkAuthTokenVisibility err:" + JSON.stringify(err));
                                    console.info("====>ActsAccountAuthToken_7300 checkAuthTokenVisibility stateBack:" + stateBack);
                                    expect(err).assertEqual(null);
                                    expect(stateBack).assertEqual(true);
                                    appAccountManager.deleteAuthToken("account_tokenTest_name",OWNERSELF,"authType","test_token",(err)=>{
                                        console.info("====>ActsAccountAuthToken_7300 deleteAuthToken err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        appAccountManager.removeAccount("account_tokenTest_name",(err)=>{
                                            console.info("====>ActsAccountAuthToken_7300 removeAccount err:" + JSON.stringify(err));
                                            expect(err).assertEqual(null);
                                            console.info("====>ActsAccountAuthToken_7300 end====");
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

        /**
         * @tc.name   ActsAccountAuthToken_7400
         * @tc.number ActsAccountAuthToken_7400
         * @tc.desc   ActsAccountAuthToken_7400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT + 1; i++){
                limitAuthType += 'c';
            }
            console.info("====>ActsAccountAuthToken_7400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_7400 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_limit",(err)=>{
                console.info("====>ActsAccountAuthToken_7400 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_limit","authType","callback_authType_limit_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_7400 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_authType_limit",OWNERSELF,limitAuthType,"callback_authType_limit_token",(err)=>{
                        console.info("====>ActsAccountAuthToken_7400 getAuthToken err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(12300002);
                        appAccountManager.removeAccount("account_callback_authType_limit",(err)=>{
                            console.info("====>ActsAccountAuthToken_7400 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_7400 end====");
                            done();
                        });
                    });
                });
            });
        });


        /**
         * @tc.name   ActsAccountAuthToken_7500
         * @tc.number ActsAccountAuthToken_7500
         * @tc.desc   ActsAccountAuthToken_7500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT + 1; i++){
                limitAuthType += 'c';
            }
            console.info("====>ActsAccountAuthToken_7500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_7500 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_limit");
            console.info("====>ActsAccountAuthToken_7500 getAuthToken start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_authType_limit",OWNERSELF,limitAuthType,"promise_authType_limit_token");
            }
            catch(err){
                console.info("====>ActsAccountAuthToken_7500 getAuthToken err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                console.info("====>ActsAccountAuthToken_7500 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_authType_limit");
                console.info("====>ActsAccountAuthToken_7500 end====");
                done();
            }
        });



        /**
         * @tc.name   ActsAccountAuthToken_7600
         * @tc.number ActsAccountAuthToken_7600
         * @tc.desc   ActsAccountAuthToken_7600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT; i++){
                limitAuthType += 'c';
            }
            console.info("====>ActsAccountAuthToken_7600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_7600 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_limit",(err)=>{
                console.info("====>ActsAccountAuthToken_7600 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_limit",limitAuthType,"callback_authType_limit_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_7600 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_authType_limit",OWNERSELF,limitAuthType,"callback_authType_limit_token",(err)=>{
                        console.info("====>ActsAccountAuthToken_7600 getAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_authType_limit",(err)=>{
                            console.info("====>ActsAccountAuthToken_7600 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_7600 end====");
                            done();
                        });
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_7700
         * @tc.number ActsAccountAuthToken_7700
         * @tc.desc   ActsAccountAuthToken_7700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT; i++){
                limitAuthType += 'c';
            }
            console.info("====>ActsAccountAuthToken_7700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_7700 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_limit")
            console.info("====>ActsAccountAuthToken_7700 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_authType_limit",limitAuthType,"promise_authType_limit_token");
            console.info("====>ActsAccountAuthToken_7700 deleteAuthToken start====");
            await appAccountManager.deleteAuthToken("account_promise_authType_limit",OWNERSELF,limitAuthType,"promise_authType_limit_token")
            console.info("====>ActsAccountAuthToken_7700 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_authType_limit")
            console.info("====>ActsAccountAuthToken_7700 end====");
            done();

        });


        
        /**
         * @tc.name   ActsAccountAuthToken_7800
         * @tc.number ActsAccountAuthToken_7800
         * @tc.desc   ActsAccountAuthToken_7800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_7800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_7800 createAccount start====");
            appAccountManager.createAccount("account_callback_empty_authType",(err)=>{
                console.info("====>ActsAccountAuthToken_7800 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_empty_authType","authType","callback_empty_authType_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_7800 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_empty_authType",OWNERSELF,"","callback_empty_authType_token",(err)=>{
                        console.info("====>ActsAccountAuthToken_7800 deleteAuthToken err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(12300107);
                        appAccountManager.getAuthToken("account_callback_empty_authType",OWNERSELF,"authType",(err,data)=>{
                            console.info("====>ActsAccountAuthToken_7800 getAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountAuthToken_7800 getAuthToken data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_empty_authType_token");
                            appAccountManager.removeAccount("account_callback_empty_authType",(err)=>{
                                console.info("====>ActsAccountAuthToken_7800 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_7800 end====");
                                done();
                            });
                        });
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_7900
         * @tc.number ActsAccountAuthToken_7900
         * @tc.desc   ActsAccountAuthToken_7900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_7900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_7900 createAccount start====");
            await appAccountManager.createAccount("account_promise_empty_authType");
            console.info("====>ActsAccountAuthToken_7900 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_empty_authType","authType","promise_empty_authType_token");
            
            try {
                console.info("====>ActsAccountAuthToken_7900 deleteAuthToken start====");
                await appAccountManager.deleteAuthToken("account_promise_empty_authType",OWNERSELF,"","promise_empty_authType_token");
            } catch(err) {
                console.info("====>ActsAccountAuthToken_7900 deleteAuthToken err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300107);
                console.info("====>ActsAccountAuthToken_7900 getAuthToken start====");
                var data = await appAccountManager.getAuthToken("account_promise_empty_authType",OWNERSELF,"authType");
                expect(data).assertEqual("promise_empty_authType_token");
                console.info("====>ActsAccountAuthToken_7900 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_empty_authType");
                console.info("====>ActsAccountAuthToken_7900 end====");
                done();

            }
        });


        /**
         * @tc.name   ActsAccountAuthToken_8000
         * @tc.number ActsAccountAuthToken_8000
         * @tc.desc   ActsAccountAuthToken_8000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_8000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_8000 createAccount start====");
            appAccountManager.createAccount("account_callback_setSameAuthType",(err)=>{
                console.info("====>ActsAccountAuthToken_8000 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_token1",(err)=>{
                    console.info("====>ActsAccountAuthToken_8000 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_token2",(err)=>{
                        console.info("====>ActsAccountAuthToken_8000 setAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthToken("account_callback_setSameAuthType",OWNERSELF,"authType",(err,data)=>{
                            console.info("====>ActsAccountAuthToken_8000 getAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountAuthToken_8000 getAuthToken data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_setSameAuthType_token2");
                            appAccountManager.deleteAuthToken("account_callback_setSameAuthType",OWNERSELF,"authType","callback_setSameAuthType_token1",(err,data)=>{
                                console.info("====>ActsAccountAuthToken_8000 deleteAuthToken err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.removeAccount("account_callback_setSameAuthType",(err)=>{
                                    console.info("====>ActsAccountAuthToken_8000 removeAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountAuthToken_8000 end====");
                                    done();
                                }); 
                            }); 
                        });
                    });
                });
            });
        });


        /**
         * @tc.name   ActsAccountAuthToken_8100
         * @tc.number ActsAccountAuthToken_8100
         * @tc.desc   ActsAccountAuthToken_8100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            var limitName = '';
            for(var i = 0;i < LENGTHLIMIT + 1; i++){
                limitName += 'c';
            }
            console.info("====>ActsAccountAuthToken_8100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_8100 getAllAuthTokens start====");
            appAccountManager.getAllAuthTokens(limitName, OWNERSELF).then((ArrayData)=>{
                console.info("====>run err");
                expect().assertFail();
                done();
            }).catch((err)=>{
                console.info("====>ActsAccountAuthToken_8100 getAllAuthTokens err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                done();
            })
        });
        
        /**
         * @tc.name   ActsAccountAuthToken_8200
         * @tc.number ActsAccountAuthToken_8200
         * @tc.desc   ActsAccountAuthToken_8200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_8200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_8200 getAllAuthTokens start====");
            appAccountManager.getAllAuthTokens("", OWNERSELF,(err,ArrayData)=>{
                console.info("====>ActsAccountAuthToken_8200 getAllAuthTokens err:" + JSON.stringify(err));
                console.info("====>ActsAccountAuthToken_8200 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                expect(err.code).assertEqual(12300002);
                console.info("====>ActsAccountAuthToken_8200 ====");
                done();
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_8300
         * @tc.number ActsAccountAuthToken_8300
         * @tc.desc   ActsAccountAuthToken_8300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_8300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_8300 getAllAuthTokens start====");
            appAccountManager.getAllAuthTokens("acount_no_setToken", OWNERSELF,(err,ArrayData)=>{
                console.info("====>ActsAccountAuthToken_8300 getAllAuthTokens err:" + JSON.stringify(err));
                console.info("====>ActsAccountAuthToken_8300 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                expect(err.code).assertEqual(12300003);
                expect(ArrayData).assertEqual(null);
                console.info("====>ActsAccountAuthToken_8300 end====");
                done();
            });
        });



        /**
         * @tc.name   ActsAccountAuthToken_8400
         * @tc.number ActsAccountAuthToken_8400
         * @tc.desc   ActsAccountAuthToken_8400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_8400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_8400 createAccount start====");
            appAccountManager.createAccount("acount_no_setToken",(err)=>{
                console.info("====>ActsAccountAuthToken_8400 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAuthTokens("acount_no_setToken", OWNERSELF,(err,ArrayData)=>{
                    console.info("====>ActsAccountAuthToken_8400 getAllAuthTokens err:" + JSON.stringify(err));
                    console.info("====>ActsAccountAuthToken_8400 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err).assertEqual(null);
                    expect(ArrayData.length).assertEqual(0);
                    appAccountManager.removeAccount("acount_no_setToken",(err)=>{
                        console.info("====>ActsAccountAuthToken_8400 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_8400 end====");
                        done();
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_8401
         * @tc.number ActsAccountAuthToken_8401
         * @tc.desc   getAllAuthTokens promise test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_8401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_8401 start====");
            let appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_8401 createAccount start====");
            try {
                await appAccountManager.createAccount("acount_no_setToken");
                let ArrayData = await appAccountManager.getAllAuthTokens("acount_no_setToken", OWNERSELF);
                console.info("====>ActsAccountAuthToken_8401 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                expect(ArrayData.length).assertEqual(0);
                await appAccountManager.removeAccount("acount_no_setToken");
                console.info("====>ActsAccountAuthToken_8401 end====");
                done();
            } catch (err) {
                console.info("====>ActsAccountAuthToken_8401 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   ActsAccountAuthToken_8500
         * @tc.number ActsAccountAuthToken_8500
         * @tc.desc   getAllAuthTokens callback test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            var limitName = '';
            for(var i = 0;i < LENGTHLIMIT; i++){
                limitName += 'c';
            }
            console.info("====>ActsAccountAuthToken_8500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_8500 createAccount start====");
            appAccountManager.createAccount(limitName,(err)=>{
                console.info("====>ActsAccountAuthToken_8500 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken(limitName,"authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_8500 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAllAuthTokens(limitName, OWNERSELF,(err,ArrayData)=>{
                        console.info("====>ActsAccountAuthToken_8500 getAllAuthTokens err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_8500 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                        expect(err).assertEqual(null);
                        expect(ArrayData.length > 0).assertTrue();
                        expect(ArrayData.length).assertEqual(1);
                        expect(ArrayData[0].authType).assertEqual("authType");
                        expect(ArrayData[0].token).assertEqual("test_token");
                        appAccountManager.removeAccount(limitName,(err)=>{
                            console.info("====>ActsAccountAuthToken_8500 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_8500 end====");
                            done();
                        });
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_8501
         * @tc.number ActsAccountAuthToken_8501
         * @tc.desc   getAllAuthTokens promise test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_8501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_8501 start====");
            let appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_8501 createAccount start");
            try {
                await appAccountManager.createAccount("acount_no_setToken");
                console.info("====>ActsAccountAuthToken_8501 setAuthToken start");
                await appAccountManager.setAuthToken("acount_no_setToken","authType","test_token");
                console.info("====>ActsAccountAuthToken_8501 getAllAuthTokens start");
                let ArrayData = await appAccountManager.getAllAuthTokens("acount_no_setToken", OWNERSELF);
                console.info("====>ActsAccountAuthToken_8501 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                expect(ArrayData.length > 0).assertTrue();
                await appAccountManager.removeAccount("acount_no_setToken");
                console.info("====>ActsAccountAuthToken_8501 end====");
                done();
            } catch (err) {
                console.info("====>ActsAccountAuthToken_8501 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });


        /**
         * @tc.name   ActsAccountAuthToken_8600
         * @tc.number ActsAccountAuthToken_8600
         * @tc.desc   ActsAccountAuthToken_8600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            var limitOwner = '';
            for(var i = 0;i < OWNERLENGTHLIMIT + 1; i++){
                limitOwner += 'c';
            }
            console.info("====>ActsAccountAuthToken_8600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_8600 createAccount start====");
            appAccountManager.createAccount("account_callback_getAllAuthTokens_test",(err)=>{
                console.info("====>ActsAccountAuthToken_8600 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test",limitOwner,(err,ArrayData)=>{
                    console.info("====>ActsAccountAuthToken_8600 getAllAuthTokens err:" + JSON.stringify(err));
                    console.info("====>ActsAccountAuthToken_8600 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err.code).assertEqual(12300002);
                    expect(ArrayData).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_getAllAuthTokens_test",(err)=>{
                        console.info("====>ActsAccountAuthToken_8600 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_8600 end====");
                        done();
                    });
                });
            });
        });
        

        /**
         * @tc.name   ActsAccountAuthToken_8700
         * @tc.number ActsAccountAuthToken_8700
         * @tc.desc   ActsAccountAuthToken_8700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_8700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_8700 createAccount start====");
            appAccountManager.createAccount("account_callback_getAllAuthTokens_test",(err)=>{
                console.info("====>ActsAccountAuthToken_8700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test","",(err,ArrayData)=>{
                    console.info("====>ActsAccountAuthToken_8700 getAllAuthTokens err:" + JSON.stringify(err));
                    console.info("====>ActsAccountAuthToken_8700 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err.code).assertEqual(12300002);
                    expect(ArrayData).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_getAllAuthTokens_test",(err)=>{
                        console.info("====>ActsAccountAuthToken_8700 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_8700 end====");
                        done();
                    });
                });
            });
        });

        
        /**
         * @tc.name   ActsAccountAuthToken_8800
         * @tc.number ActsAccountAuthToken_8800
         * @tc.desc   ActsAccountAuthToken_8800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_8800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_8800 createAccount start====");
            appAccountManager.createAccount("account_callback_getAllAuthTokens_test",(err)=>{
                console.info("====>ActsAccountAuthToken_8800 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test","invalid_owner",(err,ArrayData)=>{
                    console.info("====>ActsAccountAuthToken_8800 getAllAuthTokens err:" + JSON.stringify(err));
                    console.info("====>ActsAccountAuthToken_8800 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err.code).assertEqual(12300003);
                    expect(ArrayData).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_getAllAuthTokens_test",(err)=>{
                        console.info("====>ActsAccountAuthToken_8800 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_8800 end====");
                        done();
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_8801
         * @tc.number ActsAccountAuthToken_8801
         * @tc.desc   appAccount authToken scene testcases
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_8801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_8801 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_8801 createAccount start====");
            appAccountManager.createAccount("account_callback_getAllAuthTokens_test",(err)=>{
                console.info("====>ActsAccountAuthToken_8801 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test","invalid_owner").then((ArrayData)=>{
                    console.info("====>run err");
                    expect().assertFail();
                }).catch((err)=>{
                    console.info("====>ActsAccountAuthToken_8801 getAllAuthTokens err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(12300003);
                    appAccountManager.removeAccount("account_callback_getAllAuthTokens_test",(err)=>{
                        console.info("====>ActsAccountAuthToken_8801 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_8801 end====");
                        done();
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_8900
         * @tc.number ActsAccountAuthToken_8900
         * @tc.desc   ActsAccountAuthToken_8900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_8900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_8900 createAccount start====");
            appAccountManager.createAccount("account_callback_getAllAuthTokens_test",(err)=>{
                console.info("====>ActsAccountAuthToken_8900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test"," ",(err,ArrayData)=>{
                    console.info("====>ActsAccountAuthToken_8900 getAllAuthTokens err:" + JSON.stringify(err));
                    console.info("====>ActsAccountAuthToken_8900 getAllAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err.code).assertEqual(12300003);
                    expect(ArrayData).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_getAllAuthTokens_test",(err)=>{
                        console.info("====>ActsAccountAuthToken_8900 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_8900 end====");
                        done();
                    });
                });
            });
        });




        /**
         * @tc.name   ActsAccountAuthToken_0100
         * @tc.number ActsAccountAuthToken_0100
         * @tc.desc   ActsAccountAuthToken_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ActsAccountAuthToken_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsAccountAuthToken_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_0100 createAccount start====");
            appAccountManager.createAccount("account_callback_normal",(err)=>{
                console.info("====>ActsAccountAuthToken_0100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_normal","authType","callback_normal_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_0100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_normal",OWNERSELF,"authType",(err,data)=>{
                        console.info("====>ActsAccountAuthToken_0100 getAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_0100 getAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("callback_normal_token");
                        appAccountManager.checkAuthTokenVisibility("account_callback_normal","authType",OWNERSELF,(err,stateBack)=>{
                            console.info("====>ActsAccountAuthToken_0100 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountAuthToken_0100 checkAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(true);
                            appAccountManager.deleteAuthToken("account_callback_normal",OWNERSELF,"authType","callback_normal_token",(err)=>{
                                console.info("====>ActsAccountAuthToken_0100 deleteAuthToken err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.removeAccount("account_callback_normal",(err)=>{
                                    console.info("====>ActsAccountAuthToken_0100 removeAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountAuthToken_0100 end====");
                                    done();
                                });
                            });
                        });
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_0200
         * @tc.number ActsAccountAuthToken_0200
         * @tc.desc   Gets the local ID of the foreground OS account.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ActsAccountAuthToken_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsAccountAuthToken_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_0200 createAccount start====");
            await appAccountManager.createAccount("account_promise_normal");
            console.info("====>ActsAccountAuthToken_0200 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_normal","authType","promise_normal_token");
            console.info("====>ActsAccountAuthToken_0200 getAuthToken start====");
            var data1 = await appAccountManager.getAuthToken("account_promise_normal",OWNERSELF,"authType");
            console.info("====>getAuthToken ActsAccountAuthToken_0200 data:" + data1);
            expect(data1).assertEqual("promise_normal_token");
            let state0 = await appAccountManager.checkAuthTokenVisibility("account_promise_normal","authType","test_bundleName");
            console.info("====>checkOAuthTokenVisibility ActsAccountOAuthToken_0200 state: " + state0);
            expect(state0).assertFalse();
            console.info("====>ActsAccountAuthToken_0200 checkAuthTokenVisibility start====");
            var state = await appAccountManager.checkAuthTokenVisibility("account_promise_normal","authType",OWNERSELF);
            console.info("====>checkAuthTokenVisibility ActsAccountAuthToken_0200 state:" + state);
            expect(state).assertTrue();
            console.info("====>ActsAccountAuthToken_0200 deleteAuthToken start====");
            await appAccountManager.deleteAuthToken("account_promise_normal",OWNERSELF,"authType","promise_normal_token");
            console.info("====>ActsAccountAuthToken_0200 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_normal");
            console.info("====>ActsAccountAuthToken_0200 end====");
            done();
        });




        /**
         * @tc.name   ActsAccountAuthToken_0300
         * @tc.number ActsAccountAuthToken_0300
         * @tc.desc   ActsAccountAuthToken_0300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAccountAuthToken_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_0300 getAuthToken start====");
            appAccountManager.createAccount("account_callback_noSetToken",(err)=>{
                console.info("====>ActsAccountAuthToken_0300 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAuthToken("account_callback_noSetToken",OWNERSELF,"authType",(err,data)=>{
                    console.info("====>ActsAccountAuthToken_0300 getAuthToken err:" + JSON.stringify(err));
                    console.info("====>ActsAccountAuthToken_0300 getAuthToken data:" + data);
                    expect(err.code).assertEqual(12300107);
                    expect(data).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_noSetToken",(err)=>{
                        console.info("====>ActsAccountAuthToken_0300 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_0300 end====");
                        done();
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_0400
         * @tc.number ActsAccountAuthToken_0400
         * @tc.desc   ActsAccountAuthToken_0400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAccountAuthToken_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_0400 createAccount start====");
            await appAccountManager.createAccount("account_promise_noSetToken");
            console.info("====>ActsAccountAuthToken_0400 getAuthToken start====");
            try{
                await appAccountManager.getAuthToken("account_promise_noSetToken",OWNERSELF,"authType");
            }
            catch(err){
                console.info("====>ActsAccountAuthToken_0400 getAuthToken err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300107);
                console.info("====>ActsAccountAuthToken_0400 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_noSetToken");
                console.info("====>ActsAccountAuthToken_0400 end====");
                done();
            }
        });


        /**
         * @tc.name   ActsAccountAuthToken_0500
         * @tc.number ActsAccountAuthToken_0500
         * @tc.desc   ActsAccountAuthToken_0500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_0500 getAuthToken start====");
            appAccountManager.getAuthToken("noAdd_account_callback",OWNERSELF,"authType",(err,data)=>{
                console.info("====>ActsAccountAuthToken_0500 getAuthToken err:" + JSON.stringify(err));
                console.info("====>ActsAccountAuthToken_0500 getAuthToken data:" + data);
                expect(err.code).assertEqual(12300003);
                expect(data).assertEqual(null);
                done();
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_0600
         * @tc.number ActsAccountAuthToken_0600
         * @tc.desc   ActsAccountAuthToken_0600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_0600 getAuthToken start====");
            try{
                await appAccountManager.getAuthToken("noAdd_account_promise",OWNERSELF,"authType");
            }
            catch(err){
                console.info("====>ActsAccountAuthToken_0600 getAuthToken err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                console.info("====>ActsAccountAuthToken_0600 end====");
                done();
            }
        });


        /**
         * @tc.name   ActsAccountAuthToken_0700
         * @tc.number ActsAccountAuthToken_0700
         * @tc.desc   ActsAccountAuthToken_0700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAccountAuthToken_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_0700 createAccount start====");
            appAccountManager.createAccount("account_callback_setSameAuthType",(err)=>{
                console.info("====>ActsAccountAuthToken_0700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_0700 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_token",(err)=>{
                        console.info("====>ActsAccountAuthToken_0700 setAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthToken("account_callback_setSameAuthType",OWNERSELF,"authType",(err,data)=>{
                            console.info("====>ActsAccountAuthToken_0700 getAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountAuthToken_0700 getAuthToken data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_setSameAuthType_token");
                            appAccountManager.setAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_DiffToken",(err)=>{
                                console.info("====>ActsAccountAuthToken_0700 setAuthToken err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.getAuthToken("account_callback_setSameAuthType",OWNERSELF,"authType",(err,data)=>{
                                    console.info("====>ActsAccountAuthToken_0700 getAuthToken err:" + JSON.stringify(err));
                                    console.info("====>ActsAccountAuthToken_0700 getAuthToken data:" + data);
                                    expect(err).assertEqual(null);
                                    expect(data).assertEqual("callback_setSameAuthType_DiffToken");
                                    appAccountManager.removeAccount("account_callback_setSameAuthType",(err)=>{
                                        console.info("====>ActsAccountAuthToken_0700 removeAccount err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        console.info("====>ActsAccountAuthToken_0700 end====");
                                        done();
                                    });
                                });
                            });   
                        });
                    });
                });
            });
        });




        /**
         * @tc.name   ActsAccountAuthToken_0800
         * @tc.number ActsAccountAuthToken_0800
         * @tc.desc   ActsAccountAuthToken_0800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAccountAuthToken_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_0800 createAccount start====");
            await appAccountManager.createAccount("account_promise_setSameAuthType");
            console.info("====>ActsAccountAuthToken_0800 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_setSameAuthType","authType","promise_setSameAuthType_token");
            console.info("====>ActsAccountAuthToken_0800 repeat setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_setSameAuthType","authType","promise_setSameAuthType_token");
            var data1 = await appAccountManager.getAuthToken("account_promise_setSameAuthType",OWNERSELF,"authType");
            console.info("====>getAuthToken ActsAccountAuthToken_0800 data:" + data1);
            expect(data1).assertEqual("promise_setSameAuthType_token");
            console.info("====>ActsAccountAuthToken_0800 repeat set diffToken setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_setSameAuthType","authType","promise_setSameAuthType_DiffToken");
            var data2 = await appAccountManager.getAuthToken("account_promise_setSameAuthType",OWNERSELF,"authType");
            console.info("====>getAuthToken ActsAccountAuthToken_0800 data:" + data2);
            expect(data2).assertEqual("promise_setSameAuthType_DiffToken");
            console.info("====>ActsAccountAuthToken_0800 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_setSameAuthType");
            console.info("====>ActsAccountAuthToken_0800 end====");
            done();
        });



        /**
         * @tc.name   ActsAccountAuthToken_0900
         * @tc.number ActsAccountAuthToken_0900
         * @tc.desc   ActsAccountAuthToken_0900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.info("====>ActsAccountAuthToken_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_setDiff", (err)=>{
                console.info("====>createAccount ActsAccountAuthToken_0900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_setDiff","authType1","callback_setDiff_token1",(err)=>{
                    console.info("====>getAuthToken ActsAccountAuthToken_0900 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthToken("account_callback_setDiff","authType2","callback_setDiff_token2",(err)=>{
                        console.info("====>getAuthToken ActsAccountAuthToken_0900 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthToken("account_callback_setDiff",OWNERSELF,"authType1", (err, data)=>{
                            console.info("====>getAuthToken ActsAccountAuthToken_0900 err:" + JSON.stringify(err));
                            console.info("====>getAuthToken ActsAccountAuthToken_0900 data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_setDiff_token1");
                            appAccountManager.getAuthToken("account_callback_setDiff",OWNERSELF,"authType2", (err, data)=>{
                                console.info("====>getAuthToken ActsAccountAuthToken_0900 err:" + JSON.stringify(err));
                                console.info("====>getAuthToken ActsAccountAuthToken_0900 data:" + data);
                                expect(err).assertEqual(null);
                                expect(data).assertEqual("callback_setDiff_token2");
                                appAccountManager.removeAccount("account_callback_setDiff", (err)=>{
                                    console.info("====>removeAccount ActsAccountAuthToken_0900 err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountAuthToken_0900 end====");
                                    done();
                                });   
                            });    
                        });
                    });
                });    
            });
        });



        /**
         * @tc.name   ActsAccountAuthToken_1000
         * @tc.number ActsAccountAuthToken_1000
         * @tc.desc   ActsAccountAuthToken_1000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.info("====>ActsAccountAuthToken_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_1000 createAccount start====");
            await appAccountManager.createAccount("account_promise_setDiff");
            console.info("====>setAuthToken ActsAccountAuthToken_1000 start====");
            await appAccountManager.setAuthToken("account_promise_setDiff","aythType1","promise_setDiff_token1");
            console.info("====>setAuthToken ActsAccountAuthToken_1000 start====");
            await appAccountManager.setAuthToken("account_promise_setDiff","aythType2","promise_setDiff_token2");

            console.info("====>getAuthToken ActsAccountAuthToken_1000 start====");
            var data1 = await appAccountManager.getAuthToken("account_promise_setDiff",OWNERSELF,"aythType1");
            console.info("====>getAuthToken getOld ActsAccountAuthToken_1000 data:" + data1);
            expect(data1).assertEqual("promise_setDiff_token1");
            console.info("====>getAuthToken ActsAccountAuthToken_1000 start====");
            var data2 = await appAccountManager.getAuthToken("account_promise_setDiff",OWNERSELF,"aythType2");
            console.info("====>getAuthToken getNew ActsAccountAuthToken_1000 data:" + data2);
            expect(data2).assertEqual("promise_setDiff_token2");

            console.info("====>deleteAuthToken ActsAccountAuthToken_1000 start====");
            await appAccountManager.deleteAuthToken("account_promise_setDiff",OWNERSELF,"aythType1","promise_setDiff_token1");
            console.info("====>deleteAuthToken ActsAccountAuthToken_1000 start====");
            await appAccountManager.deleteAuthToken("account_promise_setDiff",OWNERSELF,"aythType2","promise_setDiff_token2");
            console.info("====>ActsAccountAuthToken_1000 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_setDiff");
            console.info("====>ActsAccountAuthToken_1000 end====");
            done();
        });



        /**
         * @tc.name   ActsAccountAuthToken_1100
         * @tc.number ActsAccountAuthToken_1100
         * @tc.desc   ActsAccountAuthToken_1100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.info("====>ActsAccountAuthToken_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_setDeleteGet", (err)=>{
                console.info("====>createAccount ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_setDeleteGet","old_authType","callback_setDeleteGet_token",(err)=>{
                    console.info("====>getAuthToken ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthToken("account_callback_setDeleteGet","new_authType","callback_setDeleteGet_token",(err)=>{
                        console.info("====>getAuthToken ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"old_authType", (err, data)=>{
                            console.info("====>getAuthToken getOld ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                            console.info("====>getAuthToken getOld ActsAccountAuthToken_1100 data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_setDeleteGet_token");
                            appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"new_authType", (err, data)=>{
                                console.info("====>getAuthToken getNew ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                console.info("====>getAuthToken getNew ActsAccountAuthToken_1100 data:" + data);
                                expect(err).assertEqual(null);
                                expect(data).assertEqual("callback_setDeleteGet_token");
                                appAccountManager.deleteAuthToken("account_callback_setDeleteGet",OWNERSELF,"old_authType","callback_setDeleteGet_token",(err)=>{
                                    console.info("====>deleteAuthToken deleteOld ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                    appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"old_authType", (err, data)=>{
                                        console.info("====>getAuthToken getOld ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                        console.info("====>getAuthToken getOld ActsAccountAuthToken_1100 data:" + data);
                                        expect(err.code!=0).assertEqual(true);
                                        expect(data).assertEqual(null);
                                        appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"new_authType", (err, data)=>{
                                            console.info("====>getAuthToken getNew ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                            console.info("====>getAuthToken getNew ActsAccountAuthToken_1100 data:" + data);
                                            expect(err).assertEqual(null);
                                            expect(data).assertEqual("callback_setDeleteGet_token");
                                            appAccountManager.deleteAuthToken("account_callback_setDeleteGet",OWNERSELF,"new_authType","callback_setDeleteGet_token",(err)=>{
                                                console.info("====>deleteAuthToken deleteNew ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                                appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"old_authType", (err, data)=>{
                                                    console.info("====>getAuthToken getOld ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                                    console.info("====>getAuthToken getOld ActsAccountAuthToken_1100 data:" + data);
                                                    expect(err.code!=0).assertEqual(true);
                                                    expect(data).assertEqual(null);
                                                    appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"new_authType", (err, data)=>{
                                                        console.info("====>getAuthToken getNew ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                                        console.info("====>getAuthToken getNew ActsAccountAuthToken_1100 data:" + data);
                                                        expect(err.code!=0).assertEqual(true);
                                                        expect(data).assertEqual(null);
                                                        appAccountManager.removeAccount("account_callback_setDeleteGet", (err)=>{
                                                            console.info("====>removeAccount ActsAccountAuthToken_1100 err:" + JSON.stringify(err));
                                                            expect(err).assertEqual(null);
                                                            console.info("====>ActsAccountAuthToken_1100 end====");
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


        /**
         * @tc.name   ActsAccountAuthToken_1200
         * @tc.number ActsAccountAuthToken_1200
         * @tc.desc   ActsAccountAuthToken_1200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.info("====>ActsAccountAuthToken_1200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_1200 createAccount start====");
            await appAccountManager.createAccount("account_promise_setDeleteGet");

            console.info("====>setAuthToken setOld ActsAccountAuthToken_1200 start====");
            await appAccountManager.setAuthToken("account_promise_setDeleteGet","old_authType","promise_setDeleteGet_token");
            console.info("====>setAuthToken setNew ActsAccountAuthToken_1200 start====");
            await appAccountManager.setAuthToken("account_promise_setDeleteGet","new_authType","promise_setDeleteGet_token");

            console.info("====>getAuthToken ActsAccountAuthToken_1200 start====");
            var data1BeforeDel = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"old_authType");
            console.info("====>getAuthToken getOld ActsAccountAuthToken_1200 data1BeforeDel:" + data1BeforeDel);
            expect(data1BeforeDel).assertEqual("promise_setDeleteGet_token");
            console.info("====>getAuthToken ActsAccountAuthToken_1200 start====");
            var data2BeforeDel = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"new_authType");
            console.info("====>getAuthToken getNew ActsAccountAuthToken_1200 data2BeforeDel:" + data2BeforeDel);
            expect(data2BeforeDel).assertEqual("promise_setDeleteGet_token");

            console.info("====>deleteAuthToken deleteOld ActsAccountAuthToken_1200 start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_setDeleteGet",OWNERSELF,"old_authType","promise_setDeleteGet_token");
            }
            catch(err){
                console.info("====>deleteAuthToken ActsAccountAuthToken_1200 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
            }

            console.info("====>getAuthToken ActsAccountAuthToken_1200 start====");
            try{
                var data1AfterDel = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"old_authType",);
                console.info("====>getAuthToken getOld ActsAccountAuthToken_1200 data1_AfterDel:" + data1AfterDel);
                expect().assertFail();
            }
            catch(err){
                console.info("====>getAuthToken getOld ActsAccountAuthToken_1200 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);                
            }
            console.info("====>getAuthToken ActsAccountAuthToken_1200 start====");
            try{
                var data2AfterDel = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"new_authType",);
                console.info("====>getAuthToken getOld ActsAccountAuthToken_1200 data2_AfterDel:" + data2AfterDel);
                expect(data2AfterDel).assertEqual("promise_setDeleteGet_token");
            }
            catch(err){
                console.info("====>getAuthToken getNew ActsAccountAuthToken_1200 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
            }
            console.info("====>deleteAuthToken deleteNew ActsAccountAuthToken_1200 start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_setDeleteGet",OWNERSELF,"new_authType","promise_setDeleteGet_token");
            }
            catch(err){
                console.info("====>deleteAuthToken ActsAccountAuthToken_1200 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
            }

            console.info("====>getAuthToken getOld ActsAccountAuthToken_1200 start====");
            try{
                var data1AgainDel = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"old_authType",);
                console.info("====>getAuthToken getOld ActsAccountAuthToken_1200 data1_AgainDel:" + data1AgainDel);
                expect().assertFail();
            }
            catch(err){
                console.info("====>getAuthToken getOld ActsAccountAuthToken_1200 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
            }
            console.info("====>getAuthToken getNew ActsAccountAuthToken_1200 start====");
            try{
                var data2AgainDel = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"new_authType",);
                console.info("====>getAuthToken getOld ActsAccountAuthToken_1200 data2_AgainDel:" + data2AgainDel);
                expect().assertFail();
            }
            catch(err){
                console.info("====>getAuthToken getNew ActsAccountAuthToken_1200 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
            }
            await appAccountManager.removeAccount("account_promise_setDeleteGet");
            console.info("====>ActsAccountAuthToken_1200 end====");
            done();

        });


        /**
         * @tc.name   ActsAccountAuthToken_1300
         * @tc.number ActsAccountAuthToken_1300
         * @tc.desc   ActsAccountAuthToken_1300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            console.info("====>ActsAccountAuthToken_1300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_setDeleteGet", (err)=>{
            console.info("====>createAccount ActsAccountAuthToken_1300 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_setDeleteGet","authType","account_callback_setDeleteGet_token",(err)=>{
                    console.info("====>getAuthToken ActsAccountAuthToken_1300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_setDeleteGet",OWNERSELF,"authType","account_callback_setDeleteGet_token",(err)=>{
                        console.info("====>deleteAuthToken ActsAccountAuthToken_1300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthToken("account_callback_setDeleteGet",OWNERSELF,"authType", (err, data)=>{
                            console.info("====>getAuthToken ActsAccountAuthToken_1300 err:" + JSON.stringify(err));
                            console.info("====>getAuthToken ActsAccountAuthToken_1300 data:" + data);
                            expect(err.code).assertEqual(12300107);
                            expect(data).assertEqual(null);
                            appAccountManager.removeAccount("account_callback_setDeleteGet", (err)=>{
                                console.info("====>removeAccount ActsAccountAuthToken_1300 err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_1300 end====");
                                done();
                            });
                        });
                    });
                });
            });
        });


        /**
         * @tc.name   ActsAccountAuthToken_1400
         * @tc.number ActsAccountAuthToken_1400
         * @tc.desc   ActsAccountAuthToken_1400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            console.info("====>ActsAccountAuthToken_1400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_1400 createAccount start====");
            await appAccountManager.createAccount("account_promise_setDeleteGet");
            console.info("====>setAuthToken ActsAccountAuthToken_1400 start====");
            await appAccountManager.setAuthToken("account_promise_setDeleteGet","authType","promise_setDeleteGet_token");
            console.info("====>deleteAuthToken ActsAccountAuthToken_1400 start====");
            await appAccountManager.deleteAuthToken("account_promise_setDeleteGet",OWNERSELF,"authType","promise_setDeleteGet_token");
            console.info("====>getAuthToken ActsAccountAuthToken_1400 start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_setDeleteGet",OWNERSELF,"authType");
            }
            catch(err){
                console.info("====>getAuthToken ActsAccountAuthToken_1400 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300107);
                console.info("====>getAuthToken ActsAccountAuthToken_1400 data:" + data);
                console.info("====>ActsAccountAuthToken_1400 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_setDeleteGet");
                console.info("====>ActsAccountAuthToken_1400 end====");
                done();
            }
        });


        /**
         * @tc.name   ActsAccountAuthToken_1500
         * @tc.number ActsAccountAuthToken_1500
         * @tc.desc   ActsAccountAuthToken_1500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.info("====>ActsAccountAuthToken_1500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.setAuthToken("account_callback_accountNotExit","authType","account_callback_accountNotExit_token", (err)=>{
                console.info("====>setAuthToken ActsAccountAuthToken_1500 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                console.info("====>ActsAccountAuthToken_1500 end====");
                done();
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_1600
         * @tc.number ActsAccountAuthToken_1600
         * @tc.desc   ActsAccountAuthToken_1600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.info("====>ActsAccountAuthToken_1600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>setAuthToken ActsAccountAuthToken_1600 start====");
            try{
                await appAccountManager.setAuthToken("account_promise_accountNotExit","authType","account_promise_accountNotExit_token");
            }
            catch(err){
                console.info("====>setAuthToken ActsAccountAuthToken_1600 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                console.info("====>ActsAccountAuthToken_1600 end====");
                done();
            }
        });



        /**
         * @tc.name   ActsAccountAuthToken_1700
         * @tc.number ActsAccountAuthToken_1700
         * @tc.desc   ActsAccountAuthToken_1700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            console.info("====>ActsAccountAuthToken_1700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.deleteAuthToken("account_callback_accountNotExit",OWNERSELF,"authType","account_callback_accountNotExit_token", (err)=>{
                console.info("====>deleteAuthToken ActsAccountAuthToken_1700 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                console.info("====>ActsAccountAuthToken_1700 end====");
                done();
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_1800
         * @tc.number ActsAccountAuthToken_1800
         * @tc.desc   ActsAccountAuthToken_1800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            console.info("====>ActsAccountAuthToken_1800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>deleteAuthToken ActsAccountAuthToken_1800 start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_accountNotExit",OWNERSELF,"authType","account_promise_accountNotExit_token");
            }
            catch(err){
                console.info("====>deleteAuthToken ActsAccountAuthToken_1800 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                console.info("====>ActsAccountAuthToken_1800 end====");
                done();
            }
        });



        /**
         * @tc.name   ActsAccountAuthToken_1900
         * @tc.number ActsAccountAuthToken_1900
         * @tc.desc   ActsAccountAuthToken_1900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            console.info("====>ActsAccountAuthToken_1900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_repeatDelete", (err)=>{
                console.info("====>createAccount ActsAccountAuthToken_1900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.deleteAuthToken("account_callback_repeatDelete",OWNERSELF,"aythType","promise_repeatDelete_token",(err)=>{
                    console.info("====>deleteAuthToken  ActsAccountAuthToken_1900 err:" + JSON.stringify(err));
                    appAccountManager.getAuthToken("account_callback_repeatDelete",OWNERSELF,"authType", (err, data)=>{
                        console.info("====>getAuthToken ActsAccountAuthToken_1900 err:" + JSON.stringify(err));
                        console.info("====>getAuthToken ActsAccountAuthToken_1900 data:" + data);
                        expect(err.code).assertEqual(12300107);
                        expect(data).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_repeatDelete", (err)=>{
                            console.info("====>removeAccount ActsAccountAuthToken_1900 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_1900 end====");
                            done();
                        });
                    });
                });
            });
        });


        /**
         * @tc.name   ActsAccountAuthToken_2000
         * @tc.number ActsAccountAuthToken_2000
         * @tc.desc   ActsAccountAuthToken_2000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            console.info("====>ActsAccountAuthToken_2000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_2000 createAccount start====");
            await appAccountManager.createAccount("account_promise_noExitToken");
            console.info("====>deleteAuthToken ActsAccountAuthToken_2000 start====");
            await appAccountManager.deleteAuthToken("account_promise_noExitToken",OWNERSELF,"aythType","test_token").catch((err)=>{
            console.info("====>deleteAuthToken ActsAccountAuthToken_2000 err:" + JSON.stringify(err));
            });
            console.info("====>getAuthToken ActsAccountAuthToken_2000 start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_noExitToken",OWNERSELF,"authType");
            }
            catch(err){
                console.info("====>getAuthToken ActsAccountAuthToken_2000 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300107);
                console.info("====>ActsAccountAuthToken_2000 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_noExitToken");
                console.info("====>ActsAccountAuthToken_2000 end====");
                done();
            }
        });


        /**
         * @tc.name   ActsAccountAuthToken_2100
         * @tc.number ActsAccountAuthToken_2100
         * @tc.desc   ActsAccountAuthToken_2100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            console.info("====>ActsAccountAuthToken_2100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_repeatDelete", (err)=>{
            console.info("====>createAccount ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_repeatDelete","authType","",(err)=>{
                    console.info("====>getAuthToken ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_repeatDelete",OWNERSELF,"aythType","promise_repeatDelete_token",(err)=>{
                        console.info("====>deleteAuthToken first ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
                        appAccountManager.getAuthToken("account_callback_repeatDelete",OWNERSELF,"authType", (err, data)=>{
                            console.info("====>getAuthToken first ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
                            console.info("====>getAuthToken first ActsAccountAuthToken_2100 data:" + data);
                            expect(err.code).assertEqual(12300107);
                            expect(data).assertEqual(null);
                            appAccountManager.deleteAuthToken("account_callback_repeatDelete",OWNERSELF,"aythType","promise_repeatDelete_token",(err)=>{
                                console.info("====>deleteAuthToken second ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
                                appAccountManager.getAuthToken("account_callback_repeatDelete",OWNERSELF,"authType", (err, data)=>{
                                    console.info("====>getAuthToken second ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
                                    console.info("====>getAuthToken second ActsAccountAuthToken_2100 data:" + data);
                                    expect(err.code).assertEqual(12300107);
                                    expect(data).assertEqual(null);
                                    appAccountManager.removeAccount("account_callback_repeatDelete", (err)=>{
                                        console.info("====>removeAccount ActsAccountAuthToken_2100 err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        console.info("====>ActsAccountAuthToken_2100 end====");
                                        done();
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });



        /**
         * @tc.name   ActsAccountAuthToken_2200
         * @tc.number ActsAccountAuthToken_2200
         * @tc.desc   ActsAccountAuthToken_2200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            console.info("====>ActsAccountAuthToken_2200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_2200 createAccount start====");
            await appAccountManager.createAccount("account_promise_repeatDelete");
            console.info("====>setAuthToken ActsAccountAuthToken_2200 start====");
            await appAccountManager.setAuthToken("account_promise_repeatDelete","aythType","promise_repeatDelete_token");
            console.info("====>deleteAuthToken first ActsAccountAuthToken_2200 start====");
            await appAccountManager.deleteAuthToken("account_promise_repeatDelete",OWNERSELF,"aythType","promise_repeatDelete_token");            
            try{
                console.info("====>deleteAuthToken second ActsAccountAuthToken_2200 start====");
                await appAccountManager.deleteAuthToken("account_promise_repeatDelete",OWNERSELF,"aythType","promise_repeatDelete_token");
            }catch(err){
                console.info("====>deleteAuthToken second ActsAccountAuthToken_2200 err:" + JSON.stringify(err));
                expect(err.code == ERR_JS_AUTH_TYPE_NOT_FOUND).assertEqual(true);
            }  
            try{
                console.info("====>getAuthToken ActsAccountAuthToken_2200 start====");
                var data = await appAccountManager.getAuthToken("account_promise_repeatDelete",OWNERSELF,"authType");
                done();
            }
            catch(err){
                console.info("====>getAuthToken ActsAccountAuthToken_2200 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300107);
                console.info("====>ActsAccountAuthToken_2200 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_repeatDelete");
                console.info("====>ActsAccountAuthToken_2200 end====");
                done();
            }
        });


        /**
         * @tc.name   ActsAccountAuthToken_2300
         * @tc.number ActsAccountAuthToken_2300
         * @tc.desc   ActsAccountAuthToken_2300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            console.info("====>ActsAccountAuthToken_2300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_setEmptyToken", (err)=>{
            console.info("====>createAccount ActsAccountAuthToken_2300 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_setEmptyToken","authType","",(err)=>{
                    console.info("====>getAuthToken ActsAccountAuthToken_2300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_setEmptyToken",OWNERSELF,"authType", (err, data)=>{
                        console.info("====>getAuthToken ActsAccountAuthToken_2300 err:" + JSON.stringify(err));
                        console.info("====>getAuthToken ActsAccountAuthToken_2300 data:" + data);
                        expect(err.code).assertEqual(12300107);
                        expect(data).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_setEmptyToken", (err)=>{
                            console.info("====>removeAccount ActsAccountAuthToken_2300 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_2300 end====");
                            done();
                        });
                    });
                });
            });
        });


        /**
         * @tc.name   ActsAccountAuthToken_2400
         * @tc.number ActsAccountAuthToken_2400
         * @tc.desc   ActsAccountAuthToken_2400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            console.info("====>ActsAccountAuthToken_2400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_2400 createAccount start====");
            await appAccountManager.createAccount("account_promise_setEmptyToken");
            console.info("====>setAuthToken ActsAccountAuthToken_2400 start====");
            await appAccountManager.setAuthToken("account_promise_setEmptyToken","aythType","");
            console.info("====>getAuthToken ActsAccountAuthToken_2400 start====");
            try{
                await appAccountManager.getAuthToken("account_promise_setEmptyToken","authType",limitToken);
            }
            catch(err){
                console.info("====>getAuthToken ActsAccountAuthToken_2400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_2400 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_setEmptyToken");
                console.info("====>ActsAccountAuthToken_2400 end====");
                done();
            }
        });



        /**
         * @tc.name   ActsAccountAuthToken_2500
         * @tc.number ActsAccountAuthToken_2500
         * @tc.desc   ActsAccountAuthToken_2500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            console.info("====>ActsAccountAuthToken_2500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_spaceToken", (err)=>{
            console.info("====>createAccount ActsAccountAuthToken_2500 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_spaceToken","authType"," ",(err)=>{
                    console.info("====>getAuthToken ActsAccountAuthToken_2500 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_spaceToken",OWNERSELF,"authType", (err, data)=>{
                        console.info("====>getAuthToken ActsAccountAuthToken_2500 err:" + JSON.stringify(err));
                        console.info("====>getAuthToken ActsAccountAuthToken_2500 data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual(" ");
                        appAccountManager.removeAccount("account_callback_spaceToken", (err)=>{
                            console.info("====>removeAccount ActsAccountAuthToken_2500 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_2500 end====");
                            done();
                        });
                    });
                });
            });
        });


        /**
         * @tc.name   ActsAccountAuthToken_2600
         * @tc.number ActsAccountAuthToken_2600
         * @tc.desc   ActsAccountAuthToken_2600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            console.info("====>ActsAccountAuthToken_2600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_2600 createAccount start====");
            await appAccountManager.createAccount("account_promise_spaceToken");
            console.info("====>setAuthToken ActsAccountAuthToken_2600 start====");
            await appAccountManager.setAuthToken("account_promise_spaceToken","aythType"," ");
            console.info("====>getAuthToken ActsAccountAuthToken_2600 start====");
            var data = await appAccountManager.getAuthToken("account_promise_spaceToken",OWNERSELF,"aythType");
            expect(data).assertEqual(" ");
            console.info("====>ActsAccountAuthToken_2600 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_spaceToken");
            console.info("====>ActsAccountAuthToken_2600 end====");
            done();
        });



        /**
         * @tc.name   ActsAccountAuthToken_2700
         * @tc.number ActsAccountAuthToken_2700
         * @tc.desc   ActsAccountAuthToken_2700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            var limitToken = '';
                for (let i = 0; i < TOKENLENGTHLIMIT + 1; i++) {
                    limitToken += 't';
                }
            console.info("====>ActsAccountAuthToken_2700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_exceed_limitToken", (err)=>{
            console.info("====>createAccount ActsAccountAuthToken_2700 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_exceed_limitToken","authType",limitToken,(err)=>{
                    console.info("====>getAuthToken ActsAccountAuthToken_2700 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(12300002);
                    appAccountManager.removeAccount("account_callback_exceed_limitToken", (err)=>{
                        console.info("====>removeAccount ActsAccountAuthToken_2700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_2700 end====");
                        done();
                    });
                });
            });
        });


        /**
         * @tc.name   ActsAccountAuthToken_2800
         * @tc.number ActsAccountAuthToken_2800
         * @tc.desc   ActsAccountAuthToken_2800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function(done) {
            var limitToken = '';
                for (let i = 0; i < TOKENLENGTHLIMIT + 1; i++) {
                    limitToken += 't';
                }
            console.info("====>ActsAccountAuthToken_2800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_2800 createAccount start====");
            await appAccountManager.createAccount("account_promise_exceed_limitToken");
            console.info("====>setAuthToken ActsAccountAuthToken_2800 start====");
            try{
                await appAccountManager.setAuthToken("account_promise_exceed_limitToken","authType",limitToken);
            }
            catch(err){
                console.info("====>setAuthToken ActsAccountAuthToken_2800 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                console.info("====>ActsAccountAuthToken_2800 removeAccount start====");
                appAccountManager.removeAccount("account_promise_exceed_limitToken");
                console.info("====>ActsAccountAuthToken_2800 end====");
                done();
            }
        });


        /**
         * @tc.name   ActsAccountAuthToken_2900
         * @tc.number ActsAccountAuthToken_2900
         * @tc.desc   ActsAccountAuthToken_2900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function(done) {
            var limitToken = '';
                for (let i = 0; i < TOKENLENGTHLIMIT; i++) {
                    limitToken += 't';
                }
            console.info("====>ActsAccountAuthToken_2900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_limitToken", (err)=>{
            console.info("====>createAccount ActsAccountAuthToken_2900 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_limitToken","authType",limitToken,(err)=>{
                    console.info("====>getAuthToken ActsAccountAuthToken_2900 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_limitToken",OWNERSELF,"authType", (err, data)=>{
                        console.info("====>getAuthToken ActsAccountAuthToken_2900 err:" + JSON.stringify(err));
                        console.info("====>getAuthToken ActsAccountAuthToken_2900 data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual(limitToken);
                        appAccountManager.removeAccount("account_callback_limitToken", (err)=>{
                            console.info("====>removeAccount ActsAccountAuthToken_2900 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_2900 end====");
                            done();
                        });
                    });
                });
            });
        });


        /**
         * @tc.name   ActsAccountAuthToken_3000
         * @tc.number ActsAccountAuthToken_3000
         * @tc.desc   ActsAccountAuthToken_3000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            var limitToken = '';
                for (let i = 0; i < TOKENLENGTHLIMIT; i++) {
                    limitToken += 't';
                }
            console.info("====>ActsAccountAuthToken_3000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_3000 createAccount start====");
            await appAccountManager.createAccount("account_promise_limitToken");
            console.info("====>setAuthToken ActsAccountAuthToken_3000 start====");
            await appAccountManager.setAuthToken("account_promise_limitToken","authType",limitToken);
            console.info("====>getAuthToken ActsAccountAuthToken_3000 start====");
            var data = await appAccountManager.getAuthToken("account_promise_limitToken",OWNERSELF,"authType");
            expect(data).assertEqual(limitToken);
            console.info("====>ActsAccountAuthToken_3000 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_limitToken");
            console.info("====>ActsAccountAuthToken_3000 end====");
            done();
        });


        /**
         * @tc.name   ActsAccountAuthToken_3100
         * @tc.number ActsAccountAuthToken_3100
         * @tc.desc   ActsAccountAuthToken_3100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            var limitAuthType = '';
                for (let i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
                    limitAuthType += 't';
                }
            console.info("====>ActsAccountAuthToken_3100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_limitAuthType", (err)=>{
            console.info("====>createAccount ActsAccountAuthToken_3100 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_limitAuthType",limitAuthType,"account_callback_limitAuthType_token",(err, data)=>{
                    console.info("====>getAuthToken ActsAccountAuthToken_3100 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(12300002);
                    appAccountManager.removeAccount("account_callback_limitAuthType", (err)=>{
                        console.info("====>removeAccount ActsAccountAuthToken_3100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_3100 end====");
                        done();
                    });
                });
            });
        });


        /**
         * @tc.name   ActsAccountAuthToken_3200
         * @tc.number ActsAccountAuthToken_3200
         * @tc.desc   ActsAccountAuthToken_3200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            var limitAuthType = '';
                for (let i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
                    limitAuthType += 't';
                }
            console.info("====>ActsAccountAuthToken_3400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_3400 createAccount start====");
            await appAccountManager.createAccount("account_promise_exceed_limitAuthType");
            console.info("====>setAuthToken ActsAccountAuthToken_3400 start====");
            try{
                await appAccountManager.setAuthToken("account_promise_exceed_limitAuthType",limitAuthType,"account_promise_limitAuthType_token");
            }
            catch(err){
                console.info("====>setAuthToken ActsAccountAuthToken_3400 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                console.info("====>ActsAccountAuthToken_3400 removeAccount start====");
                appAccountManager.removeAccount("account_promise_exceed_limitAuthType");
                console.info("====>ActsAccountAuthToken_3400 end====");
                done();
            }
        });



        /**
         * @tc.name   ActsAccountAuthToken_3300
         * @tc.number ActsAccountAuthToken_3300
         * @tc.desc   ActsAccountAuthToken_3300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function(done) {
            var limitAuthType = '';
                for (let i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
                    limitAuthType += 't';
                }
            console.info("====>ActsAccountAuthToken_3300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_callback_limitAuthType", (err)=>{
            console.info("====>createAccount ActsAccountAuthToken_3300 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.getAuthToken("account_callback_limitAuthType","com.example.actsaccounttest",limitAuthType, (err, data)=>{
                    console.info("====>getAuthToken ActsAccountAuthToken_3300 err:" + JSON.stringify(err));
                    console.info("====>getAuthToken ActsAccountAuthToken_3300 data:" + data);
                    expect(err.code).assertEqual(12300002);
                    appAccountManager.removeAccount("account_callback_limitAuthType", (err)=>{
                        console.info("====>removeAccount ActsAccountAuthToken_3300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_3300 end====");
                        done();
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountAuthToken_3400
         * @tc.number ActsAccountAuthToken_3400
         * @tc.desc   ActsAccountAuthToken_3400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function(done) {
            var limitAuthType = '';
                for (let i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
                    limitAuthType += 't';
                }
            console.info("====>ActsAccountAuthToken_3400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_3400 createAccount start====");
            await appAccountManager.createAccount("account_promise_limitAuthType");
            console.info("====>getAuthToken ActsAccountAuthToken_3400 start====");
            try{
                await appAccountManager.getAuthToken("account_promise_limitAuthType",OWNERSELF,limitAuthType);
            }
            catch(err){
                console.info("====>getAuthToken ActsAccountAuthToken_3400 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                console.info("====>ActsAccountAuthToken_3400 removeAccount start====");
                appAccountManager.removeAccount("account_promise_limitAuthType");
                console.info("====>ActsAccountAuthToken_3400 end====");
                done();
            }
        });



        /**
         * @tc.name   ActsAccountAuthToken_3500
         * @tc.number ActsAccountAuthToken_2700
         * @tc.desc   设置一个authType长度刚好为限制长度的token  查询
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function(done) {
            console.info("====>ActsAccountAuthToken_3500 start====");
            var limitAuthType = '';
            for (let i = 0; i < AUTHTYPELENGTHLIMIT; i++) {
                limitAuthType += 't';
            }
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_3500 create finish====");
            appAccountManager.createAccount("account_callback_limitAuthType", (err)=>{
                console.info("====>add account ActsAccountAuthToken_3500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_limitAuthType",limitAuthType,"account_callback_limitAuthType_token", (err)=>{
                    console.info("====>setAuthToken ActsAccountAuthToken_3500 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_limitAuthType","com.example.actsaccountoperatetest",limitAuthType, (err, data)=>{
                        console.info("====>getAuthToken ActsAccountAuthToken_3500 err:" + JSON.stringify(err));
                        console.info("====>getAuthToken ActsAccountAuthToken_3500 data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("account_callback_limitAuthType_token");
                        appAccountManager.removeAccount("account_callback_limitAuthType", (err)=>{
                            console.info("====>delete Account ActsAccountAuthToken_3500 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_3500 end====");
                            done();
                        });
                    });
                });
            });
        });
        
        
        //测试 删除一个账号名为空的token callback方式
        /**
         * @tc.name   ActsAccountAuthToken_4100
         * @tc.number ActsAccountAuthToken_4100
         * @tc.desc   ActsAccountAuthToken_4100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.info("====>ActsAccountAuthToken_4100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_4100 create finish====");
            appAccountManager.deleteAuthToken(" ","com.example.actsaccounttest","authType","account_notExist_token", (err)=>{
                console.info("====>clearauthToken ActsAccountAuthToken_4100 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_4100 end====");
                done();
            });
        });
        
        //测试 删除一个账号名为空的token promise方式
        /**
         * @tc.name   ActsAccountAuthToken_4200
         * @tc.number ActsAccountAuthToken_4200
         * @tc.desc   ActsAccountAuthToken_4200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.info("====>ActsAccountAuthToken_4200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_4200 create finish====");
            console.info("====>clearauthToken ActsAccountAuthToken_4200 start====");
            try{
                await appAccountManager.deleteAuthToken("","com.example.actsaccounttest","authType","account_notExist_token");
            }
            catch(err){
                console.info("====>deleteAuthToken ActsAccountAuthToken_4200 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_4200 end====");
                done();
            }
        });
        
        /**
         * @tc.name   ActsAccountAuthToken_4300
         * @tc.number ActsAccountAuthToken_3100
         * @tc.desc   The clear token parameter name is a space string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.info("====>ActsAccountAuthToken_4300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_4300 create finish====");
            appAccountManager.deleteAuthToken(" ","com.example.actsaccounttest","authType","account_notExist_token", (err)=>{
                console.info("====>clearauthToken ActsAccountAuthToken_4300 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_4300 end====");
                done();
            });
        });
        
        /**
         * @tc.name   ActsAccountAuthToken_4400
         * @tc.number ActsAccountAuthToken_3200
         * @tc.desc   The clear token parameter name is a space string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.info("====>ActsAccountAuthToken_4400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_4400 create finish====");
            console.info("====>clearauthToken ActsAccountAuthToken_4400 start====");
            try{
                await appAccountManager.deleteAuthToken(" ","com.example.actsaccounttest","authType","account_notExist_token");
            }
            catch(err){
                console.info("====>deleteAuthToken ActsAccountAuthToken_4400 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_4400 end====");
                done();
            }
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_4500
         * @tc.number ActsAccountAuthToken_3300
         * @tc.desc   Clear the token parameter name exceeds the length limit of 1024 characters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.info("====>ActsAccountAuthToken_4500 start====");
            let nameLimit = '';
            for (let i = 0; i < LENGTHLIMIT + 1; i++) {
                nameLimit += 't';
            }
            let appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_4500 create finish====");
            appAccountManager.deleteAuthToken(nameLimit,"com.example.actsaccounttest","authType","account_notExist_token", (err)=>{
                console.info("====>clearauthToken ActsAccountAuthToken_4500 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                console.info("====>ActsAccountAuthToken_4500 end====");
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_4600
         * @tc.number ActsAccountAuthToken_3400
         * @tc.desc   Clear the token parameter name exceeds the length limit of 1024 characters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountAuthToken_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
            console.info("====>ActsAccountAuthToken_4600 start====");
            var nameLimit = '';
            for (let i = 0; i < LENGTHLIMIT + 1; i++) {
                nameLimit += 't';
            }
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_4600 create finish====");
            console.info("====>deleteAuthToken ActsAccountAuthToken_4600 start====");
            try{
                await appAccountManager.deleteAuthToken(nameLimit,"com.example.actsaccounttest","authType","account_notExist_token");
            }
            catch(err){
                console.info("====>deleteAuthToken ActsAccountAuthToken_4600 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_4600 end====");
                done();
            }
        });
    
        //查询无效包名owner（为其他字符串时）账号的token callback方式
        /**
         * @tc.name   ActsAccountAuthToken_4700
         * @tc.number ActsAccountAuthToken_4700
         * @tc.desc   ActsAccountAuthToken_4700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done) {
            console.info("====>ActsAccountAuthToken_4700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_4700 create finish====");
            appAccountManager.createAccount("account_callback_invalid_owner", (err)=>{
                console.info("====>add account ActsAccountAuthToken_4700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAuthToken("account_callback_invalid_owner","invalid_owner","authType", (err, data)=>{
                    console.info("====>getAuthToken ActsAccountAuthToken_4700 err:" + JSON.stringify(err));
                    console.info("====>getAuthToken ActsAccountAuthToken_4700 data:" + data);
                    expect(err.code!=0).assertEqual(true);
                    expect(data).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_invalid_owner", (err)=>{
                        console.info("====>delete account ActsAccountAuthToken_4700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_4700 end====");
                        done();
                    });
                });
            });
        });


        /**
         * @tc.name   ActsAccountAuthToken_3600
         * @tc.number ActsAccountAuthToken_3600
         * @tc.desc   ActsAccountAuthToken_3600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsAccountAuthToken_3600 start====");
            var limitAuthType = '';
            for (var i = 0; i < AUTHTYPELENGTHLIMIT; i++) {
                limitAuthType += 't';
            }
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_3600 createAccount start====");
            await appAccountManager.createAccount("account_promise_limitAuthType");
            console.info("====>ActsAccountAuthToken_3600 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_limitAuthType",limitAuthType,"account_promise_limitAuthType_token");
            console.info("====>ActsAccountAuthToken_3600 getAuthToken start====");
            var data = await appAccountManager.getAuthToken("account_promise_limitAuthType",OWNERSELF,limitAuthType);
            expect(data).assertEqual("account_promise_limitAuthType_token");
            console.info("====>ActsAccountAuthToken_3600 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_limitAuthType");
            console.info("====>ActsAccountAuthToken_3600 end====");
            done();
        });
    
        
        /**
         * @tc.name   ActsAccountAuthToken_3700
         * @tc.number ActsAccountAuthToken_3700
         * @tc.desc   ActsAccountAuthToken_3700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_3700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_3700 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_empty",(err)=>{
                console.info("====>ActsAccountAuthToken_3700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_empty","","account_callback_authType_empty_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_3700 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_authType_empty",OWNERSELF,"",(err,data)=>{
                        console.info("====>ActsAccountAuthToken_3700 getAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_3700 getAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("account_callback_authType_empty_token");
                        appAccountManager.removeAccount("account_callback_authType_empty",(err)=>{
                            console.info("====>ActsAccountAuthToken_3700 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_3700 end====");
                            done();
                        });
                    });
                });
            });
        });
        
        /**
         * @tc.name   ActsAccountAuthToken_3800
         * @tc.number ActsAccountAuthToken_3800
         * @tc.desc   ActsAccountAuthToken_3800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_3800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_3800 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_empty");
            console.info("====>ActsAccountAuthToken_3800 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_authType_empty","","account_promise_authType_empty_token");
            console.info("====>ActsAccountAuthToken_3800 getAuthToken start====");
            var data = await appAccountManager.getAuthToken("account_promise_authType_empty",OWNERSELF,"");
            expect(data).assertEqual("account_promise_authType_empty_token");
            console.info("====>ActsAccountAuthToken_3800 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_authType_empty");
            console.info("====>ActsAccountAuthToken_3800 end====");
            done();
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_3900
         * @tc.number ActsAccountAuthToken_3900
         * @tc.desc   ActsAccountAuthToken_3900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_3900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_3900 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_space",(err)=>{
                console.info("====>ActsAccountAuthToken_3900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_space"," ","account_callback_authType_space_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_3900 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_authType_space",OWNERSELF," ",(err,data)=>{
                        console.info("====>ActsAccountAuthToken_3900 getAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_3900 getAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("account_callback_authType_space_token");
                        appAccountManager.removeAccount("account_callback_authType_space",(err)=>{
                            console.info("====>ActsAccountAuthToken_3900 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_3900 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_4000
         * @tc.number ActsAccountAuthToken_4000
         * @tc.desc   ActsAccountAuthToken_4000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_4000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_4000 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_space");
            console.info("====>ActsAccountAuthToken_4000 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_authType_space"," ","account_promise_authType_space_token");
            console.info("====>ActsAccountAuthToken_4000 getAuthToken start====");
            var data = await appAccountManager.getAuthToken("account_promise_authType_space",OWNERSELF," ");
            expect(data).assertEqual("account_promise_authType_space_token");
            console.info("====>ActsAccountAuthToken_4000 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_authType_space");
            console.info("====>ActsAccountAuthToken_4000 end====");
            done();
        });
    
    
        /**
         * @tc.name   ActsAccountAuthToken_4800
         * @tc.number ActsAccountAuthToken_4800
         * @tc.desc   ActsAccountAuthToken_4800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_4800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_4800 createAccount start====");
            await appAccountManager.createAccount("account_promise_invalid_owner");
            console.info("====>ActsAccountAuthToken_4800 getAuthToken start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_invalid_owner","invalid_owner","authType");
            }
            catch(err){
                console.info("====>ActsAccountAuthToken_4800 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_4800 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_invalid_owner");
                console.info("====>ActsAccountAuthToken_4800 end====");
                done();
            }
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_4900
         * @tc.number ActsAccountAuthToken_4900
         * @tc.desc   ActsAccountAuthToken_4900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_4900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_4900 createAccount start====");
            appAccountManager.createAccount("account_callback_owner_empty",(err)=>{
                console.info("====>ActsAccountAuthToken_4900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAuthToken("account_callback_owner_empty","","authType",(err,data)=>{
                    console.info("====>ActsAccountAuthToken_4900 getAuthToken err:" + JSON.stringify(err));
                    console.info("====>ActsAccountAuthToken_4900 getAuthToken data:" + data);
                    expect(err.code!=0).assertEqual(true);
                    expect(data).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_owner_empty",(err)=>{
                        console.info("====>ActsAccountAuthToken_4900 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_4900 end====");
                        done();
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_5000
         * @tc.number ActsAccountAuthToken_5000
         * @tc.desc   ActsAccountAuthToken_5000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_5000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_5000 createAccount start====");
            await appAccountManager.createAccount("account_promise_owner_empty");
            console.info("====>ActsAccountAuthToken_5000 getAuthToken start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_owner_empty","","authType");
            }
            catch(err){
                console.info("====>ActsAccountAuthToken_5000 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_5000 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_owner_empty");
                console.info("====>ActsAccountAuthToken_5000 end====");
                done();
            }
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_5100
         * @tc.number ActsAccountAuthToken_5100
         * @tc.desc   ActsAccountAuthToken_5100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_5100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_5100 createAccount start====");
            appAccountManager.createAccount("account_callback_owner_space",(err)=>{
                console.info("====>ActsAccountAuthToken_5100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAuthToken("account_callback_owner_space"," ","authType",(err,data)=>{
                    console.info("====>ActsAccountAuthToken_5100 getAuthToken err:" + JSON.stringify(err));
                    console.info("====>ActsAccountAuthToken_5100 getAuthToken data:" + data);
                    expect(err.code!=0).assertEqual(true);
                    expect(data).assertEqual(null);
                    appAccountManager.removeAccount("account_callback_owner_space",(err)=>{
                        console.info("====>ActsAccountAuthToken_5100 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_5100 end====");
                        done();
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_5200
         * @tc.number ActsAccountAuthToken_5200
         * @tc.desc   ActsAccountAuthToken_5200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_5200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_5200 createAccount start====");
            await appAccountManager.createAccount("account_callback_owner_space");
            console.info("====>ActsAccountAuthToken_5200 getAuthToken start====");
            try{
                var data = await appAccountManager.getAuthToken("account_callback_owner_space"," ","authType");
            }
            catch(err){
                console.info("====>ActsAccountAuthToken_5200 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_5200 removeAccount start====");
                await appAccountManager.removeAccount("account_callback_owner_space");
                console.info("====>ActsAccountAuthToken_5200 end====");
                done();
            }
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_5300
         * @tc.number ActsAccountAuthToken_5300
         * @tc.desc   ActsAccountAuthToken_5300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_5300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_5300 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_invalid",(err)=>{
                console.info("====>ActsAccountAuthToken_5300 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_invalid","authType","account_callback_authType_invalid_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_5300 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_authType_invalid",OWNERSELF,"invalid_authType",(err,data)=>{
                        console.info("====>ActsAccountAuthToken_5300 getAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_5300 getAuthToken data:" + data);
                        expect(err.code!=0).assertEqual(true);
                        expect(data).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_authType_invalid",(err)=>{
                            console.info("====>ActsAccountAuthToken_5300 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_5300 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_5400
         * @tc.number ActsAccountAuthToken_5400
         * @tc.desc   ActsAccountAuthToken_5400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_5400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_5400 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_invalid");
            console.info("====>ActsAccountAuthToken_5400 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_authType_invalid","authType","account_promise_authType_invalid_token");
            console.info("====>ActsAccountAuthToken_5400 getAuthToken start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_authType_invalid",OWNERSELF,"invalid_authType");
            }
            catch(err){
                console.info("====>ActsAccountAuthToken_5400 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_5400 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_authType_invalid");
                console.info("====>ActsAccountAuthToken_5400 end====");
                done();
            }
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_5500
         * @tc.number ActsAccountAuthToken_5500
         * @tc.desc   ActsAccountAuthToken_5500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_5500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_5500 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_empty",(err)=>{
                console.info("====>ActsAccountAuthToken_5500 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_empty","authType","account_callback_authType_empty_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_5500 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_authType_empty",OWNERSELF,"",(err,data)=>{
                        console.info("====>ActsAccountAuthToken_5500 getAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_5500 getAuthToken data:" + data);
                        expect(err.code!=0).assertEqual(true);
                        expect(data).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_authType_empty",(err)=>{
                            console.info("====>ActsAccountAuthToken_5500 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_5500 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_5600
         * @tc.number ActsAccountAuthToken_5600
         * @tc.desc   ActsAccountAuthToken_5600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_5600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_5600 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_empty");
            console.info("====>ActsAccountAuthToken_5600 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_authType_empty","authType","account_promise_authType_empty_token");
            console.info("====>ActsAccountAuthToken_5600 getAuthToken start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_authType_empty",OWNERSELF,"");
            }
            catch(err){
                console.info("====>ActsAccountAuthToken_5600 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_5600 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_authType_empty");
                console.info("====>ActsAccountAuthToken_5600 end====");
                done();
            }
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_5700
         * @tc.number ActsAccountAuthToken_5700
         * @tc.desc   ActsAccountAuthToken_5700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_5700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_5700 createAccount start====");
            appAccountManager.createAccount("account_callback_authType_space",(err)=>{
                console.info("====>ActsAccountAuthToken_5700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_authType_space","authType","account_callback_authType_space_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_5700 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_callback_authType_space",OWNERSELF," ",(err,data)=>{
                        console.info("====>ActsAccountAuthToken_5700 getAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_5700 getAuthToken data:" + data);
                        expect(err.code!=0).assertEqual(true);
                        expect(data).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_authType_space",(err)=>{
                            console.info("====>ActsAccountAuthToken_5700 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_5700 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_5800
         * @tc.number ActsAccountAuthToken_5800
         * @tc.desc   ActsAccountAuthToken_5800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_5800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_5800 createAccount start====");
            await appAccountManager.createAccount("account_promise_authType_space");
            console.info("====>ActsAccountAuthToken_5800 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_authType_space","authType","account_promise_authType_space_token");
            console.info("====>ActsAccountAuthToken_5800 getAuthToken start====");
            try{
                var data = await appAccountManager.getAuthToken("account_promise_authType_space",OWNERSELF," ");
            }
            catch(err){
                console.info("====>ActsAccountAuthToken_5800 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_5800 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_authType_space");
                console.info("====>ActsAccountAuthToken_5800 end====");
                done();
            }
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_5900
         * @tc.number ActsAccountAuthToken_5900
         * @tc.desc   ActsAccountAuthToken_5900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_5900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_5900 createAccount start====");
            appAccountManager.createAccount("account_callback_owner_invalid",(err)=>{
                console.info("====>ActsAccountAuthToken_5900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_owner_invalid","authType","account_callback_owner_invalid_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_5900 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_owner_invalid","invalid_owner","authType","account_callback_owner_invalid_token",(err)=>{
                        console.info("====>ActsAccountAuthToken_5900 getAuthToken err:" + JSON.stringify(err));
                        expect(err.code!=0).assertEqual(true);
                        appAccountManager.removeAccount("account_callback_owner_invalid",(err)=>{
                            console.info("====>ActsAccountAuthToken_5900 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_5900 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_6000
         * @tc.number ActsAccountAuthToken_6000
         * @tc.desc   ActsAccountAuthToken_6000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_6000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_6000 createAccount start====");
            await appAccountManager.createAccount("account_promise_owner_invalid");
            console.info("====>ActsAccountAuthToken_6000 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_owner_invalid","authType","account_promise_owner_invalid_token");
            console.info("====>ActsAccountAuthToken_6000 getAuthToken start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_owner_invalid","invalid_owner","authType","account_promise_owner_invalid_token");
            }
            catch(err){
                console.info("====>ActsAccountAuthToken_6000 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_6000 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_owner_invalid");
                console.info("====>ActsAccountAuthToken_6000 end====");
                done();
            }
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_6100
         * @tc.number ActsAccountAuthToken_6100
         * @tc.desc   ActsAccountAuthToken_6100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_6100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_6100 createAccount start====");
            appAccountManager.createAccount("account_callback_owner_empty",(err)=>{
                console.info("====>ActsAccountAuthToken_6100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_owner_empty","authType","account_callback_owner_empty_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_6100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_owner_empty","","authType","account_callback_owner_empty_token",(err)=>{
                        console.info("====>ActsAccountAuthToken_6100 getAuthToken err:" + JSON.stringify(err));
                        expect(err.code!=0).assertEqual(true);
                        appAccountManager.removeAccount("account_callback_owner_empty",(err)=>{
                            console.info("====>ActsAccountAuthToken_6100 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_6100 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_6200
         * @tc.number ActsAccountAuthToken_6200
         * @tc.desc   ActsAccountAuthToken_6200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_6200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_6200 createAccount start====");
            await appAccountManager.createAccount("account_promise_owner_empty");
            console.info("====>ActsAccountAuthToken_6200 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_owner_empty","authType","account_promise_owner_empty_token");
            console.info("====>ActsAccountAuthToken_6200 getAuthToken start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_owner_empty","","authType","account_promise_owner_empty_token");
            }
            catch(err){
                console.info("====>ActsAccountAuthToken_6200 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_6200 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_owner_empty");
                console.info("====>ActsAccountAuthToken_6200 end====");
                done();
            }
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_6300
         * @tc.number ActsAccountAuthToken_6300
         * @tc.desc   ActsAccountAuthToken_6300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_6300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_6300 createAccount start====");
            appAccountManager.createAccount("account_callback_owner_space",(err)=>{
                console.info("====>ActsAccountAuthToken_6300 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_owner_space","authType","account_callback_owner_space_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_6300 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_owner_space"," ","authType","account_callback_owner_space_token",(err)=>{
                        console.info("====>ActsAccountAuthToken_6300 getAuthToken err:" + JSON.stringify(err));
                        expect(err.code!=0).assertEqual(true);
                        appAccountManager.removeAccount("account_callback_owner_space",(err)=>{
                            console.info("====>ActsAccountAuthToken_6300 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_6300 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_6400
         * @tc.number ActsAccountAuthToken_6400
         * @tc.desc   ActsAccountAuthToken_6400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_6400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_6400 createAccount start====");
            await appAccountManager.createAccount("account_promise_owner_space");
            console.info("====>ActsAccountAuthToken_6400 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_owner_space","authType","account_promise_owner_space_token");
            console.info("====>ActsAccountAuthToken_6400 getAuthToken start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_owner_space"," ","authType","account_promise_owner_space_token");
            }
            catch(err){
                console.info("====>ActsAccountAuthToken_6400 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_6400 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_owner_space");
                console.info("====>ActsAccountAuthToken_6400 end====");
                done();
            }
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_6500
         * @tc.number ActsAccountAuthToken_6500
         * @tc.desc   ActsAccountAuthToken_6500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            var limitToken = '';
            for(var i = 0;i < TOKENLENGTHLIMIT + 1; i++){
                limitToken += 'c';
            }
            console.info("====>ActsAccountAuthToken_6500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_6500 createAccount start====");
            appAccountManager.createAccount("account_callback_token_exceedLimit",(err)=>{
                console.info("====>ActsAccountAuthToken_6500 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.deleteAuthToken("account_callback_token_exceedLimit",OWNERSELF,"authType",limitToken,(err)=>{
                    console.info("====>ActsAccountAuthToken_6500 getAuthToken err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    appAccountManager.removeAccount("account_callback_token_exceedLimit",(err)=>{
                        console.info("====>ActsAccountAuthToken_6500 removeAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountAuthToken_6500 end====");
                        done();
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_6600
         * @tc.number ActsAccountAuthToken_6600
         * @tc.desc   ActsAccountAuthToken_6600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            var limitToken = '';
            for(var i = 0;i < TOKENLENGTHLIMIT + 1; i++){
                limitToken += 'c';
            }
            console.info("====>ActsAccountAuthToken_6600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_6600 createAccount start====");
            await appAccountManager.createAccount("account_promise_token_exceedLimit");
            console.info("====>ActsAccountAuthToken_6600 deleteAuthToken start====");
            try{
                await appAccountManager.deleteAuthToken("account_promise_token_exceedLimit",OWNERSELF,"authType",limitToken);
            }
            catch(err){
                console.info("====>ActsAccountAuthToken_6600 getAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountAuthToken_6600 removeAccount start====");
                await appAccountManager.removeAccount("account_promise_token_exceedLimit");
                console.info("====>ActsAccountAuthToken_6600 end====");
                done();
            }
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_6700
         * @tc.number ActsAccountAuthToken_6700
         * @tc.desc   ActsAccountAuthToken_6700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            var limitToken = '';
            for(var i = 0;i < TOKENLENGTHLIMIT; i++){
                limitToken += 'c';
            }
            console.info("====>ActsAccountAuthToken_6700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_6700 createAccount start====");
            appAccountManager.createAccount("account_callback_token_limit",(err)=>{
                console.info("====>ActsAccountAuthToken_6700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_token_limit","authType",limitToken,(err)=>{
                    console.info("====>ActsAccountAuthToken_6700 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_token_limit",OWNERSELF,"authType",limitToken,(err)=>{
                        console.info("====>ActsAccountAuthToken_6700 getAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.removeAccount("account_callback_token_limit",(err)=>{
                            console.info("====>ActsAccountAuthToken_6700 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_6700 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_6800
         * @tc.number ActsAccountAuthToken_6800
         * @tc.desc   ActsAccountAuthToken_6800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountAuthToken_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            var limitToken = '';
            for(var i = 0;i < TOKENLENGTHLIMIT; i++){
                limitToken += 'c';
            }
            console.info("====>ActsAccountAuthToken_6800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_6800 createAccount start====");
            await appAccountManager.createAccount("account_promise_token_limit");
            console.info("====>ActsAccountAuthToken_6800 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_token_limit","authType",limitToken);
            console.info("====>ActsAccountAuthToken_6800 deleteAuthToken start====");
            await appAccountManager.deleteAuthToken("account_promise_token_limit",OWNERSELF,"authType",limitToken);
            console.info("====>ActsAccountAuthToken_6800 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_token_limit");
            console.info("====>ActsAccountAuthToken_6800 end====");
            done();
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_6900
         * @tc.number ActsAccountAuthToken_6900
         * @tc.desc   ActsAccountAuthToken_6900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_6900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_6900 createAccount start====");
            appAccountManager.createAccount("account_callback_delete_space",(err)=>{
                console.info("====>ActsAccountAuthToken_6900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_callback_delete_space","authType","account_callback_delete_space_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_6900 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteAuthToken("account_callback_delete_space", OWNERSELF,"authType", "",(err)=>{
                        console.info("====>ActsAccountAuthToken_6900 deleteAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null)
                        appAccountManager.getAuthToken("account_callback_delete_space", OWNERSELF, "authType",(err,data)=>{
                            console.info("====>ActsAccountAuthToken_6900 getAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountAuthToken_6900 getAuthToken data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("account_callback_delete_space_token");
                            appAccountManager.removeAccount("account_callback_delete_space",(err)=>{
                                console.info("====>ActsAccountAuthToken_6900 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_6900 end====");
                                done();
                            });
                        });
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_7000
         * @tc.number ActsAccountAuthToken_7000
         * @tc.desc   ActsAccountAuthToken_7000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_7000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountAuthToken_7000 createAccount start====");
            await appAccountManager.createAccount("account_promise_delete_space");
            console.info("====>ActsAccountAuthToken_7000 setAuthToken start====");
            await appAccountManager.setAuthToken("account_promise_delete_space","authType","account_promise_delete_space_token");
            console.info("====>ActsAccountAuthToken_7000 deleteAuthToken start====");
            await appAccountManager.deleteAuthToken("account_promise_delete_space",OWNERSELF,"authType","");
            console.info("====>ActsAccountAuthToken_7000 getAuthToken start====");
            var data = await appAccountManager.getAuthToken("account_promise_delete_space",OWNERSELF,"authType");
            expect(data).assertEqual("account_promise_delete_space_token");
            console.info("====>ActsAccountAuthToken_7000 removeAccount start====");
            await appAccountManager.removeAccount("account_promise_delete_space");
            console.info("====>ActsAccountAuthToken_7000 end====");
            done();            
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_9200
         * @tc.number ActsAccountAuthToken_9200
         * @tc.desc   ActsAccountAuthToken_9200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_9200 start====");
            var appAccountManager = account.createAppAccountManager();  
            appAccountManager.getAuthCallback("test_sessionId").then(()=>{
                expect().assertFail();
                done();
            })                    
            .catch((err)=>{
                console.info("====>ActsAccountAuthToken_9200 getAuthCalback err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true)
                done();
            })
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_9300
         * @tc.number ActsAccountAuthToken_9300
         * @tc.desc   ActsAccountAuthToken_9300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_9300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.getAuthCallback("").then(()=>{
                expect().assertFail();
                done();
            })                    
            .catch((err)=>{
                console.info("====>ActsAccountAuthToken_9300 getAuthCalback err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true)
                done();
            })
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_9400
         * @tc.number ActsAccountAuthToken_9400
         * @tc.desc   ActsAccountAuthToken_9400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_9400 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.getAuthCallback(" ").then(()=>{
                expect().assertFail();
                done();
            })                    
            .catch((err)=>{
                console.info("====>ActsAccountAuthToken_9400 getAuthCalback err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true)
                done();
            })
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_9500
         * @tc.number ActsAccountAuthToken_9500
         * @tc.desc   ActsAccountAuthToken_9500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_9500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.queryAuthenticatorInfo(OWNERSELF,(err)=>{
                console.info("====>ActsAccountAuthToken_9500 queryAuthenticatorInfo err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_9600
         * @tc.number ActsAccountAuthToken_9600
         * @tc.desc   ActsAccountAuthToken_9600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_9600 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.queryAuthenticatorInfo("",(err)=>{
                console.info("====>ActsAccountAuthToken_9600 queryAuthenticatorInfo err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_9700
         * @tc.number ActsAccountAuthToken_9700
         * @tc.desc   ActsAccountAuthToken_9700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_9700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.queryAuthenticatorInfo(" ",(err)=>{
                console.info("====>ActsAccountAuthToken_9700 queryAuthenticatorInfo err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_9800
         * @tc.number ActsAccountAuthToken_9800
         * @tc.desc   ActsAccountAuthToken_9800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            var limiOwner = '';
            for(var i = 0;i < OWNERLENGTHLIMIT + 1; i++){
                limiOwner += 't';
            }
            console.info("====>ActsAccountAuthToken_9800 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.queryAuthenticatorInfo(limiOwner,(err)=>{
                console.info("====>ActsAccountAuthToken_9800 queryAuthenticatorInfo err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_9900
         * @tc.number ActsAccountAuthToken_9900
         * @tc.desc   ActsAccountAuthToken_9900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_9900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err,)=>{
                console.info("====>ActsAccountAuthToken_9900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);            
                appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","authType",valid_owner_name,true).then(()=>{
                    expect().assertFail();
                    done();
                }).catch((err)=>{
                    console.info("====>ActsAccountAuthToken_9900 setAuthTokenVisibility err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(12300107); 
                    appAccountManager.getAuthToken("account_setAuthTokenVisibility_name",OWNERSELF,"authType",(err,data)=>{
                        console.info("====>ActsAccountAuthToken_9900 getAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_9900 getAuthToken data:" + data);
                        expect(err.code!=0).assertEqual(true);                        
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                            console.info("====>ActsAccountAuthToken_9900 getAuthList err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND);                        
                            appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_9900 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);                            
                                console.info("====>ActsAccountAuthToken_9900 end====");
                                done();
                            });
                        });
                    });
                })
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_10000
         * @tc.number ActsAccountAuthToken_10000
         * @tc.desc   ActsAccountAuthToken_10000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_10000 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err,)=>{
                console.info("====>ActsAccountAuthToken_10000 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_10000 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    try{
                        appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","authType","test_BundleName","true",(err)=>{
                            expect().assertFail();
                            done();
                        });
                    }catch(err){
                        expect(err.code == 401).assertEqual(true);
                        console.info("====>ActsAccountAuthToken_10000 setAuthTokenVisibility err:" + JSON.stringify(err));
                        appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                            console.info("====>ActsAccountAuthToken_10000 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_10000 end====");
                            done();
                        });
                    }
                    
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_10100
         * @tc.number ActsAccountAuthToken_10100
         * @tc.desc   ActsAccountAuthToken_10100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_10100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_10100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_10100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    try{
                        appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","authType","test_BundleName","invalid_string",(err)=>{
                            console.info("====>ActsAccountAuthToken_10100 setAuthTokenVisibility err:" + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        });
                    }catch(err){
                        console.info("====>ActsAccountAuthToken_10100 setAuthTokenVisibility throw_err:" + JSON.stringify(err));
                        expect(err.code == 401).assertEqual(true);
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                            console.info("====>ActsAccountAuthToken_10100 getAuthList err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_10100 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray.length).assertEqual(0);
                            appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_10100 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_10100 end====");
                                done();
                            });
                        });
                    }                        
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_10200
         * @tc.number ActsAccountAuthToken_10200
         * @tc.desc   ActsAccountAuthToken_10200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_10200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_10200 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_10200 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","authType","",true,(err)=>{
                        console.info("====>ActsAccountAuthToken_10200 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err.code==12300002).assertEqual(true);
                        appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                            console.info("====>ActsAccountAuthToken_10200 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_10200 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_10201
         * @tc.number ActsAccountAuthToken_10201
         * @tc.desc   appAccount authToken scene testcases
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_10201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_10201 start====");
            var appAccountManager = account.createAppAccountManager();
            await appAccountManager.createAccount("account_setAuthTokenVisibility_name");
            console.info("====>ActsAccountAuthToken_10201 start setAuthToken");
            await appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token");
            console.info("====>ActsAccountAuthToken_10201 start setAuthTokenVisibility");
            try {
                await appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","authType","",true);
                console.info("====>run err");
                expect().assertFail();
            } catch (err) {
                console.info("====>ActsAccountAuthToken_10201 setAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code==12300002).assertEqual(true);
            }
            appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_10201 removeAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                console.info("====>ActsAccountAuthToken_10201 end====");
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_10300
         * @tc.number ActsAccountAuthToken_10300
         * @tc.desc   ActsAccountAuthToken_10300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_10300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_10300 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_10300 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name", "authType", " ", true, (err)=>{
                        console.info("====>ActsAccountAuthToken_10300 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                            console.info("====>ActsAccountAuthToken_10300 getAuthList err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_10300 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray.length).assertEqual(1);
                            appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_10300 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_10300 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    

        /**
         * @tc.name   ActsAccountAuthToken_10301
         * @tc.number ActsAccountAuthToken_10301
         * @tc.desc   getAuthList promise test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_10301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_10301 start====");
            let appAccountManager = account.createAppAccountManager();
            try {
                await appAccountManager.createAccount("account_setAuthTokenVisibility_name");
                console.info("====>ActsAccountAuthToken_10301 createAccount success");
                await appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token");
                console.info("====>ActsAccountAuthToken_10301 setAuthToken success");
                await appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name", "authType", " ", true);
                console.info("====>ActsAccountAuthToken_10301 setAuthTokenVisibility success");
                let dataArray = await appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType");
                console.info("====>ActsAccountAuthToken_10301 getAuthList dataArray:" + JSON.stringify(dataArray));
                expect(dataArray.length > 0).assertTrue();
                expect(dataArray.length).assertEqual(1);
                await appAccountManager.removeAccount("account_setAuthTokenVisibility_name");
                console.info("====>ActsAccountAuthToken_10301 removeAccount success");
                console.info("====>ActsAccountAuthToken_10301 end====");
                done();
            } catch (err) {
                console.info("====>ActsAccountAuthToken_10301 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });
        
        /**
         * @tc.name   ActsAccountAuthToken_10400
         * @tc.number ActsAccountAuthToken_10400
         * @tc.desc   ActsAccountAuthToken_10400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_10400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            var limitBundleName = '';
            for(var i = 0;i < OWNERLENGTHLIMIT + 1; i++){
                limitBundleName += 't';
            }
            console.info("====>ActsAccountAuthToken_10400 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_10400 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_10400 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","authType",limitBundleName,true,(err)=>{
                        console.info("====>ActsAccountAuthToken_10400 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(12300002);
                        appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                            console.info("====>ActsAccountAuthToken_10400 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_10400 end====");
                            done();
                        });
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_10500
         * @tc.number ActsAccountAuthToken_10500
         * @tc.desc   ActsAccountAuthToken_10500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_10500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_10500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_10500 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_10500 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","",valid_owner_name,true,(err)=>{
                        console.info("====>ActsAccountAuthToken_10500 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name","",(err,dataArray)=>{
                            console.info("====>ActsAccountAuthToken_10500 getAuthList err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_10500 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray.length).assertEqual(1);
                            expect(dataArray[0]).assertEqual(valid_owner_name);
                            appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                console.info("====>ActsAccountAuthToken_10500 getAuthList authType:\"authType\" err:" + JSON.stringify(err));
                                expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND);
                                appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                    console.info("====>ActsAccountAuthToken_10500 removeAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountAuthToken_10500 end====");
                                    done();
                                });
                            });
                        });    
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_10600
         * @tc.number ActsAccountAuthToken_10600
         * @tc.desc   ActsAccountAuthToken_10600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_10600 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_10600 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name"," ","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_10600 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name"," ",valid_owner_name,true,(err)=>{
                        console.info("====>ActsAccountAuthToken_10600 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name"," ",(err,dataArray)=>{
                            console.info("====>ActsAccountAuthToken_10600 getAuthList err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_10600 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray.length).assertEqual(1);
                            expect(dataArray[0]).assertEqual(valid_owner_name);
                            appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                console.info("====>ActsAccountAuthToken_10600 getAuthList authType:\"authType\" err:" + JSON.stringify(err));
                                expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND);
                                console.info("====>ActsAccountAuthToken_10600 getAuthList authType:\"authType\" dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray).assertEqual(null);
                                appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                    console.info("====>ActsAccountAuthToken_10600 removeAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountAuthToken_10600 end====");
                                    done();
                                });
                            });
                        });    
                    });
                });
            });
        });
    
    
        /**
         * @tc.name   ActsAccountAuthToken_10700
         * @tc.number ActsAccountAuthToken_10700
         * @tc.desc   ActsAccountAuthToken_10700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT + 1; i++){
                limitAuthType += 't';
            }
            console.info("====>ActsAccountAuthToken_10700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_10700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_10700 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name",limitAuthType,"test_bundleName",true,(err)=>{
                        console.info("====>ActsAccountAuthToken_10700 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(12300002);
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                            console.info("====>ActsAccountAuthToken_10700 getAuthList authType:\"authType\" err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_10700 getAuthList authType:\"authType\" dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray.length).assertEqual(0);
                            appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_10700 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_10700 end====");
                                done();
                            });
                        }); 
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_10800
         * @tc.number ActsAccountAuthToken_10800
         * @tc.desc   ActsAccountAuthToken_10800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_10800 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_setAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_10800 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_setAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_10800 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name","invalid_authType",valid_owner_name,true,(err)=>{
                        console.info("====>ActsAccountAuthToken_10800 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(12300107);
                        appAccountManager.getAuthList("account_setAuthTokenVisibility_name","invalid_authType",(err,dataArray)=>{
                            console.info("====>ActsAccountAuthToken_10800 getAuthList err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(12300107);
                            console.info("====>ActsAccountAuthToken_10800 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray).assertEqual(null);
                            appAccountManager.getAuthList("account_setAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                console.info("====>ActsAccountAuthToken_10800 getAuthList authType:\"authType\" err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_10800 getAuthList authType:\"authType\" dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(0);
                                appAccountManager.removeAccount("account_setAuthTokenVisibility_name",(err)=>{
                                    console.info("====>ActsAccountAuthToken_10800 removeAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountAuthToken_10800 end====");
                                    done();
                                });
                            });
                        });    
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_10900
         * @tc.number ActsAccountAuthToken_10900
         * @tc.desc   ActsAccountAuthToken_10900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_10900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_10900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.setAuthTokenVisibility("","authType",valid_owner_name,true,(err)=>{
                console.info("====>ActsAccountAuthToken_10900 setAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_11000
         * @tc.number ActsAccountAuthToken_11000
         * @tc.desc   ActsAccountAuthToken_11000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_11000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_11000 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.setAuthTokenVisibility(" ","authType",valid_owner_name,true,(err)=>{
                console.info("====>ActsAccountAuthToken_11000 setAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_11001
         * @tc.number ActsAccountAuthToken_11001
         * @tc.desc   appAccount authToken scene testcases setAuthTokenVisibility promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_11001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_11001 start====");
            var appAccountManager = account.createAppAccountManager();
            try {
                await appAccountManager.setAuthTokenVisibility(" ","authType",valid_owner_name,true);
                expect().assertFail();
            } catch (err) {
                console.info("====>ActsAccountAuthToken_10201 setAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
            }
            done();
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_11100
         * @tc.number ActsAccountAuthToken_11100
         * @tc.desc   ActsAccountAuthToken_11100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            var limitName = '';
            for(var i = 0; i < LENGTHLIMIT + 1; i++){
                limitName += 't';
            }
            console.info("====>ActsAccountAuthToken_11100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.setAuthTokenVisibility(limitName,"authType",valid_owner_name,true,(err)=>{
                console.info("====>ActsAccountAuthToken_11100 setAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_11200
         * @tc.number ActsAccountAuthToken_11200
         * @tc.desc   ActsAccountAuthToken_11200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_11200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_11200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.setAuthTokenVisibility("no_add_account","authType",valid_owner_name,true,(err)=>{
                console.info("====>ActsAccountAuthToken_11200 setAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_11300
         * @tc.number ActsAccountAuthToken_11300
         * @tc.desc   ActsAccountAuthToken_11300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_11300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_11300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.checkAuthTokenVisibility("","authType",valid_owner_name,(err,stateBack)=>{
                console.info("====>ActsAccountAuthToken_11300 checkAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_11400
         * @tc.number ActsAccountAuthToken_11400
         * @tc.desc   ActsAccountAuthToken_11400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_11400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_11400 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.checkAuthTokenVisibility(" ","authType",valid_owner_name,(err,stateBack)=>{
                console.info("====>ActsAccountAuthToken_11400 checkAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_11500
         * @tc.number ActsAccountAuthToken_11500
         * @tc.desc   ActsAccountAuthToken_11500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_11500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            var limitName = '';
            for(var i = 0; i < LENGTHLIMIT + 1; i++){
                limitName += 't';
            }
            console.info("====>ActsAccountAuthToken_11500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.checkAuthTokenVisibility(limitName,"authType",valid_owner_name,(err,stateBack)=>{
                console.info("====>ActsAccountAuthToken_11500 checkAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_11501
         * @tc.number ActsAccountAuthToken_11501
         * @tc.desc   appAccount authToken scene testcases
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_11501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            var limitName = '';
            for(var i = 0; i < LENGTHLIMIT + 1; i++){
                limitName += 't';
            }
            console.info("====>ActsAccountAuthToken_11501 start====");
            var appAccountManager = account.createAppAccountManager();
            try {
                await appAccountManager.checkAuthTokenVisibility(limitName,"authType",valid_owner_name);
                console.info("====>run err");
                expect().assertFail();
            } catch (err) {
                console.info("====>ActsAccountAuthToken_11501 setAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
            }
            done();
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_11600
         * @tc.number ActsAccountAuthToken_11600
         * @tc.desc   ActsAccountAuthToken_11600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_11600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_11600 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.checkAuthTokenVisibility("no_add_account","authType",valid_owner_name,(err,stateBack)=>{
                console.info("====>ActsAccountAuthToken_11600 checkAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_11601
         * @tc.number ActsAccountAuthToken_11601
         * @tc.desc   appAccount authToken scene testcases
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_11601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_11601 start====");
            var appAccountManager = account.createAppAccountManager();
            try {
                await appAccountManager.checkAuthTokenVisibility("no_add_account","authType",valid_owner_name);
                console.info("====>run err");
                expect().assertFail();
            } catch (err) {
                console.info("====>ActsAccountAuthToken_11601 setAuthTokenVisibility err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300003);
            }
            done();
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_11700
         * @tc.number ActsAccountAuthToken_11700
         * @tc.desc   ActsAccountAuthToken_11700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_11700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_11700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_11700 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name","","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_11700 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","",valid_owner_name,(err,stateBack)=>{
                        console.info("====>ActsAccountAuthToken_11700 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_11700 checkAuthTokenVisibility stateBack:" + stateBack);
                        expect(err).assertEqual(null);
                        expect(stateBack).assertEqual(false);
                        appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","",OWNERSELF,(err,stateBack)=>{
                            console.info("====>ActsAccountAuthToken_11700 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountAuthToken_11700 checkAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(true);
                            appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_11700 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_11700 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_11800
         * @tc.number ActsAccountAuthToken_11800
         * @tc.desc   ActsAccountAuthToken_11800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_11800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_11800 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_11800 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name"," ","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_11800 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name"," ",valid_owner_name,(err,stateBack)=>{
                        console.info("====>ActsAccountAuthToken_11800 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_11800 checkAuthTokenVisibility stateBack:" + stateBack);
                        expect(err).assertEqual(null);
                        expect(stateBack).assertEqual(false);
                        appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name"," ",OWNERSELF,(err,stateBack)=>{
                            console.info("====>ActsAccountAuthToken_11800 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountAuthToken_11800 checkAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(true);
                            appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_11800 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_11800 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_11900
         * @tc.number ActsAccountAuthToken_11900
         * @tc.desc   ActsAccountAuthToken_11900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_11900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            var limitAuthType ='';
            for(var i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++){
                limitAuthType += 't';
            }
            console.info("====>ActsAccountAuthToken_11900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_11900 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_11900 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name",limitAuthType,valid_owner_name,(err,stateBack)=>{
                        console.info("====>ActsAccountAuthToken_11900 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(12300002);
                        appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name",limitAuthType,OWNERSELF,(err,stateBack)=>{
                            console.info("====>ActsAccountAuthToken_11900 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(12300002);
                            appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_11900 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_11900 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_12000
         * @tc.number ActsAccountAuthToken_12000
         * @tc.desc   ActsAccountAuthToken_12000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_12000 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_12000 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_12000 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","invalid_authType",valid_owner_name,(err,stateBack)=>{
                        console.info("====>ActsAccountAuthToken_12000 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_12000 checkAuthTokenVisibility stateBack:" + stateBack);
                        expect(err.code).assertEqual(12300107);
                        appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","invalid_authType",OWNERSELF,(err,stateBack)=>{
                            console.info("====>ActsAccountAuthToken_12000 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountAuthToken_12000 checkAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(true);
                            appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_12000 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_12000 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_12001
         * @tc.number ActsAccountAuthToken_12001
         * @tc.desc   appAccount authToken scene testcases checkAuthTokenVisibility promise 12300107
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_12001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_12001 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_12001 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_12001 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","invalid_authType",valid_owner_name).then((data) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0600 run err");
                        expect().assertFail();
                        done();
                    }).catch((err) =>{
                        console.info("====>ActsAccountAuthToken_12001 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(12300107);
                        appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","invalid_authType",OWNERSELF,(err,stateBack)=>{
                            console.info("====>ActsAccountAuthToken_12001 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountAuthToken_12001 checkAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(true);
                            appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_12001 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_12001 end====");
                                done();
                            });
                        });  
                    });  
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_12100
         * @tc.number ActsAccountAuthToken_12100
         * @tc.desc   ActsAccountAuthToken_12100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_12100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_12100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_12100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_12100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","authType","",(err,stateBack)=>{
                        console.info("====>ActsAccountAuthToken_12100 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_12100 checkAuthTokenVisibility stateBack:" + stateBack);
                        expect(err.code).assertEqual(12300002);
                        appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                            console.info("====>ActsAccountAuthToken_12100 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_12100 end====");
                            done();
                        });    
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_12200
         * @tc.number ActsAccountAuthToken_12200
         * @tc.desc   ActsAccountAuthToken_12200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_12200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_12200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_12200 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_12200 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","authType"," ",(err,stateBack)=>{
                        console.info("====>ActsAccountAuthToken_12200 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_12200 checkAuthTokenVisibility stateBack:" + stateBack);
                        expect(err).assertEqual(null);
                        expect(stateBack).assertEqual(false);
                        appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                            console.info("====>ActsAccountAuthToken_12200 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_12200 end====");
                            done();
                        });    
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_12300
         * @tc.number ActsAccountAuthToken_12300
         * @tc.desc   ActsAccountAuthToken_12300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_12300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            var limitBundleName = '';
            for(var i = 0; i < OWNERLENGTHLIMIT + 1; i++){
                limitBundleName += 't';
            }
            console.info("====>ActsAccountAuthToken_12300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_checkAuthTokenVisibility_name",(err)=>{
                console.info("====>ActsAccountAuthToken_12300 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_checkAuthTokenVisibility_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_12300 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name","authType",limitBundleName,(err,stateBack)=>{
                        console.info("====>ActsAccountAuthToken_12300 checkAuthTokenVisibility err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_12300 checkAuthTokenVisibility stateBack:" + stateBack);
                        expect(err.code).assertEqual(12300002);;
                        appAccountManager.removeAccount("account_checkAuthTokenVisibility_name",(err)=>{
                            console.info("====>ActsAccountAuthToken_12300 removeAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountAuthToken_12300 end====");
                            done();
                        });    
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_12400
         * @tc.number ActsAccountAuthToken_12400
         * @tc.desc   ActsAccountAuthToken_12400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_12400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_12400 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_testgetAuthList_name",(err)=>{
                console.info("====>ActsAccountAuthToken_12400 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_testgetAuthList_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_12400 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_testgetAuthList_name","authType",valid_owner_name,true,(err)=>{
                        console.info("====>ActsAccountAuthToken_12400 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthList("account_testgetAuthList_name","",(err,dataArray)=>{
                            console.info("====>ActsAccountAuthToken_12400 getAuthList err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(AccountErrCode.ERR_JS_AUTH_TYPE_NOT_FOUND);
                            appAccountManager.removeAccount("account_testgetAuthList_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_12400 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_12400 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_12500
         * @tc.number ActsAccountAuthToken_12500
         * @tc.desc   ActsAccountAuthToken_12500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_12500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_12500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_testgetAuthList_name",(err)=>{
                console.info("====>ActsAccountAuthToken_12500 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_testgetAuthList_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_12500 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_testgetAuthList_name","authType",valid_owner_name,true,(err)=>{
                        console.info("====>ActsAccountAuthToken_12500 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthList("account_testgetAuthList_name"," ",(err,dataArray)=>{
                            console.info("====>ActsAccountAuthToken_12500 getAuthList err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(12300107);
                            appAccountManager.removeAccount("account_testgetAuthList_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_12500 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_12500 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_12501
         * @tc.number ActsAccountAuthToken_12501
         * @tc.desc   appAccount authToken scene testcases
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_12501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_12501 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_testgetAuthList_name",(err)=>{
                console.info("====>ActsAccountAuthToken_12501 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_testgetAuthList_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_12501 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_testgetAuthList_name","authType",valid_owner_name,true,(err)=>{
                        console.info("====>ActsAccountAuthToken_12501 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthList("account_testgetAuthList_name"," ").then((dataArray)=>{
                            console.info("====>ActsAccountAuthToken_12501 getAuthList run err");
                            expect().assertEqual();
                            done();
                        }).catch((err)=>{
                            console.info("====>ActsAccountAuthToken_12501 getAuthList err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(12300107);
                            appAccountManager.removeAccount("account_testgetAuthList_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_12501 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_12501 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_12600
         * @tc.number ActsAccountAuthToken_12600
         * @tc.desc   ActsAccountAuthToken_12600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_12600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            var limitAuthType ='';
            for(var i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++){
                limitAuthType += 't';
            }
            console.info("====>ActsAccountAuthToken_12600 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_testgetAuthList_name",(err)=>{
                console.info("====>ActsAccountAuthToken_12600 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_testgetAuthList_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_12600 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAuthTokenVisibility("account_testgetAuthList_name","authType",valid_owner_name,true,(err)=>{
                        console.info("====>ActsAccountAuthToken_12600 setAuthTokenVisibility err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAuthList("account_testgetAuthList_name",limitAuthType,(err,dataArray)=>{
                            console.info("====>ActsAccountAuthToken_12600 getAuthList err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(12300002);
                            console.info("====>ActsAccountAuthToken_12600 getAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray).assertEqual(null);
                            appAccountManager.removeAccount("account_testgetAuthList_name",(err)=>{
                                console.info("====>ActsAccountAuthToken_12600 removeAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountAuthToken_12600 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_12700
         * @tc.number ActsAccountAuthToken_12700
         * @tc.desc   ActsAccountAuthToken_12700
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_12700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_12700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.getAuthList("","authType").then((dataArray)=>{
                console.info("====>ActsAccountAuthToken_12700 getAuthList run err");
                expect().assertEqual();
                done();
            }).catch((err)=>{
                console.info("====>ActsAccountAuthToken_12800 getAuthList err:" + JSON.stringify(err));
                expect(err.code).assertEqual(12300002);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_12800
         * @tc.number ActsAccountAuthToken_12800
         * @tc.desc   ActsAccountAuthToken_12800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_12800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_12800 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.getAuthList(" ","authType",(err,dataArray)=>{
                console.info("====>ActsAccountAuthToken_12800 getAuthList err:" + JSON.stringify(err));
                console.info("====>ActsAccountAuthToken_12800 getAuthList dataArray:" + JSON.stringify(dataArray));
                expect(err.code).assertEqual(12300003);
                expect(dataArray).assertEqual(null);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_12900
         * @tc.number ActsAccountAuthToken_12900
         * @tc.desc   ActsAccountAuthToken_12900
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_12900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            var limitName = '';
            for(var i = 0; i < LENGTHLIMIT + 1; i++){
                limitName += 't';
            }
            console.info("====>ActsAccountAuthToken_12900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.getAuthList(limitName,"authType",(err,dataArray)=>{
                console.info("====>ActsAccountAuthToken_12900 getAuthList err:" + JSON.stringify(err));
                console.info("====>ActsAccountAuthToken_12900 getAuthList dataArray:" + JSON.stringify(dataArray));
                expect(err.code).assertEqual(12300002);
                expect(dataArray).assertEqual(null);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_13000
         * @tc.number ActsAccountAuthToken_13000
         * @tc.desc   ActsAccountAuthToken_13000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_13000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_13000 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.getAuthList("no_add_account","authType",(err,dataArray)=>{
                console.info("====>ActsAccountAuthToken_13000 getAuthList err:" + JSON.stringify(err));
                console.info("====>ActsAccountAuthToken_13000 getAuthList dataArray:" + JSON.stringify(dataArray));
                expect(err.code).assertEqual(12300003);
                expect(dataArray).assertEqual(null);
                done();
            });
        });
    
        /**
         * @tc.name   ActsAccountAuthToken_13100
         * @tc.number ActsAccountAuthToken_13100
         * @tc.desc   ActsAccountAuthToken_13100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_13100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_13100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount("account_tokenTest_name",(err,)=>{
                console.info("====>ActsAccountAuthToken_13100 createAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthToken("account_tokenTest_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountAuthToken_13100 setAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                        console.info("====>ActsAccountAuthToken_13100 getAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountAuthToken_13100 getAuthToken stateBack:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("test_token");
                        appAccountManager.checkAuthTokenVisibility("account_tokenTest_name","authType",valid_owner_name,(err,stateBack)=>{
                            console.info("====>ActsAccountAuthToken_13100 checkAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountAuthToken_13100 checkAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(false);
                            appAccountManager.getAuthList("account_tokenTest_name","authType",(err,dataArray)=>{
                                console.info("====>ActsAccountAuthToken_13100 getAuthList err:" + JSON.stringify(err));
                                console.info("====>ActsAccountAuthToken_13100 getAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(err).assertEqual(null);
                                expect(dataArray.length).assertEqual(0);
                                appAccountManager.setAuthTokenVisibility("account_tokenTest_name","authType",valid_owner_name,true,(err)=>{
                                    console.info("====>ActsAccountAuthToken_13100 setAuthTokenVisibility err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    appAccountManager.checkAuthTokenVisibility("account_tokenTest_name","authType",valid_owner_name,(err,stateBack)=>{
                                        console.info("====>ActsAccountAuthToken_13100 checkAuthTokenVisibility err:" + JSON.stringify(err));
                                        console.info("====>ActsAccountAuthToken_13100 checkAuthTokenVisibility stateBack:" + stateBack);
                                        expect(err).assertEqual(null);
                                        expect(stateBack).assertEqual(true);
                                        appAccountManager.getAuthList("account_tokenTest_name","authType",(err,dataArray)=>{
                                            console.info("====>ActsAccountAuthToken_13100 getAuthList err:" + JSON.stringify(err));
                                            console.info("====>ActsAccountAuthToken_13100 getAuthList dataArray:" + JSON.stringify(dataArray));
                                            expect(err).assertEqual(null);
                                            expect(dataArray.length).assertEqual(1);
                                            expect(dataArray[0]).assertEqual(valid_owner_name);
                                            appAccountManager.removeAccount("account_tokenTest_name",(err)=>{
                                                console.info("====>ActsAccountAuthToken_13100 removeAccount err:" + JSON.stringify(err));
                                                expect(err).assertEqual(null);
                                                console.info("====>ActsAccountAuthToken_13100 end====");
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
    
        /**
         * @tc.name   ActsAccountAuthToken_13200
         * @tc.number ActsAccountAuthToken_13200
         * @tc.desc   ActsAccountAuthToken_13200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_13200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_13200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.queryAuthenticatorInfo("com.example.actsaccountOauthtoken",(err,dataInfo)=>{
                console.info("====>ActsAccountAuthToken_13200 queryAuthenticatorInfo err:" + JSON.stringify(err));
                console.info("====>ActsAccountAuthToken_13200 queryAuthenticatorInfo dataInfo:" + JSON.stringify(dataInfo));
                expect(err).assertEqual(null);
                expect(isNaN(dataInfo.iconId)).assertFalse();
                expect(isNaN(dataInfo.labelId)).assertFalse();
                done();
            });
        });
		
  /**
   * @tc.name   ActsAccountOAuthToken_13201
   * @tc.number ActsAccountOAuthToken_13201
   * @tc.desc   ActsAccountOAuthToken_13201
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
		it('ActsAccountOAuthToken_13201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
			console.info("====>ActsAccountOAuthToken_13201 start====");
			var appAccountManager = account.createAppAccountManager();
			await appAccountManager.queryAuthenticatorInfo("com.example.actsaccountOauthtoken").then((dataInfo) =>{
				console.info("====>ActsAccountOAuthToken_13201 queryAuthenticatorInfo dataInfo:" + JSON.stringify(dataInfo));
				expect(isNaN(dataInfo.iconId)).assertFalse();
				expect(isNaN(dataInfo.labelId)).assertFalse();
				done();
			}).catch((err) => {
				console.info("====>ActsAccountOAuthToken_13201 queryAuthenticatorInfo err:" + JSON.stringify(err));
			});
		});
    
        /**
         * @tc.name   ActsAccountAuthToken_13300
         * @tc.number ActsAccountAuthToken_13300
         * @tc.desc   ActsAccountAuthToken_13300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_13300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_13300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.auth("authenticate_test_account","com.example.actsaccountOauthtoken","authType",{},{
                onResult: (resultCode, resultData)=>{
                    console.info("====>ActsAccountAuthToken_13300 authenticate resultCode:" + JSON.stringify(resultCode));
                    console.info("====>ActsAccountAuthToken_13300 authenticate resultData:" + JSON.stringify(resultData));
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
    
        /**
         * @tc.name   ActsAccountAuthToken_13400
         * @tc.number ActsAccountAuthToken_13400
         * @tc.desc   ActsAccountAuthToken_13400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountAuthToken_13400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountAuthToken_13400 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccountImplicitly("com.example.actsaccountOauthtoken",{},{
                onResult: (resultCode, resultData) =>{
                    console.info("====>ActsAccountAuthToken_13400 authenticate resultCode:" + JSON.stringify(resultCode));
                    console.info("====>ActsAccountAuthToken_13400 authenticate resultData:" + JSON.stringify(resultData));
                    expect(resultCode.code).assertEqual(0);
                    expect(resultData.name).assertEqual("authenticate_test_account");
                    expect(resultData.authType).assertEqual("authType");
                    expect(resultData.token).assertEqual("serviceApp/authenticate/Token");
                    done();
                },
                onRequestRedirected: (request) =>{
                    console.info("====>ActsAccountAuthToken_13400 onRequestRedirected request:" + JSON.stringify(request));
                    let abilityStartSetting = {
                        want:request
                    }
                    featureAbility.startAbility(abilityStartSetting, (err, result)=>{
                        console.info("====>ActsAccountAuthToken_13400 onRequestRedirected err:" + JSON.stringify(err));
                    });
                    done();
                }
            });
            done();
        });
    })
}

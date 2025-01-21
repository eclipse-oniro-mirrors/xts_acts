/*
 * Copyright (C) 2021-2024 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

const LENGTHLIMIT = 512;
const TOKENLENGTHLIMIT = 1024;
const AUTHTYPELENGTHLIMIT = 1024;
const OWNERLENGTHLIMIT = 1024;

const OWNERSELF = "com.example.actsaccounttest";
export default function ActsAccountOAuthToken() {
    describe('ActsAccountOAuthToken', function () {

        /*
            * @tc.number    : testGetEntriesString101
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */


        it('ActsAccountOAuthToken_9100', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_9100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_tokenTest_name",(err,)=>{
                console.info("====>ActsAccountOAuthToken_9100 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_tokenTest_name","authType1","test_token1",(err)=>{
                    console.info("====>ActsAccountOAuthToken_9100 setOAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_tokenTest_name","authType1","test_token2",(err)=>{
                        console.info("====>ActsAccountOAuthToken_9100 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthTokenVisibility("account_tokenTest_name","authType1","other_app_bundleName",true,(err)=>{
                            console.info("====>ActsAccountOAuthToken_9100 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.setOAuthToken("account_tokenTest_name","authType2","test_token2",(err)=>{
                                console.info("====>ActsAccountOAuthToken_9100 setOAuthToken err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.getAllOAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                    console.info("====>ActsAccountOAuthToken_9100 getAllOAuthTokens err:" + JSON.stringify(err));
                                    console.info("====>ActsAccountOAuthToken_9100 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                    expect(err).assertEqual(null);
                                    expect(ArrayData.length).assertEqual(2);
                                    appAccountManager.deleteOAuthToken("account_tokenTest_name",OWNERSELF,"authType1","test_token2",(err)=>{
                                        console.info("====>ActsAccountOAuthToken_9100 deleteOAuthToken err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        appAccountManager.getAllOAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                            console.info("====>ActsAccountOAuthToken_9100 getAllOAuthTokens err:" + JSON.stringify(err));
                                            console.info("====>ActsAccountOAuthToken_9100 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                            expect(err).assertEqual(null);
                                            expect(ArrayData.length).assertEqual(2);
                                            appAccountManager.deleteAccount("account_tokenTest_name",(err)=>{
                                                console.info("====>ActsAccountOAuthToken_9100 deleteAccount err:" + JSON.stringify(err));
                                                expect(err).assertEqual(null);
                                                console.info("====>ActsAccountOAuthToken_9100 end====");
                                                done();
                                                appAccountManager.getOAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                                                    console.info("====>ActsAccountOAuthToken_9100 getOAuthToken err:" + JSON.stringify(err));
                                                    console.info("====>ActsAccountOAuthToken_9100 getOAuthToken data:" + data);
                                                    expect(err.code!=0).assertEqual(true);
                                                    console.info("====>ActsAccountOAuthToken_9100 end====");
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


        it('ActsAccountOAuthToken_9000', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_9000 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_tokenTest_name",(err,)=>{
                console.info("====>ActsAccountOAuthToken_9000 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_tokenTest_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountOAuthToken_9000 setOAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getOAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                        console.info("====>ActsAccountOAuthToken_9000 getOAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountOAuthToken_9000 getOAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("test_token");
                        appAccountManager.setOAuthTokenVisibility("account_tokenTest_name","authType","other_app_bundleName",true,(err)=>{
                            console.info("====>ActsAccountOAuthToken_9000 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getOAuthList("account_tokenTest_name","authType",(err,dataArray)=>{
                                console.info("====>ActsAccountOAuthToken_9000 getOAuthList err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_9000 getOAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(1);
                                expect(dataArray[0]).assertEqual("other_app_bundleName");
                                appAccountManager.deleteOAuthToken("account_tokenTest_name",OWNERSELF,"authType","test_token",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_9000 deleteOAuthToken err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    appAccountManager.getAllOAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                        console.info("====>ActsAccountOAuthToken_9000 getAllOAuthTokens err:" + JSON.stringify(err));
                                        console.info("====>ActsAccountOAuthToken_9000 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                        expect(err).assertEqual(null);
                                        expect(ArrayData.length).assertEqual(1);
                                        expect(ArrayData[0].authType).assertEqual("authType");
                                        expect(ArrayData[0].token).assertEqual("");
                                        appAccountManager.setOAuthTokenVisibility("account_tokenTest_name","authType",OWNERSELF,false,(err)=>{
                                            console.info("====>ActsAccountOAuthToken_9000 setOAuthTokenVisibility err:" + JSON.stringify(err));
                                            expect(err).assertEqual(null);
                                            appAccountManager.getOAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                                                console.info("====>ActsAccountOAuthToken_9000 getOAuthToken err:" + JSON.stringify(err));
                                                console.info("====>ActsAccountOAuthToken_9000 getOAuthToken data:" + data);
                                                expect(err.code!=0).assertEqual(true);
                                                expect(data).assertEqual(null);
                                                appAccountManager.deleteAccount("account_tokenTest_name",(err)=>{
                                                    console.info("====>ActsAccountOAuthToken_9000 deleteAccount err:" + JSON.stringify(err));
                                                    expect(err).assertEqual(null);
                                                    console.info("====>ActsAccountOAuthToken_9000 end====");
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



        it('ActsAccountOAuthToken_7100', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_7100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_7100 addAccount start====");
            appAccountManager.addAccount("account_tokenTest_name",(err)=>{
                console.info("====>ActsAccountOAuthToken_7100 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_tokenTest_name","authType1","test_token1",(err)=>{
                    console.info("====>ActsAccountOAuthToken_7100 setOAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_tokenTest_name","authType1","test_token2",(err)=>{
                        console.info("====>ActsAccountOAuthToken_7100 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthToken("account_tokenTest_name","authType2","test_token2",(err)=>{
                            console.info("====>ActsAccountOAuthToken_7100 setOAuthToken err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getAllOAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                console.info("====>ActsAccountOAuthToken_7100 getAllOAuthTokens err:" + JSON.stringify(err));
                                console.info("====>ActsAccountOAuthToken_7100 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                expect(err).assertEqual(null);
                                expect(ArrayData.length).assertEqual(2);
                                expect(ArrayData[0].authType).assertEqual("authType1");
                                expect(ArrayData[0].token).assertEqual("test_token2");
                                expect(ArrayData[1].authType).assertEqual("authType2");
                                expect(ArrayData[1].token).assertEqual("test_token2");
                                appAccountManager.deleteOAuthToken("account_tokenTest_name",OWNERSELF,"authType1","test_token2",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_7100 deleteOAuthToken err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    appAccountManager.getAllOAuthTokens("account_tokenTest_name", OWNERSELF,(err,ArrayData)=>{
                                        console.info("====>ActsAccountOAuthToken_7100 getAllOAuthTokens err:" + JSON.stringify(err));
                                        console.info("====>ActsAccountOAuthToken_7100 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                                        expect(err).assertEqual(null);
                                        expect(ArrayData.length).assertEqual(1);
                                        expect(ArrayData[0].authType).assertEqual("authType2");
                                        expect(ArrayData[0].token).assertEqual("test_token2");
                                        appAccountManager.deleteAccount("account_tokenTest_name",(err)=>{
                                            console.info("====>ActsAccountOAuthToken_7100 deleteAccount err:" + JSON.stringify(err));
                                            expect(err).assertEqual(null);
                                            appAccountManager.getOAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                                                console.info("====>ActsAccountOAuthToken_7100 getOAuthToken err:" + JSON.stringify(err));
                                                console.info("====>ActsAccountOAuthToken_7100 getOAuthToken data:" + data);
                                                expect(err.code!=0).assertEqual(true);
                                                expect(data).assertEqual(null);
                                                console.info("====>ActsAccountOAuthToken_7100 end====");
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


        it('ActsAccountOAuthToken_7200', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_7200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_tokenTest_name",(err,)=>{
                console.info("====>ActsAccountOAuthToken_7200 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_tokenTest_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountOAuthToken_7200 setOAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getOAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                        console.info("====>ActsAccountOAuthToken_7200 getOAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountOAuthToken_7200 getOAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("test_token");
                        appAccountManager.getOAuthList("account_tokenTest_name","authType",(err,dataArray)=>{
                            console.info("====>ActsAccountOAuthToken_7200 getOAuthList err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountOAuthToken_7200 getOAuthList dataArray:" + JSON.stringify(dataArray));
                            expect(dataArray.length).assertEqual(0);
                            appAccountManager.deleteAccount("account_tokenTest_name",(err)=>{
                                console.info("====>ActsAccountOAuthToken_7200 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_7200 end====");
                                done();
                            });
                        });    
                    });
                });
            });
        });

        it('ActsAccountOAuthToken_7300', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_7300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_7300 addAccount start====");
            appAccountManager.addAccount("account_tokenTest_name",(err)=>{
                console.info("====>ActsAccountOAuthToken_7300 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_tokenTest_name","authType","test_token",(err)=>{
                    console.info("====>ActsAccountOAuthToken_7300 setOAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getOAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                        console.info("====>ActsAccountOAuthToken_7300 getOAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountOAuthToken_7300 getOAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("test_token");
                        appAccountManager.checkOAuthTokenVisibility("account_tokenTest_name","authType",OWNERSELF,(err,stateBack)=>{
                            console.info("====>ActsAccountOAuthToken_7300 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_7300 checkOAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(true);
                            appAccountManager.setOAuthTokenVisibility("account_tokenTest_name","authType",OWNERSELF,false,(err)=>{
                                console.info("====>ActsAccountOAuthToken_7300 setOAuthTokenVisibility err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.checkOAuthTokenVisibility("account_tokenTest_name","authType",OWNERSELF,(err,stateBack)=>{
                                    console.info("====>ActsAccountOAuthToken_7300 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                                    console.info("====>ActsAccountOAuthToken_7300 checkOAuthTokenVisibility stateBack:" + stateBack);
                                    expect(err).assertEqual(null);
                                    expect(stateBack).assertEqual(true);
                                    appAccountManager.deleteOAuthToken("account_tokenTest_name",OWNERSELF,"authType","test_token",(err)=>{
                                        console.info("====>ActsAccountOAuthToken_7300 deleteOAuthToken err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        appAccountManager.deleteAccount("account_tokenTest_name",(err)=>{
                                            console.info("====>ActsAccountOAuthToken_7300 deleteAccount err:" + JSON.stringify(err));
                                            expect(err).assertEqual(null);
                                            console.info("====>ActsAccountOAuthToken_7300 end====");
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

        it('ActsAccountOAuthToken_7400', 0, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT + 1; i++){
                limitAuthType += 'c';
            }
            console.info("====>ActsAccountOAuthToken_7400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_7400 addAccount start====");
            appAccountManager.addAccount("account_callback_authType_limit",(err)=>{
                console.info("====>ActsAccountOAuthToken_7400 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_authType_limit","authType","callback_authType_limit_token",(err)=>{
                    console.info("====>ActsAccountOAuthToken_7400 setOAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteOAuthToken("account_callback_authType_limit",OWNERSELF,limitAuthType,"callback_authType_limit_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_7400 getOAuthToken err:" + JSON.stringify(err));
                        expect(err.code!=0).assertEqual(true);
                        appAccountManager.deleteAccount("account_callback_authType_limit",(err)=>{
                            console.info("====>ActsAccountOAuthToken_7400 deleteAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountOAuthToken_7400 end====");
                            done();
                        });
                    });
                });
            });
        });


        it('ActsAccountOAuthToken_7500', 0, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT + 1; i++){
                limitAuthType += 'c';
            }
            console.info("====>ActsAccountOAuthToken_7500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_7500 addAccount start====");
            await appAccountManager.addAccount("account_promise_authType_limit");
            console.info("====>ActsAccountOAuthToken_7500 getOAuthToken start====");
            try{
                await appAccountManager.deleteOAuthToken("account_promise_authType_limit",OWNERSELF,limitAuthType,"promise_authType_limit_token");
            }
            catch(err){
                console.info("====>ActsAccountOAuthToken_7500 getOAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountOAuthToken_7500 deleteAccount start====");
                await appAccountManager.deleteAccount("account_promise_authType_limit");
                console.info("====>ActsAccountOAuthToken_7500 end====");
                done();
            }
        });



        it('ActsAccountOAuthToken_7600', 0, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT; i++){
                limitAuthType += 'c';
            }
            console.info("====>ActsAccountOAuthToken_7600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_7600 addAccount start====");
            appAccountManager.addAccount("account_callback_authType_limit",(err)=>{
                console.info("====>ActsAccountOAuthToken_7600 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_authType_limit",limitAuthType,"callback_authType_limit_token",(err)=>{
                    console.info("====>ActsAccountOAuthToken_7600 setOAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteOAuthToken("account_callback_authType_limit",OWNERSELF,limitAuthType,"callback_authType_limit_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_7600 getOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.deleteAccount("account_callback_authType_limit",(err)=>{
                            console.info("====>ActsAccountOAuthToken_7600 deleteAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountOAuthToken_7600 end====");
                            done();
                        });
                    });
                });
            });
        });

        it('ActsAccountOAuthToken_7700', 0, async function (done) {
            var limitAuthType = '';
            for(var i = 0;i < AUTHTYPELENGTHLIMIT; i++){
                limitAuthType += 'c';
            }
            console.info("====>ActsAccountOAuthToken_7700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_7700 addAccount start====");
            await appAccountManager.addAccount("account_promise_authType_limit")
            console.info("====>ActsAccountOAuthToken_7700 setOAuthToken start====");
            await appAccountManager.setOAuthToken("account_promise_authType_limit",limitAuthType,"promise_authType_limit_token");
            console.info("====>ActsAccountOAuthToken_7700 deleteOAuthToken start====");
            await appAccountManager.deleteOAuthToken("account_promise_authType_limit",OWNERSELF,limitAuthType,"promise_authType_limit_token")
            console.info("====>ActsAccountOAuthToken_7700 deleteAccount start====");
            await appAccountManager.deleteAccount("account_promise_authType_limit")
            console.info("====>ActsAccountOAuthToken_7700 end====");
            done();

        });


        
        it('ActsAccountOAuthToken_7800', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_7800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_7800 addAccount start====");
            appAccountManager.addAccount("account_callback_empty_authType",(err)=>{
                console.info("====>ActsAccountOAuthToken_7800 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_empty_authType","authType","callback_empty_authType_token",(err)=>{
                    console.info("====>ActsAccountOAuthToken_7800 setOAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteOAuthToken("account_callback_empty_authType",OWNERSELF,"","callback_empty_authType_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_7800 deleteOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getOAuthToken("account_callback_empty_authType",OWNERSELF,"authType",(err,data)=>{
                            console.info("====>ActsAccountOAuthToken_7800 getOAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_7800 getOAuthToken data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_empty_authType_token");
                            appAccountManager.deleteAccount("account_callback_empty_authType",(err)=>{
                                console.info("====>ActsAccountOAuthToken_7800 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_7800 end====");
                                done();
                            });
                        });
                    });
                });
            });
        });

        it('ActsAccountOAuthToken_7900', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_7900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_7900 addAccount start====");
            await appAccountManager.addAccount("account_promise_empty_authType");
            console.info("====>ActsAccountOAuthToken_7900 setOAuthToken start====");
            await appAccountManager.setOAuthToken("account_promise_empty_authType","authType","promise_empty_authType_token");
            console.info("====>ActsAccountOAuthToken_7900 deleteOAuthToken start====");
            await appAccountManager.deleteOAuthToken("account_promise_empty_authType",OWNERSELF,"","promise_empty_authType_token");
            console.info("====>ActsAccountAuthToken_7900 getAuthToken start====");
            var data = await appAccountManager.getOAuthToken("account_promise_empty_authType",OWNERSELF,"authType");
            expect(data).assertEqual("promise_empty_authType_token");
            console.info("====>ActsAccountAuthToken_7900 removeAccount start====");
            await appAccountManager.deleteAccount("account_promise_empty_authType");
            console.info("====>ActsAccountAuthToken_7900 end====");
            done();
        });


        it('ActsAccountOAuthToken_8000', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_8000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_8000 addAccount start====");
            appAccountManager.addAccount("account_callback_setSameAuthType",(err)=>{
                console.info("====>ActsAccountOAuthToken_8000 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_token1",(err)=>{
                    console.info("====>ActsAccountOAuthToken_8000 setOAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_token2",(err)=>{
                        console.info("====>ActsAccountOAuthToken_8000 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getOAuthToken("account_callback_setSameAuthType",OWNERSELF,"authType",(err,data)=>{
                            console.info("====>ActsAccountOAuthToken_8000 getOAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_8000 getOAuthToken data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_setSameAuthType_token2");
                            appAccountManager.deleteOAuthToken("account_callback_setSameAuthType",OWNERSELF,"authType","callback_setSameAuthType_token1",(err,data)=>{
                                console.info("====>ActsAccountOAuthToken_8000 deleteOAuthToken err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.deleteAccount("account_callback_setSameAuthType",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_8000 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_8000 end====");
                                    done();
                                }); 
                            }); 
                        });
                    });
                });
            });
        });





    it('ActsAccountOAuthToken_8100', 0, async function (done) {
        var limitName = '';
        for(var i = 0;i < LENGTHLIMIT + 1; i++){
            limitName += 'c';
        }
        console.info("====>ActsAccountOAuthToken_8100 start====");
        var appAccountManager = account.createAppAccountManager();
        console.info("====>ActsAccountOAuthToken_8100 getAllOAuthTokens start====");
        appAccountManager.getAllOAuthTokens(limitName, OWNERSELF).then((ArrayData)=>{
            console.info("====>ActsAccountOAuthToken_8100 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));           
            expect(ArrayData.length).assertEqual(0);
            console.info("====>ActsAccountOAuthToken_8100 ====");
            done();
        }).catch((err)=>{
            expect(err.code!=0).assertEqual(true);
            done();
        })
    });
    
    it('ActsAccountOAuthToken_8200', 0, async function (done) {
        console.info("====>ActsAccountOAuthToken_8200 start====");
        var appAccountManager = account.createAppAccountManager();
        console.info("====>ActsAccountOAuthToken_8200 getAllOAuthTokens start====");
        appAccountManager.getAllOAuthTokens("", OWNERSELF,(err,ArrayData)=>{
            console.info("====>ActsAccountOAuthToken_8200 getAllOAuthTokens err:" + JSON.stringify(err));
            console.info("====>ActsAccountOAuthToken_8200 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));
            expect(err.code!=0).assertEqual(true);
            console.info("====>ActsAccountOAuthToken_8200 ====");
            done();
        });
    });

        it('ActsAccountOAuthToken_8300', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_8300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_8300 getAllOAuthTokens start====");
            appAccountManager.getAllOAuthTokens("acount_no_setToken", OWNERSELF,(err,ArrayData)=>{
                console.info("====>ActsAccountOAuthToken_8300 getAllOAuthTokens err:" + JSON.stringify(err));
                console.info("====>ActsAccountOAuthToken_8300 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                expect(err.code!=0).assertEqual(true);
                expect(ArrayData).assertEqual(null);
                console.info("====>ActsAccountOAuthToken_8300 end====");
                done();
            });
        });



        it('ActsAccountOAuthToken_8400', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_8400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_8400 addAccount start====");
            appAccountManager.addAccount("acount_no_setToken",(err)=>{
                console.info("====>ActsAccountOAuthToken_8400 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllOAuthTokens("acount_no_setToken", OWNERSELF,(err,ArrayData)=>{
                    console.info("====>ActsAccountOAuthToken_8400 getAllOAuthTokens err:" + JSON.stringify(err));
                    console.info("====>ActsAccountOAuthToken_8400 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err).assertEqual(null);
                    expect(ArrayData.length).assertEqual(0);
                    appAccountManager.deleteAccount("acount_no_setToken",(err)=>{
                        console.info("====>ActsAccountOAuthToken_8400 deleteAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountOAuthToken_8400 end====");
                        done();
                    });
                });
            });
        });



        it('ActsAccountOAuthToken_8500', 0, async function (done) {
            var limitName = '';
            for(var i = 0;i < LENGTHLIMIT; i++){
                limitName += 'c';
            }
            console.info("====>ActsAccountOAuthToken_8500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_8500 addAccount start====");
            appAccountManager.addAccount(limitName,(err)=>{
                console.info("====>ActsAccountOAuthToken_8500 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken(limitName,"authType","test_token",(err)=>{
                    console.info("====>ActsAccountOAuthToken_8500 setOAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAllOAuthTokens(limitName, OWNERSELF,(err,ArrayData)=>{
                        console.info("====>ActsAccountOAuthToken_8500 getAllOAuthTokens err:" + JSON.stringify(err));
                        console.info("====>ActsAccountOAuthToken_8500 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                        expect(err).assertEqual(null);
                        expect(ArrayData.length).assertEqual(1);
                        expect(ArrayData[0].authType).assertEqual("authType");
                        expect(ArrayData[0].token).assertEqual("test_token");
                        appAccountManager.deleteAccount(limitName,(err)=>{
                            console.info("====>ActsAccountOAuthToken_8500 deleteAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountOAuthToken_8500 end====");
                            done();
                        });
                    });
                });
            });
        });


        it('ActsAccountOAuthToken_8600', 0, async function (done) {
            var limitOwner = '';
            for(var i = 0;i < OWNERLENGTHLIMIT + 1; i++){
                limitOwner += 'c';
            }
            console.info("====>ActsAccountOAuthToken_8600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_8600 addAccount start====");
            appAccountManager.addAccount("account_callback_getAllOAuthTokens_test",(err)=>{
                console.info("====>ActsAccountOAuthToken_8600 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllOAuthTokens("account_callback_getAllOAuthTokens_test",limitOwner,(err,ArrayData)=>{
                    console.info("====>ActsAccountOAuthToken_8600 getAllOAuthTokens err:" + JSON.stringify(err));
                    console.info("====>ActsAccountOAuthToken_8600 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err.code!=0).assertEqual(true);
                    expect(ArrayData).assertEqual(null);
                    appAccountManager.deleteAccount("account_callback_getAllOAuthTokens_test",(err)=>{
                        console.info("====>ActsAccountOAuthToken_8600 deleteAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountOAuthToken_8600 end====");
                        done();
                    });
                });
            });
        });
        

        it('ActsAccountOAuthToken_8700', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_8700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_8700 addAccount start====");
            appAccountManager.addAccount("account_callback_getAllOAuthTokens_test",(err)=>{
                console.info("====>ActsAccountOAuthToken_8700 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllOAuthTokens("account_callback_getAllOAuthTokens_test","",(err,ArrayData)=>{
                    console.info("====>ActsAccountOAuthToken_8700 getAllOAuthTokens err:" + JSON.stringify(err));
                    console.info("====>ActsAccountOAuthToken_8700 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err.code!=0).assertEqual(true);
                    expect(ArrayData).assertEqual(null);
                    appAccountManager.deleteAccount("account_callback_getAllOAuthTokens_test",(err)=>{
                        console.info("====>ActsAccountOAuthToken_8700 deleteAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountOAuthToken_8700 end====");
                        done();
                    });
                });
            });
        });

        
        it('ActsAccountOAuthToken_8800', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_8800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_8800 addAccount start====");
            appAccountManager.addAccount("account_callback_getAllOAuthTokens_test",(err)=>{
                console.info("====>ActsAccountOAuthToken_8800 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllOAuthTokens("account_callback_getAllOAuthTokens_test","invalid_owner",(err,ArrayData)=>{
                    console.info("====>ActsAccountOAuthToken_8800 getAllOAuthTokens err:" + JSON.stringify(err));
                    console.info("====>ActsAccountOAuthToken_8800 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err.code!=0).assertEqual(true);
                    expect(ArrayData).assertEqual(null);
                    appAccountManager.deleteAccount("account_callback_getAllOAuthTokens_test",(err)=>{
                        console.info("====>ActsAccountOAuthToken_8800 deleteAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountOAuthToken_8800 end====");
                        done();
                    });
                });
            });
        });

        it('ActsAccountOAuthToken_8900', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_8900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_8900 addAccount start====");
            appAccountManager.addAccount("account_callback_getAllOAuthTokens_test",(err)=>{
                console.info("====>ActsAccountOAuthToken_8900 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAllOAuthTokens("account_callback_getAllOAuthTokens_test"," ",(err,ArrayData)=>{
                    console.info("====>ActsAccountOAuthToken_8900 getAllOAuthTokens err:" + JSON.stringify(err));
                    console.info("====>ActsAccountOAuthToken_8900 getAllOAuthTokens ArrayData:" + JSON.stringify(ArrayData));
                    expect(err.code!=0).assertEqual(true);
                    expect(ArrayData).assertEqual(null);
                    appAccountManager.deleteAccount("account_callback_getAllOAuthTokens_test",(err)=>{
                        console.info("====>ActsAccountOAuthToken_8900 deleteAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountOAuthToken_8900 end====");
                        done();
                    });
                });
            });
        });




        it('ActsAccountOAuthToken_0100', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_0100 addAccount start====");
            appAccountManager.addAccount("account_callback_normal",(err)=>{
                console.info("====>ActsAccountOAuthToken_0100 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_normal","authType","callback_normal_token",(err)=>{
                    console.info("====>ActsAccountOAuthToken_0100 setOAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getOAuthToken("account_callback_normal",OWNERSELF,"authType",(err,data)=>{
                        console.info("====>ActsAccountOAuthToken_0100 getOAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountOAuthToken_0100 getOAuthToken data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("callback_normal_token");
                        appAccountManager.checkOAuthTokenVisibility("account_callback_normal","authType",OWNERSELF,(err,stateBack)=>{
                            console.info("====>ActsAccountOAuthToken_0100 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_0100 checkOAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(true);
                            appAccountManager.deleteOAuthToken("account_callback_normal",OWNERSELF,"authType","callback_normal_token",(err)=>{
                                console.info("====>ActsAccountOAuthToken_0100 deleteOAuthToken err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.deleteAccount("account_callback_normal",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_0100 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_0100 end====");
                                    done();
                                });
                            });
                        });
                    });
                });
            });
        });


        it('ActsAccountOAuthToken_0200', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_0200 addAccount start====");
            await appAccountManager.addAccount("account_promise_normal");
            console.info("====>ActsAccountOAuthToken_0200 setOAuthToken start====");
            await appAccountManager.setOAuthToken("account_promise_normal","authType","promise_normal_token");
            console.info("====>ActsAccountOAuthToken_0200 getOAuthToken start====");
            var data1 = await appAccountManager.getOAuthToken("account_promise_normal",OWNERSELF,"authType");
            console.info("====>getOAuthToken ActsAccountOAuthToken_0200 data:" + data1);
            expect(data1).assertEqual("promise_normal_token");
            console.info("====>ActsAccountOAuthToken_0200 checkOAuthTokenVisibility start====");
            var state = await appAccountManager.checkOAuthTokenVisibility("account_promise_normal","authType",OWNERSELF);
            console.info("====>checkOAuthTokenVisibility ActsAccountOAuthToken_0200 state:" + state);
            expect(state).assertEqual(true);
            console.info("====>ActsAccountOAuthToken_0200 deleteOAuthToken start====");
            await appAccountManager.deleteOAuthToken("account_promise_normal",OWNERSELF,"authType","promise_normal_token");
            console.info("====>ActsAccountOAuthToken_0200 deleteAccount start====");
            await appAccountManager.deleteAccount("account_promise_normal");
            console.info("====>ActsAccountOAuthToken_0200 end====");
            done();
        });




        it('ActsAccountOAuthToken_0300', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_0300 getOAuthToken start====");
            appAccountManager.addAccount("account_callback_noSetToken",(err)=>{
                console.info("====>ActsAccountOAuthToken_0300 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getOAuthToken("account_callback_noSetToken",OWNERSELF,"authType",(err,data)=>{
                    console.info("====>ActsAccountOAuthToken_0300 getOAuthToken err:" + JSON.stringify(err));
                    console.info("====>ActsAccountOAuthToken_0300 getOAuthToken data:" + data);
                    expect(err.code!=0).assertEqual(true);
                    expect(data).assertEqual(null);
                    appAccountManager.deleteAccount("account_callback_noSetToken",(err)=>{
                        console.info("====>ActsAccountOAuthToken_0300 deleteAccount err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountOAuthToken_0300 end====");
                        done();
                    });
                });
            });
        });

        it('ActsAccountOAuthToken_0400', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_0400 addAccount start====");
            await appAccountManager.addAccount("account_promise_noSetToken");
            console.info("====>ActsAccountOAuthToken_0400 getOAuthToken start====");
            try{
                await appAccountManager.getOAuthToken("account_promise_noSetToken",OWNERSELF,"authType");
            }
            catch(err){
                console.info("====>ActsAccountOAuthToken_0400 getOAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountOAuthToken_0400 deleteAccount start====");
                await appAccountManager.deleteAccount("account_promise_noSetToken");
                console.info("====>ActsAccountOAuthToken_0400 end====");
                done();
            }
        });


        it('ActsAccountOAuthToken_0500', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_0500 getOAuthToken start====");
            appAccountManager.getOAuthToken("noAdd_account_callback",OWNERSELF,"authType",(err,data)=>{
                console.info("====>ActsAccountOAuthToken_0500 getOAuthToken err:" + JSON.stringify(err));
                console.info("====>ActsAccountOAuthToken_0500 getOAuthToken data:" + data);
                expect(err.code!=0).assertEqual(true);
                expect(data).assertEqual(null);
                done();
            });
        });

        it('ActsAccountOAuthToken_0600', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_0600 getOAuthToken start====");
            try{
                await appAccountManager.getOAuthToken("noAdd_account_promise",OWNERSELF,"authType");
            }
            catch(err){
                console.info("====>ActsAccountOAuthToken_0600 getOAuthToken err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountOAuthToken_0600 end====");
                done();
            }
        });


        it('ActsAccountOAuthToken_0700', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_0700 addAccount start====");
            appAccountManager.addAccount("account_callback_setSameAuthType",(err)=>{
                console.info("====>ActsAccountOAuthToken_0700 addAccount err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_token",(err)=>{
                    console.info("====>ActsAccountOAuthToken_0700 setOAuthToken err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_0700 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getOAuthToken("account_callback_setSameAuthType",OWNERSELF,"authType",(err,data)=>{
                            console.info("====>ActsAccountOAuthToken_0700 getOAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_0700 getOAuthToken data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_setSameAuthType_token");
                            appAccountManager.setOAuthToken("account_callback_setSameAuthType","authType","callback_setSameAuthType_DiffToken",(err)=>{
                                console.info("====>ActsAccountOAuthToken_0700 setOAuthToken err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                appAccountManager.getOAuthToken("account_callback_setSameAuthType",OWNERSELF,"authType",(err,data)=>{
                                    console.info("====>ActsAccountOAuthToken_0700 getOAuthToken err:" + JSON.stringify(err));
                                    console.info("====>ActsAccountOAuthToken_0700 getOAuthToken data:" + data);
                                    expect(err).assertEqual(null);
                                    expect(data).assertEqual("callback_setSameAuthType_DiffToken");
                                    appAccountManager.deleteAccount("account_callback_setSameAuthType",(err)=>{
                                        console.info("====>ActsAccountOAuthToken_0700 deleteAccount err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        console.info("====>ActsAccountOAuthToken_0700 end====");
                                        done();
                                    });
                                });
                            });   
                        });
                    });
                });
            });
        });




        it('ActsAccountOAuthToken_0800', 0, async function (done) {
            console.info("====>ActsAccountOAuthToken_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_0800 addAccount start====");
            await appAccountManager.addAccount("account_promise_setSameAuthType");
            console.info("====>ActsAccountOAuthToken_0800 setOAuthToken start====");
            await appAccountManager.setOAuthToken("account_promise_setSameAuthType","authType","promise_setSameAuthType_token");
            console.info("====>ActsAccountOAuthToken_0800 repeat setOAuthToken start====");
            await appAccountManager.setOAuthToken("account_promise_setSameAuthType","authType","promise_setSameAuthType_token");
            var data1 = await appAccountManager.getOAuthToken("account_promise_setSameAuthType",OWNERSELF,"authType");
            console.info("====>getOAuthToken ActsAccountOAuthToken_0800 data:" + data1);
            expect(data1).assertEqual("promise_setSameAuthType_token");
            console.info("====>ActsAccountOAuthToken_0800 repeat set diffToken setOAuthToken start====");
            await appAccountManager.setOAuthToken("account_promise_setSameAuthType","authType","promise_setSameAuthType_DiffToken");
            var data2 = await appAccountManager.getOAuthToken("account_promise_setSameAuthType",OWNERSELF,"authType");
            console.info("====>getOAuthToken ActsAccountOAuthToken_0800 data:" + data2);
            expect(data2).assertEqual("promise_setSameAuthType_DiffToken");
            console.info("====>ActsAccountOAuthToken_0800 deleteAccount start====");
            await appAccountManager.deleteAccount("account_promise_setSameAuthType");
            console.info("====>ActsAccountOAuthToken_0800 end====");
            done();
        });



        it('ActsAccountOAuthToken_0900', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_callback_setDiff", (err)=>{
                console.info("====>addAccount ActsAccountOAuthToken_0900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_setDiff","authType1","callback_setDiff_token1",(err)=>{
                    console.info("====>getOAuthToken ActsAccountOAuthToken_0900 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_setDiff","authType2","callback_setDiff_token2",(err)=>{
                        console.info("====>getOAuthToken ActsAccountOAuthToken_0900 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getOAuthToken("account_callback_setDiff",OWNERSELF,"authType1", (err, data)=>{
                            console.info("====>getOAuthToken ActsAccountOAuthToken_0900 err:" + JSON.stringify(err));
                            console.info("====>getOAuthToken ActsAccountOAuthToken_0900 data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_setDiff_token1");
                            appAccountManager.getOAuthToken("account_callback_setDiff",OWNERSELF,"authType2", (err, data)=>{
                                console.info("====>getOAuthToken ActsAccountOAuthToken_0900 err:" + JSON.stringify(err));
                                console.info("====>getOAuthToken ActsAccountOAuthToken_0900 data:" + data);
                                expect(err).assertEqual(null);
                                expect(data).assertEqual("callback_setDiff_token2");
                                appAccountManager.deleteAccount("account_callback_setDiff", (err)=>{
                                    console.info("====>deleteAccount ActsAccountOAuthToken_0900 err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_0900 end====");
                                    done();
                                });   
                            });    
                        });
                    });
                });    
            });
        });



        it('ActsAccountOAuthToken_1000', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_1000 addAccount start====");
            await appAccountManager.addAccount("account_promise_setDiff");
            console.info("====>setOAuthToken ActsAccountOAuthToken_1000 start====");
            await appAccountManager.setOAuthToken("account_promise_setDiff","aythType1","promise_setDiff_token1");
            console.info("====>setOAuthToken ActsAccountOAuthToken_1000 start====");
            await appAccountManager.setOAuthToken("account_promise_setDiff","aythType2","promise_setDiff_token2");

            console.info("====>getOAuthToken ActsAccountOAuthToken_1000 start====");
            var data1 = await appAccountManager.getOAuthToken("account_promise_setDiff",OWNERSELF,"aythType1");
            console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1000 data:" + data1);
            expect(data1).assertEqual("promise_setDiff_token1");
            console.info("====>getOAuthToken ActsAccountOAuthToken_1000 start====");
            var data2 = await appAccountManager.getOAuthToken("account_promise_setDiff",OWNERSELF,"aythType2");
            console.info("====>getOAuthToken getNew ActsAccountOAuthToken_1000 data:" + data2);
            expect(data2).assertEqual("promise_setDiff_token2");

            console.info("====>deleteOAuthToken ActsAccountOAuthToken_1000 start====");
            await appAccountManager.deleteOAuthToken("account_promise_setDiff",OWNERSELF,"aythType1","promise_setDiff_token1");
            console.info("====>deleteOAuthToken ActsAccountOAuthToken_1000 start====");
            await appAccountManager.deleteOAuthToken("account_promise_setDiff",OWNERSELF,"aythType2","promise_setDiff_token2");
            console.info("====>ActsAccountOAuthToken_1000 deleteAccount start====");
            await appAccountManager.deleteAccount("account_promise_setDiff");
            console.info("====>ActsAccountOAuthToken_1000 end====");
            done();
        });



        it('ActsAccountOAuthToken_1100', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_callback_setDeleteGet", (err)=>{
                console.info("====>addAccount ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_setDeleteGet","old_authType","callback_setDeleteGet_token",(err)=>{
                    console.info("====>getOAuthToken ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_setDeleteGet","new_authType","callback_setDeleteGet_token",(err)=>{
                        console.info("====>getOAuthToken ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getOAuthToken("account_callback_setDeleteGet",OWNERSELF,"old_authType", (err, data)=>{
                            console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
                            console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1100 data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("callback_setDeleteGet_token");
                            appAccountManager.getOAuthToken("account_callback_setDeleteGet",OWNERSELF,"new_authType", (err, data)=>{
                                console.info("====>getOAuthToken getNew ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
                                console.info("====>getOAuthToken getNew ActsAccountOAuthToken_1100 data:" + data);
                                expect(err).assertEqual(null);
                                expect(data).assertEqual("callback_setDeleteGet_token");
                                appAccountManager.deleteOAuthToken("account_callback_setDeleteGet",OWNERSELF,"old_authType","callback_setDeleteGet_token",(err)=>{
                                    console.info("====>deleteOAuthToken deleteOld ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
                                    appAccountManager.getOAuthToken("account_callback_setDeleteGet",OWNERSELF,"old_authType", (err, data)=>{
                                        console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
                                        console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1100 data:" + data);
                                        expect(err.code!=0).assertEqual(true);
                                        expect(data).assertEqual(null);
                                        appAccountManager.getOAuthToken("account_callback_setDeleteGet",OWNERSELF,"new_authType", (err, data)=>{
                                            console.info("====>getOAuthToken getNew ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
                                            console.info("====>getOAuthToken getNew ActsAccountOAuthToken_1100 data:" + data);
                                            expect(err).assertEqual(null);
                                            expect(data).assertEqual("callback_setDeleteGet_token");
                                            appAccountManager.deleteOAuthToken("account_callback_setDeleteGet",OWNERSELF,"new_authType","callback_setDeleteGet_token",(err)=>{
                                                console.info("====>deleteOAuthToken deleteNew ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
                                                appAccountManager.getOAuthToken("account_callback_setDeleteGet",OWNERSELF,"old_authType", (err, data)=>{
                                                    console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
                                                    console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1100 data:" + data);
                                                    expect(err.code!=0).assertEqual(true);
                                                    expect(data).assertEqual(null);
                                                    appAccountManager.getOAuthToken("account_callback_setDeleteGet",OWNERSELF,"new_authType", (err, data)=>{
                                                        console.info("====>getOAuthToken getNew ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
                                                        console.info("====>getOAuthToken getNew ActsAccountOAuthToken_1100 data:" + data);
                                                        expect(err.code!=0).assertEqual(true);
                                                        expect(data).assertEqual(null);
                                                        appAccountManager.deleteAccount("account_callback_setDeleteGet", (err)=>{
                                                            console.info("====>deleteAccount ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
                                                            expect(err).assertEqual(null);
                                                            console.info("====>ActsAccountOAuthToken_1100 end====");
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


        it('ActsAccountOAuthToken_1200', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_1200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_1200 addAccount start====");
            await appAccountManager.addAccount("account_promise_setDeleteGet");

            console.info("====>setOAuthToken setOld ActsAccountOAuthToken_1200 start====");
            await appAccountManager.setOAuthToken("account_promise_setDeleteGet","old_authType","promise_setDeleteGet_token");
            console.info("====>setOAuthToken setNew ActsAccountOAuthToken_1200 start====");
            await appAccountManager.setOAuthToken("account_promise_setDeleteGet","new_authType","promise_setDeleteGet_token");

            console.info("====>getOAuthToken ActsAccountOAuthToken_1200 start====");
            var data1BeforeDel = await appAccountManager.getOAuthToken("account_promise_setDeleteGet",OWNERSELF,"old_authType");
            console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1200 data1BeforeDel:" + data1BeforeDel);
            expect(data1BeforeDel).assertEqual("promise_setDeleteGet_token");
            console.info("====>getOAuthToken ActsAccountOAuthToken_1200 start====");
            var data2BeforeDel = await appAccountManager.getOAuthToken("account_promise_setDeleteGet",OWNERSELF,"new_authType");
            console.info("====>getOAuthToken getNew ActsAccountOAuthToken_1200 data2BeforeDel:" + data2BeforeDel);
            expect(data2BeforeDel).assertEqual("promise_setDeleteGet_token");

            console.info("====>deleteOAuthToken deleteOld ActsAccountOAuthToken_1200 start====");
            try{
                await appAccountManager.deleteOAuthToken("account_promise_setDeleteGet",OWNERSELF,"old_authType","promise_setDeleteGet_token");
            }
            catch(err){
                console.info("====>deleteOAuthToken ActsAccountOAuthToken_1200 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
            }

            console.info("====>getOAuthToken ActsAccountOAuthToken_1200 start====");
            try{
                var data1AfterDel = await appAccountManager.getOAuthToken("account_promise_setDeleteGet",OWNERSELF,"old_authType",);
                console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1200 data1_AfterDel:" + data1AfterDel);
                expect().assertFail();
            }
            catch(err){
                console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1200 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);                
            }
            console.info("====>getOAuthToken ActsAccountOAuthToken_1200 start====");
            try{
                var data2AfterDel = await appAccountManager.getOAuthToken("account_promise_setDeleteGet",OWNERSELF,"new_authType",);
                console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1200 data2_AfterDel:" + data2AfterDel);
                expect(data2AfterDel).assertEqual("promise_setDeleteGet_token");
            }
            catch(err){
                console.info("====>getOAuthToken getNew ActsAccountOAuthToken_1200 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
            }
            console.info("====>deleteOAuthToken deleteNew ActsAccountOAuthToken_1200 start====");
            try{
                await appAccountManager.deleteOAuthToken("account_promise_setDeleteGet",OWNERSELF,"new_authType","promise_setDeleteGet_token");
            }
            catch(err){
                console.info("====>deleteOAuthToken ActsAccountOAuthToken_1200 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
            }

            console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1200 start====");
            try{
                var data1AgainDel = await appAccountManager.getOAuthToken("account_promise_setDeleteGet",OWNERSELF,"old_authType",);
                console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1200 data1_AgainDel:" + data1AgainDel);
                expect().assertFail();
            }
            catch(err){
                console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1200 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
            }
            console.info("====>getOAuthToken getNew ActsAccountOAuthToken_1200 start====");
            try{
                var data2AgainDel = await appAccountManager.getOAuthToken("account_promise_setDeleteGet",OWNERSELF,"new_authType",);
                console.info("====>getOAuthToken getOld ActsAccountOAuthToken_1200 data2_AgainDel:" + data2AgainDel);
                expect().assertFail();
            }
            catch(err){
                console.info("====>getOAuthToken getNew ActsAccountOAuthToken_1200 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
            }
            await appAccountManager.deleteAccount("account_promise_setDeleteGet");
            console.info("====>ActsAccountOAuthToken_1200 end====");
            done();

        });


        it('ActsAccountOAuthToken_1300', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_1300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_callback_setDeleteGet", (err)=>{
            console.info("====>addAccount ActsAccountOAuthToken_1300 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_setDeleteGet","authType","account_callback_setDeleteGet_token",(err)=>{
                    console.info("====>getOAuthToken ActsAccountOAuthToken_1300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteOAuthToken("account_callback_setDeleteGet",OWNERSELF,"authType","account_callback_setDeleteGet_token",(err)=>{
                        console.info("====>deleteOAuthToken ActsAccountOAuthToken_1300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getOAuthToken("account_callback_setDeleteGet",OWNERSELF,"authType", (err, data)=>{
                            console.info("====>getOAuthToken ActsAccountOAuthToken_1300 err:" + JSON.stringify(err));
                            console.info("====>getOAuthToken ActsAccountOAuthToken_1300 data:" + data);
                            expect(err.code != 0).assertEqual(true);
                            expect(data).assertEqual(null);
                            appAccountManager.deleteAccount("account_callback_setDeleteGet", (err)=>{
                                console.info("====>deleteAccount ActsAccountOAuthToken_1300 err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_1300 end====");
                                done();
                            });
                        });
                    });
                });
            });
        });


        it('ActsAccountOAuthToken_1400', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_1400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_1400 addAccount start====");
            await appAccountManager.addAccount("account_promise_setDeleteGet");
            console.info("====>setOAuthToken ActsAccountOAuthToken_1400 start====");
            await appAccountManager.setOAuthToken("account_promise_setDeleteGet","authType","promise_setDeleteGet_token");
            console.info("====>deleteOAuthToken ActsAccountOAuthToken_1400 start====");
            await appAccountManager.deleteOAuthToken("account_promise_setDeleteGet",OWNERSELF,"authType","promise_setDeleteGet_token");
            console.info("====>getOAuthToken ActsAccountOAuthToken_1400 start====");
            try{
                var data = await appAccountManager.getOAuthToken("account_promise_setDeleteGet",OWNERSELF,"authType");
            }
            catch(err){
                console.info("====>getOAuthToken ActsAccountOAuthToken_1400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>getOAuthToken ActsAccountOAuthToken_1400 data:" + data);
                console.info("====>ActsAccountOAuthToken_1400 deleteAccount start====");
                await appAccountManager.deleteAccount("account_promise_setDeleteGet");
                console.info("====>ActsAccountOAuthToken_1400 end====");
                done();
            }
        });


        it('ActsAccountOAuthToken_1500', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_1500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.setOAuthToken("account_callback_accountNotExit","authType","account_callback_accountNotExit_token", (err)=>{
                console.info("====>setOAuthToken ActsAccountOAuthToken_1500 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountOAuthToken_1500 end====");
                done();
            });
        });

        it('ActsAccountOAuthToken_1600', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_1600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>setOAuthToken ActsAccountOAuthToken_1600 start====");
            try{
                await appAccountManager.setOAuthToken("account_promise_accountNotExit","authType","account_promise_accountNotExit_token");
            }
            catch(err){
                console.info("====>setOAuthToken ActsAccountOAuthToken_1600 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountOAuthToken_1600 end====");
                done();
            }
        });



        it('ActsAccountOAuthToken_1700', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_1700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.deleteOAuthToken("account_callback_accountNotExit",OWNERSELF,"authType","account_callback_accountNotExit_token", (err)=>{
                console.info("====>deleteOAuthToken ActsAccountOAuthToken_1700 err:" + JSON.stringify(err));
                expect(err.code!=0).assertEqual(true);
                console.info("====>ActsAccountOAuthToken_1700 end====");
                done();
            });
        });

        it('ActsAccountOAuthToken_1800', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_1800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>deleteOAuthToken ActsAccountOAuthToken_1800 start====");
            try{
                await appAccountManager.deleteOAuthToken("account_promise_accountNotExit",OWNERSELF,"authType","account_promise_accountNotExit_token");
            }
            catch(err){
                console.info("====>deleteOAuthToken ActsAccountOAuthToken_1800 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountOAuthToken_1800 end====");
                done();
            }
        });



        it('ActsAccountOAuthToken_1900', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_1900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_callback_repeatDelete", (err)=>{
                console.info("====>addAccount ActsAccountOAuthToken_1900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.deleteOAuthToken("account_callback_repeatDelete",OWNERSELF,"aythType","promise_repeatDelete_token",(err)=>{
                    console.info("====>deleteOAuthToken  ActsAccountOAuthToken_1900 err:" + JSON.stringify(err));
                    appAccountManager.getOAuthToken("account_callback_repeatDelete",OWNERSELF,"authType", (err, data)=>{
                        console.info("====>getOAuthToken ActsAccountOAuthToken_1900 err:" + JSON.stringify(err));
                        console.info("====>getOAuthToken ActsAccountOAuthToken_1900 data:" + data);
                        expect(err.code != 0).assertEqual(true);
                        expect(data).assertEqual(null);
                        appAccountManager.deleteAccount("account_callback_repeatDelete", (err)=>{
                            console.info("====>deleteAccount ActsAccountOAuthToken_1900 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountOAuthToken_1900 end====");
                            done();
                        });
                    });
                });
            });
        });


        it('ActsAccountOAuthToken_2000', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_2000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_2000 addAccount start====");
            await appAccountManager.addAccount("account_promise_noExitToken");
            console.info("====>deleteOAuthToken ActsAccountOAuthToken_2000 start====");
            await appAccountManager.deleteOAuthToken("account_promise_noExitToken",OWNERSELF,"aythType","test_token").catch((err)=>{
            console.info("====>deleteOAuthToken ActsAccountOAuthToken_2000 err:" + JSON.stringify(err));
            });
            console.info("====>getOAuthToken ActsAccountOAuthToken_2000 start====");
            try{
                var data = await appAccountManager.getOAuthToken("account_promise_noExitToken",OWNERSELF,"authType");
            }
            catch(err){
                console.info("====>getOAuthToken ActsAccountOAuthToken_2000 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountOAuthToken_2000 deleteAccount start====");
                await appAccountManager.deleteAccount("account_promise_noExitToken");
                console.info("====>ActsAccountOAuthToken_2000 end====");
                done();
            }
        });


        it('ActsAccountOAuthToken_2100', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_2100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_callback_repeatDelete", (err)=>{
            console.info("====>addAccount ActsAccountOAuthToken_2100 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_repeatDelete","authType","",(err)=>{
                    console.info("====>getOAuthToken ActsAccountOAuthToken_2100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteOAuthToken("account_callback_repeatDelete",OWNERSELF,"aythType","promise_repeatDelete_token",(err)=>{
                        console.info("====>deleteOAuthToken first ActsAccountOAuthToken_2100 err:" + JSON.stringify(err));
                        appAccountManager.getOAuthToken("account_callback_repeatDelete",OWNERSELF,"authType", (err, data)=>{
                            console.info("====>getOAuthToken first ActsAccountOAuthToken_2100 err:" + JSON.stringify(err));
                            console.info("====>getOAuthToken first ActsAccountOAuthToken_2100 data:" + data);
                            expect(err.code != 0).assertEqual(true);
                            expect(data).assertEqual(null);
                            appAccountManager.deleteOAuthToken("account_callback_repeatDelete",OWNERSELF,"aythType","promise_repeatDelete_token",(err)=>{
                                console.info("====>deleteOAuthToken second ActsAccountOAuthToken_2100 err:" + JSON.stringify(err));
                                appAccountManager.getOAuthToken("account_callback_repeatDelete",OWNERSELF,"authType", (err, data)=>{
                                    console.info("====>getOAuthToken second ActsAccountOAuthToken_2100 err:" + JSON.stringify(err));
                                    console.info("====>getOAuthToken second ActsAccountOAuthToken_2100 data:" + data);
                                    expect(err.code != 0).assertEqual(true);
                                    expect(data).assertEqual(null);
                                    appAccountManager.deleteAccount("account_callback_repeatDelete", (err)=>{
                                        console.info("====>deleteAccount ActsAccountOAuthToken_2100 err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        console.info("====>ActsAccountOAuthToken_2100 end====");
                                        done();
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });



        it('ActsAccountOAuthToken_2200', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_2200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_2200 addAccount start====");
            await appAccountManager.addAccount("account_promise_repeatDelete");
            console.info("====>setOAuthToken ActsAccountOAuthToken_2200 start====");
            await appAccountManager.setOAuthToken("account_promise_repeatDelete","authType","promise_repeatDelete_token");
            console.info("====>deleteOAuthToken first ActsAccountOAuthToken_2200 start====");
            await appAccountManager.deleteOAuthToken("account_promise_repeatDelete",OWNERSELF,"authType","promise_repeatDelete_token");
            try{
                console.info("====>deleteOAuthToken second ActsAccountOAuthToken_2200 start====");
                await appAccountManager.deleteOAuthToken("account_promise_repeatDelete",OWNERSELF,"authType","promise_repeatDelete_token");
            }catch(err){
                console.info("====>deleteOAuthToken second ActsAccountOAuthToken_2200 err:" + JSON.stringify(err));
                expect(err.code != 0 ).assertEqual(true);
                done();
            }  
            try{
                var data = await appAccountManager.getOAuthToken("account_promise_repeatDelete",OWNERSELF,"authType");
            }
            catch(err){
                console.info("====>getOAuthToken ActsAccountOAuthToken_2200 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountOAuthToken_2200 deleteAccount start====");
                await appAccountManager.deleteAccount("account_promise_repeatDelete");
                console.info("====>ActsAccountOAuthToken_2200 end====");
                done();
            }
        });


        it('ActsAccountOAuthToken_2300', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_2300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_callback_setEmptyToken", (err)=>{
            console.info("====>addAccount ActsAccountOAuthToken_2300 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_setEmptyToken","authType","",(err)=>{
                    console.info("====>getOAuthToken ActsAccountOAuthToken_2300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getOAuthToken("account_callback_setEmptyToken",OWNERSELF,"authType", (err, data)=>{
                        console.info("====>getOAuthToken ActsAccountOAuthToken_2300 err:" + JSON.stringify(err));
                        console.info("====>getOAuthToken ActsAccountOAuthToken_2300 data:" + data);
                        expect(err.code != 0).assertEqual(true);
                        expect(data).assertEqual(null);
                        appAccountManager.deleteAccount("account_callback_setEmptyToken", (err)=>{
                            console.info("====>deleteAccount ActsAccountOAuthToken_2300 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountOAuthToken_2300 end====");
                            done();
                        });
                    });
                });
            });
        });


        it('ActsAccountOAuthToken_2400', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_2400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_2400 addAccount start====");
            await appAccountManager.addAccount("account_promise_setEmptyToken");
            console.info("====>setOAuthToken ActsAccountOAuthToken_2400 start====");
            await appAccountManager.setOAuthToken("account_promise_setEmptyToken","aythType","");
            console.info("====>getOAuthToken ActsAccountOAuthToken_2400 start====");
            try{
                await appAccountManager.getOAuthToken("account_promise_setEmptyToken","authType",limitToken);
            }
            catch(err){
                console.info("====>getOAuthToken ActsAccountOAuthToken_2400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountOAuthToken_2400 deleteAccount start====");
                await appAccountManager.deleteAccount("account_promise_setEmptyToken");
                console.info("====>ActsAccountOAuthToken_2400 end====");
                done();
            }
        });



        it('ActsAccountOAuthToken_2500', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_2500 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_callback_spaceToken", (err)=>{
            console.info("====>addAccount ActsAccountOAuthToken_2500 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_spaceToken","authType"," ",(err)=>{
                    console.info("====>getOAuthToken ActsAccountOAuthToken_2500 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getOAuthToken("account_callback_spaceToken",OWNERSELF,"authType", (err, data)=>{
                        console.info("====>getOAuthToken ActsAccountOAuthToken_2500 err:" + JSON.stringify(err));
                        console.info("====>getOAuthToken ActsAccountOAuthToken_2500 data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual(" ");
                        appAccountManager.deleteAccount("account_callback_spaceToken", (err)=>{
                            console.info("====>deleteAccount ActsAccountOAuthToken_2500 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountOAuthToken_2500 end====");
                            done();
                        });
                    });
                });
            });
        });


        it('ActsAccountOAuthToken_2600', 0, async function(done) {
            console.info("====>ActsAccountOAuthToken_2600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_2600 addAccount start====");
            await appAccountManager.addAccount("account_promise_spaceToken");
            console.info("====>setOAuthToken ActsAccountOAuthToken_2600 start====");
            await appAccountManager.setOAuthToken("account_promise_spaceToken","aythType"," ");
            console.info("====>getOAuthToken ActsAccountOAuthToken_2600 start====");
            var data = await appAccountManager.getOAuthToken("account_promise_spaceToken",OWNERSELF,"aythType");
            expect(data).assertEqual(" ");
            console.info("====>ActsAccountOAuthToken_2600 deleteAccount start====");
            await appAccountManager.deleteAccount("account_promise_spaceToken");
            console.info("====>ActsAccountOAuthToken_2600 end====");
            done();
        });



        it('ActsAccountOAuthToken_2700', 0, async function(done) {
            var limitToken = '';
                for (let i = 0; i < TOKENLENGTHLIMIT + 1; i++) {
                    limitToken += 't';
                }
            console.info("====>ActsAccountOAuthToken_2700 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_callback_exceed_limitToken", (err)=>{
            console.info("====>addAccount ActsAccountOAuthToken_2700 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_exceed_limitToken","authType",limitToken,(err)=>{
                    console.info("====>getOAuthToken ActsAccountOAuthToken_2700 err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    appAccountManager.deleteAccount("account_callback_exceed_limitToken", (err)=>{
                        console.info("====>deleteAccount ActsAccountOAuthToken_2700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountOAuthToken_2700 end====");
                        done();
                    });
                });
            });
        });


        it('ActsAccountOAuthToken_2800', 0, async function(done) {
            var limitToken = '';
                for (let i = 0; i < TOKENLENGTHLIMIT + 1; i++) {
                    limitToken += 't';
                }
            console.info("====>ActsAccountOAuthToken_2800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_2800 addAccount start====");
            await appAccountManager.addAccount("account_promise_exceed_limitToken");
            console.info("====>setOAuthToken ActsAccountOAuthToken_2800 start====");
            try{
                await appAccountManager.setOAuthToken("account_promise_exceed_limitToken","authType",limitToken);
            }
            catch(err){
                console.info("====>setOAuthToken ActsAccountOAuthToken_2800 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountOAuthToken_2800 deleteAccount start====");
                appAccountManager.deleteAccount("account_promise_exceed_limitToken");
                console.info("====>ActsAccountOAuthToken_2800 end====");
                done();
            }
        });


        it('ActsAccountOAuthToken_2900', 0, async function(done) {
            var limitToken = '';
                for (let i = 0; i < TOKENLENGTHLIMIT; i++) {
                    limitToken += 't';
                }
            console.info("====>ActsAccountOAuthToken_2900 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_callback_limitToken", (err)=>{
            console.info("====>addAccount ActsAccountOAuthToken_2900 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_limitToken","authType",limitToken,(err)=>{
                    console.info("====>getOAuthToken ActsAccountOAuthToken_2900 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getOAuthToken("account_callback_limitToken",OWNERSELF,"authType", (err, data)=>{
                        console.info("====>getOAuthToken ActsAccountOAuthToken_2900 err:" + JSON.stringify(err));
                        console.info("====>getOAuthToken ActsAccountOAuthToken_2900 data:" + data);
                        expect(err).assertEqual(null);
                        expect(data).assertEqual(limitToken);
                        appAccountManager.deleteAccount("account_callback_limitToken", (err)=>{
                            console.info("====>deleteAccount ActsAccountOAuthToken_2900 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountOAuthToken_2900 end====");
                            done();
                        });
                    });
                });
            });
        });


        it('ActsAccountOAuthToken_3000', 0, async function(done) {
            var limitToken = '';
                for (let i = 0; i < TOKENLENGTHLIMIT; i++) {
                    limitToken += 't';
                }
            console.info("====>ActsAccountOAuthToken_3000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_3000 addAccount start====");
            await appAccountManager.addAccount("account_promise_limitToken");
            console.info("====>setOAuthToken ActsAccountOAuthToken_3000 start====");
            await appAccountManager.setOAuthToken("account_promise_limitToken","authType",limitToken);
            console.info("====>getOAuthToken ActsAccountOAuthToken_3000 start====");
            var data = await appAccountManager.getOAuthToken("account_promise_limitToken",OWNERSELF,"authType");
            expect(data).assertEqual(limitToken);
            console.info("====>ActsAccountOAuthToken_3000 deleteAccount start====");
            await appAccountManager.deleteAccount("account_promise_limitToken");
            console.info("====>ActsAccountOAuthToken_3000 end====");
            done();
        });


        it('ActsAccountOAuthToken_3100', 0, async function(done) {
            var limitAuthType = '';
                for (let i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
                    limitAuthType += 't';
                }
            console.info("====>ActsAccountOAuthToken_3100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_callback_limitAuthType", (err)=>{
            console.info("====>addAccount ActsAccountOAuthToken_3100 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.setOAuthToken("account_callback_limitAuthType",limitAuthType,"account_callback_limitAuthType_token",(err, data)=>{
                    console.info("====>getOAuthToken ActsAccountOAuthToken_3100 err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    appAccountManager.deleteAccount("account_callback_limitAuthType", (err)=>{
                        console.info("====>deleteAccount ActsAccountOAuthToken_3100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountOAuthToken_3100 end====");
                        done();
                    });
                });
            });
        });


        it('ActsAccountOAuthToken_3200', 0, async function(done) {
            var limitAuthType = '';
                for (let i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
                    limitAuthType += 't';
                }
            console.info("====>ActsAccountOAuthToken_3400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_3400 addAccount start====");
            await appAccountManager.addAccount("account_promise_exceed_limitAuthType");
            console.info("====>setOAuthToken ActsAccountOAuthToken_3400 start====");
            try{
                await appAccountManager.setOAuthToken("account_promise_exceed_limitAuthType",limitAuthType,"account_promise_limitAuthType_token");
            }
            catch(err){
                console.info("====>setOAuthToken ActsAccountOAuthToken_3400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountOAuthToken_3400 deleteAccount start====");
                appAccountManager.deleteAccount("account_promise_exceed_limitAuthType");
                console.info("====>ActsAccountOAuthToken_3400 end====");
                done();
            }
        });



        it('ActsAccountOAuthToken_3300', 0, async function(done) {
            var limitAuthType = '';
                for (let i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
                    limitAuthType += 't';
                }
            console.info("====>ActsAccountOAuthToken_3300 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount("account_callback_limitAuthType", (err)=>{
            console.info("====>addAccount ActsAccountOAuthToken_3300 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
                appAccountManager.getOAuthToken("account_callback_limitAuthType","com.example.actsaccounttest",limitAuthType, (err, data)=>{
                    console.info("====>getOAuthToken ActsAccountOAuthToken_3300 err:" + JSON.stringify(err));
                    console.info("====>getOAuthToken ActsAccountOAuthToken_3300 data:" + data);
                    expect(err.code!=0).assertEqual(true);
                    appAccountManager.deleteAccount("account_callback_limitAuthType", (err)=>{
                        console.info("====>deleteAccount ActsAccountOAuthToken_3300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountOAuthToken_3300 end====");
                        done();
                    });
                });
            });
        });

        it('ActsAccountOAuthToken_3400', 0, async function(done) {
            var limitAuthType = '';
                for (let i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
                    limitAuthType += 't';
                }
            console.info("====>ActsAccountOAuthToken_3400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOAuthToken_3400 addAccount start====");
            await appAccountManager.addAccount("account_promise_limitAuthType");
            console.info("====>getOAuthToken ActsAccountOAuthToken_3400 start====");
            try{
                await appAccountManager.getOAuthToken("account_promise_limitAuthType",OWNERSELF,limitAuthType);
            }
            catch(err){
                console.info("====>getOAuthToken ActsAccountOAuthToken_3400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountOAuthToken_3400 deleteAccount start====");
                appAccountManager.deleteAccount("account_promise_limitAuthType");
                console.info("====>ActsAccountOAuthToken_3400 end====");
                done();
            }
        });



            /*
        * @tc.number     : ActsAccountOAuthToken_2700
        * @tc.name       : Test oauth token in callback form
        * @tc.desc       : 设置一个authType长度刚好为限制长度的token  查询
        */
            it('ActsAccountOAuthToken_3500', 0, async function(done) {
                console.info("====>ActsAccountOAuthToken_3500 start====");
                var limitAuthType = '';
                for (let i = 0; i < AUTHTYPELENGTHLIMIT; i++) {
                    limitAuthType += 't';
                }
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_3500 create finish====");
                appAccountManager.addAccount("account_callback_limitAuthType", (err)=>{
                    console.info("====>add account ActsAccountOAuthToken_3500 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_limitAuthType",limitAuthType,"account_callback_limitAuthType_token", (err)=>{
                        console.info("====>setOAuthToken ActsAccountOAuthToken_3500 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getOAuthToken("account_callback_limitAuthType","com.example.actsaccounttest",limitAuthType, (err, data)=>{
                            console.info("====>getOAuthToken ActsAccountOAuthToken_3500 err:" + JSON.stringify(err));
                            console.info("====>getOAuthToken ActsAccountOAuthToken_3500 data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("account_callback_limitAuthType_token");
                            appAccountManager.deleteAccount("account_callback_limitAuthType", (err)=>{
                                console.info("====>delete Account ActsAccountOAuthToken_3500 err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_3500 end====");
                                done();
                            });
                        });
                    });
                });
            });
            
            /*
            * @tc.number     : ActsAccountOAuthToken_2800
            * @tc.name       : Test oauth token in promise form
            * @tc.desc       : 设置一个authType长度刚好为限制长度的token
            */
            
            /*
            * @tc.number     : ActsAccountOAuthToken_2900
            * @tc.name       : Test oauth token in callback form
            * @tc.desc       : Clear token parameter name is an empty string
            */
            //测试 删除一个账号名为空的token callback方式
            it('ActsAccountOAuthToken_4100', 0, async function(done) {
                console.info("====>ActsAccountOAuthToken_4100 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_4100 create finish====");
                appAccountManager.deleteOAuthToken(" ","com.example.actsaccounttest","authType","account_notExist_token", (err)=>{
                    console.info("====>clearOAuthToken ActsAccountOAuthToken_4100 err:" + JSON.stringify(err));
                    expect(err.code != 0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_4100 end====");
                    done();
                });
            });
            
            /*
            * @tc.number     : ActsAccountOAuthToken_3000
            * @tc.name       : Test oauth token in promise form
            * @tc.desc       : Clear token parameter name is an empty string
            */
            //测试 删除一个账号名为空的token promise方式
            it('ActsAccountOAuthToken_4200', 0, async function(done) {
                console.info("====>ActsAccountOAuthToken_4200 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_4200 create finish====");
                console.info("====>clearOAuthToken ActsAccountOAuthToken_4200 start====");
                try{
                    await appAccountManager.deleteOAuthToken("","com.example.actsaccounttest","authType","account_notExist_token");
                }
                catch(err){
                    console.info("====>deleteOAuthToken ActsAccountOAuthToken_4200 err:" + JSON.stringify(err));
                    expect(err.code != 0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_4200 end====");
                    done();
                }
            });
            
            /*
            * @tc.number     : ActsAccountOAuthToken_3100
            * @tc.name       : Test oauth token in callback form
            * @tc.desc       : The clear token parameter name is a space string
            */
            it('ActsAccountOAuthToken_4300', 0, async function(done) {
                console.info("====>ActsAccountOAuthToken_4300 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_4300 create finish====");
                appAccountManager.deleteOAuthToken(" ","com.example.actsaccounttest","authType","account_notExist_token", (err)=>{
                    console.info("====>clearOAuthToken ActsAccountOAuthToken_4300 err:" + JSON.stringify(err));
                    expect(err.code != 0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_4300 end====");
                    done();
                });
            });
            
            /*
            * @tc.number     : ActsAccountOAuthToken_3200
            * @tc.name       : Test oauth token in promise form
            * @tc.desc       : The clear token parameter name is a space string
            */
            it('ActsAccountOAuthToken_4400', 0, async function(done) {
                console.info("====>ActsAccountOAuthToken_4400 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_4400 create finish====");
                console.info("====>clearOAuthToken ActsAccountOAuthToken_4400 start====");
                try{
                    await appAccountManager.deleteOAuthToken(" ","com.example.actsaccounttest","authType","account_notExist_token");
                }
                catch(err){
                    console.info("====>deleteOAuthToken ActsAccountOAuthToken_4400 err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_4400 end====");
                    done();
                }
            });
        
            /*
            * @tc.number     : ActsAccountOAuthToken_3300
            * @tc.name       : Test oauth token in callback form
            * @tc.desc       : Clear the token parameter name exceeds the length limit of 1024 characters
            */
            it('ActsAccountOAuthToken_4500', 0, async function(done) {
                console.info("====>ActsAccountOAuthToken_4500 start====");
                var nameLimit = '';
                for (let i = 0; i < LENGTHLIMIT + 1; i++) {
                    nameLimit += 't';
                }
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_4500 create finish====");
                appAccountManager.deleteOAuthToken(nameLimit,"com.example.actsaccounttest","authType","account_notExist_token", (err)=>{
                    console.info("====>clearOAuthToken ActsAccountOAuthToken_4500 err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_4500 end====");
                    done();
                });
            });
        
            /*
            * @tc.number     : ActsAccountOAuthToken_3400
            * @tc.name       : Test oauth token in promise form
            * @tc.desc       : Clear the token parameter name exceeds the length limit of 1024 characters
            */
            it('ActsAccountOAuthToken_4600', 0, async function(done) {
                console.info("====>ActsAccountOAuthToken_4600 start====");
                var nameLimit = '';
                for (let i = 0; i < LENGTHLIMIT + 1; i++) {
                    nameLimit += 't';
                }
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_4600 create finish====");
                console.info("====>deleteOAuthToken ActsAccountOAuthToken_4600 start====");
                try{
                    await appAccountManager.deleteOAuthToken(nameLimit,"com.example.actsaccounttest","authType","account_notExist_token");
                }
                catch(err){
                    console.info("====>deleteOAuthToken ActsAccountOAuthToken_4600 err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_4600 end====");
                    done();
                }
            });
        
            //查询无效包名owner（为其他字符串时）账号的token callback方式
            it('ActsAccountOAuthToken_4700', 0, async function(done) {
                console.info("====>ActsAccountOAuthToken_4700 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_4700 create finish====");
                appAccountManager.addAccount("account_callback_invalid_owner", (err)=>{
                    console.info("====>add account ActsAccountOAuthToken_4700 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getOAuthToken("account_callback_invalid_owner","invalid_owner","authType", (err, data)=>{
                        console.info("====>getOAuthToken ActsAccountOAuthToken_4700 err:" + JSON.stringify(err));
                        console.info("====>getOAuthToken ActsAccountOAuthToken_4700 data:" + data);
                        expect(err.code!=0).assertEqual(true);
                        expect(data).assertEqual(null);
                        appAccountManager.deleteAccount("account_callback_invalid_owner", (err)=>{
                            console.info("====>delete account ActsAccountOAuthToken_4700 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountOAuthToken_4700 end====");
                            done();
                        });
                    });
                });
            });


            it('ActsAccountOAuthToken_3600', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_3600 start====");
                var limitAuthType = '';
                for (var i = 0; i < AUTHTYPELENGTHLIMIT; i++) {
                    limitAuthType += 't';
                }
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_3600 addAccount start====");
                await appAccountManager.addAccount("account_promise_limitAuthType");
                console.info("====>ActsAccountOAuthToken_3600 setOAuthToken start====");
                await appAccountManager.setOAuthToken("account_promise_limitAuthType",limitAuthType,"account_promise_limitAuthType_token");
                console.info("====>ActsAccountOAuthToken_3600 getOAuthToken start====");
                var data = await appAccountManager.getOAuthToken("account_promise_limitAuthType",OWNERSELF,limitAuthType);
                expect(data).assertEqual("account_promise_limitAuthType_token");
                console.info("====>ActsAccountOAuthToken_3600 deleteAccount start====");
                await appAccountManager.deleteAccount("account_promise_limitAuthType");
                console.info("====>ActsAccountOAuthToken_3600 end====");
                done();
            });
        
            
            it('ActsAccountOAuthToken_3700', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_3700 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_3700 addAccount start====");
                appAccountManager.addAccount("account_callback_authType_empty",(err)=>{
                    console.info("====>ActsAccountOAuthToken_3700 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_authType_empty","","account_callback_authType_empty_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_3700 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getOAuthToken("account_callback_authType_empty",OWNERSELF,"",(err,data)=>{
                            console.info("====>ActsAccountOAuthToken_3700 getOAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_3700 getOAuthToken data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("account_callback_authType_empty_token");
                            appAccountManager.deleteAccount("account_callback_authType_empty",(err)=>{
                                console.info("====>ActsAccountOAuthToken_3700 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_3700 end====");
                                done();
                            });
                        });
                    });
                });
            });
            
            it('ActsAccountOAuthToken_3800', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_3800 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_3800 addAccount start====");
                await appAccountManager.addAccount("account_promise_authType_empty");
                console.info("====>ActsAccountOAuthToken_3800 setOAuthToken start====");
                await appAccountManager.setOAuthToken("account_promise_authType_empty","","account_promise_authType_empty_token");
                console.info("====>ActsAccountOAuthToken_3800 getOAuthToken start====");
                var data = await appAccountManager.getOAuthToken("account_promise_authType_empty",OWNERSELF,"");
                expect(data).assertEqual("account_promise_authType_empty_token");
                console.info("====>ActsAccountOAuthToken_3800 deleteAccount start====");
                await appAccountManager.deleteAccount("account_promise_authType_empty");
                console.info("====>ActsAccountOAuthToken_3800 end====");
                done();
            });
        
            it('ActsAccountOAuthToken_3900', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_3900 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_3900 addAccount start====");
                appAccountManager.addAccount("account_callback_authType_space",(err)=>{
                    console.info("====>ActsAccountOAuthToken_3900 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_authType_space"," ","account_callback_authType_space_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_3900 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getOAuthToken("account_callback_authType_space",OWNERSELF," ",(err,data)=>{
                            console.info("====>ActsAccountOAuthToken_3900 getOAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_3900 getOAuthToken data:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("account_callback_authType_space_token");
                            appAccountManager.deleteAccount("account_callback_authType_space",(err)=>{
                                console.info("====>ActsAccountOAuthToken_3900 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_3900 end====");
                                done();
                            });
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_4000', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_4000 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_4000 addAccount start====");
                await appAccountManager.addAccount("account_promise_authType_space");
                console.info("====>ActsAccountOAuthToken_4000 setOAuthToken start====");
                await appAccountManager.setOAuthToken("account_promise_authType_space"," ","account_promise_authType_space_token");
                console.info("====>ActsAccountOAuthToken_4000 getOAuthToken start====");
                var data = await appAccountManager.getOAuthToken("account_promise_authType_space",OWNERSELF," ");
                expect(data).assertEqual("account_promise_authType_space_token");
                console.info("====>ActsAccountOAuthToken_4000 deleteAccount start====");
                await appAccountManager.deleteAccount("account_promise_authType_space");
                console.info("====>ActsAccountOAuthToken_4000 end====");
                done();
            });
        
        
            it('ActsAccountOAuthToken_4800', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_4800 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_4800 addAccount start====");
                await appAccountManager.addAccount("account_promise_invalid_owner");
                console.info("====>ActsAccountOAuthToken_4800 getOAuthToken start====");
                try{
                    var data = await appAccountManager.getOAuthToken("account_promise_invalid_owner","invalid_owner","authType");
                }
                catch(err){
                    console.info("====>ActsAccountOAuthToken_4800 getOAuthToken err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_4800 deleteAccount start====");
                    await appAccountManager.deleteAccount("account_promise_invalid_owner");
                    console.info("====>ActsAccountOAuthToken_4800 end====");
                    done();
                }
            });
        
            it('ActsAccountOAuthToken_4900', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_4900 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_4900 addAccount start====");
                appAccountManager.addAccount("account_callback_owner_empty",(err)=>{
                    console.info("====>ActsAccountOAuthToken_4900 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getOAuthToken("account_callback_owner_empty","","authType",(err,data)=>{
                        console.info("====>ActsAccountOAuthToken_4900 getOAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountOAuthToken_4900 getOAuthToken data:" + data);
                        expect(err.code!=0).assertEqual(true);
                        expect(data).assertEqual(null);
                        appAccountManager.deleteAccount("account_callback_owner_empty",(err)=>{
                            console.info("====>ActsAccountOAuthToken_4900 deleteAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountOAuthToken_4900 end====");
                            done();
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_5000', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_5000 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_5000 addAccount start====");
                await appAccountManager.addAccount("account_promise_owner_empty");
                console.info("====>ActsAccountOAuthToken_5000 getOAuthToken start====");
                try{
                    var data = await appAccountManager.getOAuthToken("account_promise_owner_empty","","authType");
                }
                catch(err){
                    console.info("====>ActsAccountOAuthToken_5000 getOAuthToken err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_5000 deleteAccount start====");
                    await appAccountManager.deleteAccount("account_promise_owner_empty");
                    console.info("====>ActsAccountOAuthToken_5000 end====");
                    done();
                }
            });
        
            it('ActsAccountOAuthToken_5100', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_5100 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_5100 addAccount start====");
                appAccountManager.addAccount("account_callback_owner_space",(err)=>{
                    console.info("====>ActsAccountOAuthToken_5100 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getOAuthToken("account_callback_owner_space"," ","authType",(err,data)=>{
                        console.info("====>ActsAccountOAuthToken_5100 getOAuthToken err:" + JSON.stringify(err));
                        console.info("====>ActsAccountOAuthToken_5100 getOAuthToken data:" + data);
                        expect(err.code!=0).assertEqual(true);
                        expect(data).assertEqual(null);
                        appAccountManager.deleteAccount("account_callback_owner_space",(err)=>{
                            console.info("====>ActsAccountOAuthToken_5100 deleteAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountOAuthToken_5100 end====");
                            done();
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_5200', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_5200 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_5200 addAccount start====");
                await appAccountManager.addAccount("account_callback_owner_space");
                console.info("====>ActsAccountOAuthToken_5200 getOAuthToken start====");
                try{
                    var data = await appAccountManager.getOAuthToken("account_callback_owner_space"," ","authType");
                }
                catch(err){
                    console.info("====>ActsAccountOAuthToken_5200 getOAuthToken err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_5200 deleteAccount start====");
                    await appAccountManager.deleteAccount("account_callback_owner_space");
                    console.info("====>ActsAccountOAuthToken_5200 end====");
                    done();
                }
            });
        
            it('ActsAccountOAuthToken_5300', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_5300 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_5300 addAccount start====");
                appAccountManager.addAccount("account_callback_authType_invalid",(err)=>{
                    console.info("====>ActsAccountOAuthToken_5300 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_authType_invalid","authType","account_callback_authType_invalid_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_5300 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getOAuthToken("account_callback_authType_invalid",OWNERSELF,"invalid_authType",(err,data)=>{
                            console.info("====>ActsAccountOAuthToken_5300 getOAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_5300 getOAuthToken data:" + data);
                            expect(err.code!=0).assertEqual(true);
                            expect(data).assertEqual(null);
                            appAccountManager.deleteAccount("account_callback_authType_invalid",(err)=>{
                                console.info("====>ActsAccountOAuthToken_5300 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_5300 end====");
                                done();
                            });
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_5400', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_5400 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_5400 addAccount start====");
                await appAccountManager.addAccount("account_promise_authType_invalid");
                console.info("====>ActsAccountOAuthToken_5400 setOAuthToken start====");
                await appAccountManager.setOAuthToken("account_promise_authType_invalid","authType","account_promise_authType_invalid_token");
                console.info("====>ActsAccountOAuthToken_5400 getOAuthToken start====");
                try{
                    var data = await appAccountManager.getOAuthToken("account_promise_authType_invalid",OWNERSELF,"invalid_authType");
                }
                catch(err){
                    console.info("====>ActsAccountOAuthToken_5400 getOAuthToken err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_5400 deleteAccount start====");
                    await appAccountManager.deleteAccount("account_promise_authType_invalid");
                    console.info("====>ActsAccountOAuthToken_5400 end====");
                    done();
                }
            });
        
            it('ActsAccountOAuthToken_5500', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_5500 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_5500 addAccount start====");
                appAccountManager.addAccount("account_callback_authType_empty",(err)=>{
                    console.info("====>ActsAccountOAuthToken_5500 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_authType_empty","authType","account_callback_authType_empty_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_5500 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getOAuthToken("account_callback_authType_empty",OWNERSELF,"",(err,data)=>{
                            console.info("====>ActsAccountOAuthToken_5500 getOAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_5500 getOAuthToken data:" + data);
                            expect(err.code!=0).assertEqual(true);
                            expect(data).assertEqual(null);
                            appAccountManager.deleteAccount("account_callback_authType_empty",(err)=>{
                                console.info("====>ActsAccountOAuthToken_5500 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_5500 end====");
                                done();
                            });
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_5600', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_5600 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_5600 addAccount start====");
                await appAccountManager.addAccount("account_promise_authType_empty");
                console.info("====>ActsAccountOAuthToken_5600 setOAuthToken start====");
                await appAccountManager.setOAuthToken("account_promise_authType_empty","authType","account_promise_authType_empty_token");
                console.info("====>ActsAccountOAuthToken_5600 getOAuthToken start====");
                try{
                    var data = await appAccountManager.getOAuthToken("account_promise_authType_empty",OWNERSELF,"");
                }
                catch(err){
                    console.info("====>ActsAccountOAuthToken_5600 getOAuthToken err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_5600 deleteAccount start====");
                    await appAccountManager.deleteAccount("account_promise_authType_empty");
                    console.info("====>ActsAccountOAuthToken_5600 end====");
                    done();
                }
            });
        
            it('ActsAccountOAuthToken_5700', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_5700 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_5700 addAccount start====");
                appAccountManager.addAccount("account_callback_authType_space",(err)=>{
                    console.info("====>ActsAccountOAuthToken_5700 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_authType_space","authType","account_callback_authType_space_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_5700 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getOAuthToken("account_callback_authType_space",OWNERSELF," ",(err,data)=>{
                            console.info("====>ActsAccountOAuthToken_5700 getOAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_5700 getOAuthToken data:" + data);
                            expect(err.code!=0).assertEqual(true);
                            expect(data).assertEqual(null);
                            appAccountManager.deleteAccount("account_callback_authType_space",(err)=>{
                                console.info("====>ActsAccountOAuthToken_5700 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_5700 end====");
                                done();
                            });
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_5800', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_5800 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_5800 addAccount start====");
                await appAccountManager.addAccount("account_promise_authType_space");
                console.info("====>ActsAccountOAuthToken_5800 setOAuthToken start====");
                await appAccountManager.setOAuthToken("account_promise_authType_space","authType","account_promise_authType_space_token");
                console.info("====>ActsAccountOAuthToken_5800 getOAuthToken start====");
                try{
                    var data = await appAccountManager.getOAuthToken("account_promise_authType_space",OWNERSELF," ");
                }
                catch(err){
                    console.info("====>ActsAccountOAuthToken_5800 getOAuthToken err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_5800 deleteAccount start====");
                    await appAccountManager.deleteAccount("account_promise_authType_space");
                    console.info("====>ActsAccountOAuthToken_5800 end====");
                    done();
                }
            });
        
            it('ActsAccountOAuthToken_5900', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_5900 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_5900 addAccount start====");
                appAccountManager.addAccount("account_callback_owner_invalid",(err)=>{
                    console.info("====>ActsAccountOAuthToken_5900 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_owner_invalid","authType","account_callback_owner_invalid_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_5900 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.deleteOAuthToken("account_callback_owner_invalid","invalid_owner","authType","account_callback_owner_invalid_token",(err)=>{
                            console.info("====>ActsAccountOAuthToken_5900 getOAuthToken err:" + JSON.stringify(err));
                            expect(err.code!=0).assertEqual(true);
                            appAccountManager.deleteAccount("account_callback_owner_invalid",(err)=>{
                                console.info("====>ActsAccountOAuthToken_5900 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_5900 end====");
                                done();
                            });
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_6000', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_6000 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_6000 addAccount start====");
                await appAccountManager.addAccount("account_promise_owner_invalid");
                console.info("====>ActsAccountOAuthToken_6000 setOAuthToken start====");
                await appAccountManager.setOAuthToken("account_promise_owner_invalid","authType","account_promise_owner_invalid_token");
                console.info("====>ActsAccountOAuthToken_6000 getOAuthToken start====");
                try{
                    await appAccountManager.deleteOAuthToken("account_promise_owner_invalid","invalid_owner","authType","account_promise_owner_invalid_token");
                }
                catch(err){
                    console.info("====>ActsAccountOAuthToken_6000 getOAuthToken err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_6000 deleteAccount start====");
                    await appAccountManager.deleteAccount("account_promise_owner_invalid");
                    console.info("====>ActsAccountOAuthToken_6000 end====");
                    done();
                }
            });
        
            it('ActsAccountOAuthToken_6100', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_6100 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_6100 addAccount start====");
                appAccountManager.addAccount("account_callback_owner_empty",(err)=>{
                    console.info("====>ActsAccountOAuthToken_6100 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_owner_empty","authType","account_callback_owner_empty_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_6100 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.deleteOAuthToken("account_callback_owner_empty","","authType","account_callback_owner_empty_token",(err)=>{
                            console.info("====>ActsAccountOAuthToken_6100 getOAuthToken err:" + JSON.stringify(err));
                            expect(err.code!=0).assertEqual(true);
                            appAccountManager.deleteAccount("account_callback_owner_empty",(err)=>{
                                console.info("====>ActsAccountOAuthToken_6100 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_6100 end====");
                                done();
                            });
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_6200', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_6200 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_6200 addAccount start====");
                await appAccountManager.addAccount("account_promise_owner_empty");
                console.info("====>ActsAccountOAuthToken_6200 setOAuthToken start====");
                await appAccountManager.setOAuthToken("account_promise_owner_empty","authType","account_promise_owner_empty_token");
                console.info("====>ActsAccountOAuthToken_6200 getOAuthToken start====");
                try{
                    await appAccountManager.deleteOAuthToken("account_promise_owner_empty","","authType","account_promise_owner_empty_token");
                }
                catch(err){
                    console.info("====>ActsAccountOAuthToken_6200 getOAuthToken err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_6200 deleteAccount start====");
                    await appAccountManager.deleteAccount("account_promise_owner_empty");
                    console.info("====>ActsAccountOAuthToken_6200 end====");
                    done();
                }
            });
        
            it('ActsAccountOAuthToken_6300', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_6300 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_6300 addAccount start====");
                appAccountManager.addAccount("account_callback_owner_space",(err)=>{
                    console.info("====>ActsAccountOAuthToken_6300 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_owner_space","authType","account_callback_owner_space_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_6300 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.deleteOAuthToken("account_callback_owner_space"," ","authType","account_callback_owner_space_token",(err)=>{
                            console.info("====>ActsAccountOAuthToken_6300 getOAuthToken err:" + JSON.stringify(err));
                            expect(err.code!=0).assertEqual(true);
                            appAccountManager.deleteAccount("account_callback_owner_space",(err)=>{
                                console.info("====>ActsAccountOAuthToken_6300 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_6300 end====");
                                done();
                            });
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_6400', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_6400 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_6400 addAccount start====");
                await appAccountManager.addAccount("account_promise_owner_space");
                console.info("====>ActsAccountOAuthToken_6400 setOAuthToken start====");
                await appAccountManager.setOAuthToken("account_promise_owner_space","authType","account_promise_owner_space_token");
                console.info("====>ActsAccountOAuthToken_6400 getOAuthToken start====");
                try{
                    await appAccountManager.deleteOAuthToken("account_promise_owner_space"," ","authType","account_promise_owner_space_token");
                }
                catch(err){
                    console.info("====>ActsAccountOAuthToken_6400 getOAuthToken err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_6400 deleteAccount start====");
                    await appAccountManager.deleteAccount("account_promise_owner_space");
                    console.info("====>ActsAccountOAuthToken_6400 end====");
                    done();
                }
            });
        
            it('ActsAccountOAuthToken_6500', 0, async function (done) {
                var limitToken = '';
                for(var i = 0;i < TOKENLENGTHLIMIT + 1; i++){
                    limitToken += 'c';
                }
                console.info("====>ActsAccountOAuthToken_6500 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_6500 addAccount start====");
                appAccountManager.addAccount("account_callback_token_exceedLimit",(err)=>{
                    console.info("====>ActsAccountOAuthToken_6500 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.deleteOAuthToken("account_callback_token_exceedLimit",OWNERSELF,"authType",limitToken,(err)=>{
                        console.info("====>ActsAccountOAuthToken_6500 getOAuthToken err:" + JSON.stringify(err));
                        expect(err.code!=0).assertEqual(true);
                        appAccountManager.deleteAccount("account_callback_token_exceedLimit",(err)=>{
                            console.info("====>ActsAccountOAuthToken_6500 deleteAccount err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountOAuthToken_6500 end====");
                            done();
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_6600', 0, async function (done) {
                var limitToken = '';
                for(var i = 0;i < TOKENLENGTHLIMIT + 1; i++){
                    limitToken += 'c';
                }
                console.info("====>ActsAccountOAuthToken_6600 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_6600 addAccount start====");
                await appAccountManager.addAccount("account_promise_token_exceedLimit");
                console.info("====>ActsAccountOAuthToken_6600 deleteOAuthToken start====");
                try{
                    await appAccountManager.deleteOAuthToken("account_promise_token_exceedLimit",OWNERSELF,"authType",limitToken);
                }
                catch(err){
                    console.info("====>ActsAccountOAuthToken_6600 getOAuthToken err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    console.info("====>ActsAccountOAuthToken_6600 deleteAccount start====");
                    await appAccountManager.deleteAccount("account_promise_token_exceedLimit");
                    console.info("====>ActsAccountOAuthToken_6600 end====");
                    done();
                }
            });
        
            it('ActsAccountOAuthToken_6700', 0, async function (done) {
                var limitToken = '';
                for(var i = 0;i < TOKENLENGTHLIMIT; i++){
                    limitToken += 'c';
                }
                console.info("====>ActsAccountOAuthToken_6700 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_6700 addAccount start====");
                appAccountManager.addAccount("account_callback_token_limit",(err)=>{
                    console.info("====>ActsAccountOAuthToken_6700 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_token_limit","authType",limitToken,(err)=>{
                        console.info("====>ActsAccountOAuthToken_6700 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.deleteOAuthToken("account_callback_token_limit",OWNERSELF,"authType",limitToken,(err)=>{
                            console.info("====>ActsAccountOAuthToken_6700 getOAuthToken err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.deleteAccount("account_callback_token_limit",(err)=>{
                                console.info("====>ActsAccountOAuthToken_6700 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_6700 end====");
                                done();
                            });
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_6800', 0, async function (done) {
                var limitToken = '';
                for(var i = 0;i < TOKENLENGTHLIMIT; i++){
                    limitToken += 'c';
                }
                console.info("====>ActsAccountOAuthToken_6800 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_6800 addAccount start====");
                await appAccountManager.addAccount("account_promise_token_limit");
                console.info("====>ActsAccountOAuthToken_6800 setOAuthToken start====");
                await appAccountManager.setOAuthToken("account_promise_token_limit","authType",limitToken);
                console.info("====>ActsAccountOAuthToken_6800 deleteOAuthToken start====");
                await appAccountManager.deleteOAuthToken("account_promise_token_limit",OWNERSELF,"authType",limitToken);
                console.info("====>ActsAccountOAuthToken_6800 deleteAccount start====");
                await appAccountManager.deleteAccount("account_promise_token_limit");
                console.info("====>ActsAccountOAuthToken_6800 end====");
                done();
            });
        
            it('ActsAccountOAuthToken_6900', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_6900 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_6900 addAccount start====");
                appAccountManager.addAccount("account_callback_delete_space",(err)=>{
                    console.info("====>ActsAccountOAuthToken_6900 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_callback_delete_space","authType","account_callback_delete_space_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_6900 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        try{
                            appAccountManager.deleteOAuthToken("account_callback_delete_space",OWNERSELF,"authType","",(err)=>{
                                console.info("====>ActsAccountOAuthToken_6900 deleteOAuthToken err:" + JSON.stringify(err));
                                expect(err).assertEqual(null)
                                appAccountManager.getOAuthToken("account_callback_delete_space",OWNERSELF,"authType",(err,data)=>{
                                    console.info("====>ActsAccountOAuthToken_6900 getAuthToken err:" + JSON.stringify(err));
                                    console.info("====>ActsAccountOAuthToken_6900 getAuthToken data:" + data);
                                    expect(err).assertEqual(null);
                                    expect(data).assertEqual("account_callback_delete_space_token");
                                    appAccountManager.deleteAccount("account_callback_delete_space",(err)=>{
                                        console.info("====>ActsAccountOAuthToken_6900 removeAccount err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        console.info("====>ActsAccountOAuthToken_6900 end====");
                                        done();
                                    });
                                });                               
                            })
                        }catch(err){
                            expect().assertFail();
                            done();                           
                        };
                    });
                });
            });
        
            it('ActsAccountOAuthToken_7000', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_7000 start====");
                var appAccountManager = account.createAppAccountManager();
                console.info("====>ActsAccountOAuthToken_7000 addAccount start====");
                await appAccountManager.addAccount("account_promise_delete_space");
                console.info("====>ActsAccountOAuthToken_7000 setOAuthToken start====");
                await appAccountManager.setOAuthToken("account_promise_delete_space","authType","account_promise_delete_space_token");
                console.info("====>ActsAccountOAuthToken_7000 deleteOAuthToken start====");
                await appAccountManager.deleteOAuthToken("account_promise_delete_space",OWNERSELF,"authType","");
                console.info("====>ActsAccountOAuthToken_7000 getOAuthToken start====");
                var data = await appAccountManager.getOAuthToken("account_promise_delete_space",OWNERSELF,"authType");
                expect(data).assertEqual("account_promise_delete_space_token");
                console.info("====>ActsAccountOAuthToken_7000 deleteAccount start====");
                await appAccountManager.deleteAccount("account_promise_delete_space");
                console.info("====>ActsAccountOAuthToken_7000 end====");
                done();
            });
        
            it('ActsAccountOAuthToken_9200', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_9200 start====");
            	var appAccountManager = account.createAppAccountManager();
            	appAccountManager.getAuthenticatorCallback("test_sessionId").then((databack)=>{
                    console.info("====>ActsAccountOAuthToken_9200 getAuthenticatorCallback data:" + JSON.stringify(databack))
                    expect(databack).assertEqual(undefined);
                    done();
            	}).catch((err)=>{
                    console.info("====>ActsAccountOAuthToken_9200 getAuthenticatorCallback err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    done();
            	})
            });
        
            it('ActsAccountOAuthToken_9300', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_9300 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.getAuthenticatorCallback("",(err,databack)=>{
                    console.info("====>ActsAccountOAuthToken_9300 getAuthenticatorCallback err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    expect(databack).assertEqual(null);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_9400', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_9400 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.getAuthenticatorCallback(" ",(err,databack)=>{
                    console.info("====>ActsAccountOAuthToken_9400 getAuthenticatorCallback err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    expect(databack).assertEqual(null);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_9500', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_9500 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.getAuthenticatorInfo(OWNERSELF,(err,databack)=>{
                    console.info("====>ActsAccountOAuthToken_9500 getAuthenticatorInfo err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    expect(account.ResultCode.SUCCESS).assertEqual(0);
                    expect(account.ResultCode.ERROR_ACCOUNT_NOT_EXIST).assertEqual(10001);
                    expect(account.ResultCode.ERROR_APP_ACCOUNT_SERVICE_EXCEPTION).assertEqual(10002);
                    expect(account.ResultCode.ERROR_INVALID_PASSWORD).assertEqual(10003);
                    expect(account.ResultCode.ERROR_INVALID_REQUEST).assertEqual(10004);
                    expect(account.ResultCode.ERROR_INVALID_RESPONSE).assertEqual(10005);
                    expect(account.ResultCode.ERROR_NETWORK_EXCEPTION).assertEqual(10006);
                    expect(account.ResultCode.ERROR_OAUTH_AUTHENTICATOR_NOT_EXIST).assertEqual(10007);
                    expect(account.ResultCode.ERROR_OAUTH_CANCELED).assertEqual(10008);
                    expect(account.ResultCode.ERROR_OAUTH_LIST_TOO_LARGE).assertEqual(10009);
                    expect(account.ResultCode.ERROR_OAUTH_SERVICE_BUSY).assertEqual(10010);
                    expect(account.ResultCode.ERROR_OAUTH_SERVICE_EXCEPTION).assertEqual(10011);
                    expect(account.ResultCode.ERROR_OAUTH_SESSION_NOT_EXIST).assertEqual(10012);
                    expect(account.ResultCode.ERROR_OAUTH_TIMEOUT).assertEqual(10013);
                    expect(account.ResultCode.ERROR_OAUTH_TOKEN_NOT_EXIST).assertEqual(10014);
                    expect(account.ResultCode.ERROR_OAUTH_TOKEN_TOO_MANY).assertEqual(10015);
                    expect(account.ResultCode.ERROR_OAUTH_UNSUPPORT_ACTION).assertEqual(10016);
                    expect(account.ResultCode.ERROR_OAUTH_UNSUPPORT_AUTH_TYPE).assertEqual(10017);
                    expect(account.ResultCode.ERROR_PERMISSION_DENIED).assertEqual(10018);                   
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_9600', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_9600 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.getAuthenticatorInfo("",(err,databack)=>{
                    console.info("====>ActsAccountOAuthToken_9600 getAuthenticatorInfo err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    expect(account.Constants.ACTION_ADD_ACCOUNT_IMPLICITLY).assertEqual('addAccountImplicitly');
                    expect(account.Constants.ACTION_AUTHENTICATE).assertEqual('authenticate');
                    expect(account.Constants.KEY_NAME).assertEqual('name');
                    expect(account.Constants.KEY_OWNER).assertEqual('owner');
                    expect(account.Constants.KEY_TOKEN).assertEqual('token');
                    expect(account.Constants.KEY_ACTION).assertEqual('action');
                    expect(account.Constants.KEY_AUTH_TYPE).assertEqual('authType');
                    expect(account.Constants.KEY_SESSION_ID).assertEqual('sessionId');
                    expect(account.Constants.KEY_CALLER_PID).assertEqual('callerPid');
                    expect(account.Constants.KEY_CALLER_UID).assertEqual('callerUid');
                    expect(account.Constants.KEY_CALLER_BUNDLE_NAME).assertEqual('callerBundleName');
                    expect(account.Constants.ACTION_CREATE_ACCOUNT_IMPLICITLY).assertEqual('createAccountImplicitly');
                    expect(account.Constants.ACTION_AUTH).assertEqual('auth');
                    expect(account.Constants.ACTION_VERIFY_CREDENTIAL).assertEqual('verifyCredential');
                    expect(account.Constants.ACTION_SET_AUTHENTICATOR_PROPERTIES).assertEqual('setAuthenticatorProperties');
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_9700', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_9700 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.getAuthenticatorInfo(" ",(err,databack)=>{
                    console.info("====>ActsAccountOAuthToken_9700 getAuthenticatorInfo err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_9800', 0, async function (done) {
                var limiOwner = '';
                for(var i = 0;i < OWNERLENGTHLIMIT + 1; i++){
                    limiOwner += 't';
                }
                console.info("====>ActsAccountOAuthToken_9800 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.getAuthenticatorInfo(limiOwner,(err,databack)=>{
                    console.info("====>ActsAccountOAuthToken_9800 getAuthenticatorInfo err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_9900', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_9900 start====");
            	var appAccountManager = account.createAppAccountManager();
            	appAccountManager.addAccount("account_setOAuthTokenVisibility_name",(err,)=>{
                    console.info("====>ActsAccountOAuthToken_9900 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);            
                    appAccountManager.setOAuthTokenVisibility("account_setOAuthTokenVisibility_name","authType","test_BundleName",true).then(()=>{
                        appAccountManager.getOAuthToken("account_setOAuthTokenVisibility_name",OWNERSELF,"authType",(err,data)=>{
                            console.info("====>ActsAccountOAuthToken_9900 getOAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_9900 getOAuthToken data:" + data);
                            expect(err.code!=0).assertEqual(true);                        
                            appAccountManager.getOAuthList("account_setOAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                console.info("====>ActsAccountOAuthToken_9900 getOAuthList err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);                       
                                console.info("====>ActsAccountOAuthToken_9900 getOAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(1);
                            	expect(dataArray[0]).assertEqual("test_BundleName");
                            	appAccountManager.deleteAccount("account_setOAuthTokenVisibility_name",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_9900 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);                            
                                    console.info("====>ActsAccountOAuthToken_9900 end====");
                                    done();
                                });
                            });
                        });
                    }).catch((err)=>{
                        expect(err).assertEqual(null);                
		        done();
                    })
                });
            });
        
            it('ActsAccountOAuthToken_10000', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_10000 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_setOAuthTokenVisibility_name",(err,)=>{
                    console.info("====>ActsAccountOAuthToken_10000 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_setOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_10000 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthTokenVisibility("account_setOAuthTokenVisibility_name","authType","test_BundleName","",(err)=>{
                            console.info("====>ActsAccountOAuthToken_10000 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getOAuthList("account_setOAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                console.info("====>ActsAccountOAuthToken_10000 getOAuthList err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_10000 getOAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(0);
                                appAccountManager.deleteAccount("account_setOAuthTokenVisibility_name",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_10000 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_10000 end====");
                                    done();
                                });
                            });
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_10100', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_10100 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_setOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_10100 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_setOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_10100 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthTokenVisibility("account_setOAuthTokenVisibility_name","authType","test_BundleName","invalid_string",(err)=>{
                            console.info("====>ActsAccountOAuthToken_10100 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getOAuthList("account_setOAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                console.info("====>ActsAccountOAuthToken_10100 getOAuthList err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_10100 getOAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(0);
                                appAccountManager.deleteAccount("account_setOAuthTokenVisibility_name",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_10100 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_10100 end====");
                                    done();
                                });
                            });
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_10200', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_10200 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_setOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_10200 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_setOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_10200 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthTokenVisibility("account_setOAuthTokenVisibility_name","authType","",true,(err)=>{
                            console.info("====>ActsAccountOAuthToken_10200 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err.code!=0).assertEqual(true);
                            appAccountManager.deleteAccount("account_setOAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountOAuthToken_10200 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_10200 end====");
                                done();
                            });
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_10300', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_10300 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_setOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_10300 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_setOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_10300 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthTokenVisibility("account_setOAuthTokenVisibility_name","authType"," ",true,(err)=>{
                            console.info("====>ActsAccountOAuthToken_10300 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getOAuthList("account_setOAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                console.info("====>ActsAccountOAuthToken_10300 getOAuthList err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_10300 getOAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(1);
                                expect(dataArray[0]).assertEqual(" ");
                                appAccountManager.deleteAccount("account_setOAuthTokenVisibility_name",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_10300 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_10300 end====");
                                    done();
                                });
                            });    
                        });
                    });
                });
            });
            
            it('ActsAccountOAuthToken_10400', 0, async function (done) {
                var limitBundleName = '';
                for(var i = 0;i < OWNERLENGTHLIMIT + 1; i++){
                    limitBundleName += 't';
                }
                console.info("====>ActsAccountOAuthToken_10400 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_setOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_10400 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_setOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_10400 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthTokenVisibility("account_setOAuthTokenVisibility_name","authType",limitBundleName,true,(err)=>{
                            console.info("====>ActsAccountOAuthToken_10400 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err.code!=0).assertEqual(true);
                            appAccountManager.deleteAccount("account_setOAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountOAuthToken_10400 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_10400 end====");
                                done();
                            });
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_10500', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_10500 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_setOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_10500 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_setOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_10500 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthTokenVisibility("account_setOAuthTokenVisibility_name","","test_bundleName",true,(err)=>{
                            console.info("====>ActsAccountOAuthToken_10500 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getOAuthList("account_setOAuthTokenVisibility_name","",(err,dataArray)=>{
                                console.info("====>ActsAccountOAuthToken_10500 getOAuthList err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_10500 getOAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(1);
                                expect(dataArray[0]).assertEqual("test_bundleName");
                                appAccountManager.getOAuthList("account_setOAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                    console.info("====>ActsAccountOAuthToken_10500 getOAuthList authType:\"authType\" err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_10500 getOAuthList authType:\"authType\" dataArray:" + JSON.stringify(dataArray));
                                    expect(dataArray.length).assertEqual(0);
                                    appAccountManager.deleteAccount("account_setOAuthTokenVisibility_name",(err)=>{
                                        console.info("====>ActsAccountOAuthToken_10500 deleteAccount err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        console.info("====>ActsAccountOAuthToken_10500 end====");
                                        done();
                                    });
                                });
                            });    
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_10600', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_10600 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_setOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_10600 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_setOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_10600 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthTokenVisibility("account_setOAuthTokenVisibility_name"," ","test_bundleName",true,(err)=>{
                            console.info("====>ActsAccountOAuthToken_10600 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getOAuthList("account_setOAuthTokenVisibility_name"," ",(err,dataArray)=>{
                                console.info("====>ActsAccountOAuthToken_10600 getOAuthList err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_10600 getOAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(1);
                                expect(dataArray[0]).assertEqual("test_bundleName");
                                appAccountManager.getOAuthList("account_setOAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                    console.info("====>ActsAccountOAuthToken_10600 getOAuthList authType:\"authType\" err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_10600 getOAuthList authType:\"authType\" dataArray:" + JSON.stringify(dataArray));
                                    expect(dataArray.length).assertEqual(0);
                                    appAccountManager.deleteAccount("account_setOAuthTokenVisibility_name",(err)=>{
                                        console.info("====>ActsAccountOAuthToken_10600 deleteAccount err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        console.info("====>ActsAccountOAuthToken_10600 end====");
                                        done();
                                    });
                                });
                            });    
                        });
                    });
                });
            });
        
        
            it('ActsAccountOAuthToken_10700', 0, async function (done) {
                var limitAuthType = '';
                for(var i = 0;i < AUTHTYPELENGTHLIMIT + 1; i++){
                    limitAuthType += 't';
                }
                console.info("====>ActsAccountOAuthToken_10700 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_setOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_10700 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_setOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_10700 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthTokenVisibility("account_setOAuthTokenVisibility_name",limitAuthType,"test_bundleName",true,(err)=>{
                            console.info("====>ActsAccountOAuthToken_10700 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err.code!=0).assertEqual(true);
                            appAccountManager.getOAuthList("account_setOAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                console.info("====>ActsAccountOAuthToken_10700 getOAuthList authType:\"authType\" err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_10700 getOAuthList authType:\"authType\" dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(0);
                                appAccountManager.deleteAccount("account_setOAuthTokenVisibility_name",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_10700 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_10700 end====");
                                    done();
                                });
                            }); 
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_10800', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_10800 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_setOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_10800 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_setOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_10800 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthTokenVisibility("account_setOAuthTokenVisibility_name","invalid_authType","test_bundleName",true,(err)=>{
                            console.info("====>ActsAccountOAuthToken_10800 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getOAuthList("account_setOAuthTokenVisibility_name","invalid_authType",(err,dataArray)=>{
                                console.info("====>ActsAccountOAuthToken_10800 getOAuthList err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_10800 getOAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(1);
                                expect(dataArray[0]).assertEqual("test_bundleName");
                                appAccountManager.getOAuthList("account_setOAuthTokenVisibility_name","authType",(err,dataArray)=>{
                                    console.info("====>ActsAccountOAuthToken_10800 getOAuthList authType:\"authType\" err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_10800 getOAuthList authType:\"authType\" dataArray:" + JSON.stringify(dataArray));
                                    expect(dataArray.length).assertEqual(0);
                                    appAccountManager.deleteAccount("account_setOAuthTokenVisibility_name",(err)=>{
                                        console.info("====>ActsAccountOAuthToken_10800 deleteAccount err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        console.info("====>ActsAccountOAuthToken_10800 end====");
                                        done();
                                    });
                                });
                            });    
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_10900', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_10900 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.setOAuthTokenVisibility("","authType","test_bundleName",true,(err)=>{
                    console.info("====>ActsAccountOAuthToken_10900 setOAuthTokenVisibility err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_11000', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_11000 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.setOAuthTokenVisibility(" ","authType","test_bundleName",true,(err)=>{
                    console.info("====>ActsAccountOAuthToken_11000 setOAuthTokenVisibility err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_11100', 0, async function (done) {
                var limitName = '';
                for(var i = 0; i < LENGTHLIMIT + 1; i++){
                    limitName += 't';
                }
                console.info("====>ActsAccountOAuthToken_11100 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.setOAuthTokenVisibility(limitName,"authType","test_bundleName",true,(err)=>{
                    console.info("====>ActsAccountOAuthToken_11100 setOAuthTokenVisibility err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_11200', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_11200 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.setOAuthTokenVisibility("no_add_account","authType","test_bundleName",true,(err)=>{
                    console.info("====>ActsAccountOAuthToken_11200 setOAuthTokenVisibility err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_11300', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_11300 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.checkOAuthTokenVisibility("","authType","test_bundleName",(err,stateBack)=>{
                    console.info("====>ActsAccountOAuthToken_11300 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_11400', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_11400 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.checkOAuthTokenVisibility(" ","authType","test_bundleName",(err,stateBack)=>{
                    console.info("====>ActsAccountOAuthToken_11400 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_11500', 0, async function (done) {
                var limitName = '';
                for(var i = 0; i < LENGTHLIMIT + 1; i++){
                    limitName += 't';
                }
                console.info("====>ActsAccountOAuthToken_11500 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.checkOAuthTokenVisibility(limitName,"authType","test_bundleName",(err,stateBack)=>{
                    console.info("====>ActsAccountOAuthToken_11500 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_11600', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_11600 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.checkOAuthTokenVisibility("no_add_account","authType","test_bundleName",(err,stateBack)=>{
                    console.info("====>ActsAccountOAuthToken_11600 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                    expect(err.code!=0).assertEqual(true);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_11700', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_11700 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_11700 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_checkOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_11700 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.checkOAuthTokenVisibility("account_checkOAuthTokenVisibility_name","","test_bundleName",(err,stateBack)=>{
                            console.info("====>ActsAccountOAuthToken_11700 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_11700 checkOAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(false);
                            appAccountManager.checkOAuthTokenVisibility("account_checkOAuthTokenVisibility_name","",OWNERSELF,(err,stateBack)=>{
                                console.info("====>ActsAccountOAuthToken_11700 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                                console.info("====>ActsAccountOAuthToken_11700 checkOAuthTokenVisibility stateBack:" + stateBack);
                                expect(err).assertEqual(null);
                                expect(stateBack).assertEqual(true);
                                appAccountManager.deleteAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_11700 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_11700 end====");
                                    done();
                                });
                            });    
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_11800', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_11800 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_11800 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_checkOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_11800 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.checkOAuthTokenVisibility("account_checkOAuthTokenVisibility_name"," ","test_bundleName",(err,stateBack)=>{
                            console.info("====>ActsAccountOAuthToken_11800 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_11800 checkOAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(false);
                            appAccountManager.checkOAuthTokenVisibility("account_checkOAuthTokenVisibility_name"," ",OWNERSELF,(err,stateBack)=>{
                                console.info("====>ActsAccountOAuthToken_11800 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                                console.info("====>ActsAccountOAuthToken_11800 checkOAuthTokenVisibility stateBack:" + stateBack);
                                expect(err).assertEqual(null);
                                expect(stateBack).assertEqual(true);
                                appAccountManager.deleteAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_11800 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_11800 end====");
                                    done();
                                });
                            });    
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_11900', 0, async function (done) {
                var limitAuthType ='';
                for(var i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++){
                    limitAuthType += 't';
                }
                console.info("====>ActsAccountOAuthToken_11900 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_11900 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_checkOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_11900 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.checkOAuthTokenVisibility("account_checkOAuthTokenVisibility_name",limitAuthType,"test_bundleName",(err,stateBack)=>{
                            console.info("====>ActsAccountOAuthToken_11900 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err.code!=0).assertEqual(true);
                            appAccountManager.checkOAuthTokenVisibility("account_checkOAuthTokenVisibility_name",limitAuthType,OWNERSELF,(err,stateBack)=>{
                                console.info("====>ActsAccountOAuthToken_11900 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                                expect(err.code!=0).assertEqual(true);
                                appAccountManager.deleteAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_11900 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_11900 end====");
                                    done();
                                });
                            });    
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_12000', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_12000 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_12000 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_checkOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_12000 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.checkOAuthTokenVisibility("account_checkOAuthTokenVisibility_name","invalid_authType","test_bundleName",(err,stateBack)=>{
                            console.info("====>ActsAccountOAuthToken_12000 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_12000 checkOAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(false);
                            appAccountManager.checkOAuthTokenVisibility("account_checkOAuthTokenVisibility_name","invalid_authType",OWNERSELF,(err,stateBack)=>{
                                console.info("====>ActsAccountOAuthToken_12000 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                                console.info("====>ActsAccountOAuthToken_12000 checkOAuthTokenVisibility stateBack:" + stateBack);
                                expect(err).assertEqual(null);
                                expect(stateBack).assertEqual(true);
                                appAccountManager.deleteAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_12000 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_12000 end====");
                                    done();
                                });
                            });    
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_12100', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_12100 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_12100 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_checkOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_12100 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.checkOAuthTokenVisibility("account_checkOAuthTokenVisibility_name","authType","",(err,stateBack)=>{
                            console.info("====>ActsAccountOAuthToken_12100 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_12100 checkOAuthTokenVisibility stateBack:" + stateBack);
                            expect(err.code!=0).assertEqual(true);
                            appAccountManager.deleteAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountOAuthToken_12100 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_12100 end====");
                                done();
                            });    
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_12200', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_12200 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_12200 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_checkOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_12200 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.checkOAuthTokenVisibility("account_checkOAuthTokenVisibility_name","authType"," ",(err,stateBack)=>{
                            console.info("====>ActsAccountOAuthToken_12200 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_12200 checkOAuthTokenVisibility stateBack:" + stateBack);
                            expect(err).assertEqual(null);
                            expect(stateBack).assertEqual(false);
                            appAccountManager.deleteAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountOAuthToken_12200 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_12200 end====");
                                done();
                            });    
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_12300', 0, async function (done) {
                var limitBundleName = '';
                for(var i = 0; i < OWNERLENGTHLIMIT + 1; i++){
                    limitBundleName += 't';
                }
                console.info("====>ActsAccountOAuthToken_12300 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_12300 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_checkOAuthTokenVisibility_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_12300 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.checkOAuthTokenVisibility("account_checkOAuthTokenVisibility_name","authType",limitBundleName,(err,stateBack)=>{
                            console.info("====>ActsAccountOAuthToken_12300 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_12300 checkOAuthTokenVisibility stateBack:" + stateBack);
                            expect(err.code!=0).assertEqual(true);
                            appAccountManager.deleteAccount("account_checkOAuthTokenVisibility_name",(err)=>{
                                console.info("====>ActsAccountOAuthToken_12300 deleteAccount err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_12300 end====");
                                done();
                            });    
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_12400', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_12400 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_testGetOAuthList_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_12400 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_testGetOAuthList_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_12400 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthTokenVisibility("account_testGetOAuthList_name","authType","test_bundleName",true,(err)=>{
                            console.info("====>ActsAccountOAuthToken_12400 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getOAuthList("account_testGetOAuthList_name","",(err,dataArray)=>{
                                console.info("====>ActsAccountOAuthToken_12400 getOAuthList err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_12400 getOAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(0);
                                appAccountManager.deleteAccount("account_testGetOAuthList_name",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_12400 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_12400 end====");
                                    done();
                                });
                            });    
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_12500', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_12500 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_testGetOAuthList_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_12500 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_testGetOAuthList_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_12500 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthTokenVisibility("account_testGetOAuthList_name","authType","test_bundleName",true,(err)=>{
                            console.info("====>ActsAccountOAuthToken_12500 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getOAuthList("account_testGetOAuthList_name"," ",(err,dataArray)=>{
                                console.info("====>ActsAccountOAuthToken_12500 getOAuthList err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountOAuthToken_12500 getOAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray.length).assertEqual(0);
                                appAccountManager.deleteAccount("account_testGetOAuthList_name",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_12500 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_12500 end====");
                                    done();
                                });
                            });    
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_12600', 0, async function (done) {
                var limitAuthType ='';
                for(var i = 0; i < AUTHTYPELENGTHLIMIT + 1; i++){
                    limitAuthType += 't';
                }
                console.info("====>ActsAccountOAuthToken_12600 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_testGetOAuthList_name",(err)=>{
                    console.info("====>ActsAccountOAuthToken_12600 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_testGetOAuthList_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_12600 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.setOAuthTokenVisibility("account_testGetOAuthList_name","authType","test_bundleName",true,(err)=>{
                            console.info("====>ActsAccountOAuthToken_12600 setOAuthTokenVisibility err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            appAccountManager.getOAuthList("account_testGetOAuthList_name",limitAuthType,(err,dataArray)=>{
                                console.info("====>ActsAccountOAuthToken_12600 getOAuthList err:" + JSON.stringify(err));
                                expect(err.code!=0).assertEqual(true);
                                console.info("====>ActsAccountOAuthToken_12600 getOAuthList dataArray:" + JSON.stringify(dataArray));
                                expect(dataArray).assertEqual(null);
                                appAccountManager.deleteAccount("account_testGetOAuthList_name",(err)=>{
                                    console.info("====>ActsAccountOAuthToken_12600 deleteAccount err:" + JSON.stringify(err));
                                    expect(err).assertEqual(null);
                                    console.info("====>ActsAccountOAuthToken_12600 end====");
                                    done();
                                });
                            });    
                        });
                    });
                });
            });
        
            it('ActsAccountOAuthToken_12700', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_12700 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.getOAuthList("","authType").then((dataArray)=>{
                    console.info("====>ActsAccountOAuthToken_12700 getOAuthList dataArray:" + JSON.stringify(dataArray));                
                    expect(dataArray.length).assertEqual(0);
                    done();
                }).catch((err)=>{
                    expect(err.code!=0).assertEqual(true);
                    done();
                })
            });
        
            it('ActsAccountOAuthToken_12800', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_12800 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.getOAuthList(" ","authType",(err,dataArray)=>{
                    console.info("====>ActsAccountOAuthToken_12800 getOAuthList err:" + JSON.stringify(err));
                    console.info("====>ActsAccountOAuthToken_12800 getOAuthList dataArray:" + JSON.stringify(dataArray));
                    expect(err.code!=0).assertEqual(true);
                    expect(dataArray).assertEqual(null);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_12900', 0, async function (done) {
                var limitName = '';
                for(var i = 0; i < LENGTHLIMIT + 1; i++){
                    limitName += 't';
                }
                console.info("====>ActsAccountOAuthToken_12900 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.getOAuthList(limitName,"authType",(err,dataArray)=>{
                    console.info("====>ActsAccountOAuthToken_12900 getOAuthList err:" + JSON.stringify(err));
                    console.info("====>ActsAccountOAuthToken_12900 getOAuthList dataArray:" + JSON.stringify(dataArray));
                    expect(err.code!=0).assertEqual(true);
                    expect(dataArray).assertEqual(null);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_13000', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_13000 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.getOAuthList("no_add_account","authType",(err,dataArray)=>{
                    console.info("====>ActsAccountOAuthToken_13000 getOAuthList err:" + JSON.stringify(err));
                    console.info("====>ActsAccountOAuthToken_13000 getOAuthList dataArray:" + JSON.stringify(dataArray));
                    expect(err.code!=0).assertEqual(true);
                    expect(dataArray).assertEqual(null);
                    done();
                });
            });
        
            it('ActsAccountOAuthToken_13100', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_13100 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccount("account_tokenTest_name",(err,)=>{
                    console.info("====>ActsAccountOAuthToken_13100 addAccount err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setOAuthToken("account_tokenTest_name","authType","test_token",(err)=>{
                        console.info("====>ActsAccountOAuthToken_13100 setOAuthToken err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getOAuthToken("account_tokenTest_name",OWNERSELF,"authType",(err,data)=>{
                            console.info("====>ActsAccountOAuthToken_13100 getOAuthToken err:" + JSON.stringify(err));
                            console.info("====>ActsAccountOAuthToken_13100 getOAuthToken stateBack:" + data);
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("test_token");
                            appAccountManager.checkOAuthTokenVisibility("account_tokenTest_name","authType","test_bundleName",(err,stateBack)=>{
                                console.info("====>ActsAccountOAuthToken_13100 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                                console.info("====>ActsAccountOAuthToken_13100 checkOAuthTokenVisibility stateBack:" + stateBack);
                                expect(err).assertEqual(null);
                                expect(stateBack).assertEqual(false);
                                appAccountManager.getOAuthList("account_tokenTest_name","authType",(err,dataArray)=>{
                                    console.info("====>ActsAccountOAuthToken_13100 getOAuthList err:" + JSON.stringify(err));
                                    console.info("====>ActsAccountOAuthToken_13100 getOAuthList dataArray:" + JSON.stringify(dataArray));
                                    expect(err).assertEqual(null);
                                    expect(dataArray.length).assertEqual(0);
                                    appAccountManager.setOAuthTokenVisibility("account_tokenTest_name","authType","test_bundleName",true,(err)=>{
                                        console.info("====>ActsAccountOAuthToken_13100 setOAuthTokenVisibility err:" + JSON.stringify(err));
                                        expect(err).assertEqual(null);
                                        appAccountManager.checkOAuthTokenVisibility("account_tokenTest_name","authType","test_bundleName",(err,stateBack)=>{
                                            console.info("====>ActsAccountOAuthToken_13100 checkOAuthTokenVisibility err:" + JSON.stringify(err));
                                            console.info("====>ActsAccountOAuthToken_13100 checkOAuthTokenVisibility stateBack:" + stateBack);
                                            expect(err).assertEqual(null);
                                            expect(stateBack).assertEqual(true);
                                            appAccountManager.getOAuthList("account_tokenTest_name","authType",(err,dataArray)=>{
                                                console.info("====>ActsAccountOAuthToken_13100 getOAuthList err:" + JSON.stringify(err));
                                                console.info("====>ActsAccountOAuthToken_13100 getOAuthList dataArray:" + JSON.stringify(dataArray));
                                                expect(err).assertEqual(null);
                                                expect(dataArray.length).assertEqual(1);
                                                expect(dataArray[0]).assertEqual("test_bundleName");
                                                appAccountManager.deleteAccount("account_tokenTest_name",(err)=>{
                                                    console.info("====>ActsAccountOAuthToken_13100 deleteAccount err:" + JSON.stringify(err));
                                                    expect(err).assertEqual(null);
                                                    console.info("====>ActsAccountOAuthToken_13100 end====");
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
        
            it('ActsAccountOAuthToken_13200', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_13200 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.getAuthenticatorInfo("com.example.actsaccountOauthtoken",(err,dataInfo)=>{
                    console.info("====>ActsAccountOAuthToken_13200 getAuthenticatorInfo err:" + JSON.stringify(err));
                    console.info("====>ActsAccountOAuthToken_13200 getAuthenticatorInfo dataInfo:" + JSON.stringify(dataInfo));
                    expect(err).assertEqual(null);
                    expect(isNaN(dataInfo.iconId)).assertFalse();
                    expect(isNaN(dataInfo.labelId)).assertFalse();
                    done();
                });
            });
			
			it('ActsAccountOAuthToken_13201', 0, async function (done) {
				console.info("====>ActsAccountOAuthToken_13201 start====");
				var appAccountManager = account.createAppAccountManager();
				await appAccountManager.getAuthenticatorInfo("com.example.actsaccountOauthtoken").then((dataInfo) =>{
					console.info("====>ActsAccountOAuthToken_13201 getAuthenticatorInfo dataInfo:" + JSON.stringify(dataInfo));
					expect(isNaN(dataInfo.iconId)).assertFalse();
					expect(isNaN(dataInfo.labelId)).assertFalse();
					done();
				}).catch((err) => {
					console.info("====>ActsAccountOAuthToken_13201 getAuthenticatorInfo err:" + JSON.stringify(err));
				});
			});
        
            it('ActsAccountOAuthToken_13300', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_13300 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.authenticate("authenticate_test_account","com.example.actsaccountOauthtoken","authType",{},{
                    onResult: (resultCode, resultData)=>{
                        console.info("====>ActsAccountOAuthToken_13300 authenticate resultCode:" + JSON.stringify(resultCode));
                        console.info("====>ActsAccountOAuthToken_13300 authenticate resultData:" + JSON.stringify(resultData));
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
        
            it('ActsAccountOAuthToken_13400', 0, async function (done) {
                console.info("====>ActsAccountOAuthToken_13400 start====");
                var appAccountManager = account.createAppAccountManager();
                appAccountManager.addAccountImplicitly("com.example.actsaccountOauthtoken", "authType", {},{
                    onResult: (resultCode, resultData) =>{
                        console.info("====>ActsAccountOAuthToken_13400 authenticate resultCode:" + JSON.stringify(resultCode));
                        console.info("====>ActsAccountOAuthToken_13400 authenticate resultData:" + JSON.stringify(resultData));
                        expect(resultCode.code).assertEqual(0);
                        expect(resultData.name).assertEqual("authenticate_test_account");
                        expect(resultData.authType).assertEqual("authType");
                        expect(resultData.token).assertEqual("serviceApp/authenticate/Token");
                        done();
                    },
                    onRequestRedirected: (request) =>{
                        console.info("====>ActsAccountOAuthToken_13400 onRequestRedirected request:" + JSON.stringify(request));
                        let abilityStartSetting = {
                            want:request
                        }
                        featureAbility.startAbility(abilityStartSetting, (err, result)=>{
                            console.info("====>ActsAccountOAuthToken_13400 onRequestRedirected err:" + JSON.stringify(err));
                        });
                        done();
                    }
                });
                done();
            });
    })
}

/*
 * Copyright (c) 2021-2025 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

const NAMELIMIT = 512;
const LENGTHLIMIT = 1024;
const name = 'zhangsan'
const owner = 'com.acts.accountauthenticator'
const self_owner = 'com.example.actsaccountoperatetest'
const createAccountOptions = {customData:{age:'12'}}
export default function ActsAccountAppAccess() {
    describe('ActsAccountAuthenticator', function () {
        beforeAll(async function (done) {
            console.info("====>ActsAccountAuthenticator beforeAll start====");
            featureAbility.startAbilityForResult(
                {
                    want:
                    {
                        deviceId: "",
                        bundleName: "com.acts.accountauthenticator",
                        abilityName: "com.acts.accountauthenticator.MainAbility",
                        action: "action1",
                        parameters:
                        {},
                    },
                }, (err, data) => {
                    console.info("====>accountauthenticator featureAbility startAbilityForResult err:" + JSON.stringify(err))
                    console.info("====>accountauthenticator featureAbility startAbilityForResult data:" + JSON.stringify(data))
                    console.info("====>accountauthenticator beforeAll end====");
                    done();
                }
            )
        });
        beforeEach(async (done)=>{
            console.info("====>afterEach start====");
            var appAccountManager = account.createAppAccountManager();
            var accounts = await appAccountManager.getAccountsByOwner(self_owner)
            for (var i=0;i<accounts.length;i++){
                var localName = accounts[i].name
                if(localName == 'zhangsan'){
                    await appAccountManager.removeAccount(localName)
                }
            }
            done();
        })

        /*
        * @tc.number    : ActsAccountCheckAccountLabels_0100
        * @tc.name      : test Check Account Labels callback form
        * @tc.desc      : ActsAccountCheckAccountLabels
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountCheckAccountLabels_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsAccountCheckAccountLabels_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>start finish====");
            appAccountManager.createAccount(name, createAccountOptions, (err)=>{
                console.info("====>ActsAccountCheckAccountLabels_0100 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAccountLabels(name, owner, ['level4'], (err, data)=>{
                    console.info("====>ActsAccountCheckAccountLabels_0100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.info("====>ActsAccountCheckAccountLabels_0100 data:" + JSON.stringify(data));
                    expect(data).assertEqual(true);
                    appAccountManager.removeAccount(name, (err) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0100 removeAccount_err:" + JSON.stringify(err))
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountCheckAccountLabels_0100 end====");
                        done();
                    })                
                });
            });
        });


        /*
        * @tc.number    : ActsAccountCheckAccountLabels_0200
        * @tc.name      : test Check Account Labels callback form
        * @tc.desc      : ActsAccountCheckAccountLabels
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountCheckAccountLabels_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAccountLabels_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>start finish====");
            appAccountManager.createAccount(name, (err)=>{
                console.info("====>ActsAccountCheckAccountLabels_0200 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAccountLabels(name, owner, ['20-30'], (err, data)=>{
                    console.info("====>ActsAccountCheckAccountLabels_0200 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.info("====>ActsAccountCheckAccountLabels_0200 data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    appAccountManager.removeAccount(name, (err) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0200 removeAccount_err:" + JSON.stringify(err))
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountCheckAccountLabels_0200 end====");
                        done();
                    })
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCheckAccountLabels_0300
        * @tc.name      : test Check Account Labels callback form
        * @tc.desc      : ActsAccountCheckAccountLabels
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountCheckAccountLabels_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAccountLabels_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>start finish====");
            appAccountManager.createAccount('CheckAccountLabels_0300', (err)=>{
                console.info("====>ActsAccountCheckAccountLabels_0300 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAccountLabels('CheckAccountLabels_0300', owner, ['male'], (err, data)=>{
                    console.info("====>ActsAccountCheckAccountLabels_0300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.info("====>ActsAccountCheckAccountLabels_0300 data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    appAccountManager.removeAccount("CheckAccountLabels_0300", (err) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0300 removeAccount_err:" + JSON.stringify(err))
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountCheckAccountLabels_0300 end====");
                        done();                     
                    })
                    
                });
            });
                
        }); 

        /*
        * @tc.number    : ActsAccountCheckAccountLabels_0400
        * @tc.name      : test Check Account Labels promise form
        * @tc.desc      : ActsAccountCheckAccountLabels
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountCheckAccountLabels_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAccountLabels_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            await appAccountManager.createAccount(name, createAccountOptions).then((data) =>{
                console.info("====>ActsAccountCheckAccountLabels_0400 add_account_success");
                appAccountManager.checkAccountLabels(name, owner, ['level4']).then((data) =>{
                    console.info("====>ActsAccountCheckAccountLabels_0400 data:" + JSON.stringify(data));
                    expect(data).assertEqual(true);
                    appAccountManager.removeAccount(name).then((data) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0400 delete_account_success");
                        done();
                    }).catch((err) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0400 delete_account_err");
                        expect().assertFail();
                        done();
                    });                    
                }).catch((err) =>{
                    console.info("====>ActsAccountCheckAccountLabels_0400 err:" + JSON.stringify(err))
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.info("====>ActsAccountCheckAccountLabels_0400 create_account_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        });

        /*
        * @tc.number    : ActsAccountCheckAccountLabels_0500
        * @tc.name      : test Check Account Labels promise form
        * @tc.desc      : ActsAccountCheckAccountLabels
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountCheckAccountLabels_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAccountLabels_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            await appAccountManager.createAccount(name, createAccountOptions).then((data) =>{
                console.info("====>ActsAccountCheckAccountLabels_0500 add_account_success");
                appAccountManager.checkAccountLabels(name, owner, ['20-30']).then((data) =>{
                    console.info("====>ActsAccountCheckAccountLabels_0500 data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    expect(account.Constants.KEY_REQUIRED_LABELS).assertEqual('requiredLabels')
                    expect(account.Constants.KEY_BOOLEAN_RESULT).assertEqual('booleanResult')
                    appAccountManager.removeAccount(name).then((data) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0500 delete_account_success");
                        done();
                    }).catch((err) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0500 delete_account_err");
                        expect().assertFail();
                        done();
                    });
                }).catch((err) =>{
                    console.info("====>ActsAccountCheckAccountLabels_0500 err:" + JSON.stringify(err))
                    expect(typeof(err) != undefined).assertTrue();
                    done();
                })
            }).catch((err) => {
                console.info("====>ActsAccountCheckAccountLabels_0500 create_account_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        });

        /*
        * @tc.number    : ActsAccountCheckAccountLabels_0600
        * @tc.name      : test Check Account Labels promise form
        * @tc.desc      : ActsAccountCheckAccountLabels
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountCheckAccountLabels_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAccountLabels_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            await appAccountManager.createAccount('CheckAccountLabels_0600', createAccountOptions).then((data) =>{
                console.info("====>ActsAccountCheckAccountLabels_0600 add_account_success:" + JSON.stringify(data));
                appAccountManager.checkAccountLabels('CheckAccountLabels_0600', owner, ['male']).then((data) =>{
                    console.info("====>ActsAccountCheckAccountLabels_0600 data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    appAccountManager.removeAccount('CheckAccountLabels_0600').then((data) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0600 delete_account_success");
                        done();
                    }).catch((err) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0600 delete_account_err");
                        expect().assertFail();
                        done();
                    });
                }).catch((err) =>{
                    console.info("====>ActsAccountCheckAccountLabels_0600 err:" + JSON.stringify(err))
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.info("====>ActsAccountCheckAccountLabels_0600 create_account_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        });

        /*
        * @tc.number    : ActsAccountCheckAppAccess_0100
        * @tc.name      : test Check App Access callback form
        * @tc.desc      : checkAppAccess
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountCheckAppAccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAppAccess_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount(name, (err)=>{
                console.info("====>ActsAccountCheckAppAccess_0100 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAppAccess(name, owner, (err, data)=>{
                    console.info("====>ActsAccountCheckAppAccess_0100 first_err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.info("====>ActsAccountCheckAppAccess_0100 first_data:" + JSON.stringify(data));
                    expect(data).assertEqual(false)
                    appAccountManager.setAppAccess(name, owner, true, (err, data) =>{
                        console.info("====>ActsAccountCheckAppAccess_0100 enableAppAccess_err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.checkAppAccess(name, owner, (err, data) =>{
                            console.info("====>ActsAccountCheckAppAccess_0100 second_err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual(true)
                            appAccountManager.setAppAccess(name, owner, false, (err, data) =>{
                                console.info("====>ActsAccountCheckAppAccess_0100 disableAppAccount_err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);  
                                appAccountManager.checkAppAccess(name, owner, async (err, data)=>{
                                    console.info("====>ActsAccountCheckAppAccess_0100 third_err:" + JSON.stringify(err))
                                    expect(err).assertEqual(null)
                                    expect(data).assertEqual(false)
                                    try {
                                        await appAccountManager.removeAccount(name)
                                        console.info('====>ActsAccountCheckAppAccess_0100 removeAccount_success')
                                    }
                                    catch{
                                        console.info('====>ActsAccountCheckAppAccess_0100 removeAccount_err')
                                        expect().assertFail()
                                    }            
                                    done();
                                })
                                
                            })
                        })
                    })
                });
            }); 
        }); 


        /*
        * @tc.number    : ActsAccountCheckAppAccess_0200
        * @tc.name      : test Check App Access promise form
        * @tc.desc      : setAppAccess
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountCheckAppAccess_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAppAccess_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount(name, createAccountOptions).then((data) =>{
                console.info("====>ActsAccountCheckAppAccess_0200 add_account_success:");
                appAccountManager.checkAppAccess(name, owner).then((data) =>{
                    console.info("====>ActsAccountCheckAppAccess_0200 first_data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    appAccountManager.setAppAccess(name, owner, true).then((data) =>{
                        console.info("====>ActsAccountCheckAppAccess_0200 enableAppAccess_success");
                        appAccountManager.checkAppAccess(name, owner).then((data) =>{
                            console.info("====>ActsAccountCheckAppAccess_0200 second_data:" + JSON.stringify(data));
                            expect(data).assertEqual(true);
                            appAccountManager.setAppAccess(name, owner, false).then((data)=>{
                                console.info("====>ActsAccountCheckAppAccess_0200 disabAppAccess_data:" + JSON.stringify(data));
                                appAccountManager.checkAppAccess(name, owner).then(async (data) =>{
                                    console.info("====>ActsAccountCheckAppAccess_0200 third_data:" + JSON.stringify(data));
                                    expect(data).assertEqual(false);     
                                    try{
                                        await appAccountManager.removeAccount(name)
                                        console.info('====>ActsAccountCheckAppAccess_0200 removeAccount_success')
                                    }                               
                                    catch{
                                        console.info('====>ActsAccountCheckAppAccess_0100 removeAccount_err')
                                        expect().assertFail()
                                    }
                                    done();                           
                                }).catch((err)=>{
                                    console.info("====>ActsAccountCheckAppAccess_0200 third_err:" + JSON.stringify(err));
                                    expect().assertFail();
                                    done();
                                })
                            }).catch((err) =>{
                                console.info("====>ActsAccountCheckAppAccess_0200 disableAppAccess_err:" + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }).catch((err) =>{
                            console.info("====>ActsAccountCheckAppAccess_0200 second_err:" + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }).catch((err)=>{
                        console.info("====>ActsAccountCheckAppAccess_0200 enableAppAccess_err:" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }).catch((err) =>{
                    console.info("====>ActsAccountCheckAppAccess_0200 first_err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.info("====>ActsAccountCheckAppAccess_0200 createAccount_err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            })
                
        });


        /*
        * @tc.number    : ActsAccountDeleteCredential_0100
        * @tc.name      : test Delete Account Credential callback form
        * @tc.desc      : getCredential
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountDeleteCredential_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountDeleteCredential_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>start finish====");
            appAccountManager.createAccount(name, (err)=>{
                console.info("====>ActsAccountDeleteCredential_0100 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCredential(name, "PIN", "credential1", (err)=>{
                    console.info("====>ActsAccountDeleteCredential_0100 setAccountCredential_err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getCredential(name, "PIN", (err, data) =>{
                        console.info("====>ActsAccountDeleteCredential_0100 getAccountCredential_err:" + JSON.stringify(err))
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountDeleteCredential_0100 getAccountCredential_success:" + JSON.stringify(data));
                        appAccountManager.deleteCredential(name, "PIN", async (err, data)=>{
                            console.info("====>ActsAccountDeleteCredential_0100 deleteCredential_err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountDeleteCredential_0100 deleteCredential_data:" + JSON.stringify(data));                             
                            expect(data).assertEqual(null);  
                            try{
                                await appAccountManager.removeAccount(name)  
                                console.info('====>ActsAccountDeleteCredential_0100 removeAccount_success')
                            }
                            catch{
                                console.info('====>ActsAccountDeleteCredential_0100 removeAccount_err')
                                expect().assertFail()
                            }    
                            done();
                        })                   
                    })                
                });
            });            
        });

        /*
        * @tc.number    : ActsAccountDeleteCredential_0200
        * @tc.name      : test Delete Account Credential promise form
        * @tc.desc      : setCredential
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountDeleteCredential_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountDeleteCredential_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.createAccount(name, createAccountOptions).then((data) =>{
                console.info("====>ActsAccountDeleteCredential_0200 add_account_success");
                appAccountManager.setCredential(name, "PIN", "credential2").then(() =>{
                    console.info("====>ActsAccountDeleteCredential_0200 setAccountCredential_success");
                    appAccountManager.getCredential(name,  "PIN").then((data) =>{
                        console.info("====>ActsAccountDeleteCredential_0200 getAccountCredential_data:" + JSON.stringify(data));
                        appAccountManager.deleteCredential(name,  "PIN").then(async (data) =>{
                            console.info("====>ActsAccountDeleteCredential_0200 data:" + JSON.stringify(data));                
                            try{
                                await appAccountManager.removeAccount(name)
                                console.info('====>ActsAccountDeleteCredential_0200 removeAccount_success')
                            }                               
                            catch{
                                console.info('====>ActsAccountDeleteCredential_0200 removeAccount_err')
                                expect().assertFail()
                            }         
                            done();                
                        }).catch((err) =>{
                            console.info("====>ActsAccountDeleteCredential_0200 err:" + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }).catch((err)=>{
                        console.info("====>ActsAccountDeleteCredential_0200 getAccountCredential_err:" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }).catch((err) =>{
                    console.info("====>ActsAccountDeleteCredential_0200 setAccountCredential_err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.info("====>ActsAccountDeleteCredential_0200 createAccount_err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            })            
        });

        /*
        * @tc.number    : ActsAccountVerifyCredential_0100
        * @tc.name      : test Verify Credential callback form, options
        * @tc.desc      : ActsAccountCheckAccountLabels
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountVerifyCredential_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountVerifyCredential_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            var options = {credentialType: "PIN", credential: "123456"}
            console.info("====>start finish====");
            appAccountManager.createAccount(name, (err)=>{
                console.info("====>ActsAccountVerifyCredential_0100 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.verifyCredential(name, owner, options, {
                onResult: async (resultCode, resultData)=>{
                    console.info("====>ActsAccountVerifyCredential_0100 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                    expect(resultCode).assertEqual(0)
                    console.info("====>ActsAccountVerifyCredential_0100 verifyCredential_resultData:" + JSON.stringify(resultData));
                    expect(resultData.booleanResult).assertEqual(true) 
                    try{
                        await appAccountManager.removeAccount(name)
                        console.info('====>ActsAccountVerifyCredential_0100 removeAccount_success')
                    } catch{
                        console.info('====>ActsAccountVerifyCredential_0100 removeAccount_err')
                        expect().assertFail()
                    }
                    done(); 
                    },
                onRequestRedirected:null,
                onRequestContinued: function(){ 
                    console.info("====>ActsAccountVerifyCredential_0100 verifyCredential_onRequestContinued")
                    }   
                });
            });
        });

        /*
        * @tc.number    : ActsAccountVerifyCredential_0200
        * @tc.name      : test Verify Credential callback form
        * @tc.desc      : ActsAccountCheckAccountLabels
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountVerifyCredential_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountVerifyCredential_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>start finish====");
            appAccountManager.createAccount(name, (err)=>{
                console.info("====>ActsAccountVerifyCredential_0200 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.verifyCredential(name, owner, {
                    onResult: async (resultCode, resultData)=>{
                        console.info("====>ActsAccountVerifyCredential_0200 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                        expect(resultCode).assertEqual(0)
                        console.info("====>ActsAccountVerifyCredential_0200 verifyCredential_resultData:" + JSON.stringify(resultData));
                        expect(resultData.booleanResult).assertEqual(false) 
                        try{
                            await appAccountManager.removeAccount(name)
                            console.info('====>ActsAccountVerifyCredential_0200 removeAccount_success')
                        }                               
                        catch{
                            console.info('====>ActsAccountVerifyCredential_0200 removeAccount_err')
                            expect().assertFail()
                        }    
                        done(); 
                        },
                    onRequestRedirected:null,
                    onRequestContinued: function(){ 
                        console.info("====>ActsAccountVerifyCredential_0200 verifyCredential_onRequestContinued")
                    }   
                });
            });
        });

        /*
        * @tc.number    : ActsAccountSetAuthenticatorProperties_0100
        * @tc.name      : test Verify Credential callback form, options
        * @tc.desc      : ActsAccountCheckAccountLabels
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountSetAuthenticatorProperties_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetAuthenticatorProperties_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            var options = {credentialType: "PIN", credential: "123456"}
            console.info("====>start finish====");
            appAccountManager.createAccount(name, (err)=>{
                console.info("====>ActsAccountSetAuthenticatorProperties_0100 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthenticatorProperties(owner, options, {
                onResult: async (resultCode, resultData)=>{
                    console.info("====>ActsAccountSetAuthenticatorProperties_0100 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                    expect(resultCode).assertEqual(10016)
                    console.info("====>ActsAccountSetAuthenticatorProperties_0100 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                    try{
                        await appAccountManager.removeAccount(name)
                        console.info('====>ActsAccountSetAuthenticatorProperties_0100 removeAccount_success')
                    }                               
                    catch{
                        console.info('====>ActsAccountSetAuthenticatorProperties_0100 removeAccount_err')
                        expect().assertFail()
                    }    
                    done(); 
                    },
                    onRequestRedirected:null,
                    onRequestContinued: function(){ 
                        console.info("====>ActsAccountSetAuthenticatorProperties_0100 verifyCredential_onRequestContinued")
                    }   
                });
            });
        });

        /*
        * @tc.number    : ActsAccountSetAuthenticatorProperties_0200
        * @tc.name      : test Verify Credential callback form
        * @tc.desc      : setAuthenticatorProperties
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountSetAuthenticatorProperties_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetAuthenticatorProperties_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>start finish====");
            appAccountManager.createAccount(name, (err)=>{
                console.info("====>ActsAccountSetAuthenticatorProperties_0200 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthenticatorProperties(owner, {
                onResult: async (resultCode, resultData)=>{
                    console.info("====>ActsAccountSetAuthenticatorProperties_0200 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                    expect(resultCode).assertEqual(10016)
                    console.info("====>ActsAccountSetAuthenticatorProperties_0200 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                    try{
                        await appAccountManager.removeAccount(name)
                        console.info('====>ActsAccountSetAuthenticatorProperties_0200 removeAccount_success')
                    }
                    catch{
                        console.info('====>ActsAccountSetAuthenticatorProperties_0200 removeAccount_err')
                        expect().assertFail()
                    }    
                    done(); 
                    },
                    onRequestRedirected:null,
                    onRequestContinued: function(){ 
                        console.info("====>ActsAccountSetAuthenticatorProperties_0200 verifyCredential_onRequestContinued")
                    }   
                });
            });
        });

        /*
        * @tc.number    : ActsAccountSelectAccountByOptions_0100
        * @tc.name      : test SelectAccountsByOptions Promise Form
        * @tc.desc      : SelectAccountsByOptions Promise
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountSelectAccountByOptions_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {  
            console.info("====>ActsAccountSelectAccountByOptions_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            var select_options = {allowedAccounts:[{"name":name,"owner":owner}]}
            console.info("====>start finish====");
            appAccountManager.createAccount(name, async (err)=>{
                console.info("====>ActsAccountSelectAccountByOptions_0100 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    var data = await appAccountManager.selectAccountsByOptions(select_options)
                    console.info("====>ActsAccountSelectAccountByOptions_0100 data:" + JSON.stringify(data));
                    expect(data.length).assertEqual(1)
                } catch(err) {
                    console.info("====>ActsAccountSelectAccountByOptions_0100 err:" + JSON.stringify(err));
                    await appAccountManager.removeAccount(name);
                    expect().assertFail()
                    done();
                    return
                }
                try{
                    await appAccountManager.removeAccount(name)
                    console.info('====>ActsAccountSelectAccountByOptions_0100 removeAccount_success')
                } catch {
                    console.info('====>ActsAccountSelectAccountByOptions_0100 removeAccount_err')
                    expect().assertFail()
                }
                done();
            });
        });

        /*
        * @tc.number    : ActsAccountSelectAccountByOptions_0200
        * @tc.name      : test SelectAccountsByOptions Promise Form
        * @tc.desc      : SelectAccountsByOptions Promise
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountSelectAccountByOptions_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSelectAccountByOptions_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            var select_options = {allowedOwners: [owner]}
            console.info("====>start finish====");
            appAccountManager.createAccount(name, async (err)=>{
                console.info("====>ActsAccountSelectAccountByOptions_0200 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    var data = await appAccountManager.selectAccountsByOptions(select_options)
                    console.info("====>ActsAccountSelectAccountByOptions_0200 data:" + JSON.stringify(data));
                    expect(data.length).assertEqual(3)
                } catch(err) {
                    console.info("====>ActsAccountSelectAccountByOptions_0200 err:" + JSON.stringify(err));
                    await appAccountManager.removeAccount(name);
                    expect(err).assertEqual(null)
                    done();
                    return;
                }
                try{
                    await appAccountManager.removeAccount(name)
                    console.info('====>ActsAccountSelectAccountByOptions_0200 removeAccount_success')
                } catch {
                    console.info('====>ActsAccountSelectAccountByOptions_0200 removeAccount_err')
                    expect().assertFail()
                }
                done();
            });
        });


        /*
        * @tc.number    : ActsAccountSelectAccountByOptions_0300
        * @tc.name      : test SelectAccountsByOptions Promise Form
        * @tc.desc      : SelectAccountsByOptions Promise
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountSelectAccountByOptions_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSelectAccountByOptions_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            var options = {requiredLabels: ["male", "30-40"]}
            console.info("====>start finish====");
            appAccountManager.createAccount(name, async (err)=>{
                console.info("====>ActsAccountSelectAccountByOptions_0300 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    var data = await appAccountManager.selectAccountsByOptions(options)
                    console.info("====>ActsAccountSelectAccountByOptions_0300 data:" + JSON.stringify(data));
                    expect(data.length).assertEqual(1)
                } catch(err) {
                    console.info("====>ActsAccountSelectAccountByOptions_0300 err:" + JSON.stringify(err));
                    await appAccountManager.removeAccount(name);
                    expect(err).assertEqual(null)
                    done();
                    return;
                }
                try{
                    await appAccountManager.removeAccount(name)
                    console.info('====>ActsAccountSelectAccountByOptions_0300 removeAccount_success')
                } catch {
                    console.info('====>ActsAccountSelectAccountByOptions_0300 removeAccount_err')
                    expect().assertFail()
                }
                done();
            });
        }); 

        /*
        * @tc.number    : ActsAccountSelectAccountByOptions_0400
        * @tc.name      : test SelectAccountsByOptions Callback Form
        * @tc.desc      : SelectAccountsByOptions Callback
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountSelectAccountByOptions_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSelectAccountByOptions_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            var select_options = {allowedAccounts:[{"name":name,"owner":owner}]}
            console.info("====>start finish====");
            appAccountManager.createAccount(name, async (err)=>{
                console.info("====>ActsAccountSelectAccountByOptions_0400 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    appAccountManager.selectAccountsByOptions(select_options, async (err, data) => {
                        console.info("====>ActsAccountSelectAccountByOptions_0400 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null)
                        expect(data.length).assertEqual(1)
                        await appAccountManager.removeAccount(name)
                        console.info('====>ActsAccountSelectAccountByOptions_0400 removeAccount_success')
                        done();
                    })
                } catch(err) {
                    console.info("====>ActsAccountSelectAccountByOptions_0400 err:" + JSON.stringify(err));
                    await appAccountManager.removeAccount(name)
                    expect().assertFail()
                    done();
                }
            });
        });

        /*
        * @tc.number    : ActsAccountSelectAccountByOptions_0500
        * @tc.name      : test SelectAccountsByOptions Callback Form
        * @tc.desc      : SelectAccountsByOptions Callback
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountSelectAccountByOptions_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSelectAccountByOptions_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            var select_options = {allowedOwners: [owner]}
            console.info("====>start finish====");
            appAccountManager.createAccount(name, async (err)=>{
                console.info("====>ActsAccountSelectAccountByOptions_0500 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    appAccountManager.selectAccountsByOptions(select_options, async (err, data) => {
                        console.info("====>ActsAccountSelectAccountByOptions_0500 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null)
                        expect(data.length).assertEqual(3)
                        await appAccountManager.removeAccount(name)
                        console.info('====>ActsAccountSelectAccountByOptions_0500 removeAccount_success')
                        done();
                    })
                } catch(err) {
                    console.info("====>ActsAccountSelectAccountByOptions_0500 err:" + JSON.stringify(err));
                    await appAccountManager.removeAccount(name)
                    expect().assertFail()
                    done();
                }
            });
        });


        /*
        * @tc.number    : ActsAccountSelectAccountByOptions_0600
        * @tc.name      : test SelectAccountsByOptions Callback Form
        * @tc.desc      : SelectAccountsByOptions Callback
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountSelectAccountByOptions_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSelectAccountByOptions_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            var options = {requiredLabels: ["male", "30-40"]}
            console.info("====>start finish====");
            appAccountManager.createAccount(name, async (err)=>{
                console.info("====>ActsAccountSelectAccountByOptions_0600 create_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    appAccountManager.selectAccountsByOptions(options, async (err, data) => {
                        console.info("====>ActsAccountSelectAccountByOptions_0600 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null)
                        expect(data.length).assertEqual(1)
                        await appAccountManager.removeAccount(name)
                        console.info('====>ActsAccountSelectAccountByOptions_0600 removeAccount_success')
                        done();
                    })
                } catch(err) {
                    console.info("====>ActsAccountSelectAccountByOptions_0600 err:" + JSON.stringify(err));
                    await appAccountManager.removeAccount(name)
                    expect().assertFail()
                    done();
                }
            });
        });

        /*
        * @tc.number    : ActsAccountCreateAccountImplicitly_0100
        * @tc.name      : test createAccountImplicitly callback form, options
        * @tc.desc      : createAccountImplicitly
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountCreateAccountImplicitly_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCreateAccountImplicitly_0100 start====");
            let appAccountManager = account.createAppAccountManager();
            let setOptions = {
                properties : { prop1 : "remove", prop2 : "createNewAccountName"}
            };
            let options = {authType: "PIN", requiredLabels:['male', '30-40'], parameters: ['sex', 'age']}
            console.info("====>start setAuthenticatorProperties");
            appAccountManager.setAuthenticatorProperties(owner, setOptions, {
                onResult: async (resultCode, resultData) => {
                    console.info("====>resultcode:" + JSON.stringify(resultCode));
                    console.info("====>start createAccountImplicitly");
                    appAccountManager.createAccountImplicitly("com.acts.accountauthenticator", options, {
                        onResult: async (resultCode, resultData)=>{
                            console.info("====>ActsAccountCreateAccountImplicitly_0100 resultcode:" + JSON.stringify(resultCode));
                            expect(resultCode).assertEqual(0)
                            console.info("====>ActsAccountCreateAccountImplicitly_0100 resultData:" + JSON.stringify(resultData));
                            expect(resultData.account.name).assertEqual("createNewAccountName")
                            expect(resultData.account.owner).assertEqual("com.acts.accountauthenticator")
                            done();
                        },
                        onRequestRedirected:null,
                        onRequestContinued: function(){
                            console.info("====>ActsAccountCreateAccountImplicitly_0100 onRequestContinued")
                        }
                    });
                },
                onRequestRedirected: null,
            });
        });

        /*
        * @tc.number    : ActsAccountCreateAccountImplicitly_0200
        * @tc.name      : test createAccountImplicitly callback form, options
        * @tc.desc      : createAccountImplicitly
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsAccountCreateAccountImplicitly_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCreateAccountImplicitly_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            let setOptions = {
                properties : { prop1 : "remove", prop2 : "createNewAccountName"}
            };
            console.info("====>start setAuthenticatorProperties");
            appAccountManager.setAuthenticatorProperties(owner, setOptions, {
                onResult: async (resultCode, resultData) => {
                    console.info("====>resultcode:" + JSON.stringify(resultCode));
                    console.info("====>start createAccountImplicitly");
                    appAccountManager.createAccountImplicitly("com.acts.accountauthenticator", {
                        onResult: async (resultCode, resultData)=>{
                            console.info("====>ActsAccountCreateAccountImplicitly_0200 resultcode:" + JSON.stringify(resultCode));
                            expect(resultCode).assertEqual(0)
                            console.info("====>ActsAccountCreateAccountImplicitly_0200 resultData:" + JSON.stringify(resultData));
                            expect(resultData.account.name).assertEqual("createNewAccountName")
                            expect(resultData.account.owner).assertEqual("com.acts.accountauthenticator")
                            done();
                        },
                        onRequestRedirected:null,
                        onRequestContinued: function(){
                            console.info("====>ActsAccountCreateAccountImplicitly_0200 onRequestContinued")
                        }
                    });
                },
                onRequestRedirected: null,
            });
        });
    })
}
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
import featureAbility from '@ohos.ability.featureAbility'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

const NAMELIMIT = 512;
const LENGTHLIMIT = 1024;
const name = 'zhangsan'
const owner = 'com.example.accountauthenticator'
export default function ActsAccountAuthenticator() {
    describe('ActsAccountAuthenticator', function () {
        beforeAll(async function (done) {  
            console.debug("====>accountauthenticatorbeforeAll start====");		
            await featureAbility.startAbilityForResult(
                {
                    want:
                    {
                        deviceId: "",
                        bundleName: "com.example.accountauthenticator",
                        abilityName: "com.example.accountauthenticator.MainAbility",
                        action: "action1",
                        parameters:
                        {},
                    },
                }, (err, data) => {
                    console.debug("====>accountauthenticatorfeatureAbility.startAbility err:" + JSON.stringify(err))
                    console.debug("====>accountauthenticatorfeatureAbility.startAbility data:" + JSON.stringify(data))
                    done();
                })
            console.debug("====>accountauthenticatorfeatureAbility.startAbility end")
        });
        beforeEach(async function (done) {            
            console.debug("====>afterEach start====");
            var appAccountManager = account.createAppAccountManager();
            var accounts = await appAccountManager.getAccountsByOwner(owner)
            for (var i=0;i<accounts.length;i++){
                var localName = accounts[i].name
                if(localName == 'zhangsan'){
                    await appAccountManager.removeAccount(localName)
                }
            }
            done();
        });
        /*
        * @tc.number    : ActsAccountCheckAccountLabels_0100
        * @tc.name      : Check Account Labels callback form
        * @tc.desc      : 
        */
        it('ActsAccountCheckAccountLabels_0100', 0, async function (done) {
            console.debug("====>ActsAccountCheckAccountLabels_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>start finish====");
            appAccountManager.addAccount(name, 'test_extraInfo', (err)=>{
                console.debug("====>ActsAccountCheckAccountLabels_0100 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAccountLabels(name, owner, ['level4'], (err, data)=>{
                    console.debug("====>ActsAccountCheckAccountLabels_0100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.debug("====>ActsAccountCheckAccountLabels_0100 data:" + JSON.stringify(data));
                    expect(data).assertEqual(true);
                    appAccountManager.deleteAccount(name, (err) =>{
                        console.debug("====>ActsAccountCheckAccountLabels_0100 deleteAccount_err:" + JSON.stringify(err))
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountCheckAccountLabels_0100 end====");
                        done();
                    })
                });
            });
        });


        /*
        * @tc.number    : ActsAccountCheckAccountLabels_0200
        * @tc.name      : Check Account Labels callback form
        * @tc.desc      : 
        */

        it('ActsAccountCheckAccountLabels_0200', 0, async function (done) {
            console.debug("====>ActsAccountCheckAccountLabels_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>start finish====");
            appAccountManager.addAccount(name, (err)=>{
                console.debug("====>ActsAccountCheckAccountLabels_0200 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAccountLabels(name, owner, ['20-30'], (err, data)=>{
                    console.debug("====>ActsAccountCheckAccountLabels_0200 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.debug("====>ActsAccountCheckAccountLabels_0200 data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    appAccountManager.deleteAccount(name, (err) =>{
                        console.debug("====>ActsAccountCheckAccountLabels_0200 deleteAccount_err:" + JSON.stringify(err))
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountCheckAccountLabels_0200 end====");
                        done();
                    })
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCheckAccountLabels_0300
        * @tc.name      : Check Account Labels callback form
        * @tc.desc      : 
        */

        it('ActsAccountCheckAccountLabels_0300', 0, async function (done) {
            console.debug("====>ActsAccountCheckAccountLabels_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>start finish====");
            appAccountManager.addAccount('CheckAccountLabels_0300', (err)=>{
                console.debug("====>ActsAccountCheckAccountLabels_0300 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAccountLabels('CheckAccountLabels_0300', owner, ['male'], (err, data)=>{
                    console.debug("====>ActsAccountCheckAccountLabels_0300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.debug("====>ActsAccountCheckAccountLabels_0300 data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    appAccountManager.deleteAccount("CheckAccountLabels_0300", (err) =>{
                        console.debug("====>ActsAccountCheckAccountLabels_0300 deleteAccount_err:" + JSON.stringify(err))
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountCheckAccountLabels_0300 end====");
                        done();                     
                    })
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCheckAccountLabels_0400
        * @tc.name      : Check Account Labels promise form
        * @tc.desc      : 
        */

        it('ActsAccountCheckAccountLabels_0400', 0, async function (done) {
            console.debug("====>ActsAccountCheckAccountLabels_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            await appAccountManager.addAccount(name, 'test_extraInfo').then((data) =>{
                console.debug("====>ActsAccountCheckAccountLabels_0400 add_account_success");
                appAccountManager.checkAccountLabels(name, owner, ['level4']).then((data) =>{
                    console.debug("====>ActsAccountCheckAccountLabels_0400 data:" + JSON.stringify(data));
                    expect(data).assertEqual(true);
                    appAccountManager.deleteAccount(name).then((data) =>{
                        console.debug("====>ActsAccountCheckAccountLabels_0400 delete_account_success");
                    }).catch((err) =>{
                        console.debug("====>ActsAccountCheckAccountLabels_0400 delete_account_err");
                    });
                    done();
                }).catch((err) =>{
                    console.debug("====>ActsAccountCheckAccountLabels_0400 err:" + JSON.stringify(err))
                    expect(typeof(err) != undefined).assertTrue();
                    done();
                })
            }).catch((err) => {
                console.debug("====>ActsAccountCheckAccountLabels_0400 add_account_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        });

        /*
        * @tc.number    : ActsAccountCheckAccountLabels_0500
        * @tc.name      : Check Account Labels promise form
        * @tc.desc      : 
        */

        it('ActsAccountCheckAccountLabels_0500', 0, async function (done) {
            console.debug("====>ActsAccountCheckAccountLabels_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            await appAccountManager.addAccount(name, 'test_extraInfo').then((data) =>{
                console.debug("====>ActsAccountCheckAccountLabels_0500 add_account_success");
                appAccountManager.checkAccountLabels(name, owner, ['20-30']).then((data) =>{
                    console.debug("====>ActsAccountCheckAccountLabels_0500 data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    expect(account.Constants.KEY_REQUIRED_LABELS).assertEqual('requiredLabels')
                    expect(account.Constants.KEY_BOOLEAN_RESULT).assertEqual('booleanResult')
                    appAccountManager.deleteAccount(name).then((data) =>{
                        console.debug("====>ActsAccountCheckAccountLabels_0500 delete_account_success");
                    }).catch((err) =>{
                        console.debug("====>ActsAccountCheckAccountLabels_0500 delete_account_err");
                    });
                    done()
                }).catch((err) =>{
                    console.debug("====>ActsAccountCheckAccountLabels_0500 err:" + JSON.stringify(err))
                    expect(typeof(err) != undefined).assertTrue();
                    done();
                })
            }).catch((err) => {
                console.debug("====>ActsAccountCheckAccountLabels_0500 add_account_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        });

        /*
        * @tc.number    : ActsAccountCheckAccountLabels_0600
        * @tc.name      : Check Account Labels promise form
        * @tc.desc      : 
        */

        it('ActsAccountCheckAccountLabels_0600', 0, async function (done) {
            console.debug("====>ActsAccountCheckAccountLabels_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            await appAccountManager.addAccount('CheckAccountLabels_0600', 'test_extraInfo').then((data) =>{
                console.debug("====>ActsAccountCheckAccountLabels_0600 add_account_success:" + JSON.stringify(data));
                appAccountManager.checkAccountLabels('CheckAccountLabels_0600', owner, ['male']).then((data) =>{
                    console.debug("====>ActsAccountCheckAccountLabels_0600 data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    appAccountManager.deleteAccount('CheckAccountLabels_0600').then((data) =>{
                        console.debug("====>ActsAccountCheckAccountLabels_0600 delete_account_success");
                    }).catch((err) =>{
                        console.debug("====>ActsAccountCheckAccountLabels_0600 delete_account_err");
                    });
                    done()
                }).catch((err) =>{
                    console.debug("====>ActsAccountCheckAccountLabels_0600 err:" + JSON.stringify(err))
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.debug("====>ActsAccountCheckAccountLabels_0600 add_account_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        });

        /*
        * @tc.number    : ActsAccountCheckAppAccess_0100
        * @tc.name      : Check App Access callback form
        * @tc.desc      : 
        */

        it('ActsAccountCheckAppAccess_0100', 0, async function (done) {
            console.debug("====>ActsAccountCheckAppAccess_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount(name, (err)=>{
                console.debug("====>ActsAccountCheckAppAccess_0100 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAppAccess(name, owner, (err, data)=>{
                    console.debug("====>ActsAccountCheckAppAccess_0100 first_err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.debug("====>ActsAccountCheckAppAccess_0100 first_data:" + JSON.stringify(data));
                    expect(data).assertEqual(false)
                    appAccountManager.enableAppAccess(name, owner, (err, data) =>{
                        console.debug("====>ActsAccountCheckAppAccess_0100 enableAppAccess_err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.checkAppAccess(name, owner, (err, data) =>{
                            console.debug("====>ActsAccountCheckAppAccess_0100 second_err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual(true)
                            appAccountManager.disableAppAccess(name, owner, (err, data) =>{
                                console.debug("====>ActsAccountCheckAppAccess_0100 disableAppAccount_err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);  
                                appAccountManager.checkAppAccess(name, owner,(err, data)=>{
                                    console.debug("====>ActsAccountCheckAppAccess_0100 third_err:" + JSON.stringify(err))
                                    expect(err).assertEqual(null)
                                    expect(data).assertEqual(false)
                                    try {
                                        appAccountManager.deleteAccount(name)     
                                        console.debug('====>ActsAccountCheckAppAccess_0100 deleteAccount_success')                  
                                        done();
                                    }
                                    catch{
                                        console.debug('====>ActsAccountCheckAppAccess_0100 deleteAccount_err')
                                        expect().assertFail()
                                    }    
                                })
                                
                            })
                        })
                    })
                });
            }); 
        }); 


        /*
        * @tc.number    : ActsAccountCheckAppAccess_0200
        * @tc.name      : Check App Access promise form
        * @tc.desc      : 
        */

        it('ActsAccountCheckAppAccess_0200', 0, async function (done) {
            console.debug("====>ActsAccountCheckAppAccess_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount(name, 'test_extraInfo').then((data) =>{
                console.debug("====>ActsAccountCheckAppAccess_0200 add_account_success:");
                appAccountManager.checkAppAccess(name, owner).then((data) =>{
                    console.debug("====>ActsAccountCheckAppAccess_0200 first_data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    appAccountManager.enableAppAccess(name, owner).then((data) =>{
                        console.debug("====>ActsAccountCheckAppAccess_0200 enableAppAccess_success");
                        appAccountManager.checkAppAccess(name, owner).then((data) =>{
                            console.debug("====>ActsAccountCheckAppAccess_0200 second_data:" + JSON.stringify(data));
                            expect(data).assertEqual(true);
                            appAccountManager.disableAppAccess(name, owner).then((data)=>{
                                console.debug("====>ActsAccountCheckAppAccess_0200 disabAppAccess_data:" + JSON.stringify(data));
                                appAccountManager.checkAppAccess(name, owner).then((data) =>{
                                    console.debug("====>ActsAccountCheckAppAccess_0200 third_data:" + JSON.stringify(data));
                                    expect(data).assertEqual(false);     
                                    try{
                                        appAccountManager.deleteAccount(name)
                                        console.debug('====>ActsAccountCheckAppAccess_0200 deleteAccount_success')
                                        done();
                                    }                               
                                    catch{
                                        console.debug('====>ActsAccountCheckAppAccess_0100 deleteAccount_err')
                                        expect().assertFail()
                                    }                                
                                }).catch((err)=>{
                                    console.debug("====>ActsAccountCheckAppAccess_0200 third_err:" + JSON.stringify(err));
                                    expect().assertFail();
                                    done();
                                })
                            }).catch((err) =>{
                                console.debug("====>ActsAccountCheckAppAccess_0200 disableAppAccess_err:" + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }).catch((err) =>{
                            console.debug("====>ActsAccountCheckAppAccess_0200 second_err:" + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }).catch((err)=>{
                        console.debug("====>ActsAccountCheckAppAccess_0200 enableAppAccess_err:" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }).catch((err) =>{
                    console.debug("====>ActsAccountCheckAppAccess_0200 first_err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.debug("====>ActsAccountCheckAppAccess_0200 addAccount_err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            })
                
        });


        /*
        * @tc.number    : ActsAccountDeleteAccountCredential_0100
        * @tc.name      : Delete Account Credential callback form
        * @tc.desc      : 
        */

        it('ActsAccountDeleteAccountCredential_0100', 0, async function (done) {
            console.debug("====>ActsAccountDeleteAccountCredential_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>start finish====");
            appAccountManager.addAccount(name, (err)=>{
                console.debug("====>ActsAccountDeleteAccountCredential_0100 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAccountCredential(name, "PIN", '123456',  (err, data)=>{
                    console.debug("====>ActsAccountDeleteAccountCredential_0100 setAccountCredential_err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAccountCredential(name, "PIN", (err, data) =>{
                        console.debug("====>ActsAccountDeleteAccountCredential_0100 getAccountCredential_err:" + JSON.stringify(err))
                        expect(err).assertEqual(null);
                        console.debug("====>ActsAccountDeleteAccountCredential_0100 getAccountCredential_success:" + JSON.stringify(data));
                        appAccountManager.deleteAccountCredential(name, "PIN", (err, data)=>{
                            console.debug("====>ActsAccountDeleteAccountCredential_0100 deleteAccountCredential_err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual(undefined);
                            console.debug("====>ActsAccountDeleteAccountCredential_0100 deleteAccountCredential_data:" + JSON.stringify(data));   
                            try{
                                appAccountManager.deleteAccount(name)  
                                console.debug('====>ActsAccountDeleteAccountCredential_0100 deleteAccount_success')                          
                                done(); 
                            }
                            catch{
                                console.debug('====>ActsAccountDeleteAccountCredential_0100 deleteAccount_err')
                                expect().assertFail()
                                done();
                            }
                        })                   
                    })                
                });
            });            
        });

        /*
        * @tc.number    : ActsAccountDeleteAccountCredential_0200
        * @tc.name      : Delete Account Credential promise form
        * @tc.desc      : 
        */

        it('ActsAccountDeleteAccountCredential_0200', 0, async function (done) {
            console.debug("====>ActsAccountDeleteAccountCredential_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount(name, 'test_extraInfo').then((data) =>{
                console.debug("====>ActsAccountDeleteAccountCredential_0200 add_account_success");
                appAccountManager.setAccountCredential(name, "PIN", '123456').then(() =>{
                    console.debug("====>ActsAccountDeleteAccountCredential_0200 setAccountCredential_success");
                    appAccountManager.getAccountCredential(name,  "PIN").then((data) =>{
                        console.debug("====>ActsAccountDeleteAccountCredential_0200 getAccountCredential_data:" + JSON.stringify(data));
                        appAccountManager.deleteAccountCredential(name,  "PIN").then((data) =>{
                            console.debug("====>ActsAccountDeleteAccountCredential_0200 data:" + JSON.stringify(data));                
                            try{
                                appAccountManager.deleteAccount(name)
                                console.debug('====>ActsAccountDeleteAccountCredential_0200 deleteAccount_success')
                                done();
                            }                               
                            catch{
                                console.debug('====>ActsAccountDeleteAccountCredential_0200 deleteAccount_err')
                                expect().assertFail()
                            }                          
                        }).catch((err) =>{
                            console.debug("====>ActsAccountDeleteAccountCredential_0200 err:" + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }).catch((err)=>{
                        console.debug("====>ActsAccountDeleteAccountCredential_0200 getAccountCredential_err:" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }).catch((err) =>{
                    console.debug("====>ActsAccountDeleteAccountCredential_0200 setAccountCredential_err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.debug("====>ActsAccountDeleteAccountCredential_0200 addAccount_err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            })            
        });

        /*
        * @tc.number    : ActsAccountVerifyCredential_0100
        * @tc.name      : Verify Credential callback form, options
        * @tc.desc      : 
        */

        it('ActsAccountVerifyCredential_0100', 0, async function (done) {
            console.debug("====>ActsAccountVerifyCredential_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            var options = {credentialType: "PIN", credential: "123456"}
            console.debug("====>start finish====");
            appAccountManager.addAccount(name, (err)=>{
                console.debug("====>ActsAccountVerifyCredential_0100 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.verifyCredential(name, owner, options, {
                    onResult: async (resultCode, resultData)=>{
                        console.debug("====>ActsAccountVerifyCredential_0100 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                        expect(resultCode).assertEqual(0)
                        console.debug("====>ActsAccountVerifyCredential_0100 verifyCredential_resultData:" + JSON.stringify(resultData));
                        expect(resultData.booleanResult).assertEqual(true) 
                        try{
                            await appAccountManager.deleteAccount(name)
                            console.debug('====>ActsAccountVerifyCredential_0100 deleteAccount_success')
                            done();
                        }                               
                        catch{
                            console.debug('====>ActsAccountVerifyCredential_0100 deleteAccount_err')
                            expect().assertFail()
                        }    
                        done(); 
                        },
                        onRequestRedirected:null,
                        onRequestContinued: function(){ 
                            console.debug("====>ActsAccountVerifyCredential_0100 verifyCredential_onRequestContinued")
                        }   
                });
            });            
        });

        /*
        * @tc.number    : ActsAccountVerifyCredential_0200
        * @tc.name      : Verify Credential callback form
        * @tc.desc      : 
        */

        it('ActsAccountVerifyCredential_0200', 0, async function (done) {
            console.debug("====>ActsAccountVerifyCredential_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>start finish====");
            appAccountManager.addAccount(name, (err)=>{
                console.debug("====>ActsAccountVerifyCredential_0200 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.verifyCredential(name, owner, {
                    onResult: async (resultCode, resultData)=>{
                        console.debug("====>ActsAccountVerifyCredential_0200 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                        expect(resultCode).assertEqual(0)
                        console.debug("====>ActsAccountVerifyCredential_0200 verifyCredential_resultData:" + JSON.stringify(resultData));
                        expect(resultData.booleanResult).assertEqual(false) 
                        try{
                            await appAccountManager.deleteAccount(name)
                            console.debug('====>ActsAccountVerifyCredential_0200 removeAccount_success')
                            done();
                        }                               
                        catch{
                            console.debug('====>ActsAccountVerifyCredential_0200 removeAccount_err')
                            expect().assertFail()
                        }    
                        done(); 
                        },
                    onRequestRedirected:null,
                    onRequestContinued: function(){ 
                        console.debug("====>ActsAccountVerifyCredential_0200 verifyCredential_onRequestContinued")
                    }   
                });
            });            
        });
        /*
        * @tc.number    : ActsAccountSetAuthenticatorProperties_0100
        * @tc.name      : Verify Credential callback form, options
        * @tc.desc      : 
        */

        it('ActsAccountSetAuthenticatorProperties_0100', 0, async function (done) {
            console.debug("====>ActsAccountSetAuthenticatorProperties_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            var options = {credentialType: "PIN", credential: "123456"}
            console.debug("====>start finish====");
            appAccountManager.addAccount(name, (err)=>{
                console.debug("====>ActsAccountSetAuthenticatorProperties_0100 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthenticatorProperties(owner, options,  {
                onResult: async (resultCode, resultData)=>{
                    console.debug("====>ActsAccountSetAuthenticatorProperties_0100 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                    expect(resultCode).assertEqual(10016)
                    console.debug("====>ActsAccountSetAuthenticatorProperties_0100 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                    try{
                        await appAccountManager.deleteAccount(name)
                        console.debug('====>ActsAccountSetAuthenticatorProperties_0100 deleteAccount_success')
                        done();
                    }                               
                    catch{
                        console.debug('====>ActsAccountSetAuthenticatorProperties_0100 deleteAccount_err')
                        expect().assertFail()
                    }    
                    done(); 
                    },
                    onRequestRedirected:null,
                    onRequestContinued: function(){ 
                        console.debug("====>ActsAccountSetAuthenticatorProperties_0100 verifyCredential_onRequestContinued")
                    }   
                });
            });            
        });

        /*
        * @tc.number    : ActsAccountSetAuthenticatorProperties_0200
        * @tc.name      : Verify Credential callback form
        * @tc.desc      : 
        */

        it('ActsAccountSetAuthenticatorProperties_0200', 0, async function (done) {
            console.debug("====>ActsAccountSetAuthenticatorProperties_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>start finish====");
            appAccountManager.addAccount(name, (err)=>{
                console.debug("====>ActsAccountSetAuthenticatorProperties_0200 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthenticatorProperties(owner, {
                onResult: async (resultCode, resultData)=>{
                    console.debug("====>ActsAccountSetAuthenticatorProperties_0200 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                    expect(resultCode).assertEqual(10016)
                    console.debug("====>ActsAccountSetAuthenticatorProperties_0200 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                    try{
                        await appAccountManager.deleteAccount(name)
                        console.debug('====>ActsAccountSetAuthenticatorProperties_0200 deleteAccount_success')
                        done();
                    }                               
                    catch{
                        console.debug('====>ActsAccountSetAuthenticatorProperties_0200 deleteAccount_err')
                        expect().assertFail()
                    }    
                    done(); 
                    },
                    onRequestRedirected:null,
                    onRequestContinued: function(){ 
                        console.debug("====>ActsAccountSetAuthenticatorProperties_0200 verifyCredential_onRequestContinued")
                    }   
                });
            });            
        });

        /*
        * @tc.number    : ActsAccountSelectAccountByOptions_0100
        * @tc.name      : Verify Credential callback form
        * @tc.desc      : 
        */

        it('ActsAccountSelectAccountByOptions_0100', 0, async function (done) {  
            console.debug("====>ActsAccountSelectAccountByOptions_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            var select_options = {allowedAccounts:[{"name":name,"owner":owner}]}
            console.debug("====>start finish====");
            appAccountManager.addAccount(name, async (err)=>{
                console.debug("====>ActsAccountSelectAccountByOptions_0100 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    var data = await appAccountManager.selectAccountsByOptions(select_options)
                    console.debug("====>ActsAccountSelectAccountByOptions_0100 data:" + JSON.stringify(data));
                    expect(data.length).assertEqual(1) 
                } catch(err) {
                    console.debug("====>ActsAccountSelectAccountByOptions_0100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null)
                }
                try{
                    appAccountManager.deleteAccount(name)
                    console.debug('====>ActsAccountSelectAccountByOptions_0100 deleteAccount_success')
                    done();
                }                               
                catch{
                    console.debug('====>ActsAccountSelectAccountByOptions_0100 deleteAccount_err')
                    expect().assertFail()
                    done();
                }  
            });        
        });

        /*
        * @tc.number    : ActsAccountSelectAccountByOptions_0100
        * @tc.name      : Verify Credential callback form
        * @tc.desc      : 
        */

        it('ActsAccountSelectAccountByOptions_0200', 0, async function (done) {            
            console.debug("====>ActsAccountSelectAccountByOptions_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            var select_options = {allowedOwners: [owner]}
            console.debug("====>start finish====");
            appAccountManager.addAccount(name, async (err)=>{
                console.debug("====>ActsAccountSelectAccountByOptions_0200 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    var data = await appAccountManager.selectAccountsByOptions(select_options)
                    console.debug("====>ActsAccountSelectAccountByOptions_0200 data:" + JSON.stringify(data));
                    expect(data.length).assertEqual(3)                
                } catch(err) {
                    console.debug("====>ActsAccountSelectAccountByOptions_0200 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null)
                }
                try{
                    appAccountManager.deleteAccount(name)
                    console.debug('====>ActsAccountSelectAccountByOptions_0200 deleteAccount_success')
                    done();
                }                               
                catch{
                    console.debug('====>ActsAccountSelectAccountByOptions_0200 deleteAccount_err')
                    expect().assertFail()
                    done();
                }    
            });        
        });

        /*
        * @tc.number    : ActsAccountSelectAccountByOptions_0100
        * @tc.name      : Verify Credential callback form
        * @tc.desc      : 
        */

        it('ActsAccountSelectAccountByOptions_0300', 0, async function (done) {
            console.debug("====>ActsAccountSelectAccountByOptions_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            var options = {requiredLabels: ["male", "30-40"]}
            console.debug("====>start finish====");
            appAccountManager.addAccount(name, async (err)=>{
                console.debug("====>ActsAccountSelectAccountByOptions_0300 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    var data = await appAccountManager.selectAccountsByOptions(options)
                    console.debug("====>ActsAccountSelectAccountByOptions_0300 data:" + JSON.stringify(data));
                    expect(data.length).assertEqual(1)                
                } catch(err) {
                    console.debug("====>ActsAccountSelectAccountByOptions_0300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null)
                }
                try{
                    appAccountManager.deleteAccount(name)
                    console.debug('====>ActsAccountSelectAccountByOptions_0300 deleteAccount_success')
                    done();
                }
                catch{
                    console.debug('====>ActsAccountSelectAccountByOptions_0300 deleteAccount_err')
                    expect().assertFail()
                    done();
                }
            });
        });
    })
}

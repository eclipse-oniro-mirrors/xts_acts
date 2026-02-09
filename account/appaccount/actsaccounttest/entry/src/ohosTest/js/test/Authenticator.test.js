/*
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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
const self_owner = 'com.example.actsaccounttest'
export default function ActsAccountAuthenticator() {
    describe('ActsAccountAuthenticator', function () {
        beforeAll(async function (done) {  
            console.info("====>accountauthenticatorbeforeAll start====");		
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
                    console.info("====>accountauthenticatorfeatureAbility.startAbility err:" + JSON.stringify(err))
                    console.info("====>accountauthenticatorfeatureAbility.startAbility data:" + JSON.stringify(data))
                    console.info("====>accountauthenticatorfeatureAbility.startAbility end")
                    done();
                }
            )
        });

        beforeEach(async function (done) {            
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
        });

        /**
         * @tc.name   ActsAccountCheckAccountLabels_0100
         * @tc.number ActsAccountCheckAccountLabels_0100
         * @tc.desc   checkAccountLabels
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ActsAccountCheckAccountLabels_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsAccountCheckAccountLabels_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>start finish====");
            appAccountManager.addAccount(name, 'test_extraInfo', (err)=>{
                console.info("====>ActsAccountCheckAccountLabels_0100 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAccountLabels(name, owner, ['level4'], (err, data)=>{
                    console.info("====>ActsAccountCheckAccountLabels_0100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.info("====>ActsAccountCheckAccountLabels_0100 data:" + JSON.stringify(data));
                    expect(data).assertEqual(true);
                    appAccountManager.deleteAccount(name, (err) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0100 deleteAccount_err:" + JSON.stringify(err))
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountCheckAccountLabels_0100 end====");
                        done();
                    })
                });
            });
        });

        /**
         * @tc.name   ActsAccountCheckAccountLabels_0200
         * @tc.number ActsAccountCheckAccountLabels_0200
         * @tc.desc   checkAccountLabels
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountCheckAccountLabels_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAccountLabels_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>start finish====");
            appAccountManager.addAccount(name, (err)=>{
                console.info("====>ActsAccountCheckAccountLabels_0200 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAccountLabels(name, owner, ['20-30'], (err, data)=>{
                    console.info("====>ActsAccountCheckAccountLabels_0200 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.info("====>ActsAccountCheckAccountLabels_0200 data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    appAccountManager.deleteAccount(name, (err) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0200 deleteAccount_err:" + JSON.stringify(err))
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountCheckAccountLabels_0200 end====");
                        done();
                    })
                });
            });
        });

        /**
         * @tc.name   ActsAccountCheckAccountLabels_0300
         * @tc.number ActsAccountCheckAccountLabels_0300
         * @tc.desc   checkAccountLabels
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountCheckAccountLabels_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAccountLabels_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>start finish====");
            appAccountManager.addAccount('CheckAccountLabels_0300', (err)=>{
                console.info("====>ActsAccountCheckAccountLabels_0300 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAccountLabels('CheckAccountLabels_0300', owner, ['male'], (err, data)=>{
                    console.info("====>ActsAccountCheckAccountLabels_0300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.info("====>ActsAccountCheckAccountLabels_0300 data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    appAccountManager.deleteAccount("CheckAccountLabels_0300", (err) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0300 deleteAccount_err:" + JSON.stringify(err))
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountCheckAccountLabels_0300 end====");
                        done();                     
                    })
                });
            });
        });

        /**
         * @tc.name   ActsAccountCheckAccountLabels_0400
         * @tc.number ActsAccountCheckAccountLabels_0400
         * @tc.desc   checkAccountLabels
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountCheckAccountLabels_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAccountLabels_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            await appAccountManager.addAccount(name, 'test_extraInfo').then((data) =>{
                console.info("====>ActsAccountCheckAccountLabels_0400 add_account_success");
                appAccountManager.checkAccountLabels(name, owner, ['level4']).then((data) =>{
                    console.info("====>ActsAccountCheckAccountLabels_0400 data:" + JSON.stringify(data));
                    expect(data).assertEqual(true);
                    appAccountManager.deleteAccount(name).then((data) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0400 delete_account_success");
                        done();
                    }).catch((err) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0400 delete_account_err");
                        expect().assertFail();
                        done();
                    });
                }).catch((err) =>{
                    console.info("====>ActsAccountCheckAccountLabels_0400 err:" + JSON.stringify(err))
                    expect(typeof(err) != undefined).assertTrue();
                    done();
                })
            }).catch((err) => {
                console.info("====>ActsAccountCheckAccountLabels_0400 add_account_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        });

        /**
         * @tc.name   ActsAccountCheckAccountLabels_0500
         * @tc.number ActsAccountCheckAccountLabels_0500
         * @tc.desc   checkAccountLabels
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountCheckAccountLabels_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAccountLabels_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            await appAccountManager.addAccount(name, 'test_extraInfo').then((data) =>{
                console.info("====>ActsAccountCheckAccountLabels_0500 add_account_success");
                appAccountManager.checkAccountLabels(name, owner, ['20-30']).then((data) =>{
                    console.info("====>ActsAccountCheckAccountLabels_0500 data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    expect(account.Constants.KEY_REQUIRED_LABELS).assertEqual('requiredLabels')
                    expect(account.Constants.KEY_BOOLEAN_RESULT).assertEqual('booleanResult')
                    appAccountManager.deleteAccount(name).then((data) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0500 delete_account_success");
                        done()
                    }).catch((err) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0500 delete_account_err");
                        done()
                    });
                }).catch((err) =>{
                    console.info("====>ActsAccountCheckAccountLabels_0500 err:" + JSON.stringify(err))
                    expect(typeof(err) != undefined).assertTrue();
                    done();
                })
            }).catch((err) => {
                console.info("====>ActsAccountCheckAccountLabels_0500 add_account_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        });

        /**
         * @tc.name   ActsAccountCheckAccountLabels_0600
         * @tc.number ActsAccountCheckAccountLabels_0600
         * @tc.desc   checkAccountLabels
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountCheckAccountLabels_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAccountLabels_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            await appAccountManager.addAccount('CheckAccountLabels_0600', 'test_extraInfo').then((data) =>{
                console.info("====>ActsAccountCheckAccountLabels_0600 add_account_success:" + JSON.stringify(data));
                appAccountManager.checkAccountLabels('CheckAccountLabels_0600', owner, ['male']).then((data) =>{
                    console.info("====>ActsAccountCheckAccountLabels_0600 data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    appAccountManager.deleteAccount('CheckAccountLabels_0600').then((data) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0600 delete_account_success");
                        done()
                    }).catch((err) =>{
                        console.info("====>ActsAccountCheckAccountLabels_0600 delete_account_err");
                        done()
                    });
                }).catch((err) =>{
                    console.info("====>ActsAccountCheckAccountLabels_0600 err:" + JSON.stringify(err))
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.info("====>ActsAccountCheckAccountLabels_0600 add_account_err:" + JSON.stringify(err))
                expect().assertFail();
                done();
            })
        });

        /**
         * @tc.name   ActsAccountCheckAppAccess_0100
         * @tc.number ActsAccountCheckAppAccess_0100
         * @tc.desc   checkAppAccess
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountCheckAppAccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAppAccess_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount(name, (err)=>{
                console.info("====>ActsAccountCheckAppAccess_0100 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.checkAppAccess(name, owner, (err, data)=>{
                    console.info("====>ActsAccountCheckAppAccess_0100 first_err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    console.info("====>ActsAccountCheckAppAccess_0100 first_data:" + JSON.stringify(data));
                    expect(data).assertEqual(false)
                    appAccountManager.enableAppAccess(name, owner, (err, data) =>{
                        console.info("====>ActsAccountCheckAppAccess_0100 enableAppAccess_err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.checkAppAccess(name, owner, (err, data) =>{
                            console.info("====>ActsAccountCheckAppAccess_0100 second_err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual(true)
                            appAccountManager.disableAppAccess(name, owner, (err, data) =>{
                                console.info("====>ActsAccountCheckAppAccess_0100 disableAppAccount_err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);  
                                appAccountManager.checkAppAccess(name, owner, async (err, data)=>{
                                    console.info("====>ActsAccountCheckAppAccess_0100 third_err:" + JSON.stringify(err))
                                    expect(err).assertEqual(null)
                                    expect(data).assertEqual(false)
                                    try {
                                        await appAccountManager.deleteAccount(name)
                                        console.info('====>ActsAccountCheckAppAccess_0100 deleteAccount_success')
                                    }
                                    catch{
                                        console.info('====>ActsAccountCheckAppAccess_0100 deleteAccount_err')
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

        /**
         * @tc.name   ActsAccountCheckAppAccess_0200
         * @tc.number ActsAccountCheckAppAccess_0200
         * @tc.desc   checkAppAccess
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountCheckAppAccess_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountCheckAppAccess_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount(name, 'test_extraInfo').then((data) =>{
                console.info("====>ActsAccountCheckAppAccess_0200 add_account_success:");
                appAccountManager.checkAppAccess(name, owner).then((data) =>{
                    console.info("====>ActsAccountCheckAppAccess_0200 first_data:" + JSON.stringify(data));
                    expect(data).assertEqual(false);
                    appAccountManager.enableAppAccess(name, owner).then((data) =>{
                        console.info("====>ActsAccountCheckAppAccess_0200 enableAppAccess_success");
                        appAccountManager.checkAppAccess(name, owner).then((data) =>{
                            console.info("====>ActsAccountCheckAppAccess_0200 second_data:" + JSON.stringify(data));
                            expect(data).assertEqual(true);
                            appAccountManager.disableAppAccess(name, owner).then((data)=>{
                                console.info("====>ActsAccountCheckAppAccess_0200 disabAppAccess_data:" + JSON.stringify(data));
                                appAccountManager.checkAppAccess(name, owner).then(async (data) =>{
                                    console.info("====>ActsAccountCheckAppAccess_0200 third_data:" + JSON.stringify(data));
                                    expect(data).assertEqual(false);
                                    try{
                                        await appAccountManager.deleteAccount(name)
                                        console.info('====>ActsAccountCheckAppAccess_0200 deleteAccount_success')
                                    }
                                    catch{
                                        console.info('====>ActsAccountCheckAppAccess_0100 deleteAccount_err')
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
                console.info("====>ActsAccountCheckAppAccess_0200 addAccount_err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            })
                
        });

        /**
         * @tc.name   ActsAccountDeleteAccountCredential_0100
         * @tc.number ActsAccountDeleteAccountCredential_0100
         * @tc.desc   setAccountCredential
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountDeleteAccountCredential_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountDeleteAccountCredential_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>start finish====");
            appAccountManager.addAccount(name, (err)=>{
                console.info("====>ActsAccountDeleteAccountCredential_0100 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAccountCredential(name, "PIN", '123456',  (err, data)=>{
                    console.info("====>ActsAccountDeleteAccountCredential_0100 setAccountCredential_err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAccountCredential(name, "PIN", (err, data) =>{
                        console.info("====>ActsAccountDeleteAccountCredential_0100 getAccountCredential_err:" + JSON.stringify(err))
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountDeleteAccountCredential_0100 getAccountCredential_success:" + JSON.stringify(data));
                        appAccountManager.deleteAccountCredential(name, "PIN", async (err, data)=>{
                            console.info("====>ActsAccountDeleteAccountCredential_0100 deleteAccountCredential_err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual(undefined);
                            console.info("====>ActsAccountDeleteAccountCredential_0100 deleteAccountCredential_data:" + JSON.stringify(data));   
                            try{
                                await appAccountManager.deleteAccount(name)  
                                console.info('====>ActsAccountDeleteAccountCredential_0100 deleteAccount_success')
                            }
                            catch{
                                console.info('====>ActsAccountDeleteAccountCredential_0100 deleteAccount_err')
                                expect().assertFail()
                            }
                            done();
                        })                   
                    })                
                });
            });            
        });

        /**
         * @tc.name   ActsAccountDeleteAccountCredential_0200
         * @tc.number ActsAccountDeleteAccountCredential_0200
         * @tc.desc   setAccountCredential
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountDeleteAccountCredential_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountDeleteAccountCredential_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            appAccountManager.addAccount(name, 'test_extraInfo').then((data) =>{
                console.info("====>ActsAccountDeleteAccountCredential_0200 add_account_success");
                appAccountManager.setAccountCredential(name, "PIN", '123456').then(() =>{
                    console.info("====>ActsAccountDeleteAccountCredential_0200 setAccountCredential_success");
                    appAccountManager.getAccountCredential(name,  "PIN").then((data) =>{
                        console.info("====>ActsAccountDeleteAccountCredential_0200 getAccountCredential_data:" + JSON.stringify(data));
                        appAccountManager.deleteAccountCredential(name,  "PIN").then(async (data) =>{
                            console.info("====>ActsAccountDeleteAccountCredential_0200 data:" + JSON.stringify(data));                
                            try{
                                await appAccountManager.deleteAccount(name)
                                console.info('====>ActsAccountDeleteAccountCredential_0200 deleteAccount_success')
                            }                               
                            catch{
                                console.info('====>ActsAccountDeleteAccountCredential_0200 deleteAccount_err')
                                expect().assertFail()
                            } 
                            done();                         
                        }).catch((err) =>{
                            console.info("====>ActsAccountDeleteAccountCredential_0200 err:" + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }).catch((err)=>{
                        console.info("====>ActsAccountDeleteAccountCredential_0200 getAccountCredential_err:" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }).catch((err) =>{
                    console.info("====>ActsAccountDeleteAccountCredential_0200 setAccountCredential_err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.info("====>ActsAccountDeleteAccountCredential_0200 addAccount_err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            })            
        });

        /**
         * @tc.name   ActsAccountVerifyCredential_0100
         * @tc.number ActsAccountVerifyCredential_0100
         * @tc.desc   verifyCredential
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountVerifyCredential_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountVerifyCredential_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            var options = {credentialType: "PIN", credential: "123456"}
            console.info("====>start finish====");
            appAccountManager.addAccount(name, (err)=>{
                console.info("====>ActsAccountVerifyCredential_0100 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.verifyCredential(name, owner, options, {
                    onResult: async (resultCode, resultData)=>{
                        console.info("====>ActsAccountVerifyCredential_0100 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                        expect(resultCode).assertEqual(0)
                        console.info("====>ActsAccountVerifyCredential_0100 verifyCredential_resultData:" + JSON.stringify(resultData));
                        expect(resultData.booleanResult).assertEqual(true) 
                        try{
                            await appAccountManager.deleteAccount(name)
                            console.info('====>ActsAccountVerifyCredential_0100 deleteAccount_success')
                        }                               
                        catch{
                            console.info('====>ActsAccountVerifyCredential_0100 deleteAccount_err')
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

        /**
         * @tc.name   ActsAccountVerifyCredential_0200
         * @tc.number ActsAccountVerifyCredential_0200
         * @tc.desc   verifyCredential
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountVerifyCredential_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountVerifyCredential_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>start finish====");
            appAccountManager.addAccount(name, (err)=>{
                console.info("====>ActsAccountVerifyCredential_0200 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.verifyCredential(name, owner, {
                    onResult: async (resultCode, resultData)=>{
                        console.info("====>ActsAccountVerifyCredential_0200 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                        expect(resultCode).assertEqual(0)
                        console.info("====>ActsAccountVerifyCredential_0200 verifyCredential_resultData:" + JSON.stringify(resultData));
                        expect(resultData.booleanResult).assertEqual(false) 
                        try{
                            await appAccountManager.deleteAccount(name)
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

        /**
         * @tc.name   ActsAccountSetAuthenticatorProperties_0100
         * @tc.number ActsAccountSetAuthenticatorProperties_0100
         * @tc.desc   setAuthenticatorProperties
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSetAuthenticatorProperties_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetAuthenticatorProperties_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            var options = {credentialType: "PIN", credential: "123456"}
            console.info("====>start finish====");
            appAccountManager.addAccount(name, (err)=>{
                console.info("====>ActsAccountSetAuthenticatorProperties_0100 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthenticatorProperties(owner, options,  {
                onResult: async (resultCode, resultData)=>{
                    console.info("====>ActsAccountSetAuthenticatorProperties_0100 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                    expect(resultCode).assertEqual(10016)
                    console.info("====>ActsAccountSetAuthenticatorProperties_0100 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                    try{
                        await appAccountManager.deleteAccount(name)
                        console.info('====>ActsAccountSetAuthenticatorProperties_0100 deleteAccount_success')
                    } catch {
                        console.info('====>ActsAccountSetAuthenticatorProperties_0100 deleteAccount_err')
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

        /**
         * @tc.name   ActsAccountSetAuthenticatorProperties_0200
         * @tc.number ActsAccountSetAuthenticatorProperties_0200
         * @tc.desc   setAuthenticatorProperties
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSetAuthenticatorProperties_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetAuthenticatorProperties_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>start finish====");
            appAccountManager.addAccount(name, (err)=>{
                console.info("====>ActsAccountSetAuthenticatorProperties_0200 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAuthenticatorProperties(owner, {
                onResult: async (resultCode, resultData)=>{
                    console.info("====>ActsAccountSetAuthenticatorProperties_0200 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                    expect(resultCode).assertEqual(10016)
                    console.info("====>ActsAccountSetAuthenticatorProperties_0200 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                    try{
                        await appAccountManager.deleteAccount(name)
                        console.info('====>ActsAccountSetAuthenticatorProperties_0200 deleteAccount_success')
                    } catch {
                        console.info('====>ActsAccountSetAuthenticatorProperties_0200 deleteAccount_err')
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

        /**
         * @tc.name   ActsAccountSelectAccountByOptions_0100
         * @tc.number ActsAccountSelectAccountByOptions_0100
         * @tc.desc   SelectAccountsByOptions Promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSelectAccountByOptions_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSelectAccountByOptions_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            var select_options = {allowedAccounts:[{"name":name,"owner":owner}]}
            console.info("====>start finish====");
            appAccountManager.addAccount(name, async (err)=>{
                console.info("====>ActsAccountSelectAccountByOptions_0100 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    var data = await appAccountManager.selectAccountsByOptions(select_options)
                    console.info("====>ActsAccountSelectAccountByOptions_0100 data:" + JSON.stringify(data));
                    expect(data.length).assertEqual(1)
                } catch(err) {
                    console.info("====>ActsAccountSelectAccountByOptions_0100 err:" + JSON.stringify(err));
                    await appAccountManager.deleteAccount(name)
                    expect().assertFail()
                    done();
                    return
                }
                try{
                    await appAccountManager.deleteAccount(name)
                    console.info('====>ActsAccountSelectAccountByOptions_0100 deleteAccount_success')
                } catch {
                    console.info('====>ActsAccountSelectAccountByOptions_0100 deleteAccount_err')
                    expect().assertFail()
                }
                done();
            });
        });

        /**
         * @tc.name   ActsAccountSelectAccountByOptions_0200
         * @tc.number ActsAccountSelectAccountByOptions_0200
         * @tc.desc   SelectAccountsByOptions Promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSelectAccountByOptions_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSelectAccountByOptions_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            var select_options = {allowedOwners: [owner]}
            console.info("====>start finish====");
            appAccountManager.addAccount(name, async (err)=>{
                console.info("====>ActsAccountSelectAccountByOptions_0200 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    var data = await appAccountManager.selectAccountsByOptions(select_options)
                    console.info("====>ActsAccountSelectAccountByOptions_0200 data:" + JSON.stringify(data));
                    expect(data.length).assertEqual(3)
                } catch(err) {
                    console.info("====>ActsAccountSelectAccountByOptions_0200 err:" + JSON.stringify(err));
                    await appAccountManager.deleteAccount(name)
                    expect().assertFail()
                    done();
                    return
                }
                try{
                    await appAccountManager.deleteAccount(name)
                    console.info('====>ActsAccountSelectAccountByOptions_0200 deleteAccount_success')
                } catch {
                    console.info('====>ActsAccountSelectAccountByOptions_0200 deleteAccount_err')
                    expect().assertFail()
                }
                done();
            });
        });

        /**
         * @tc.name   ActsAccountSelectAccountByOptions_0300
         * @tc.number ActsAccountSelectAccountByOptions_0300
         * @tc.desc   SelectAccountsByOptions Promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSelectAccountByOptions_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSelectAccountByOptions_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            var options = {requiredLabels: ["male", "30-40"]}
            console.info("====>start finish====");
            appAccountManager.addAccount(name, async (err)=>{
                console.info("====>ActsAccountSelectAccountByOptions_0300 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    var data = await appAccountManager.selectAccountsByOptions(options)
                    console.info("====>ActsAccountSelectAccountByOptions_0300 data:" + JSON.stringify(data));
                    expect(data.length).assertEqual(1)
                } catch(err) {
                    console.info("====>ActsAccountSelectAccountByOptions_0300 err:" + JSON.stringify(err));
                    await appAccountManager.deleteAccount(name)
                    expect().assertFail()
                    done();
                    return
                }
                try{
                    await appAccountManager.deleteAccount(name)
                    console.info('====>ActsAccountSelectAccountByOptions_0300 deleteAccount_success')
                } catch {
                    console.info('====>ActsAccountSelectAccountByOptions_0300 deleteAccount_err')
                    expect().assertFail()
                }
                done();
            });
        });

        /**
         * @tc.name   ActsAccountSelectAccountByOptions_0400
         * @tc.number ActsAccountSelectAccountByOptions_0400
         * @tc.desc   SelectAccountsByOptions Callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSelectAccountByOptions_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSelectAccountByOptions_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            var select_options = {allowedAccounts:[{"name":name,"owner":owner}]}
            console.info("====>start finish====");
            appAccountManager.addAccount(name, async (err)=>{
                console.info("====>ActsAccountSelectAccountByOptions_0400 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    appAccountManager.selectAccountsByOptions(select_options, async (err, data) => {
                        console.info("====>ActsAccountSelectAccountByOptions_0400 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null)
                        expect(data.length).assertEqual(1)
                        await appAccountManager.deleteAccount(name)
                        console.info('====>ActsAccountSelectAccountByOptions_0400 deleteAccount_success')
                        done();
                    })
                } catch(err) {
                    console.info("====>ActsAccountSelectAccountByOptions_0400 err:" + JSON.stringify(err));
                    await appAccountManager.deleteAccount(name)
                    expect().assertFail()
                    done();
                }
            });
        });

        /**
         * @tc.name   ActsAccountSelectAccountByOptions_0500
         * @tc.number ActsAccountSelectAccountByOptions_0500
         * @tc.desc   SelectAccountsByOptions Callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSelectAccountByOptions_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSelectAccountByOptions_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            var select_options = {allowedOwners: [owner]}
            console.info("====>start finish====");
            appAccountManager.addAccount(name, async (err)=>{
                console.info("====>ActsAccountSelectAccountByOptions_0500 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    appAccountManager.selectAccountsByOptions(select_options, async (err, data) => {
                        console.info("====>ActsAccountSelectAccountByOptions_0500 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null)
                        expect(data.length).assertEqual(3)
                        await appAccountManager.deleteAccount(name)
                        console.info('====>ActsAccountSelectAccountByOptions_0500 deleteAccount_success')
                        done();
                    })
                } catch(err) {
                    console.info("====>ActsAccountSelectAccountByOptions_0500 err:" + JSON.stringify(err));
                    await appAccountManager.deleteAccount(name)
                    expect().assertFail()
                    done();
                }
            });
        });

        /**
         * @tc.name   ActsAccountSelectAccountByOptions_0600
         * @tc.number ActsAccountSelectAccountByOptions_0600
         * @tc.desc   SelectAccountsByOptions Callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSelectAccountByOptions_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSelectAccountByOptions_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            var options = {requiredLabels: ["male", "30-40"]}
            console.info("====>start finish====");
            appAccountManager.addAccount(name, async (err)=>{
                console.info("====>ActsAccountSelectAccountByOptions_0600 add_account_err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                try {
                    appAccountManager.selectAccountsByOptions(options, async (err, data) => {
                        console.info("====>ActsAccountSelectAccountByOptions_0600 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null)
                        expect(data.length).assertEqual(1)
                        await appAccountManager.deleteAccount(name)
                        console.info('====>ActsAccountSelectAccountByOptions_0600 deleteAccount_success')
                        done();
                    })
                } catch(err) {
                    console.info("====>ActsAccountSelectAccountByOptions_0600 err:" + JSON.stringify(err));
                    await appAccountManager.deleteAccount(name)
                    expect().assertFail()
                    done();
                }
            });
        });
    })
}

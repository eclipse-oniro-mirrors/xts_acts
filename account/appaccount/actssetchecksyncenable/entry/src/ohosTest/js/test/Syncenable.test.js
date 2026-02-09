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
import featureAbility from "@ohos.ability.featureAbility";
import { UiDriver, BY } from '@ohos.UiTest';

export default function ActsSetCheckSyncEnable() {
    describe('ActsSetCheckSyncEnable', function () {
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
        
        beforeAll(async function (done) {
            console.info("====>beforeAll start");
            console.info(`====>getPermission is start`);
            let permissions = ['ohos.permission.DISTRIBUTED_DATASYNC'];
            let context = featureAbility.getContext();
            context.requestPermissionsFromUser(permissions, 666, (data) => {
                console.info("====>request success" + JSON.stringify(data));
                console.info("====>beforeAll end");
                done();
            })
            await sleep(1000);
            try {
                let driver = await UiDriver.create();
                console.info(`====>come in driveFn`);
                await sleep(1000);
                console.info(`====>driver is ${JSON.stringify(driver)}`);
                let button = await driver.findComponent(BY.text('允许'));
                console.info(`====>button is ${JSON.stringify(button)}`);
                await button.click();
            } catch (err) {
                console.info('====>err is ' + err);
                done();
                return;
            };
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_0100
         * @tc.number ActsSetCheckSyncEnable_0100
         * @tc.desc   Get the synchronization flag of the account that has not set the synchronization flag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_notset", (err)=>{
                console.info("====>add account ActsSetCheckSyncEnable_0100 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                appAccountManager.checkAppAccountSyncEnable("syncenable_callback_notset", (err, data)=>{
                    console.info("====>checkAppAccountSyncEnable 0100 err:" + JSON.stringify(err));
                    console.info("====>checkAppAccountSyncEnable 0100 data:" + JSON.stringify(data));
                    try {
                        expect(err).assertEqual(null);
                        expect(data).assertEqual(false);
                    } catch (err) {
                        console.info("====>Assert Fail:" + JSON.stringify(err));
                    }
                    appAccountManager.deleteAccount("syncenable_callback_notset", (err)=>{
                        console.info("====>delete Account ActsSetCheckSyncEnable_0100 err:" + JSON.stringify(err));
                        try {
                            expect(err).assertEqual(null);
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        console.info("====>ActsSetCheckSyncEnable_0100 end====");
                        done();
                    });
                })
            });
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_0200
         * @tc.number ActsSetCheckSyncEnable_0200
         * @tc.desc   Get the synchronization flag of the account that has not set the synchronization flag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckSyncEnable_0200 start====");
            try{
                await appAccountManager.addAccount("syncenable_promise_notset");
            }
            catch(err){
                console.error("====>add account ActsSetCheckSyncEnable_0200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_0200 start====");
            try{
                let data = await appAccountManager.checkAppAccountSyncEnable("syncenable_promise_notset");
                console.info("====>checkAppAccountSyncEnable 0200 data:" + JSON.stringify(data));
                expect(data).assertEqual(false);
            }  catch(err){
                console.error("====>checkAppAccountSyncEnable 0200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>delete account ActsSetCheckSyncEnable_0200 start====");
            try{
                await appAccountManager.deleteAccount("syncenable_promise_notset");
            }
            catch(err){
                console.error("====>delete account 0200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckSyncEnable_0200 end====");
            done();
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_0300
         * @tc.number ActsSetCheckSyncEnable_0300
         * @tc.desc   Check the synchronization flag after setting the synchronization flag to true for the account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ActsSetCheckSyncEnable_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_settrue", (err)=>{
                console.info("====>add account ActsSetCheckSyncEnable_0300 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                appAccountManager.setAppAccountSyncEnable("syncenable_callback_settrue", true, (err)=>{
                    console.info("====>setAppAccountSyncEnable 0300 err:" + JSON.stringify(err));
                    try {
                        expect(err).assertEqual(null);
                    } catch (err) {
                        console.info("====>Assert Fail:" + JSON.stringify(err));
                    }
                    appAccountManager.checkAppAccountSyncEnable("syncenable_callback_settrue", (err, data)=>{
                        console.info("====>checkAppAccountSyncEnable 0300 err:" + JSON.stringify(err));
                        console.info("====>checkAppAccountSyncEnable 0300 data:" + JSON.stringify(data));
                        try {
                            expect(err).assertEqual(null);
                            expect(data).assertEqual(true);
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        appAccountManager.deleteAccount("syncenable_callback_settrue", (err)=>{
                            console.info("====>delete Account ActsSetCheckSyncEnable_0300 err:" + JSON.stringify(err));
                            try {
                                expect(err).assertEqual(null);
                            } catch (err) {
                                console.info("====>Assert Fail:" + JSON.stringify(err));
                            }
                            console.info("====>ActsSetCheckSyncEnable_0300 end====");
                            done();
                        });
                    })
                })
            });
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_0400
         * @tc.number ActsSetCheckSyncEnable_0400
         * @tc.desc   Check the synchronization flag after setting the synchronization flag to true for the account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ActsSetCheckSyncEnable_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckSyncEnable_0400 start====");
            try{
                await appAccountManager.addAccount("syncenable_promise_settrue");
            }
            catch(err){
                console.error("====>add account ActsSetCheckSyncEnable_0400 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>setAppAccountSyncEnable ActsSetCheckSyncEnable_0400 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_settrue", true);
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_0400 start====");
            try{
                let data = await appAccountManager.checkAppAccountSyncEnable("syncenable_promise_settrue");
                console.info("====>checkAppAccountSyncEnable 0400 data:" + JSON.stringify(data));
                expect(data).assertEqual(true);
            } catch(err){
                console.error("====>checkAppAccountSyncEnable 0400 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>delete account ActsSetCheckSyncEnable_0400 start====");
            try{
                await appAccountManager.deleteAccount("syncenable_promise_settrue");
            }
            catch(err){
                console.error("====>delete account 0400 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckSyncEnable_0400 end====");
            done();
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_0500
         * @tc.number ActsSetCheckSyncEnable_0500
         * @tc.desc   Check the synchronization flag after setting the synchronization flag to false for the account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_setfalse", (err)=>{
                console.info("====>add account ActsSetCheckSyncEnable_0500 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                appAccountManager.setAppAccountSyncEnable("syncenable_callback_setfalse", false, (err)=>{
                    console.info("====>setAppAccountSyncEnable 0500 err:" + JSON.stringify(err));
                    try {
                        expect(err).assertEqual(null);
                    } catch (err) {
                        console.info("====>Assert Fail:" + JSON.stringify(err));
                    }
                    appAccountManager.checkAppAccountSyncEnable("syncenable_callback_setfalse", (err, data)=>{
                        console.info("====>checkAppAccountSyncEnable 0500 err:" + JSON.stringify(err));
                        console.info("====>checkAppAccountSyncEnable 0500 data:" + JSON.stringify(data));
                        try {
                            expect(err).assertEqual(null);
                            expect(data).assertEqual(false);
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        appAccountManager.deleteAccount("syncenable_callback_setfalse", (err)=>{
                            console.info("====>delete Account ActsSetCheckSyncEnable_0500 err:" + JSON.stringify(err));
                            try {
                                expect(err).assertEqual(null);
                            } catch (err) {
                                console.info("====>Assert Fail:" + JSON.stringify(err));
                            }
                            console.info("====>ActsSetCheckSyncEnable_0500 end====");
                            done();
                        });
                    })
                })
            });
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_0600
         * @tc.number ActsSetCheckSyncEnable_0600
         * @tc.desc   Check the synchronization flag after setting the synchronization flag to false for the account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckSyncEnable_0600 start====");
            try{
                await appAccountManager.addAccount("syncenable_promise_setfalse");
            }
            catch(err){
                console.error("====>add account ActsSetCheckSyncEnable_0600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>setAppAccountSyncEnable ActsSetCheckSyncEnable_0600 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_setfalse", false);
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_0600 start====");
            try{
                var data = await appAccountManager.checkAppAccountSyncEnable("syncenable_promise_setfalse");
            }
            catch(err){
                console.error("====>checkAppAccountSyncEnable 0600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkAppAccountSyncEnable 0600 data:" + JSON.stringify(data));
            expect(data).assertEqual(false);
            console.info("====>delete account ActsSetCheckSyncEnable_0600 start====");
            try{
                await appAccountManager.deleteAccount("syncenable_promise_setfalse");
            }
            catch(err){
                console.error("====>delete account 0600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckSyncEnable_0600 end====");
            done();
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_0700
         * @tc.number ActsSetCheckSyncEnable_0700
         * @tc.desc   Check the synchronization flag after setting the synchronization flag for the account to false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_falsetrue", (err)=>{
                console.info("====>add account ActsSetCheckSyncEnable_0700 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                appAccountManager.setAppAccountSyncEnable("syncenable_callback_falsetrue", false, (err)=>{
                    console.info("====>setAppAccountSyncEnable first time 0700 err:" + JSON.stringify(err));
                    try {
                        expect(err).assertEqual(null);
                    } catch (err) {
                        console.info("====>Assert Fail:" + JSON.stringify(err));
                    }
                    appAccountManager.setAppAccountSyncEnable("syncenable_callback_falsetrue", true, (err)=>{
                        console.info("====>setAppAccountSyncEnable second time 0700 err:" + JSON.stringify(err));
                        try {
                            expect(err).assertEqual(null);
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        appAccountManager.checkAppAccountSyncEnable("syncenable_callback_falsetrue", (err, data)=>{
                            console.info("====>checkAppAccountSyncEnable 0700 err:" + JSON.stringify(err));
                            console.info("====>checkAppAccountSyncEnable 0700 data:" + JSON.stringify(data));
                            try {
                                expect(err).assertEqual(null);
                                expect(data).assertEqual(true);
                            } catch (err) {
                                console.info("====>Assert Fail:" + JSON.stringify(err));
                            }
                            appAccountManager.deleteAccount("syncenable_callback_falsetrue", (err)=>{
                                console.info("====>delete Account 0700 err:" + JSON.stringify(err));
                                try {
                                    expect(err).assertEqual(null);
                                } catch (err) {
                                    console.info("====>Assert Fail:" + JSON.stringify(err));
                                }
                                console.info("====>ActsSetCheckSyncEnable_0700 end====");
                                done();
                            });
                        })
                    })
                })
            });
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_0800
         * @tc.number ActsSetCheckSyncEnable_0800
         * @tc.desc   Check the synchronization flag after setting the synchronization flag for the account to false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckSyncEnable_0800 start====");
            await appAccountManager.addAccount("syncenable_promise_truefalse");
            console.info("====>setAppAccountSyncEnable first time ActsSetCheckSyncEnable_0800 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_truefalse", false);
            console.info("====>setAppAccountSyncEnable second time ActsSetCheckSyncEnable_0800 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_truefalse", true);
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_0800 start====");
            try{
                var data = await appAccountManager.checkAppAccountSyncEnable("syncenable_promise_truefalse");
            }
            catch(err){
                console.error("====>checkAppAccountSyncEnable 0800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkAppAccountSyncEnable 0800 data:" + JSON.stringify(data));
            expect(data).assertEqual(true);
            console.info("====>delete account ActsSetCheckSyncEnable_0800 start====");
            try{
                await appAccountManager.deleteAccount("syncenable_promise_truefalse");
            }
            catch(err){
                console.error("====>delete account 0800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckSyncEnable_0800 end====");
            done();
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_0900
         * @tc.number ActsSetCheckSyncEnable_0900
         * @tc.desc   Check the synchronization flag after setting the synchronization flag for the account to true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_falsetrue", (err)=>{
                console.info("====>add account ActsSetCheckSyncEnable_0900 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                appAccountManager.setAppAccountSyncEnable("syncenable_callback_falsetrue", true, (err)=>{
                    console.info("====>setAppAccountSyncEnable first time 0900 err:" + JSON.stringify(err));
                    try {
                        expect(err).assertEqual(null);
                    } catch (err) {
                        console.info("====>Assert Fail:" + JSON.stringify(err));
                    }
                    appAccountManager.setAppAccountSyncEnable("syncenable_callback_falsetrue", false, (err)=>{
                        console.info("====>setAppAccountSyncEnable second time 0900 err:" + JSON.stringify(err));
                        try {
                            expect(err).assertEqual(null);
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        appAccountManager.checkAppAccountSyncEnable("syncenable_callback_falsetrue", (err, data)=>{
                            console.info("====>checkAppAccountSyncEnable 0900 err:" + JSON.stringify(err));
                            console.info("====>checkAppAccountSyncEnable 0900 data:" + JSON.stringify(data));
                            try {
                                expect(err).assertEqual(null);
                                expect(data).assertEqual(false);
                            } catch (err) {
                                console.info("====>Assert Fail:" + JSON.stringify(err));
                            }
                            appAccountManager.deleteAccount("syncenable_callback_falsetrue", (err)=>{
                                console.info("====>delete Account 0900 err:" + JSON.stringify(err));
                                try {
                                    expect(err).assertEqual(null);
                                } catch (err) {
                                    console.info("====>Assert Fail:" + JSON.stringify(err));
                                }
                                console.info("====>ActsSetCheckSyncEnable_0900 end====");
                                done();
                            });
                        })
                    })
                })
            });
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_1000
         * @tc.number ActsSetCheckSyncEnable_1000
         * @tc.desc   Check the synchronization flag after setting the synchronization flag for the account to true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckSyncEnable_1000 start====");
            await appAccountManager.addAccount("syncenable_promise_truefalse");
            console.info("====>setAppAccountSyncEnable first time ActsSetCheckSyncEnable_1000 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_truefalse", true);
            console.info("====>setAppAccountSyncEnable second time ActsSetCheckSyncEnable_1000 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_truefalse", false);
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_1000 start====");
            try{
                var data = await appAccountManager.checkAppAccountSyncEnable("syncenable_promise_truefalse");
            }
            catch(err){
                console.error("====>checkAppAccountSyncEnable 1000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkAppAccountSyncEnable 1000 data:" + JSON.stringify(data));
            expect(data).assertEqual(false);
            console.info("====>delete account ActsSetCheckSyncEnable_1000 start====");
            try{
                await appAccountManager.deleteAccount("syncenable_promise_truefalse");
            }
            catch(err){
                console.error("====>delete account 1000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckSyncEnable_1000 end====");
            done();
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_1100
         * @tc.number ActsSetCheckSyncEnable_1100
         * @tc.desc   Check the synchronization flag after setting the synchronization flag for the account to true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("syncenable_callback_truetrue", (err)=>{
                console.info("====>add account ActsSetCheckSyncEnable_1100 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                appAccountManager.setAppAccountSyncEnable("syncenable_callback_truetrue", true, (err)=>{
                    console.info("====>setAppAccountSyncEnable first time 1100 err:" + JSON.stringify(err));
                    try {
                        expect(err).assertEqual(null);
                    } catch (err) {
                        console.info("====>Assert Fail:" + JSON.stringify(err));
                    }
                    appAccountManager.setAppAccountSyncEnable("syncenable_callback_truetrue", true, (err)=>{
                        console.info("====>setAppAccountSyncEnable second time 1100 err:" + JSON.stringify(err));
                        try {
                            expect(err).assertEqual(null);
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        appAccountManager.checkAppAccountSyncEnable("syncenable_callback_truetrue", (err, data)=>{
                            console.info("====>checkAppAccountSyncEnable 1100 err:" + JSON.stringify(err));
                            console.info("====>checkAppAccountSyncEnable 1100 data:" + JSON.stringify(data));
                            try {
                                expect(err).assertEqual(null);
                                expect(data).assertEqual(true);
                            } catch (err) {
                                console.info("====>Assert Fail:" + JSON.stringify(err));
                            }
                            appAccountManager.deleteAccount("syncenable_callback_truetrue", (err)=>{
                                console.info("====>delete Account 1100 err:" + JSON.stringify(err));
                                try {
                                    expect(err).assertEqual(null);
                                } catch (err) {
                                    console.info("====>Assert Fail:" + JSON.stringify(err));
                                }
                                console.info("====>ActsSetCheckSyncEnable_1100 end====");
                                done();
                            });
                        })
                    })
                })
            });
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_1200
         * @tc.number ActsSetCheckSyncEnable_1200
         * @tc.desc   Check the synchronization flag after setting the synchronization flag for the account to true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckSyncEnable_1200 start====");
            await appAccountManager.addAccount("syncenable_promise_truetrue");
            console.info("====>setAppAccountSyncEnable first time ActsSetCheckSyncEnable_1200 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_truetrue", true);
            console.info("====>setAppAccountSyncEnable second time ActsSetCheckSyncEnable_1200 start====");
            await appAccountManager.setAppAccountSyncEnable("syncenable_promise_truetrue", true);
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_1200 start====");
            try{
                var data = await appAccountManager.checkAppAccountSyncEnable("syncenable_promise_truetrue");
            }
            catch(err){
                console.error("====>checkAppAccountSyncEnable 1200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkAppAccountSyncEnable 1200 data:" + JSON.stringify(data));
            expect(data).assertEqual(true);
            console.info("====>delete account ActsSetCheckSyncEnable_1200 start====");
            try{
                await appAccountManager.deleteAccount("syncenable_promise_truetrue");
            }
            catch(err){
                console.error("====>delete account 1200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckSyncEnable_1200 end====");
            done();
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_1300
         * @tc.number ActsSetCheckSyncEnable_1300
         * @tc.desc   Set synchronization flag for non-existent account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>setAppAccountSyncEnable ActsSetCheckSyncEnable_1300 start====")
            var accountNotExist = "syncenable_callback_notexist";
            appAccountManager.setAppAccountSyncEnable(accountNotExist, true, (err)=>{
                console.info("====>setAppAccountSyncEnable 1300 err:" + JSON.stringify(err));
                try {
                    expect(err.code != 0).assertEqual(true);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                console.info("====>ActsSetCheckSyncEnable_1300 end====");
                done();
            });
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_1400
         * @tc.number ActsSetCheckSyncEnable_1400
         * @tc.desc   Set synchronization flag for non-existent account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>setAppAccountSyncEnable ActsSetCheckSyncEnable_1400 start====")
            var accountNotExist = "syncenable_promise_notexist";
            try{
                await appAccountManager.setAppAccountSyncEnable(accountNotExist, true);
            }
            catch(err){
                console.info("====>setAppAccountSyncEnable 1400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsSetCheckSyncEnable_1400 end====");
                done();
            }
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_1500
         * @tc.number ActsSetCheckSyncEnable_1500
         * @tc.desc   Check synchronization flag for non-existent account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_1500 start====")
            var accountNotExist = "syncenable_callback_notexist";
            appAccountManager.checkAppAccountSyncEnable(accountNotExist, (err, data)=>{
                console.info("====>checkAppAccountSyncEnable 1500 err:" + JSON.stringify(err));
                try {
                    expect(err.code != 0).assertEqual(true);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                console.info("====>ActsSetCheckSyncEnable_1500 end====");
                done();
            });
        });

        /**
         * @tc.name   ActsSetCheckSyncEnable_1600
         * @tc.number ActsSetCheckSyncEnable_1600
         * @tc.desc   Check synchronization flag for non-existent account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsSetCheckSyncEnable_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckSyncEnable_1600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>checkAppAccountSyncEnable ActsSetCheckSyncEnable_1600 start====")
            var accountNotExist = "syncenable_promise_notexist";
            try{
                await appAccountManager.checkAppAccountSyncEnable(accountNotExist);
            }
            catch(err){
                console.info("====>checkAppAccountSyncEnable 1600 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsSetCheckSyncEnable_1600 end====");
                done();
            }
        });
    })
}

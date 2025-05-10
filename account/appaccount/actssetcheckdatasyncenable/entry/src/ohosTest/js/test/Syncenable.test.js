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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import featureAbility from "@ohos.ability.featureAbility";
import { UiDriver, BY } from '@ohos.UiTest';

export default function ActsSetCheckDataSyncEnabled() {
    describe('ActsSetCheckDataSyncEnabled', function () {
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

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_0100
        * @tc.name      : Check sync flag callback form
        * @tc.desc      : Get the synchronization flag of the account that has not set the synchronization flag
        */
        it('ActsSetCheckDataSyncEnabled_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("syncenable_callback_notset", (err)=>{
                console.info("====>add account ActsSetCheckDataSyncEnabled_0100 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                appAccountManager.checkDataSyncEnabled("syncenable_callback_notset", (err, data)=>{
                    console.info("====>checkDataSyncEnabled 0100 err:" + JSON.stringify(err));
                    console.info("====>checkDataSyncEnabled 0100 data:" + JSON.stringify(data));
                    try {
                        expect(err).assertEqual(null);
                        expect(data).assertEqual(false);
                    } catch (err) {
                        console.info("====>Assert Fail:" + JSON.stringify(err));
                    }
                    appAccountManager.removeAccount("syncenable_callback_notset", (err)=>{
                        console.info("====>delete Account ActsSetCheckDataSyncEnabled_0100 err:" + JSON.stringify(err));
                        try {
                            expect(err).assertEqual(null);
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        console.info("====>ActsSetCheckDataSyncEnabled_0100 end====");
                        done();
                    });
                })
            });
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_0200
        * @tc.name      : Check sync flag promise form
        * @tc.desc      : Get the synchronization flag of the account that has not set the synchronization flag
        */
        it('ActsSetCheckDataSyncEnabled_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckDataSyncEnabled_0200 start====");
            try{
                await appAccountManager.createAccount("syncenable_promise_notset");
            }
            catch(err){
                console.error("====>add account ActsSetCheckDataSyncEnabled_0200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkDataSyncEnabled ActsSetCheckDataSyncEnabled_0200 start====");
            try{
                var data = await appAccountManager.checkDataSyncEnabled("syncenable_promise_notset");
            }
            catch(err){
                console.error("====>checkDataSyncEnabled 0200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkDataSyncEnabled 0200 data:" + JSON.stringify(data));
            expect(data).assertEqual(false);
            console.info("====>delete account ActsSetCheckDataSyncEnabled_0200 start====");
            try{
                await appAccountManager.removeAccount("syncenable_promise_notset");
            }
            catch(err){
                console.error("====>delete account 0200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckDataSyncEnabled_0200 end====");
            done();
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_0300
        * @tc.name      : Check the set synchronization flag callback form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag to true for the account
        */
        it('ActsSetCheckDataSyncEnabled_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("syncenable_callback_settrue", (err)=>{
                console.info("====>add account ActsSetCheckDataSyncEnabled_0300 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                appAccountManager.setDataSyncEnabled("syncenable_callback_settrue", true, (err)=>{
                    console.info("====>setDataSyncEnabled 0300 err:" + JSON.stringify(err));
                    try {
                        expect(err).assertEqual(null);
                    } catch (err) {
                        console.info("====>Assert Fail:" + JSON.stringify(err));
                    }
                    appAccountManager.checkDataSyncEnabled("syncenable_callback_settrue", (err, data)=>{
                        console.info("====>checkDataSyncEnabled 0300 err:" + JSON.stringify(err));
                        console.info("====>checkDataSyncEnabled 0300 data:" + JSON.stringify(data));
                        try {
                            expect(err).assertEqual(null);
                            expect(data).assertEqual(true);
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        appAccountManager.removeAccount("syncenable_callback_settrue", (err)=>{
                            console.info("====>delete Account ActsSetCheckDataSyncEnabled_0300 err:" + JSON.stringify(err));
                            try {
                                expect(err).assertEqual(null);
                            } catch (err) {
                                console.info("====>Assert Fail:" + JSON.stringify(err));
                            }
                            console.info("====>ActsSetCheckDataSyncEnabled_0300 end====");
                            done();
                        });
                    })
                })
            });
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_0400
        * @tc.name      : Check the set synchronization flag promise form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag to true for the account
        */
        it('ActsSetCheckDataSyncEnabled_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckDataSyncEnabled_0400 start====");
            try{
                await appAccountManager.createAccount("syncenable_promise_settrue");
            }
            catch(err){
                console.error("====>add account ActsSetCheckDataSyncEnabled_0400 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>setDataSyncEnabled ActsSetCheckDataSyncEnabled_0400 start====");
            await appAccountManager.setDataSyncEnabled("syncenable_promise_settrue", true);
            console.info("====>checkDataSyncEnabled ActsSetCheckDataSyncEnabled_0400 start====");
            try{
                var data = await appAccountManager.checkDataSyncEnabled("syncenable_promise_settrue");
            }
            catch(err){
                console.error("====>checkDataSyncEnabled 0400 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkDataSyncEnabled 0400 data:" + JSON.stringify(data));
            expect(data).assertEqual(true);
            console.info("====>delete account ActsSetCheckDataSyncEnabled_0400 start====");
            try{
                await appAccountManager.removeAccount("syncenable_promise_settrue");
            }
            catch(err){
                console.error("====>delete account 0400 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckDataSyncEnabled_0400 end====");
            done();
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_0500
        * @tc.name      : Check the set synchronization flag callback form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag to false for the account
        */
        it('ActsSetCheckDataSyncEnabled_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("syncenable_callback_setfalse", (err)=>{
                console.info("====>add account ActsSetCheckDataSyncEnabled_0500 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                appAccountManager.setDataSyncEnabled("syncenable_callback_setfalse", false, (err)=>{
                    console.info("====>setDataSyncEnabled 0500 err:" + JSON.stringify(err));
                    try {
                        expect(err).assertEqual(null);
                    } catch (err) {
                        console.info("====>Assert Fail:" + JSON.stringify(err));
                    }
                    appAccountManager.checkDataSyncEnabled("syncenable_callback_setfalse", (err, data)=>{
                        console.info("====>checkDataSyncEnabled 0500 err:" + JSON.stringify(err));
                        console.info("====>checkDataSyncEnabled 0500 data:" + JSON.stringify(data));
                        try {
                            expect(err).assertEqual(null);
                            expect(data).assertEqual(false);
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        appAccountManager.removeAccount("syncenable_callback_setfalse", (err)=>{
                            console.info("====>delete Account ActsSetCheckDataSyncEnabled_0500 err:" + JSON.stringify(err));
                            try {
                                expect(err).assertEqual(null);
                            } catch (err) {
                                console.info("====>Assert Fail:" + JSON.stringify(err));
                            }
                            console.info("====>ActsSetCheckDataSyncEnabled_0500 end====");
                            done();
                        });
                    })
                })
            });
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_0600
        * @tc.name      : Check the set synchronization flag promise form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag to false for the account
        */
        it('ActsSetCheckDataSyncEnabled_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckDataSyncEnabled_0600 start====");
            try{
                await appAccountManager.createAccount("syncenable_promise_setfalse");
            }
            catch(err){
                console.error("====>add account ActsSetCheckDataSyncEnabled_0600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>setDataSyncEnabled ActsSetCheckDataSyncEnabled_0600 start====");
            await appAccountManager.setDataSyncEnabled("syncenable_promise_setfalse", false);
            console.info("====>checkDataSyncEnabled ActsSetCheckDataSyncEnabled_0600 start====");
            try{
                var data = await appAccountManager.checkDataSyncEnabled("syncenable_promise_setfalse");
            }
            catch(err){
                console.error("====>checkDataSyncEnabled 0600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkDataSyncEnabled 0600 data:" + JSON.stringify(data));
            expect(data).assertEqual(false);
            console.info("====>delete account ActsSetCheckDataSyncEnabled_0600 start====");
            try{
                await appAccountManager.removeAccount("syncenable_promise_setfalse");
            }
            catch(err){
                console.error("====>delete account 0600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckDataSyncEnabled_0600 end====");
            done();
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_0700
        * @tc.name      : Check the set synchronization flag callback form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag for the account to false
        *                 for the first time and true for the second time
        */
        it('ActsSetCheckDataSyncEnabled_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("syncenable_callback_falsetrue", (err)=>{
                console.info("====>add account ActsSetCheckDataSyncEnabled_0700 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                appAccountManager.setDataSyncEnabled("syncenable_callback_falsetrue", false, (err)=>{
                    console.info("====>setDataSyncEnabled first time 0700 err:" + JSON.stringify(err));
                    try {
                        expect(err).assertEqual(null);
                    } catch (err) {
                        console.info("====>Assert Fail:" + JSON.stringify(err));
                    }
                    appAccountManager.setDataSyncEnabled("syncenable_callback_falsetrue", true, (err)=>{
                        console.info("====>setDataSyncEnabled second time 0700 err:" + JSON.stringify(err));
                        try {
                            expect(err).assertEqual(null);
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        appAccountManager.checkDataSyncEnabled("syncenable_callback_falsetrue", (err, data)=>{
                            console.info("====>checkDataSyncEnabled 0700 err:" + JSON.stringify(err));
                            console.info("====>checkDataSyncEnabled 0700 data:" + JSON.stringify(data));
                            try {
                                expect(err).assertEqual(null);
                                expect(data).assertEqual(true);
                            } catch (err) {
                                console.info("====>Assert Fail:" + JSON.stringify(err));
                            }
                            appAccountManager.removeAccount("syncenable_callback_falsetrue", (err)=>{
                                console.info("====>delete Account 0700 err:" + JSON.stringify(err));
                                try {
                                    expect(err).assertEqual(null);
                                } catch (err) {
                                    console.info("====>Assert Fail:" + JSON.stringify(err));
                                }
                                console.info("====>ActsSetCheckDataSyncEnabled_0700 end====");
                                done();
                            });
                        })
                    })
                })
            });
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_0800
        * @tc.name      : Check the set synchronization flag promise form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag for the account to false
        *                 for the first time and true for the second time
        */
        it('ActsSetCheckDataSyncEnabled_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckDataSyncEnabled_0800 start====");
            await appAccountManager.createAccount("syncenable_promise_truefalse");
            console.info("====>setDataSyncEnabled first time ActsSetCheckDataSyncEnabled_0800 start====");
            await appAccountManager.setDataSyncEnabled("syncenable_promise_truefalse", false);
            console.info("====>setDataSyncEnabled second time ActsSetCheckDataSyncEnabled_0800 start====");
            await appAccountManager.setDataSyncEnabled("syncenable_promise_truefalse", true);
            console.info("====>checkDataSyncEnabled ActsSetCheckDataSyncEnabled_0800 start====");
            try{
                var data = await appAccountManager.checkDataSyncEnabled("syncenable_promise_truefalse");
            }
            catch(err){
                console.error("====>checkDataSyncEnabled 0800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkDataSyncEnabled 0800 data:" + JSON.stringify(data));
            expect(data).assertEqual(true);
            console.info("====>delete account ActsSetCheckDataSyncEnabled_0800 start====");
            try{
                await appAccountManager.removeAccount("syncenable_promise_truefalse");
            }
            catch(err){
                console.error("====>delete account 0800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckDataSyncEnabled_0800 end====");
            done();
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_0900
        * @tc.name      : Check the set synchronization flag callback form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag for the account to true
        *                 for the first time and false for the second time
        */
        it('ActsSetCheckDataSyncEnabled_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("syncenable_callback_falsetrue", (err)=>{
                console.info("====>add account ActsSetCheckDataSyncEnabled_0900 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                appAccountManager.setDataSyncEnabled("syncenable_callback_falsetrue", true, (err)=>{
                    console.info("====>setDataSyncEnabled first time 0900 err:" + JSON.stringify(err));
                    try {
                        expect(err).assertEqual(null);
                    } catch (err) {
                        console.info("====>Assert Fail:" + JSON.stringify(err));
                    }
                    appAccountManager.setDataSyncEnabled("syncenable_callback_falsetrue", false, (err)=>{
                        console.info("====>setDataSyncEnabled second time 0900 err:" + JSON.stringify(err));
                        try {
                            expect(err).assertEqual(null);
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        appAccountManager.checkDataSyncEnabled("syncenable_callback_falsetrue", (err, data)=>{
                            console.info("====>checkDataSyncEnabled 0900 err:" + JSON.stringify(err));
                            console.info("====>checkDataSyncEnabled 0900 data:" + JSON.stringify(data));
                            try {
                                expect(err).assertEqual(null);
                                expect(data).assertEqual(false);
                            } catch (err) {
                                console.info("====>Assert Fail:" + JSON.stringify(err));
                            }
                            appAccountManager.removeAccount("syncenable_callback_falsetrue", (err)=>{
                                console.info("====>delete Account 0900 err:" + JSON.stringify(err));
                                try {
                                    expect(err).assertEqual(null);
                                } catch (err) {
                                    console.info("====>Assert Fail:" + JSON.stringify(err));
                                }
                                console.info("====>ActsSetCheckDataSyncEnabled_0900 end====");
                                done();
                            });
                        })
                    })
                })
            });
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_1000
        * @tc.name      : Check the set synchronization flag promise form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag for the account to true
        *                 for the first time and false for the second time
        */
        it('ActsSetCheckDataSyncEnabled_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckDataSyncEnabled_1000 start====");
            await appAccountManager.createAccount("syncenable_promise_truefalse");
            console.info("====>setDataSyncEnabled first time ActsSetCheckDataSyncEnabled_1000 start====");
            await appAccountManager.setDataSyncEnabled("syncenable_promise_truefalse", true);
            console.info("====>setDataSyncEnabled second time ActsSetCheckDataSyncEnabled_1000 start====");
            await appAccountManager.setDataSyncEnabled("syncenable_promise_truefalse", false);
            console.info("====>checkDataSyncEnabled ActsSetCheckDataSyncEnabled_1000 start====");
            try{
                var data = await appAccountManager.checkDataSyncEnabled("syncenable_promise_truefalse");
            }
            catch(err){
                console.error("====>checkDataSyncEnabled 1000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkDataSyncEnabled 1000 data:" + JSON.stringify(data));
            expect(data).assertEqual(false);
            console.info("====>delete account ActsSetCheckDataSyncEnabled_1000 start====");
            try{
                await appAccountManager.removeAccount("syncenable_promise_truefalse");
            }
            catch(err){
                console.error("====>delete account 1000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckDataSyncEnabled_1000 end====");
            done();
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_1100
        * @tc.name      : Check the set synchronization flag callback form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag for the account to true
        *                 for the first time and true for the second time
        */
        it('ActsSetCheckDataSyncEnabled_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("syncenable_callback_truetrue", (err)=>{
                console.info("====>add account ActsSetCheckDataSyncEnabled_1100 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                appAccountManager.setDataSyncEnabled("syncenable_callback_truetrue", true, (err)=>{
                    console.info("====>setDataSyncEnabled first time 1100 err:" + JSON.stringify(err));
                    try {
                        expect(err).assertEqual(null);
                    } catch (err) {
                        console.info("====>Assert Fail:" + JSON.stringify(err));
                    }
                    appAccountManager.setDataSyncEnabled("syncenable_callback_truetrue", true, (err)=>{
                        console.info("====>setDataSyncEnabled second time 1100 err:" + JSON.stringify(err));
                        try {
                            expect(err).assertEqual(null);
                        } catch (err) {
                            console.info("====>Assert Fail:" + JSON.stringify(err));
                        }
                        appAccountManager.checkDataSyncEnabled("syncenable_callback_truetrue", (err, data)=>{
                            console.info("====>checkDataSyncEnabled 1100 err:" + JSON.stringify(err));
                            console.info("====>checkDataSyncEnabled 1100 data:" + JSON.stringify(data));
                            try {
                                expect(err).assertEqual(null);
                                expect(data).assertEqual(true);
                            } catch (err) {
                                console.info("====>Assert Fail:" + JSON.stringify(err));
                            }
                            appAccountManager.removeAccount("syncenable_callback_truetrue", (err)=>{
                                console.info("====>delete Account 1100 err:" + JSON.stringify(err));
                                try {
                                    expect(err).assertEqual(null);
                                } catch (err) {
                                    console.info("====>Assert Fail:" + JSON.stringify(err));
                                }
                                console.info("====>ActsSetCheckDataSyncEnabled_1100 end====");
                                done();
                            });
                        })
                    })
                })
            });
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_1200
        * @tc.name      : Check the set synchronization flag promise form
        * @tc.desc      : Check the synchronization flag after setting the synchronization flag for the account to true
        *                 for the true time and true for the second time
        */
        it('ActsSetCheckDataSyncEnabled_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_1200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsSetCheckDataSyncEnabled_1200 start====");
            await appAccountManager.createAccount("syncenable_promise_truetrue");
            console.info("====>setDataSyncEnabled first time ActsSetCheckDataSyncEnabled_1200 start====");
            await appAccountManager.setDataSyncEnabled("syncenable_promise_truetrue", true);
            console.info("====>setDataSyncEnabled second time ActsSetCheckDataSyncEnabled_1200 start====");
            await appAccountManager.setDataSyncEnabled("syncenable_promise_truetrue", true);
            console.info("====>checkDataSyncEnabled ActsSetCheckDataSyncEnabled_1200 start====");
            try{
                var data = await appAccountManager.checkDataSyncEnabled("syncenable_promise_truetrue");
            }
            catch(err){
                console.error("====>checkDataSyncEnabled 1200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>checkDataSyncEnabled 1200 data:" + JSON.stringify(data));
            expect(data).assertEqual(true);
            console.info("====>delete account ActsSetCheckDataSyncEnabled_1200 start====");
            try{
                await appAccountManager.removeAccount("syncenable_promise_truetrue");
            }
            catch(err){
                console.error("====>delete account 1200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsSetCheckDataSyncEnabled_1200 end====");
            done();
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_1300
        * @tc.name      : setDataSyncEnabled callback form
        * @tc.desc      : Set synchronization flag for non-existent account
        */
        it('ActsSetCheckDataSyncEnabled_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_1300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>setDataSyncEnabled ActsSetCheckDataSyncEnabled_1300 start====")
            var accountNotExist = "syncenable_callback_notexist";
            appAccountManager.setDataSyncEnabled(accountNotExist, true, (err)=>{
                console.info("====>setDataSyncEnabled 1300 err:" + JSON.stringify(err));
                try {
                    expect(err.code == 12300003).assertEqual(true);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                console.info("====>ActsSetCheckDataSyncEnabled_1300 end====");
                done();
            });
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_1400
        * @tc.name      : setDataSyncEnabled promise form
        * @tc.desc      : Set synchronization flag for non-existent account
        */
        it('ActsSetCheckDataSyncEnabled_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_1400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>setDataSyncEnabled ActsSetCheckDataSyncEnabled_1400 start====")
            var accountNotExist = "syncenable_promise_notexist";
            try{
                await appAccountManager.setDataSyncEnabled(accountNotExist, true);
            }
            catch(err){
                console.info("====>setDataSyncEnabled 1400 err:" + JSON.stringify(err));
                expect(err.code == 12300003).assertEqual(true);
                console.info("====>ActsSetCheckDataSyncEnabled_1400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_1500
        * @tc.name      : checkDataSyncEnabled callback form
        * @tc.desc      : Check synchronization flag for non-existent account
        */
        it('ActsSetCheckDataSyncEnabled_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_1500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>checkDataSyncEnabled ActsSetCheckDataSyncEnabled_1500 start====")
            var accountNotExist = "syncenable_callback_notexist";
            appAccountManager.checkDataSyncEnabled(accountNotExist, (err, data)=>{
                console.info("====>checkDataSyncEnabled 1500 err:" + JSON.stringify(err));
                try {
                    expect(err.code == 12300003).assertEqual(true);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                console.info("====>ActsSetCheckDataSyncEnabled_1500 end====");
                done();
            });
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_1600
        * @tc.name      : checkDataSyncEnabled promise form
        * @tc.desc      : Check synchronization flag for non-existent account
        */
        it('ActsSetCheckDataSyncEnabled_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsSetCheckDataSyncEnabled_1600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>checkDataSyncEnabled ActsSetCheckDataSyncEnabled_1600 start====")
            var accountNotExist = "syncenable_promise_notexist";
            try{
                await appAccountManager.checkDataSyncEnabled(accountNotExist);
            }
            catch(err){
                console.info("====>checkDataSyncEnabled 1600 err:" + JSON.stringify(err));
                expect(err.code == 12300003).assertEqual(true);
                console.info("====>ActsSetCheckDataSyncEnabled_1600 end====");
                done();
            }
        });
        
        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_1700
        * @tc.name      : test interface checkDataSyncEnabled callback
        * @tc.desc      : 12300002 param check
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsSetCheckDataSyncEnabled_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
            let tag = "====>ActsSetCheckDataSyncEnabled_1700 "
            console.info(tag + "start====");
            let accountName = '';
            for (let i = 0; i < 512 + 1; i++) {
                accountName += 'i';
            }
            let appAccountManager = account.createAppAccountManager();
            console.info(tag + "start checkDataSyncEnabled");
            appAccountManager.checkDataSyncEnabled(accountName, (err, data) => {
                console.info(tag + "err: " + JSON.stringify(err));
                console.info(tag + "data: " + JSON.stringify(data));
                try {
                    expect(err.code).assertEqual(12300002);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                done();
            });
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_1800
        * @tc.name      : test interface setDataSyncEnabled promise
        * @tc.desc      : 13200003 param check
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsSetCheckDataSyncEnabled_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
            let tag = "====>ActsSetCheckDataSyncEnabled_1800 "
            console.info(tag + "start====");
            let accountName = '';
            for (let i = 0; i < 512; i++) {
                accountName += 'i';
            }
            try {
                let appAccountManager = account.createAppAccountManager();
                console.info(tag + "start checkDataSyncEnabled");
                let data = await appAccountManager.checkDataSyncEnabled(accountName);
                console.info(tag + "data: " + JSON.stringify(data));
                expect().assertFail();
                done();
            } catch (err) {
                console.info(tag + "catch err: " + JSON.stringify(err));
                console.info(tag + "end====");
                expect(err.code).assertEqual(12300003);
                done();
            }
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_1900
        * @tc.name      : test interface checkDataSyncEnabled callback
        * @tc.desc      : 12300003 param check
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsSetCheckDataSyncEnabled_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
            let tag = "====>ActsSetCheckDataSyncEnabled_1900 "
            console.info(tag + "start====");
            let accountName = 'i';
            let appAccountManager = account.createAppAccountManager();
            console.info(tag + "start checkDataSyncEnabled");
            appAccountManager.checkDataSyncEnabled(accountName, (err, data) => {
                console.info(tag + "err: " + JSON.stringify(err));
                console.info(tag + "data: " + JSON.stringify(data));
                try {
                    expect(err.code).assertEqual(12300003);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                done();
            });
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_2000
        * @tc.name      : test interface checkDataSyncEnabled promise
        * @tc.desc      : 13200002 param check
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsSetCheckDataSyncEnabled_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
            let tag = "====>ActsSetCheckDataSyncEnabled_2000 "
            console.info(tag + "start====");
            let accountName = '';
            try {
                let appAccountManager = account.createAppAccountManager();
                console.info(tag + "start checkDataSyncEnabled");
                let data = await appAccountManager.checkDataSyncEnabled(accountName);
                console.info(tag + "data: " + JSON.stringify(data));
                expect().assertFail();
                done();
            } catch (err) {
                console.info(tag + "catch err: " + JSON.stringify(err));
                console.info(tag + "end====");
                expect(err.code).assertEqual(12300002);
                done();
            }
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_2100
        * @tc.name      : test interface setDataSyncEnabled callback
        * @tc.desc      : 12300002 param check
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsSetCheckDataSyncEnabled_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
            let tag = "====>ActsSetCheckDataSyncEnabled_2100 "
            console.info(tag + "start====");
            let accountName = '';
            for (let i = 0; i < 512 + 1; i++) {
                accountName += 'i';
            }
            let appAccountManager = account.createAppAccountManager();
            console.info(tag + "start setDataSyncEnabled");
            appAccountManager.setDataSyncEnabled(accountName, true, (err, data) => {
                console.info(tag + "err: " + JSON.stringify(err));
                console.info(tag + "data: " + JSON.stringify(data));
                try {
                    expect(err.code).assertEqual(12300002);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                done();
            });
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_2200
        * @tc.name      : test interface setDataSyncEnabled promise
        * @tc.desc      : 13200003 param check
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsSetCheckDataSyncEnabled_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
            let tag = "====>ActsSetCheckDataSyncEnabled_2200 "
            console.info(tag + "start====");
            let accountName = '';
            for (let i = 0; i < 512; i++) {
                accountName += 'i';
            }
            try {
                let appAccountManager = account.createAppAccountManager();
                console.info(tag + "start setDataSyncEnabled");
                let data = await appAccountManager.setDataSyncEnabled(accountName, false);
                console.info(tag + "data: " + JSON.stringify(data));
                expect().assertFail();
                done();
            } catch (err) {
                console.info(tag + "catch err: " + JSON.stringify(err));
                console.info(tag + "end====");
                expect(err.code).assertEqual(12300003);
                done();
            }
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_2300
        * @tc.name      : test interface setDataSyncEnabled callback
        * @tc.desc      : 12300003 param check
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsSetCheckDataSyncEnabled_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
            let tag = "====>ActsSetCheckDataSyncEnabled_2300 "
            console.info(tag + "start====");
            let accountName = 'i';
            let appAccountManager = account.createAppAccountManager();
            console.info(tag + "start setDataSyncEnabled");
            appAccountManager.setDataSyncEnabled(accountName, true, (err, data) => {
                console.info(tag + "err: " + JSON.stringify(err));
                console.info(tag + "data: " + JSON.stringify(data));
                try {
                    expect(err.code).assertEqual(12300003);
                } catch (err) {
                    console.info("====>Assert Fail:" + JSON.stringify(err));
                }
                done();
            });
        });

        /*
        * @tc.number    : ActsSetCheckDataSyncEnabled_2400
        * @tc.name      : test interface setDataSyncEnabled promise
        * @tc.desc      : 13200002 param check
        * @tc.level     : Level3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        */
        it('ActsSetCheckDataSyncEnabled_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
            let tag = "====>ActsSetCheckDataSyncEnabled_2400 "
            console.info(tag + "start====");
            let accountName = '';
            try {
                let appAccountManager = account.createAppAccountManager();
                console.info(tag + "start setDataSyncEnabled");
                let data = await appAccountManager.setDataSyncEnabled(accountName, false);
                console.info(tag + "data: " + JSON.stringify(data));
                expect().assertFail();
                done();
            } catch (err) {
                console.info(tag + "catch err: " + JSON.stringify(err));
                console.info(tag + "end====");
                expect(err.code).assertEqual(12300002);
                done();
            }
        });
    });
}
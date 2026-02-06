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
const EACHTIMEOUT = 500;
export default function ActsAccountSetGetExtraInfo() {
    describe('ActsAccountSetGetExtraInfo', function () {

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_0100
         * @tc.number ActsAccountSetGetExtraInfo_0100
         * @tc.desc   Get additional information about an existing account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ActsAccountSetGetExtraInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            var extraInfoStr = "account_extrainfo_callback_first";
            console.info("====>creat finish====");
            appAccountManager.addAccount("account_name_callback_first", extraInfoStr, (err)=>{
                console.info("====>add account ActsAccountSetGetExtraInfo_0100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAccountExtraInfo("account_name_callback_first", (err, data)=>{
                    console.info("====>getAccountExtraInfo 0100 err:" + JSON.stringify(err));
                    console.info("====>getAccountExtraInfo 0100 data:" + JSON.stringify(data));
                    expect(err).assertEqual(null);
                    expect(data).assertEqual(extraInfoStr);
                    appAccountManager.deleteAccount("account_name_callback_first", (err)=>{
                        console.info("====>delete Account 0100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountSetGetExtraInfo_0100 end====");
                        done();
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_0200
         * @tc.number ActsAccountSetGetExtraInfo_0200
         * @tc.desc   Get additional information about an existing account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ActsAccountSetGetExtraInfo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            var extraInfoStr = "account_extrainfo_promise_first";
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountSetGetExtraInfo_0200 start====");
            await appAccountManager.addAccount("account_name_promise_first", extraInfoStr);
            try{
                var data = await appAccountManager.getAccountExtraInfo("account_name_promise_first");
            }
            catch(err){
                console.error("====>getAccountExtraInfo 0200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAccountExtraInfo 0200 data:" + JSON.stringify(data));
            expect(data).assertEqual(extraInfoStr);
            console.info("====>delete account ActsAccountSetGetExtraInfo_0200 start====");
            await appAccountManager.deleteAccount("account_name_promise_first");
            console.info("====>ActsAccountSetGetExtraInfo_0200 end====");
            done();
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_0300
         * @tc.number ActsAccountSetGetExtraInfo_0300
         * @tc.desc   Get additional information about a non-existent account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSetGetExtraInfo_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var notExistBundle = "account_name_callback_notexistbundle_second";
            appAccountManager.getAccountExtraInfo(notExistBundle, (err, data)=>{
                console.info("====>getAccountExtraInfo 0300 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountSetGetExtraInfo_0300 end====");
                done();
            });
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_0400
         * @tc.number ActsAccountSetGetExtraInfo_0400
         * @tc.desc   Get additional information about a non-existent account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSetGetExtraInfo_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var notExistBundle = "account_name_promise_notexistbundle_second";
            try{
                await appAccountManager.getAccountExtraInfo(notExistBundle);
                console.error("====>getAccountExtraInfo 0400 fail====");
                expect().assertFail();
                done();
            }
            catch(err){
                console.info("====>getAccountExtraInfo 0400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountSetGetExtraInfo_0400 end====");
                done();
            }
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_0500
         * @tc.number ActsAccountSetGetExtraInfo_0500
         * @tc.desc   Get additional information about deleted account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSetGetExtraInfo_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("account_name_callback_third", "account_extrainfo_callback_third", (err)=>{
                console.info("====>add account ActsAccountSetGetExtraInfo_0500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.deleteAccount("account_name_callback_third", (err)=>{
                    console.info("====>delete Account 0500 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAccountExtraInfo("account_name_callback_third", (err, data)=>{
                        console.info("====>getAccountExtraInfo 0500 err:" + JSON.stringify(err));
                        console.info("====>getAccountExtraInfo 0500 data:" + JSON.stringify(data));
                        expect(err.code != 0).assertEqual(true);
                        console.info("====>ActsAccountSetGetExtraInfo_0500 end====");
                        done();
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_0600
         * @tc.number ActsAccountSetGetExtraInfo_0600
         * @tc.desc   Get additional information about deleted account
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSetGetExtraInfo_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountSetGetExtraInfo_0600 start====");
            await appAccountManager.addAccount("account_name_promise_third", "account_extrainfo_promise_third");
            console.info("====>delete account ActsAccountSetGetExtraInfo_0600 start====");
            await appAccountManager.deleteAccount("account_name_promise_third");
            try{
                await appAccountManager.getAccountExtraInfo("account_name_promise_third");
                console.error("====>getAccountExtraInfo 0600 fail====");
                expect().assertFail();
                done();
            }
            catch(err){
                console.info("====>getAccountExtraInfo 0600 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountSetGetExtraInfo_0600 end====");
                done();
            }
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_0700
         * @tc.number ActsAccountSetGetExtraInfo_0700
         * @tc.desc   Get additional information that is not set
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSetGetExtraInfo_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("account_name_callback_fourth", (err)=>{
                console.info("====>add account ActsAccountSetGetExtraInfo_0700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getAccountExtraInfo("account_name_callback_fourth", (err, data)=>{
                    console.info("====>getAccountExtraInfo 0700 err:" + JSON.stringify(err));
                    console.info("====>getAccountExtraInfo 0700 data:" + JSON.stringify(data));
                    expect(err).assertEqual(null);
                    expect(data).assertEqual("");
                    appAccountManager.deleteAccount("account_name_callback_fourth", (err)=>{
                        console.info("====>delete Account 0700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountSetGetExtraInfo_0700 end====");
                        done();
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_0800
         * @tc.number ActsAccountSetGetExtraInfo_0800
         * @tc.desc   Get additional information that is not set
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSetGetExtraInfo_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountSetGetExtraInfo_0800 start====");
            await appAccountManager.addAccount("account_name_promise_fourth");
            console.info("====>getAccountExtraInfo ActsAccountSetGetExtraInfo_0800 start====");
            try{
                var data = await appAccountManager.getAccountExtraInfo("account_name_promise_fourth");
            }
            catch(err){
                console.error("====>getAccountExtraInfo 0800 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAccountExtraInfo 0800 data:" + JSON.stringify(data));
            expect(data).assertEqual("");
            console.info("====>delete account ActsAccountSetGetExtraInfo_0800 start====");
            await appAccountManager.deleteAccount("account_name_promise_fourth");
            console.info("====>ActsAccountSetGetExtraInfo_0800 end====");
            done();
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_0900
         * @tc.number ActsAccountSetGetExtraInfo_0900
         * @tc.desc   Set account extension information that does not exist
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountSetGetExtraInfo_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var notExtraAccount = "account_name_callback_fifth"
            appAccountManager.setAccountExtraInfo(notExtraAccount, "account_extrainfo_fifth", (err)=>{
                console.info("====>setAccountExtraInfo 0900 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountSetGetExtraInfo_0900 end====");
                done();
            });
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_1000
         * @tc.number ActsAccountSetGetExtraInfo_1000
         * @tc.desc   Set account extension information that does not exist
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountSetGetExtraInfo_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            var notExtraAccount = "account_name_promise_fifth"
            try{
                await appAccountManager.setAccountExtraInfo(notExtraAccount, "account_extrainfo_fifth");
                console.error("====>setAccountExtraInfo fail ActsAccountSetGetExtraInfo_1000");
                expect().assertFail();
                done();
            }
            catch(err){
                console.info("====>setAccountExtraInfo 1000 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>ActsAccountSetGetExtraInfo_1000 end====");
                done();
            }
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_1100
         * @tc.number ActsAccountSetGetExtraInfo_1100
         * @tc.desc   Get additional information that has been set
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountSetGetExtraInfo_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("account_name_callback_sixth", "account_extrainfo_callback_sixth",(err)=>{
                console.info("====>add account ActsAccountSetGetExtraInfo_1100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAccountExtraInfo("account_name_callback_sixth", "account_extra_sixth_twice", (err)=>{
                    console.info("====>setAccountExtraInfo 1100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getAccountExtraInfo("account_name_callback_sixth", (err, data)=>{
                        console.info("====>getAccountExtraInfo 1100 err:" + JSON.stringify(err));
                        console.info("====>getAccountExtraInfo 1100 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("account_extra_sixth_twice");
                        appAccountManager.deleteAccount("account_name_callback_sixth", (err)=>{
                            console.info("====>delete Account 1100 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountSetGetExtraInfo_1100 end====");
                            done();
                        });
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_1200
         * @tc.number ActsAccountSetGetExtraInfo_1200
         * @tc.desc   Get additional information that has been set
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('ActsAccountSetGetExtraInfo_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_1200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountSetGetExtraInfo_1200 start====");
            await appAccountManager.addAccount("account_name_promise_sixth", "account_extra_promise_sixth");
            console.info("====>setAccountExtraInfo ActsAccountSetGetExtraInfo_1200 start====");
            await appAccountManager.setAccountExtraInfo("account_name_promise_sixth", "account_extra_sixth_twice");
            try{
                var data = await appAccountManager.getAccountExtraInfo("account_name_promise_sixth")
            }
            catch(err){
                console.error("====>getAccountExtraInfo 1200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAccountExtraInfo 1200 data:" + JSON.stringify(data));
            expect(data).assertEqual("account_extra_sixth_twice");
            console.info("====>delete account ActsAccountSetGetExtraInfo_1200 start====");
            await appAccountManager.deleteAccount("account_name_promise_sixth");
            console.info("====>ActsAccountSetGetExtraInfo_1200 end====");
            done();
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_1300
         * @tc.number ActsAccountSetGetExtraInfo_1300
         * @tc.desc   Get repeated setting of different additional information
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSetGetExtraInfo_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_1300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("account_name_callback_seventh",(err)=>{
                console.info("====>add account ActsAccountSetGetExtraInfo_1300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAccountExtraInfo("account_name_callback_seventh", "callback_seventh", (err)=>{
                    console.info("====>setAccountExtraInfo 1300 first time err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAccountExtraInfo("account_name_callback_seventh", "call_seventh_twice", (err)=>{
                        console.info("====>setAccountExtraInfo 1300 second time err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAccountExtraInfo("account_name_callback_seventh", (err, data)=>{
                            console.info("====>getAccountExtraInfo 1300 err:" + JSON.stringify(err));
                            console.info("====>getAccountExtraInfo 1300 data:" + JSON.stringify(data));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("call_seventh_twice");
                            appAccountManager.deleteAccount("account_name_callback_seventh", (err)=>{
                                console.info("====>delete Account 1300 err:" + JSON.stringify(err));
                            });
                            console.info("====>ActsAccountSetGetExtraInfo_1300 end====");
                            done();
                        });
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_1400
         * @tc.number ActsAccountSetGetExtraInfo_1400
         * @tc.desc   Get repeated setting of different additional information
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSetGetExtraInfo_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_1400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account start ActsAccountSetGetExtraInfo_1400 start====");
            await appAccountManager.addAccount("extrapromise_seventh");
            console.info("====>setAccountExtraInfo first time ActsAccountSetGetExtraInfo_1400====");
            await appAccountManager.setAccountExtraInfo("extrapromise_seventh", "extra_promise_seventh");
            try{
                var data = await appAccountManager.getAccountExtraInfo("extrapromise_seventh");
            }
            catch(err){
                console.error("====>getAccountExtraInfo first time 1400 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAccountExtraInfo 1400 first time data:" + JSON.stringify(data));
            expect(data).assertEqual("extra_promise_seventh");
            console.info("====>setAccountExtraInfo second time ActsAccountSetGetExtraInfo_1400====");
            await appAccountManager.setAccountExtraInfo("extrapromise_seventh", "extra_promise_seventh_twice");
            try{
                var data = await appAccountManager.getAccountExtraInfo("extrapromise_seventh");
            }
            catch(err){
                console.error("====>getAccountExtraInfo 1400 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAccountExtraInfo 1400 data:" + JSON.stringify(data));
            expect(data).assertEqual("extra_promise_seventh_twice");
            console.info("====>delete account ActsAccountSetGetExtraInfo_1400 start====");
            await appAccountManager.deleteAccount("extrapromise_seventh");
            console.info("====>ActsAccountSetGetExtraInfo_1400 end====");
            done();
        });


        /**
         * @tc.name   ActsAccountSetGetExtraInfo_1500
         * @tc.number ActsAccountSetGetExtraInfo_1500
         * @tc.desc   Get repeated setting of same additional information
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSetGetExtraInfo_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_1500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.addAccount("account_name_callback_eighth",(err)=>{
                console.info("====>add account ActsAccountSetGetExtraInfo_1500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setAccountExtraInfo("account_name_callback_eighth", "extra_callback_eighth", (err)=>{
                    console.info("====>setAccountExtraInfo second time err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setAccountExtraInfo("account_name_callback_eighth", "extra_callback_eighth", (err)=>{
                        console.info("====>setAccountExtraInfo 1500 first time err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getAccountExtraInfo("account_name_callback_eighth", (err, data)=>{
                            console.info("====>getAccountExtraInfo 1500 err:" + JSON.stringify(err));
                            console.info("====>getAccountExtraInfo 1500 data:" + JSON.stringify(data));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("extra_callback_eighth");
                            appAccountManager.deleteAccount("account_name_callback_eighth", (err)=>{
                                console.info("====>delete Account 1500 err:" + JSON.stringify(err));
                            });
                            console.info("====>ActsAccountSetGetExtraInfo_1500 end====");
                            done();
                        });
                    });
                });
            });
        });

        /**
         * @tc.name   ActsAccountSetGetExtraInfo_1600
         * @tc.number ActsAccountSetGetExtraInfo_1600
         * @tc.desc   Get repeated setting of same additional information
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountSetGetExtraInfo_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountSetGetExtraInfo_1600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountSetGetExtraInfo_1600====");
            await appAccountManager.addAccount("account_name_promise_eighth");
            console.info("====>setAccountExtraInfo first time start ActsAccountSetGetExtraInfo_1600====");
            try{
                await appAccountManager.setAccountExtraInfo("account_name_promise_eighth", "extra_promise_eighth");
            }
            catch(err){
                console.error("====>setAccountExtraInfo first time err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                var dataFir = await appAccountManager.getAccountExtraInfo("account_name_promise_eighth");
            }
            catch(err){
                console.error("====>getAccountExtraInfo first time 1600 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAccountExtraInfo first time 1600 dataFir:" + JSON.stringify(dataFir));
            expect(dataFir).assertEqual("extra_promise_eighth");
            console.info("====>setAccountExtraInfo second time start ActsAccountSetGetExtraInfo_1600====");
            try{
                await appAccountManager.setAccountExtraInfo("account_name_promise_eighth", "extra_promise_eighth");
            }
            catch(err){
                console.error("====>setAccountExtraInfo second time err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                var dataSec = await appAccountManager.getAccountExtraInfo("account_name_promise_eighth");
            }
            catch(err){
                console.error("====>getAccountExtraInfo second time 1600 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getAccountExtraInfo second time 1600 dataSec:" + JSON.stringify(dataSec));
            expect(dataSec).assertEqual("extra_promise_eighth");
            console.info("====>delete account ActsAccountSetGetExtraInfo_1600 start====");
            await appAccountManager.deleteAccount("account_name_promise_eighth");
            console.info("====>ActsAccountSetGetExtraInfo_1600 end====");
            done();
        });
    })
}

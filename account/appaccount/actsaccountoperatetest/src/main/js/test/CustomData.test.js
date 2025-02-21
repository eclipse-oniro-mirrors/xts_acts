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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsAccountCustomData() {
    describe('ActsAccountCustomData', function () {

        /*
        * @tc.number    : ActsAccountCustomData_0100
        * @tc.name      : The correct calls setCustomData and getCustomData get the value
        * @tc.desc      : The setCustomData setting valueis called when the forwarding parameters
        *                 are correct, and then getCustomData is called for the value(callback)
        */
        it('ActsAccountCustomData_0100', 0, async function (done) {
            console.info("====>ActsAccountCustomData_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_0100",(err)=>{
                console.info("====>add accountActsAccountCustomData_0100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCustomData("account_name_0100", "key1", "value1", (err)=>{
                    console.info("====>setCustomData ActsAccountCustomData_0100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getCustomData("account_name_0100", "key1", (err, data)=>{
                        console.info("====>getCustomData 0100 err:" + JSON.stringify(err));
                        console.info("====>getCustomData 0100 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("value1");
                        appAccountManager.removeAccount("account_name_0100", (err)=>{
                            console.info("====>delete Account 0100 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountCustomData_0100 end====");
                            done();
                        });
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_0200
        * @tc.name      : The correct calls setCustomData and getCustomData get the value
        * @tc.desc      : The setCustomData setting value is called when the forwarding parameters
        *                 are correct, and then getCustomData is called for the value(promise)
        */
        it('ActsAccountCustomData_0200', 0, async function (done) {
            console.info("====>ActsAccountCustomData_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountCustomData_0200 start====");
            try{
                await appAccountManager.createAccount("account_name_0200");
            }
            catch(err){
                console.error("====>add Account ActsAccountCustomData_0200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>setCustomData ActsAccountCustomData_0200 start====");
            try{
                await appAccountManager.setCustomData("account_name_0200", "key2", "value2");
            }
            catch(err){
                console.error("====>setCustomData ActsAccountCustomData_0200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getCustomData ActsAccountCustomData_0200 start====");
            try{
                var data = await appAccountManager.getCustomData("account_name_0200", "key2");
            }
            catch(err){
                console.error("====>getCustomData ActsAccountCustomData_0200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getCustomData ActsAccountCustomData_0200 data:" + JSON.stringify(data));
            expect(data).assertEqual("value2");
            console.info("====>delete account ActsAccountCustomData_0200 start====");
            try{
                await appAccountManager.removeAccount("account_name_0200");
            }
            catch(err){
                console.error("====>delete account 0200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsAccountCustomData_0200 end====");
            done();
        });

        /*
        * @tc.number    : ActsAccountCustomData_0300
        * @tc.name      : Get it directly without setting value
        * @tc.desc      : Call getCustomData directly to get value without calling setCustomData(callback)
        */
        it('ActsAccountCustomData_0300', 0, async function (done) {
            console.info("====>ActsAccountCustomData_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_0300", (err)=>{
                console.info("====>add account ActsAccountCustomData_0300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getCustomData("account_name_0300", "key3", (err, data)=>{
                    console.info("====>getCustomData 0300 err:" + JSON.stringify(err));
                    console.info("====>getCustomData 0300 data:" + JSON.stringify(data));
                    expect(err.code != 0).assertEqual(true);
                    expect(data).assertEqual(null);
                    appAccountManager.removeAccount("account_name_0300", (err)=>{
                        console.info("====>delete Account 0300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountCustomData_0300 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_0400
        * @tc.name      : Get it directly without setting value
        * @tc.desc      : Call getCustomData directly to get value without calling setCustomData(promise)
        */
        it('ActsAccountCustomData_0400', 0, async function (done) {
            console.info("====>ActsAccountCustomData_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountCustomData_0400 start====");
            try{
                await appAccountManager.createAccount("account_name_0400");
            }
            catch(err){
                console.error("====>add Account ActsAccountCustomData_0400 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                await appAccountManager.getCustomData("account_name_0400", "key4");
                console.error("====>getCustomData fail ActsAccountCustomData_0400====");
                expect().assertFail();
                done();
            }
            catch(err){
                console.info("====>getCustomData ActsAccountCustomData_0400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>delete account ActsAccountCustomData_0400 start====");
                try{
                    await appAccountManager.removeAccount("account_name_0400");
                }
                catch(err){
                    console.error("====>delete account 0400 fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.info("====>ActsAccountCustomData_0400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountCustomData_0500
        * @tc.name      : Call getCustomData to get value when passing in the error parameter
        * @tc.desc      : After calling setCustomData setting value correctly,
        *                 call the getCustomData of the pass error to check if you get the value(callback)
        */
        it('ActsAccountCustomData_0500', 0, async function (done) {
            console.info("====>ActsAccountCustomData_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_0500",(err)=>{
                console.info("====>add account ActsAccountCustomData_0500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCustomData("account_name_0500", "key5", "value5", (err)=>{
                    console.info("====>setCustomData ActsAccountCustomData_0500 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getCustomData("account_name_0500", "keyerr", (err, data)=>{
                        console.info("====>getCustomData 0500 err:" + JSON.stringify(err));
                        console.info("====>getCustomData 0500 data:" + JSON.stringify(data));
                        expect(err.code != 0).assertEqual(true);
                        appAccountManager.removeAccount("account_name_0500", (err)=>{
                            console.info("====>delete Account 0500 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountCustomData_0500 end====");
                            done();
                        });
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_0600
        * @tc.name      : Call getCustomData to get value when passing in the error parameter
        * @tc.desc      : After calling setCustomData setting value correctly,
        *                 call the getCustomData of the pass error to check if you get the value(promise)
        */
        it('ActsAccountCustomData_0600', 0, async function (done) {
            console.info("====>ActsAccountCustomData_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountCustomData_0600 start====");
            try{
                await appAccountManager.createAccount("account_name_0600");
            }
            catch(err){
                console.error("====>add Account ActsAccountCustomData_0600 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            await appAccountManager.setCustomData("account_name_0600", "key6", "value6");
            try{
                var data = await appAccountManager.getCustomData("account_name_0600", "keyerr");
            }
            catch(err){
                console.info("====>getCustomData 0600 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>delete account ActsAccountCustomData_0600 start====");
                try{
                    await appAccountManager.removeAccount("account_name_0600");
                }
                catch(err){
                    console.error("====>delete account 0600 fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.info("====>ActsAccountCustomData_0600 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountCustomData_0700
        * @tc.name      : Whether getCustomData can get the correct value when calling setCustomData multiple times
        * @tc.desc      : When the first setCustomData is called and the second setCustomData
        *                 is called,the setting of the value is different if the call getCustomData
        *                 can get the second value(callback)
        */
        it('ActsAccountCustomData_0700', 0, async function (done) {
            console.info("====>ActsAccountCustomData_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_0700",(err)=>{
                console.info("====>add account ActsAccountCustomData_0700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCustomData("account_name_0700", "key7", "value7", (err)=>{
                    console.info("====>setCustomDatafir first time 0700 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setCustomData("account_name_0700", "key7", "newvalue7", (err)=>{
                        console.info("====>setCustomDatafir second time 0700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getCustomData("account_name_0700", "key7", (err, data)=>{
                            console.info("====>getCustomData 0700 err:" + JSON.stringify(err));
                            console.info("====>getCustomData 0700 data:" + JSON.stringify(data));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("newvalue7");
                            appAccountManager.removeAccount("account_name_0700", (err)=>{
                                console.info("====>delete Account 0700 err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountCustomData_0700 end====");
                                done();
                            });
                        });
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_0800
        * @tc.name      : Whether getCustomData can get the correct value when calling setCustomData multiple times
        * @tc.desc      : When the first setCustomData is called and the second setCustomData
        *                 is called,the setting of the value is different if the call getCustomData
        *                 can get the second value(promise)
        */
        it('ActsAccountCustomData_0800', 0, async function (done) {
            console.info("====>ActsAccountCustomData_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            try{
                await appAccountManager.createAccount("account_name_0800");
            }
            catch(err){
                console.error("====>add account ActsAccountCustomData_0800 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                await appAccountManager.setCustomData("account_name_0800","key8","value8");
                await appAccountManager.setCustomData("account_name_0800","key8","newvalue8");
            }catch(err){
                console.error("====>setCustomData ActsAccountCustomData_0800 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                var data = await appAccountManager.getCustomData("account_name_0800", "key8");
            }
            catch(err){
                console.error("====>getCustomData ActsAccountCustomData_0800 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getCustomData ActsAccountCustomData_0800 data:" + JSON.stringify(data));
            expect(data).assertEqual("newvalue8");
            console.info("====>delete account ActsAccountCustomData_0800 start====");
            try{
                await appAccountManager.removeAccount("account_name_0800");
            }
            catch(err){
                console.error("====>delete account 0800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsAccountCustomData_0800 end====");
            done();
        });

        /*
        * @tc.number    : ActsAccountCustomData_0900
        * @tc.name      : Whether getCustomData can get the correct value when calling setCustomData multiple times
        * @tc.desc      : When the first setCustomData is called and the second setCustomData
        *                 is called,the setting of the value is same if the call getCustomData
        *                 can get the second value(callback)
        */
        it('ActsAccountCustomData_0900', 0, async function (done) {
            console.info("====>ActsAccountCustomData_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_0900",(err)=>{
                console.info("====>add account ActsAccountCustomData_0900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCustomData("account_name_0900", "key9", "value9", (err)=>{
                    console.info("====>setCustomData first time 0900 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setCustomData("account_name_0900", "key9", "value9", (err)=>{
                        console.info("====>setCustomData second time 0900 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getCustomData("account_name_0900", "key9", (err, data)=>{
                            console.info("====>getCustomData 0900 err:" + JSON.stringify(err));
                            console.info("====>getCustomData 0900 data:" + JSON.stringify(data));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("value9");
                            appAccountManager.removeAccount("account_name_0900", (err)=>{
                                console.info("====>delete Account 0900 err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAccountCustomData_0900 end====");
                                done();
                            });
                        });
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_1000
        * @tc.name      : Whether getCustomData can get the correct value when calling setCustomData multiple times
        * @tc.desc      : When the first setCustomData is called and the second setCustomData
        *                 is called,the setting of the value is same if the call getCustomData
        *                 can get the second value(promise)
        */
        it('ActsAccountCustomData_1000', 0, async function (done) {
            console.info("====>ActsAccountCustomData_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>createAccount ActsAccountCustomData_1000 start====");
            try{
                await appAccountManager.createAccount("account_name_1000");
            }
            catch(err){
                console.error("====>add account ActsAccountCustomData_1000 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                await appAccountManager.setCustomData("account_name_1000", "key10", "value10");
                await appAccountManager.setCustomData("account_name_1000", "key10", "value10");
            }
            catch(err){
                console.error("====>setCustomData ActsAccountCustomData_1000 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                var data = await appAccountManager.getCustomData("account_name_1000", "key10");
            }
            catch(err){
                console.error("====>getCustomData ActsAccountCustomData_1000 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getCustomData 1000 data:" + JSON.stringify(data));
            expect(data).assertEqual("value10");
            console.info("====>delete account ActsAccountCustomData_1000 start====");
            try{
                await appAccountManager.removeAccount("account_name_1000");
            }
            catch(err){
                console.error("====>delete account 1000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsAccountCustomData_1000 end====");
            done();
        });

        /*
        * @tc.number    : ActsAccountCustomData_1100
        * @tc.name      : Call multiple setCustomData calls multiple times getCustomData gets the value separately
        * @tc.desc      : Call setCustomData setting value again after calling setCustomData setting
        *                 different value, and then call getCustomData twice to get the set value(callback)
        */
        it('ActsAccountCustomData_1100', 0, async function (done) {
            console.info("====>ActsAccountCustomData_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_1100",(err)=>{
                console.info("====>add account ActsAccountCustomData_1100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCustomData("account_name_1100", "key11_first", "value11_first", (err)=>{
                    console.info("====>setCustomData first time 1100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setCustomData("account_name_1100", "key11_second", "value11_second", (err)=>{
                        console.info("====>setCustomData second time 1100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getCustomData("account_name_1100", "key11_first", (err,data)=>{
                            console.info("====>getCustomData key11_first 1100 err:" + JSON.stringify(err));
                            console.info("====>getCustomData key11_first 1100 data:" + JSON.stringify(data));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("value11_first");
                            appAccountManager.getCustomData("account_name_1100", "key11_second", (err,data)=>{
                                console.info("====>getCustomData key11_second 1100 err:" + JSON.stringify(err));
                                console.info("====>getCustomData key11_second 1100 data:" + JSON.stringify(data));
                                expect(err).assertEqual(null);
                                expect(data).assertEqual("value11_second");
                                appAccountManager.removeAccount("account_name_1100", (err)=>{
                                    console.info("====>delete Account 1100 err:" + JSON.stringify(err));
                                });
                                console.info("====>ActsAccountCustomData_1100 end====");
                                done();
                            });
                        });
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_1200
        * @tc.name      : Call multiple setCustomData calls multiple times getCustomData gets the value separately
        * @tc.desc      : Call setCustomData setting value again after calling setCustomData setting
        *                 different value, and then call getCustomData twice to get the set value(promise)
        */
        it('ActsAccountCustomData_1200', 0, async function (done) {
            console.info("====>ActsAccountCustomData_1200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>createAccount ActsAccountCustomData_1200 start====");
            try{
                await appAccountManager.createAccount("account_name_1200");
            }
            catch(err){
                console.error("====>add account ActsAccountCustomData_1200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                await appAccountManager.setCustomData("account_name_1200", "key12_first", "value12_first");
                await appAccountManager.setCustomData("account_name_1200", "key12_second", "value12_second");
            }
            catch(err){
                console.error("====>setCustomData ActsAccountCustomData_1200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                var dataFir = await appAccountManager.getCustomData("account_name_1200", "key12_first");
                var dataSec = await appAccountManager.getCustomData("account_name_1200", "key12_second");
            }
            catch(err){
                console.error("====>getCustomData ActsAccountCustomData_1200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsAccountCustomData_1200 getCustomData dataFir:" + JSON.stringify(dataFir));
            expect(dataFir).assertEqual("value12_first");
            console.info("====>ActsAccountCustomData_1200 getCustomData dataSec:" + JSON.stringify(dataSec));
            expect(dataSec).assertEqual("value12_second");
            console.info("====>delete account ActsAccountCustomData_1200 start====");
            try{
                await appAccountManager.removeAccount("account_name_1200");
            }
            catch(err){
                console.error("====>delete account 1200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsAccountCustomData_1200 end====");
            done();
        });

        /*
        * @tc.number    : ActsAccountCustomData_1300
        * @tc.name      : setCustomData setting value is called when the argument is wrong
        * @tc.desc      : Call setCustomData setting value when the incoming parameter KEY is wrong(callback)
        */
        it('ActsAccountCustomData_1300', 0, async function (done) {
            console.info("====>ActsAccountCustomData_1300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_1300", (err)=>{
                console.info("====>add account ActsAccountCustomData_1300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCustomData("account_name_1300", "", "value13", (err)=>{
                    console.info("====>setCustomData ActsAccountCustomData_1300 err:" + JSON.stringify(err));
                    expect(err.code != 0).assertEqual(true);
                    appAccountManager.removeAccount("account_name_1300", (err)=>{
                        console.info("====>delete account ActsAccountCustomData_1300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountCustomData_1300 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_1400
        * @tc.name      : setCustomData setting value is called when the argument is wrong
        * @tc.desc      : Call setCustomData setting value when the incoming parameter KEY is wrong(promise)
        */
        it('ActsAccountCustomData_1400', 0, async function (done) {
            console.info("====>ActsAccountCustomData_1400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountCustomData_1400 start====");
            try{
                await appAccountManager.createAccount("account_name_1400");
            }
            catch(err){
                console.error("====>add account ActsAccountCustomData_1400 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                await appAccountManager.setCustomData("account_name_1400", "", "value14");
            }
            catch(err){
                console.info("====>setCustomData ActsAccountCustomData_1400 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>delete account ActsAccountCustomData_1400 start====");
                try{
                    await appAccountManager.removeAccount("account_name_1400");
                }
                catch(err){
                    console.error("====>delete account 1400 fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.info("====>ActsAccountCustomData_1400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountCustomData_1500
        * @tc.name      : setCustomData setting key is called when the argument is wrong
        * @tc.desc      : Call setCustomData setting key when the incoming parameter KEY is wrong(callback)
        */
        it('ActsAccountCustomData_1500', 0, async function (done) {
            console.info("====>ActsAccountCustomData_1500 start====");
            var keyOverSize = "K"
            for(var i = 0;i < 256;i++)
            keyOverSize = keyOverSize + "K!@#";
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_1500", (err)=>{
                console.info("====>add account ActsAccountCustomData_1500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                console.info("====>1500 keyOverSize.length:" + JSON.stringify(keyOverSize.length));
                expect(keyOverSize.length).assertEqual(1025);
                appAccountManager.setCustomData("account_name_1500", keyOverSize, "value15", (err)=>{
                    console.info("====>setCustomData ActsAccountCustomData_1500 err:" + JSON.stringify(err));
                    expect(err.code != 0).assertEqual(true);
                    appAccountManager.removeAccount("account_name_1500", (err)=>{
                        console.info("====>delete account ActsAccountCustomData_1500 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountCustomData_1500 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_1600
        * @tc.name      : setCustomData setting key is called when the argument is wrong
        * @tc.desc      : Call setCustomData setting key when the incoming parameter KEY is wrong(promise)
        */
        it('ActsAccountCustomData_1600', 0, async function (done) {
            console.info("====>ActsAccountCustomData_1600 start====");
            var keyOverSize = "K"
            for(var i=0;i<256;i++)
            keyOverSize = keyOverSize + "K!@#";
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            expect(keyOverSize.length).assertEqual(1025);
            console.info("====>add account ActsAccountCustomData_1600 start====");
            try{
                await appAccountManager.createAccount("account_name_1600");
            }
            catch(err){
                console.error("====>add account ActsAccountCustomData_1600 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                await appAccountManager.setCustomData("account_name_1600", keyOverSize, "value16");
            }
            catch(err){
                console.info("====>setCustomData ActsAccountCustomData_1600 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>delete account ActsAccountCustomData_1600 start====");
                try{
                    await appAccountManager.removeAccount("account_name_1600");
                }
                catch(err){
                    console.error("====>delete account 1600 fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.info("====>ActsAccountCustomData_1600 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountCustomData_1700
        * @tc.name      : setCustomData and getCustomData are called when the argument is spaced
        * @tc.desc      : Call setCustomData and then getCustomData when the incoming key is a space(callback)
        */
        it('ActsAccountCustomData_1700', 0, async function (done) {
            console.info("====>ActsAccountCustomData_1700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_1700", (err)=>{
                console.info("====>add account ActsAccountCustomData_1700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCustomData("account_name_1700", " ", "value17", (err)=>{
                    console.info("====>ActsAccountCustomData_1700 setCustomData:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getCustomData("account_name_1700", " ", (err, data)=>{
                        console.info("====>getCustomData 1700 err:" + JSON.stringify(err));
                        console.info("====>getCustomData 1700 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("value17");
                        appAccountManager.removeAccount("account_name_1700", (err)=>{
                            console.info("====>delete Account 1700 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountCustomData_1700 end====");
                            done();
                        });
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_1800
        * @tc.name      : setCustomData and getCustomData are called when the argument is spaced
        * @tc.desc      : Call setCustomData and then getCustomData when the incoming key is a space(promise)
        */
        it('ActsAccountCustomData_1800', 0, async function (done) {
            console.info("====>ActsAccountCustomData_1800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountCustomData_1800 start====");
            try{
                await appAccountManager.createAccount("account_name_1800");
            }
            catch(err){
                console.error("====>add account ActsAccountCustomData_1800 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            await appAccountManager.setCustomData("account_name_1800", " ", "value18");
            try{
                var data = await appAccountManager.getCustomData("account_name_1800", " ");
            }
            catch(err){
                console.error("====>setCustomData ActsAccountCustomData_1800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getCustomData ActsAccountCustomData_1800 data:" + JSON.stringify(data));
            expect(data).assertEqual("value18");
            console.info("====>delete account ActsAccountCustomData_1800 start====");
            try{
                await appAccountManager.removeAccount("account_name_1800");
            }
            catch(err){
                console.error("====>delete account 1800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsAccountCustomData_1800 end====");
            done();
        });

        /*
        * @tc.number    : ActsAccountCustomData_1900
        * @tc.name      : setCustomData and getCustomData are called when the argument is spaced
        * @tc.desc      : Call setCustomData and then getCustomData when the incoming value is null(callback)
        */
        it('ActsAccountCustomData_1900', 0, async function (done) {
            console.info("====>ActsAccountCustomData_1900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_1900", (err)=>{
                console.info("====>add account ActsAccountCustomData_1900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCustomData("account_name_1900", "key19", "", (err)=>{
                    console.info("====>setCustomData ActsAccountCustomData_1900 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getCustomData("account_name_1900", "key19", (err, data)=>{
                        console.info("====>getCustomData 1900 err:" + JSON.stringify(err));
                        console.info("====>getCustomData 1900 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("");
                        appAccountManager.removeAccount("account_name_1900", (err)=>{
                            console.info("====>delete Account 1900 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountCustomData_1900 end====");
                            done();
                        });
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_2000
        * @tc.name      : setCustomData and getCustomData are called when the argument is spaced
        * @tc.desc      : Call setCustomData and then getCustomData when the incoming value is null(promise)
        */
        it('ActsAccountCustomData_2000', 0, async function (done) {
            console.info("====>ActsAccountCustomData_2000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountCustomData_2000 start====");
            try{
                await appAccountManager.createAccount("account_name_2000");
            }
            catch(err){
                console.error("====>add account ActsAccountCustomData_2000 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                await appAccountManager.setCustomData("account_name_2000", "key20", "");
            }
            catch(err){
                console.error("====>setCustomData ActsAccountCustomData_2000 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                var data = await appAccountManager.getCustomData("account_name_2000", "key20");
            }
            catch(err){
                console.error("====>getCustomData 2000 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getCustomData ActsAccountCustomData_2000 data:" + JSON.stringify(data));
            expect(data).assertEqual("");
            console.info("====>delete account ActsAccountCustomData_2000 start====");
            try{
                await appAccountManager.removeAccount("account_name_2000");
            }
            catch(err){
                console.error("====>delete account 2000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsAccountCustomData_2000 end====");
            done();
        });

        /*
        * @tc.number    : ActsAccountCustomData_2100
        * @tc.name      : setCustomData setting value is called when the argument is wrong
        * @tc.desc      : Call setCustomData setting value when the incoming parameter value is wrong(callback)
        */
        it('ActsAccountCustomData_2100', 0, async function (done) {
            console.info("====>ActsAccountCustomData_2100 start====");
            var valueOverSize = "K"
            for(var i = 0;i < 256;i++)
            valueOverSize = valueOverSize + "K!@#";
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_2100",(err)=>{
                console.info("====>add account ActsAccountCustomData_2100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                expect(valueOverSize.length).assertEqual(1025);
                appAccountManager.setCustomData("account_name_2100", "key21", valueOverSize, (err)=>{
                    console.info("====>setCustomData ActsAccountCustomData_2100 err:" + JSON.stringify(err));
                    expect(err.code != 0).assertEqual(true);
                    appAccountManager.removeAccount("account_name_2100", (err)=>{
                        console.info("====>delete Account ActsAccountCustomData_2100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountCustomData_2100 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_2200
        * @tc.name      : setCustomData setting value is called when the argument is wrong
        * @tc.desc      : Call setCustomData setting value when the incoming parameter value is wrong(promise)
        */
        it('ActsAccountCustomData_2200', 0, async function (done) {
            console.info("====>ActsAccountCustomData_2200 start====");
            var valueOverSize = "K"
            for(var i = 0;i < 256;i++)
            valueOverSize = valueOverSize + "K!@#";
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            expect(valueOverSize.length).assertEqual(1025);
            try{
                await appAccountManager.createAccount("account_name_2200");
            }
            catch(err){
                console.error("====>add account ActsAccountCustomData_2200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                await appAccountManager.setCustomData("account_name_2200", "key22", valueOverSize);
            }
            catch(err){
                console.info("====>setCustomData ActsAccountCustomData_2200 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>delete account ActsAccountCustomData_2200 start====");
                try{
                    await appAccountManager.removeAccount("account_name_2200");
                }
                catch(err){
                    console.error("====>delete account 2200 fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.info("====>ActsAccountCustomData_2200 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountCustomData_2300
        * @tc.name      : setCustomData and getCustomData are called when the argument is spaced
        * @tc.desc      : Call setCustomData and then getCustomData when the incoming value is a space(callback)
        */
        it('ActsAccountCustomData_2300', 0, async function (done) {
            console.info("====>ActsAccountCustomData_2300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_2300", (err)=>{
                console.info("====>add account ActsAccountCustomData_2300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCustomData("account_name_2300", "key23", " ", (err)=>{
                    console.info("====>setCustomData ActsAccountCustomData_2300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getCustomData("account_name_2300", "key23", (err, data)=>{
                        console.info("====>getCustomData 2300 err:" + JSON.stringify(err));
                        console.info("====>getCustomData 2300 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null);
                        expect(data).assertEqual(" ");
                        appAccountManager.removeAccount("account_name_2300", (err)=>{
                            console.info("====>delete Account 2300 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAccountCustomData_2300 end====");
                            done();
                        });
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_2400
        * @tc.name      : setCustomData and getCustomData are called when the argument is spaced
        * @tc.desc      : Call setCustomData and then getCustomData when the incoming value is a space(promise)
        */
        it('ActsAccountCustomData_2400', 0, async function (done) {
            console.info("====>ActsAccountCustomData_2400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAccountCustomData_2400 start====");
            try{
                await appAccountManager.createAccount("account_name_2400");
            }
            catch(err){
                console.error("====>add account ActsAccountCustomData_2400 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            await appAccountManager.setCustomData("account_name_2400", "key24", " ");
            try{
                var data = await appAccountManager.getCustomData("account_name_2400", "key24");
            }
            catch(err){
                console.error("====>getCustomData 2400 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getCustomData 2400 err:" + JSON.stringify(data));
            expect(data).assertEqual(" ");
            console.info("====>delete account ActsAccountCustomData_2400 start====");
            try{
                await appAccountManager.removeAccount("account_name_2400");
            }
            catch(err){
                console.error("====>delete account 2400 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsAccountCustomData_2400 end====");
            done();
        });

        /*
        * @tc.number    : ActsAccountCustomData_2500
        * @tc.name      : setCustomData and getCustomData are called when the argument is spaced
        * @tc.desc      : Call setCustomData and then getCustomData when the incoming name is null(callback)
        */
        it('ActsAccountCustomData_2500', 0, async function (done) {
            console.info("====>ActsAccountCustomData_2500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_2500", (err)=>{
                console.info("====>add account ActsAccountCustomData_2500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCustomData("", "key25", "value25", (err)=>{
                    console.info("====>setCustomData ActsAccountCustomData_2500 err:" + JSON.stringify(err));
                    expect(err.code != 0).assertEqual(true);
                    appAccountManager.removeAccount("account_name_2500", (err)=>{
                        console.info("====>delete Account ActsAccountCustomData_2500 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountCustomData_2500 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_2600
        * @tc.name      : setCustomData and getCustomData are called when the argument is spaced
        * @tc.desc      : Call setCustomData and then getCustomData when the incoming name is null(promise)
        */
        it('ActsAccountCustomData_2600', 0, async function (done) {
            console.info("====>ActsAccountCustomData_2600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>ActsAccountCustomData_2600 createAccount start====");
            try{
                await appAccountManager.createAccount("account_name_2600");
            }
            catch(err){
                console.error("====>add account ActsAccountCustomData_2600 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                await appAccountManager.setCustomData("", "key26", "value26");
            }
            catch(err){
                console.info("====>setCustomData ActsAccountCustomData_2600 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>delete account ActsAccountCustomData_2600 start====");
                try{
                    await appAccountManager.removeAccount("account_name_2600");
                }
                catch(err){
                    console.error("====>delete account 2600 fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.info("====>ActsAccountCustomData_2600 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountCustomData_2700
        * @tc.name      : setCustomData setting name is called when the argument is wrong
        * @tc.desc      : Call setCustomData setting name when the incoming parameter name is wrong(callback)
        */
        it('ActsAccountCustomData_2700', 0, async function (done) {
            console.info("====>ActsAccountCustomData_2700 start====");
            var nameOverSize = "n"
            for(var i = 0;i < 256;i++)
            nameOverSize = nameOverSize+"name";
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_2700",(err)=>{
                console.info("====>add account ActsAccountCustomData_2700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                expect(nameOverSize.length).assertEqual(1025);
                appAccountManager.setCustomData(nameOverSize, "key27", "value27", (err)=>{
                    console.info("====>ActsAccountCustomData_2700 setCustomData:" + JSON.stringify(err));
                    expect(err.code != 0).assertEqual(true);
                    appAccountManager.removeAccount("account_name_2700", (err)=>{
                        console.info("====>delete Account ActsAccountCustomData_2700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountCustomData_2700 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_2800
        * @tc.name      : setCustomData setting name is called when the argument is wrong
        * @tc.desc      : Call setCustomData setting name when the incoming parameter name is wrong(promise)
        */
        it('ActsAccountCustomData_2800', 0, async function (done) {
            console.info("====>ActsAccountCustomData_2800 start====");
            var nameOverSize = "n"
            for(var i = 0;i < 256;i++)
            nameOverSize = nameOverSize + "name";
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            expect(nameOverSize.length).assertEqual(1025);
            console.info("====>add account ActsAccountCustomData_2800 start====");
            try{
                await appAccountManager.createAccount("account_name_2800");
            }
            catch(err){
                console.error("====>add account ActsAccountCustomData_2800 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                await appAccountManager.setCustomData(nameOverSize, "key28", "value28");
            }
            catch(err){
                console.info("====>setCustomData ActsAccountCustomData_2800 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                console.info("====>delete account ActsAccountCustomData_2800 start====");
                try{
                    await appAccountManager.removeAccount("account_name_2800");
                }
                catch(err){
                    console.error("====>delete account 2800 fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.info("====>ActsAccountCustomData_2800 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAccountCustomData_2900
        * @tc.name      : setCustomData and getCustomData are called when the argument is spaced
        * @tc.desc      : Call setCustomData and then getCustomData when the incoming name is a space(callback)
        */
        it('ActsAccountCustomData_2900', 0, async function (done) {
            console.info("====>ActsAccountCustomData_2900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount(" ", (err)=>{
                console.info("====>createAccount ActsAccountCustomData_2900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCustomData(" ", "key29", "value29", (err)=>{
                    console.info("====>setCustomData ActsAccountCustomData_2900 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getCustomData(" ", "key29", (err, data)=>{
                        console.info("====>getCustomData 2900 err:" + JSON.stringify(err));
                        console.info("====>getCustomData 2900 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("value29");
                        appAccountManager.removeAccount(" ", (err)=>{
                            console.error("====>removeAccount ActsAccountCustomData_2900 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            done();
                        });
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAccountCustomData_3000
        * @tc.name      : setCustomData and getCustomData are called when the argument is spaced
        * @tc.desc      : Call setCustomData and then getCustomData when the incoming name is a space(promise)
        */
        it('ActsAccountCustomData_3000', 0, async function (done) {
            console.info("====>ActsAccountCustomData_3000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            try {
                await appAccountManager.createAccount(" ");
                await appAccountManager.setCustomData(" ", "key30", "value30");
                var data = await appAccountManager.getCustomData(" ", "key30");
                console.error("====>getCustomData ActsAccountCustomData_3000 data:" + JSON.stringify(data));
                expect(data).assertEqual("value30");
                await appAccountManager.removeAccount(" ");
                done();
            } catch (err) {
                console.error("====>ActsAccountCustomData_3000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        })


        /*
        * @tc.number    : ActsAccountCustomData_3100
        * @tc.name      : The correct calls setCustomData and getCustomData get the value
        * @tc.desc      : The setCustomData setting valueis called when the forwarding parameters
        *                 are correct, and then getCustomData is called for the value(callback)
        */
        it('ActsAccountCustomData_3100', 0, async function (done) {
            console.info("====>ActsAccountCustomData_3100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_3100",(err)=>{
                console.info("====>add ActsAccountCustomData_3100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCustomData("account_name_3100", "key31", "value31", (err)=>{
                    console.info("====>setCustomData ActsAccountCustomData_3100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    var result = appAccountManager.getCustomDataSync("account_name_3100", "key31")
                    console.info("====>getCustomData ActsAccountCustomData_3100 result:" + JSON.stringify(result));
                    expect(result).assertEqual("value31");
                    appAccountManager.removeAccount("account_name_3100", (err)=>{
                        console.info("====>delete Account 0100 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAccountCustomData_3100 end====");
                        done();
                    });
                });
            });
        });
    })
}
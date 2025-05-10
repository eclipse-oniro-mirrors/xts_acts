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
const ERR_JS_CREDENTIAL_NOT_EXIST = 12300102;
export default function ActsAppAccountCredential() {
    describe('ActsAppAccountCredential', function () {
        /*
        * @tc.number    : ActsAppAccountCredential_0100
        * @tc.name      : The correct calls setAssociatedData and getCredential get the credential
        * @tc.desc      : The setCredential setting credential is called when the forwarding parameters
        *                 are correct, and then getCredential is called for the credential(callback)
        */
        it('ActsAppAccountCredential_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsAppAccountCredential_0100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_0100", (err)=>{
                console.info("====>add account ActsAppAccountCredential_0100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCredential("account_name_0100", "credentialType1", "credential1",(err)=>{
                    console.info("====>ActsAppAccountCredential_0100 setCredential:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getCredential("account_name_0100", "credentialType1", (err,data)=>{
                        console.info("====>getCredential 0100 err:" + JSON.stringify(err));
                        console.info("====>getCredential 0100 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("credential1");
                        appAccountManager.removeAccount("account_name_0100", (err)=>{
                            console.info("====>delete Account 0100 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAppAccountCredential_0100 end====");
                            done();
                        });
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAppAccountCredential_0200
        * @tc.name      : The correct calls setCredential and getCredential get the credential
        * @tc.desc      : The setAssociatedData setting credential is called when the forwarding parameters
        *                 are correct, and then getCredential is called for the credential(promise)
        */
        it('ActsAppAccountCredential_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("====>ActsAppAccountCredential_0200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add accountActsAppAccountCredential_0200 start====");
            await appAccountManager.createAccount("account_name_0200");
            console.info("====>setCredential ActsAppAccountCredential_0200 start====");
            try{
                await appAccountManager.setCredential("account_name_0200", "credentialType2", "credential2");
            }
            catch(err){
                console.error("setCredential ActsAppAccountCredential_0200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getCredential ActsAppAccountCredential_0200 start====");
            try{
                var data = await appAccountManager.getCredential("account_name_0200", "credentialType2");
            }
            catch(err){
                console.error("getCredential ActsAppAccountCredential_0200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>getCredential ActsAppAccountCredential_0200 data:" + JSON.stringify(data));
            expect(data).assertEqual("credential2");
            console.info("====>delete account ActsAppAccountCredential_0200 start====");
            appAccountManager.removeAccount("account_name_0200")
            console.info("====>ActsAppAccountCredential_0200 end====");
            done();
        });

        /*
        * @tc.number    : ActsAppAccountCredential_0300
        * @tc.name      : Whether getAssociatedData can get the correct value when calling setCredential two times
        * @tc.desc      : When the first setCredential is called and the second setCredential
        *                 is called,the setting of the credential is different if the call getCredential
        *                 can get the second credential(callback)
        */
        it('ActsAppAccountCredential_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAppAccountCredential_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_0300",(err)=>{
                console.info("====>add account ActsAppAccountCredential_0300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCredential("account_name_0300", "credentialType3", "credential3",(err)=>{
                    console.info("====>setCredential first time 0300 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.setCredential("account_name_0300", "credentialType3", "newcredential3",(err)=>{
                        console.info("====>setCredential second time 0300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        appAccountManager.getCredential("account_name_0300", "credentialType3", (err, data)=>{
                            console.info("====>getCredential 0300 err:" + JSON.stringify(err));
                            console.info("====>getCredential 0300 data:" + JSON.stringify(data));
                            expect(err).assertEqual(null);
                            expect(data).assertEqual("newcredential3");
                            appAccountManager.removeAccount("account_name_0300", (err)=>{
                                console.info("====>delete Account 0300 err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                console.info("====>ActsAppAccountCredential_0300 end====");
                                done();
                            });
                        });
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAppAccountCredential_0400
        * @tc.name      : Whether getAssociatedData can get the correct value when calling setCredential two times
        * @tc.desc      : When the first setCredential is called and the second setCredential
        *                 is called,the setting of the credential is different if the call getCredential
        *                 can get the second credential(promise)
        */
        it('ActsAppAccountCredential_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAppAccountCredential_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAppAccountCredential_0400 start====");
            await appAccountManager.createAccount("account_name_0400");
            try{
                await appAccountManager.setCredential("account_name_0400", "credentialType4", "credential4");
                await appAccountManager.setCredential("account_name_0400", "credentialType4", "newcredential4")
            }
            catch(err){
                console.error("setCredential ActsAppAccountCredential_0400 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            try{
                var data = await appAccountManager.getCredential("account_name_0400", "credentialType4");
            }
            catch(err){
                console.error("getCredential ActsAppAccountCredential_0400 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>ActsAppAccountCredential_0400 getCredential data:" + JSON.stringify(data));
            expect(data).assertEqual("newcredential4");
            console.info("====>delete account ActsAppAccountCredential_0400 start====");
            appAccountManager.removeAccount("account_name_0400")
            console.info("====>ActsAppAccountCredential_0400 end====");
            done();
        });

        /*
        * @tc.number    : ActsAppAccountCredential_0500
        * @tc.name      : setAssociatedData and getAssociatedData are called when the argument is null
        * @tc.desc      : Call setAssociatedData and then getAssociatedData when the incoming credential is null(callback)
        */
        it('ActsAppAccountCredential_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAppAccountCredential_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_0500",(err)=>{
                console.info("====>add account ActsAppAccountCredential_0500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCredential("account_name_0500", "credentialType5", "", (err)=>{
                    console.info("====>setCredential ActsAppAccountCredential_0500 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getCredential("account_name_0500", "credentialType5", (err,data)=>{
                        console.info("====>getCredential ActsAppAccountCredential_0500 err:" + JSON.stringify(err));
                        console.info("====>getCredential ActsAppAccountCredential_0500 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("");
                        appAccountManager.removeAccount("account_name_0500", (err)=>{
                            console.info("====>delete Account ActsAppAccountCredential_0500 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAppAccountCredential_0500 end====");
                            done();
                        });
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAppAccountCredential_0600
        * @tc.name      : setAssociatedData and getAssociatedData are called when the argument is null
        * @tc.desc      : Call setAssociatedData and then getAssociatedData when the incoming credential is null(promise)
        */
        it('ActsAppAccountCredential_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAppAccountCredential_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAppAccountCredential_0600 start====");
            await appAccountManager.createAccount("account_name_0600");
            console.info("====>setCredential ActsAppAccountCredential_0600 start====");
            await appAccountManager.setCredential("account_name_0600", "credentialType6", "");
            console.info("====>getCredential ActsAppAccountCredential_0600 start====");
            var data = await appAccountManager.getCredential("account_name_0600", "credentialType6");
            console.info("====>getCredential ActsAppAccountCredential_0600 data" + JSON.stringify(data));
            expect(data).assertEqual("");
            console.info("====>delete account ActsAppAccountCredential_0600 start====");
            await appAccountManager.removeAccount("account_name_0600");
            console.info("====>ActsAppAccountCredential_0600 end====");
            done();
        });

        /*
        * @tc.number    : ActsAppAccountCredential_0700
        * @tc.name      : setAssociatedData setting value is called when the argument is wrong
        * @tc.desc      : Call setAssociatedData setting credential when the incoming parameter type is null(callback)
        */
        it('ActsAppAccountCredential_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAppAccountCredential_0700 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_0700", (err)=>{
                console.info("====>add account ActsAppAccountCredential_0700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCredential("account_name_0700", "", "credential7", (err)=>{
                    console.info("====>setCredential ActsAppAccountCredential_0700 err:" + JSON.stringify(err));
                    expect(err.code == 12300002).assertEqual(true);
                    appAccountManager.removeAccount("account_name_0700", (err)=>{
                        console.info("====>delete Account ActsAppAccountCredential_0700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAppAccountCredential_0700 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAppAccountCredential_0800
        * @tc.name      : setAssociatedData setting value is called when the argument is wrong
        * @tc.desc      : Call setAssociatedData setting credential when the incoming parameter type is null(promise)
        */
        it('ActsAppAccountCredential_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAppAccountCredential_0800 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ccountActsAppAccountCredential_0800 start====");
            await appAccountManager.createAccount("account_name_0800");
            try{
                await appAccountManager.setCredential("account_name_0800", "", "credential8");
            }
            catch(err){
                console.info("====>setCredential ActsAppAccountCredential_0800 err:" + JSON.stringify(err));
                expect(err.code == 12300002).assertEqual(true);
                console.info("====>delete account ActsAppAccountCredential_0800 start====");
                appAccountManager.removeAccount("account_name_0800");
                console.info("====>ActsAppAccountCredential_0800 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAppAccountCredential_0900
        * @tc.name      : getCredential getting value is called when the argument is wrong
        * @tc.desc      : Call getCredential getting credential when the incoming parameter type is wrong(callback)
        */
        it('ActsAppAccountCredential_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAppAccountCredential_0900 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_0900", (err)=>{
                console.info("====>add account ActsAppAccountCredential_0900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getCredential("account_name_0900", "", (err)=>{
                    console.info("====>getCredential ActsAppAccountCredential_0900 err:" + JSON.stringify(err));
                    expect(err.code == 12300002).assertEqual(true);
                    appAccountManager.removeAccount("account_name_0900", (err)=>{
                        console.info("====>delete Account ActsAppAccountCredential_0900 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAppAccountCredential_0900 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAppAccountCredential_1000
        * @tc.name      : getCredential getting value is called when the argument is wrong
        * @tc.desc      : Call getCredential getting credential when the incoming parameter type is wrong(promise)
        */
        it('ActsAppAccountCredential_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAppAccountCredential_1000 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAppAccountCredential_1000 start====");
            await appAccountManager.createAccount("account_name_1000");
            try{
                await appAccountManager.getCredential("account_name_1000","");
            }
            catch(err){
                console.info("====>getCredential ActsAppAccountCredential_1000 err:" + JSON.stringify(err));
                expect(err.code == 12300002).assertEqual(true);
                console.info("====>delete account ActsAppAccountCredential_1000 start====");
                await appAccountManager.removeAccount("account_name_1000");
                console.info("====>ActsAppAccountCredential_1000 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAppAccountCredential_1100
        * @tc.name      : setAssociatedData setting credential is called when the argument is sapce
        * @tc.desc      : Call setAssociatedData setting credential when the incoming parameter type is space
        *                 then use getCredential getting the credential(callback)
        */
        it('ActsAppAccountCredential_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAppAccountCredential_1100 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_1100",(err)=>{
                console.info("====>add account ActsAppAccountCredential_1100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCredential("account_name_1100", " ", "credential11",(err)=>{
                    console.info("====>setCredential ActsAppAccountCredential_1100 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    appAccountManager.getCredential("account_name_1100", " ", (err, data)=>{
                        console.info("====>getCredential 1100 err:" + JSON.stringify(err));
                        console.info("====>getCredential 1100 data:" + JSON.stringify(data));
                        expect(err).assertEqual(null);
                        expect(data).assertEqual("credential11");
                        appAccountManager.removeAccount("account_name_1100", (err)=>{
                            console.info("====>delete Account 1100 err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.info("====>ActsAppAccountCredential_1100 end====");
                            done();
                        });
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAppAccountCredential_1200
        * @tc.name      : setAssociatedData setting credential is called when the argument is sapce
        * @tc.desc      : Call setAssociatedData setting credential when the incoming parameter type is space
        *                 then use getCredential getting the credential(promise)
        */
        it('ActsAppAccountCredential_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAppAccountCredential_1200 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAppAccountCredential_1200 start====");
            await appAccountManager.createAccount("account_name_1200");
            console.info("====>setCredential ActsAppAccountCredential_1200 start====");
            await appAccountManager.setCredential("account_name_1200", " ", "credential12");
            console.info("====>getCredential ActsAppAccountCredential_1200 start====");
            var data = await appAccountManager.getCredential("account_name_1200", " ");
            console.info("====>getCredential ActsAppAccountCredential_1200 data" + JSON.stringify(data));
            expect(data).assertEqual("credential12");
            console.info("====>delete account ActsAppAccountCredential_1200 start====");
            await appAccountManager.removeAccount("account_name_1200");
            console.info("====>ActsAppAccountCredential_1200 end====");
            done(); 
        });

        /*
        * @tc.number    : ActsAppAccountCredential_1300
        * @tc.name      : setAssociatedData setting credential is called when the argument is wrong
        * @tc.desc      : Call setAssociatedData setting credential when the incoming parameter name is null(callback)
        */
        it('ActsAppAccountCredential_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAppAccountCredential_1300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_1300",(err)=>{
                console.info("====>add account ActsAppAccountCredential_1300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCredential("", "credentialType13", "credential13", (err)=>{
                    console.info("====>setCredential ActsAppAccountCredential_1300 err:" + JSON.stringify(err));
                    expect(err.code == 12300002).assertEqual(true);
                    appAccountManager.removeAccount("account_name_1300", (err)=>{
                        console.info("====>delete Account ActsAppAccountCredential_1300 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAppAccountCredential_1300 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAppAccountCredential_1400
        * @tc.name      : setAssociatedData setting credential is called when the argument is wrong
        * @tc.desc      : Call setAssociatedData setting credential when the incoming parameter name is null(promise)
        */
        it('ActsAppAccountCredential_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAppAccountCredential_1400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAppAccountCredential_1400 start====");
            await appAccountManager.createAccount("account_name_1400");
            try{
                await appAccountManager.setCredential("", "credentialType14", "credential14");
            }
            catch(err){
                console.info("====>setCredential ActsAppAccountCredential_1400 err:" + JSON.stringify(err));
                expect(err.code == 12300002).assertEqual(true);
                console.info("====>delete account ActsAppAccountCredential_1400 start====");
                await appAccountManager.removeAccount("account_name_1400");
                console.info("====>ActsAppAccountCredential_1400 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAppAccountCredential_1500
        * @tc.name      : Get it directly without setting credential callback
        * @tc.desc      : Call getCredential directly to get credential without calling setCredential
        */
        it('ActsAppAccountCredential_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAppAccountCredential_1500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_1500", (err)=>{
                console.info("====>add account ActsAppAccountCredential_1500 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.getCredential("account_name_1500", "credentialType15", (err)=>{
                    console.info("====>getCredential ActsAppAccountCredential_1500 err:" + JSON.stringify(err));
                    expect(err.code == ERR_JS_CREDENTIAL_NOT_EXIST).assertEqual(true);
                    appAccountManager.removeAccount("account_name_1500", (err)=>{
                        console.info("====>delete Account ActsAppAccountCredential_1500 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAppAccountCredential_1500 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAppAccountCredential_1600
        * @tc.name      : Get it directly without setting credential promise
        * @tc.desc      : Call getCredential directly to get credential without calling setCredential
        */
        it('ActsAppAccountCredential_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("cActsAppAccountCredential_1600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAppAccountCredential_1600 start====");
            await appAccountManager.createAccount("account_name_1600");
            try{
                await appAccountManager.getCredential("account_name_1600", "credentialType16");
            }
            catch(err){
                console.info("====>getCredential ActsAppAccountCredential_1600 err:" + JSON.stringify(err));
                expect(err.code == ERR_JS_CREDENTIAL_NOT_EXIST).assertEqual(true);
                console.info("====>delete account ActsAppAccountCredential_1600 start====");
                await appAccountManager.removeAccount("account_name_1600");
                console.info("====>ActsAppAccountCredential_1600 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAppAccountCredential_1700
        * @tc.name      : setCredential setting credential is called when the argument is wrong callback
        * @tc.desc      : Call setCredential setting credential when the incoming parameter credential is wrong
        */
        it('ActsAppAccountCredential_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAppAccountCredential_1700 start====");
            var CREDENTIALOVERSIZE = "K"
            for(var i = 0;i < 256;i++)
            CREDENTIALOVERSIZE = CREDENTIALOVERSIZE + "K!@#";
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_1700", (err)=>{
                console.info("====>add account ActsAppAccountCredential_1700 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCredential("account_name_1700", "credentialType17", CREDENTIALOVERSIZE, (err)=>{
                    console.info("====>CREDENTIALOVERSIZE.length:" + JSON.stringify(CREDENTIALOVERSIZE.length));
                    expect(CREDENTIALOVERSIZE.length).assertEqual(1025);
                    console.info("====>setCredential ActsAppAccountCredential_1700 err:" + JSON.stringify(err));
                    expect(err.code == 12300002).assertEqual(true);
                    appAccountManager.removeAccount("account_name_1700", (err)=>{
                        console.info("====>delete Account ActsAppAccountCredential_1700 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAppAccountCredential_1700 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAppAccountCredential_1800
        * @tc.name      : setCredential setting credential is called when the argument is wrong promise
        * @tc.desc      : Call setCredential setting credential when the incoming parameter credential is wrong
        */
        it('ActsAppAccountCredential_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAppAccountCredential_1800 start====");
            var bigStr = "K"
            for(var i = 0;i < 256;i++)
            bigStr = bigStr + "K!@#";
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAppAccountCredential_1800 start====");
            await appAccountManager.createAccount("account_name_1800");
            try{
                await appAccountManager.setCredential("account_name_1800", "credentialType18", bigStr);
            }
            catch(err){
                console.info("====>bigStr.length:" + JSON.stringify(bigStr.length));
                expect(bigStr.length).assertEqual(1025);
                console.info("====>setCredential ActsAppAccountCredential_1800 err:" + JSON.stringify(err));
                expect(err.code == 12300002).assertEqual(true);
                console.info("====>delete account ActsAppAccountCredential_1800 start====");
                await appAccountManager.removeAccount("account_name_1800");
                console.info("====>ActsAppAccountCredential_1800 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAppAccountCredential_1900
        * @tc.name      : setCredential setting credential is called when the argument is wrong
        * @tc.desc      : Call setCredential setting type when the incoming parameter credential is wrong(callback)
        */
        it('ActsAppAccountCredential_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info("====>ActsAppAccountCredential_1900 start====");
            var CREDENTIALTYPEOVERSIZE = "K"
            for(var i = 0;i < 256;i++)
            CREDENTIALTYPEOVERSIZE = CREDENTIALTYPEOVERSIZE + "K!@#";
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_1900", (err)=>{
                console.info("====>add account ActsAppAccountCredential_1900 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCredential("account_name_1900", CREDENTIALTYPEOVERSIZE, "credential19", (err)=>{
                    console.info("====>CREDENTIALTYPEOVERSIZE.length:" + JSON.stringify(CREDENTIALTYPEOVERSIZE.length));
                    expect(CREDENTIALTYPEOVERSIZE.length).assertEqual(1025);
                    console.info("====>setCredential ActsAppAccountCredential_1900 err:" + JSON.stringify(err));
                    expect(err.code == 12300002).assertEqual(true);
                    appAccountManager.removeAccount("account_name_1900", (err)=>{
                        console.info("====>delete Account ActsAppAccountCredential_1900 err:" + JSON.stringify(err));
                        expect(err).assertEqual(null);
                        console.info("====>ActsAppAccountCredential_1900 end====");
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAppAccountCredential_2000
        * @tc.name      : setCredential setting credential is called when the argument is wrong
        * @tc.desc      : Call setCredential setting type when the incoming parameter credential is wrong(promise)
        */
        it('ActsAppAccountCredential_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsAppAccountCredential_2000 start====");
            var CREDENTIALTYPEOVERSIZE = "K"
            for(var i = 0;i < 256;i++)
            CREDENTIALTYPEOVERSIZE=CREDENTIALTYPEOVERSIZE+"K!@#";
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAppAccountCredential_2000 start====");
            await appAccountManager.createAccount("account_name_2000");
            try{
                await appAccountManager.setCredential("account_name_2000", CREDENTIALTYPEOVERSIZE , "credential20");
            }
            catch(err){
                console.info("====>CREDENTIALTYPEOVERSIZE.length:" + JSON.stringify(CREDENTIALTYPEOVERSIZE.length));
                expect(CREDENTIALTYPEOVERSIZE.length).assertEqual(1025);
                console.info("====>setCredential ActsAppAccountCredential_2000 err:" + JSON.stringify(err));
                expect(err.code == 12300002).assertEqual(true);
                console.info("====>delete account ActsAppAccountCredential_2000 start====");
                await appAccountManager.removeAccount("account_name_2000");
                console.info("====>ActsAppAccountCredential_2000 end====");
                done();
            }
        });

        /*
        * @tc.number    : ActsAppAccountCredential_2100
        * @tc.name      : setCredential setting credential is called when the argument is wrong
        * @tc.desc      : Call setCredential setting name when the incoming parameter name is wrong(callback)
        */
        it('ActsAppAccountCredential_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsAppAccountCredential_2100 start====");
            var NAMEOVERSIZE = "n"
            for(var i = 0;i < 256;i++)
            NAMEOVERSIZE = NAMEOVERSIZE + "name";
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            appAccountManager.createAccount("account_name_2100", (err)=>{
                console.info("====>add account ActsAppAccountCredential_2100 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.setCredential(NAMEOVERSIZE, "credentialType21", "credential21", (err)=>{
                    console.info("====>setCredential ActsAppAccountCredential_2100 err:" + JSON.stringify(err));
                    expect(err.code == 12300002).assertEqual(true);
                    appAccountManager.removeAccount("account_name_2100", (err)=>{
                        console.info("====>delete Account ActsAppAccountCredential_2100 err:" + JSON.stringify(err));
                        console.info("====>ActsAppAccountCredential_2100 end====");
                        expect(err).assertEqual(null);
                        done();
                    });
                });
            });
        });

        /*
        * @tc.number    : ActsAppAccountCredential_2200
        * @tc.name      : setCredential setting credential is called when the argument is wrong
        * @tc.desc      : Call setCredential setting name when the incoming parameter name is wrong(promise)
        */
        it('ActsAppAccountCredential_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            console.info("====>ActsAppAccountCredential_2200 start====");
            var NAMEOVERSIZE ="n"
            for(var i=0;i<256;i++)
            NAMEOVERSIZE=NAMEOVERSIZE+"name";
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat finish====");
            console.info("====>add account ActsAppAccountCredential_2200 start====");
            try{
                await appAccountManager.createAccount("account_name_2200");
            }
            catch(err){
                console.info("====>add account ActsAppAccountCredential_2200 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>setCredential ActsAppAccountCredential_2200 start====");
            try{
                await appAccountManager.setCredential(NAMEOVERSIZE, "credentialType22", "credential22");
            }
            catch(err){
                console.info("====>setCredential ActsAppAccountCredential_2200 err:" + JSON.stringify(err));
                expect(err.code == 12300002).assertEqual(true);
                console.info("====>delete account ActsAppAccountCredential_2200 start====");
                await appAccountManager.removeAccount("account_name_2200");
                console.info("====>ActsAppAccountCredential_2200 end====");
                done();
            }
        });
    })
}
/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import connectedTag from '@ohos.connectedTag';
import parameter from '@ohos.systemparameter';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

let NfcRfType = {
    NFC_RF_LEAVE : 0,
    NFC_RF_ENTER : 1,
}

export default function ConnectedTagErrorTest() {
    describe('ConnectedTagErrorTest', function () {
        beforeAll(function () {
            console.info('rbeforeAll called')
        })
        beforeEach(function() {
            console.info('beforeEach called')
        })
        afterEach(function () {
            console.info('afterEach called')
        })
        afterAll(function () {
            console.info('afterAll called')
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0100
         * @tc.name Test initialize connectedTag errorcode 201/801
         * @tc.desc Initializes the active label chip.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0100', Level.LEVEL0, function ()  {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            } 
            else {
                try{
                    let inittag = connectedTag.initialize();
                    expect().assertFail();
                }catch(error){
                    console.error(`initialize failed, code is ${error.code}, message is ${error.message}`)
                    if(error.code==801){
                        expect(true).assertTrue();
                    }else{
                        expect(error.code).assertEqual(201);
                    }
                    
                }
            }
        })
        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0200
         * @tc.name Test uninitialize connectedTag errorcode 201/801
         * @tc.desc uninitialize active label chip resources.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0200', Level.LEVEL0, function () {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            }
            else{
                try{
                    let uninittag = connectedTag.uninitialize();
                    expect().assertFail();
                }catch(error){
                    console.error(`uninitialize failed, code is ${error.code}, message is ${error.message}`)
                    if(error.code==801){
                        expect(true).assertTrue();
                    }else{
                        expect(error.code).assertEqual(201);
                    }
                }
            }
        })
        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0300
         * @tc.name Test init connectedTag
         * @tc.desc Reads the content of the active tag.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0300', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            } 
            else {
                (async() =>{
                    try{
                        let result=await connectedTag.read();
                        console.info("[connectedTag read promise successful:]"+JSON.stringify(result))
                        expect().assertFail();
                    }catch(error){
                        console.error(`read promise failed,code is ${error.code}, message is ${error.message}`)
                        if(error.code==801){
                            expect(true).assertTrue();
                        }else{
                            expect(error.code).assertEqual(201);
                        }
                    }
                })()
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0400
         * @tc.name Test read connectedTag errorcode 201/801
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0400', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            } 
            else {
                try{
                    connectedTag.read(
                        (error, data) => {
                            if (error) {
                                console.error(`read callback failed,code is ${error.code}, message is ${error.message}`)
                                if(error.code==801){
                                    expect(true).assertTrue();
                                }else{
                                    expect(error.code).assertEqual(201);
                                }
                                return;
                            } 
                            console.info("[connectedTag read callback successful:]"+JSON.stringify(data))
                            expect().assertFail();
                        });
                }catch(error){
                    console.error(`read callback failed,code is ${error.code}, message is ${error.message}`)
                    if(error.code==801){
                        expect(true).assertTrue();
                    }else{
                        expect(error.code).assertEqual(201);
                    }
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0500
         * @tc.name Test write connectedTag errorcode 201/801
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0500', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done()
            } 
            else {
                (async() =>{
                    try{
                        let result=await connectedTag.write();
                        console.info("[connectedTag write promise successful:]"+JSON.stringify(result))
                        expect().assertFail();
                    }catch(error){
                        console.error(`write promise failed,code is ${error.code}, message is ${error.message}`)
                        if(error.code==801){
                            expect(true).assertTrue();
                        }else{
                            expect(error.code).assertEqual(201);
                        }
                    }
                })()
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0600
         * @tc.name write connectedTag errorcode 201/801
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0600', Level.LEVEL0,async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            } 
            else {
                try{
                    connectedTag.write(
                        (error, data) => {
                            if (error) {
                                console.error(`write callback failed,code is ${error.code}, message is ${error.message}`)
                                if(error.code==801){
                                    expect(true).assertTrue();
                                }else{
                                    expect(error.code).assertEqual(201);
                                }
                                return;
                            } 
                            console.info("[connectedTag write callback successful:]"+JSON.stringify(data))
                            expect().assertFail();
                        });
                }catch(error){
                    console.error(`write callback failed,code is ${error.code}, message is ${error.message}`)
                    if(error.code==801){
                        expect(true).assertTrue();
                    }else{
                        expect(error.code).assertEqual(201);
                    }
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0700
         * @tc.name write connectedTag errorcode 401
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0700', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            } 
            else {
                await connectedTag.write(null).then(result => {
                    console.info("[connectedTag write promise successful]: result" + result);
                    done();
                }).catch((error)=> {
                    console.error(`write promise failed,code is ${error.code}, message is ${error.message}`);
                    if(error.code==401){
                        expect(true).assertTrue();
                    }else{
                        expect().assertFail();
                    }
                });
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0800
         * @tc.name Test initialize connectedTag
         * @tc.desc Initializes the active label chip.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0800', Level.LEVEL0,async function (done)  {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else{
                connectedTag.write(null,(err, result)=> {
                    if (err) {
                        console.info("[connectedTag write callback error]" + err);
                        if(err.code==401){
                            expect(true).assertTrue();
                        }else{
                            expect().assertFail();
                        }
                        done();
                    } else {
                        console.info("[connectedTag write promise successful] result: " + result);
                        expect(result!=null).assertTrue();
                        done();
                    }
                });
            }
        })        
        console.info("*************[nfc_test] start nfc errorcode js unit test end*************");
    })
}
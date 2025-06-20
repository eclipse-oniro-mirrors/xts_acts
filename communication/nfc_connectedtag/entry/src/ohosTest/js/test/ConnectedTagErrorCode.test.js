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
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0100
         * @tc.desc Initializes the active label chip,Test initialize connectedTag errorcode 201/801
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0100', Level.LEVEL0, function (done)  {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            } 
            else {
                try{
                    let inittag = connectedTag.initialize();
                    let inittag2 = connectedTag.initialize();
                    console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0100 initialize success: " + inittag );
                    expect().assertFail();
                }catch(error){
                    console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0100 initialize failed, code is ${error.code}, message is ${error.message}`)
                    if(error.code==801||error.code==3200101||error.code==201){
                        expect(true).assertTrue();
                    }else{
                        expect().assertFail();
                    }
                    
                }
            }
            done();
        })
        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0200
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0200
         * @tc.desc uninitialize active label chip resources,Test uninitialize connectedTag errorcode 201/801
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0200', Level.LEVEL0, function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            }
            else{
                try{
                    let uninittag = connectedTag.uninitialize();
                    console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0200 uninitialize success: " + uninittag );
                    expect(true).assertTrue();
                }catch(error){
                    console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0200 uninitialize failed, code is ${error.code}, message is ${error.message}`)
                    if(error.code==801||error.code==3200101||error.code==201){
                        expect(true).assertTrue();
                    }else{
                        expect().assertFail();
                    }
                }
            }
            done();
        })
        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0300
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0300
         * @tc.desc Reads the content of the active tag,Test init connectedTag
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
                        console.info("[SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0300 read promise successful:]"+JSON.stringify(result))
                        expect().assertFail();
                    }catch(error){
                        console.error(`read promise failed,code is ${error.code}, message is ${error.message}`)
                        if(error.code==801||error.code==3200101||error.code==201){
                            expect(true).assertTrue();
                        }else{
                            expect().assertFail();
                        }
                    }
                })()
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0400
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0400
         * @tc.desc Write Content to Active Tags,Test read connectedTag errorcode 201/801
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
                                console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0400 read callback failed,code is ${error.code}, message is ${error.message}`)
                                if(error.code==801||error.code==3200101||error.code==201){
                                    expect(true).assertTrue();
                                }else{
                                    expect().assertFail();
                                }
                                return;
                            } 
                            console.info("[connectedTag read callback successful:]"+JSON.stringify(data))
                            expect().assertFail();
                        });
                }catch(error){
                    console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0400 read callback failed,code is ${error.code}, message is ${error.message}`)
                    if(error.code==801||error.code==3200101||error.code==201){
                        expect(true).assertTrue();
                    }else{
                        expect().assertFail();
                    }
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0500
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0500
         * @tc.desc Write Content to Active Tags,Test write connectedTag errorcode 201/801
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
                        let rawData=[0x03,0x01,0x00];
                        let result=await connectedTag.write(rawData);
                        console.info("[SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0500 connectedTag write promise successful:]"+JSON.stringify(result))
                        expect(true).assertTrue();
                    }catch(error){
                        console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0500 write promise failed,code is ${error.code}, message is ${error.message}`)
                        if(error.code==801||error.code==3200101||error.code==201){
                            expect(true).assertTrue();
                        }else{
                            expect().assertFail();
                        }
                    }
                })()
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0600
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0600
         * @tc.desc Write Content to Active Tags,write connectedTag errorcode 201/801
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
                    let rawData=[0x03,0x01,0x00];
                    connectedTag.write(rawData,
                        (error, data) => {
                            if (error) {
                                console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0600 write callback failed,code is ${error.code}, message is ${error.message}`)
                                if(error.code==801||error.code==3200101||error.code==201){
                                    expect(true).assertTrue();
                                }else{
                                    expect().assertFail();
                                }
                                return;
                            } 
                            console.info("[SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0600 connectedTag write callback successful:]"+JSON.stringify(data))
                            expect().assertFail();
                        });
                }catch(error){
                    console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0600 write callback failed,code is ${error.code}, message is ${error.message}`)
                    if(error.code==801||error.code==3200101||error.code==201){
                        expect(true).assertTrue();
                    }else{
                        expect().assertFail();
                    }
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0700
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0700
         * @tc.desc Write Content to Active Tags,write connectedTag errorcode 401
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
                try{
                    connectedTag.initialize();
                }catch(error){
                    console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0700 initialize failed,code is ${error.code}, message is ${error.message}`);
                }
                try{
                    await connectedTag.write().then(result => {
                        console.info("[SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0700 connectedTag write promise successful]: result" + result);
                        expect().assertFail();
                        done();
                    }).catch((error)=> {
                        console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0700 write promise failed,code is ${error.code}, message is ${error.message}`);
                        if(error.code==401){
                            expect(true).assertTrue();
                        }else{
                            expect().assertFail();
                        }
                    });
                }catch(error){
                    console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0700 write promise failed,code is ${error.code}, message is ${error.message}`);
                    if(error.code==401){
                        expect(true).assertTrue();
                    }else{
                        expect().assertFail();
                    }
                }
                try{
                    connectedTag.uninitialize();
                }catch(error){
                    console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0700 uninitialize failed,code is ${error.code}, message is ${error.message}`);
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0800
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0800
         * @tc.desc Initializes the active label chip,Test initialize connectedTag
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
                try{
                    connectedTag.initialize();
                }catch(error){
                    console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0800 initialize failed,code is ${error.code}, message is ${error.message}`);
                }
                try{
                    connectedTag.write((err, result)=> {
                        if (err) {
                            console.info("[SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0800 connectedTag write callback error]" + err);
                            if(err.code==401){
                                expect(true).assertTrue();
                            }else{
                                expect().assertFail();
                            }
                        } else {
                            console.info("[SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0800 connectedTag write promise successful] result: " + result);
                            expect(result!=null).assertTrue();
                        }
                    });
                }catch(error){
                    console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0800 write promise failed,code is ${error.code}, message is ${error.message}`);
                    if(error.code==401){
                        expect(true).assertTrue();
                    }else{
                        expect().assertFail();
                    }
                }
                try{
                    connectedTag.uninitialize();
                }catch(error){
                    console.error(`SUB_Communication_NFC_nfcConnectedTag_ErrorCode_js_0800 uninitialize failed,code is ${error.code}, message is ${error.message}`);
                }
            }
            done();
        })        
        console.info("*************[nfc_test] start nfc errorcode js unit test end*************");
    })
}
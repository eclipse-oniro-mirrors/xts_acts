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
    return new Promise(resovle => setTimeout(resolve, delay))
}

let NfcRfType = {
    NFC_RF_LEAVE : 0,
    NFC_RF_ENTER : 1,
}

export default function ConnectedTagTest() {
    describe('ConnectedTagTest', function () {
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
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0100
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_0100
         * @tc.desc Initializes the active label chip.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0100', Level.LEVEL0, function ()  {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            } else {
                let inittag = connectedTag.init();
                console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0100 inittag: " + inittag );
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0200
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_0200
         * @tc.desc Reads the content of the active tag.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0200', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps02 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            } else {
                await connectedTag.readNdefTag().then(result => {
                    console.info("[NFC_test] ConnectedTag2 readNdefTag result: " + result );
                    expect(true).assertTrue();
                }).catch((err)=> {
                    console.info("[NFC_test] ConnectedTag2 readNdefTag err: " + err);
                    expect(true).assertTrue();
                });
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0300
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_0300
         * @tc.desc Reads the content of the active tag.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0300', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps03 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            } else {
                connectedTag.readNdefTag((err, result)=> {
                    if (err) {
                        console.info("[NFC_test] ConnectedTag3 readNdefTag err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] ConnectedTag3 readNdefTag result: " + result);
                        expect(result!==null).assertTrue();
                    }
                });
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0400
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_0400
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0400', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps04 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            } else {
                let rawData="010203"
                await connectedTag.writeNdefTag(rawData).then(result => {
                    console.info("[NFC_test] ConnectedTag4 writeNdefTag result: " + result );
                    expect(true).assertTrue();
                }).catch((err)=> {
                    console.info("[NFC_test] ConnectedTag4 writeNdefTag err: " + err);
                    expect(true).assertTrue();                    
                });
                sleep(3000);
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0500
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_0500
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0500', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.");
                expect(isAccessToken).assertFalse();
            } else {
                let rawData="010203";
                connectedTag.writeNdefTag(rawData,(err, result)=> {
                    if (err) {
                        console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0500 writeNdefTag err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0500 writeNdefTag result: " + result);
                        expect(result!==null).assertTrue();
                    }
                });
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0600
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_0600
         * @tc.desc Registers and cancels the NFC field strength status event.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0600', Level.LEVEL0, function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps06 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            } else {
                let recvNfcRfNotifyFunc = result => {
                    console.info("[NFC_test] ConnectedTag6 nfc state receive state ->" + result);
                    expect(result != null).assertTrue();
                }
                try{
                    connectedTag.on('notify',recvNfcRfNotifyFunc)
                    connectedTag.off('notify',recvNfcRfNotifyFunc)
                }catch(error){
                    console.error("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0600 notify failed,code is ${error.code}, message is ${error.message}");
                    expect(true).assertTrue();
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0700
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_0700
         * @tc.desc Unloads active label chip resources,Test uninit connectedTag
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0700', Level.LEVEL0, function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            } else {
                try{
                    let uninittag = connectedTag.uninit();
                    console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0700 uninit success: " + uninittag );
                    expect(true).assertTrue();
                }catch(error){
                    console.error("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0700 uninit failed,code is ${error.code}, message is ${error.message}");
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0800
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_0800
         * @tc.desc Initializes the active label chip,Test initialize connectedTag
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
         it('SUB_Communication_NFC_nfcConnectedTag_js_0800', Level.LEVEL0, function (done)  {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps08 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            }
            else{
                try{
                    let inittag = connectedTag.initialize();
                    console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0800 initialize successs: " + inittag );
                    expect(true).assertTrue();
                }catch(error){
                    console.error("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0800 initialize failed,code is ${error.code}, message is ${error.message}");
                    expect(true).assertTrue();
                }
            }
			done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0900
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_0900
         * @tc.desc uninitialize active label chip resources,Test uninitialize connectedTag
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0900', Level.LEVEL0, function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps09 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            }
            else{
                try{
                    let uninittag = connectedTag.uninitialize();
                    console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0900 uninitialize success: " + uninittag );
                    expect(true).assertTrue();
                }catch(error){
                    console.error("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0900 uninitialize failed,code is ${error.code}, message is ${error.message}");
                    expect(true).assertTrue();
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1000
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_1000
         * @tc.desc Reads the content of the active tag,Test read connectedTag
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1000', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps10 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else{
                try{
                    await connectedTag.read().then(result => {
                        console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1000 read result: " + result);
                        expect(result != null).assertTrue();
                        done();
                    }).catch((err)=> {
                        console.info("[NFC_test] ConnectedTag10 readMultiplePages1 err: " + err);
                        expect(true).assertTrue();
                        done();
                    });
                }catch(error){
                    console.error("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1000 read failed,code is ${error.code}, message is ${error.message}");
                }
            }
			done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1100
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_1100
         * @tc.desc Reads the content of the active tag.Test read connectedTag
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1100', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps11 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else{
                try{
                    const result = await new Promise((resolve,reject) => {
                      connectedTag.read((err, result)=> {
                          if (err) {
                              console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1100 read err: " + err);
                              reject(err);
                          } else {
                              console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1100 read success result: " + result);
                              resolve(result);
                          }
                      });
                    })
                    expect(true).assertTrue();
                }catch(error){
                    console.error("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1100 read failed,code is ${error.code}, message is ${error.message}");
                    expect(true).assertTrue();
                }
            }
            done();
        })

       /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1200
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_1200
         * @tc.desc Write Content to Active Tags,Test write connectedTag
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1200', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps12 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else{
                try{
                    let rawData = [0x03,0x01,0x00];
                    await connectedTag.write(rawData).then(result => {
                        console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1200 write result: " + result);
                        expect(true).assertTrue();
                    }).catch((err)=> {
                        console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1200 write err: " + err);
                        expect(true).assertTrue();
                    
                    });
                }catch(error){
                    console.error("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1200 write failed,code is ${error.code}, message is ${error.message}");
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1300
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_1300
         * @tc.desc Write Content to Active Tags,Test write connectedTag
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1300', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps13 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else{
                try{
                    let rawData = [0x03,0x01,0x00];
                    const result = await new Promise((resolve,reject) => {
                        connectedTag.write((err, result)=> {
                            if (err) {
                                console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1300 write err: " + err);
                                reject(err);
                            } else {
                                console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1300 write success result: " + result);
                                resolve(result);
                            }
                        });
                    });
                    expect(true).assertTrue();    
                }catch(error){
                    console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1200 write ,code is ${error.code}, message is ${error.message}");
                    expect(true).assertTrue();
                }
            }
            done();
        })
        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1400
         * @tc.name SUB_Communication_NFC_nfcConnectedTag_js_1400
         * @tc.desc Test NfcRfType value.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1400', Level.LEVEL0,function (done)  {
    	    try{
              console.info('[nfc_test]1 NfcRfType value test ')
              expect(connectedTag.NfcRfType.NFC_RF_ENTER).assertEqual(1);
              console.info('[nfc_test]2 NfcRfType value test ' )
              expect(connectedTag.NfcRfType.NFC_RF_LEAVE).assertEqual(0);
    	    }catch(error){
	            console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1400 get NfcRfType failed,code is ${error.code}, message is ${error.message}");
              expect().assertFail();
    	    }
          done();
        })  
        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}
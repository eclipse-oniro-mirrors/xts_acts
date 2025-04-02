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


import secureElement from '@ohos.secureElement';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

async function getSEService() {
               console.info("SecureElementDemo createService start getSEService");
                await secureElement.createService().then( (data) => {
                    console.info("start  createService data is" + data);
                    Service = data;
                    console.info("start  createService Service is" + Service);
                    let connect = Service.isConnected()
                    console.info("SecureElementDemo createService success = " + connect);
                })
                .catch((err) => {
                    console.info("createService createService err = " + err);
                })
               
}

let Service = null;
let getReader = null;

export default function newSEServicetest() {
    describe('newSEServicetest', function () {
        beforeAll(async function (done) {
            await secureElement.createService().then( (data) => {
                    console.info("SecureElementDemo newSEServicetest data =" + data);
                    Service = data;
                    let connect = Service.isConnected();
                    console.info("SecureElementDemo newSEServicetest connect = " + connect);
                    return Service;
                })
                .catch((err) => {
                    console.info("createService newSEServicetest err = " + err);
                })
            done();
            console.info('beforeAll called');
        })

        beforeEach(function() {
            console.info('beforeEach called');
        })

        afterEach(function () {
            console.info('afterEach called');
        })

        afterAll(async function (done) {
            nfcSEService.shutdown();
            sleep(900);
            console.info('[nfc_test] afterAll newService shutdown success');
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0600
         * @tc.name Test isConnected
         * @tc.desc Check whether the SE service is connected.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0600', 0, function () {
            try {
                let nfcisConnected = Service.isConnected();
                console.info("[NFC_test]6 SEService The connection status is: " + nfcisConnected);
                expect(nfcisConnected).assertTrue();
            } catch (error) {
                console.info("[NFC_test]6 exception occurred when checking the connection status.:" + error)
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0700
         * @tc.name Test getVersion
         * @tc.desc Returns the version number of the OMA specification.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0700', 0, function ()  {
            try {
                let getSEVersion = Service.getVersion();
                console.info("[NFC_test]7 OMA The version number is: " + getSEVersion);
                expect(typeof (getSEVersion)).assertEqual('string');
            } catch (error) {
                console.info("[NFC_test]7 Failed to obtain the version.:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0800
         * @tc.name Test getName
         * @tc.desc Returns the name of this reader.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0800', 0, function ()  {
            try {
                let nfcOmaReaderList = Service.getReaders();
                console.info("[nfc_test]8 Result of getReaders:" + nfcOmaReaderList );
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]8 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    expect(nfcOmaReaderList instanceof Object).assertTrue();
                    let nfcESEReader = nfcOmaReaderList[0];
                    console.info("[nfc_test]8 getReaders results list 0 is" + nfcESEReader);
                    expect(nfcESEReader instanceof Object).assertTrue();
                    let getNfcname = nfcESEReader.getName();
                    console.info("[NFC_test]8 The reader name is: " + getNfcname);
                    expect(typeof (getNfcname)).assertEqual('string');
                }
            } catch (error) {
                console.info("[NFC_test]8 getName occurs exception:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0900
         * @tc.name Test isSecureElementPresent
         * @tc.desc Indicates whether the corresponding secure element is available.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0900', 0, async function (done)  {
            try {
                let nfcOmaReaderList2 = [];
                            getReader = Service.getReaders();  
                            console.info("[nfc_test]9 getReader value  is: " + getReader);                                    
                            let getReader00 = getReader[0];
                            let getReader01 = getReader[1];
                            console.info("[nfc_test]9 getReaders results list 0 is" + getReader00);
                            let getReader000 = getReader00.getName();
                            let getReader001 = getReader01.getName();
                            console.info("[nfc_test]9 The reader name is: " + getReader000 + "/" + getReader001);
                    try {
                        if ( getReader000 == 'eSE'){
                             nfcOmaReaderList2 = getReader00;                            
                   }else {
                             console.info("[nfc_test]9 info");
                             nfcOmaReaderList2 = getReader01;                             
                   }
                        
                    } catch (error) { 
                                     console.info("[nfc_test]9 error " + error);                       
                    }
                if (nfcOmaReaderList2 == undefined) {
                    console.info("[NFC_test]9 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    console.info("[nfc_test]9 Result of getReaders:" + nfcOmaReaderList2);
                    expect(nfcOmaReaderList2 instanceof Object).assertTrue();
                    let nfcESEReader2 = nfcOmaReaderList2;
                    console.info("[nfc_test]9 getReaders results list 0 is" + nfcESEReader2);
                    expect(nfcESEReader2 instanceof Object).assertTrue();
                    let nfcSePresent = nfcESEReader2.isSecureElementPresent();
                    console.info("[NFC_test]9 security unit check result is: " + nfcSePresent);
                    expect(nfcSePresent).assertTrue();
                    let nfcOmaSession2 = nfcESEReader2.openSession();
                    sleep(900)
                    console.info("[nfc_test]9 Open the second session result" + nfcOmaSession2);
                    expect(nfcOmaSession2 instanceof Object).assertTrue();
                    let openSession2 = nfcOmaSession2.isClosed();
                    console.info("[NFC_test]9 After close Check the second session is open: " + openSession2);
                    expect(openSession2).assertFalse();
                    nfcESEReader2.closeSessions();
                    sleep(900)
                    console.info("[NFC_test]9 close the Reader of SE successfully");
                    let closeSession2 = nfcOmaSession2.isClosed();
                    console.info("[NFC_test]9 After close Check the second session is open: " + closeSession2);
                    expect(closeSession2).assertTrue();
                }
            } catch (error) {
                console.info("[NFC_test]9 isSecureElementPresent occurs exception:" + error);
                expect().assertFail();
            }
            done();
        })
        
        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_1000
         * @tc.name Test shutdown
         * @tc.desc Release all SE resources allocated to the service.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_1000', 0, async function (done)  {
            try {
                Service.shutdown();
                console.info('[NFC_test]10 eseshutdown pass');
                let downESEisconnected = Service.isConnected();
                console.info("[NFC_test]10 shutdown the SE SEService The connection status is: " + downESEisconnected);
                expect(downESEisconnected).assertFalse();
                sleep(900);
                await getSEService().then(async (data) => {
                    Service = data;
                    let seIsConnected = Service.isConnected();
                    console.info("[NFC_test] SEService isConnected The connection status is: " + seIsConnected);
                    if (seIsConnected) {
                        getReader = Service.getReaders();
                        if (getReader == undefined) {
                            console.info("[NFC_test]10 This function is not supported because the phone NFC chip is ST chip.");
                        } else {
                            expect(getReader instanceof Object).assertTrue();
                            console.info("[nfc_test]10 Result of getReaders:" + getReader);
                        }
                    }
                }).catch((err) =>{
                    console.info("[NFC_test] getSEService err.code " + err.code + "err.message " + err.message);
                })
            } catch (error) {
                console.info("[NFC_test]10 getReaders occurs exception:" + error);
                expect().assertFail();
            }
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}
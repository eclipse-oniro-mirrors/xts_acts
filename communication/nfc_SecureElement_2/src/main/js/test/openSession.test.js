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

let Service = null;
let Reader = null;
let Session = null;
let getReader = null;
let nfcSEService = null;

async function getSEService() {

    console.info("openSessionTest createService start getSEService");
     await secureElement.createService().then( (data) => {
         console.info("openSessionTest start  createService data is" + data);
         Service = data;
         console.info("openSessionTest start  createService Service is" + Service);
         let connect = Service.isConnected()
         console.info("openSessionTest createService success = " + connect);
     })
     .catch((err) => {
         console.info("openSessionTest createService createService err = " + err);
     })
    
}

export default function openSessionTest() {
    describe('openSessionTest', function () {
        beforeAll(async function (done) {
            await getSEService().then(async (data) => {
                Service = data;
                let seIsConnected = Service.isConnected();
                console.info("[NFC_test] SEService isConnected The connection status is: " + seIsConnected);
                if (seIsConnected) {
                            getReader = Service.getReaders();
                            console.info("openSessionTest getReader value  is: " + getReader);                                    
                            let getReader00 = getReader[0];
                            let getReader01 = getReader[1];
                            console.info("openSessionTest getReaders results list 0 is" + getReader00);
                            let getReader000 = getReader00.getName();
                            let getReader001 = getReader01.getName();
                            console.info("openSessionTest getReader name is: " + getReader000 + "/" + getReader001);
                    try {
                        if (getReader000 == 'eSE'){
                             readerIsPresent = getReader00.isSecureElementPresent();
                             console.info("openSessionTest getReader00 readerIsPresent " + readerIsPresent);
                             Reader = getReader00;                            
                   }else {
                             readerIsPresent = getReader01.isSecureElementPresent();
                             console.info("openSessionTest getReader01 readerIsPresent " + readerIsPresent);
                             Reader = getReader01;                             
                   }
                        
                    } catch (error) { 
                             console.info("openSessionTest this is error " + error);                       
                    }
                    console.info("[NFC_test] Reader isConnected The connection status is: " + readerIsPresent);
                    if (readerIsPresent) {
                        Session = Reader.openSession();
                        let sessionIsClosed = Session.isClosed();
                        console.info("[NFC_test] Session isConnected The connection status is: " + sessionIsClosed);
                    }
                }
            }).catch((err) =>{
                console.info("[NFC_test] openSessionTest err.code " + err.code + "err.message " + err.message);
            })
            done();
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
            console.info('[nfc_test] afterAll Se_session shutdown success');
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_1100
         * @tc.name Test getReader
         * @tc.desc Obtains the reader that provides the session.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_1100', 0, function () {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]11 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getNfcreader = Session.getReader();
                    console.info("[NFC_test]11 Reader result of this session: " + getNfcreader);
                    expect(getNfcreader instanceof Object).assertTrue();
                }
            } catch (error) {
                console.info("[NFC_test]11 The reader result of the session is abnormal:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_1200
         * @tc.name Test getATR
         * @tc.desc Obtain the ATR of the SE.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_1200', 0, function ()  {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]12 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let nfcGetart = Session.getATR();
                    expect(nfcGetart).assertInstanceOf('Array');
                    expect(!nfcGetart == false ).assertTrue();
                    console.info("[NFC_test]12 Get the ATR of this SE: " + nfcGetart);
                }
            } catch (error) {
                console.info("[NFC_test]10 Get the ATR of this SE occurs exception:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_1300
         * @tc.name Test close Session
         * @tc.desc Close a single session.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_1300', 0, async function (done) {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]13 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let isopenSession = Session.isClosed();
                    console.info("[NFC_test]13 Check the first one session is open: " + isopenSession);
                    expect(isopenSession).assertFalse();
                    Session.close();
                    sleep(900)
                    console.info("[NFC_test]13 second session is closed successfully");
                    let iscloseSession = Session.isClosed();
                    console.info("[NFC_test]13 After close Check the first one session is open: " + iscloseSession);
                    expect(iscloseSession).assertTrue();
                }
            } catch (error) {
                console.info("[NFC_test]13 0800 occurs exception:" + error);
                expect().assertFail();
            }
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}
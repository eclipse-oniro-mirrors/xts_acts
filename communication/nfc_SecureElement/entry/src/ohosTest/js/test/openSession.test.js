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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

let Service = null;
let Reader = null;
let Session = null;
let getReader = null;
let nfcSEService = null;
let readerIsPresent = null;

async function getSEService() {
    return new Promise((resolve, reject) => {
        Service = secureElement.newSEService("serviceState", (state) => {
            if (state == secureElement.ServiceState.DISCONNECTED) {
                console.info("[nfc_test] getSEService newService state is Disconnected");
                let err = null;
                err.code = -1;
                err.message = "newSEService failed, service is not connected"
                reject(err);
            } else {
                console.info("[nfc_test] getSEService newService state is Connected");
                resolve(Service);
            }
        });
    });
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
                    if(getReader.length > 0) {
                        expect(getReader.length > 0).assertTrue();
                    } else {
                        expect(getReader).assertDeepEquals([]);
                    } 
                    for (let i = 0; i < getReader.length; i++) {
                        if (getReader[i].getName() != "eSE") {
                            console.info("[NFC_test] se reader not ese.");
                            continue;
                        }
                        let getReaderstate = getReader[i].isSecureElementPresent();
                        if (getReaderstate == false) {
                            console.info("[NFC_test] se not present : " + i);
                            expect(getReaderstate).assertFalse();
                            continue;
                        } else {
                            Reader = getReader[i];
                            console.info("[NFC_test] newSEService openSessionTest getReader name is: " + Reader.getName());
                            Session = Reader.openSession();
                            let sessionIsClosed = Session.isClosed();
                            console.info("[NFC_test] Session isConnected The connection status is: " + sessionIsClosed);
                            expect(getReaderstate).assertTrue();
                        }
                    }
                }
            }).catch((err) =>{
                if (err.code == 801) {
                    expect(801).assertEqual(err.code);
                }
                console.info("[NFC_test] getSEService err.code " + err.code + "err.message " + err.message);
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
         * @tc.name   SUB_Communication_NFC_secureElement_js_0600
         * @tc.number SUB_Communication_NFC_secureElement_js_0600
         * @tc.desc   Obtains the reader that provides the session.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_secureElement_js_0600', Level.LEVEL0, function () {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]6 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let getNfcreader = Session.getReader();
                    console.info("[NFC_test]6 Reader result of this session: " + getNfcreader);
                    expect(getNfcreader instanceof Object).assertTrue();
                }
            } catch (error) {
                console.info("[NFC_test]6 The reader result of the session is abnormal:" + error);
				if (error.code == 801){
					console.info("[NFC_test]6 getReader is not support");
					except(true).assertTrue();
				}else{
					expect().assertFail();
				}
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_secureElement_js_0700
         * @tc.number SUB_Communication_NFC_secureElement_js_0700
         * @tc.desc   Obtain the ATR of the SE.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_secureElement_js_0700', Level.LEVEL0, function ()  {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]7 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let nfcGetart = Session.getATR();
                    if (nfcGetart.length > 0) {
                        expect(nfcGetart.length > 0).assertTrue();
                    } else {
                        expect(nfcGetart).assertDeepEquals([]);
                    }
                    expect(nfcGetart).assertInstanceOf('Array');
                    expect(!nfcGetart == false ).assertTrue();
                    console.info("[NFC_test]7 Get the ATR of this SE: " + nfcGetart);
                }
            } catch (error) {
                console.info("[NFC_test]7 Get the ATR of this SE occurs exception:" + error + "/" + error.code);
                expect(801).assertEqual(error.code);
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_secureElement_js_0800
         * @tc.number SUB_Communication_NFC_secureElement_js_0800
         * @tc.desc   Close a single session.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_secureElement_js_0800', Level.LEVEL0, async function (done) {
            try {
                if (getReader == undefined) {
                    console.info("[NFC_test]8 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    let isopenSession = Session.isClosed();
                    console.info("[NFC_test]8 Check the first one session is open: " + isopenSession);
                    expect(isopenSession).assertFalse();
                    Session.close();
                    sleep(900)
                    console.info("[NFC_test]8 second session is closed successfully");
                    let iscloseSession = Session.isClosed();
                    console.info("[NFC_test]8 After close Check the first one session is open: " + iscloseSession);
                    expect(iscloseSession).assertTrue();
                }
            } catch (error) {
                console.info("[NFC_test]8 0800 occurs exception:" + error + "/" + error.code);
                expect(801).assertEqual(error.code);
            }
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}
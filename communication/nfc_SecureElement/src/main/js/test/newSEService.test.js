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

let Service = null;
let getReader = null;

export default function newSEServicetest() {
    describe('newSEServicetest', function () {
        beforeAll(async function (done) {
            await getSEService().then(async (data) => {
                Service = data;
                let seIsConnected = Service.isConnected();
                console.info("[NFC_test] SEService isConnected The connection status is: " + seIsConnected);
                return Service;
            }).catch((err) =>{
                console.info("[NFC_test] getSEService err.code " + err.code + "err.message " + err.message);
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
            sleep(5000);
            console.info('[nfc_test] afterAll newService shutdown success');
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0100
         * @tc.name Test isConnected
         * @tc.desc Check whether the SE service is connected.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0100', 0, function () {
            try {
                let nfcisConnected = Service.isConnected();
                console.info("[NFC_test]1 SEService The connection status is: " + nfcisConnected);
                expect(nfcisConnected).assertTrue();
            } catch (error) {
                console.info("[NFC_test]1 exception occurred when checking the connection status.:" + error)
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0200
         * @tc.name Test getVersion
         * @tc.desc Returns the version number of the OMA specification.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0200', 0, function ()  {
            try {
                let getSEVersion = Service.getVersion();
                console.info("[NFC_test]2 OMA The version number is: " + getSEVersion);
                expect(typeof (getSEVersion)).assertEqual('string');
            } catch (error) {
                console.info("[NFC_test]2 Failed to obtain the version.:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0300
         * @tc.name Test getName
         * @tc.desc Returns the name of this reader.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0300', 0, function ()  {
            try {
                let nfcOmaReaderList = Service.getReaders();
                console.info("[nfc_test]3 Result of getReaders:" + nfcOmaReaderList );
                if (nfcOmaReaderList == undefined) {
                    console.info("[NFC_test]3 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    expect(nfcOmaReaderList instanceof Object).assertTrue();
                    let nfcESEReader = nfcOmaReaderList[0];
                    console.info("[nfc_test]3 getReaders results list 0 is" + nfcESEReader);
                    expect(nfcESEReader instanceof Object).assertTrue();
                    let getNfcname = nfcESEReader.getName();
                    console.info("[NFC_test]3 The reader name is: " + getNfcname);
                    expect(typeof (getNfcname)).assertEqual('string');
                }
            } catch (error) {
                console.info("[NFC_test]3 getName occurs exception:" + error);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0400
         * @tc.name Test isSecureElementPresent
         * @tc.desc Indicates whether the corresponding secure element is available.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0400', 0, async function (done)  {
            try {
                let nfcOmaReaderList2 = [];
                nfcOmaReaderList2 = Service.getReaders();
                if (nfcOmaReaderList2 == undefined) {
                    console.info("[NFC_test]4 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    console.info("[nfc_test]4 Result of getReaders:" + nfcOmaReaderList2);
                    expect(nfcOmaReaderList2 instanceof Object).assertTrue();
                    let nfcESEReader2 = nfcOmaReaderList2[0];
                    console.info("[nfc_test]4 getReaders results list 0 is" + nfcESEReader2);
                    expect(nfcESEReader2 instanceof Object).assertTrue();
                    let nfcSePresent = nfcESEReader2.isSecureElementPresent();
                    console.info("[NFC_test]4 security unit check result is: " + nfcSePresent);
                    expect(nfcSePresent).assertTrue();
                    let nfcOmaSession2 = nfcESEReader2.openSession();
                    sleep(3000)
                    console.info("[nfc_test]4 Open the second session result" + nfcOmaSession2);
                    expect(nfcOmaSession2 instanceof Object).assertTrue();
                    let openSession2 = nfcOmaSession2.isClosed();
                    console.info("[NFC_test]4 After close Check the second session is open: " + openSession2);
                    expect(openSession2).assertFalse();
                    nfcESEReader2.closeSessions();
                    sleep(3000)
                    console.info("[NFC_test]4 close the Reader of SE successfully");
                    let closeSession2 = nfcOmaSession2.isClosed();
                    console.info("[NFC_test]4 After close Check the second session is open: " + closeSession2);
                    expect(closeSession2).assertTrue();
                }
            } catch (error) {
                console.info("[NFC_test]4 isSecureElementPresent occurs exception:" + error);
                expect().assertFail();
            }
            done();
        })
        
        /**
         * @tc.number SUB_Communication_NFC_secureElement_js_0500
         * @tc.name Test shutdown
         * @tc.desc Release all SE resources allocated to the service.
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_secureElement_js_0500', 0, async function (done)  {
            try {
                Service.shutdown();
                console.info('[NFC_test] 05 eseshutdown pass');
                let downESEisconnected = Service.isConnected();
                console.info("[NFC_test]5 shutdown the SE SEService The connection status is: " + downESEisconnected);
                expect(downESEisconnected).assertFalse();
                sleep(5000);
                await getSEService().then(async (data) => {
                    Service = data;
                    let seIsConnected = Service.isConnected();
                    console.info("[NFC_test] SEService isConnected The connection status is: " + seIsConnected);
                    if (seIsConnected) {
                        getReader = Service.getReaders();
                        if (getReader == undefined) {
                            console.info("[NFC_test]5 This function is not supported because the phone NFC chip is ST chip.");
                        } else {
                            expect(getReader instanceof Object).assertTrue();
                            console.info("[nfc_test]5 Result of getReaders:" + getReader);
                        }
                    }
                }).catch((err) =>{
                    console.info("[NFC_test] getSEService err.code " + err.code + "err.message " + err.message);
                })
            } catch (error) {
                console.info("[NFC_test]5 getReaders occurs exception:" + error);
                expect().assertFail();
            }
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}
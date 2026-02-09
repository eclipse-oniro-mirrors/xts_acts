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

function seStateOnCb(data){
    console.info("[NFC_test] omapi.on ServiceState: ", data);
    if (data == secureElement.ServiceState.DISCONNECTED) {
        console.info("[NFC_test] omapi.on ServiceState: ", data);
        expect(data).assertEqual(secureElement.ServiceState.DISCONNECTED);
    } else {
        console.info("[NFC_test] omapi.on ServiceState: ", data);
        expect(data).assertEqual(secureElement.ServiceState.CONNECTED);
    }
}
function seStateOffCb(data){
    console.info("[NFC_test] omapi.off ServiceState: ", data);
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
         * @tc.name   SUB_Communication_NFC_secureElement_js_0600
         * @tc.number SUB_Communication_NFC_secureElement_js_0600
         * @tc.desc   Check whether the SE service is connected.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_secureElement_js_0600', Level.LEVEL0, function () {
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
         * @tc.name   SUB_Communication_NFC_secureElement_js_0700
         * @tc.number SUB_Communication_NFC_secureElement_js_0700
         * @tc.desc   Returns the version number of the OMA specification.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_secureElement_js_0700', Level.LEVEL0, function ()  {
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
         * @tc.name   SUB_Communication_NFC_secureElement_js_0800
         * @tc.number SUB_Communication_NFC_secureElement_js_0800
         * @tc.desc   Returns the name of this reader.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_secureElement_js_0800', Level.LEVEL0, function ()  {
            try {
                let nfcOmaReaderList = Service.getReaders();
                console.info("[nfc_test]8 Result of getReaders:" + nfcOmaReaderList );
                if (nfcOmaReaderList.length > 0) {
                    expect(nfcOmaReaderList.length > 0).assertTrue();
                } else {
                    expect(newSEServicetest).assertDeepEquals([]);
                }
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
         * @tc.name   SUB_Communication_NFC_secureElement_js_0900
         * @tc.number SUB_Communication_NFC_secureElement_js_0900
         * @tc.desc   Indicates whether the corresponding secure element is available.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_secureElement_js_0900', Level.LEVEL0, async function (done)  {
            try {
                    let nfcOmaReaderList2 = [];
                    getReader = Service.getReaders();  
                    console.info("[nfc_test]9 getReader value  is: " + getReader);     
                    if(getReader.length > 0) {
                        expect(getReader.length > 0).assertTrue();
                    } else {
                        expect(getReader).assertDeepEquals([]);
                    }                                 
                    for (let i = 0; i < getReader.length; i++) {
                        if (getReader[i].getName() != "eSE") {
                            console.info("[NFC_test]9 se reader not ese.");
                            continue;
                        }

                        let getReaderstate = getReader[i].isSecureElementPresent();
                        if (getReaderstate == false ) {
                            console.info("[NFC_test]9 se not present : " + i);
                            expect(getReaderstate).assertFalse();
                            continue;
                        } else {
                            nfcOmaReaderList2 = getReader[i];
                            expect(getReaderstate).assertTrue();
                        }
                    }                                 
                    console.info("[nfc_test]9 nfcOmaReaderList2 getReader name is: " + nfcOmaReaderList2.getName()); 
                if (nfcOmaReaderList2 == undefined) {
                    console.info("[NFC_test]9 This function is not supported because the phone NFC chip is ST chip.");
                } else {
                    console.info("[nfc_test]9 Result of getReaders:" + nfcOmaReaderList2);
                    expect(nfcOmaReaderList2 instanceof Object).assertTrue();
                    let nfcESEReader2 = nfcOmaReaderList2;
                    console.info("[nfc_test]9 getReaders results list 0 is" + nfcESEReader2);
                    expect(nfcESEReader2 instanceof Object).assertTrue();
                    let nfcSePresent = nfcESEReader2.isSecureElementPresent();
                    if (nfcSePresent == true) {
                        console.info("[NFC_test]9 security unit check result is: " + nfcSePresent);
                        expect(nfcSePresent).assertTrue();
                    } else {
                        console.info("[NFC_test]9 security unit check result is: " + nfcSePresent);
                        expect(nfcSePresent).assertFalse();
                    }
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
                console.info("[NFC_test]9 isSecureElementPresent occurs exception:" + error + "/" + error.code);
                if (error.code == 801) {
                    expect(801).assertEqual(error.code);
                }
            }
            done();
        })
        
        /**
         * @tc.name   SUB_Communication_NFC_secureElement_js_1000
         * @tc.number SUB_Communication_NFC_secureElement_js_1000
         * @tc.desc   Release all SE resources allocated to the service.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_secureElement_js_1000', Level.LEVEL0, async function (done)  {
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
                        if(getReader.length > 0) {
                            expect(getReader.length > 0).assertTrue();
                        } else {
                            expect(getReader).assertDeepEquals([]);
                        } 
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

        /**
         * @tc.name   SUB_Communication_NFC_secureElement_js_1400
         * @tc.number SUB_Communication_NFC_secureElement_js_1400
         * @tc.desc   Close a single omapi.on and omapi.off
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_secureElement_js_1400', Level.LEVEL0, function (){
            try{
                let getOmapiOnData = secureElement.on('stateChanged', seStateOnCb);
                console.info("[NFC_test]14 getOmapiOnData is " + getOmapiOnData);
            }catch(error){
                console.info("[NFC_test]14 omapi on error catch Code: " + error.code + "/" +error);
                expect(801).assertEqual(error.code);
            }

            try{
                sleep(900);
                let getOmapiOffData = secureElement.off('stateChanged', seStateOffCb);
                console.info("[NFC_test]14 getOmapiOffData is " + getOmapiOffData);
            }catch(error){
                console.info("[NFC_test]14 omapi off error catch Code: " + error.code + "/" +error);
                expect(801).assertEqual(error.code);
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_secureElement_js_1500
         * @tc.number SUB_Communication_NFC_secureElement_js_1500
         * @tc.desc   Close a single omapi.on and omapi.off
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_secureElement_js_1500', Level.LEVEL0, function (){
            try{
                let getOmapiOnData = secureElement.on(null, seStateOnCb);
                console.info("[NFC_test]15 stateChanged=null omapi on getOmapiOnData is " + getOmapiOnData);
                expect().assertFail();
            }catch(error){
                console.info("[NFC_test]15 omapi stateChanged=null omapi on catch Code: " + error.code + "/" +error);
                expect(401).assertEqual(error.code)
            }

            try{
                let getOmapiOnData = secureElement.on('error', seStateOnCb);
                console.info("[NFC_test]15 stateChanged=error omapi on getOmapiOnData is " + getOmapiOnData);
                expect().assertFail();
            }catch(error){
                console.info("[NFC_test]15 omapi stateChanged=error omapi on catch Code: " + error.code + "/" +error);
                expect(401).assertEqual(error.code)
            }

            try{
                let getOmapiOnData = secureElement.on('stateChanged', null);
                console.info("[NFC_test]15 seStateOnCb=null omapi on getOmapiOnData is " + getOmapiOnData);
                expect().assertFail();
            }catch(error){
                console.info("[NFC_test]15 omapi seStateOnCb=null omapi on catch Code: " + error.code + "/" +error);
                expect(401).assertEqual(error.code)
            }

            try{
                let getOmapiOnData = secureElement.on('stateChanged', 'seStateOnCbError');
                console.info("[NFC_test]15 seStateOnCb=seStateOnCbError omapi on getOmapiOnData is " + getOmapiOnData);
                expect().assertFail();
            }catch(error){
                console.info("[NFC_test]15 omapi seStateOnCb=seStateOnCbError omapi on catch Code: " + error.code + "/" +error);
                expect(401).assertEqual(error.code)
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_secureElement_js_1600
         * @tc.number SUB_Communication_NFC_secureElement_js_1600
         * @tc.desc   Close a single omapi.on and omapi.off
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_secureElement_js_1600', Level.LEVEL0, function (){
            try{
                let getOmapiOnData = secureElement.on('stateChanged', seStateOnCb);
                console.info("[NFC_test]16 getOmapiOnData is " + getOmapiOnData);
            }catch(error){
                console.info("[NFC_test]16 omapi on error catch Code: " + error.code + "/" +error);
                expect().assertFail();
            }

            try{
                sleep(900);
                let getOmapiOffData = secureElement.off(null, seStateOffCb);
                console.info("[NFC_test]16 stateChanged=null omapi off getOmapiOffData is " + getOmapiOffData);
                expect().assertFail();
            }catch(error){
                console.info("[NFC_test]16 stateChanged=null omapi off error catch Code: " + error.code + "/" +error);
                expect(401).assertEqual(error.code)
            }

            try{
                let getOmapiOffData = secureElement.off('error', seStateOffCb);
                console.info("[NFC_test]16 stateChanged=error omapi off getOmapiOffData is " + getOmapiOffData);
                expect().assertFail();
            }catch(error){
                console.info("[NFC_test]16 stateChanged=error omapi off error catch Code: " + error.code + "/" +error);
                expect(401).assertEqual(error.code)
            }

            try{
                let getOmapiOffData = secureElement.off('stateChanged', null);
                console.info("[NFC_test]16 seStateOffCb=null omapi off getOmapiOffData is " + getOmapiOffData);             
            }catch(error){
                console.info("[NFC_test]16 seStateOffCb=null omapi off error catch Code: " + error.code + "/" +error);
                expect().assertFail();
            }

            try{
                let getOmapiOffData = secureElement.off('stateChanged', 'seStateOffCbError');
                console.info("[NFC_test]16 seStateOffCb=seStateOffCbError omapi off getOmapiOffData is " + getOmapiOffData);             
            }catch(error){
                console.info("[NFC_test]16 seStateOffCb=seStateOffCbError omapi off error catch Code: " + error.code + "/" +error);
                expect().assertFail();
            }

            try{
                let getOmapiOffData = secureElement.off('stateChanged', seStateOffCb);
                console.info("[NFC_test]16 getOmapiOffData is " + getOmapiOffData);
            }catch(error){
                console.info("[NFC_test]16 omapi off error catch Code: " + error.code + "/" +error);
                expect().assertFail();
            }
        })
        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}
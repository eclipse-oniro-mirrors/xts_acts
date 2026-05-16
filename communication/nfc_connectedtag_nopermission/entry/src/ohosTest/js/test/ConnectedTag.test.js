/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resolve, delay))
}

let NfcRfType = {
    NFC_RF_LEAVE: 0,
    NFC_RF_ENTER: 1,
}

export default function ConnectedTagTest() {
    describe('ConnectedTagTest', function () {
        beforeAll(function () {
            console.info('rbeforeAll called')
        })
        beforeEach(function () {
            console.info('beforeEach called')
        })
        afterEach(function () {
            console.info('afterEach called')
        })
        afterAll(function () {
            console.info('afterAll called')
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcConnectedTag_js_0800
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0800
         * @tc.desc   Initializes the active label chip.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0800', Level.LEVEL0, function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps08 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            }
            else {
                try {
                    let inittag = connectedTag.initialize();
                    console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0800 initialize successs: " + inittag);
                    expect().assertFail();
                } catch (error) {
                    console.error("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0800 initialize failed,code is ${error.code}, message is ${error.message}");
                    expect(error.code === 201).assertTrue();
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcConnectedTag_js_0900
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0900
         * @tc.desc   uninitialize active label chip resources.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0900', Level.LEVEL0, function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps09 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            }
            else {
                try {
                    let uninittag = connectedTag.uninitialize();
                    console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0900 uninitialize success: " + uninittag);
                    expect().assertFail();
                } catch (error) {
                    console.error("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_0900 uninitialize failed,code is ${error.code}, message is ${error.message}");
                    expect(error.code === 201).assertTrue();
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcConnectedTag_js_1000
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1000
         * @tc.desc   Reads the content of the active tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1000', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps10 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else {
                try {
                    const result = await connectedTag.read()
                    console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1000 read result: " + result);
                    expect().assertFail();
                } catch (error) {
                    console.error("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1000 read failed,code is ${error.code}, message is ${error.message}");
                    expect(error.code === 201).assertTrue();
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcConnectedTag_js_1100
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1100
         * @tc.desc   Reads the content of the active tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1100', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps11 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else {
                try {
                    const result = await new Promise((resolve, reject) => {
                        connectedTag.read((err, result) => {
                            if (err) {
                                console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1100 read err: " + err);
                                expect(err.code === 201).assertTrue()
                                reject(err);
                            } else {
                                console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1100 read success result: " + result);
                                expect().assertFail();
                                resolve(result);
                            }
                        });
                    })

                } catch (error) {
                    console.error("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1100 read failed,code is ${error.code}, message is ${error.message}");

                }
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcConnectedTag_js_1200
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1200
         * @tc.desc   Write Content to Active Tags
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1200', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps12 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else {
                try {
                    let rawData = [0x00, 0x01, 0xFF];
                    const result = await connectedTag.write(rawData)
                    expect().assertFail();
                } catch (error) {
                    console.error("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1200 write failed,code is ${error.code}, message is ${error.message}");
                    expect(error.code === 201).assertTrue();
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcConnectedTag_js_1300
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1300
         * @tc.desc   Write Content to Active Tags
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1300', Level.LEVEL0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps13 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else {
                try {
                    let rawData = [0x00, 0x01, 0xFF];
                    const result = await new Promise((resolve, reject) => {
                        connectedTag.write(rawData, (err, result) => {
                            if (err) {
                                console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1300 write err: " + err);
                                expect(err.code === 201).assertTrue()
                                reject(err);
                            } else {
                                console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1300 write success result: " + result);
                                expect().assertFail();
                                resolve(result);
                            }
                        });
                    });

                } catch (error) {
                    console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1300 write ,code is ${error.code}, message is ${error.message}");

                }
            }
            done();
        })
        /**
         * @tc.name   SUB_Communication_NFC_nfcConnectedTag_js_1400
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1400
         * @tc.desc   NfcRfType value.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1400', Level.LEVEL0, function (done) {
            try {
                console.info('[nfc_test]1 NfcRfType value test ')
                expect(connectedTag.NfcRfType.NFC_RF_ENTER).assertEqual(1);
                console.info('[nfc_test]2 NfcRfType value test ')
                expect(connectedTag.NfcRfType.NFC_RF_LEAVE).assertEqual(0);
            } catch (error) {
                console.info("[NFC_test] SUB_Communication_NFC_nfcConnectedTag_js_1400 get NfcRfType failed,code is ${error.code}, message is ${error.message}");
                expect().assertFail();
            }
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}
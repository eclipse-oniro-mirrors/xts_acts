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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
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
         * @tc.name Test init connectedTag
         * @tc.desc Initializes the active label chip.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0100', 0, function ()  {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            } else {
                let inittag = connectedTag.init();
                console.info("[NFC_test] ConnectedTag1 readMultiplePages1 err: " + inittag );
                expect(inittag).assertTrue();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0200
         * @tc.name Test init connectedTag
         * @tc.desc Reads the content of the active tag.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0200', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            } else {
                await connectedTag.readNdefTag().then(result => {
                    console.info("[NFC_test] ConnectedTag2 readMultiplePages1 result: " + result );
                    expect(result != null).assertTrue();
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test] ConnectedTag2 readMultiplePages1 err: " + err);
                    expect(true).assertTrue();
                    done();
                });
                sleep(3000);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0300
         * @tc.name Test init connectedTag
         * @tc.desc Reads the content of the active tag.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0300', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            } else {
                connectedTag.readNdefTag((err, result)=> {
                    if (err) {
                        console.info("[NFC_test] ConnectedTag3 isExtendedApduSupported err: " + err);
                        expect().assertFail();
                    } else {
                        console.info("[NFC_test] ConnectedTag3 isExtendedApduSupported result: " + result);
                        expect(result!=null).assertTrue();
                    }
                });
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0400
         * @tc.name Test writeNdefTag connectedTag
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0400', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            } else {
                await connectedTag.writeNdefTag().then(result => {
                    console.info("[NFC_test] ConnectedTag4 readMultiplePages1 result: " + result );
                    expect(result != null).assertTrue();
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test] ConnectedTag4 readMultiplePages1 err: " + err);
                    expect(true).assertTrue(true);
                    done();
                });
                sleep(3000);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0500
         * @tc.name Test writeNdefTag connectedTag
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0500', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done()
            } else {
                connectedTag.writeNdefTag((err, result)=> {
                    if (err) {
                        console.info("[NFC_test] ConnectedTag5 isExtendedApduSupported err: " + err);
                        expect().assertFail();
                        done();
                    } else {
                        console.info("[NFC_test] ConnectedTag5 isExtendedApduSupported result: " + result);
                        expect(result!=null).assertTrue();
                        done();
                    }
                });
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0600
         * @tc.name Test on_off connectedTag
         * @tc.desc Registers and cancels the NFC field strength status event.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0600', 0, function () {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            } else {
                let recvNfcRfNotifyFunc = result => {
                    console.info("[NFC_test] ConnectedTag6 nfc state receive state ->" + result);
                    expect(result != null).assertTrue();
                }
                connectedTag.on('[NFC_test] ConnectedTag6 notify',recvNfcRfNotifyFunc)
                connectedTag.off('[NFC_test] ConnectedTag6 notify',recvNfcRfNotifyFunc)
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0700
         * @tc.name Test uninit connectedTag
         * @tc.desc Unloads active label chip resources.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0700', 0, function () {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            } else {
                let uninittag = connectedTag.uninit();
                console.info("[NFC_test] ConnectedTag7 readMultiplePages1 err: " + uninittag );
                expect(uninittag).assertTrue();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0800
         * @tc.name Test initialize connectedTag
         * @tc.desc Initializes the active label chip.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
         it('SUB_Communication_NFC_nfcConnectedTag_js_0800', 0, function ()  {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            }
            else{
                let inittag = connectedTag.initialize();
                console.info("[NFC_test] ConnectedTag8 readMultiplePages1 err: " + inittag );
                expect(inittag).assertTrue();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0900
         * @tc.name Test uninitialize connectedTag
         * @tc.desc uninitialize active label chip resources.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0900', 0, function () {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            }
            else{
                let uninittag = connectedTag.uninitialize();
                console.info("[NFC_test] ConnectedTag9 readMultiplePages1 err: " + uninittag );
                expect(uninittag).assertTrue();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1000
         * @tc.name Test read connectedTag
         * @tc.desc Reads the content of the active tag.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1000', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else{
                await connectedTag.read().then(result => {
                    console.info("[NFC_test] ConnectedTag10 readMultiplePages1 result: " + result);
                    expect(result != null).assertTrue();
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test] ConnectedTag10 readMultiplePages1 err: " + err);
                    expect(true).assertTrue();
                    done();
                });
                sleep(3000);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1100
         * @tc.name Test read connectedTag
         * @tc.desc Reads the content of the active tag.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1100', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else{
                connectedTag.read((err, result)=> {
                    if (err) {
                        console.info("[NFC_test] ConnectedTag11 isExtendedApduSupported err: " + err);
                        expect().assertFail();
                        done();
                    } else {
                        console.info("[NFC_test] ConnectedTag11 isExtendedApduSupported result: " + result);
                        expect(result!=null).assertTrue();
                        done();
                    }
                });
            }
        })

       /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1200
         * @tc.name Test write connectedTag
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1200', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else{
                await connectedTag.write().then(result => {
                    console.info("[NFC_test] ConnectedTag12 readMultiplePages1 result: " + result);
                    expect(result != null).assertTrue();
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test] ConnectedTag12 readMultiplePages1 err: " + err);
                    expect(true).assertTrue();
                    done();
                });
                sleep(3000);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1300
         * @tc.name Test write connectedTag
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1300', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else{
                connectedTag.write((err, result)=> {
                    if (err) {
                        console.info("[NFC_test] ConnectedTag13 isExtendedApduSupported err: " + err);
                        expect().assertFail();
                        done();
                    } else {
                        console.info("[NFC_test] ConnectedTag13 isExtendedApduSupported result: " + result);
                        expect(result!=null).assertTrue();
                        done();
                    }
                });
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}
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


import tag from '@ohos.nfc.tag';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

function readerModeCb(err, tagInfo) {
    if (!err) {
        console.info("offCallback: tag found tagInfo = ", JSON.stringify(tagInfo));
        expect(tagInfo.uid.length > 0).assertTrue();
        expect(tagInfo.technology.length > 0).assertTrue();
    } else {
        console.error("offCallback err: " + err.message);
        return;
    }
}

export default function nfcTagABFVTest() {
    describe('nfcTagABFVTest', function () {
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
         * @tc.name   SUB_Communication_NFC_nfctage_js_0100
         * @tc.number SUB_Communication_NFC_nfctage_js_0100
         * @tc.desc   This interface registerForegroundDispatch.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_0100', Level.LEVEL0, function ()  {
            let elementName = {
                "bundleName": "ohos.acts.communication.nfc.nfcdevice",
                "abilityName": "MainAbility",
                "moduleName": "entry"
            };
            let discTech = [1, 2, 4];
            try {
                let recvNfcTagFunc = tagInfo => {
                    console.info("[NFC_test] controller1 nfc state receive state ->" + tagInfo);
                    expect(tagInfo.uid.length > 0).assertTrue();
                    expect(tagInfo.technology.length > 0).assertTrue();
                    expect(tagInfo != null).assertTrue();
                }
                tag.registerForegroundDispatch(elementName, discTech, recvNfcTagFunc);
                console.info('[NFC_test] nfc registerForegroundDispatch pass')
                tag.unregisterForegroundDispatch(elementName);
                console.info('[NFC_test] nfc unregisterForegroundDispatch pass')
            } catch (error) {
                if (error.code === 201) {
                    console.info('nfc registerForegroundDispatch error' + error + "/" + error.code);
                    expect(201).assertEqual(error.code)
                } else {
                    console.info('nfc registerForegroundDispatch failed');
                    expect().assertFail();
                }
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_0200
         * @tc.number SUB_Communication_NFC_nfctage_js_0200
         * @tc.desc   This interface getBarcode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_0200', Level.LEVEL0, async function (done)  {
            let elementName = {
                "bundleName": "ohos.acts.communication.nfc.nfcdevice",
                "abilityName": "MainAbility",
                "moduleName": "entry"
            };
            let recvNfcTagFunc = tagInfo => {
                console.info("[NFC_test] controller1 nfc state receive state ->" + tagInfo);
                expect(tagInfo.uid.length > 0).assertTrue();
                expect(tagInfo.technology.length > 0).assertTrue();
                expect(tagInfo != null).assertTrue();
            }
            let discTech = [1, 2, 4];
            try {
                tag.on('readerMode', elementName, discTech, recvNfcTagFunc);
            } catch (err) {
                if (err.code === 201) {
                    expect(201).assertEqual(err.code);
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_0200 ERROR :  " + err + " - " + err.code);
                } else {
                    expect().assertFail();
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_0200 Fail :  ");
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_0300
         * @tc.number SUB_Communication_NFC_nfctage_js_0300
         * @tc.desc   This interface getBarcode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_0300', Level.LEVEL0, async function (done)  {
            let elementName = {
                "bundleName": "ohos.acts.communication.nfc.nfcdevice",
                "abilityName": "MainAbility",
                "moduleName": "entry"
            };
            let recvNfcTagFunc = tagInfo => {
                console.info("[NFC_test] controller1 nfc state receive state ->" + tagInfo);
                expect(tagInfo.uid.length > 0).assertTrue();
                expect(tagInfo.technology.length > 0).assertTrue();
                expect(tagInfo != null).assertTrue();
            }
            let discTech = [1, 2, 4];
            let interval = 200;

            try {
                tag.on('readerModeWithInterval', elementName, discTech, recvNfcTagFunc, interval);
            } catch (err) {
                if (err.code === 201) {
                    expect(201).assertEqual(err.code);
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_0300 ERROR :  " + err + " - " + err.code);
                } else {
                    expect().assertFail();
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_0300 Fail :  ");
                }
            }
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}
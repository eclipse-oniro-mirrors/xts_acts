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

let NdefRecord = {
    NFC_A : 1,
    NFC_B : 2,
    ISO_DEP	 : 3,
    NFC_F : 4,
    NFC_V : 5,
    NDEF : 6,
    MIFARE_CLASSIC : 8,
    MIFARE_ULTRALIGHT : 9,
    NDEF_FORMATABLE : 10,
};

let NfcForumType = {
    NFC_FORUM_TYPE_1 : 1,
    NFC_FORUM_TYPE_2 : 2,
    NFC_FORUM_TYPE_3 : 3,
    NFC_FORUM_TYPE_4 : 4,
    MIFARE_CLASSIC : 101,
};

let aTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
    ],
    "tagRfDiscId": 1,
    "supportedProfiles": 1,
};

let bTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [2],
    "extrasData": [
        {
            "AppData": "A0C0", "ProtocolInfo": "131F",
        }
    ],
    "tagRfDiscId": 1,
};

let fTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [4],
    "extrasData": [
        {
            "SystemCode": "A0C0", "Pmm": "131F",
        }
    ],
    "tagRfDiscId": 1,
};

let vTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [ 5 ],
    "extrasData": [
        {
            "ResponseFlags": 0x09, "DsfId": 0x13,
        }
    ],
    "tagRfDiscId": 1,
};

let Want = {
    "uid" : '01020304',
    "technology" : [1],
    "tagRfDiscId" :1,
    "Sak": 0x08, 
    "Atqa": "B000",
}

export default function nfcTagABFVErrorTest() {
    describe('nfcTagABFVErrorTest', function () {
        beforeAll(function () {
            console.info('beforeAll called')
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
         * @tc.number SUB_Communication_NFC_nfctage_js_0100
         * @tc.name Test getTagInfo
         * @tc.desc Obtains the DsfId value of the taginfo. The error code is 401
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_NFC_nfctage_js_0100', Level.LEVEL1, function ()  {
            let TagInfo ;
            try{
                TagInfo = tag.getTagInfo("test");
                console.info('[NFC_test]TagABFV1 TagInfo:' + TagInfo)
                expect(TagInfo instanceof Object).assertTrue();
            }catch(error){
                console.info('[NFC_test]TagABFV1 TagInfo errorcode:' + error.code)
                expect(401).assertEqual(error.code);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0200
         * @tc.name Test getNfcA
         * @tc.desc Obtains the DsfId value of the taginfo. The error code is 401
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_NFC_nfctage_js_0200', Level.LEVEL1, function ()  {
            let TagInfo ;
            try{
                TagInfo = tag.getNfcA("test");
                console.info('[NFC_test]TagABFV2 getNfcAtag:' + TagInfo)
                expect(TagInfo instanceof Object).assertTrue();
            }catch(error){
                console.info('[NFC_test]TagABFV2 getNfcAtag errorcode:' + error.code)
                expect(401).assertEqual(error.code);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0300
         * @tc.name Test getNfcB
         * @tc.desc Obtains the DsfId value of the taginfo. The error code is 401
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_NFC_nfctage_js_0300', Level.LEVEL1, function ()  {
            let TagInfo ;
            try{
                TagInfo = tag.getNfcB("test");
                console.info('[NFC_test]TagABFV3 getNfcBtag:' + TagInfo)
                expect(TagInfo instanceof Object).assertTrue();
            }catch(error){
                console.info('[NFC_test]TagABFV3 getNfcBtag errorcode:' + error.code)
                expect(401).assertEqual(error.code);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0400
         * @tc.name Test getNfcF
         * @tc.desc Obtains the DsfId value of the taginfo. The error code is 401
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_NFC_nfctage_js_0400', Level.LEVEL1, function ()  {
            let TagInfo ;
            try{
                TagInfo = tag.getNfcF("test");
                console.info('[NFC_test]TagABFV4 getNfcFtag:' + TagInfo)
                expect(TagInfo instanceof Object).assertTrue();
            }catch(error){
                console.info('[NFC_test]TagABFV4 getNfcFtag errorcode:' + error.code)
                expect(401).assertEqual(error.code);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0500
         * @tc.name Test getNfcV
         * @tc.desc Obtains the DsfId value of the taginfo. The error code is 401
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_NFC_nfctage_js_0500', Level.LEVEL1, function ()  {
            let TagInfo ;
            try{
                TagInfo = tag.getNfcV("test");
                console.info('[NFC_test]TagABFV5 getNfcVtag:' + TagInfo)
                expect(TagInfo instanceof Object).assertTrue();
            }catch(error){
                console.info('[NFC_test]TagABFV5 getNfcVtag errorcode:' + error.code)
                expect(401).assertEqual(error.code);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0600
         * @tc.name Test getBarcodetag
         * @tc.desc This interface getBarcodetag The error code is 401
         * @tc.size since 16
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_NFC_nfctage_js_0600', Level.LEVEL1, function ()  {

            try {
                let data = tag.getBarcodeTag("test");
                console.info("[NFC_test]06 getBarcodeTag data is " + data);
                expect().assertFail();
            }catch(error){
                if (error.code == 201) {
                    console.info("[NFC_test]06 getBarcodeTag error is " + error + "/" + error.code);
                    expect(true).assertTrue();
                } else if (error.code == 401) {
                    console.info("[NFC_test]06 getBarcodeTag error is " + error + "/" + error.code);
                    expect(true).assertTrue();
                } else if (error.code == 801) {
                    console.info("[NFC_test]06 getBarcodeTag error is " + error + "/" + error.code);
                    expect(true).assertTrue();
                } else if (error.code == 3100201) {
                    console.info("[NFC_test]06 getBarcodeTag error is " + error + "/" + error.code);
                    expect(true).assertTrue();
                } else if (error.code == 3100204) {
                    console.info("[NFC_test]06 getBarcodeTag error is " + error + "/" + error.code);
                    expect(true).assertTrue();
                } else {
                    console.info("[NFC_test]06 getBarcodeTag error is " + error + "/" + error.code);
                    expect().assertFail();
                }
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0700
         * @tc.name Test registerForegroundDispatch
         * @tc.desc This interface registerForegroundDispatch The error code is 401
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_NFC_nfctage_js_0700', Level.LEVEL1, function ()  {
            try {
                tag.registerForegroundDispatch("test");
                console.info('[NFC_test]07 nfc registerForegroundDispatch pass')
                expect().assertFail();
            } catch (error) {
                console.info('[NFC_test]07 nfc registerForegroundDispatch error' + error + "/" + error.code)
                expect(401).assertEqual(error.code);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0800
         * @tc.name Test unregisterForegroundDispatch
         * @tc.desc This interface unregisterForegroundDispatch The error code is 401
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_NFC_nfctage_js_0800', Level.LEVEL1, function ()  {
            try {
                tag.unregisterForegroundDispatch("test");
                console.info('[NFC_test]08 nfc unregisterForegroundDispatch pass')
                expect().assertFail();
            } catch (error) {
                console.info('[NFC_test]08 nfc unregisterForegroundDispatch error' + error + "/" + error.code)
                expect(401).assertEqual(error.code);
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}


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

let FeatureType = {
    HCE : 0,
    UICC : 0,
    ESE : 0,
}

let isoDepTaginfo = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 3],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {
            "HistoricalBytes": "4D54000500308693695B", "HiLayerResponse": "",
        },
    ],
    "tagRfDiscId": 1,
};

let IsoDepTag ;

let parametertest = 1; 
export default function nfcIsoDepErrorTest() {
    describe('nfcIsoDepErrorTest', function () {
        beforeAll(function () {
            console.info('beforeAll called')
        })
        beforeEach(function() {
            console.info('beforeEach called')
            try{
                IsoDepTag = tag.getIsoDep(isoDepTaginfo);
            }catch(error){
                console.info('getIsoDep is ->' + error)
            }
        })
        afterEach(function () {
            console.info('afterEach called')
        })
        afterAll(function () {
            console.info('afterAll called')
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcIsoDep_js_0100
         * @tc.name Test isExtendedApduSupported IsoDep
         * @tc.desc Check whether extended APDUs are supported Promise. The error code is 401
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0100', Level.LEVEL1, async function (done) {
            if (IsoDepTag != null && IsoDepTag != undefined) {
                (async () => {
                    try {
                        
                        let result = await IsoDepTag.isExtendedApduSupported("test");
                        console.info("[NFC_test]isoDep1 isExtendedApduSupported data: " + result);
                        expect(result).assertInstanceOf('Array')
                        expect().assertFail()
                    } catch(error) {
                        console.info("[NFC_test]isoDep1 isExtendedApduSupported errorcode: " + error.code);
                        expect(401).assertEqual(error.code)
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]IsoDepTag1 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcIsoDep_js_0200
         * @tc.name Test isExtendedApduSupported IsoDep
         * @tc.desc Check whether extended APDUs are supported callback. The error code is 401
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0200', Level.LEVEL1, async function (done) {
            if (IsoDepTag != null && IsoDepTag != undefined) {
                try {
                    IsoDepTag.isExtendedApduSupported("test")((err, data)=> {
                        if (err) {
                            expect().assertFail();
                            console.info("[NFC_test]isoDep2 isExtendedApduSupported errcode: " + err);
                        } else {
                            expect(false).assertEqual(data);
                            console.info("[NFC_test]isoDep2 isExtendedApduSupported data: " + data);
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]isoDep2 isExtendedApduSupported errorcode: " + error.code);
                    expect(401).assertEqual(error.code)
                }
                done();
            } else {
                console.info("[NFC_test]IsoDepTag2 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcIsoDep_js_0300
         * @tc.name Test getIsoDep IsoDep
         * @tc.desc Obtains an object based on the tag information The error code is 401
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0300', Level.LEVEL1, function ()  {
            if (IsoDepTag != null && IsoDepTag != undefined) {
                try {
                    let getIsoDepTaginfo = tag.getIsoDep("test");
                    console.info("[NFC_test]isoDep3 getIsoDep: " + getIsoDepTaginfo);
                } catch (error) {
                    console.info("[NFC_test]isoDep3 getIsoDep errorcode: " + error.code);
                    expect(401).assertEqual(error.code)
                }
            } else {
                console.info("[NFC_test]IsoDepTag3 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}
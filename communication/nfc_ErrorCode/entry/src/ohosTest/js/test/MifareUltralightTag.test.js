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

let mifareUltralightTaginfo = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 9],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {
            "MifareUltralightC": "ture",
        },
    ],
    "tagRfDiscId": 1,
};

let MifareUltralightType = {
    TYPE_UNKOWN : 0x04,
    TYPE_ULTRALIGHT : 1,
    TYPE_ULTRALIGHT_C : 2,
}

let MifareUltralightTag = null;

export default function UltralightTagErrorTest() {
    describe('UltralightTagErrorTest', function () {
        beforeAll(function () {
            console.info('beforeAll called')
        })
        beforeEach(function() {
            console.info('beforeEach called')
            try{
                MifareUltralightTag = tag.getMifareUltralight(mifareUltralightTaginfo);
                console.info(' mifareUltralight is' + mifareUltralight)
            }catch(error){
                console.info(' mifareUltralight error' + error)
            }
        })
        afterEach(function () {
            console.info('afterEach called')
        })
        afterAll(function () {
            console.info('afterAll called')
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0100
         * @tc.number SUB_Communication_NFC_mifareUltralight_0100
         * @tc.desc   Test readMultiplePages api by promise. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareUltralight_0100', Level.LEVEL1, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                let pageIndex = 1;
                (async () => {
                    try {
                        let result = await MifareUltralightTag.readMultiplePages('test');
                        if (result.length > 0) {
                            expect(result.length > 0).assertTrue();
                        } else{
                            expect(result).assertDeepEquals([]);
                        }
                        console.info("[NFC_test]mifareUltralight1 readMultiplePages data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]mifareUltralight1 readMultiplePages errorcode: " + error.code);
                        expect(401).assertEqual(error.code);
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]mifareUltralight1 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0200
         * @tc.number SUB_Communication_NFC_mifareUltralight_0200
         * @tc.desc   Test readMultiplePages api by callback. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareUltralight_0200', Level.LEVEL1, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                let pageIndex = 1;      
                try {
                    MifareUltralightTag.readMultiplePages('test', (err, data)=> {
                        if (err) {
                            console.info("[NFC_test]mifareUltralight2 readMultiplePages errcode: " + err);
                            expect(true).assertEqual(true);
                        } else {
                            console.info("[NFC_test]mifareUltralight2 readMultiplePages data: " + data + "json2:" + JSON.stringify(data));
                            if (data.length > 0) {
                                expect(data.length > 0).assertTrue();
                            } else  {
                                expect(data).assertDeepEquals([]);
                            }
                            expect(true).assertTrue(data >= 0);
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]mifareUltralight2 readMultiplePages errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]mifareUltralight2 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0300
         * @tc.number SUB_Communication_NFC_mifareUltralight_0300
         * @tc.desc   Test writeSinglePage api by promise. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareUltralight_0300', Level.LEVEL1, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                let pageIndex = 1;
                let rawData = [0x01, 0x02];
                (async () => {
                    try {
                        let result = await MifareUltralightTag.writeSinglePage('test', rawData);
                        console.info("[NFC_test]mifareUltralight3 writeSinglePage data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]mifareUltralight3 writeSinglePage errorcode: " + error.code);
                        expect(401).assertEqual(error.code);
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]mifareUltralight3 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0400
         * @tc.number SUB_Communication_NFC_mifareUltralight_0400
         * @tc.desc   Test writeSinglePage api by callback. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareUltralight_0400', Level.LEVEL1, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                let pageIndex = 1;
                let rawData = [0x01, 0x02];            
                try {
                    MifareUltralightTag.writeSinglePage('test', rawData, (err, data)=> {
                        if (err) {
                            console.info("[NFC_test]mifareUltralight4 writeSinglePage errcode: " + err);
                            expect(true).assertEqual(true);
                        } else {
                            console.info("[NFC_test]mifareUltralight4 writeSinglePage data: " + data + "json2:" + JSON.stringify(data));
                            expect(true).assertTrue(data >= 0);
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]mifareUltralight4 writeSinglePage errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]mifareUltralight4 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

         /**
          * @tc.name   SUB_Communication_NFC_mifareUltralight_0500
          * @tc.number SUB_Communication_NFC_mifareUltralight_0500
          * @tc.desc   Test getMifareUltralight api. The error code is 401
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL1
          */
         it('SUB_Communication_NFC_mifareUltralight_0500', Level.LEVEL1, function ()  {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                try {
                    let nfcMifareUltralightTag = tag.getMifareUltralight("test");
                    console.info("[NFC_test]mifareUltralight5 getMifareUl: " + nfcMifareUltralightTag);
                } catch (error) {
                    console.info("[NFC_test]mifareUltralight5 getMifareUl errorcode: " + error.code);
                    expect(401).assertEqual(error.code)
                }
            } else {
                console.info("[NFC_test]mifareUltralight5 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })	

}


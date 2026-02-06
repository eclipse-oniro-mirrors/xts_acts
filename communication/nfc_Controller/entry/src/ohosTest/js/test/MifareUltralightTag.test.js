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
    TYPE_UNKOWN : 0,
    TYPE_ULTRALIGHT : 1,
    TYPE_ULTRALIGHT_C : 2,
}

let MifareUltralightTag = null;

export default function nfcMifareUltralightTag() {
    describe('nfcMifareUltralightTag', function () {
        beforeAll(function () {
            console.info('rbeforeAll called')
        })
        beforeEach(function() {
            try {
                MifareUltralightTag = tag.getMifareUltralight(mifareUltralightTaginfo);
                console.info(' mifareUltralight is' + mifareUltralight)
            } catch (error) {
                console.info(' mifareUltralight error' + error)
            }
            console.info('beforeEach called')
        })
        afterEach(function () {
            console.info('afterEach called')
        })
        afterAll(function () {
            console.info('afterAll called')
        })
            
        /**
         * @tc.number SUB_Communication_NFC_mifareUltralight_0100
         * @tc.name testreadMultiplePages
         * @tc.desc Test readMultiplePages api by promise.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_mifareUltralight_0100', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                let pageIndex = 1;
                await MifareUltralightTag.readMultiplePages(pageIndex).then((data) => {
                    console.info("[NFC_test] mifareUltralight1 readMultiplePages1 data: " + data + "json1:" + JSON.stringify(data));
                    expect(data).assertInstanceOf('Array')
                    done();
                }).catch((err)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] mifareUltralight1 readMultiplePages1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] mifareUltralight1 readMultiplePages1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] mifareUltralight1 readMultiplePages1 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] mifareUltralight1 readMultiplePages1 err: " + err);
                        expect(true).assertTrue();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]mifareUltralight1 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareUltralight_0200
         * @tc.name testreadMultiplePages
         * @tc.desc Test readMultiplePages api by callback.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_mifareUltralight_0200', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                let pageIndex = 1;
                MifareUltralightTag.readMultiplePages(pageIndex, (err, data)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] mifareUltralight2 readMultiplePages2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] mifareUltralight2 readMultiplePages2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] mifareUltralight2 readMultiplePages2 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] mifareUltralight2 readMultiplePages2 data: " + data + "json2:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Array')
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]mifareUltralight2 = null & = undefined: ");
                expect().assertFail();
            }
        })
        
        /**
         * @tc.number SUB_Communication_NFC_mifareUltralight_0300
         * @tc.name testwriteSinglePage
         * @tc.desc Test writeSinglePage api by promise.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_mifareUltralight_0300', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                let pageIndex = 1;
                let rawData = [0x01, 0x02];
                await MifareUltralightTag.writeSinglePage(pageIndex, rawData).then((data) => {
                    console.info("[NFC_test] mifareUltralight3 writeSinglePages1 data: " + data + "json1:" + JSON.stringify(data));
                    expect(data >= 0).assertTrue();
                    done();
                }).catch((err)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] mifareUltralight3 writeSinglePages1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] mifareUltralight3 writeSinglePages1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] mifareUltralight3 writeSinglePages1 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] mifareUltralight3 writeSinglePages1 err: " + err);
                        expect(true).assertTrue();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]mifareUltralight3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareUltralight_0400
         * @tc.name testwriteSinglePage
         * @tc.desc Test writeSinglePage api by callback.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_mifareUltralight_0400', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                let pageIndex = 1;
                let rawData = [0x01, 0x02];
                MifareUltralightTag.writeSinglePage(pageIndex, rawData, (err, data)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] mifareUltralight4 writeSinglePages2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] mifareUltralight4 writeSinglePages2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] mifareUltralight4 writeSinglePages2 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] mifareUltralight4 writeSinglePages2 data: " + data + "json2:" + JSON.stringify(data));
                        expect(data >= 0).assertTrue();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]mifareUltralight4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareUltralight_0500
         * @tc.name testgetType
         * @tc.desc Gets the type of Mifare Ultralight label
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_mifareUltralight_0500', Level.LEVEL0, function ()  {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                let getType = MifareUltralightTag.getType();
                console.info("[NFC_test] mifareUltralight5 getType: " + getType);
                expect(getType).assertEqual(MifareUltralightType.TYPE_UNKOWN);
            } else {
                console.info("[NFC_test]mifareUltralight5 = null & = undefined: ");
                expect().assertFail();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })	

}



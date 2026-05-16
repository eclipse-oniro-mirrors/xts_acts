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

let MifareClassicType = {
    TYPE_UNKNOWN : -1,
    TYPE_CLASSIC : 0,
    TYPE_PLUS : 1,
    TYPE_PRO : 2,
}

let MifareTagSize = {
    MC_SIZE_MINI : 320,
    MC_SIZE_1K : 1024,
    MC_SIZE_2K : 2048,
    MC_SIZE_4K : 4096,	
}

let mifareclassicTaginfo = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 8],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {
            
        },
    ],
    "tagRfDiscId": 1,
};
let MifareClassicTag = null;
export default function nfcMifareClassicTag() {
    describe('nfcMifareClassicTag', function () {
        beforeAll(function () {
            console.info('rbeforeAll called')
            try{
                MifareClassicTag = tag.getMifareClassic(mifareclassicTaginfo);
            } catch (error) {
                if (error.code == 3100201) {
                    expect(error.code).assertEqual(3100201);
                    console.info('beforeAll mifareClassic error' + error.code + error);
                } else {
                    expect().assertFail();
                    console.info('beforeAll mifareClassic Fail');
                }
            }
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0100
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0100
         * @tc.desc   Test authenticateSector api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0100', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let sectorIndex = 1; 
                let key = [0x04, 0x05];  
                await MifareClassicTag.authenticateSector(sectorIndex, key, true).then((data) => {
                    console.info("[NFC_test] MifareClassicTag1 authenticateSector1 data: " + data + "json1:" + JSON.stringify(data));
                    expect(data != 0).assertTrue();
                    done();
                }).catch((err)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err + err.code);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err + err.code);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err + err.code);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err + err.code);
                        expect().assertFail();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag1 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0200
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0200
         * @tc.desc   Test authenticateSector api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0200', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let sectorIndex = 1; 
                let key = [0x04, 0x05];  
                MifareClassicTag.authenticateSector(sectorIndex, key, true, (err, data)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 data: " + data + "json2:" + JSON.stringify(data));
                        expect(data != 0).assertTrue();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0300
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0300
         * @tc.desc   Test readSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0300', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                await MifareClassicTag.readSingleBlock(blockIndex).then((data) => {
                    console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 data: " + data + "json3:" + JSON.stringify(data));
                    if (data.length > 0) {
                        expect(data.length > 0).assertTrue();
                    } else {
                        expect(data).assertDeepEquals([]);
                    }
                    expect(data).assertInstanceOf('Array')
                    done();
                }).catch((err)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 err: " + err);
                        expect(true).assertTrue();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0400
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0400
         * @tc.desc   Test readSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0400', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                MifareClassicTag.readSingleBlock(blockIndex, (err, data)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 data: " + data+ "json4:" + JSON.stringify(data));
                        if (data.length > 0) {
                            expect(data.length > 0).assertTrue();
                        } else {
                            expect(data).assertDeepEquals([]);
                        }
                        expect(data).assertInstanceOf('Array')
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0500
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0500
         * @tc.desc   Test writeSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0500', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1;
                let rawData = [0x0a, 0x14]; 
                await MifareClassicTag.writeSingleBlock(blockIndex, rawData).then((data) => {
                    console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 data: " + data + "json5:" + JSON.stringify(data));
                    expect(data).assertInstanceOf('Number')
                    done();
                }).catch((err)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect(true).assertEqual(true);
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag5 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0600
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0600
         * @tc.desc   Test writeSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0600', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let rawData = [0x0a, 0x14]; 
                MifareClassicTag.writeSingleBlock(blockIndex, rawData, (err, data)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 data: " + data + "json6:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Number')
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag6 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0700
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0700
         * @tc.desc   Test incrementBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0700', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let value = 0x20;
                await MifareClassicTag.incrementBlock(blockIndex, value).then((data) => {
                    console.info("[NFC_test] MifareClassicTag7 incrementBlock1 data: " + data );
                    expect(data).assertInstanceOf('Number')
                }).catch((err)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 err: " + err);
                        expect(true).assertEqual(true);
                    }
                    done();
                });
                done();
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag7 = null & = undefined: ");
                expect().assertFail();
                done();
            }
        })


        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0800
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0800
         * @tc.desc   SUB_Communication_NFC_mifareClassic_js_0800
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0800', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let value = 0x20;
                MifareClassicTag.incrementBlock(blockIndex, value, (err, data)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] mifareClassic8 incrementBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] mifareClassic8 incrementBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] mifareClassic8 incrementBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] mifareClassic8 incrementBlock2 data: " + data + "json8:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Number')
                    }
                    done();
                });
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag8 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0900
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0900
         * @tc.desc   Test decrementBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0900', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let value = 0x20;
                await MifareClassicTag.decrementBlock(blockIndex, value).then((data) => {
                    console.info("[NFC_test] MifareClassicTag9 decrementBlock1 data: " + data + "json9:" + JSON.stringify(data));
                    expect(data).assertInstanceOf('Number')
                    done();
                }).catch((err)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 err: " + err);
                        expect(true).assertEqual(true);
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag9 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1000
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1000
         * @tc.desc   Test decrementBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1000', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let value = 0x20;
                MifareClassicTag.decrementBlock(blockIndex, value, (err, data)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] MifareClassicTag10 decrementBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] MifareClassicTag10 decrementBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] MifareClassicTag10 decrementBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] MifareClassicTag10 decrementBlock2 data: " + data + "json10:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Number')
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag10 = null & = undefined: ");
                expect().assertFail();
            }
        })


        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1100
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1100
         * @tc.desc   SUB_Communication_NFC_mifareClassic_js_1100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1100', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                await MifareClassicTag.transferToBlock(blockIndex).then((data) => {
                    console.info("[NFC_test] mifareClassic11 transferToBlock1 data: " + data );
                    expect(data).assertInstanceOf('Number')
                    done();
                }).catch((err)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] mifareClassic11 transferToBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] mifareClassic11 transferToBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] mifareClassic11 transferToBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] mifareClassic11 transferToBlock1 err: " + err);
                        expect(true).assertEqual(true);
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag11 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1200
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1200
         * @tc.desc   Test transferToBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1200', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                MifareClassicTag.transferToBlock(blockIndex, (err, data)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] MifareClassicTag12 transferToBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] MifareClassicTag12 transferToBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] MifareClassicTag12 transferToBlock2 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] MifareClassicTag12 transferToBlock2 data: " + data + "json10:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Number')
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag12 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1300
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1300
         * @tc.desc   Test restoreFromBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1300', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                await MifareClassicTag.restoreFromBlock(blockIndex).then((data) => {
                    console.info("[NFC_test] MifareClassicTag13 restoreFromBlock1 data: " + data + "json11:" + JSON.stringify(data));
                    expect(data).assertInstanceOf('Number')
                    done();
                }).catch((err)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] MifareClassicTag13 restoreFromBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] MifareClassicTag13 restoreFromBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] MifareClassicTag13 restoreFromBlock1 err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] MifareClassicTag13 restoreFromBlock2 data: " + data + "json12:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Array')
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag13 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1400
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1400
         * @tc.desc   Test restoreFromBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1400', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                MifareClassicTag.restoreFromBlock(blockIndex, (err, data)=> {
                    if (err.code == 201) {
                        console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 err: " + err + err.code);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 err: " + err + err.code);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 err: " + err + err.code);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 data: " + data + "json12:" + JSON.stringify(data));
                        expect().assertFail();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag14 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1500
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1500
         * @tc.desc   Test getSectorCount api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1500', Level.LEVEL0, function ()  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try{
                    let sectorCount = MifareClassicTag.getSectorCount();
                    console.info("[NFC_test] MifareClassicTag15 sectorCount: " + sectorCount);
                    expect(sectorCount).assertInstanceOf('Number')
                } catch (error) {
                    console.info('[NFC_test] MifareClassicTag15 sectorCount error' + error)
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag15 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1600
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1600
         * @tc.desc   Test getBlockCountInSector api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1600', Level.LEVEL0, function ()  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {  
                try{
                    let sectorIndex = 1;
                    let blockCountInSector = MifareClassicTag.getBlockCountInSector(sectorIndex);
                    console.info("[NFC_test] MifareClassicTag16 blockCountInSector: " + blockCountInSector);
                    expect(blockCountInSector).assertInstanceOf('Number')
                } catch (error) {
                    console.info('[NFC_test] MifareClassicTag16 blockCountInSector error' + error)
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag16 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1700
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1700
         * @tc.desc   Test getType api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1700', Level.LEVEL0, function ()  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try{
                    let getType = MifareClassicTag.getType();
                    console.info("[NFC_test] MifareClassicTag17 getType: " + getType);
                    expect(getType >= -1).assertTrue();
                } catch (error) {
                    console.info('[NFC_test] MifareClassicTag17 getType error' + error)
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag17 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1800
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1800
         * @tc.desc   Test getTagSize api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1800', Level.LEVEL0, function ()  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try{
                    let tagSize = MifareClassicTag.getTagSize();
                    console.info("[NFC_test] MifareClassicTag18 tagSize: " + tagSize);
                    expect(tagSize).assertInstanceOf('Number')
                } catch (error) {
                    console.info('[NFC_test] MifareClassicTag18 tagSize error' + error)
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag18 = null & = undefined: ");
                expect().assertFail();
            }
        }) 

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1900
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1900
         * @tc.desc   Test isEmulatedTag api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1900', Level.LEVEL0, function ()  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try{
                    let isEmulatedTag = MifareClassicTag.isEmulatedTag();
                    if (isEmulatedTag == true) {
                        console.info("[NFC_test] MifareClassicTag19 isEmulatedTag: " + isEmulatedTag);
                        expect(isEmulatedTag).assertTrue();
                    } else {
                        console.info("[NFC_test] MifareClassicTag19 isEmulatedTag: " + isEmulatedTag);
                        expect(isEmulatedTag).assertFalse();
                    }
                } catch (error) {
                    console.info('[NFC_test] MifareClassicTag19 isEmulatedTag error' + error)
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag19 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_2000
         * @tc.number SUB_Communication_NFC_mifareClassic_js_2000
         * @tc.desc   Test getBlockIndex api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_2000', Level.LEVEL0, function ()  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try{
                    let sectorIndex = 1; 
                    let blockIndex = MifareClassicTag.getBlockIndex(sectorIndex);
                    console.info("[NFC_test] MifareClassicTag20 blockIndex: " + blockIndex);
                    expect(blockIndex >= 0).assertTrue();
                } catch (error) {
                    console.info('[NFC_test] MifareClassicTag20 blockIndex error' + error)
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag20 = null & = undefined: ");
                expect().assertFail();
            }
        })         

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_2100
         * @tc.number SUB_Communication_NFC_mifareClassic_js_2100
         * @tc.desc   Test getSectorIndex api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_2100', Level.LEVEL0, function ()  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try{
                    let blockIndex = 1; 
                    let sectorIndex = MifareClassicTag.getSectorIndex(blockIndex);
                    console.info("[NFC_test] mifareClassic21 sectorIndex: " + sectorIndex);
                    expect(sectorIndex >= 0).assertTrue();
                } catch (error) {
                    console.info('[NFC_test] mifareClassic21 sectorIndex error' + error)
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag21 = null & = undefined: ");
                expect().assertFail();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}



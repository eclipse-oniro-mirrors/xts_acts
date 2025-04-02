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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

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
                console.info('beforeAll mifareClassic error' + error)
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
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0100
         * @tc.name testauthenticateSector
         * @tc.desc Test authenticateSector api by callback.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0100', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let sectorIndex = 1; 
                let key = [0x04, 0x05];  
                await MifareClassicTag.authenticateSector(sectorIndex, key, true).then((data) => {
                    console.info("[NFC_test] MifareClassicTag1 authenticateSector1 data: " + data + "json1:" + JSON.stringify(data));
                    expect(data != 0).assertTrue();
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err);
                    expect(true).assertTrue();
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag1 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0200
         * @tc.name testauthenticateSector
         * @tc.desc Test authenticateSector api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0200', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let sectorIndex = 1; 
                let key = [0x04, 0x05];  
                MifareClassicTag.authenticateSector(sectorIndex, key, true, (err, data)=> {
                    if (err) {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 err: " + err);
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 data: " + data + "json2:" + JSON.stringify(data));
                        expect(data != 0).assertTrue();
                        done();
                    }
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0300
         * @tc.name testreadSingleBlock
         * @tc.desc Test readSingleBlock api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0300', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                await MifareClassicTag.readSingleBlock(blockIndex).then((data) => {
                    console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 data: " + data + "json3:" + JSON.stringify(data));
                    expect(data).assertInstanceOf('Array')
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 err: " + err);
                    expect(true).assertTrue();
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0400
         * @tc.name testreadSingleBlock
         * @tc.desc Test readSingleBlock api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0400', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                MifareClassicTag.readSingleBlock(blockIndex, (err, data)=> {
                    if (err) {
                        console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 err: " + err);
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 data: " + data+ "json4:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Array')
                        done();
                    }
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0500
         * @tc.name testwriteSingleBlock
         * @tc.desc Test writeSingleBlock api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0500', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1;
                let rawData = [0x0a, 0x14]; 
                await MifareClassicTag.writeSingleBlock(blockIndex, rawData).then((data) => {
                    console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 data: " + data + "json5:" + JSON.stringify(data));
                    expect(data).assertInstanceOf('Number')
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                    expect(true).assertTrue();
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag5 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0600
         * @tc.name testwriteSingleBlock
         * @tc.desc Test writeSingleBlock api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0600', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let rawData = [0x0a, 0x14]; 
                MifareClassicTag.writeSingleBlock(blockIndex, rawData, (err, data)=> {
                    if (err) {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 err: " + err);
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 data: " + data + "json6:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Number')
                        done();
                    }
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag6 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0700
         * @tc.name testincrementBlock
         * @tc.desc Test incrementBlock api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0700', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let value = 0x20;
                await MifareClassicTag.incrementBlock(blockIndex, value).then((data) => {
                    console.info("[NFC_test] MifareClassicTag7 incrementBlock1 data: " + data );
                    expect(data).assertInstanceOf('Number')
                }).catch((err)=> {
                    console.info("[NFC_test] MifareClassicTag7 incrementBlock1 err: " + err);
                    expect(true).assertEqual(true);
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
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0800
         * @tc.name testincrementBlock
         * @tc.desc Test incrementBlock api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */

        it('SUB_Communication_NFC_mifareClassic_js_0800', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let value = 0x20;
                MifareClassicTag.incrementBlock(blockIndex, value, (err, data)=> {
                    if (err) {
                        console.info("[NFC_test] mifareClassic8 incrementBlock2 err: " + err);
                        expect(true).assertEqual(true);
                    } else {
                        console.info("[NFC_test] mifareClassic8 incrementBlock2 data: " + data + "json8:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Number')
                    }
                });
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag8 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0900
         * @tc.name testdecrementBlock
         * @tc.desc Test decrementBlock api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0900', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let value = 0x20;
                await MifareClassicTag.decrementBlock(blockIndex, value).then((data) => {
                    console.info("[NFC_test] MifareClassicTag9 decrementBlock1 data: " + data + "json9:" + JSON.stringify(data));
                    expect(data).assertInstanceOf('Number')
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test] MifareClassicTag9 decrementBlock1 err: " + err);
                    expect(true).assertTrue();
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag9 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1000
         * @tc.name testdecrementBlock
         * @tc.desc Test decrementBlock api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_1000', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let value = 0x20;
                MifareClassicTag.decrementBlock(blockIndex, value, (err, data)=> {
                    if (err) {
                        console.info("[NFC_test] MifareClassicTag10 decrementBlock2 err: " + err);
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("[NFC_test] MifareClassicTag10 decrementBlock2 data: " + data + "json10:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Number')
                        done();
                    }
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag10 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1100
         * @tc.name testtransferToBlock
         * @tc.desc Test transferToBlock api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */

        it('SUB_Communication_NFC_mifareClassic_js_1100', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                await MifareClassicTag.transferToBlock(blockIndex).then((data) => {
                    console.info("[NFC_test] mifareClassic11 transferToBlock1 data: " + data );
                    expect(data).assertInstanceOf('Number')
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test] mifareClassic11 transferToBlock1 err: " + err);
                    expect(true).assertTrue();
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag11 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1200
         * @tc.name testtransferToBlock
         * @tc.desc Test transferToBlock api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_1200', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                MifareClassicTag.transferToBlock(blockIndex, (err, data)=> {
                    if (err) {
                        console.info("[NFC_test] MifareClassicTag12 transferToBlock2 err: " + err);
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("[NFC_test] MifareClassicTag12 transferToBlock2 data: " + data + "json10:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Number')
                        done();
                    }
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag12 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1300
         * @tc.name testrestoreFromBlock
         * @tc.desc Test restoreFromBlock api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_1300', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                await MifareClassicTag.restoreFromBlock(blockIndex).then((data) => {
                    console.info("[NFC_test] MifareClassicTag13 restoreFromBlock1 data: " + data + "json11:" + JSON.stringify(data));
                    expect(data).assertInstanceOf('Number')
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test] MifareClassicTag13 restoreFromBlock1 err: " + err);
                    expect(true).assertTrue();
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag13 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1400
         * @tc.name testrestoreFromBlock
         * @tc.desc Test restoreFromBlock api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_1400', 0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                MifareClassicTag.restoreFromBlock(blockIndex, (err, data)=> {
                    if (err) {
                        console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 err: " + err);
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 data: " + data + "json12:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Number')
                        done();
                    }
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]MifareClassicTag14 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1500
         * @tc.name testgetSectorCount
         * @tc.desc Test getSectorCount api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_1500', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1600
         * @tc.name testgetBlockCountInSector
         * @tc.desc Test getBlockCountInSector api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_1600', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1700
         * @tc.name testgetType
         * @tc.desc Test getType api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_1700', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1800
         * @tc.name testgetTagSize
         * @tc.desc Test getTagSize api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_1800', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1900
         * @tc.name testisEmulatedTag
         * @tc.desc Test isEmulatedTag api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_1900', 0, function ()  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try{
                    let isEmulatedTag = MifareClassicTag.isEmulatedTag();
                    console.info("[NFC_test] MifareClassicTag19 isEmulatedTag: " + isEmulatedTag);
                    expect(false).assertEqual(isEmulatedTag);
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
         * @tc.number SUB_Communication_NFC_mifareClassic_js_2000
         * @tc.name testgetBlockIndex
         * @tc.desc Test getBlockIndex api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_2000', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_mifareClassic_js_2100
         * @tc.name testgetSectorIndex
         * @tc.desc Test getSectorIndex api.
         * @tc.size MEDIUM
         * @ since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_2100', 0, function ()  {
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



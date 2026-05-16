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
let MifareClassicTag ;
export default function MifareClassicErrorTest() {
    describe('MifareClassicErrorTest', function () {
        beforeAll(function () {
            console.info('beforeAll called')
        })
        beforeEach(function() {
            console.info('beforeEach called')
            try{
                MifareClassicTag = tag.getMifareClassic(mifareclassicTaginfo);
            }catch(error){
                if (error.code == 3100201) {
                    expect(error.code).assertEqual(3100201);
                    console.info('beforeAll mifareClassic error' + error.code + error);
                } else {
                    expect().assertFail();
                    console.info('beforeAll mifareClassic Fail');
                }
            }
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
         * @tc.desc   Test authenticateSector api by callback. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_0100', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let sectorIndex = 1; 
                let key = [0x04, 0x05];  
                (async () => {
                    try {
                        let result = await MifareClassicTag.authenticateSector('test', 'test', true);
                        console.info("[NFC_test]MifareClassic1 authenticateSector data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]MifareClassic1 authenticateSector errorcode: " + error.code);
                        expect(401).assertEqual(error.code);
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag1 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0200
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0200
         * @tc.desc   Test authenticateSector api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_0200', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let sectorIndex = 1; 
                let key = [0x04, 0x05];  
                try {
                    MifareClassicTag.authenticateSector('test', 'test', true, (err, data)=> {
                        if (err) {
                            console.info("[NFC_test]mifareClassic2 authenticateSector errcode: " + err);
                            expect(true).assertEqual(true);
                        } else {
                            console.info("[NFC_test]mifareClassic2 authenticateSector data: " + data + "json2:" + JSON.stringify(data));
                            expect(data).assertTrue();
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]mifareClassic2 authenticateSector errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag2 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0300
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0300
         * @tc.desc   Test readSingleBlock api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_0300', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                (async () => {
                    try {
                        let result = await MifareClassicTag.readSingleBlock('test');
                        if (result.length > 0) {
                            expect(result.length > 0).assertTrue();
                        } else {
                            expect(result).assertDeepEquals([]);
                        }
                        console.info("[NFC_test]mifareClassic3 readSingleBlock data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]mifareClassic3 readSingleBlock errorcode: " + error.code);
                        expect(401).assertEqual(error.code);
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]mifareClassic3 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0400
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0400
         * @tc.desc   Test readSingleBlock api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_0400', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                try {
                    MifareClassicTag.readSingleBlock('test', (err, data)=> {
                        if (err) {
                            console.info("[NFC_test]mifareClassic4 readSingleBlock errcode: " + err);
                            expect(true).assertEqual(true);
                        } else {
                            if (data.length > 0) {
                                expect(data.length > 0).assertTrue();
                            } else {
                                expect(data).assertDeepEquals([]);
                            }
                            console.info("[NFC_test]mifareClassic4 readSingleBlock data: " + data+ "json4:" + JSON.stringify(data));
                            expect(data).assertInstanceOf('Array')
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]mifareClassic4 readSingleBlock errorcode: " + error.code);
                    expect(401).assertEqual(error.code)
                }
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag4 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0500
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0500
         * @tc.desc   Test writeSingleBlock api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_0500', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1;
                let rawData = [0x0a, 0x14]; 
                (async () => {
                    try {
                        let result = await MifareClassicTag.writeSingleBlock('test', rawData);
                        console.info("[NFC_test]mifareClassic5 writeSingleBlock data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]mifareClassic5 writeSingleBlock errorcode: " + error.code);
                        expect(401).assertEqual(error.code)
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag5 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0600
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0600
         * @tc.desc   Test writeSingleBlock api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_0600', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let rawData = [0x0a, 0x14]; 
                try {
                    MifareClassicTag.writeSingleBlock('test', rawData, (err, data)=> {
                        if (err) {
                            console.info("[NFC_test]mifareClassic6 writeSingleBlock errcode: " + err);
                            expect(true).assertEqual(true);
                        } else {
                            console.info("[NFC_test]mifareClassic6 writeSingleBlock data: " + data + "json6:" + JSON.stringify(data));
                            expect(data).assertTrue();
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]mifareClassic6  errorcode: " + error.code);
                    expect(401).assertEqual(error.code)
                }
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag6 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0700
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0700
         * @tc.desc   Test incrementBlock api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_0700', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let value = 0x20;
                (async () => {
                    try {
                        let result = await MifareClassicTag.incrementBlock('test', 'test');
                        console.info("[NFC_test]mifareClassic7 incrementBlock data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]mifareClassic7 incrementBlock errorcode: " + error.code);
                        expect(401).assertEqual(error.code)
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag7 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0800
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0800
         * @tc.desc   Test incrementBlock api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_0800', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let value = 0x20;            
                try {
                    MifareClassicTag.incrementBlock(blockIndex, 'test', (err, data)=> {
                        if (err) {
                            console.info("[NFC_test]mifareClassic8 incrementBlock errcode: " + err);
                            expect(true).assertEqual(true);
                        } else {
                            console.info("[NFC_test]mifareClassic8 incrementBlock data: " + data );
                            expect(data).assertInstanceOf('Number')
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]mifareClassic8 incrementBlock2 errorcode:" + error.code);
                    expect(401).assertEqual(error.code)
                }
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag8 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0900
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0900
         * @tc.desc   Test decrementBlock api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_0900', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let value = 0x20;
                (async () => {
                    try {
                        let result = await MifareClassicTag.decrementBlock('test', value);
                        console.info("[NFC_test]mifareClassic9 decrementBlock data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]mifareClassic9 decrementBlock errorcode: " + error.code);
                        expect(401).assertEqual(error.code)
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag9 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1000
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1000
         * @tc.desc   Test decrementBlock api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_1000', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let value = 0x20;            
                try {
                    MifareClassicTag.decrementBlock('test', value, (err, data)=> {
                        if (err) {
                            console.info("[NFC_test]mifareClassic10 decrementBlock errcode: " + err);
                            expect(true).assertEqual(true);
                        } else {
                            console.info("[NFC_test]mifareClassic10 decrementBlock data: " + data + "json10:" + JSON.stringify(data));
                            expect(data).assertInstanceOf('Number')
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]mifareClassic10 decrementBlock errorcode: " + error.code);
                    expect(401).assertEqual(error.code)
                }
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag10 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1100
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1100
         * @tc.desc   Test transferToBlock api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_1100', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                (async () => {
                    try {
                        let result = await MifareClassicTag.transferToBlock('test');
                        console.info("[NFC_test]mifareClassic11 transferToBlock data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]mifareClassic11 transferToBlock errorcode: " + error.code);
                        expect(401).assertEqual(error.code)
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag11 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1200
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1200
         * @tc.desc   Test transferToBlock api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_1200', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1;             
                try {
                    MifareClassicTag.transferToBlock('test', (err, data)=> {
                        if (err) {
                            console.info("[NFC_test]mifareClassic12 transferToBlock errcode: " + err);
                            expect(true).assertEqual(true);
                        } else {
                            console.info("[NFC_test]mifareClassic12 transferToBlock data: " + data + "json10:" + JSON.stringify(data));
                            expect(data).assertInstanceOf('Number')
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]mifareClassic12 transferToBlock errorcode: " + error.code);
                    expect(401).assertEqual(error.code)
                }
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag12 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1300
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1300
         * @tc.desc   Test restoreFromBlock api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_1300', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                (async () => {
                    try {
                        let result = await MifareClassicTag.restoreFromBlock('test');
                        console.info("[NFC_test]mifareClassic13 restoreFromBlock data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]mifareClassic13 restoreFromBlock errorcode: " + error.code);
                        expect(401).assertEqual(error.code)
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag13 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1400
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1400
         * @tc.desc   Test restoreFromBlock api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_1400', Level.LEVEL1, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1;             
                try {
                    MifareClassicTag.restoreFromBlock('test', (err, data)=> {
                        if (err) {
                            console.info("[NFC_test]mifareClassic14 restoreFromBlock2 errcode: " + err);
                            expect(true).assertEqual(true);
                        } else {
                            console.info("[NFC_test]mifareClassic14 restoreFromBlock2 data: " + data + "json12:" + JSON.stringify(data));
                            expect(data).assertInstanceOf('Number')
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]mifareClassic14 restoreFromBlock2 errorcode: " + error.code);
                    expect(401).assertEqual(error.code)
                }
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]MifareClassicTag14 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1500
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1500
         * @tc.desc   Test getBlockCountInSector api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_1500', Level.LEVEL1, function ()  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    let sectorIndex = 1;
                    let blockCountInSector = MifareClassicTag.getBlockCountInSector('test');
                    console.info("[NFC_test]mifareClassic15 getBlockCountInSector: " + blockCountInSector);
                    expect(blockCountInSector).assertInstanceOf('Number')
                } catch (error) {
                    console.info("[NFC_test]mifareClassic15 getBlockCountInSector errorcode: " + error.code);
                    expect(401).assertEqual(error.code)
                }
            } else {
                console.info("[NFC_test]MifareClassicTag15 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1600
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1600
         * @tc.desc   Test getBlockIndex api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_1600', Level.LEVEL1, function ()  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    let sectorIndex = 1; 
                    let blockIndex = MifareClassicTag.getBlockIndex('test');
                    console.info("[NFC_test]mifareClassic16 getBlockIndex: " + blockIndex);
                    expect(true).assertTrue(blockIndex >= 0);
                } catch (error) {
                    console.info("[NFC_test]mifareClassic16 getBlockIndex errorcode: " + error.code);
                    expect(401).assertEqual(error.code)
                }
            } else {
                console.info("[NFC_test]MifareClassicTag16 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1700
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1700
         * @tc.desc   Test getSectorIndex api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_mifareClassic_js_1700', Level.LEVEL1, function ()  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    let blockIndex = 1; 
                    let sectorIndex = MifareClassicTag.getSectorIndex('test');
                    console.info("[NFC_test]mifareClassic17 getSectorIndex: " + sectorIndex);
                    expect(true).assertTrue(sectorIndex >= 0);
                } catch (error) {
                    console.info("[NFC_test]mifareClassic17 getSectorIndex errorcode: " + error.code);
                    expect(401).assertEqual(error.code)
                }
            } else {
                console.info("[NFC_test]MifareClassicTag17 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

         /**
          * @tc.name   SUB_Communication_NFC_mifareClassic_js_1800
          * @tc.number SUB_Communication_NFC_mifareClassic_js_1800
          * @tc.desc   Test getMifareClassic api. The error code is 401
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL1
          */
         it('SUB_Communication_NFC_mifareClassic_js_1800', Level.LEVEL1, function ()  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    let NFCMifareClassicTag = tag.getMifareClassic("test");
                    console.info("[NFC_test]mifareClassic18 getMifareClassic: " + NFCMifareClassicTag);
                    expect(true).assertTrue(NFCMifareClassicTag >= 0);
                } catch (error) {
                    if (error.code == 401) {
                        console.info("[NFC_test]mifareClassic18 getMifareClassic errorcode: " + error.code);
                        expect(401).assertEqual(error.code)
                    } else if (error.code == 3100201) {
                        console.info("[NFC_test]mifareClassic18 getMifareClassic errorcode: " + error.code);
                        expect(3100201).assertEqual(error.code)
                    } else {
                        console.info("[NFC_test]mifareClassic18 getMifareClassic failed " + error);
                        expect().assertFail();
                    }
                }
            } else {
                console.info("[NFC_test]MifareClassicTag18 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}


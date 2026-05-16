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
    TYPE_UNKNOWN : 0,
    TYPE_CLASSIC : 1,
    TYPE_PLUS : 2,
    TYPE_PRO : 3,
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

let mifareclassicTaginfo1 = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 8],
    "extrasData": [
        {
            "Sak": 0x10, "Atqa": "B000",
        },
        {
            
        },
    ],
    "tagRfDiscId": 1,
};

let mifareclassicTaginfo2 = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 8],
    "extrasData": [
        {
            "Sak": 0xB8, "Atqa": "B000",
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
                if (error.code === 3100201) {
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err + err.code);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err + err.code);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err + err.code);
                        expect(3100204).assertEqual(code);
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0101
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0101
         * @tc.desc   Test authenticateSector api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0101', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.authenticateSector(null, null, true).then((data) => {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 data: " + data + "json1:" + JSON.stringify(data));
                        expect(data != 0).assertTrue();
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err + err.code);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err + err.code);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag1 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0102
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0102
         * @tc.desc   Test authenticateSector api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0102', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.authenticateSector(undefined, undefined, true).then((data) => {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 data: " + data + "json1:" + JSON.stringify(data));
                        expect(data != 0).assertTrue();
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err + err.code);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err + err.code);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag1 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0103
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0103
         * @tc.desc   Test authenticateSector api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0103', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let sectorIndex = 1; 
                let key = [];
                try {
                    await MifareClassicTag.authenticateSector(sectorIndex, key, false).then((data) => {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 data: " + data + "json1:" + JSON.stringify(data));
                        expect(data != 0).assertTrue();
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err + err.code);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag1 authenticateSector1 err: " + err + err.code);
                        expect().assertFail();
                    }
                    done();
                }
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 err: " + err);
                        expect(3100204).assertEqual(code);
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0201
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0201
         * @tc.desc   Test authenticateSector api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0201', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function authenticateSector_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.authenticateSector(null, null, true, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag2 authenticateSector2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await authenticateSector_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag2 authenticateSector2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 err: " + err + err.code);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 err: " + err + err.code);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareClassicTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0202
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0202
         * @tc.desc   Test authenticateSector api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0202', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function authenticateSector_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.authenticateSector(undefined, undefined, true, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag2 authenticateSector2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await authenticateSector_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag2 authenticateSector2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 err: " + err + err.code);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 err: " + err + err.code);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareClassicTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0203
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0203
         * @tc.desc   Test authenticateSector api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0203', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let sectorIndex = 1; 
                let key = [];  
                function authenticateSector_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.authenticateSector(sectorIndex, key, false, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag2 authenticateSector2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await authenticateSector_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag2 authenticateSector2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag2 authenticateSector2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 err: " + err);
                        expect().assertFail();
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0301
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0301
         * @tc.desc   Test readSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0301', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.readSingleBlock(null).then((data) => {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 data: " + data + "json3:" + JSON.stringify(data));
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0302
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0302
         * @tc.desc   Test readSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0302', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.readSingleBlock(undefined).then((data) => {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 data: " + data + "json3:" + JSON.stringify(data));
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag3 readSingleBlock1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 err: " + err);
                        expect(3100204).assertEqual(code);
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0401
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0401
         * @tc.desc   Test readSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0401', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function readSingleBlock_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.readSingleBlock(null, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await readSingleBlock_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareClassicTag4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0402
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0402
         * @tc.desc   Test readSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0402', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function readSingleBlock_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.readSingleBlock(undefined, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await readSingleBlock_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag4 readSingleBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect().assertFail();
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0501
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0501
         * @tc.desc   Test writeSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0501', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.writeSingleBlock(null, null).then((data) => {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 data: " + data + "json5:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Number')
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag5 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0502
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0502
         * @tc.desc   Test writeSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0502', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.writeSingleBlock(undefined, undefined).then((data) => {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 data: " + data + "json5:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Number')
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag5 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0503
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0503
         * @tc.desc   Test writeSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0503', Level.LEVEL0, async function (done) {
            let array = [];
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.writeSingleBlock(undefined, array).then((data) => {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 data: " + data + "json5:" + JSON.stringify(data));
                        expect(data).assertInstanceOf('Number')
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag5 writeSingleBlock1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 err: " + err);
                        expect(3100204).assertEqual(code);
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0601
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0601
         * @tc.desc   Test writeSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0601', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function writeSingleBlock_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.writeSingleBlock(null, null, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await writeSingleBlock_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareClassicTag6 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0602
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0602
         * @tc.desc   Test writeSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0602', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function writeSingleBlock_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.writeSingleBlock(undefined, undefined, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await writeSingleBlock_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareClassicTag6 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0603
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0603
         * @tc.desc   Test writeSingleBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0603', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                let blockIndex = 1; 
                let rawData = []; 
                function writeSingleBlock_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.writeSingleBlock(blockIndex, rawData, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await writeSingleBlock_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag6 writeSingleBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 err: " + err);
                        expect().assertFail();
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0701
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0701
         * @tc.desc   Test incrementBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0701', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.incrementBlock(null, null).then((data) => {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 data: " + data);
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag7 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0702
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0702
         * @tc.desc   Test incrementBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0702', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.incrementBlock(undefined, undefined).then((data) => {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 data: " + data);
                        expect(data).assertInstanceOf('Number')
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag7 incrementBlock1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag5 = null & = undefined: ");
                expect().assertFail();
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] mifareClassic8 incrementBlock2 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] mifareClassic8 incrementBlock2 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] mifareClassic8 incrementBlock2 err: " + err);
                        expect(3100204).assertEqual(code);
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0801
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0801
         * @tc.desc   SUB_Communication_NFC_mifareClassic_js_0801
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0801', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function incrementBlock_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.incrementBlock(null, null, (err, data)=> {
                            if (err) {
                                reject(err);
                            } else {
                                console.info("[NFC_test] MifareClassic8 incrementBlock2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await incrementBlock_callback().then((data) => {
                    console.info("[NFC_test] MifareClassic8 incrementBlock2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassic8 incrementBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassic8 incrementBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareClassicTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0802
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0802
         * @tc.desc   SUB_Communication_NFC_mifareClassic_js_0802
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0802', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function incrementBlock_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.incrementBlock(undefined, undefined, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassic8 incrementBlock2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await incrementBlock_callback().then((data) => {
                    console.info("[NFC_test] MifareClassic8 incrementBlock2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassic8 incrementBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassic8 incrementBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareClassicTag2 = null & = undefined: ");
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 err: " + err);
                        expect().assertFail();
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0901
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0901
         * @tc.desc   Test decrementBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0901', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.decrementBlock(null, null).then((data) => {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 data: " + data);
                        expect(data).assertInstanceOf('Number')
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag9 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_0902
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0902
         * @tc.desc   Test decrementBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_0902', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.decrementBlock(undefined, undefined).then((data) => {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 data: " + data);
                        expect(data).assertInstanceOf('Number')
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag9 decrementBlock1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] MifareClassicTag10 decrementBlock2 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] MifareClassicTag10 decrementBlock2 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] MifareClassicTag10 decrementBlock2 err: " + err);
                        expect(3100204).assertEqual(code);
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1001
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1001
         * @tc.desc   Test decrementBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1001', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function decrementBlock_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.decrementBlock(null, null, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag10 decrementBlock2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await decrementBlock_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag10 decrementBlock2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag10 decrementBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag10 decrementBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareClassicTag10 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1002
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1002
         * @tc.desc   Test decrementBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1002', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function decrementBlock_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.decrementBlock(undefined, undefined, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag10 decrementBlock2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await decrementBlock_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag10 decrementBlock2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag10 decrementBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag10 decrementBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] mifareClassic11 transferToBlock1 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] mifareClassic11 transferToBlock1 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] mifareClassic11 transferToBlock1 err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test] mifareClassic11 transferToBlock1 err: " + err);
                        expect().assertFail();
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1101
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1101
         * @tc.desc   SUB_Communication_NFC_mifareClassic_js_1101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1101', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.transferToBlock(null).then((data) => {
                        console.info("[NFC_test] MifareClassic11 transferToBlock1 data: " + data);
                        expect(data).assertInstanceOf('Number')
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassic11 transferToBlock1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassic11 transferToBlock1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassic11 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1102
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1102
         * @tc.desc   SUB_Communication_NFC_mifareClassic_js_1102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1102', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.transferToBlock(undefined).then((data) => {
                        console.info("[NFC_test] MifareClassic11 transferToBlock1 data: " + data);
                        expect(data).assertInstanceOf('Number')
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassic11 transferToBlock1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassic11 transferToBlock1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassic11 = null & = undefined: ");
                expect().assertFail();
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] MifareClassicTag12 transferToBlock2 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] MifareClassicTag12 transferToBlock2 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] MifareClassicTag12 transferToBlock2 err: " + err);
                        expect(3100204).assertEqual(code);
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1201
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1201
         * @tc.desc   Test transferToBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1201', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function transferToBlock_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.transferToBlock(null, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag12 transferToBlock2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await transferToBlock_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag12 transferToBlock2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag12 transferToBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag12 transferToBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareClassicTag12 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1202
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1202
         * @tc.desc   Test transferToBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1202', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function transferToBlock_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.transferToBlock(undefined, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag12 transferToBlock2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await transferToBlock_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag12 transferToBlock2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag12 transferToBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag12 transferToBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] MifareClassicTag13 restoreFromBlock1 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] MifareClassicTag13 restoreFromBlock1 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] MifareClassicTag13 restoreFromBlock1 err: " + err);
                        expect(3100204).assertEqual(code);
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1301
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1301
         * @tc.desc   Test restoreFromBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1301', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.restoreFromBlock(null).then((data) => {
                        console.info("[NFC_test] MifareClassicTag13 restoreFromBlock2 data: " + data);
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag13 restoreFromBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag13 restoreFromBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifarMifareClassicTag13 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1302
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1302
         * @tc.desc   Test restoreFromBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1302', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try {
                    await MifareClassicTag.restoreFromBlock(undefined).then((data) => {
                        console.info("[NFC_test] MifareClassicTag13 restoreFromBlock2 data: " + data);
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag13 restoreFromBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag13 restoreFromBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifarMifareClassicTag13 = null & = undefined: ");
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 err: " + err + err.code);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 err: " + err + err.code);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 err: " + err + err.code);
                        expect(3100204).assertEqual(code);
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1401
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1401
         * @tc.desc   Test restoreFromBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1401', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function restoreFromBlock_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.restoreFromBlock(null, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await restoreFromBlock_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareClassicTag14 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1402
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1402
         * @tc.desc   Test restoreFromBlock api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1402', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                function restoreFromBlock_callback() {
                    return new Promise((resolve, reject) => {
                        MifareClassicTag.restoreFromBlock(undefined, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await restoreFromBlock_callback().then((data) => {
                    console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 done ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag14 restoreFromBlock2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1601
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1601
         * @tc.desc   Test getBlockCountInSector api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1601', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try{
                    let blockCountInSector = MifareClassicTag.getBlockCountInSector(null);
                    console.info("[NFC_test] MifareClassicTag16 blockCountInSector: " + blockCountInSector);
                    expect(blockCountInSector).assertInstanceOf('Number')
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag16 blockCountInSector err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag16 blockCountInSector err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag16 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1602
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1602
         * @tc.desc   Test getBlockCountInSector api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1602', Level.LEVEL0, async function (done) {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try{
                    let blockCountInSector = MifareClassicTag.getBlockCountInSector(undefined);
                    console.info("[NFC_test] MifareClassicTag16 blockCountInSector: " + blockCountInSector);
                    expect(blockCountInSector).assertInstanceOf('Number')
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag16 blockCountInSector err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag16 blockCountInSector err: " + err);
                        expect().assertFail();
                    }
                    done();
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
                    expect(getType == MifareClassicType.TYPE_CLASSIC).assertTrue();
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1701
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1701
         * @tc.desc   Test getType api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1701', Level.LEVEL0, function ()  {
            let MifareClassicTag1 = tag.getMifareClassic(mifareclassicTaginfo1);
            if (MifareClassicTag1 != null && MifareClassicTag1 != undefined) {
                try{
                    let getType = MifareClassicTag1.getType();
                    console.info("[NFC_test] MifareClassicTag17 getType: " + getType);
                    expect(getType == MifareClassicType.TYPE_PLUS).assertTrue();
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_1702
         * @tc.number SUB_Communication_NFC_mifareClassic_js_1702
         * @tc.desc   Test getType api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_1702', Level.LEVEL0, function ()  {
            let MifareClassicTag2 = tag.getMifareClassic(mifareclassicTaginfo2);
            if (MifareClassicTag2 != null && MifareClassicTag2 != undefined) {
                try{
                    let getType = MifareClassicTag2.getType();
                    console.info("[NFC_test] MifareClassicTag17 getType: " + getType);
                    expect(getType == MifareClassicType.TYPE_PRO).assertTrue();
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
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_2001
         * @tc.number SUB_Communication_NFC_mifareClassic_js_2001
         * @tc.desc   Test getBlockIndex api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_2001', Level.LEVEL0, function (done)  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try{
                    let blockIndex = MifareClassicTag.getBlockIndex(null);
                    console.info("[NFC_test] MifareClassicTag20 blockIndex: " + blockIndex);
                    expect(blockIndex >= 0).assertTrue();
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag20 blockIndex err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag20 blockIndex err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassicTag20 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_2002
         * @tc.number SUB_Communication_NFC_mifareClassic_js_2002
         * @tc.desc   Test getBlockIndex api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_2002', Level.LEVEL0, function (done)  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try{
                    let blockIndex = MifareClassicTag.getBlockIndex(undefined);
                    console.info("[NFC_test] MifareClassicTag20 blockIndex: " + blockIndex);
                    expect(blockIndex >= 0).assertTrue();
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag20 blockIndex err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag20 blockIndex err: " + err);
                        expect().assertFail();
                    }
                    done();
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

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_2101
         * @tc.number SUB_Communication_NFC_mifareClassic_js_2101
         * @tc.desc   Test getSectorIndex api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_2101', Level.LEVEL0, function (done)  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try{
                    let sectorIndex = MifareClassicTag.getSectorIndex(null);
                    console.info("[NFC_test] MifareClassic21 sectorIndex: " + sectorIndex);
                    expect(sectorIndex >= 0).assertTrue();
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassic21 sectorIndex err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassic21 sectorIndex err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassic21 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareClassic_js_2102
         * @tc.number SUB_Communication_NFC_mifareClassic_js_2102
         * @tc.desc   Test getSectorIndex api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareClassic_js_2102', Level.LEVEL0, function (done)  {
            if (MifareClassicTag != null && MifareClassicTag != undefined) {
                try{
                    let sectorIndex = MifareClassicTag.getSectorIndex(undefined);
                    console.info("[NFC_test] MifareClassic21 sectorIndex: " + sectorIndex);
                    expect(sectorIndex >= 0).assertTrue();
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassic21 sectorIndex err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassic21 sectorIndex err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]MifareClassic21 = null & = undefined: ");
                expect().assertFail();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}



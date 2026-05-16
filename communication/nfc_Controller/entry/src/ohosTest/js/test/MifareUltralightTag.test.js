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
            "MifareUltralightC": "true",
        },
    ],
    "tagRfDiscId": 1,
};

let MifareUltralightType = {
    TYPE_UNKOWN : 0,
    TYPE_ULTRALIGHT : 1,
    TYPE_ULTRALIGHT_C : 2,
}

let mifareUltralightTaginfo1 = {
    "uid": [0x04],
    "technology": [1, 9],
    "extrasData": [
        {
            "Sak": 0x00, "Atqa": "B000",
        },
        {
            "MifareUltralightC": "true",
        },
    ],
    "tagRfDiscId": 1,
};

let MifareUltralightTag = null;

export default function nfcMifareUltralightTag() {
    describe('nfcMifareUltralightTag', function () {
        beforeAll(function () {
            console.info('rbeforeAll called')
        })
        beforeEach(function() {
            try {
                MifareUltralightTag = tag.getMifareUltralight(mifareUltralightTaginfo);
                console.info(' mifareUltralight is' + MifareUltralightTag)
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
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0100
         * @tc.number SUB_Communication_NFC_mifareUltralight_0100
         * @tc.desc   Test readMultiplePages api by promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0100', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                let pageIndex = 1;
                await MifareUltralightTag.readMultiplePages(pageIndex).then((data) => {
                    console.info("[NFC_test] mifareUltralight1 readMultiplePages1 data: " + data + "json1:" + JSON.stringify(data));
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
                        console.info("[NFC_test] mifareUltralight1 readMultiplePages1 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] mifareUltralight1 readMultiplePages1 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] mifareUltralight1 readMultiplePages1 err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test] mifareUltralight1 readMultiplePages1 err: " + err);
                        expect().assertFail();
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
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0101
         * @tc.number SUB_Communication_NFC_mifareUltralight_0101
         * @tc.desc   Test readMultiplePages api by promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0101', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                try {
                    await MifareUltralightTag.readMultiplePages(null).then((data) => {
                        console.info("[NFC_test] MifareClassicTag1 readMultiplePages1 data: " + data + "json1:" + JSON.stringify(data));
                        expect(data != 0).assertTrue();
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag1 readMultiplePages1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag1 readMultiplePages1 err: " + err);
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
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0102
         * @tc.number SUB_Communication_NFC_mifareUltralight_0102
         * @tc.desc   Test readMultiplePages api by promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0102', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                try {
                    await MifareUltralightTag.readMultiplePages(undefined).then((data) => {
                        console.info("[NFC_test] MifareClassicTag1 readMultiplePages1 data: " + data + "json1:" + JSON.stringify(data));
                        expect(data != 0).assertTrue();
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareClassicTag1 readMultiplePages1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareClassicTag1 readMultiplePages1 err: " + err);
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
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0200
         * @tc.number SUB_Communication_NFC_mifareUltralight_0200
         * @tc.desc   Test readMultiplePages api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0200', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                let pageIndex = 1;
                MifareUltralightTag.readMultiplePages(pageIndex, (err, data)=> {
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] mifareUltralight2 readMultiplePages2 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] mifareUltralight2 readMultiplePages2 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] mifareUltralight2 readMultiplePages2 err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test] mifareUltralight2 readMultiplePages2 data: " + data + "json2:" + JSON.stringify(data));
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
                console.info("[NFC_test]mifareUltralight2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0201
         * @tc.number SUB_Communication_NFC_mifareUltralight_0201
         * @tc.desc   Test readMultiplePages api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0201', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                function readMultiplePages_callback() {
                    return new Promise((resolve, reject) => {
                        MifareUltralightTag.readMultiplePages(null, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareUltralight2 readMultiplePages data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await readMultiplePages_callback().then((data) => {
                    console.info("[NFC_test] MifareUltralight2 readMultiplePages done: ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareUltralight2 readMultiplePages2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareUltralight2 readMultiplePages2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareUltralight2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0202
         * @tc.number SUB_Communication_NFC_mifareUltralight_0202
         * @tc.desc   Test readMultiplePages api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0202', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                function readMultiplePages_callback() {
                    return new Promise((resolve, reject) => {
                        MifareUltralightTag.readMultiplePages(undefined, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] MifareUltralight2 readMultiplePages data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await readMultiplePages_callback().then((data) => {
                    console.info("[NFC_test] MifareUltralight2 readMultiplePages2 done ");
                })
                .catch (err => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareUltralight2 readMultiplePages2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareUltralight2 readMultiplePages2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareUltralight2 = null & = undefined: ");
                expect().assertFail();
            }
        })
        
        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0300
         * @tc.number SUB_Communication_NFC_mifareUltralight_0300
         * @tc.desc   Test writeSinglePage api by promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
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
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] mifareUltralight3 writeSinglePages1 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] mifareUltralight3 writeSinglePages1 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] mifareUltralight3 writeSinglePages1 err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test] mifareUltralight3 writeSinglePages1 err: " + err);
                        expect().assertFail();
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
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0301
         * @tc.number SUB_Communication_NFC_mifareUltralight_0301
         * @tc.desc   Test writeSinglePage api by promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0301', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                try {
                    await MifareUltralightTag.writeSinglePage(null, null).then((data) => {
                        console.info("[NFC_test] MifareUltralight3 writeSinglePages1 data: " + data + "json1:" + JSON.stringify(data));
                        expect(data >= 0).assertTrue();
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareUltralight3 writeSinglePages1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareUltralight3 writeSinglePages1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]mifareUltralight3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0302
         * @tc.number SUB_Communication_NFC_mifareUltralight_0302
         * @tc.desc   Test writeSinglePage api by promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0302', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                try {
                    await MifareUltralightTag.writeSinglePage(undefined, undefined).then((data) => {
                        console.info("[NFC_test] MifareUltralight3 writeSinglePages1 data: " + data + "json1:" + JSON.stringify(data));
                        expect(data != 0).assertTrue();
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareUltralight3 writeSinglePages1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareUltralight3 writeSinglePages1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]mifareUltralight3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0303
         * @tc.number SUB_Communication_NFC_mifareUltralight_0303
         * @tc.desc   Test writeSinglePage api by promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0303', Level.LEVEL0, async function (done) {
            let array = [];
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                try {
                    await MifareUltralightTag.writeSinglePage(null, array).then((data) => {
                        console.info("[NFC_test] MifareUltralight3 writeSinglePages1 data: " + data + "json1:" + JSON.stringify(data));
                        expect(data != 0).assertTrue();
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareUltralight3 writeSinglePages1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareUltralight3 writeSinglePages1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]mifareUltralight3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0400
         * @tc.number SUB_Communication_NFC_mifareUltralight_0400
         * @tc.desc   Test writeSinglePage api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0400', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                let pageIndex = 1;
                let rawData = [0x01, 0x02];
                MifareUltralightTag.writeSinglePage(pageIndex, rawData, (err, data)=> {
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test] mifareUltralight4 writeSinglePages2 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test] mifareUltralight4 writeSinglePages2 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test] mifareUltralight4 writeSinglePages2 err: " + err);
                        expect(3100204).assertEqual(code);
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
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0401
         * @tc.number SUB_Communication_NFC_mifareUltralight_0401
         * @tc.desc   Test writeSinglePage api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0401', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                function writeSinglePage_callback() {
                    return new Promise((resolve, reject) => {
                        MifareUltralightTag.writeSinglePage(null, null, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] mifareUltralight4 writeSinglePages2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await writeSinglePage_callback().then((data) => {
                    console.info("[NFC_test] MifareUltralight4 writeSinglePages2 done: ");
                })
                .catch (err => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareUltralight4 writeSinglePages2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareUltralight4 writeSinglePages2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareUltralight4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0402
         * @tc.number SUB_Communication_NFC_mifareUltralight_0402
         * @tc.desc   Test writeSinglePage api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0402', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                function writeSinglePage_callback() {
                    return new Promise((resolve, reject) => {
                        MifareUltralightTag.writeSinglePage(undefined, undefined, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] mifareUltralight4 writeSinglePages2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await writeSinglePage_callback().then((data) => {
                    console.info("[NFC_test] MifareUltralight4 writeSinglePages2 done: ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareUltralight4 writeSinglePages2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] mifareUltralight4 writeSinglePages2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareUltralight4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0403
         * @tc.number SUB_Communication_NFC_mifareUltralight_0403
         * @tc.desc   Test writeSinglePage api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0403', Level.LEVEL0, async function (done) {
            if (MifareUltralightTag != null && MifareUltralightTag != undefined) {
                let pageIndex = 1;
                let rawData = [];
                function writeSinglePage_callback() {
                    return new Promise((resolve, reject) => {
                        MifareUltralightTag.writeSinglePage(pageIndex, rawData, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] mifareUltralight4 writeSinglePages2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await writeSinglePage_callback().then((data) => {
                    console.info("[NFC_test] MifareUltralight4 writeSinglePages2 done: ");
                })
                .catch (err => {
                    if (err.code === 401) {
                        console.info("[NFC_test] MifareUltralight4 writeSinglePages2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] MifareUltralight4 writeSinglePages2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]MifareUltralight4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0500
         * @tc.number SUB_Communication_NFC_mifareUltralight_0500
         * @tc.desc   Gets the type of Mifare Ultralight label
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
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

        /**
         * @tc.name   SUB_Communication_NFC_mifareUltralight_0501
         * @tc.number SUB_Communication_NFC_mifareUltralight_0501
         * @tc.desc   Gets the type of Mifare Ultralight label
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_mifareUltralight_0501', Level.LEVEL0, function ()  {
            let MifareUltralightTag1 = tag.getMifareUltralight(mifareUltralightTaginfo1);
            if (MifareUltralightTag1 != null && MifareUltralightTag1 != undefined) {
                let getType = MifareUltralightTag1.getType();
                console.info("[NFC_test] mifareUltralight5 getType: " + getType);
                expect(getType).assertEqual(MifareUltralightType.TYPE_ULTRALIGHT);
            } else {
                console.info("[NFC_test]mifareUltralight5 = null & = undefined: ");
                expect().assertFail();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })	

}

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
import cardEmulation from '@ohos.nfc.cardEmulation';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

let NdefRecord = {
    NFC_A : 1,
    NFC_B : 2,
    ISO_DEP	: 3,
    NFC_F : 4,
    NFC_V : 5,
    NDEF : 6,
    NDEF_FORMATABLE : 7,
    MIFARE_CLASSIC : 8,
    MIFARE_ULTRALIGHT : 9,
};

let NfcForumType = {
    NFC_FORUM_TYPE_1 : 1,
    NFC_FORUM_TYPE_2 : 2,
    NFC_FORUM_TYPE_3 : 3,
    NFC_FORUM_TYPE_4 : 4,
    MIFARE_CLASSIC : 101,
};

let TnfType= {
    TNF_EMPTY : 0x0,
    TNF_WELL_KNOWN : 0x01,
    TNF_MEDIA : 0x02,
    TNF_ABSOLUTE_URI : 0x03,
    TNF_EXT_APP : 0x04,
    TNF_UNKNOWN : 0x05,
    TNF_UNCHANGED : 0x06,
};

let NDEFRecordRTD= {
    RTD_TEXT : 0x54,
    RTD_URI : 0x55,
}

let NDEFTaginfo = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 6],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {
            "NdefMsg": "D4010354787473", "NdefForumType": 1, "NdefTagLength":255, "NdefTagMode": 1,
        },
    ],
    "tagRfDiscId": 1,
};

let NDEFTaginfo1 = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 6],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {
            "NdefMsg": "D4010354787473", "NdefForumType": 2, "NdefTagLength":255, "NdefTagMode": 1,
        },
    ],
    "tagRfDiscId": 1,
};

let NDEFTaginfo2 = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 6],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {
            "NdefMsg": "D4010354787473", "NdefForumType": 3, "NdefTagLength":255, "NdefTagMode": 1,
        },
    ],
    "tagRfDiscId": 1,
};

let NDEFTaginfo3 = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 6],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {
            "NdefMsg": "D4010354787473", "NdefForumType": 4, "NdefTagLength":255, "NdefTagMode": 1,
        },
    ],
    "tagRfDiscId": 1,
};

let NDEFTaginfo4 = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 6],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {
            "NdefMsg": "D4010354787473", "NdefForumType": 101, "NdefTagLength":255, "NdefTagMode": 1,
        },
    ],
    "tagRfDiscId": 1,
};

let FeatureType = {
    HCE : 0,
    UICC : 0,
    ESE : 0,
};

let NdefFormatableTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 7],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {

        },
    ],
    "tagRfDiscId": 1,
};

let NdefTag ;

export default function nfcNDEFTagTest() {
    describe('nfcNDEFTagTest', function () {
        beforeAll(function () {
            console.info('rbeforeAll called')
            try {
                NdefTag = tag.getNdef(NDEFTaginfo);
                console.info("[NFC_test]NdefTag001 ->: "+ JSON.stringify(NdefTag));
            } catch (error) {
                console.info('nfc TagTest getNdef error' + error)
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
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0100
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0100
         * @tc.desc   Creates an ndef message using the original bytes.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0100', Level.LEVEL0, function ()  {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef1 ndefMessage1: " + ndefMessage);
                    expect(ndefMessage !=null).assertTrue();
                    expect(ndefMessage instanceof Object).assertTrue();
                } catch (error) {
                    console.info("[NFC_test]ndef1 ndefMessage1 error: " + error);
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]NdefTag1 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0101
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0101
         * @tc.desc   Creates an ndef message using the original bytes.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0101', Level.LEVEL0, function (done)  {
            if (NdefTag != null && NdefTag != undefined) {
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(null);
                    console.info("[NFC_test]ndef1 ndefMessage1: " + ndefMessage);
                    expect(ndefMessage !=null).assertTrue();
                    expect(ndefMessage instanceof Object).assertTrue();
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef1 ndefMessage1 error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef1 ndefMessage1 error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag1 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0102
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0102
         * @tc.desc   Creates an ndef message using the original bytes.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0102', Level.LEVEL0, function (done)  {
            if (NdefTag != null && NdefTag != undefined) {
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(undefined);
                    console.info("[NFC_test]ndef1 ndefMessage1: " + ndefMessage);
                    expect(ndefMessage !=null).assertTrue();
                    expect(ndefMessage instanceof Object).assertTrue();
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef1 ndefMessage1 error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef1 ndefMessage1 error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag1 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0103
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0103
         * @tc.desc   Creates an ndef message using the original bytes.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0103', Level.LEVEL0, function (done)  {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [];
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef1 ndefMessage1: " + ndefMessage);
                    expect(ndefMessage !=null).assertTrue();
                    expect(ndefMessage instanceof Object).assertTrue();
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef1 ndefMessage1 error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef1 ndefMessage1 error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag1 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0200
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0200
         * @tc.desc   Obtains all records of ndef messages.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0200', Level.LEVEL0, function ()  {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                console.info("ndefRecords is object2" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef2 ndefMessage result: ");
                    if (ndefMessage != null && ndefMessage != undefined) {
                        let ndefRecords = ndefMessage.getNdefRecords();
                        console.info("[NFC_test]ndef2 ndefRecords number: " + JSON.stringify(ndefRecords));
                         if (ndefRecords.length > 0) {
                            expect(ndefRecords.length > 0).assertTrue();
                         } else {
                            expect(ndefRecords.length == 0).assertTrue();
                         }
                        expect(ndefRecords).assertInstanceOf('Array')
                    }
                    else{
                        console.info("[NFC_test]ndef2 ndefMessage = null & = undefined: ");
                        expect().assertFail();
                    }
                }catch(error){
                    console.info("ndef ndefMessage2 error: " + error);
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]NdefTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0300
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0300
         * @tc.desc   Creates an ndef message using the original bytes.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0300', Level.LEVEL0, function ()  {
            if (NdefTag != null && NdefTag != undefined) {
                let ndefRecords = [
                    {tnf: 0x01, rtdType: [0x54], id: [0x01, 0x02], payload: [0x00, 0xa4, 0x04]},
                    {tnf: 0x02, rtdType: [0x55], id: [0x03, 0x04], payload: [0x00, 0xa4, 0x04]},
                ];
                let ndefMessage;
                console.info("ndefRecords is object3 " );
                try {
                    ndefMessage = tag.ndef.createNdefMessage(ndefRecords);
                    if (ndefMessage != null && ndefMessage != undefined) {
                        console.info("[NFC_test]ndef3 ndefMessage1113: " + ndefMessage);
                        expect(ndefMessage != null).assertTrue();
                        expect(ndefMessage instanceof Object).assertTrue();
                    }
                    else{
                        console.info("[NFC_test]ndef3 ndefMessage = null & = undefined: ");
                        expect().assertFail();
                    }
                } catch (error) {
                    console.info('SUB_Communication_NFC_nfcNDEF_js_03002 error' + error)
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]NdefTag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0400
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0400
         * @tc.desc   Obtains the type of the Ndef tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0400', Level.LEVEL0, function ()  {
            if (NdefTag != null && NdefTag != undefined) {
                let ndefTagType = NdefTag.getNdefTagType();
                console.info("[NFC_test]ndef4 ndefTagType: " + ndefTagType);
                expect(ndefTagType).assertEqual(NfcForumType.NFC_FORUM_TYPE_1);
            } else {
                console.info("[NFC_test]NdefTag4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0401
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0401
         * @tc.desc   Obtains the type of the Ndef tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0401', Level.LEVEL0, function ()  {
            let NdefTag1 = tag.getNdef(NDEFTaginfo1);
            if (NdefTag1 != null && NdefTag1 != undefined) {
                let ndefTagType = NdefTag1.getNdefTagType();
                console.info("[NFC_test]ndef4 ndefTagType: " + ndefTagType);
                expect(ndefTagType).assertEqual(NfcForumType.NFC_FORUM_TYPE_2);
            } else {
                console.info("[NFC_test]NdefTag4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0402
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0402
         * @tc.desc   Obtains the type of the Ndef tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0402', Level.LEVEL0, function ()  {
            let NdefTag2 = tag.getNdef(NDEFTaginfo2);
            if (NdefTag2 != null && NdefTag2 != undefined) {
                let ndefTagType = NdefTag2.getNdefTagType();
                console.info("[NFC_test]ndef4 ndefTagType: " + ndefTagType);
                expect(ndefTagType).assertEqual(NfcForumType.NFC_FORUM_TYPE_3);
            } else {
                console.info("[NFC_test]NdefTag4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0403
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0403
         * @tc.desc   Obtains the type of the Ndef tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0403', Level.LEVEL0, function ()  {
            let NdefTag3 = tag.getNdef(NDEFTaginfo3);
            if (NdefTag3 != null && NdefTag3 != undefined) {
                let ndefTagType = NdefTag3.getNdefTagType();
                console.info("[NFC_test]ndef4 ndefTagType: " + ndefTagType);
                expect(ndefTagType).assertEqual(NfcForumType.NFC_FORUM_TYPE_4);
            } else {
                console.info("[NFC_test]NdefTag4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0404
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0404
         * @tc.desc   Obtains the type of the Ndef tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0404', Level.LEVEL0, function ()  {
            let NdefTag4 = tag.getNdef(NDEFTaginfo4);
            if (NdefTag4 != null && NdefTag4 != undefined) {
                let ndefTagType = NdefTag4.getNdefTagType();
                console.info("[NFC_test]ndef4 ndefTagType: " + ndefTagType);
                expect(ndefTagType).assertEqual(NfcForumType.MIFARE_CLASSIC);
            } else {
                console.info("[NFC_test]NdefTag4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0500
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0500
         * @tc.desc   Obtains the message read from the NDEF tag when the tag is discovered.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0500', Level.LEVEL0, function ()  {
            if (NdefTag != null && NdefTag != undefined) {
                try {
                    let getMessage = NdefTag.getNdefMessage();
                    console.info('[NFC_test]ndef5 NdefMessage:' + getMessage)
                    expect(getMessage != null).assertTrue();
                } catch (error) {
                    console.info('ndef NdefMessage error' + error)
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]NdefTag5 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0600
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0600
         * @tc.desc   Check whether the NDEF label is writable,promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0600', Level.LEVEL0, async function (done) {
            let NdefTag1;
            let NDEFTaginfo = {
                  "uid": [0x01, 0x02, 0x03, 0x04],
                  "technology": [1, 6],
                  "extrasData": [
                     {
                          "Sak": 0x08, "Atqa": "B000",
                     },
                     {
                           "NdefMsg": "D4010354787473", "NdefForumType": 1, 
                            "NdefTagLength":255, "NdefTagMode": 2,
                      },
                    ],
                    "tagRfDiscId": 1,
            };
            try {
                NdefTag1= tag.getNdef(NDEFTaginfo);
            } catch (error) {
                console.info('ndef getNdefTaginfo error' + error)
            }
            if (NdefTag1 != null && NdefTag1 != undefined) {
                let data = NdefTag1.isNdefWritable();
                if (data == true) {
                    console.info("[NFC_test]ndef6 isNdefWritable data: " + data);
                    expect(data).assertTrue();
                } else {
                    console.info("[NFC_test]ndef6 isNdefWritable data: " + data);
                    expect(data).assertFalse();
                }
                done();
            } else {
                console.info("[NFC_test]NdefTag6 = null & = undefined: ");
                expect().assertFail();
                done();
            }
            sleep(3000);
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0700
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0700
         * @tc.desc   Read the ndef message on the tag,promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0700', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                await NdefTag.readNdef().then((data) => {
                    console.info("[NFC_test]ndef7 readNdef1 data: " + data);
                    expect(data!= null).assertTrue();
                    done();
                }).catch((err)=> {
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test]ndef7 readNdef1 err: " + err + err.code);
                        expect(201).assertEqual(code);
                    } else if (code === 401) {
                        console.info("[NFC_test]ndef7 readNdef1 err: " + err + err.code);
                        expect(401).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test]ndef7 readNdef1 err: " + err + err.code);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test]ndef7 readNdef1 err: " + err + err.code);
                        expect(3100204).assertEqual(code);
                    }else {
                        console.info("[NFC_test]ndef7 readNdef1 err: " + err + err.code);
                        expect().assertFail();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag7 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0800
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0800
         * @tc.desc   Read the ndef message on the tag,callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0800', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                NdefTag.readNdef((err, data)=> {
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test]ndef8 readNdef2 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test]ndef8 readNdef2 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test]ndef8 readNdef2 err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test]ndef8 readNdef2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag8 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0900
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0900
         * @tc.desc   Write ndef messages to this tag.promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0900', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                let ndefMessage = tag.ndef.createNdefMessage(rawData);
                await NdefTag.writeNdef(ndefMessage).then((data) => {
                    console.info("[NFC_test]ndef9 writeNdef1 data: " + data);
                    expect(data).assertInstanceOf('Number')
                    done();
                }).catch((err)=> {
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test]ndef9 writeNdef1 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test]ndef9 writeNdef1 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test]ndef9 writeNdef1 err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test]ndef9 writeNdef1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag9 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0901
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0901
         * @tc.desc   Write ndef messages to this tag promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0901', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                (async () => {
                    try {
                        let result = await NdefTag.writeNdef(undefined);
                        console.info("[NFC_test]ndef9 writeNdef data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]ndef9 writeNdef errorcode: " + error.code);
                        expect(401).assertEqual(error.code);
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]NdefTag9 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0902
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0902
         * @tc.desc   Write ndef messages to this tag promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0902', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                (async () => {
                    try {
                        let result = await NdefTag.writeNdef(null);
                        console.info("[NFC_test]ndef9 writeNdef data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]ndef9 writeNdef errorcode: " + error.code);
                        expect(401).assertEqual(error.code);
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]NdefTag9 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0903
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0903
         * @tc.desc   Write ndef messages to this tag promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0903', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                try {
                    await NdefTag.writeNdef(null).then((data) => {
                        console.info("[NFC_test] ndef9 writeNdef data: " + data);
                        expect(data).assertInstanceOf('Number')
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] ndef9 writeNdef err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] ndef9 writeNdef err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag9 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0904
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0904
         * @tc.desc   Write ndef messages to this tag promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0904', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                try {
                    await NdefTag.writeNdef(undefined).then((data) => {
                        console.info("[NFC_test] ndef9 writeNdef data: " + data);
                        expect(data).assertInstanceOf('Number')
                        done();
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] ndef9 writeNdef err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] ndef9 writeNdef err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag9 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1000
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1000
         * @tc.desc   Write ndef messages to this tag.callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1000', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                let ndefMessage = tag.ndef.createNdefMessage(rawData);
                NdefTag.writeNdef(ndefMessage, (err, data)=> {
                    if (err) {
                        const code = Number(err.code);
                        if (code === 201) {
                            console.info("[NFC_test]ndef10 writeNdef2 err: " + err);
                            expect(201).assertEqual(code);
                        } else if (code === 3100201) {
                            console.info("[NFC_test]ndef10 writeNdef2 err: " + err);
                            expect(3100201).assertEqual(code);
                        } else if (code === 3100204) {
                            console.info("[NFC_test]ndef10 writeNdef2 err: " + err);
                            expect(3100204).assertEqual(code);
                        } else {
                            console.info("[NFC_test]ndef10 writeNdef2 err: " + err);
                            expect().assertFail();
                        }
                        done();
                    } else {
                        console.info("[NFC_test]ndef10 writeNdef2 data: " + data);
                        expect(data).assertInstanceOf('Number')
                        done();
                    }
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag10 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1001
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1001
         * @tc.desc   Write ndef messages to this tag.callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1001', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                function writeNdef_callback() {
                    return new Promise ((resolve, reject) => {
                        NdefTag.writeNdef(null, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] ndef10 writeNdef2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await writeNdef_callback().then((data) => {
                    console.info("[NFC_test] ndef10 writeNdef2 done: ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] ndef10 writeNdef2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] ndef10 writeNdef2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]NdefTag10 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1002
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1002
         * @tc.desc   Write ndef messages to this tag.callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1002', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                function writeNdef_callback() {
                    return new Promise ((resolve, reject) => {
                        NdefTag.writeNdef(undefined, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] ndef10 writeNdef2 data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await writeNdef_callback().then((data) => {
                    console.info("[NFC_test] ndef10 writeNdef2 done: ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] ndef10 writeNdef2 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] ndef10 writeNdef2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]NdefTag10 = null & = undefined: ");
                expect().assertFail();
            }
        })
        
        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1100
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1100
         * @tc.desc   Check whether the NDEF tag can be set to read-only.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1100', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                try {
                    let canSetReadOnly = NdefTag.canSetReadOnly();
                    if (canSetReadOnly == true) {
                        console.info("[NFC_test]ndef11 canSetReadOnly: " + canSetReadOnly);
                        expect(canSetReadOnly).assertTrue();   
                    } else {
                        console.info("[NFC_test]ndef11 canSetReadOnly: " + canSetReadOnly);
                        expect(canSetReadOnly).assertFalse();   
                    }
                    done();  
                } catch (err) {
                    if (err.code === 201) {
                        console.info('[NFC_test]NdefTag11 NdefTag err' + err)
                        expect(201).assertEqual(err.code);
                    } else if (err.code === 3100201) {
                        console.info('[NFC_test]NdefTag11 NdefTag err' + err)
                        expect(3100201).assertEqual(err.code);
                    } else {
                        console.info('[NFC_test]NdefTag11 NdefTag err' + err)
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag11 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1200
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1200
         * @tc.desc   Set the Ndef label to read-only.Promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1200', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                await NdefTag.setReadOnly().then((data) => {
                    console.info("[NFC_test]ndef12 setReadOnly1 data: " + data);
                    expect(data).assertInstanceOf('Number')
                    done();
                }).catch((err)=> {
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test]ndef12 setReadOnly1 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 401) {
                        console.info("[NFC_test]ndef12 setReadOnly1 err: " + err);
                        expect(401).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test]ndef12 setReadOnly1 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test]ndef12 setReadOnly1 err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test]ndef12 setReadOnly1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag12 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1300
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1300
         * @tc.desc   Set the Ndef label to read-only.callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1300', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                NdefTag.setReadOnly((err, data)=> {
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test]ndef13 setReadOnly2 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test]ndef13 setReadOnly2 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test]ndef13 setReadOnly2 err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test]ndef13 setReadOnly2 err: " + err);
                        expect().assertFail();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag13 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1400
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1400
         * @tc.desc   Converts the Nfc forum type to the byte array defined in the Nfc forum.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1400', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let ndefTypeString = NdefTag.getNdefTagTypeString(NfcForumType.NFC_FORUM_TYPE_1);
                console.info("[NFC_test]ndef14 ndefTypeString: " + JSON.stringify(ndefTypeString));
                expect(ndefTypeString == "org.nfcforum.ndef.type1").assertTrue();
            } else {
                console.info("[NFC_test]NdefTag14 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1401
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1401
         * @tc.desc   Converts the Nfc forum type to the byte array defined in the Nfc forum.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1401', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let ndefTypeString = NdefTag.getNdefTagTypeString(NfcForumType.NFC_FORUM_TYPE_2);
                console.info("[NFC_test]ndef14 ndefTypeString: " + JSON.stringify(ndefTypeString));
                expect(ndefTypeString == "org.nfcforum.ndef.type2").assertTrue();
            } else {
                console.info("[NFC_test]NdefTag14 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1402
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1402
         * @tc.desc   Converts the Nfc forum type to the byte array defined in the Nfc forum.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1402', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let ndefTypeString = NdefTag.getNdefTagTypeString(NfcForumType.NFC_FORUM_TYPE_3);
                console.info("[NFC_test]ndef14 ndefTypeString: " + JSON.stringify(ndefTypeString));
                expect(ndefTypeString == "org.nfcforum.ndef.type3").assertTrue();
            } else {
                console.info("[NFC_test]NdefTag14 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1403
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1403
         * @tc.desc   Converts the Nfc forum type to the byte array defined in the Nfc forum.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1403', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let ndefTypeString = NdefTag.getNdefTagTypeString(NfcForumType.NFC_FORUM_TYPE_4);
                console.info("[NFC_test]ndef14 ndefTypeString: " + JSON.stringify(ndefTypeString));
                expect(ndefTypeString == "org.nfcforum.ndef.type4").assertTrue();
            } else {
                console.info("[NFC_test]NdefTag14 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1404
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1404
         * @tc.desc   Converts the Nfc forum type to the byte array defined in the Nfc forum.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1404', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let ndefTypeString = NdefTag.getNdefTagTypeString(NfcForumType.MIFARE_CLASSIC);
                console.info("[NFC_test]ndef14 ndefTypeString: " + JSON.stringify(ndefTypeString));
                expect(ndefTypeString == "com.nxp.ndef.mifareclassic").assertTrue();
            } else {
                console.info("[NFC_test]NdefTag14 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1500
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1500
         * @tc.desc   Formats the tag as an NDEF tag and writes the NDEF message to the NDEF tag.Promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1500', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43]; 
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                await NdefFormatable.format(ndefmessage).then(() => {
                    console.info("[NFC_test]ndef15 Formatable format1 ");
                }).catch((err)=> {
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test]ndef15 Formatable format1 err: " + err + err.code);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test]ndef15 Formatable format1 err: " + err + err.code);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test]ndef15 Formatable format1 err: " + err + err.code);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test]ndef15 Formatable format1 err: " + err + err.code);
                        expect().assertFail();
                    }
                    done();
                });
            } else {
                console.info("[NFC_test]NdefTag15 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1501
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1501
         * @tc.desc   Formats the tag as an NDEF tag and writes the NDEF message to the NDEF tag.Promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1501', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43]; 
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                try {
                    await NdefFormatable.format(null).then(() => {
                        console.info("[NFC_test]ndef15 Formatable format1 ");
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] ndef15 Formatable format1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] ndef15 Formatable format1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag15 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1502
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1502
         * @tc.desc   Formats the tag as an NDEF tag and writes the NDEF message to the NDEF tag.Promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1502', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43]; 
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                try {
                    await NdefFormatable.format(undefined).then(() => {
                        console.info("[NFC_test]ndef15 Formatable format1 ");
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test] ndef15 Formatable format1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] ndef15 Formatable format1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag15 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1600
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1600
         * @tc.desc   Formats the tag as an NDEF tag and writes the NDEF message to the NDEF tag.callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1600', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) { 
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43]; 
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                NdefFormatable.format(ndefmessage, (err, data)=> {
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test]ndef16 Formatable format err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test]ndef16 Formatable format err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test]ndef16 Formatable format err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test]ndef16 Formatable format err: " + err);
                        expect().assertFail();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag16 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1601
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1601
         * @tc.desc   Formats the tag as an NDEF tag and writes the NDEF message to the NDEF tag.callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1601', Level.LEVEL0, async function (done) {
            let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
            if (NdefTag != null && NdefTag != undefined) {
                function format_callback() {
                    return new Promise ((resolve, reject) => {
                        NdefFormatable.format(null, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] ndef16 Formatable format data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await format_callback().then((data) => {
                    console.info("[NFC_test] ndef16 Formatable format done: ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] ndef16 Formatable format err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] ndef16 Formatable format err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]NdefTag16 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1602
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1602
         * @tc.desc   Formats the tag as an NDEF tag and writes the NDEF message to the NDEF tag.callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1602', Level.LEVEL0, async function (done) {
            let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
            if (NdefTag != null && NdefTag != undefined) {
                function format_callback() {
                    return new Promise ((resolve, reject) => {
                        NdefFormatable.format(undefined, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] ndef16 Formatable format data: " + data);
                                resolve();
                                done();
                            }
                        });
                    });
                }
                await format_callback().then((data) => {
                    console.info("[NFC_test] ndef16 Formatable format done: ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test] ndef16 Formatable format err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test] ndef16 Formatable format err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]NdefTag16 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1700
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1700
         * @tc.desc   Format as NDEF and set the NDEF message write label to read-only.Promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1700', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                await NdefFormatable.formatReadOnly(ndefmessage).then(() => {
                    console.info("[NFC_test]ndef17 Formatable formatReadOnly1 " + data);
                    expect().assertFail();
                }).catch((err)=> {
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test]ndef17 Formatable formatReadOnly1 err: " + err + err.code);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test]ndef17 Formatable formatReadOnly1 err: " + err + err.code);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test]ndef17 Formatable formatReadOnly1 err: " + err + err.code);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test]ndef17 Formatable formatReadOnly1 err: " + err + err.code);
                        expect().assertFail();
                    }
                    done();
                });
            } else {
                console.info("[NFC_test]NdefTag17 = null & = undefined: ");
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1701
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1701
         * @tc.desc   Format as NDEF and set the NDEF message write label to read-only.Promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1701', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                try {
                    await NdefFormatable.formatReadOnly(null).then(() => {
                        console.info("[NFC_test]ndef17 Formatable formatReadOnly1 " + data);
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test]ndef17 Formatable formatReadOnly1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test]ndef17 Formatable formatReadOnly1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag17 = null & = undefined: ");
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1702
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1702
         * @tc.desc   Format as NDEF and set the NDEF message write label to read-only.Promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1702', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                try {
                    await NdefFormatable.formatReadOnly(undefined).then(() => {
                        console.info("[NFC_test]ndef17 Formatable formatReadOnly1 " + data);
                    });
                } catch (err) {
                    if (err.code === 401) {
                        console.info("[NFC_test]ndef17 Formatable formatReadOnly1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test]ndef17 Formatable formatReadOnly1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag17 = null & = undefined: ");
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1800
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1800
         * @tc.desc   Format as NDEF and set the NDEF message write label to read-only.callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1800', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                NdefFormatable.formatReadOnly(ndefmessage, (err, data)=> {
                    const code = Number(err.code);
                    if (code === 201) {
                        console.info("[NFC_test]ndef18 Formatable formatReadOnly1 err: " + err);
                        expect(201).assertEqual(code);
                    } else if (code === 3100201) {
                        console.info("[NFC_test]ndef18 Formatable formatReadOnly1 err: " + err);
                        expect(3100201).assertEqual(code);
                    } else if (code === 3100204) {
                        console.info("[NFC_test]ndef18 Formatable formatReadOnly1 err: " + err);
                        expect(3100204).assertEqual(code);
                    } else {
                        console.info("[NFC_test]ndef18 Formatable formatReadOnly1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag18 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1801
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1801
         * @tc.desc   Format as NDEF and set the NDEF message write label to read-only.callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1801', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                function formatReadOnly_callback() {
                    return new Promise ((resolve, reject) => {
                        NdefFormatable.formatReadOnly(null, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] ndef18 Formatable formatReadOnly1 data: " + data);
                                resolve();
                                done();
                            }
                        })
                    })
                }
                await formatReadOnly_callback().then((data) => {
                    console.info("[NFC_test] ndef18 Formatable formatReadOnly1 done: ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test]ndef18 Formatable formatReadOnly1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test]ndef18 Formatable formatReadOnly1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]NdefTag18 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1802
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1802
         * @tc.desc   Format as NDEF and set the NDEF message write label to read-only.callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1802', Level.LEVEL0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                function formatReadOnly_callback() {
                    return new Promise ((resolve, reject) => {
                        NdefFormatable.formatReadOnly(undefined, (err, data)=> {
                            if (err) {
                                reject(err.code);
                            } else {
                                console.info("[NFC_test] ndef18 Formatable formatReadOnly1 data: " + data);
                                resolve();
                                done();
                            }
                        })
                    })
                }
                await formatReadOnly_callback().then((data) => {
                    console.info("[NFC_test] ndef18 Formatable formatReadOnly1 done: ");
                })
                .catch ((err) => {
                    if (err.code === 401) {
                        console.info("[NFC_test]ndef18 Formatable formatReadOnly1 err: " + err);
                        expect(401).assertEqual(err.code);
                    } else {
                        console.info("[NFC_test]ndef18 Formatable formatReadOnly1 err: " + err);
                        expect().assertFail();
                    }
                    done();
                })
            } else {
                console.info("[NFC_test]NdefTag18 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1900
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1900
         * @tc.desc   Obtains all records of ndef makeUriRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1900', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeUriRecord is object3" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef19 Message result: " + JSON.stringify(ndefMessage));
                    let makeRecords = tag.ndef.makeUriRecord("D4010354787473");
                    console.info("[NFC_test]ndrf19 result: " + JSON.stringify(makeRecords));
                    expect(JSON.stringify(makeRecords)!=null).assertTrue();
                } catch (error) {
                    console.info("[NFC_test]ndef19 ndefMessage error: " + error);
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]NdefTag19 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1901
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1901
         * @tc.desc   Obtains all records of ndef makeUriRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1901', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeUriRecord is object3" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef19 ndefMessage makeUriRecord result: " + JSON.stringify(ndefMessage));
                    let makeRecords = tag.ndef.makeUriRecord("");
                    console.info("[NFC_test]ndrf19 result: " + JSON.stringify(makeRecords));
                    expect(JSON.stringify(makeRecords)!=null).assertTrue();
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef19 ndefMessage makeUriRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef19 ndefMessage makeUriRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag19 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1902
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1902
         * @tc.desc   Obtains all records of ndef makeUriRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1902', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeUriRecord is object3" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef19 ndefMessage makeUriRecord result: " + JSON.stringify(ndefMessage));
                    let makeRecords = tag.ndef.makeUriRecord(null);
                    console.info("[NFC_test]ndrf19 result: " + JSON.stringify(makeRecords));
                    expect(JSON.stringify(makeRecords)!=null).assertTrue();
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef19 ndefMessage makeUriRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef19 ndefMessage makeUriRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag19 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1903
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1903
         * @tc.desc   Obtains all records of ndef makeUriRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1903', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeUriRecord is object3" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef19 ndefMessage makeUriRecord result: " + JSON.stringify(ndefMessage));
                    let makeRecords = tag.ndef.makeUriRecord(undefined);
                    console.info("[NFC_test]ndrf19 result: " + JSON.stringify(makeRecords));
                    expect(JSON.stringify(makeRecords)!=null).assertTrue();
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef19 ndefMessage makeUriRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef19 ndefMessage makeUriRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag19 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1904
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1904
         * @tc.desc   Obtains all records of ndef makeUriRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1904', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeUriRecord is object3" );
                let bundleName = "D4010354787473"
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef19 Message result: " + JSON.stringify(ndefMessage));
                    let makeRecords = tag.ndef.makeUriRecord(bundleName);
                    console.info("[NFC_test]ndrf19 result: " + JSON.stringify(makeRecords));
                    expect(makeRecords.tnf).assertEqual(1);
                    expect(makeRecords.rtdType.length > 0).assertTrue();
                    expect(makeRecords.id.length == 0).assertTrue();
                    expect(makeRecords.payload.length > 0).assertTrue();
                    expect(JSON.stringify(makeRecords)!=null).assertTrue();
                } catch (error) {
                    console.info("[NFC_test]ndef19 ndefMessage error: " + error);
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]NdefTag19 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2000
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2000
         * @tc.desc   Obtains all records of createNdefMessage NDEF
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2000', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeTextRecord is object4" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef20 Message result1: " + JSON.stringify(ndefMessage));
                    let makeTRecords = tag.ndef.makeTextRecord("test112HW","test");
                    console.info("[NFC_test]ndef20 result1: " + JSON.stringify(makeTRecords));
                    expect(JSON.stringify(makeTRecords)!=null).assertTrue();
                } catch (error) {
                    console.info("[NFC_test]ndef20 ndefMessage1 error: " + error);
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]NdefTag20 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2001
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2001
         * @tc.desc   Obtains all records of createNdefMessage NDEF
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2001', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeTextRecord is object4" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef20 Message result1: " + JSON.stringify(ndefMessage));
                    let makeTRecords = tag.ndef.makeTextRecord("","");
                    console.info("[NFC_test]ndef20 result1: " + JSON.stringify(makeTRecords));
                    expect(JSON.stringify(makeTRecords)!=null).assertTrue();
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef20 ndefMessage makeTextRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef20 ndefMessage makeTextRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag20 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2002
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2002
         * @tc.desc   Obtains all records of createNdefMessage NDEF
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2002', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeTextRecord is object4" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef20 Message result1: " + JSON.stringify(ndefMessage));
                    let makeTRecords = tag.ndef.makeTextRecord(null,null);
                    console.info("[NFC_test]ndef20 result1: " + JSON.stringify(makeTRecords));
                    expect(JSON.stringify(makeTRecords)!=null).assertTrue();
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef20 ndefMessage makeTextRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef20 ndefMessage makeTextRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag20 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2003
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2003
         * @tc.desc   Obtains all records of createNdefMessage NDEF
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2003', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeTextRecord is object4" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef20 Message result1: " + JSON.stringify(ndefMessage));
                    let makeTRecords = tag.ndef.makeTextRecord(undefined,undefined);
                    console.info("[NFC_test]ndef20 result1: " + JSON.stringify(makeTRecords));
                    expect(JSON.stringify(makeTRecords)!=null).assertTrue();
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef20 ndefMessage makeTextRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef20 ndefMessage makeTextRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag20 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2004
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2004
         * @tc.desc   Obtains all records of createNdefMessage NDEF
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2004', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeTextRecord is object4" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef20 Message result1: " + JSON.stringify(ndefMessage));
                    let makeTRecords = tag.ndef.makeTextRecord("test112HW","test");
                    console.info("[NFC_test]ndef20 result1: " + JSON.stringify(makeTRecords));
                    expect(makeTRecords.tnf).assertEqual(1);
                    expect(makeTRecords.rtdType.length > 0).assertTrue();
                    expect(makeTRecords.id.length == 0).assertTrue();
                    expect(makeTRecords.payload.length > 0).assertTrue();
                    expect(JSON.stringify(makeTRecords)!=null).assertTrue();
                } catch (error) {
                    console.info("[NFC_test]ndef20 ndefMessage1 error: " + error);
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]NdefTag20 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2100
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2100
         * @tc.desc   Obtains all records of ndef makeMimeRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2100', Level.LEVEL0, function () {
            let NdefTag
            try{
                NdefTag= tag.getNdef(NDEFTaginfo);
            }catch(error){
                console.info('SUB_Communication_NFC_nfcNDEF_js_2100 error' + error)
            }
            let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
            let mimeType = "text/plain"; 
            let mimeData = [0x01, 0x02, 0x03, 0x04]; 
            if (NdefTag!= undefined){
                console.info("makeMimeRecord is object5" );
                try{
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]nde21 fMessage result2: " + JSON.stringify(ndefMessage));
                    let makeMRecords = tag.ndef.makeMimeRecord(mimeType , mimeData);
                    console.info("[NFC_test]ndef21 result2: " + JSON.stringify(makeMRecords));
                    expect(JSON.stringify(makeMRecords)!=null).assertTrue();
                }catch(error){
                    console.info("[NFC_test]ndef21 ndefMessage2 error: " + error);
                    expect().assertFail();
                }
            } else{
                console.info("[NFC_test]ndef21 typeof2 ->: "+ typeof(NdefTag) );
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2101
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2101
         * @tc.desc   Obtains all records of ndef makeMimeRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2101', Level.LEVEL0, function (done) {
            let NdefTag;
            try{
                NdefTag= tag.getNdef(NDEFTaginfo);
            }catch(error){
                console.info('SUB_Communication_NFC_nfcNDEF_js_2100 error' + error)
            }
            let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
            let mimeType = "text/plain"; 
            let mimeData = [0x01, 0x02, 0x03, 0x04]; 
            if (NdefTag != undefined){
                console.info("makeMimeRecord is object5" );
                try{
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]nde21 fMessage result2: " + JSON.stringify(ndefMessage));
                    let makeMRecords = tag.ndef.makeMimeRecord("" , "");
                    console.info("[NFC_test]ndef21 result2: " + JSON.stringify(makeMRecords));
                    expect(JSON.stringify(makeMRecords)!=null).assertTrue();
                }catch(error){
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef21 ndefMessage makeMimeRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    }else {
                        console.info("[NFC_test]ndef21 ndefMessage makeMimeRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else{
                console.info("[NFC_test]ndef21 typeof2 ->: "+ typeof(NdefTag) );
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2102
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2102
         * @tc.desc   Obtains all records of ndef makeMimeRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2102', Level.LEVEL0, function (done) {
            let NdefTag;
            try{
                NdefTag= tag.getNdef(NDEFTaginfo);
            }catch(error){
                console.info('SUB_Communication_NFC_nfcNDEF_js_2100 error' + error)
            }
            let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
            let mimeType = "text/plain"; 
            let mimeData = [0x01, 0x02, 0x03, 0x04]; 
            if (NdefTag != undefined){
                console.info("makeMimeRecord is object5" );
                try{
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]nde21 fMessage result2: " + JSON.stringify(ndefMessage));
                    let makeMRecords = tag.ndef.makeMimeRecord(null , null);
                    console.info("[NFC_test]ndef21 result2: " + JSON.stringify(makeMRecords));
                    expect(JSON.stringify(makeMRecords)!=null).assertTrue();
                }catch(error){
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef21 ndefMessage makeMimeRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef21 ndefMessage makeMimeRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            }else{
                console.info("[NFC_test]ndef21 typeof2 ->: "+ typeof(NdefTag) );
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2103
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2103
         * @tc.desc   Obtains all records of ndef makeMimeRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2103', Level.LEVEL0, function (done) {
            let NdefTag;
            try{
                NdefTag= tag.getNdef(NDEFTaginfo);
            }catch(error){
                console.info('SUB_Communication_NFC_nfcNDEF_js_2100 error' + error)
            }
            let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
            let mimeType = "text/plain"; 
            let mimeData = [0x01, 0x02, 0x03, 0x04]; 
            if (NdefTag != undefined){
                console.info("makeMimeRecord is object5" );
                try{
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]nde21 fMessage result2: " + JSON.stringify(ndefMessage));
                    let makeMRecords = tag.ndef.makeMimeRecord(undefined , undefined);
                    console.info("[NFC_test]ndef21 result2: " + JSON.stringify(makeMRecords));
                    expect(JSON.stringify(makeMRecords)!=null).assertTrue();
                }catch(error){
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef21 ndefMessage makeMimeRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef21 ndefMessage makeMimeRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            }else{
                console.info("[NFC_test]ndef21 typeof2 ->: "+ typeof(NdefTag) );
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2104
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2104
         * @tc.desc   Obtains all records of ndef makeMimeRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2104', Level.LEVEL0, function () {
            let NdefTag
            try{
                NdefTag= tag.getNdef(NDEFTaginfo);
            }catch(error){
                console.info('SUB_Communication_NFC_nfcNDEF_js_2100 error' + error)
            }
            let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
            let mimeType = "text/plain"; 
            let mimeData = [0x01, 0x02, 0x03, 0x04]; 
            if (NdefTag!= undefined){
                console.info("makeMimeRecord is object5" );
                try{
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]nde21 fMessage result2: " + JSON.stringify(ndefMessage));
                    let makeMRecords = tag.ndef.makeMimeRecord(mimeType , mimeData);
                    console.info("[NFC_test]ndef21 result2: " + JSON.stringify(makeMRecords));
                    expect(makeMRecords.tnf).assertEqual(2);
                    expect(makeMRecords.rtdType.length > 0).assertTrue();
                    expect(makeMRecords.id.length == 0).assertTrue();
                    expect(makeMRecords.payload.length > 0).assertTrue();
                    expect(JSON.stringify(makeMRecords)!=null).assertTrue();
                }catch(error){
                    console.info("[NFC_test]ndef21 ndefMessage2 error: " + error);
                    expect().assertFail();
                }
            } else{
                console.info("[NFC_test]ndef21 typeof2 ->: "+ typeof(NdefTag) );
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2105
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2105
         * @tc.desc   Obtains all records of ndef makeMimeRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2105', Level.LEVEL0, function (done) {
            let NdefTag;
            let array = [];
            try{
                NdefTag= tag.getNdef(NDEFTaginfo);
            }catch(error){
                console.info('SUB_Communication_NFC_nfcNDEF_js_2100 error' + error)
            }
            let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
            let mimeType = "text/plain"; 
            let mimeData = [0x01, 0x02, 0x03, 0x04]; 
            if (NdefTag != undefined){
                console.info("makeMimeRecord is object5" );
                try{
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]nde21 fMessage result2: " + JSON.stringify(ndefMessage));
                    let makeMRecords = tag.ndef.makeMimeRecord(undefined , array);
                    console.info("[NFC_test]ndef21 result2: " + JSON.stringify(makeMRecords));
                    expect(JSON.stringify(makeMRecords)!=null).assertTrue();
                }catch(error){
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef21 ndefMessage makeMimeRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef21 ndefMessage makeMimeRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            }else{
                console.info("[NFC_test]ndef21 typeof2 ->: "+ typeof(NdefTag) );
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2200
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2200
         * @tc.desc   Obtains all records of ndef makeExternalRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2200', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeExternalRecord is object6" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef22 Message result3: " + JSON.stringify(ndefMessage));
                    let makeERecords = tag.ndef.makeExternalRecord("NFC","NFCtest",[0x01, 0x02]);
                    console.info("[NFC_test]ndef22 result13: " + JSON.stringify(makeERecords));
                    expect(makeERecords instanceof Object).assertTrue();
                } catch (error) {
                    console.info("[NFC_test]ndef22 ndefMessage3 error: " + error);
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]NdefTag22 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2201
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2201
         * @tc.desc   Obtains all records of ndef makeExternalRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2201', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeExternalRecord is object6" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef22 Message result3: " + JSON.stringify(ndefMessage));
                    let makeERecords = tag.ndef.makeExternalRecord("","",[]);
                    console.info("[NFC_test]ndef22 result13: " + JSON.stringify(makeERecords));
                    expect(makeERecords instanceof Object).assertTrue();
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef22 ndefMessage makeExternalRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef22 ndefMessage makeExternalRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag22 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2202
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2202
         * @tc.desc   Obtains all records of ndef makeExternalRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2202', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeExternalRecord is object6" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef22 Message result3: " + JSON.stringify(ndefMessage));
                    let makeERecords = tag.ndef.makeExternalRecord(null,null,null);
                    console.info("[NFC_test]ndef22 result13: " + JSON.stringify(makeERecords));
                    expect(makeERecords instanceof Object).assertTrue();
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef22 ndefMessage makeExternalRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef22 ndefMessage makeExternalRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag22 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2203
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2203
         * @tc.desc   Obtains all records of ndef makeExternalRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2203', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeExternalRecord is object6" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef22 Message result3: " + JSON.stringify(ndefMessage));
                    let makeERecords = tag.ndef.makeExternalRecord(undefined,undefined,undefined);
                    console.info("[NFC_test]ndef22 result13: " + JSON.stringify(makeERecords));
                    expect(makeERecords instanceof Object).assertTrue();
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef22 ndefMessage makeExternalRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef22 ndefMessage makeExternalRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag22 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2204
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2204
         * @tc.desc   Obtains all records of ndef makeExternalRecord.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2204', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeExternalRecord is object6" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef22 Message result3: " + JSON.stringify(ndefMessage));
                    let makeERecords = tag.ndef.makeExternalRecord("NFC","NFCtest",[0x01, 0x02]);
                    console.info("[NFC_test]ndef22 result13: " + JSON.stringify(makeERecords));
                    expect(makeERecords.tnf).assertEqual(4);
                    expect(makeERecords.rtdType.length > 0).assertTrue();
                    expect(makeERecords.id.length == 0).assertTrue();
                    expect(makeERecords.payload.length > 0).assertTrue();
                    expect(makeERecords instanceof Object).assertTrue();
                } catch (error) {
                    console.info("[NFC_test]ndef22 ndefMessage3 error: " + error);
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]NdefTag22 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2300
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2300
         * @tc.desc   Obtains all records of ndef messageToBytes.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2300', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("messageToBytes is object7" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef23 Message result4: " + JSON.stringify(ndefMessage));
                    let makeERecords = tag.ndef.messageToBytes(ndefMessage);
                    if (makeERecords.length > 0) {
                        expect(makeERecords.length > 0).assertTrue();
                    } else {
                        expect(makeERecords).assertDeepEquals([]);
                    }
                    console.info("[NFC_test]ndef23 result4: " + JSON.stringify(makeERecords));
                    expect(makeERecords).assertInstanceOf('Array')
                } catch (error) {
                    console.info("[NFC_test]ndef23 ndefMessage4 error: " + error);
                    expect().assertFail();
                }
            }else{
                console.info("[NFC_test]NdefTag23 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2301
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2301
         * @tc.desc   Obtains all records of ndef messageToBytes.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2301', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData1 = [0xD1, 0x01];
                console.info("messageToBytes is object7" );
                try {
                    let ndefMessage1 = tag.ndef.createNdefMessage(rawData1);
                    console.info("[NFC_test]ndef23 Message result4: " + JSON.stringify(ndefMessage1));
                    let makeERecords1 = tag.ndef.messageToBytes(ndefMessage1);
                    if (makeERecords1.length > 0) {
                        expect(makeERecords1.length > 0).assertTrue();
                    } else {
                        expect(makeERecords1).assertDeepEquals([]);
                    }
                    console.info("[NFC_test]ndef23 result4: " + JSON.stringify(makeERecords1));
                    expect(makeERecords1).assertInstanceOf('Array')
                } catch (error) {
                    console.info("[NFC_test]ndef23 ndefMessage4 error: " + error);
                    expect().assertFail();
                }
            }else{
                console.info("[NFC_test]NdefTag23 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2302
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2302
         * @tc.desc   Obtains all records of ndef messageToBytes.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2302', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                try {
                    let makeERecords1 = tag.ndef.messageToBytes(null);
                    if (makeERecords1.length > 0) {
                        expect(makeERecords1.length > 0).assertTrue();
                    } else {
                        expect(makeERecords1).assertDeepEquals([]);
                    }
                    console.info("[NFC_test]ndef23 result4: " + JSON.stringify(makeERecords1));
                    expect(makeERecords1).assertInstanceOf('Array')
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef23 ndefMessage messageToBytes error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef23 ndefMessage messageToBytes error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            }else{
                console.info("[NFC_test]NdefTag23 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2303
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2303
         * @tc.desc   Obtains all records of ndef messageToBytes.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2303', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                try {
                    let makeERecords1 = tag.ndef.messageToBytes(undefined);
                    if (makeERecords1.length > 0) {
                        expect(makeERecords1.length > 0).assertTrue();
                    } else {
                        expect(makeERecords1).assertDeepEquals([]);
                    }
                    console.info("[NFC_test]ndef23 result4: " + JSON.stringify(makeERecords1));
                    expect(makeERecords1).assertInstanceOf('Array')
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef23 ndefMessage messageToBytes error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef23 ndefMessage messageToBytes error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            }else{
                console.info("[NFC_test]NdefTag23 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2400
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2400
         * @tc.desc   Obtains all records of ndef makeApplicationRecord
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2400', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeApplicationRecord is object7" );
                let bundleName = "com.test.cardemulation"
                try{
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef24 createNdefMessage result: " + JSON.stringify(ndefMessage));
                    let makeERecords = tag.ndef.makeApplicationRecord(bundleName);
                    if (makeERecords != undefined){
                        console.info("[NFC_test]ndef24 makeApplicationRecord rtdType: " + makeERecords.rtdType);
                        console.info("[NFC_test]ndef24 makeApplicationRecord payload: " + makeERecords.payload);
                    }else{
                        console.info("[NFC_test]ndef24 makeApplicationRecord ndefRecord: " + makeERecords);
                        expect().assertFail();
                    }             
                } catch (error) {
                    console.info("[NFC_test]ndef24 makeApplicationRecord error: " + error);
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]NdefTag24 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2401
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2401
         * @tc.desc   Obtains all records of ndef makeApplicationRecord
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2401', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeApplicationRecord is object7" );
                let bundleName = "com.test.cardemulation"
                try{
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef24 createNdefMessage result: " + JSON.stringify(ndefMessage));
                    let makeERecords = tag.ndef.makeApplicationRecord("");
                    if (makeERecords != undefined){
                        console.info("[NFC_test]ndef24 makeApplicationRecord rtdType: " + makeERecords.rtdType);
                        console.info("[NFC_test]ndef24 makeApplicationRecord payload: " + makeERecords.payload);
                    }else{
                        console.info("[NFC_test]ndef24 makeApplicationRecord ndefRecord: " + makeERecords);
                        expect().assertFail();
                    }             
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef24 ndefMessage makeApplicationRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef24 ndefMessage makeApplicationRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag24 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2402
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2402
         * @tc.desc   Obtains all records of ndef makeApplicationRecord
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2402', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeApplicationRecord is object7" );
                let bundleName = "com.test.cardemulation"
                try{
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef24 createNdefMessage result: " + JSON.stringify(ndefMessage));
                    let makeERecords = tag.ndef.makeApplicationRecord(null);
                    if (makeERecords != undefined){
                        console.info("[NFC_test]ndef24 makeApplicationRecord rtdType: " + makeERecords.rtdType);
                        console.info("[NFC_test]ndef24 makeApplicationRecord payload: " + makeERecords.payload);
                    } else {
                        console.info("[NFC_test]ndef24 makeApplicationRecord ndefRecord: " + makeERecords);
                        expect().assertFail();
                    }             
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef24 ndefMessage makeApplicationRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef24 ndefMessage makeApplicationRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag24 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2403
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2403
         * @tc.desc   Obtains all records of ndef makeApplicationRecord
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2403', Level.LEVEL0, function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeApplicationRecord is object7" );
                let bundleName = "com.test.cardemulation"
                try{
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef24 createNdefMessage result: " + JSON.stringify(ndefMessage));
                    let makeERecords = tag.ndef.makeApplicationRecord(undefined);
                    if (makeERecords != undefined){
                        console.info("[NFC_test]ndef24 makeApplicationRecord rtdType: " + makeERecords.rtdType);
                        console.info("[NFC_test]ndef24 makeApplicationRecord payload: " + makeERecords.payload);
                    } else {
                        console.info("[NFC_test]ndef24 makeApplicationRecord ndefRecord: " + makeERecords);
                        expect().assertFail();
                    }             
                } catch (error) {
                    if (error.code === 401) {
                        console.info("[NFC_test]ndef24 ndefMessage makeApplicationRecord error: " + error);
                        expect(401).assertEqual(error.code);
                    } else {
                        console.info("[NFC_test]ndef24 ndefMessage makeApplicationRecord error: " + error);
                        expect().assertFail();
                    }
                    done();
                }
            } else {
                console.info("[NFC_test]NdefTag24 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2404
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2404
         * @tc.desc   Obtains all records of ndef makeApplicationRecord
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2404', Level.LEVEL0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("makeApplicationRecord is object7" );
                let bundleName = "com.test.cardemulation"
                try{
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef24 createNdefMessage result: " + JSON.stringify(ndefMessage));
                    let makeERecords = tag.ndef.makeApplicationRecord(bundleName);
                    expect(makeERecords.tnf).assertEqual(4);
                    expect(makeERecords.rtdType.length > 0).assertTrue();
                    expect(makeERecords.id.length == 0).assertTrue();
                    expect(makeERecords.payload.length > 0).assertTrue();          
                } catch (error) {
                    console.info("[NFC_test]ndef24 makeApplicationRecord error: " + error);
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]NdefTag24 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}



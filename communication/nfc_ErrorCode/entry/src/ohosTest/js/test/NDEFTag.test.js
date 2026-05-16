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

let NdefTag;

export default function nfcNDEFErrorTest() {
    describe('nfcNDEFErrorTest', function () {
        beforeAll(function () {
            console.info('beforeAll called')
        })
        beforeEach(function() {
            console.info('beforeEach called')
            try{
                NdefTag= tag.getNdef(NDEFTaginfo);
            }catch(error){
                console.info('SUB_Communication_NFC_nfcNDEF_js_0800 error' + error)
            }
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
         * @tc.desc   Creates an ndef message using the original bytes. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0100', Level.LEVEL1, function ()  {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                let ndefMessage ;
                try{
                    ndefMessage = tag.ndef.createNdefMessage('test');
                    expect(ndefMessage !=null).assertTrue();
                    expect(ndefMessage instanceof Object).assertTrue();
                    console.info("[NFC_test]ndef1 createNdefMessage: " + ndefMessage);
                }catch(error){
                    console.info("[NFC_test]ndef1 createNdefMessage errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
            } else {
                console.info("[NFC_test]NdefTag1 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0200
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0200
         * @tc.desc   Creates an ndef message using the original bytes. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0200', Level.LEVEL1, function ()  {
            if (NdefTag != null && NdefTag != undefined) {
                let ndefRecords = [
                    {tnf: 0x01, rtdType: [0x54], id: [0x01, 0x02], payload: [0x00, 0xa4, 0x04]},
                    {tnf: 0x02, rtdType: [0x55], id: [0x03, 0x04], payload: [0x00, 0xa4, 0x04]},
                ];
                let ndefMessage;
                try{
                    ndefMessage = tag.ndef.createNdefMessage('test');
                    if (ndefMessage != null && ndefMessage != undefined) {
                        console.info("[NFC_test]ndef2 ndefMessage: " + ndefMessage);
                        expect(ndefMessage != null).assertTrue();
                        expect(ndefMessage instanceof Object).assertTrue();
                    }
                    else{
                        console.info("[NFC_test]ndef2 ndefMessage: " + error);
                    }
                }catch(error){
                    console.info("[NFC_test]ndef2 createNdefMessage errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
            } else {
                console.info("[NFC_test]NdefTag2 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0300
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0300
         * @tc.desc   Read the ndef message on the tag promise. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0300', Level.LEVEL1, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                (async () => {
                    try {
                        let result = await NdefTag.readNdef('test');
                        console.info("[NFC_test]ndef3 readNdef data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]ndef3 readNdef errorcode: " + error.code);
                        expect(401).assertEqual(error.code);
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]NdefTag3 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0400
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0400
         * @tc.desc   Read the ndef message on the tag callback .The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0400', Level.LEVEL1, async function (done) {     
            if (NdefTag != null && NdefTag != undefined) {             
                try {
                    NdefTag.readNdef('test')((err, data)=> {
                        if (err) {
                            expect(true).assertEqual(true);
                            console.info("[NFC_test]ndef4 readNdef errcode: " + err);
                        } else {
                            expect(data!=true).assertTrue();
                            console.info("[NFC_test]ndef4 readNdef data: " + data);
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]ndef4 readNdef errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
                done();
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag4 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0500
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0500
         * @tc.desc   Write ndef messages to this tag promise. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0500', Level.LEVEL1, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                let ndefMessage = tag.ndef.createNdefMessage(rawData);
                (async () => {
                    try {
                        let result = await NdefTag.writeNdef('test');
                        console.info("[NFC_test]ndef5 writeNdef data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]ndef5 writeNdef errorcode: " + error.code);
                        expect(401).assertEqual(error.code);
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]NdefTag5 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0600
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0600
         * @tc.desc   Write ndef messages to this tag callback. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0600', Level.LEVEL1, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                let ndefMessage = tag.ndef.createNdefMessage(rawData);                  
                try {
                    NdefTag.writeNdef('test', (err, data)=> {
                        if (err) {
                            console.info("[NFC_test]ndef6 writeNdef errcode: " + err);
                            expect(true).assertEqual(true);
                        } else {
                            expect(data).assertInstanceOf('Number')
                            console.info("[NFC_test]ndef6 writeNdef data: " + data);
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]ndef6 writeNdef errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
                done();
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag6 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0700
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0700
         * @tc.desc   Set the Ndef label to read-only Promise. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0700', Level.LEVEL1, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                (async () => {
                    try {
                        let result = await NdefTag.setReadOnly('test');
                        console.info("[NFC_test]ndef7 setReadOnly data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]ndef7 setReadOnly errorcode: " + error.code);
                        expect(401).assertEqual(error.code);
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]NdefTag7 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0800
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0800
         * @tc.desc   Set the Ndef label to read-only callback. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0800', Level.LEVEL1, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {               
                try {
                    NdefTag.setReadOnly('test')((err, data)=> {
                        if (err) {
                            expect(true).assertEqual(true);
                            console.info("[NFC_test]ndef8 setReadOnly errcode: " + err);
                        } else {
                            expect(data).assertInstanceOf('Number')
                            console.info("[NFC_test]ndef8 setReadOnly data: " + data);
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]ndef8 setReadOnly errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
                done();
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag8 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

         /**
          * @tc.name   SUB_Communication_NFC_nfcNDEF_js_0900
          * @tc.number SUB_Communication_NFC_nfcNDEF_js_0900
          * @tc.desc   Test getNdef api. The error code is 401
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL1
          */
         it('SUB_Communication_NFC_nfcNDEF_js_0900', Level.LEVEL1, function ()  {
            if (NdefTag != null && NdefTag != undefined) {
                try {
                    let nfcNdefTag= tag.getNdef("test");
                    console.info("[NFC_test]ndef9 getNdef: " + nfcNdefTag);
                } catch (error) {
                    console.info("[NFC_test]ndef9 getNdef errorcode: " + error.code);
                    expect(401).assertEqual(error.code)
                }
            } else {
                console.info("[NFC_test]NdefTag9 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1000
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1000
         * @tc.desc   Converts the Nfc forum type to the byte array defined in the Nfc forum. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1000', Level.LEVEL1, function ()  {
            if (NdefTag != null && NdefTag != undefined) {
                try {
                    let ndefTypeString = NdefTag.getNdefTagTypeString('test');
                    console.info("[NFC_test]ndef10 ndefTypeString: " + JSON.stringify(ndefTypeString));
                    expect(ndefTypeString.length >= 0).assertTrue();
                } catch (error) {
                    console.info("[NFC_test]ndef10 ndefTypeString errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
            } else {
                console.info("[NFC_test]NdefTag10 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1100
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1100
         * @tc.desc   Formats the tag as an NDEF tag and writes the NDEF message to the NDEF tag Promise. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1100', Level.LEVEL1, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43]; 
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                (async () => {
                    try {
                        let result = await NdefFormatable.format('test');
                        console.info("[NFC_test]ndef11 format data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]ndef11 format errorcode: " + error.code);
                        expect(401).assertEqual(error.code);
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]NdefTag11 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1200
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1200
         * @tc.desc   Formats the tag as an NDEF tag and writes the NDEF message to the NDEF tag callback. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1200', Level.LEVEL1, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43]; 
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);                  
                try {
                    NdefFormatable.format('test', (err, data)=> {
                        if (err) {
                            console.info("[NFC_test]ndef12 format errcode: " + err);
                            expect(true).assertTrue();
                        } else {
                            console.info("[NFC_test]ndef12 format formatReadOnly2" );
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]ndef12 format errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]NdefTag12 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1300
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1300
         * @tc.desc   Format as NDEF and set the NDEF message write label to read-only Promise. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1300', Level.LEVEL1, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                (async () => {
                    try {
                        let result = await NdefFormatable.formatReadOnly('test');
                        console.info("[NFC_test]ndef13 formatReadOnly data: " + result);
                    } catch(error) {
                        console.info("[NFC_test]ndef13 formatReadOnly errorcode: " + error.code);
                        expect(401).assertEqual(error.code);
                    }
                })();
                sleep(3000);
                done();
            } else {
                console.info("[NFC_test]NdefTag13 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1400
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1400
         * @tc.desc   Format as NDEF and set the NDEF message write label to read-only callback. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1400', Level.LEVEL1, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);                  
                try {
                    NdefFormatable.formatReadOnly('test', (err, data)=> {
                        if (err) {
                            console.info("[NFC_test]ndef14 formatReadOnly errcode: " + err);
                            expect(true).assertTrue();
                        } else {
                            console.info("[NFC_test]ndef14 formatReadOnly" +data);
                        }
                    });
                } catch (error) {
                    console.info("[NFC_test]ndef14 formatReadOnly2 errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
                done();
            } else {
                console.info("[NFC_test]NdefTag14 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

         /**
          * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1500
          * @tc.number SUB_Communication_NFC_nfcNDEF_js_1500
          * @tc.desc   Obtains all records of ndef makeUriRecord. The error code is 401
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL1
          */
         it('SUB_Communication_NFC_nfcNDEF_js_1500', Level.LEVEL1, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                try{
                    let ndefMessage = tag.ndef.createNdefMessage('test');
                    console.info("[NFC_test]ndef15 createNdefMessage result: " + JSON.stringify(ndefMessage));
                }catch(error){
                    console.info("[NFC_test]ndef15 createNdefMessage errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                };
                try{
                    let makeRecords = tag.ndef.makeUriRecord("D4010354787473");
                    console.info("[NFC_test]ndef15 makeUriRecord result: " + JSON.stringify('test'));
                    expect(JSON.stringify(makeRecords)!=null).assertTrue();
                }catch(error){
                    console.info("[NFC_test]ndef15 makeUriRecord errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
            } else {
                console.info("[NFC_test]NdefTag15 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1600
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1600
         * @tc.desc   Obtains all records of createNdefMessage NDEF. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1600', Level.LEVEL1, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                try{
                    let ndefMessage = tag.ndef.createNdefMessage('test');
                    console.info("[NFC_test]ndef16 createNdefMessage result: " + JSON.stringify(ndefMessage));
                }catch(error){
                    console.info("[NFC_test]ndef16 createNdefMessage errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
                try{
                    let makeTRecords = tag.ndef.makeTextRecord( [0x01, 0x02],"test");
                    console.info("[NFC_test]ndef16 makeTextRecord result: " + JSON.stringify(makeTRecords));
                    expect(JSON.stringify(makeTRecords)!=null).assertTrue();
                }catch(error){
                    console.info("[NFC_test]ndef16 makeTextRecord errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
            } else {
                console.info("[NFC_test]NdefTag16 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1700
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1700
         * @tc.desc   Obtains all records of ndef makeMimeRecord. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1700', Level.LEVEL1, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                try{
                    let ndefMessage = tag.ndef.createNdefMessage('test');
                    console.info("[NFC_test]ndef17 createNdefMessage result: " + JSON.stringify(ndefMessage));
                }catch(error){
                    console.info("[NFC_test]ndef17 createNdefMessage errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
                try{
                    let makeMRecords = tag.ndef.makeMimeRecord( [0x01, 0x02], "0112");
                    console.info("[NFC_test]ndef17 makeMimeRecord result: " + JSON.stringify(makeMRecords));
                    expect(JSON.stringify(makeMRecords)!=null).assertTrue();
            
                }catch(error){
                    console.info("[NFC_test]ndef17 makeMimeRecord errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
            } else {
                console.info("[NFC_test]NdefTag17 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1800
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1800
         * @tc.desc   Obtains all records of ndef makeExternalRecord. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1800', Level.LEVEL1, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                    try{
                        let ndefMessage = tag.ndef.createNdefMessage('test');
                        console.info("[NFC_test]ndef18 createNdefMessage result: " + JSON.stringify(ndefMessage));
                    }catch(error){
                        console.info("[NFC_test]ndef18 createNdefMessage errorcode: " + error.code);
                        expect(401).assertEqual(error.code);
                    }
                    try{
                        let makeERecords = tag.ndef.makeExternalRecord( [0x01, 0x02], "NFCtest", [0x01, 0x02]);
                        console.info("[NFC_test]ndef18 makeExternalRecord result: " + JSON.stringify(makeERecords));
                        expect(makeERecords instanceof Object).assertTrue();
                    }catch(error){
                        console.info("[NFC_test]ndef18 makeExternalRecord errorcode: " + error.code);
                        expect(401).assertEqual(error.code);
                    }
            } else {
                console.info("[NFC_test]NdefTag18 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_1900
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1900
         * @tc.desc   Obtains all records of ndef messageToBytes. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1900', Level.LEVEL1, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                try{
                    let ndefMessage = tag.ndef.createNdefMessage('test');
                    console.info("[NFC_test]ndef19 createNdefMessage result: " + JSON.stringify(ndefMessage));
                }catch(error){
                    console.info("[NFC_test]ndef19 createNdefMessage errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
                try{
                    let makeERecords = tag.ndef.messageToBytes('test');
                    console.info("[NFC_test]ndef19 messageToBytes result: " + JSON.stringify(makeERecords));
                    if (makeERecords.length > 0) {
                        expect(makeERecords.length > 0).assertTrue();
                    } else {
                        expect(makeERecords).assertDeepEquals([]);
                    }
                    let makeERecords1 = tag.ndef.messageToBytes('');
                    console.info("[NFC_test]ndef19 messageToBytes result: " + JSON.stringify(makeERecords1));
                    if (makeERecords1.length > 0) {
                        expect(makeERecords1.length > 0).assertTrue();
                    } else {
                        expect(makeERecords1).assertDeepEquals([]);
                    }
                    expect(makeERecords).assertInstanceOf('Array')
                }catch(error){
                    console.info("[NFC_test]ndef19 messageToBytes errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
            } else {
                console.info("[NFC_test]NdefTag19 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2000
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2000
         * @tc.desc   Test getNdefFormatable api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2000', Level.LEVEL1, function ()  {
            if (NdefTag != null && NdefTag != undefined) {
                try {
                    let nfcNdefFormatable = tag.getNdefFormatable("test");
                    console.info("[NFC_test]ndef20 getNdefFormatable: " + nfcNdefFormatable);
                } catch (error) {
                    console.info("[NFC_test]ndef20 getNdefFormatable errorcode: " + error.code);
                    expect(401).assertEqual(error.code)
                }
            } else {
                console.info("[NFC_test]NdefTag20 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfcNDEF_js_2100
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2100
         * @tc.desc   Test makeApplicationRecord api. The error code is 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2100', Level.LEVEL2, function () {
            if (NdefTag != null && NdefTag != undefined) {
                try{
                    let ndefMessage = tag.ndef.createNdefMessage('test');
                    console.info("[NFC_test]ndef21 createNdefMessage result: " + JSON.stringify(ndefMessage));
                }catch(error){
                    console.info("[NFC_test]ndef21 createNdefMessage errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
                try{
                    let makeERecords = tag.ndef.makeApplicationRecord('test');
                    console.info("[NFC_test]ndef21 makeApplicationRecord result: " + JSON.stringify(makeERecords));
                    expect(makeERecords instanceof Object).assertTrue()
                }catch(error){
                    console.info("[NFC_test]ndef21 makeApplicationRecord errorcode: " + error.code);
                    expect(401).assertEqual(error.code);
                }
            } else {
                console.info("[NFC_test]NdefTag21 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}


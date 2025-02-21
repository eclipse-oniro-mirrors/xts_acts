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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

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
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0100
         * @tc.name Test createNdefMessage NDEF
         * @tc.desc Creates an ndef message using the original bytes.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0100', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0200
         * @tc.name Test getNdefRecords NDEF
         * @tc.desc Obtains all records of ndef messages.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0200', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0300
         * @tc.name Test createNdefMessage NDEF
         * @tc.desc Creates an ndef message using the original bytes.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0300', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0400
         * @tc.name Test getNdefTagType NDEF
         * @tc.desc Obtains the type of the Ndef tag.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0400', 0, function ()  {
            if (NdefTag != null && NdefTag != undefined) {
                let ndefTagType = NdefTag.getNdefTagType();
                console.info("[NFC_test]ndef4 ndefTagType: " + ndefTagType);
                expect(NfcForumType.NFC_FORUM_TYPE_1).assertEqual(ndefTagType);
            } else {
                console.info("[NFC_test]NdefTag4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0500
         * @tc.name Test getNdefMessage NDEF
         * @tc.desc Obtains the message read from the NDEF tag when the tag is discovered.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0500', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0600
         * @tc.name Test isNdefWritable NDEF
         * @tc.desc Check whether the NDEF label is writable,promise
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0600', 0, async function (done) {
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
                console.info("[NFC_test]ndef6 isNdefWritable data: " + data);
                expect(data).assertTrue();
                done();
            } else {
                console.info("[NFC_test]NdefTag6 = null & = undefined: ");
                expect().assertFail();
                done();
            }
            sleep(3000);
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0700
         * @tc.name Test readNdef NDEF
         * @tc.desc Read the ndef message on the tag,promise
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0700', 0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                await NdefTag.readNdef().then((data) => {
                    console.info("[NFC_test]ndef7 readNdef1 data: " + data);
                    expect(data!= null).assertTrue();
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test]ndef7 readNdef1 err: " + err);
                    expect(true).assertTrue();
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag7 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0800
         * @tc.name Test readNdef NDEF
         * @tc.desc Read the ndef message on the tag,callback
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0800', 0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                NdefTag.readNdef((err, data)=> {
                    if (err) {
                        console.info("[NFC_test]ndef8 readNdef2 err: " + err);
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("[NFC_test]ndef8 readNdef2 data: " + data);
                        expect(data!= null).assertTrue();
                        done();
                    }
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag8 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_0900
         * @tc.name Test writeNdef NDEF
         * @tc.desc Write ndef messages to this tag.promise
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_0900', 0, async function (done) {
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
                    console.info("[NFC_test]ndef9 writeNdef1 err: " + err);
                    expect(true).assertTrue();
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag9 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1000
         * @tc.name Test writeNdef NDEF
         * @tc.desc Write ndef messages to this tag.callback
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1000', 0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                let ndefMessage = tag.ndef.createNdefMessage(rawData);
                NdefTag.writeNdef(ndefMessage, (err, data)=> {
                    if (err) {
                        console.info("[NFC_test]ndef10 writeNdef2 err: " + err);
                        expect(true).assertTrue();
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
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1100
         * @tc.name Test canSetReadOnly NDEF
         * @tc.desc Check whether the NDEF tag can be set to read-only.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1100', 0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                try {
                    let canSetReadOnly = NdefTag.canSetReadOnly();
                    console.info("[NFC_test]ndef11 canSetReadOnly: " + canSetReadOnly);
                    expect(canSetReadOnly).assertTrue();             
                } catch (error) {
                    console.info('[NFC_test]NdefTag11 NdefTag error' + error)
                    expect(true).assertTrue();
                }
            } else {
                console.info("[NFC_test]NdefTag11 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1200
         * @tc.name Test setReadOnly NDEF
         * @tc.desc Set the Ndef label to read-only.Promise
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1200', 0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                await NdefTag.setReadOnly().then((data) => {
                    console.info("[NFC_test]ndef12 setReadOnly1 data: " + data);
                    expect(data).assertInstanceOf('Number')
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test]ndef12 setReadOnly1 err: " + err);
                    expect(true).assertTrue();
                    done();
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag12 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1300
         * @tc.name Test setReadOnly NDEF
         * @tc.desc Set the Ndef label to read-only.callback
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1300', 0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                NdefTag.setReadOnly((err, data)=> {
                    if (err) {
                        console.info("[NFC_test]ndef13 setReadOnly2 err: " + err);
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("[NFC_test]ndef13 setReadOnly2 data: " + data);
                        expect().assertFail();
                        done();
                    }
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag13 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1400
         * @tc.name Test getNdefTagTypeString NDEF
         * @tc.desc Converts the Nfc forum type to the byte array defined in the Nfc forum.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1400', 0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let ndefTypeString = NdefTag.getNdefTagTypeString(NfcForumType.NFC_FORUM_TYPE_1);
                console.info("[NFC_test]ndef14 ndefTypeString: " + JSON.stringify(ndefTypeString));
                expect(ndefTypeString.length >= 0).assertTrue();
            } else {
                console.info("[NFC_test]NdefTag14 = null & = undefined: ");
                expect().assertFail();
            }
            
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1500
         * @tc.name Test createNdefMessage NDEF
         * @tc.desc Formats the tag as an NDEF tag and writes the NDEF message to the NDEF tag.Promise
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1500', 0, async function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43]; 
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                await NdefFormatable.format(ndefmessage).then(() => {
                    console.info("[NFC_test]ndef15 Formatable format1 ");
                    expect().assertFail();
                }).catch((err)=> {
                    console.info("[NFC_test]ndef15 Formatable format1 err: " + err);
                    expect(true).assertTrue();
                });
            } else {
                console.info("[NFC_test]NdefTag15 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1600
         * @tc.name Test createNdefMessage NDEF
         * @tc.desc Formats the tag as an NDEF tag and writes the NDEF message to the NDEF tag.callback
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1600', 0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) { 
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43]; 
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                NdefFormatable.format(ndefmessage, (err, data)=> {
                    if (err) {
                        console.info("[NFC_test]ndef16 Formatable format err: " + err);
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("[NFC_test]ndef16 Formatable formatReadOnly2" );
                        expect().assertFail();
                        done();
                    }
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag16 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1700
         * @tc.name Test formatReadOnly NDEF
         * @tc.desc Format as NDEF and set the NDEF message write label to read-only.Promise
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1700', 0, async function () {
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
                    console.info("[NFC_test]ndef17 Formatable formatReadOnly1 err: " + err);
                    expect(true).assertTrue();
                });
            } else {
                console.info("[NFC_test]NdefTag17 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1800
         * @tc.name Test formatReadOnly NDEF
         * @tc.desc Format as NDEF and set the NDEF message write label to read-only.callback
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_1800', 0, async function (done) {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [
                    0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43
                ];
                let ndefmessage = tag.ndef.createNdefMessage(rawData);
                let NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                NdefFormatable.formatReadOnly(ndefmessage, (err, data)=> {
                    if (err) {
                        console.info("[NFC_test]ndef18 Formatable format err: " + err);
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info("[NFC_test]ndef18 Formatable formatReadOnly2" );
                        expect().assertFail();
                        done();
                    }
                });
                sleep(3000);
            } else {
                console.info("[NFC_test]NdefTag18 = null & = undefined: ");
                expect().assertFail();
            }
        })


        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_1900
         * @tc.name Test makeUriRecord NDEF
         * @tc.desc Obtains all records of ndef makeUriRecord.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
         it('SUB_Communication_NFC_nfcNDEF_js_1900', 0, function () {
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
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2000
         * @tc.name Test createNdefMessage NDEF
         * @tc.desc Obtains all records of createNdefMessage NDEF
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2000', 0, function () {
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
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2100
         * @tc.name Test makeMimeRecord NDEF
         * @tc.desc Obtains all records of ndef makeMimeRecord.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2100', 0, function () {
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
            }else{
                console.info("[NFC_test]ndef21 typeof2 ->: "+ typeof(NdefTag) );
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2200
         * @tc.name Test makeExternalRecord NDEF
         * @tc.desc Obtains all records of ndef makeExternalRecord.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2200', 0, function () {
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
         * @tc.number SUB_Communication_NFC_nfcNDEF_js_2300
         * @tc.name Test messageToBytes NDEF
         * @tc.desc Obtains all records of ndef messageToBytes.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcNDEF_js_2300', 0, function () {
            if (NdefTag != null && NdefTag != undefined) {
                let rawData = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];
                console.info("messageToBytes is object7" );
                try {
                    let ndefMessage = tag.ndef.createNdefMessage(rawData);
                    console.info("[NFC_test]ndef23 Message result4: " + JSON.stringify(ndefMessage));
                    let makeERecords = tag.ndef.messageToBytes(ndefMessage);
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

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}



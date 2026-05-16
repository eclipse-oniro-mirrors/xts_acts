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

function readerModeCb(err, tagInfo) {
    if (!err) {
        console.info("offCallback: tag found tagInfo = ", JSON.stringify(tagInfo));
    } else {
        console.error("offCallback err: " + err.message);
        return;
    }
}

let aTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
    ],
    "tagRfDiscId": 1,
    "supportedProfiles": 1,
};

let aTag1 = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "",
        },
    ],
    "tagRfDiscId": 1,
    "supportedProfiles": 1,
};

let bTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [2],
    "extrasData": [
        {
            "AppData": "A0C0", "ProtocolInfo": "131F",
        }
    ],
    "tagRfDiscId": 1,
};

let bTag1 = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [2],
    "extrasData": [
        {
            "AppData": "", "ProtocolInfo": "",
        }
    ],
    "tagRfDiscId": 1,
};

let fTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [4],
    "extrasData": [
        {
            "SystemCode": "A0C0", "Pmm": "131F",
        }
    ],
    "tagRfDiscId": 1,
};

let fTag1 = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [4],
    "extrasData": [
        {
            "SystemCode": "", "Pmm": "",
        }
    ],
    "tagRfDiscId": 1,
};

let vTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [ 5 ],
    "extrasData": [
        {
            "ResponseFlags": 0x09, "DsfId": 0x13,
        }
    ],
    "tagRfDiscId": 1,
};

var Want = {
    uid: [0x5B, 0x7F, 0xCF, 0xA9],
    technology: [1, 8],
    tagRfDiscId: 1,
    extrasData : [
        {Sak: 0x08, Atqa: '0400'},
        {MifareUltralightC: true},
        {NdefMsg: '030DD207036162632F646566676869',
         NdefForumType: 1,
         NdefTagLength: 253,
         NdefTagMode: 1}
    ]
}

let isoDepTaginfo = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 3],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {
            "HistoricalBytes": "4D54000500308693695B", "HiLayerResponse": "",
        },
    ],
    "tagRfDiscId": 1,
};

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

export default function nfcTagABFVTest() {
    describe('nfcTagABFVTest', function () {
        beforeAll(function () {
            console.info('rbeforeAll called')
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
         * @tc.name   SUB_Communication_NFC_nfctage_js_0100
         * @tc.number SUB_Communication_NFC_nfctage_js_0100
         * @tc.desc   This interface is used to obtain the NFC A tag object.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_0100', Level.LEVEL0, function ()  {
            let NfcATag ;
            try {
                NfcATag = tag.getNfcATag(aTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcATag != null && NfcATag != undefined) {
                console.info('[NFC_test] aTag1 is--<-!!!->' + JSON.stringify(NfcATag));
                expect(NfcATag != null).assertTrue();
                expect(NfcATag instanceof Object).assertTrue();
            } else {
                console.info("[NFC_test]NfcATag1 = null & = undefined: ");
                expect().assertFail();
            }
        }) 

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_0200
         * @tc.number SUB_Communication_NFC_nfctage_js_0200
         * @tc.desc   This interface is used to obtain the NFC B tag object.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_0200', Level.LEVEL0, function ()  {
            let NfcBTag ;
            try {
                NfcBTag = tag.getNfcBTag(bTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcBTag != null && NfcBTag != undefined) {
                console.info('[NFC_test] bTag2 is--<-!!!->' + JSON.stringify(NfcBTag));
                expect(NfcBTag != null).assertTrue();
                expect(NfcBTag instanceof Object).assertTrue();
            } else {
                console.info("[NFC_test]NfcBTag1 = null & = undefined: ");
                expect().assertFail();
            }
        }) 

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_0300
         * @tc.number SUB_Communication_NFC_nfctage_js_0300
         * @tc.desc   This interface is used to obtain the NFC F tag object.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_0300', Level.LEVEL0, function ()  {
            let NfcFTag ;
            try {
                NfcFTag = tag.getNfcFTag(fTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcFTag != null && NfcFTag != undefined) {
                console.info('[NFC_test] fTag3 is--<-!!!->' + JSON.stringify(NfcFTag));
                expect(NfcFTag != null).assertTrue();
                expect(NfcFTag instanceof Object).assertTrue();
            } else {
                console.info("[NFC_test]NfcFTag1 = null & = undefined: ");
                expect().assertFail();
            }
        }) 

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_0400
         * @tc.number SUB_Communication_NFC_nfctage_js_0400
         * @tc.desc   This interface is used to obtain the NFC V tag object.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_0400', Level.LEVEL0, function ()  {
            let NfcVTag ;
            try {
                NfcVTag = tag.getNfcVTag(vTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcVTag != null && NfcVTag != undefined) {
                console.info('[NFC_test] vTag4 is--<-!!!->' + JSON.stringify(NfcVTag));
                expect(NfcVTag != null).assertTrue();
                expect(NfcVTag instanceof Object).assertTrue();
            } else {
                console.info("[NFC_test]NfcVTag1 = null & = undefined: ");
                expect().assertFail();
            }
        }) 

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_0500
         * @tc.number SUB_Communication_NFC_nfctage_js_0500
         * @tc.desc   Obtains the SAK value of the NFC-A tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_0500', Level.LEVEL0, function ()  {
            let NfcATag ;
            try {
                NfcATag = tag.getNfcATag(aTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcATag != null && NfcATag != undefined) {
                let sak = NfcATag.getSak(); 
                console.info('[NFC_test] tag5 test sak data>:' + sak);
                expect(sak).assertInstanceOf('Number');
            } else {
                console.info("[NFC_test]NfcATag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_0600
         * @tc.number SUB_Communication_NFC_nfctage_js_0600
         * @tc.desc   Obtains the Atqa value of the NFC-A tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_0600', Level.LEVEL0, function ()  {
            let NfcATag ;
            try {
                NfcATag = tag.getNfcATag(aTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcATag != null && NfcATag != undefined) {
                let Atqa = NfcATag.getAtqa(); 
                console.info('[NFC_test] tag6 test Atqa data>:' + Atqa);
                if (Atqa.length > 0) {
                    expect(Atqa.length > 0).assertTrue();
                } else {
                    expect(Atqa).assertDeepEquals([]);
                }
                expect(Atqa).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcATag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_0601
         * @tc.number SUB_Communication_NFC_nfctage_js_0601
         * @tc.desc   Obtains the Atqa value of the NFC-A tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_0601', Level.LEVEL0, function ()  {
            let NfcATag ;
            try {
                NfcATag = tag.getNfcATag(aTag1);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcATag != null && NfcATag != undefined) {
                let Atqa = NfcATag.getAtqa(); 
                console.info('[NFC_test] tag6 test Atqa data>:' + Atqa);
                if (Atqa.length > 0) {
                    expect(Atqa.length > 0).assertTrue();
                } else {
                    expect(Atqa).assertDeepEquals([]);
                }
                expect(Atqa).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcATag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_0700
         * @tc.number SUB_Communication_NFC_nfctage_js_0700
         * @tc.desc   Obtains the AppData value of the NFC-B tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_0700', Level.LEVEL0, function ()  {
            let NfcBTag ;
            try {
                NfcBTag = tag.getNfcBTag(bTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcBTag != null && NfcBTag != undefined) {
                let AppData = NfcBTag.getRespAppData(); 
                console.info('[NFC_test] tag7 test AppData data>:' + AppData);
                if (AppData.length > 0) {
                    expect(AppData.length > 0).assertTrue();
                } else {
                    expect(AppData).assertDeepEquals([]);
                }
                expect(AppData).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcBTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_0701
         * @tc.number SUB_Communication_NFC_nfctage_js_0701
         * @tc.desc   Obtains the AppData value of the NFC-B tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_0701', Level.LEVEL0, function ()  {
            let NfcBTag ;
            try {
                NfcBTag = tag.getNfcBTag(bTag1);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcBTag != null && NfcBTag != undefined) {
                let AppData = NfcBTag.getRespAppData(); 
                console.info('[NFC_test] tag7 test AppData data>:' + AppData);
                if (AppData.length > 0) {
                    expect(AppData.length > 0).assertTrue();
                } else {
                    expect(AppData).assertDeepEquals([]);
                }
                expect(AppData).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcBTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

         /**
          * @tc.name   SUB_Communication_NFC_nfctage_js_0800
          * @tc.number SUB_Communication_NFC_nfctage_js_0800
          * @tc.desc   Obtains the Protocol value of the NFC-B tag.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it('SUB_Communication_NFC_nfctage_js_0800', Level.LEVEL0, function ()  {
            let NfcBTag ;
            try {
                NfcBTag = tag.getNfcBTag(bTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcBTag != null && NfcBTag != undefined) {
                let Protocol = NfcBTag.getRespProtocol(); 
                console.info('[NFC_test] tag8 test Protocol data>:' + Protocol);
                if (Protocol.length > 0) {
                    expect(Protocol.length > 0).assertTrue();
                } else {
                    expect(Protocol).assertDeepEquals([]);
                }
                expect(Protocol).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcBTag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

         /**
          * @tc.name   SUB_Communication_NFC_nfctage_js_0801
          * @tc.number SUB_Communication_NFC_nfctage_js_0801
          * @tc.desc   Obtains the Protocol value of the NFC-B tag.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it('SUB_Communication_NFC_nfctage_js_0801', Level.LEVEL0, function ()  {
            let NfcBTag ;
            try {
                NfcBTag = tag.getNfcBTag(bTag1);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcBTag != null && NfcBTag != undefined) {
                let Protocol = NfcBTag.getRespProtocol(); 
                console.info('[NFC_test] tag8 test Protocol data>:' + Protocol);
                if (Protocol.length > 0) {
                    expect(Protocol.length > 0).assertTrue();
                } else {
                    expect(Protocol).assertDeepEquals([]);
                }
                expect(Protocol).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcBTag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

         /**
          * @tc.name   SUB_Communication_NFC_nfctage_js_0900
          * @tc.number SUB_Communication_NFC_nfctage_js_0900
          * @tc.desc   Obtains the SystemCode value of the NFC-F tag.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it('SUB_Communication_NFC_nfctage_js_0900', Level.LEVEL0, function ()  {
            let NfcFTag ;
            try {
                NfcFTag = tag.getNfcFTag(fTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcFTag != null && NfcFTag != undefined) {
                let SystemCode = NfcFTag.getSystemCode(); 
                console.info('[NFC_test] tag9 test SystemCode data>:' + SystemCode);
                if (SystemCode.length > 0) {
                    expect(SystemCode.length > 0).assertTrue();
                } else {
                    expect(SystemCode).assertDeepEquals([]);
                }
                expect(SystemCode).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcFTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

         /**
          * @tc.name   SUB_Communication_NFC_nfctage_js_0901
          * @tc.number SUB_Communication_NFC_nfctage_js_0901
          * @tc.desc   Obtains the SystemCode value of the NFC-F tag.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it('SUB_Communication_NFC_nfctage_js_0901', Level.LEVEL0, function ()  {
            let NfcFTag ;
            try {
                NfcFTag = tag.getNfcFTag(fTag1);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcFTag != null && NfcFTag != undefined) {
                let SystemCode = NfcFTag.getSystemCode(); 
                console.info('[NFC_test] tag9 test SystemCode data>:' + SystemCode);
                if (SystemCode.length > 0) {
                    expect(SystemCode.length > 0).assertTrue();
                } else {
                    expect(SystemCode).assertDeepEquals([]);
                }
                expect(SystemCode).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcFTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_1000
         * @tc.number SUB_Communication_NFC_nfctage_js_1000
         * @tc.desc   Obtains the getPmm value of the NFC-F tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_1000', Level.LEVEL0, function ()  {
            let NfcFTag ;
            try {
                NfcFTag = tag.getNfcFTag(fTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcFTag != null && NfcFTag != undefined) {
                let Pmm = NfcFTag.getPmm(); 
                console.info('[NFC_test] tag10 test Pmm data>:' + Pmm);
                if (Pmm.length > 0) {
                    expect(Pmm.length > 0).assertTrue();
                } else {
                    expect(Pmm).assertDeepEquals([]);
                }
                expect(Pmm).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcFTag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_1001
         * @tc.number SUB_Communication_NFC_nfctage_js_1001
         * @tc.desc   Obtains the getPmm value of the NFC-F tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_1001', Level.LEVEL0, function ()  {
            let NfcFTag ;
            try {
                NfcFTag = tag.getNfcFTag(fTag1);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcFTag != null && NfcFTag != undefined) {
                let Pmm = NfcFTag.getPmm(); 
                console.info('[NFC_test] tag10 test Pmm data>:' + Pmm);
                if (Pmm.length > 0) {
                    expect(Pmm.length > 0).assertTrue();
                } else {
                    expect(Pmm).assertDeepEquals([]);
                }
                expect(Pmm).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcFTag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_1100
         * @tc.number SUB_Communication_NFC_nfctage_js_1100
         * @tc.desc   Obtains the ResponseFlags value of the NFC-V tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_1100', Level.LEVEL0, function ()  {
            let NfcVTag ;
            try {
                NfcVTag = tag.getNfcVTag(vTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcVTag != null && NfcVTag != undefined) {
                let ResponseFlags = NfcVTag.getResponseFlags(); 
                console.info('[NFC_test] tag11 test ResponseFlags3 data>:' + ResponseFlags);
                expect(ResponseFlags).assertInstanceOf('Number');
            } else {
                console.info("[NFC_test]NfcVTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_1200
         * @tc.number SUB_Communication_NFC_nfctage_js_1200
         * @tc.desc   Obtains the DsfId value of the NFC-V tag.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_1200', Level.LEVEL0, function ()  {
            let NfcVTag ;
            try {
                NfcVTag = tag.getNfcVTag(vTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcVTag != null && NfcVTag != undefined) {
                let DsfId = NfcVTag.getDsfId(); 
                console.info('[NFC_test] tag12 test DsfId data>:' + DsfId);
                expect(DsfId).assertInstanceOf('Number');
            } else {
                console.info("[NFC_test]NfcVTag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_1300
         * @tc.number SUB_Communication_NFC_nfctage_js_1300
         * @tc.desc   Obtains the DsfId value of the taginfo.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_1300', Level.LEVEL0, function ()  {
            let getTagtest ;
            try {
                getTagtest = tag.getTagInfo(Want);
                console.info('[NFC_test] tag13 Nfcget tagABFV gettaginfo is: ' + getTagtest)
                expect(getTagtest instanceof Object).assertTrue();
            }catch(error){
                console.info('[NFC_test] tag13 Nfcget taginfo error' + error)
                expect(true).assertTrue();
            }
            console.info('[NFC_test] tag13 test TagInfo data>:' + getTagtest);
        })

         /**
          * @tc.name   SUB_Communication_NFC_nfctage_js_1400
          * @tc.number SUB_Communication_NFC_nfctage_js_1400
          * @tc.desc   This interface is used to obtain the NFC A tag object.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it('SUB_Communication_NFC_nfctage_js_1400', Level.LEVEL0, function ()  {
            let NfcATag ;
            try {
                NfcATag = tag.getNfcA(aTag);
            } catch (error) {
                console.info('nfc gertaga error' + error + "/" + error.code)
                expect(801).assertEqual(error.code)
            }
            console.info('[NFC_test] aTag14 is--<-!!!->' + JSON.stringify(NfcATag));
            expect(NfcATag != null).assertTrue();
            expect(NfcATag instanceof Object).assertTrue();
        }) 

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_1500
         * @tc.number SUB_Communication_NFC_nfctage_js_1500
         * @tc.desc   This interface is used to obtain the NFC B tag object.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_1500', Level.LEVEL0, function ()  {
            let NfcBTag ;
            try {
                NfcBTag = tag.getNfcB(bTag);
            } catch (error) {
                console.info('nfc getNfcB error' + error + "/" + error.code)
                expect(801).assertEqual(error.code)
            }
            console.info('[NFC_test] bTag15 is--<-!!!->' + JSON.stringify(NfcBTag));
            expect(NfcBTag != null).assertTrue();
            expect(NfcBTag instanceof Object).assertTrue();
        }) 

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_1600
         * @tc.number SUB_Communication_NFC_nfctage_js_1600
         * @tc.desc   This interface is used to obtain the NFC F tag object.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_1600', Level.LEVEL0, function ()  {
            let NfcFTag ;
            try {
                NfcFTag = tag.getNfcF(fTag);
            } catch (error) {
                console.info('nfc getNfcF error' + error + "/" + error.code)
                expect(801).assertEqual(error.code)
            }
            console.info('[NFC_test] fTag16 is--<-!!!->' + JSON.stringify(NfcFTag));
            expect(NfcFTag != null).assertTrue();
            expect(NfcFTag instanceof Object).assertTrue();
        }) 

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_1700
         * @tc.number SUB_Communication_NFC_nfctage_js_1700
         * @tc.desc   This interface is used to obtain the NFC V tag object.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_1700', Level.LEVEL0, function ()  {
            let NfcVTag ;
            try {
                NfcVTag = tag.getNfcV(vTag);
            } catch (error) {
                console.info('nfc getNfcV error' + error + "/" + error.code)
                expect(801).assertEqual(error.code)
            }
            console.info('[NFC_test] vTag17 is--<-!!!->' + JSON.stringify(NfcVTag));
            expect(NfcVTag != null).assertTrue();
            expect(NfcVTag instanceof Object).assertTrue();
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_1800
         * @tc.number SUB_Communication_NFC_nfctage_js_1800
         * @tc.desc   This interface is used to obtain the isodep tag object.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_1800', Level.LEVEL0, function ()  {
            let IsoDepTag ;
            try{
                IsoDepTag = tag.getIsoDep(isoDepTaginfo);
                console.info('[NFC_test] getIsoDep18 is--<-!!!->' + JSON.stringify(IsoDepTag));
                expect(IsoDepTag != null).assertTrue();
                expect(IsoDepTag instanceof Object).assertTrue();
            }catch(error){
                console.info('nfc getIsoDep is ->' + error + "/" + error.code)
                expect(801).assertEqual(error.code)
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_1900
         * @tc.number SUB_Communication_NFC_nfctage_js_1900
         * @tc.desc   This interface is used to obtain the getNdef tag object.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_1900', Level.LEVEL0, function ()  {
            let NdefTag ;
            try {
                NdefTag = tag.getNdef(NDEFTaginfo);
                console.info('[NFC_test] getNdef19 is--<-!!!->' + JSON.stringify(NdefTag));
                expect(NdefTag != null).assertTrue();
                expect(NdefTag instanceof Object).assertTrue();
            } catch (error) {
                console.info('nfc TagTest getNdef error' + error + "/" + error.code)
                expect(801).assertEqual(error.code)
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_2000
         * @tc.number SUB_Communication_NFC_nfctage_js_2000
         * @tc.desc   This interface is used to obtain the getMifareClassic tag object.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_2000', Level.LEVEL0, function ()  {
            let MifareClassicTag ;
            try{
                MifareClassicTag = tag.getMifareClassic(mifareclassicTaginfo);
                console.info('[NFC_test] mifareClassic20 is--<-!!!->' + JSON.stringify(MifareClassicTag));
                expect(MifareClassicTag != null).assertTrue();
                expect(MifareClassicTag instanceof Object).assertTrue();
            } catch (error) {
                if (error.code == 801) {
                    console.info('nfc mifareClassic20 error' + error + "/" + error.code);
                    expect(801).assertEqual(error.code)
                } else if (error.code == 3100201) {
                    console.info('nfc mifareClassic20 error' + error + "/" + error.code);
                    expect(3100201).assertEqual(error.code)
                } else {
                    console.info('nfc mifareClassic20 failed');
                    expect().assertFail();
                }
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_2100
         * @tc.number SUB_Communication_NFC_nfctage_js_2100
         * @tc.desc   This interface is used to obtain the getMifareUltralight tag object.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_2100', Level.LEVEL0, function ()  {
            let MifareUltralightTag ;
            try {
                MifareUltralightTag = tag.getMifareUltralight(mifareUltralightTaginfo);
                console.info('[NFC_test] mifareUltralight21 is--<-!!!->' + JSON.stringify(MifareUltralightTag));
                expect(MifareUltralightTag != null).assertTrue();
                expect(MifareUltralightTag instanceof Object).assertTrue();
            } catch (error) {
                console.info('nfc mifareUltralight21 error' + error + "/" + error.code)
                expect(801).assertEqual(error.code)
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_2200
         * @tc.number SUB_Communication_NFC_nfctage_js_2200
         * @tc.desc   This interface is used to obtain the getNdefFormatable tag object.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_2200', Level.LEVEL0, function ()  {
            let NdefFormatable ;
            try {
                NdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
                console.info('[NFC_test] getNdefFormatable22 is--<-!!!->' + JSON.stringify(NdefFormatable));
                expect(NdefFormatable != null).assertTrue();
                expect(NdefFormatable instanceof Object).assertTrue();
            } catch (error) {
                console.info('nfc getNdefFormatable error' + error)
                expect().assertFail();
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_2300
         * @tc.number SUB_Communication_NFC_nfctage_js_2300
         * @tc.desc   This interface registerForegroundDispatch.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_2300', Level.LEVEL0, function ()  {
            let elementName = {
                "bundleName": "ohos.acts.communication.nfc.nfcdevice",
                "abilityName": "MainAbility",
                "moduleName": "entry"
            };
            let discTech = [1, 2, 4];
            try {
                let recvNfcTagFunc = tagInfo => {
                    console.info("[NFC_test] controller1 nfc state receive state ->" + tagInfo);
                    expect(tagInfo != null).assertTrue();
                }
                tag.registerForegroundDispatch(elementName, discTech, recvNfcTagFunc);
                console.info('[NFC_test] nfc registerForegroundDispatch pass')
                tag.unregisterForegroundDispatch(elementName);
                console.info('[NFC_test] nfc unregisterForegroundDispatch pass')
            } catch (error) {
                if (error.code == 201) {
                    console.info('nfc registerForegroundDispatch error' + error + "/" + error.code);
                    expect(201).assertEqual(error.code)
                } else if (error.code == 801) {
                    console.info('nfc registerForegroundDispatch error' + error + "/" + error.code);
                    expect(801).assertEqual(error.code)
                } else {
                    console.info('nfc registerForegroundDispatch failed');
                    expect().assertFail();
                }
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_2400
         * @tc.number SUB_Communication_NFC_nfctage_js_2400
         * @tc.desc   This interface getBarcodeTag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_2400', Level.LEVEL0, function ()  {
            let cTag = {
                "uid": [0x01, 0x02, 0x03, 0x04],
                "technology": [10],
                "supportedProfiles": 1,
            };
            try {
                let data = tag.getBarcodeTag(cTag);
                console.info("[NFC_test]24 getBarcodeTag data is " + data);
                expect(data != null).assertTrue();
            }catch(error){
                console.info("[NFC_test]24 getBarcodeTag error is " + error + "/" + error.code)
                expect(801).assertEqual(error.code)
            }
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_2500
         * @tc.number SUB_Communication_NFC_nfctage_js_2500
         * @tc.desc   This interface getBarcode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_2500', Level.LEVEL0, async function (done)  {
            let dTag = {
                "uid": [0x01, 0x02, 0x03, 0x04],
                "technology": [10],
                "supportedProfiles": 1,
            };
            await tag.getBarcodeTag(dTag).getBarcode().then((BarcodeTag) => {
                console.info("[NFC_test]25 getBarcodedata is " + BarcodeTag + " json: " + JSON.stringify(BarcodeTag));
                expect(BarcodeTag != null).assertTrue();
                expect(BarcodeTag instanceof Object).assertTrue();
                done();
            }).catch((error)=> {
                console.info("[NFC_test]25 getBarcode error is " + error)
                expect().assertFail();
                done();
            });
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_2600
         * @tc.number SUB_Communication_NFC_nfctage_js_2600
         * @tc.desc   This interface getBarcode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_2600', Level.LEVEL0, async function (done)  {
            let elementName = {
                "bundleName": "ohos.acts.communication.nfc.nfcdevice",
                "abilityName": "MainAbility",
                "moduleName": "entry"
            };

            try {
                tag.off('readerMode', elementName, readerModeCb);
            } catch (err) {
                if (err.code == 3100203) {
                    expect(3100203).assertEqual(err.code);
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2600 ERROR :  " + err + " - " + err.code);
                    done();
                }else {
                    expect().assertFail();
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2600 Fail :  ");
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_2700
         * @tc.number SUB_Communication_NFC_nfctage_js_2700
         * @tc.desc   This interface getBarcode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_2700', Level.LEVEL0, async function (done)  {
            let elementName = {
                "bundleName": "ohos.acts.communication.nfc.nfcdevice",
                "abilityName": "MainAbility",
                "moduleName": "entry"
            };
            let recvNfcTagFunc = tagInfo => {
                console.info("[NFC_test] controller1 nfc state receive state ->" + tagInfo);
                expect(tagInfo != null).assertTrue();
            }
            let discTech = [1, 2, 4];
            let interval = 200;

            try {
                tag.on('readerModeWithInterval', elementName, discTech, recvNfcTagFunc, interval);
            } catch (err) {
                if (err.code === 201) {
                    expect(201).assertEqual(err.code);
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2700 ERROR :  " + err + " - " + err.code);
                } else if (err.code === 801) {
                    expect(801).assertEqual(err.code);
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2700 ERROR :  " + err + " - " + err.code);
                } else if (err.code === 3100201) {
                    expect(3100201).assertEqual(err.code);
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2700 ERROR :  " + err + " - " + err.code);
                } else if (err.code === 3100202) {
                    expect(3100202).assertEqual(err.code);
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2700 ERROR :  " + err + " - " + err.code);
                } else {
                    expect().assertFail();
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2700 Fail :  ");
                }
            }

            try {
                tag.off('readerModeWithInterval', elementName, recvNfcTagFunc);
            } catch (err) {
                if (err.code === 201) {
                    expect(201).assertEqual(err.code);
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2700 ERROR :  " + err + " - " + err.code);
                } else if (err.code === 801) {
                    expect(801).assertEqual(err.code);
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2700 ERROR :  " + err + " - " + err.code);
                } else if (err.code === 3100201) {
                    expect(3100201).assertEqual(err.code);
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2700 ERROR :  " + err + " - " + err.code);
                } else if (err.code === 3100203) {
                    expect(3100203).assertEqual(err.code);
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2700 ERROR :  " + err + " - " + err.code);
                } else {
                    expect().assertFail();
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2700 Fail :  ");
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_Communication_NFC_nfctage_js_2800
         * @tc.number SUB_Communication_NFC_nfctage_js_2800
         * @tc.desc   This interface getBarcode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Communication_NFC_nfctage_js_2800', Level.LEVEL0, async function (done)  {
            let elementName = {
                "bundleName": "ohos.acts.communication.nfc.nfcdevice",
                "abilityName": "MainAbility",
                "moduleName": "entry"
            };
            let recvNfcTagFunc = tagInfo => {
                console.info("[NFC_test] controller1 nfc state receive state ->" + tagInfo);
                expect(tagInfo != null).assertTrue();
            }

            try {
                tag.off('readerModeWithInterval', elementName, recvNfcTagFunc);
            } catch (err) {
                if (err.code === 3100203) {
                    expect(3100203).assertEqual(err.code);
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2800 ERROR :  " + err + " - " + err.code);
                } else {
                    expect().assertFail();
                    console.info("[NFC_test] SUB_Communication_NFC_nfctage_js_2800 Fail :  ");
                }
            }
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}
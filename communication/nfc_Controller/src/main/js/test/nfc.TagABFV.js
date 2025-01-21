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

function sleep(delay) { // delay x ms
    let start = (new Date()).getTime();
    while ((new Date()).getTime() - start < delay) {
        continue;
    }
}

let NdefRecord = {
    NFC_A : 1,
    NFC_B : 2,
    ISO_DEP	 : 3,
    NFC_F : 4,
    NFC_V : 5,
    NDEF : 6,
    MIFARE_CLASSIC : 8,
    MIFARE_ULTRALIGHT : 9,
    NDEF_FORMATABLE : 10,
};

let NfcForumType = {
    NFC_FORUM_TYPE_1 : 1,
    NFC_FORUM_TYPE_2 : 2,
    NFC_FORUM_TYPE_3 : 3,
    NFC_FORUM_TYPE_4 : 4,
    MIFARE_CLASSIC : 101,
};

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
         * @tc.number SUB_Communication_NFC_nfctage_js_0100
         * @tc.name Test getNfcATag
         * @tc.desc This interface is used to obtain the NFC A tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0100', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_nfctage_js_0200
         * @tc.name Test getNfcBTag
         * @tc.desc This interface is used to obtain the NFC B tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0200', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_nfctage_js_0300
         * @tc.name Test getNfcFTag
         * @tc.desc This interface is used to obtain the NFC F tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0300', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_nfctage_js_0400
         * @tc.name Test getNfcVTag
         * @tc.desc This interface is used to obtain the NFC V tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0400', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_nfctage_js_0500
         * @tc.name Test getsak_taga
         * @tc.desc Obtains the SAK value of the NFC-A tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0500', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_nfctage_js_0600
         * @tc.name Test getAtqa_taga
         * @tc.desc Obtains the Atqa value of the NFC-A tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0600', 0, function ()  {
            let NfcATag ;
            try {
                NfcATag = tag.getNfcATag(aTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcATag != null && NfcATag != undefined) {
                let Atqa = NfcATag.getAtqa(); 
                console.info('[NFC_test] tag6 test Atqa data>:' + Atqa);
                expect(Atqa).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcATag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0700
         * @tc.name Test getAppData_tagB
         * @tc.desc Obtains the AppData value of the NFC-B tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_0700', 0, function ()  {
            let NfcBTag ;
            try {
                NfcBTag = tag.getNfcBTag(bTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcBTag != null && NfcBTag != undefined) {
                let AppData = NfcBTag.getRespAppData(); 
                console.info('[NFC_test] tag7 test AppData data>:' + AppData);
                expect(AppData).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcBTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0800
         * @tc.name Test getRespProtocol_tagB
         * @tc.desc Obtains the Protocol value of the NFC-B tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
         it('SUB_Communication_NFC_nfctage_js_0800', 0, function ()  {
            let NfcBTag ;
            try {
                NfcBTag = tag.getNfcBTag(bTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcBTag != null && NfcBTag != undefined) {
                let Protocol = NfcBTag.getRespProtocol(); 
                console.info('[NFC_test] tag8 test Protocol data>:' + Protocol);
                expect(Protocol).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcBTag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_0900
         * @tc.name Test getSystemCode_tagF
         * @tc.desc Obtains the SystemCode value of the NFC-F tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
         it('SUB_Communication_NFC_nfctage_js_0900', 0, function ()  {
            let NfcFTag ;
            try {
                NfcFTag = tag.getNfcFTag(fTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcFTag != null && NfcFTag != undefined) {
                let SystemCode = NfcFTag.getSystemCode(); 
                console.info('[NFC_test] tag9 test SystemCode data>:' + SystemCode);
                expect(SystemCode).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcFTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_1000
         * @tc.name Test getPmm_tagF
         * @tc.desc Obtains the getPmm value of the NFC-F tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1000', 0, function ()  {
            let NfcFTag ;
            try {
                NfcFTag = tag.getNfcFTag(fTag);
            }catch(error){
                console.info('Nfcget tagABFV error' + error)
            }
            if (NfcFTag != null && NfcFTag != undefined) {
                let Pmm = NfcFTag.getPmm(); 
                console.info('[NFC_test] tag10 test Pmm data>:' + Pmm);
                expect(Pmm).assertInstanceOf('Array');
            } else {
                console.info("[NFC_test]NfcFTag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_1100
         * @tc.name Test getResponseFlags_tagV
         * @tc.desc Obtains the ResponseFlags value of the NFC-V tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1100', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_nfctage_js_1200
         * @tc.name Test getDsfId_tagV
         * @tc.desc Obtains the DsfId value of the NFC-V tag.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1200', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_nfctage_js_1300
         * @tc.name Test getTagInfo
         * @tc.desc Obtains the DsfId value of the taginfo.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1300', 0, function ()  {
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
         * @tc.number SUB_Communication_NFC_nfctage_js_1400
         * @tc.name Test getNfcATag
         * @tc.desc This interface is used to obtain the NFC A tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
         it('SUB_Communication_NFC_nfctage_js_1400', 0, function ()  {
            let NfcATag ;
            try {
                NfcATag = tag.getNfcA(aTag);
            } catch (error) {
                console.info('nfc gertaga error' + error)
            }
            console.info('[NFC_test] aTag14 is--<-!!!->' + JSON.stringify(NfcATag));
            expect(NfcATag != null).assertTrue();
            expect(NfcATag instanceof Object).assertTrue();
        }) 

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_1500
         * @tc.name Test getNfcBTag
         * @tc.desc This interface is used to obtain the NFC B tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1500', 0, function ()  {
            let NfcBTag ;
            try {
                NfcBTag = tag.getNfcB(bTag);
            } catch (error) {
                console.info('nfc getNfcB error' + error)
            }
            console.info('[NFC_test] bTag15 is--<-!!!->' + JSON.stringify(NfcBTag));
            expect(NfcBTag != null).assertTrue();
            expect(NfcBTag instanceof Object).assertTrue();
        }) 

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_1600
         * @tc.name Test getNfcFTag
         * @tc.desc This interface is used to obtain the NFC F tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1600', 0, function ()  {
            let NfcFTag ;
            try {
                NfcFTag = tag.getNfcF(fTag);
            } catch (error) {
                console.info('nfc getNfcF error' + error)
            }
            console.info('[NFC_test] fTag16 is--<-!!!->' + JSON.stringify(NfcFTag));
            expect(NfcFTag != null).assertTrue();
            expect(NfcFTag instanceof Object).assertTrue();
        }) 

        /**
         * @tc.number SUB_Communication_NFC_nfctage_js_1700
         * @tc.name Test getNfcVTag
         * @tc.desc This interface is used to obtain the NFC V tag object.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfctage_js_1700', 0, function ()  {
            let NfcVTag ;
            try {
                NfcVTag = tag.getNfcV(vTag);
            } catch (error) {
                console.info('nfc getNfcV error' + error)
            }
            console.info('[NFC_test] vTag17 is--<-!!!->' + JSON.stringify(NfcVTag));
            expect(NfcVTag != null).assertTrue();
            expect(NfcVTag instanceof Object).assertTrue();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}



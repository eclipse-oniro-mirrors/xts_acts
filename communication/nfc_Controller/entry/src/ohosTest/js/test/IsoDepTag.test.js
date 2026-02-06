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
import cardEmulation from '@ohos.nfc.cardEmulation';
import controller from '@ohos.nfc.controller';

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
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

let CardType = {
    PAYMENT : "payment",
    OTHER : "other",
};

let IsoDepTag ;

export default function nfcIsoDepTagTest() {
    describe('nfcIsoDepTagTest', function () {
        beforeAll(function () {
            console.info('rbeforeAll called')
            try {
                IsoDepTag = tag.getIsoDep(isoDepTaginfo);
            } catch (error) {
                console.info('getIsoDep is ->' + error)
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
         * @tc.number SUB_Communication_NFC_nfcIsoDep_js_0100
         * @tc.name Test getHistoricalBytes IsoDep
         * @tc.desc Obtains the history bytes of a label.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0100', Level.LEVEL0, function ()  { 
            if (IsoDepTag != null && IsoDepTag != undefined) {
                let ResponseFlags = IsoDepTag.getHistoricalBytes(); 
                expect(ResponseFlags).assertInstanceOf('Array')
                console.info('[NFC_test] Isodep1 test ResponseFlags data>:' + ResponseFlags);
            } else {
                console.info("[NFC_test]IsoDepTag1 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcIsoDep_js_0200
         * @tc.name Test getHiLayerResponse IsoDep
         * @tc.desc HiLayer response byte for obtaining the tag.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0200', Level.LEVEL0, function ()  {
            if (IsoDepTag != null && IsoDepTag != undefined) {
                let HiLayerResponse = IsoDepTag.getHiLayerResponse(); 
                expect(HiLayerResponse).assertInstanceOf('Array')
                console.info('[NFC_test] Isodep2 test ResponseFlags data2>:' + HiLayerResponse);
            } else {
                console.info("[NFC_test]IsoDepTag2 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcIsoDep_js_0300
         * @tc.name Test isExtendedApduSupported IsoDep
         * @tc.desc Check whether extended APDUs are supported.Promise
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0300', Level.LEVEL0, async function (done) {
            if (IsoDepTag != null && IsoDepTag != undefined) {
                await IsoDepTag.isExtendedApduSupported().then((data) => {
                    console.info("[NFC_test] Isodep3 isExtendedApduSupported data: " + data);
                    expect(true).assertEqual(data);
                    done();
                }).catch((err)=> {
                    console.info("[NFC_test] Isodep3 isExtendedApduSupported data");
                    if (err.code == 201) {
                        console.info("[NFC_test] Isodep3 isExtendedApduSupported err: " + err + err.code);
                        expect(true).assertTrue();
                    } else if (err.code == 401) {
                        console.info("[NFC_test] Isodep3 isExtendedApduSupported err: " + err + err.code);
                        expect(true).assertTrue();
                    } else if (err.code == 3100201) {
                        console.info("[NFC_test] Isodep3 isExtendedApduSupported err: " + err + err.code);
                        expect(true).assertTrue();
                    } else if (err.code == 3100204) {
                        console.info("[NFC_test] Isodep3 isExtendedApduSupported err: " + err + err.code);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] Isodep3 isExtendedApduSupported err: " + err + err.code);
                        expect().assertFail();
                    }
                    done();
                });
            } else {
                console.info("[NFC_test]IsoDepTag3 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcIsoDep_js_0400
         * @tc.name Test isExtendedApduSupported IsoDep
         * @tc.desc Check whether extended APDUs are supported.callback
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfcIsoDep_js_0400', Level.LEVEL0, async function (done) {
            if (IsoDepTag != null && IsoDepTag != undefined) {
                console.info("[NFC_test] Isodep4 00isExtendedApduSupported: " );
                IsoDepTag.isExtendedApduSupported((err, data)=> {
                    console.info("[NFC_test] Isodep4 isExtendedApduSupported err: " + err);
                    if (err== 201) {
                        console.info("[NFC_test] Isodep4 isExtendedApduSupported err: " + err);
                        expect(true).assertTrue();
                    } else if (err == 3100201) {
                        console.info("[NFC_test] Isodep4 isExtendedApduSupported err: " + err);
                        expect(true).assertTrue();
                    } else if (err == 3100204) {
                        console.info("[NFC_test] Isodep4 isExtendedApduSupported err: " + err);
                        expect(true).assertTrue();
                    } else {
                        console.info("[NFC_test] Isodep4 isExtendedApduSupported data: " + data);
                        expect(true).assertEqual(data);           
                    }
                    done();
                });
            } else {
                console.info("[NFC_test]IsoDepTag4 = null & = undefined: ");
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfccardEmulationnfc_js_0500
         * @tc.name Test cardEmulationnfc
         * @tc.desc Whether to support a certain type of card emulation.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 0
         */
         it('SUB_Communication_NFC_nfccardEmulationnfc_js_0500', Level.LEVEL0, function ()  {
            if (IsoDepTag != null && IsoDepTag != undefined) {
                let cardEmulationnfc ;
                try {
                    cardEmulationnfc = cardEmulation.isSupported(cardEmulation.FeatureType.ESE);
                    console.info('[NFC_test] cardEmulationnfc5 type ->' + cardEmulationnfc )
                    expect(cardEmulationnfc).assertFalse();
                } catch (error) {
                    console.info('[NFC_test] cardEmulationnfc5 error' + error)
                    expect().assertFail();
                }
            } else {
                console.info("[NFC_test]IsoDepTag5 = null & = undefined: ");
                expect().assertFail();
            }
        })

       /**
         * @tc.number SUB_Communication_NFC_nfccardEmulationnfc_js_0600
         * @tc.name Test cardEmulationnfc
         * @tc.desc hasHceCapability to support a certain type of card emulation.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfccardEmulationnfc_js_0600', Level.LEVEL0, function ()  {
            let cardEmulationnfc ;
            try {
                cardEmulationnfc = cardEmulation.hasHceCapability();
                console.info('[NFC_test] cardEmulationnfc6 hasHceCapability type ->' + cardEmulationnfc )
                expect(cardEmulationnfc).assertTrue();
            } catch (error) {
                console.info('[NFC_test] cardEmulationnfc6 error' + error + "/" + error.code)
                expect(801).assertEqual(error.code);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfccardEmulationnfc_js_0700
         * @tc.name Test cardEmulationnfc
         * @tc.desc Whether to support a certain type of card isDefaultService.
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfccardEmulationnfc_js_0700', Level.LEVEL0, function ()  {
            let cardEmulationnfc ;
            let elementName = {
                "bundleName": "com.test.cardemulation",
                "abilityName": "com.test.cardemulation.MainAbility",
            };
            try {
                cardEmulationnfc = cardEmulation.isDefaultService(elementName, CardType.PAYMENT);
                console.info('[NFC_test] cardEmulationnfc7 isDefaultService type ->' + cardEmulationnfc )
                expect(cardEmulationnfc).assertFalse();
            } catch (error) {
                console.info('[NFC_test] cardEmulationnfc7 error' + error + "/" + error.code)
                expect(801).assertEqual(error.code);
            }
            try {
                cardEmulationnfc = cardEmulation.isDefaultService();
                console.info('[NFC_test] cardEmulationnfc7 isDefaultService 401 ->' + cardEmulationnfc )
                expect().assertFail();
            } catch (error) {
                console.info('[NFC_test] cardEmulationnfc7 401' + error + "/" + error.code)
                expect(401).assertEqual(error.code);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_Enumerated_js_0800
         * @tc.name Test Enumerated
         * @tc.desc Enumeration return value test
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 2
         */
         it('SUB_Communication_NFC_Enumerated_js_0800', Level.LEVEL2, function ()  {
            console.info('[nfc_test]1 PAYMENT Enumerated value test pass:' + cardEmulation.CardType.PAYMENT)
            expect(cardEmulation.CardType.PAYMENT).assertEqual("payment");
            console.info('[nfc_test]2 OTHER Enumerated value test pass:' + cardEmulation.CardType.OTHER)
            expect(cardEmulation.CardType.OTHER).assertEqual("other");
            console.info('[nfc_test]3 NFC_FORUM_TYPE_1 Enumerated value test pass:' + tag.NfcForumType.NFC_FORUM_TYPE_1)
            expect(tag.NfcForumType.NFC_FORUM_TYPE_1).assertEqual(1);
            console.info('[nfc_test]4 NFC_FORUM_TYPE_2 Enumerated value test pass:' + tag.NfcForumType.NFC_FORUM_TYPE_2)
            expect(tag.NfcForumType.NFC_FORUM_TYPE_2).assertEqual(2);
            console.info('[nfc_test]5 NFC_FORUM_TYPE_3 Enumerated value test pass:' + tag.NfcForumType.NFC_FORUM_TYPE_3)
            expect(tag.NfcForumType.NFC_FORUM_TYPE_3).assertEqual(3);
            console.info('[nfc_test]6 NFC_FORUM_TYPE_4 Enumerated value test pass:' + tag.NfcForumType.NFC_FORUM_TYPE_4)
            expect(tag.NfcForumType.NFC_FORUM_TYPE_4).assertEqual(4);
            console.info('[nfc_test]7 MIFARE_CLASSIC Enumerated value test pass:' + tag.NfcForumType.MIFARE_CLASSIC)
            expect(tag.NfcForumType.MIFARE_CLASSIC).assertEqual(101);
            console.info('[nfc_test]8 HCE Enumerated value test pass:' + cardEmulation.FeatureType.HCE)
            expect(cardEmulation.FeatureType.HCE).assertEqual(0);
            console.info('[nfc_test]9 UICC Enumerated value test pass:' + cardEmulation.FeatureType.UICC)
            expect(cardEmulation.FeatureType.UICC).assertEqual(1);
            console.info('[nfc_test]10 ESE Enumerated value test pass:' + cardEmulation.FeatureType.ESE)
            expect(cardEmulation.FeatureType.ESE).assertEqual(2);
            console.info('[nfc_test]11 TYPE_UNKNOWN Enumerated value test pass:' + tag.MifareClassicType.TYPE_UNKNOWN)
            expect(tag.MifareClassicType.TYPE_UNKNOWN).assertEqual(0);
            console.info('[nfc_test]12 TYPE_CLASSIC Enumerated value test pass:' + tag.MifareClassicType.TYPE_CLASSIC)
            expect(tag.MifareClassicType.TYPE_CLASSIC).assertEqual(1);
            console.info('[nfc_test]13 TYPE_PLUS Enumerated value test pass:' + tag.MifareClassicType.TYPE_PLUS)
            expect(tag.MifareClassicType.TYPE_PLUS).assertEqual(2);
            console.info('[nfc_test]14 TYPE_PRO Enumerated value test pass:' + tag.MifareClassicType.TYPE_PRO)
            expect(tag.MifareClassicType.TYPE_PRO).assertEqual(3);
            console.info('[nfc_test]15 MC_SIZE_MINI Enumerated value test pass:' + tag.MifareClassicSize.MC_SIZE_MINI)
            expect(tag.MifareClassicSize.MC_SIZE_MINI).assertEqual(320);
            console.info('[nfc_test]16 MC_SIZE_1K Enumerated value test pass:' + tag.MifareClassicSize.MC_SIZE_1K)
            expect(tag.MifareClassicSize.MC_SIZE_1K).assertEqual(1024);
            console.info('[nfc_test]17 MC_SIZE_2K Enumerated value test pass:' + tag.MifareClassicSize.MC_SIZE_2K)
            expect(tag.MifareClassicSize.MC_SIZE_2K).assertEqual(2048);
            console.info('[nfc_test]18 MC_SIZE_4K Enumerated value test pass:' + tag.MifareClassicSize.MC_SIZE_4K)
            expect(tag.MifareClassicSize.MC_SIZE_4K).assertEqual(4096);
            console.info('[nfc_test]19 TYPE_UNKNOWN Enumerated value test pass:' + tag.MifareUltralightType.TYPE_UNKNOWN)
            expect(tag.MifareUltralightType.TYPE_UNKNOWN).assertEqual(0);
            console.info('[nfc_test]20 TYPE_ULTRALIGHT Enumerated value pass:' + tag.MifareUltralightType.TYPE_ULTRALIGHT)
            expect(tag.MifareUltralightType.TYPE_ULTRALIGHT).assertEqual(1);
            console.info('[nfc_test]21 TYPE_ULTRALIGHT_C Enumerated value pass:' + tag.MifareUltralightType.TYPE_ULTRALIGHT_C)
            expect(tag.MifareUltralightType.TYPE_ULTRALIGHT_C).assertEqual(2);
            console.info('[nfc_test]22 TNF_EMPTY Enumerated value test pass:' + tag.TnfType.TNF_EMPTY)
            expect(tag.TnfType.TNF_EMPTY).assertEqual(0x0);
            console.info('[nfc_test]23 TNF_WELL_KNOWN Enumerated value test pass:' + tag.TnfType.TNF_WELL_KNOWN)
            expect(tag.TnfType.TNF_WELL_KNOWN).assertEqual(0x01);
            console.info('[nfc_test]24 TNF_MEDIA Enumerated value test pass:' + tag.TnfType.TNF_MEDIA)
            expect(tag.TnfType.TNF_MEDIA).assertEqual(0x02);
            console.info('[nfc_test]25 TNF_ABSOLUTE_URI Enumerated value test pass:' + tag.TnfType.TNF_ABSOLUTE_URI)
            expect(tag.TnfType.TNF_ABSOLUTE_URI).assertEqual(0x03);
            console.info('[nfc_test]26 TNF_EXT_APP Enumerated value test pass:' + tag.TnfType.TNF_EXT_APP)
            expect(tag.TnfType.TNF_EXT_APP).assertEqual(0x04);
            console.info('[nfc_test]27 TNF_UNKNOWN Enumerated value test pass:' + tag.TnfType.TNF_UNKNOWN)
            expect(tag.TnfType.TNF_UNKNOWN).assertEqual(0x05);
            console.info('[nfc_test]28 TNF_UNCHANGED Enumerated value test pass:' + tag.TnfType.TNF_UNCHANGED)
            expect(tag.TnfType.TNF_UNCHANGED).assertEqual(0x06);
            console.info('[nfc_test]29 RTD_TEXT Enumerated value pass:' + String(tag.RtdType.RTD_TEXT) + '--' + String(0x54))
            expect(String(tag.RtdType.RTD_TEXT)).assertEqual(String(0x54));
            console.info('[nfc_test]30 RTD_URI Enumerated value pass:' + String(tag.RtdType.RTD_URI) + '--' + String(0x55))
            expect(String(tag.RtdType.RTD_URI)).assertEqual(String(0x55));
            console.info('[nfc_test]31 STATE_OFF Enumerated value test pass:' + controller.NfcState.STATE_OFF)
            expect(controller.NfcState.STATE_OFF).assertEqual(1);
            console.info('[nfc_test]32 STATE_TURNING_ON Enumerated value test pass:' + controller.NfcState.STATE_TURNING_ON)
            expect(controller.NfcState.STATE_TURNING_ON).assertEqual(2);
            console.info('[nfc_test]33 STATE_ON Enumerated value test pass:' + controller.NfcState.STATE_ON)
            expect(controller.NfcState.STATE_ON).assertEqual(3);
            console.info('[nfc_test]34 STATE_TURNING_OFF Enumerated value test pass:' + controller.NfcState.STATE_TURNING_OFF)
            expect(controller.NfcState.STATE_TURNING_OFF).assertEqual(4);
            console.info('[nfc_test]35 NFC_A Enumerated value test pass:' + tag.NFC_A)
            expect(tag.NFC_A).assertEqual(1);
            console.info('[nfc_test]36 NFC_B Enumerated value test pass:' + tag.NFC_B)
            expect(tag.NFC_B).assertEqual(2);
            console.info('[nfc_test]37 ISO_DEP Enumerated value test pass:' + tag.ISO_DEP)
            expect(tag.ISO_DEP).assertEqual(3);
            console.info('[nfc_test]38 NFC_F Enumerated value test pass:' + tag.NFC_F)
            expect(tag.NFC_F).assertEqual(4);
            console.info('[nfc_test]39 NFC_V Enumerated value test pass:' + tag.NFC_V)
            expect(tag.NFC_V).assertEqual(5);
            console.info('[nfc_test]40 NDEF Enumerated value test pass:' + tag.NDEF)
            expect(tag.NDEF).assertEqual(6);
            console.info('[nfc_test]41 MIFARE_CLASSIC Enumerated value test pass:' + tag.MIFARE_CLASSIC)
            expect(tag.MIFARE_CLASSIC).assertEqual(8);
            console.info('[nfc_test]42 MIFARE_ULTRALIGHT Enumerated value test pass:' + tag.MIFARE_ULTRALIGHT)
            expect(tag.MIFARE_ULTRALIGHT).assertEqual(9);
            console.info('[nfc_test]43 NDEF_FORMATABLE Enumerated value test pass:' + tag.NDEF_FORMATABLE)
            expect(tag.NDEF_FORMATABLE).assertEqual(7);
        })

        /**
         * @tc.number SUB_Communication_NFC_nfccardEmulationnfc_js_0900
         * @tc.name Test cardEmulationnfc
         * @tc.desc Whether to support a certain type of card HceService on/off
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfccardEmulationnfc_js_0900', Level.LEVEL0, function ()  {
            let hceService = new cardEmulation.HceService();
            console.info('[NFC_test]09 hceService state is' + hceService )
            const apduCallback = (err, data) => {
                if (err){
                  console.error('[NFC_test]0900 apduCallback err is' + err );
                }else{
                    console.log('[NFC_test]0900 got apdu data ' + data );
                }
            };
            let hceElementName = {
                bundleName: "ohos.acts.communication.nfc.nfcdevice",
                abilityName: ".TestAbility",
                moduleName: "nfc_standard_test"
            }
            let aidList = ["A0000000031010", "A0000000031011"]
            console.info('[NFC_test]0900 TestCase Start hceElementName： ' + hceElementName.bundleName)
            console.info('[NFC_test]0900 TestCase Start hceElementName： ' + hceElementName.moduleName)
            try {
                console.info('[NFC_test]0900 hceServicestart beforeInvoke hceElementName： ' + hceElementName.bundleName)
                console.info('[NFC_test]0900 hceServicestart beforeInvoke hceElementName： ' + hceElementName.moduleName)
                hceService.start(hceElementName, aidList);
                console.info('[NFC_test]0900  hceServicestart afterInvoke hceElementName：  ' + hceElementName.bundleName)
                console.info('[NFC_test]0900  hceServicestart afterInvoke hceElementName：  ' + hceElementName.moduleName)
                console.info('[NFC_test]0900 hceServicestart success ')
                hceService.on("hceCmd", apduCallback)
                console.info('[NFC_test]0900 hceServiceon success ')
                sleep(900)
                hceService.off("hceCmd", apduCallback)
                console.info('[NFC_test]0900 hceServicesoff success ')
                hceService.stop(hceElementName)
                expect(true).assertTrue();
                console.info('[NFC_test]0900 hceServicestop success ')
            } catch (error) {
                console.info('[NFC_test]0900 hceService on/off error' + error + "/" + error.code)
                expect(801).assertEqual(error.code);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfccardEmulationnfc_js_1000
         * @tc.name Test cardEmulationnfc
         * @tc.desc Whether to support a certain type of card HceService transmit
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfccardEmulationnfc_js_1000', Level.LEVEL0,async function (done)  {
            let hceService = new cardEmulation.HceService();
            console.info('[NFC_test]10 hceService state is' + hceService )
            let responseData = [0x1, 0x2];
            await hceService.transmit(responseData).then(() =>{
                console.info('[NFC_test]10 hceService.transmit success ');
                done();
            }).catch((err)=> {
                console.info('[NFC_test]10 hceService.transmit err:  ' + err);
                expect().assertFail();
                done();
            })
        })

        /**
         * @tc.number SUB_Communication_NFC_nfccardEmulationnfc_js_1100
         * @tc.name Test cardEmulationnfc
         * @tc.desc Whether to support a certain type of card HceService transmit
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfccardEmulationnfc_js_1100', Level.LEVEL0,async function (done)  {
            let hceService = new cardEmulation.HceService();
            console.info('[NFC_test]11 hceService state is' + hceService )
            let responseData = [0x1, 0x2];
            hceService.transmit(responseData, (err, data) => {
                if (err){
                    console.info('[NFC_test]11 hceService.transmit err: ' + err);
                    expect().assertFail();
                    done();
                } else {
                    console.info('[NFC_test]11 hceService.transmit data: ' + data);
                    done();
                }                          
            })
        })

        /**
         * @tc.number SUB_Communication_NFC_nfccardEmulationnfc_js_1200
         * @tc.name Test cardEmulationnfc
         * @tc.desc Whether to support a certain type of card HceService on/off
         * @tc.size since 9
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfccardEmulationnfc_js_1200', Level.LEVEL0, function ()  {
            let hceService = new cardEmulation.HceService();
            console.info('[NFC_test]12 hceService state is' + hceService )
            let hceElementName = {
                bundleName: "com.example.myapplication",
                abilityName: "EntryAbility",
                moduleName: "EntrymoduleName"
            }
            let aidList = ["A0000000031010", "A0000000031011"]
            try {
                hceService.start();
                console.info('[NFC_test]12 hceServicestart success ')
                expect().assertFail();
            } catch (error) {
                console.info('[NFC_test]12 hceServicestart error' + error + "/" + error.code)
                expect(401).assertEqual(error.code);
            }

            try {
                hceService.start(hceElementName, aidList);
                console.info('[NFC_test]12 hceServicestart success ')
                hceService.stop()
                console.info('[NFC_test]12 hceServicestop success ')
                expect().assertFail();
            } catch (error) {
                console.info('[NFC_test]12 hceServicestop error' + error + "/" + error.code)
                expect(401).assertEqual(error.code);
            }
        })      

        /**
         * @tc.number SUB_Communication_NFC_nfccardEmulationnfc_js_1400
         * @tc.name Test cardEmulationnfc
         * @tc.desc Whether to support a certain type of card HceService startHCE/stopHCE/sendResponse
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 0
         */
        it('SUB_Communication_NFC_nfccardEmulationnfc_js_1400', Level.LEVEL0, function ()  {
            let hceService = new cardEmulation.HceService();
            console.info('[NFC_test]14 hceService state is' + hceService )
            let aidList = ["A0000000031010", "A0000000031011"]
            let responseData = [0x1, 0x2];
            try {
                hceService.startHCE(aidList);
                console.info('[NFC_test]14 hceService startHCE is success ')
                hceService.stopHCE();
                console.info('[NFC_test]14 hceService stopHCE is success ')
                hceService.sendResponse(responseData);
                console.info('[NFC_test]14 hceService sendResponse is success ')
            } catch (error) {
                console.info('[NFC_test]14 hceService startHCE/stopHCE/sendResponse ' + error + "/" + error.code)
                expect().assertFail();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}
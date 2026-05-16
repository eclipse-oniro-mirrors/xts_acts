/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import { ElementName } from 'bundleManager.ElementName';
import tag from '@ohos.nfc.tag';
//import NfcATag from 'tag.nfctech';
import rpc from '@ohos.rpc';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level,TestType,Size} from '../../../hypium/index';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag1: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let remoteTagService: rpc.RemoteObject = new rpc.RemoteObject("rpcTestAbility");

let want: Want = {
  "bundleName": "ohos.acts.communication.nfc.nfcdevice",
  "abilityName": "MainAbility",
  "deviceId": "1",
  "moduleName": "entry"
}

export default function nfcTagTest() {
  describe("nfcTagTest", (): void=> {
    hilog.info(domain, tag1, '%{public}s', 'describe start');
    beforeAll(() => {
      hilog.info(domain, tag1, '%{public}s','beforeAll called');
    })
    beforeEach(() => {
      hilog.info(domain, tag1, '%{public}s','beforeEach called');
    })
    afterEach(() => {
      hilog.info(domain, tag1, '%{public}s','afterEach called');
    })
    afterAll(() => {
      hilog.info(domain,tag1, '%{public}s','afterAll called');
    })
    hilog.info(domain, tag1, '%{public}s', 'describe start11');

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_0100
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_0100
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(tag.NfcForumType.MIFARE_CLASSIC).assertEqual(101);
      console.info('[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0100 NFC_A is' + tag.NFC_A);
      expect(tag.NFC_A).assertEqual(1);
      console.info('[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0100 NFC_B is' + tag.NFC_B);
      expect(tag.NFC_B).assertEqual(2);
      console.info('[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0100 ISO_DEP is' + tag.ISO_DEP);
      expect(tag.ISO_DEP).assertEqual(3);
      console.info('[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0100 NFC_F is' + tag.NFC_F);
      expect(tag.NFC_F).assertEqual(4);
      console.info('[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0100 NFC_V is' + tag.NFC_V);
      expect(tag.NFC_V).assertEqual(5);
      console.info('[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0100 NDEF is' + tag.NDEF);
      expect(tag.NDEF).assertEqual(6);
      console.info('[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0100 NDEF_FORMATABLE is' + tag.NDEF_FORMATABLE);
      expect(tag.NDEF_FORMATABLE).assertEqual(7);
      console.info('[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0100 MIFARE_CLASSIC is' + tag.MIFARE_CLASSIC);
      expect(tag.MIFARE_CLASSIC).assertEqual(8);
      console.info('[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0100 MIFARE_ULTRALIGHT is' + tag.MIFARE_ULTRALIGHT);
      expect(tag.MIFARE_ULTRALIGHT).assertEqual(9);
      console.info('[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0100 NFC_BARCODE is' + tag.NFC_BARCODE);
      expect(tag.NFC_BARCODE).assertEqual(10);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_0101
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_0101
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_0101', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[nfc_test]22 TNF_EMPTY Enumerated value test pass:' + tag.TnfType.TNF_EMPTY);
      expect(tag.TnfType.TNF_EMPTY).assertEqual(0x0);
      console.info('[nfc_test]23 TNF_WELL_KNOWN Enumerated value test pass:' + tag.TnfType.TNF_WELL_KNOWN);
      expect(tag.TnfType.TNF_WELL_KNOWN).assertEqual(0x1);
      console.info('[nfc_test]24 TNF_MEDIA Enumerated value test pass:' + tag.TnfType.TNF_MEDIA);
      expect(tag.TnfType.TNF_MEDIA).assertEqual(0x2);
      console.info('[nfc_test]25 TNF_ABSOLUTE_URI Enumerated value test pass:' + tag.TnfType.TNF_ABSOLUTE_URI);
      expect(tag.TnfType.TNF_ABSOLUTE_URI).assertEqual(0x3);
      console.info('[nfc_test]26 TNF_EXT_APP Enumerated value test pass:' + tag.TnfType.TNF_EXT_APP);
      expect(tag.TnfType.TNF_EXT_APP).assertEqual(0x4);
      console.info('[nfc_test]27 TNF_UNKNOWN Enumerated value test pass:' + tag.TnfType.TNF_UNKNOWN);
      expect(tag.TnfType.TNF_UNKNOWN).assertEqual(0x5);
      console.info('[nfc_test]28 TNF_UNCHANGED Enumerated value test pass:' + tag.TnfType.TNF_UNCHANGED);
      expect(tag.TnfType.TNF_UNCHANGED).assertEqual(0x6);
      console.info('[nfc_test] SUB_COMMUNICATION_NFC_Tag_static_0100 NFC_FORUM_TYPE_1 is ' + tag.NfcForumType.NFC_FORUM_TYPE_1);
      expect(tag.NfcForumType.NFC_FORUM_TYPE_1).assertEqual(1);
      console.info('[nfc_test] SUB_COMMUNICATION_NFC_Tag_static_0100 NFC_FORUM_TYPE_2 is ' + tag.NfcForumType.NFC_FORUM_TYPE_2);
      expect(tag.NfcForumType.NFC_FORUM_TYPE_2).assertEqual(2);
      console.info('[nfc_test] SUB_COMMUNICATION_NFC_Tag_static_0100 NFC_FORUM_TYPE_3 is ' + tag.NfcForumType.NFC_FORUM_TYPE_3);
      expect(tag.NfcForumType.NFC_FORUM_TYPE_3).assertEqual(3);
      console.info('[nfc_test] SUB_COMMUNICATION_NFC_Tag_static_0100 NFC_FORUM_TYPE_4 is ' + tag.NfcForumType.NFC_FORUM_TYPE_4);
      expect(tag.NfcForumType.NFC_FORUM_TYPE_4).assertEqual(4);
      console.info('[nfc_test]29 RTD_TEXT Enumerated value pass:' + String(tag.RTD_TEXT) + '--' + String(0x54))
      expect(String(tag.RTD_TEXT)).assertEqual(String(0x54));
      console.info('[nfc_test]30 RTD_URI Enumerated value pass:' + String(tag.RTD_URI) + '--' + String(0x55))
      expect(String(tag.RTD_URI)).assertEqual(String(0x55));
      console.info('[nfc_test]11 TYPE_UNKNOWN Enumerated value test pass:' + tag.MifareClassicType.TYPE_UNKNOWN);
      expect(tag.MifareClassicType.TYPE_UNKNOWN).assertEqual(0);
      console.info('[nfc_test]12 TYPE_CLASSIC Enumerated value test pass:' + tag.MifareClassicType.TYPE_CLASSIC);
      expect(tag.MifareClassicType.TYPE_CLASSIC).assertEqual(1);
      console.info('[nfc_test]13 TYPE_PLUS Enumerated value test pass:' + tag.MifareClassicType.TYPE_PLUS);
      expect(tag.MifareClassicType.TYPE_PLUS).assertEqual(2);
      console.info('[nfc_test]14 TYPE_PRO Enumerated value test pass:' + tag.MifareClassicType.TYPE_PRO);
      expect(tag.MifareClassicType.TYPE_PRO).assertEqual(3);
      console.info('[nfc_test]15 MC_SIZE_MINI Enumerated value test pass:' + tag.MifareClassicSize.MC_SIZE_MINI);
      expect(tag.MifareClassicSize.MC_SIZE_MINI).assertEqual(320);
      console.info('[nfc_test]16 MC_SIZE_1K Enumerated value test pass:' + tag.MifareClassicSize.MC_SIZE_1K);
      expect(tag.MifareClassicSize.MC_SIZE_1K).assertEqual(1024);
      console.info('[nfc_test]17 MC_SIZE_2K Enumerated value test pass:' + tag.MifareClassicSize.MC_SIZE_2K);
      expect(tag.MifareClassicSize.MC_SIZE_2K).assertEqual(2048);
      console.info('[nfc_test]18 MC_SIZE_4K Enumerated value test pass:' + tag.MifareClassicSize.MC_SIZE_4K);
      expect(tag.MifareClassicSize.MC_SIZE_4K).assertEqual(4096);
      console.info('[nfc_test]19 TYPE_UNKNOWN Enumerated value test pass:' + tag.MifareUltralightType.TYPE_UNKNOWN);
      expect(tag.MifareUltralightType.TYPE_UNKNOWN).assertEqual(0);
      console.info('[nfc_test]20 TYPE_ULTRALIGHT Enumerated value pass:' + tag.MifareUltralightType.TYPE_ULTRALIGHT);
      expect(tag.MifareUltralightType.TYPE_ULTRALIGHT).assertEqual(1);
      console.info('[nfc_test]21 TYPE_ULTRALIGHT_C Enumerated value pass:' + tag.MifareUltralightType.TYPE_ULTRALIGHT_C);
      expect(tag.MifareUltralightType.TYPE_ULTRALIGHT_C).assertEqual(2);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_0200
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_0200
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let aTag: tag.TagInfo = {
        "uid": [0x01, 0x02, 0x03, 0x04],
        "technology": [1],
        "extrasData": [
          {
            "Sak": 0x08, "Atqa": "B000",
          },
        ],
        "tagRfDiscId": 1,
        "remoteTagService": remoteTagService,
      };
      hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0200 is :');
      let nfcATag: tag.NfcATag;
      try {
        nfcATag = tag.getNfcA(aTag);
      } catch (error: BusinessError) {
        if (error.code === 801) {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0200 error is :  ' + error + " - " + error.code);
          expect(801).assertEqual(error.code);
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0200 failed ');
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_0300
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_0300
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let bTag: tag.TagInfo = {
        "uid": [0x01, 0x02, 0x03, 0x04],
        "technology": [2],
        "extrasData": [
          {
            "AppData": "A0C0", "ProtocolInfo": "131F",
          }
        ],
        "tagRfDiscId": 1,
        "remoteTagService": remoteTagService,
      };
      hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0300 is :');
      let nfcBTag: tag.NfcBTag;
      try {
        nfcBTag = tag.getNfcB(bTag);
      } catch (error: BusinessError) {
        if (error.code === 801) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0300 error is ' + error.code + " - " + error);
          expect(801).assertEqual(error.code)
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0300 failed ');
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_0400
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_0400
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        let fTag: tag.TagInfo = {
          "uid": [0x01, 0x02, 0x03, 0x04],
          "technology": [4],
          "extrasData": [
            {
              "SystemCode": "A0C0", "Pmm": "131F",
            }
          ],
          "tagRfDiscId": 1,
          "remoteTagService": remoteTagService,
        };
        let nfcFTag: tag.NfcFTag;
         hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0400 is :');
        try {
          nfcFTag = tag.getNfcF(fTag);
        } catch (error: BusinessError) {
          if (error.code === 801) {
            hilog.info(domain, tag1,'{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0400 error is ' + error.code + " - " + error);
            expect(801).assertEqual(error.code)
          } else {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0400 failed ');
            expect().assertFail();
          }
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_0500
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_0500
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let vTag: tag.TagInfo = {
        "uid": [0x01, 0x02, 0x03, 0x04],
        "technology": [ 5 ],
        "extrasData": [
          {
            "ResponseFlags": 0x09, "DsfId": 0x13,
          }
        ],
        "tagRfDiscId": 1,
        "remoteTagService": remoteTagService,
      };
      let nfcVTag: tag.NfcVTag ;
      hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0500 is :');
      try {
        nfcVTag = tag.getNfcV(vTag);
      } catch (error: BusinessError) {
        if (error.code === 801) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0500 error is ' + error.code + " - " + error);
          expect(801).assertEqual(error.code)
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0500 failed ');
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_0600
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_0600
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let isoDepTaginfo: tag.TagInfo = {
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
        "remoteTagService": remoteTagService,
      };
      let nfcIsoDepTag: tag.IsoDepTag;
      try{
        nfcIsoDepTag = tag.getIsoDep(isoDepTaginfo);
      }catch(error: BusinessError){
        if (error.code === 801) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0600 error is ' + error.code + " - " + error);
          expect(801).assertEqual(error.code)
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0600 failed ');
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_0700
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_0700
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let NDEFTaginfo: tag.TagInfo = {
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
        "remoteTagService": remoteTagService,
      };
      hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0700 is :');
      let nfcNdefTag: tag.NdefTag;
      try {
        nfcNdefTag = tag.getNdef(NDEFTaginfo);
        hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_07001 is :');
      } catch (error: BusinessError) {
        if (error.code === 801) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0700 error is ' + error.code + " - " + error);
          expect(801).assertEqual(error.code);
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0700 failed ');
          expect().assertFail();
        }
      }
      hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_07002 is :');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_0800
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_0800
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let mifareclassicTaginfo: tag.TagInfo = {
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
        "remoteTagService": remoteTagService,
      };
      let nfcMifareClassicTag: tag.MifareClassicTag ;
      try{
        nfcMifareClassicTag = tag.getMifareClassic(mifareclassicTaginfo);
      } catch (error: BusinessError) {
        if (error.code === 801) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0800 error is ' + error.code + " - " + error);
          expect(801).assertEqual(error.code)
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0800 failed ');
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_0900
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_0900
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_0900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let mifareUltralightTaginfo: tag.TagInfo = {
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
        "remoteTagService": remoteTagService,
      };
      let nfcMifareUltralightTag: tag.MifareUltralightTag;
      try {
        nfcMifareUltralightTag = tag.getMifareUltralight(mifareUltralightTaginfo);
      } catch (error: BusinessError) {
        if (error.code === 801) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0900 error is ' + error.code + " - " + error);
          expect(801).assertEqual(error.code)
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0900 failed ');
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_1000
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_1000
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_1000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let NdefFormatableTag: tag.TagInfo = {
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
        "remoteTagService": remoteTagService,
      };
      let nfcNdefFormatable: tag.NdefFormatableTag;
      try {
        nfcNdefFormatable = tag.getNdefFormatable(NdefFormatableTag);
      } catch (error: BusinessError) {
        if (error.code === 801) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1000 error is ' + error.code + " - " + error);
          expect(801).assertEqual(error.code)
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1000 failed ');
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_1100
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_1100
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let cTag: tag.TagInfo = {
        "uid": [0x01, 0x02, 0x03, 0x04],
        "technology": [10],
        "extrasData": [
          {
            "Sak": 0x08, "Atqa": "B000",
          },
          {

          },
        ],
        "tagRfDiscId": 1,
        "remoteTagService": remoteTagService,
      };
      try {
        let data: tag.BarcodeTag = tag.getBarcodeTag(cTag);
      }catch(error: BusinessError){
        if (error.code === 801) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1100 error is ' + error.code + " - " + error);
          expect(801).assertEqual(error.code);
        } else if (error.code === 3100201) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1100 error is ' + error.code + " - " + error);
          expect(3100201).assertEqual(error.code);
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1100 failed ');
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_1200
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_1200
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let nfcTagtest: tag.TagInfo ;
      try {
        nfcTagtest = tag.getTagInfo(want);
        hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1200 Nfcget tagABFV gettaginfo is:  ' + nfcTagtest);
        expect(nfcTagtest instanceof Object).assertTrue();
      }catch(error: BusinessError){
        if (error.code === 801) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1100 error is ' + error.code + " - " + error);
          expect(801).assertEqual(error.code);
        } else {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1200 Nfcget taginfo error:  ' + error);
          expect().assertFail();
        }
      }
      console.info('[NFC_test] tag13 test TagInfo data>:' + nfcTagtest);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_1300
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_1300
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_1300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let elementName: ElementName = {
        "bundleName": "ohos.acts.communication.nfc.nfcdevice",
        "abilityName": "MainAbility",
        "moduleName": "entry"
      };
      let discTech: Array<int> = [1, 2, 4];
      let AsyncCallback:(err: BusinessError<void> | null, data: tag.TagInfo | undefined) => void = (
        err: BusinessError<void> | null, data: tag.TagInfo | undefined) => {
        hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1300 reregisterForegroundDispatch finish ');
      }
      try {
        tag.registerForegroundDispatch(elementName, discTech, AsyncCallback);
      } catch(error: BusinessError) {
        if (error.code === 801) {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1300 registerForegroundDispatch error:  ' + error + error.code);
          expect(801).assertEqual(error.code)
        } else if (error.code === 3100201) {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1300 registerForegroundDispatch error:  ' + error + error.code);
          expect(3100201).assertEqual(error.code)
        } else {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1300 registerForegroundDispatch fail:  ' + error + error.code);
          expect().assertFail();
        }
      }
      hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1300 registerForegroundDispatch finish ');

      try {
        hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1300 unregisterForegroundDispatch ');
        tag.unregisterForegroundDispatch(elementName);
      } catch (error: BusinessError) {
        if (error.code === 801) {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1300 unregisterForegroundDispatch error:  ' + error + error.code);
          expect(801).assertEqual(error.code)
        } else if (error.code === 3100201) {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1300 unregisterForegroundDispatch error:  ' + error + error.code);
          expect(3100201).assertEqual(error.code)
        } else {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1300 unregisterForegroundDispatch fail:  ' + error + error.code);
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_static_1400
     * @tc.name SUB_COMMUNICATION_NFC_Tag_static_1400
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_static_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let elementName: ElementName = {
        "bundleName": "ohos.acts.communication.nfc.nfcdevice",
        "abilityName": "MainAbility",
        "moduleName": "entry"
      };
      let discTech: Array<int> = [1, 2, 4];
      let AsyncCallback:(err: BusinessError<void> | null, data: tag.TagInfo | undefined) => void = (
        err: BusinessError<void> | null, data: tag.TagInfo | undefined) => {
        hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1300 onReaderMode/offReaderMode finish ');
      }

      try {
        tag.onReaderMode(elementName, discTech, AsyncCallback);
      } catch (err: BusinessError) {
        if (err.code === 3100201) {
          expect(3100201).assertEqual(err.code);
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1400 onReaderMode err :  ' + err + " - " + err.code);
          done();
        } else if (err.code === 3100203) {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1400 onReaderMode err :  ' + err + " - " + err.code);
          expect(3100203).assertEqual(err.code)
        } else {
          expect().assertFail();
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag  _static_1400 onReaderMode fail :  ');
        }
      }
      try {
        tag.offReaderMode(elementName, AsyncCallback);
      } catch (err: BusinessError) {
        if (err.code === 3100201) {
          expect(3100201).assertEqual(err.code);
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1400 onReaderMode err :  ' + err + " - " + err.code);
          done();
        } else if (err.code === 3100203) {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1400 onReaderMode err :  ' + err + " - " + err.code);
          expect(3100203).assertEqual(err.code)
        } else {
          expect().assertFail();
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1400 onReaderMode fail :  ');
        }
      }
      done();
    })

    /**
       * @tc.number SUB_COMMUNICATION_NFC_Tag_static_1500
       * @tc.name SUB_COMMUNICATION_NFC_Tag_static_1500
       * @tc.desc This interface getBarcode
       * @tc.size since 16
       * @tc.type Function
       * @tc.level Level 0
       */
    it('SUB_COMMUNICATION_NFC_Tag_static_1500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let dTag: tag.TagInfo = {
        "uid": [0x01, 0x02, 0x03, 0x04],
        "technology": [10],
        "extrasData": [
          {
            "AppData": "A0C0", "ProtocolInfo": "131F",
          }
        ],
        "tagRfDiscId": 1,
        "remoteTagService": remoteTagService,
      };
      try {
        await tag.getBarcodeTag(dTag).getBarcode().then(() => {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1500 getBarcode: ');
        })
      } catch (error: BusinessError) {
        if (error.code === 201) {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1500 getBarcode error is ' + error.code + " - " + error);
          expect(201).assertEqual(error.code);
        } else if (error.code === 3100201) {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1500 getBarcode error is ' + error.code + " - " + error);
          expect(3100201).assertEqual(error.code);
        } else if (error.code === 3100204) {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1500 getBarcode error is ' + error.code + " - " + error);
          expect(3100204).assertEqual(error.code);
        } else {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_1500 getBarcode error is ' + error.code + " - " + error);
          expect().assertFail();
        }
      }
      done();
    })

    console.info("*************[nfc_test] start nfc js unit test end*************");
  })
}
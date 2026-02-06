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
import tag from '@ohos.nfc.tag';
import rpc from '@ohos.rpc';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level,TestType,Size} from '../../../hypium/index';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag1: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let remoteTagService: rpc.RemoteObject = new rpc.RemoteObject("rpcTestAbility");

let rawData: Array<int> = [0xD1, 0x01, 0x03, 0x54, 0x4E, 0x46, 0x43];

let ndefRecordInfo: tag.NdefRecord = {
  "tnf": 1,
  "rtdType": [0x01, 0x02],
  "id": [0x01],
  "payload": [1],
}

let ndefRecords: Array<tag.NdefRecord> = [
  {
    "tnf": 1,
    "rtdType": [0x54],
    "id": [0x01, 0x02],
    "payload": [0x00, 0xa4, 0x04],
  },
  {
    "tnf": 2,
    "rtdType": [0x55],
    "id": [0x03, 0x04],
    "payload": [0x00, 0xa4, 0x04],
  }
];

let ndefTagInfo: tag.TagInfo = {
  "uid": [0x01, 0x02, 0x03, 0x04],
  "technology": [1, 6],
  "extrasData": [
    {
      "NdefMsg": "D4010354787473", "NdefForumType": 1, "NdefTagLength":255, "NdefTagMode": 1,
    }
  ],
  "tagRfDiscId": 1,
  "remoteTagService": remoteTagService,
};

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

let ndefTag:tag.NdefTag;
let ndefFormatable:tag.NdefFormatableTag;

export default function nfcNDEFTagTest() {
  describe("nfcNDEFTagTest", (): void=> {
    hilog.info(domain, tag1, '%{public}s', 'describe start');
    beforeAll(() => {
      try {
        ndefTag = tag.getNdef(ndefTagInfo);
      } catch (error) {
        error = error as BusinessError;
        if (error.code === 801) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0700 error is ' + error.code + " - " + error);
          expect(801).assertEqual(error.code);
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Tag_static_0700 failed ');
          expect().assertFail();
        }
      }
      try {
        ndefFormatable = tag.getNdefFormatable(NdefFormatableTag);
      } catch (error) {
        error = error as BusinessError;
        if (error.code === 801) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] beforeAll error is ' + error.code + " - " + error);
          expect(801).assertEqual(error.code)
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] beforeAll failed ');
          expect().assertFail();
        }
      }
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
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_0100
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_0100
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        try {
          let ndefMessage: tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0100 ndefMessage is: ' + ndefMessage);
          let makeUriRecord: tag.NdefRecord = tag.ndef.makeUriRecord("D4010354787473");
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0100 makeUriRecord is: ' + makeUriRecord);
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0100 error is ' + error + " - " + error.code);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })
    
    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_0200
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_0200
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        try {
          let ndefMessage: tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0200 ndefMessage is: ' + ndefMessage);
          let makeTRecords: tag.NdefRecord = tag.ndef.makeTextRecord("test112HW", "test");
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0200 makeTRecords is: ' + makeTRecords);
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0200 error is ' + error + " - " + error.code);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_0300
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_0300
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let bundleName: string = "com.test.cardemulation";
        try {
          let ndefMessage: tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0300 ndefMessage is: ' + ndefMessage);
          let makeApplicationRecord: tag.NdefRecord = tag.ndef.makeApplicationRecord(bundleName);
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0300 makeApplicationRecord is: ' + makeApplicationRecord);
          if (makeApplicationRecord != undefined) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0300 makeApplicationRecord rtdType: ' + makeApplicationRecord.rtdType);
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0300 makeApplicationRecord payload: ' +  makeApplicationRecord.payload);
          } else {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0300 makeApplicationRecord ndefRecord: ' + makeApplicationRecord);
            expect().assertFail();
          }
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0300 error is ' + error + " - " + error.code);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_0400
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_0400
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let mimeType: string = "text/plain";
      let mimeData: Array<int> = [0x01, 0x02, 0x03, 0x04];
      if (ndefTag != null && ndefTag != undefined) {
        try {
          let ndefMessage: tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0400 ndefMessage is: ' + ndefMessage);
          let makeMimeRecord: tag.NdefRecord = tag.ndef.makeMimeRecord(mimeType, mimeData);
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0400 makeMimeRecord is: ' + makeMimeRecord);
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0400 error is ' + error + " - " + error.code);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_0500
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_0500
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        try {
          let ndefMessage: tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0500 ndefMessage is: ' + ndefMessage);
          let makeExternalRecord: tag.NdefRecord = tag.ndef.makeExternalRecord("NFC", "NFCtest", [0x01, 0x02]);
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0500 makeExternalRecord is: ' + makeExternalRecord);
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0500 error is ' + error + " - " + error.code);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_0600
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_0600
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        try {
          let ndefMessage: tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0600 ndefMessage: ' + ndefMessage);
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0600 error is ' + error + " - " + error.code);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_0700
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_0700
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        try {
          let ndefMessage: tag.NdefMessage = tag.ndef.createNdefMessageByRecords(ndefRecords);
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0700 ndefMessage: ' + ndefMessage);
          if (ndefMessage != null && ndefMessage != undefined) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0700 ndefMessage: ' + ndefMessage);
          } else  {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefMessage = null & = undefined:');
            expect().assertFail();
          }
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0700 error is ' + error + " - " + error.code);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_0800
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_0800
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        try {
          let ndefMessage: tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0800 ndefMessage: ' + ndefMessage);
          let messageToBytes: Array<int> = tag.ndef.messageToBytes(ndefMessage);
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0800 messageToBytes: ' + messageToBytes);
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0800 error is ' + error + " - " + error.code);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_0900
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_0900
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_0900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        try {
          let ndefMessage: tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0900 ndefMessage: ' + ndefMessage);
          if (ndefMessage != null && ndefMessage != undefined) {
            let getNdefRecords: Array<tag.NdefRecord> = ndefMessage.getNdefRecords();
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0900 getNdefRecords: ' + getNdefRecords);
          } else {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefMessage = null & = undefined:');
            expect().assertFail();
          }
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_0900 error is ' + error + " - " + error.code);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1000
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_1000
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let ndefTagType: tag.NfcForumType = ndefTag.getNdefTagType();
        expect(tag.NfcForumType.NFC_FORUM_TYPE_1).assertEqual(ndefTagType);
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1100
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_1100
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        try {
          let getMessage: tag.NdefMessage = ndefTag.getNdefMessage();
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1100 NdefMessage: ' + getMessage);
          expect(getMessage != null).assertTrue();
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1100 ndefMessage error is ' + error + " - " + error.code);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1200
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_1200
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let data: boolean = ndefTag.isNdefWritable();
        if (data == true) {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1200 data: ' + data);
          expect(data).assertTrue();
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1200 data: ' + data);
          expect(data).assertFalse();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1300
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_1300
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        try {
          await ndefTag.readNdef().then((data) => {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1300 readNdef:');
          });
        } catch (error) {
          error = error as BusinessError;
          if (error.code === 201) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1300 readNdef error is ' + error.code + " - " + error);
            expect(201).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1300 readNdef error is ' + error.code + " - " + error);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1300 readNdef error is ' + error.code + " - " + error);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1300 readNdef error is ' + error.code + " - " + error);
            expect().assertFail();
          }
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1400
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_1400
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let AsyncCallback:(error: BusinessError<void> | null, data: tag.NdefMessage | undefined) => void = (
          error:BusinessError<void> | null, data: tag.NdefMessage | undefined) => {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1400 readNdef finish ');
        }
        try {
          ndefTag.readNdef(AsyncCallback);
        } catch (error) {
          error = error as BusinessError;
          if (error.code === 201) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1400 readNdef error is ' + error.code + " - " + error);
            expect(201).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1400 readNdef error is ' + error.code + " - " + error);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1400 readNdef error is ' + error.code + " - " + error);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1400 readNdef error is ' + error.code + " - " + error);
            expect().assertFail();
          }
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1500
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_1500
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let ndefMessage:tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
        try {
          await ndefTag.writeNdef(ndefMessage).then(() => {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1500 writeNdef finish:');
          });
        } catch (error) {
          error = error as BusinessError;
          if (error.code === 201) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1500 writeNdef error is ' + error.code + " - " + error);
            expect(201).assertEqual(error.code);
          }  else if (error.code === 3100201) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1500 writeNdef error is ' + error.code + " - " + error);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1500 writeNdef error is ' + error.code + " - " + error);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1500 writeNdef error is ' + error.code + " - " + error);
            expect().assertFail();
          }
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1600
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_1600
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let ndefMessage:tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
        let AsyncCallback:(error: BusinessError<void> | null, data: tag.NdefMessage | undefined) => void = (
          error:BusinessError<void> | null, data: tag.NdefMessage | undefined) => {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1600 writeNdef finish ');
        }
        try {
          ndefTag.writeNdef(ndefMessage,AsyncCallback);
        } catch (error) {
          error = error as BusinessError;
          if (error.code === 201) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1600 writeNdef error is ' + error.code + " - " + error);
            expect(201).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1600 writeNdef error is ' + error.code + " - " + error);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1600 writeNdef error is ' + error.code + " - " + error);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1600 writeNdef error is ' + error.code + " - " + error);
            expect().assertFail();
          }
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1700
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_1700
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        try {
          let canSetReadOnly: boolean = ndefTag.canSetReadOnly();
          if (canSetReadOnly == true) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1700 canSetReadOnly is ' + canSetReadOnly);
            expect(canSetReadOnly).assertTrue();
          } else {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1700 canSetReadOnly is ' + canSetReadOnly);
            expect(canSetReadOnly).assertFalse();
          }
        } catch (error) {
          error = error as BusinessError;
          if (error.code === 201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1700 canSetReadOnly error is ' + error + " - " + error.code);
            expect(201).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1700 canSetReadOnly error is ' + error + " - " + error.code);
            expect(3100201).assertEqual(error.code);
          } else {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1700 canSetReadOnly fail is ' + error + " - " + error.code);
            expect().assertFail();
          }
          done();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1800
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_1800
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        try {
          await ndefTag.setReadOnly().then((data) => {
            hilog.info(domain, tag1,'{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1800 :');
          });
        } catch (error) {
          error = error as BusinessError;
          if (error.code === 201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1800  error is ' + error + " - " + error.code);
            expect(201).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1800 error is ' + error + " - " + error.code);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1800 error is ' + error + " - " + error.code);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1800 fail is ' + error + " - " + error.code);
            expect().assertFail();
          }
          done();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_1900
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_1900
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_1900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let AsyncCallback:(error: BusinessError<void> | null, data: undefined) => void = (error: BusinessError<void> | null, data: undefined) => {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1900  ');
        }
        try {
          ndefTag.setReadOnly(AsyncCallback);
        }catch (error) {
          error = error as BusinessError;
          if (error.code === 201) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1900  error is ' + error + " - " + error.code);
            expect(201).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1900 error is ' + error + " - " + error.code);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1900 error is ' + error + " - " + error.code);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_1900  fail is ' + error + " - " + error.code);
            expect().assertFail();
          }
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_2000
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_2000
     * @tc.desc Converts the Nfc forum type to the byte array defined in the Nfc forum.
     * @tc.size since 9
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_2000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let ndefTypeString: string = ndefTag.getNdefTagTypeString(tag.NfcForumType.NFC_FORUM_TYPE_1);
        hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2000 ndefTypeString is :' + ndefTypeString);
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_2100
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_2100
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_2100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let ndefMessage:tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
        let ndefFormatable: tag.NdefFormatableTag = tag.getNdefFormatable(NdefFormatableTag);
        try {
          await ndefFormatable.format(ndefMessage).then(() => {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2100 format finish:');
          });
        } catch (error) {
          error = error as BusinessError;
          if (error.code === 201) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2100 format error is ' + error.code + " - " + error);
            expect(201).assertEqual(error.code);
          }  else if (error.code === 3100201) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2100 format error is ' + error.code + " - " + error);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2100 format error is ' + error.code + " - " + error);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2100 format error is ' + error.code + " - " + error);
            expect().assertFail();
          }
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_2200
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_2200
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_2200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let ndefMessage:tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
        let AsyncCallback:(error: BusinessError<void> | null, data: tag.NdefMessage | undefined) => void = (
          error:BusinessError<void> | null, data: tag.NdefMessage | undefined) => {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2200 format finish ');
        }
        try {
          ndefFormatable.format(ndefMessage, AsyncCallback);
        } catch (error) {
          error = error as BusinessError;
          if (error.code === 201) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2200 format error is ' + error.code + " - " + error);
            expect(201).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2200 format error is ' + error.code + " - " + error);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2200 format error is ' + error.code + " - " + error);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2200 format error is ' + error.code + " - " + error);
            expect().assertFail();
          }
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_2300
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_2300
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_2300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let ndefMessage:tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
        try {
          await ndefFormatable.formatReadOnly(ndefMessage).then(() => {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2300 formatReadOnly finish:');
          });
        } catch (error) {
          error = error as BusinessError;
          if (error.code === 201) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2300 formatReadOnly error is ' + error.code + " - " + error);
            expect(201).assertEqual(error.code);
          }  else if (error.code === 3100201) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2300 formatReadOnly error is ' + error.code + " - " + error);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2300 formatReadOnly error is ' + error.code + " - " + error);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2300 formatReadOnly error is ' + error.code + " - " + error);
            expect().assertFail();
          }
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_NDEFTag_static_2400
     * @tc.name SUB_COMMUNICATION_NFC_NDEFTag_static_2400
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_NDEFTag_static_2400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (ndefTag != null && ndefTag != undefined) {
        let ndefMessage:tag.NdefMessage = tag.ndef.createNdefMessageByData(rawData);
        let AsyncCallback:(error: BusinessError<void> | null, data: tag.NdefMessage | undefined) => void = (
          error:BusinessError<void> | null, data: tag.NdefMessage | undefined) => {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2400 formatReadOnly finish ');
        }
        try {
          ndefFormatable.formatReadOnly(ndefMessage, AsyncCallback);
        } catch (error) {
          error = error as BusinessError;
          if (error.code === 201) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2400 formatReadOnly error is ' + error.code + " - " + error);
            expect(201).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2400 formatReadOnly error is ' + error.code + " - " + error);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2400 formatReadOnly error is ' + error.code + " - " + error);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_NDEFTag_static_2400 formatReadOnly error is ' + error.code + " - " + error);
            expect().assertFail();
          }
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] ndefTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    console.info("*************[nfc_test] start nfc js unit test end*************");
  })
}
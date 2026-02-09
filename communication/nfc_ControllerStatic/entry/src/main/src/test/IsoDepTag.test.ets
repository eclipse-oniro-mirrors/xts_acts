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

let mifareClassicTag: tag.MifareClassicTag ;
let nfcIsoDepTag: tag.IsoDepTag;

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

export default function nfcIsoDepTagTest() {
  describe("nfcIsoDepTagTest", (): void=> {
    hilog.info(domain, tag1, '%{public}s', 'describe start');
    beforeAll(() => {
      try {
        nfcIsoDepTag = tag.getIsoDep(isoDepTaginfo);
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag1,'%{public}s','[NFC_test] beforeAll error is ' + error.code + " - " + error);
      }

      try{
        mifareClassicTag = tag.getMifareClassic(mifareclassicTaginfo);
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
     * @tc.number SUB_COMMUNICATION_NFC_IsoDepTag_static_0100
     * @tc.name SUB_COMMUNICATION_NFC_IsoDepTag_static_0100
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_IsoDepTag_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (nfcIsoDepTag != null && nfcIsoDepTag != undefined) {
        try {
          let ResponseFlags: Array<int> = nfcIsoDepTag.getHistoricalBytes();
        } catch(error) {
          error = error as BusinessError;
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_IsoDepTag_static_0100 getHistoricalBytes error is ' + error.code + " - " + error);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] IsoDepTag = null & = undefined: ');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_IsoDepTag_static_0200
     * @tc.name SUB_COMMUNICATION_NFC_IsoDepTag_static_0200
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_IsoDepTag_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (nfcIsoDepTag != null && nfcIsoDepTag != undefined) {
        try{
          let HiLayerResponse: Array<int> = nfcIsoDepTag.getHiLayerResponse();
        } catch(error) {
          error = error as BusinessError;
          hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_IsoDepTag_static_0200 getHiLayerResponse error is ' + error.code + " - " + error);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] IsoDepTag = null & = undefined: ');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_IsoDepTag_static_0300
     * @tc.name SUB_COMMUNICATION_NFC_IsoDepTag_static_0300
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_IsoDepTag_static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (nfcIsoDepTag != null && nfcIsoDepTag != undefined) {
        try {
          await nfcIsoDepTag.isExtendedApduSupported().then((data) => {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_IsoDepTag_static_0300 isExtendedApduSupported ');
          });
        } catch(error) {
          error = error as BusinessError;
          if (error.code === 201) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_IsoDepTag_static_0300 isExtendedApduSupported error is ' + error.code + " - " + error);
            expect(201).assertEqual(error.code);
          } else if (error.code === 401) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_IsoDepTag_static_0300 isExtendedApduSupported error is ' + error.code + " - " + error);
            expect(401).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_IsoDepTag_static_0300 isExtendedApduSupported error is ' + error.code + " - " + error);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_IsoDepTag_static_0300 isExtendedApduSupported error is ' + error.code + " - " + error);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_IsoDepTag_static_0300 isExtendedApduSupported error is ' + error.code + " - " + error);
            expect().assertFail();
          }
        }
        done();
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] IsoDepTag = null & = undefined: ');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_IsoDepTag_static_0400
     * @tc.name SUB_COMMUNICATION_NFC_IsoDepTag_static_0400
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_IsoDepTag_static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (nfcIsoDepTag != null && nfcIsoDepTag != undefined) {
        let AsyncCallback:(error: BusinessError<void> | null, data: boolean | undefined) => void = (
          error: BusinessError<void> | null, data: boolean | undefined) => {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_IsoDepTag_static_0400 isExtendedApduSupported finish ');
        }
        try {
          nfcIsoDepTag.isExtendedApduSupported(AsyncCallback);
        } catch(error) {
          error = error as BusinessError;
          if (error.code === 201) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_IsoDepTag_static_0400 isExtendedApduSupported error is ' + error.code + " - " + error);
            expect(201).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_IsoDepTag_static_0400 isExtendedApduSupported error is ' + error.code + " - " + error);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_IsoDepTag_static_0400 isExtendedApduSupported error is ' + error.code + " - " + error);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_IsoDepTag_static_0400 isExtendedApduSupported error is ' + error.code + " - " + error);
            expect().assertFail();
          }
          done();
        }
      } else {
        hilog.info(domain, tag1,'%{public}s','[NFC_test] IsoDepTag = null & = undefined: ');
        expect().assertFail();
      }
      done();
    })

    console.info("*************[nfc_test] start nfc js unit test end*************");
  })
}
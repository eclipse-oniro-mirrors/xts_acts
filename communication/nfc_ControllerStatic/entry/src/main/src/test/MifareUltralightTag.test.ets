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

let nfcmifareUltralightTag: tag.MifareUltralightTag ;

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

export default function nfcMifareUltralightTagTest() {
  describe("nfcMifareUltralightTagTest", (): void=> {
    hilog.info(domain, tag1, '%{public}s', 'describe start');
    beforeAll(() => {
      try {
        nfcmifareUltralightTag = tag.getMifareUltralight(mifareUltralightTaginfo);
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
     * @tc.number SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0100
     * @tc.name SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0100
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareUltralightTag != null && nfcmifareUltralightTag != undefined) {
          let pageIndex: int = 1;
          try {
            await nfcmifareUltralightTag.readMultiplePages(pageIndex).then((data) => {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0100 data ');
            });
          } catch (error){
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0100 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0100 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0100 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0100 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareUltralightTag = null & = undefined: ');
          expect(true).assertFalse();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0200
     * @tc.name SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0200
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareUltralightTag != null && nfcmifareUltralightTag != undefined) {
          let pageIndex: int = 1;
          let AsyncCallback:(err:BusinessError<void>|null, data: Array<int> | undefined) => void = (err:BusinessError<void>|null,data: Array<int> | undefined) => {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0200 readSingleBlock finish ');
          }
          try {
            nfcmifareUltralightTag.readMultiplePages(pageIndex, AsyncCallback);
          } catch (error){
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0200 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0200 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0200 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0200 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareUltralightTag = null & = undefined: ');
          expect().assertFail();
        }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0300
     * @tc.name SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0300
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareUltralightTag != null && nfcmifareUltralightTag != undefined) {
          let pageIndex: int = 1;
          let rawData: Array<int> = [0x01, 0x02];
          try {
            await nfcmifareUltralightTag.writeSinglePage(pageIndex, rawData).then((data) => {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0300 data ');
            });
          } catch (error){
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0300 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0300 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0300 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0300 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareUltralightTag = null & = undefined: ');
          expect(true).assertFalse();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0400
     * @tc.name SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0400
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareUltralightTag != null && nfcmifareUltralightTag != undefined) {
          let pageIndex: int = 1;
          let rawData: Array<int> = [0x01, 0x02];
          let AsyncCallback:(err: BusinessError<void> | null, data: Array<int> | undefined) => void = (
            err: BusinessError<void>|null, data: Array<int> | undefined) => {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0400 readSingleBlock finish ');
          }
          try {
            nfcmifareUltralightTag.writeSinglePage(pageIndex, rawData, AsyncCallback);
          } catch (error){
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0400 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0400 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0400 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0400 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareUltralightTag = null & = undefined: ');
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0500
     * @tc.name SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0500
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (nfcmifareUltralightTag != null && nfcmifareUltralightTag != undefined) {
        try {
          let getType: tag.MifareUltralightType = nfcmifareUltralightTag.getType();
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain, tag1,'{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareUltralightTag_static_0500 getType error is ' + error.code + " - " + error);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'{public}s','[NFC_test] nfcmifareUltralightTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    console.info("*************[nfc_test] start nfc js unit test end*************");
  })
}
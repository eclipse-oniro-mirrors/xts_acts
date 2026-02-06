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

let nfcmifareClassicTag: tag.MifareClassicTag ;

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

export default function nfcMifareClassicTagTest() {
  describe("nfcMifareClassicTagTest", (): void=> {
    hilog.info(domain, tag1, '%{public}s', 'describe start');
    beforeAll(() => {
      console.info('beforeAll called')
      try{
        nfcmifareClassicTag = tag.getMifareClassic(mifareclassicTaginfo);
      } catch (error) {
        error = error as BusinessError;
        if (error.code === 801) {
          hilog.info(domain, tag1,'{public}s','[NFC_test] beforeAll error is ' + error.code + " - " + error);
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
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_0100
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_0100
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
          let sectorIndex: int = 1;
          let key: Array<int> = [0x04, 0x05];

          try {
            await nfcmifareClassicTag.authenticateSector(sectorIndex, key, true).then(() => {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0100 data is ');
            });
          } catch (error) {
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0100 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0100 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0100 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0100 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_0200
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_0200
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
          let sectorIndex: int = 1;
          let key: Array<int> = [0x04, 0x05];

          let AsyncCallback:(err: BusinessError<void> | null, data: undefined) => void = (err: BusinessError<void> | null, data: undefined) => {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0200 authenticateSector finish ');
          }
          try {
            nfcmifareClassicTag.authenticateSector(sectorIndex, key, true, AsyncCallback);
          } catch (error) {
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0200 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0200 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0200 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0200 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
            done();
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_0300
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_0300
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
          let blockIndex: int = 1;
          try {
            await nfcmifareClassicTag.readSingleBlock(blockIndex).then((data) => {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0300 data is ');
            });
          } catch (error) {
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0300 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0300 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0300 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0300 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_0400
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_0400
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
          let blockIndex: int = 1;
          let AsyncCallback:(err: BusinessError<void> | null, data: Array<int> | undefined) => void = (
            err: BusinessError<void> | null, data: Array<int> | undefined) => {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0400 readSingleBlock finish ');
          }
          try {
            nfcmifareClassicTag.readSingleBlock(blockIndex, AsyncCallback);
          } catch (error){
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0400 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0400 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0400 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0400 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_0500
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_0500
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
          let blockIndex: int = 1;
          let rawData: Array<int> = [0x0a, 0x14];
          try {
            await nfcmifareClassicTag.writeSingleBlock(blockIndex, rawData).then((data) => {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0500 data ');
            });
          } catch (error){
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0500 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0500 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0500 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0500 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_0600
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_0600
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
          let blockIndex: int = 1;
          let rawData: Array<int> = [0x0a, 0x14];
          let AsyncCallback:(err: BusinessError<void> | null, data: undefined) => void = (err: BusinessError<void> | null, data: undefined) => {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0600 readSingleBlock finish ');
          }
          try {
            nfcmifareClassicTag.writeSingleBlock(blockIndex, rawData, AsyncCallback);
          } catch (error){
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0600 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0600 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0600 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0600 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
          expect().assertFail();
        }
        done();
    })

      /**
       * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_0700
       * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_0700
       * @tc.desc Check whether the NFC function is enabled.
       * @tc.size since 7
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
          if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
            let blockIndex: int = 1;
            let value: int = 0x20;
            try {
              await nfcmifareClassicTag.incrementBlock(blockIndex, value).then((data) => {
                hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0700 data ');
              });
            } catch (error){
            error = error as BusinessError;
              if (error.code === 201) {
                hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0700 error is ' + error.code + " - " + error);
                expect(201).assertEqual(error.code)
              } else if (error.code === 3100201) {
                hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0700 error is ' + error.code + " - " + error);
                expect(3100201).assertEqual(error.code)
              } else if (error.code === 3100204) {
                hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0700 error is ' + error.code + " - " + error);
                expect(3100204).assertEqual(error.code)
              } else {
                hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0700 error is ' + error.code + " - " + error);
                expect().assertFail();
              }
            }
          } else {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
            expect().assertFail();
          }
          done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_0800
       * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_0800
       * @tc.desc Check whether the NFC function is enabled.
       * @tc.size since 7
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
          if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
            let blockIndex: int = 1;
            let value: int = 0x20;

            let AsyncCallback:(err: BusinessError<void> | null, data: undefined) => void = (err: BusinessError<void> | null, data: undefined) => {
              hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0800 readSingleBlock finish ');
            }
            try {
              nfcmifareClassicTag.incrementBlock(blockIndex, value, AsyncCallback);
            } catch (error){
            error = error as BusinessError;
              if (error.code === 201) {
                hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0800 error is ' + error.code + " - " + error);
                expect(201).assertEqual(error.code)
              } else if (error.code === 3100201) {
                hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0800 error is ' + error.code + " - " + error);
                expect(3100201).assertEqual(error.code)
              } else if (error.code === 3100204) {
                hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0800 error is ' + error.code + " - " + error);
                expect(3100204).assertEqual(error.code)
              } else {
                hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0800 error is ' + error.code + " - " + error);
                expect().assertFail();
              }
            }
          } else {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
            expect().assertFail();
          }
          done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_0900
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_0900
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_0900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
          let blockIndex: int = 1;
          let value: int = 0x20;
          try {
            await nfcmifareClassicTag.decrementBlock(blockIndex, value).then((data) => {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0900 data ');
            });
          } catch (error){
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0900 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0900 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0900 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_0900 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_1000
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_1000
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_1000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
          let blockIndex: int = 1;
          let value: int = 0x20;

          let AsyncCallback:(err: BusinessError<void> | null, data: undefined) => void = (err: BusinessError<void> | null, data: undefined) => {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1000 readSingleBlock finish ');
          }
          try {
            nfcmifareClassicTag.decrementBlock(blockIndex, value, AsyncCallback);
          } catch (error){
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1000 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1000 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1000 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1000 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_1100
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_1100
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
          let blockIndex: int = 1;
          try {
            await nfcmifareClassicTag.transferToBlock(blockIndex).then((data) => {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1100 data ');
            });
          } catch (error){
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1100 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1100 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1100 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1100 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
          expect(true).assertFalse();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_1200
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_1200
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
          let blockIndex: int = 1;
          let AsyncCallback:(err: BusinessError<void> | null, data: undefined) => void = (err: BusinessError<void> | null, data: undefined) => {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1200 readSingleBlock finish ');
          }
          try {
            nfcmifareClassicTag.transferToBlock(blockIndex, AsyncCallback);
          } catch (error){
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1200 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1200 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1200 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1200 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_1300
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_1300
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_1300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
          let blockIndex: int = 1;
          try {
            await nfcmifareClassicTag.restoreFromBlock(blockIndex).then((data) => {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1300 data ');
            });
          } catch (error){
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1300 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1300 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1300 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1300 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
          expect(true).assertFalse();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_1400
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_1400
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
          let blockIndex: int = 1;
          let AsyncCallback:(err: BusinessError<void> | null, data: undefined) => void = (err: BusinessError<void> | null, data: undefined) => {
            hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1400 readSingleBlock finish ');
          }
          try {
            nfcmifareClassicTag.restoreFromBlock(blockIndex, AsyncCallback);
          } catch (error){
            error = error as BusinessError;
            if (error.code === 201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1400 error is ' + error.code + " - " + error);
              expect(201).assertEqual(error.code)
            } else if (error.code === 3100201) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1400 error is ' + error.code + " - " + error);
              expect(3100201).assertEqual(error.code)
            } else if (error.code === 3100204) {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1400 error is ' + error.code + " - " + error);
              expect(3100204).assertEqual(error.code)
            } else {
              hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1400 error is ' + error.code + " - " + error);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain, tag1,'%{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined: ');
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_1500
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_1500
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_1500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
        try{
          let sectorCount:int = nfcmifareClassicTag.getSectorCount();
        } catch (error) {
            error = error as BusinessError;
          hilog.info(domain, tag1,'{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1500 getSectorCount error is ' + error.code + " - " + error);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_1600
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_1600
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_1600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
        let sectorIndex: int = 1;
        try{
          let blockCountInSector: int = nfcmifareClassicTag.getBlockCountInSector(sectorIndex);
        } catch (error) {
            error = error as BusinessError;
          hilog.info(domain, tag1,'{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1600 getBlockCountInSector error is ' + error.code + " - " + error);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_1700
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_1700
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
        try{
          let getType: tag.MifareClassicType = nfcmifareClassicTag.getType();
        } catch (error) {
            error = error as BusinessError;
          hilog.info(domain, tag1,'{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1700 getType error is ' + error.code + " - " + error);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_1800
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_1800
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_1800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
        try{
          let tagSize: int = nfcmifareClassicTag.getTagSize();
        } catch (error) {
            error = error as BusinessError;
          hilog.info(domain, tag1,'{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1800 getTagSize error is ' + error.code + " - " + error);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_1900
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_1900
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_1900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
        try{
          let isEmulatedTagstate: boolean = nfcmifareClassicTag.isEmulatedTag();
        } catch (error) {
            error = error as BusinessError;
          hilog.info(domain, tag1,'{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_1900 isEmulatedTag error is ' + error.code + " - " + error);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_2000
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_2000
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_2000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
        try{
          let sectorIndex: int = 1;
          let blockIndex: int = nfcmifareClassicTag.getBlockIndex(sectorIndex);
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain, tag1,'{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_2000 getBlockIndex error is ' + error.code + " - " + error);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_MifareClassicTag_static_2100
     * @tc.name SUB_COMMUNICATION_NFC_MifareClassicTag_static_2100
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_MifareClassicTag_static_2100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (nfcmifareClassicTag != null && nfcmifareClassicTag != undefined) {
        try{
          let blockIndex: int = 1;
          let sectorIndex: int = nfcmifareClassicTag.getSectorIndex(blockIndex);
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain, tag1,'{public}s','[NFC_test] SUB_COMMUNICATION_NFC_MifareClassicTag_static_2100 getSectorIndex error is ' + error.code + " - " + error);
          expect().assertFail();
        }
      } else {
        hilog.info(domain, tag1,'{public}s','[NFC_test] nfcmifareClassicTag = null & = undefined:');
        expect().assertFail();
      }
      done();
    })

    console.info("*************[nfc_test] start nfc js unit test end*************");
  })
}
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

let nfcAtag: tag.NfcATag;
let nfcTagSession: tag.TagSession;

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

let isoDepTaginfo: tag.TagInfo = {
  "uid": [0x01, 0x02, 0x03, 0x04],
  "technology": [1],
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

export default function nfcATagSessionTest() {
    describe("nfcATagSessionTest", (): void=> {
        hilog.info(domain, tag1, '%{public}s', 'describe start');
        beforeAll(() => {
          try {
            nfcAtag = tag.getNfcA(aTag);
          }catch(error: BusinessError){
            if (error.code === 801) {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] beforeAll getNfcA error is :  ' + error + " - " + error.code);
              expect(801).assertEqual(error.code);
            } else {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] beforeAll getNfcA failed ');
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
       * @tc.number SUB_COMMUNICATION_NFC_TagSession_static_0100
       * @tc.name SUB_COMMUNICATION_NFC_TagSession_static_0100
       * @tc.desc Check whether the NFC function is enabled.
       * @tc.size since 7
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_NFC_TagSession_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if ((nfcAtag != null) && (nfcAtag != undefined)) {
          try {
            nfcAtag.connect();
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0100 NfcConnected pass ');
          } catch (error: BusinessError) {
            if (error.code === 3100201) {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0100 NfcConnected error：  ' + error + ' - ' + error.code);
              expect(3100201).assertEqual(error.code);
            } else if (error.code === 801) {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0100 NfcConnected error：  ' + error + ' - ' + error.code);
              expect(801).assertEqual(error.code);
            } else if (error.code === 201) {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0100 NfcConnected error：  ' + error + ' - ' + error.code);
              expect(201).assertEqual(error.code);
            } else {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0100 NfcConnected error：  ' + error + ' - ' + error.code);
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0100 getAtag1 = null & = undefined:');
          expect().assertFail();
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_NFC_TagSession_static_0200
       * @tc.name SUB_COMMUNICATION_NFC_TagSession_static_0200
       * @tc.desc Check whether the NFC function is enabled.
       * @tc.size since 7
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_NFC_TagSession_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          nfcAtag.resetConnection();
          hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0200 resetConnection pass ');
        } catch (error: BusinessError) {
          if (error.code === 3100201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0200 resetConnection error：  ' + error + ' - ' + error.code);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 801) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0200 resetConnection error：  ' + error + ' - ' + error.code);
            expect(801).assertEqual(error.code);
          } else if (error.code === 201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0200 resetConnection error：  ' + error + ' - ' + error.code);
            expect(201).assertEqual(error.code);
          } else {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0200 resetConnection error：  ' + error + ' - ' + error.code);
            expect().assertFail();
          }
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_NFC_TagSession_static_0300
       * @tc.name SUB_COMMUNICATION_NFC_TagSession_static_0300
       * @tc.desc Check whether the NFC function is enabled.
       * @tc.size since 7
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_NFC_TagSession_static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcAtag != null && nfcAtag != undefined) {
          try {
            let istagConnected: boolean = tag.getIsoDep(isoDepTaginfo).isConnected();
          } catch (error: BusinessError) {
            if (error.code === 801) {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0300 getIsoDep error：  ' + error + ' - ' + error.code);
              expect(801).assertEqual(error.code);
            } else {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0300 getIsoDep fail：  ');
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] nfcAtag = null & = undefined: ');
          expect().assertFail();
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_NFC_TagSession_static_0400
       * @tc.name SUB_COMMUNICATION_NFC_TagSession_static_0400
       * @tc.desc Check whether the NFC function is enabled.
       * @tc.size since 7
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_NFC_TagSession_static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        if (nfcAtag != null && nfcAtag != undefined) {
          try {
            let timeoutMs: int = 1000;
            nfcAtag.setTimeout(timeoutMs);
          } catch (error: BusinessError) {
            if (error.code === 201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0400 setTimeout error：  ' + error + ' - ' + error.code);
            expect(201).assertEqual(error.code);
          } else if (error.code === 801) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0400 setTimeout error：  ' + error + ' - ' + error.code);
            expect(801).assertEqual(error.code);
          } else if (error.code === 3100201) {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0400 setTimeout error：  ' + error + ' - ' + error.code);
              expect(3100201).assertEqual(error.code);
            } else {
              hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0300 getIsoDep fail：  ');
              expect().assertFail();
            }
          }
        } else {
          hilog.info(domain,tag1,'%{public}s','[NFC_test] nfcAtag = null & = undefined: ');
          expect().assertFail();
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_NFC_TagSession_static_0500
       * @tc.name SUB_COMMUNICATION_NFC_TagSession_static_0500
       * @tc.desc Check whether the NFC function is enabled.
       * @tc.size since 7
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_NFC_TagSession_static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        let gettime: int;
        try {
          gettime = nfcAtag.getTimeout();
        } catch (error: BusinessError) {
          if (error.code === 201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0500 getTimeout error：  ' + error + ' - ' + error.code);
            expect(201).assertEqual(error.code);
          } else if (error.code === 801) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0500 getTimeout error：  ' + error + ' - ' + error.code);
            expect(801).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0500 getTimeout error：  ' + error + ' - ' + error.code);
            expect(3100201).assertEqual(error.code);
          } else {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0500 getTimeout fail：  ');
            expect().assertFail();
          }
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_NFC_TagSession_static_0600
       * @tc.name SUB_COMMUNICATION_NFC_TagSession_static_0600
       * @tc.desc Check whether the NFC function is enabled.
       * @tc.size since 7
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_NFC_TagSession_static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        let sendDatas: Array<int> = [0x01, 0x02, 0x03, 0x04];
        try {
          await tag.getNfcA(aTag).transmit(sendDatas).then((data) => {
            hilog.info(domain, tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0600 data ');
          });
        } catch(error: BusinessError) {
          if (error.code === 201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0600 transmit error：  ' + error + ' - ' + error.code);
            expect(201).assertEqual(error.code);
            done();
          } else if (error.code === 401) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0600 transmit error：  ' + error + ' - ' + error.code);
            expect(401).assertEqual(error.code);
          } else if (error.code === 801) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0600 transmit error：  ' + error + ' - ' + error.code);
            expect(801).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0600 transmit error：  ' + error + ' - ' + error.code);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0600 transmit error：  ' + error + ' - ' + error.code);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0600 transmit fail：  ');
            expect().assertFail();
          }
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_NFC_TagSession_static_0700
       * @tc.name SUB_COMMUNICATION_NFC_TagSession_static_0700
       * @tc.desc Check whether the NFC function is enabled.
       * @tc.size since 7
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_NFC_TagSession_static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        let sendDatas: Array<int> = [0x01, 0x02, 0x03, 0x04];
        let AsyncCallback:(err: BusinessError<void> | null, data: Array<int> | undefined) => void = (
          err: BusinessError<void> | null, data: Array<int> | undefined) => {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0700 transmit finish ');
        }
        try {
          tag.getNfcA(aTag).transmit(sendDatas, AsyncCallback);
        } catch (error: BusinessError) {
          if (error.code === 201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0700 transmit error：  ' + error + ' - ' + error.code);
            expect(201).assertEqual(error.code);
            done();
          } else if (error.code === 401) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0700 transmit error：  ' + error + ' - ' + error.code);
            expect(401).assertEqual(error.code);
          } else if (error.code === 801) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0700 transmit error：  ' + error + ' - ' + error.code);
            expect(801).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0700 transmit error：  ' + error + ' - ' + error.code);
            expect(3100201).assertEqual(error.code);
          } else if (error.code === 3100204) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0700 transmit error：  ' + error + ' - ' + error.code);
            expect(3100204).assertEqual(error.code);
          } else {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0700 transmit fail：  ');
            expect().assertFail();
          }
        }
        done();
      })

      /**
       * @tc.number SUB_COMMUNICATION_NFC_TagSession_static_0800
       * @tc.name SUB_COMMUNICATION_NFC_TagSession_static_0800
       * @tc.desc Check whether the NFC function is enabled.
       * @tc.size since 7
       * @tc.type Function
       * @tc.level Level 1
       */
      it('SUB_COMMUNICATION_NFC_TagSession_static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
        let mazSendLen: int;
        try {
            mazSendLen  = nfcAtag.getMaxTransmitSize();
        } catch (error: BusinessError) {
          if (error.code === 201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0800 getMaxTransmitSize error：  ' + error + ' - ' + error.code);
            expect(201).assertEqual(error.code);
            done();
          } else if (error.code === 801) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0800 getMaxTransmitSize error：  ' + error + ' - ' + error.code);
            expect(801).assertEqual(error.code);
          } else if (error.code === 3100201) {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0800 getMaxTransmitSize error：  ' + error + ' - ' + error.code);
            expect(3100201).assertEqual(error.code);
          } else {
            hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagSession_static_0800 getMaxTransmitSize fail：  ');
            expect().assertFail();
          }
        }
        done();
      })

    console.info("*************[nfc_test] start nfc js unit test end*************");
  })
}
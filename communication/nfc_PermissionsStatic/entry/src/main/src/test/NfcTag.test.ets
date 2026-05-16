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
import rpc from '@ohos.rpc';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level,TestType,Size} from '../../../hypium/index';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag1: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let remoteTagService: rpc.RemoteObject = new rpc.RemoteObject("rpcTestAbility");

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
     * @tc.number SUB_COMMUNICATION_NFC_Tag_Permissions_static_0100
     * @tc.name SUB_COMMUNICATION_NFC_Tag_Permissions_static_0100
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_Permissions_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let elementName: ElementName = {
        "bundleName": "ohos.acts.communication.nfc.nfcdevice",
        "abilityName": "MainAbility",
        "moduleName": "entry"
      };
      let discTech: Array<int> = [1, 2, 4];
      let AsyncCallback:(err: BusinessError<void> | null, data: tag.TagInfo | undefined) => void = (
        err: BusinessError<void> | null, data: tag.TagInfo | undefined) => {
        hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_Permissions_static_0100 registerForegroundDispatch finish ');
      }
      try {
        tag.registerForegroundDispatch(elementName, discTech, AsyncCallback);
      } catch(error) {
        error = error as BusinessError;
        if (error.code === 201) {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_Permissions_static_0100 registerForegroundDispatch error:  ' + error + error.code);
          expect(error.code).assertEqual(201);
        } else {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_Permissions_static_0100 registerForegroundDispatch fail:  ' + error + error.code);
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_Permissions_static_0200
     * @tc.name SUB_COMMUNICATION_NFC_Tag_Permissions_static_0200
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_Permissions_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let elementName: ElementName = {
        "bundleName": "ohos.acts.communication.nfc.nfcdevice",
        "abilityName": "MainAbility",
        "moduleName": "entry"
      };
      let discTech: Array<int> = [1, 2, 4];
      let AsyncCallback:(err: BusinessError<void> | null, data: tag.TagInfo | undefined) => void = (
        err: BusinessError<void> | null, data: tag.TagInfo | undefined) => {
        hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_Permissions_static_0200 onReaderMode/offReaderMode finish ');
      }

      try {
        tag.onReaderMode(elementName, discTech, AsyncCallback);
      } catch (error) {
        error = error as BusinessError;
        if (error.code === 201) {
          expect(error.code).assertEqual(201);
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_Permissions_static_0200 onReaderMode error :  ' + error + " - " + error.code);
          done();
        } else {
          expect().assertFail();
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_Permissions_static_0200  _static_1400 onReaderMode fail :  ');
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Tag_Permissions_static_0300
     * @tc.name SUB_COMMUNICATION_NFC_Tag_Permissions_static_0300
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Tag_Permissions_static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let elementName: ElementName = {
        "bundleName": "ohos.acts.communication.nfc.nfcdevice",
        "abilityName": "MainAbility",
        "moduleName": "entry"
      };
      let discTech: Array<int> = [1, 2, 4];
      let interval: int = 200;
      try {
        tag.onReaderModeWithInterval(elementName, discTech, (data)=> {
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_Permissions_static_0300 onReaderModeWithInterval finish ');
        }, interval);
      } catch (error) {
        error = error as BusinessError;
        if (error.code === 201) {
          expect(error.code).assertEqual(201);
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_Permissions_static_0300 onReaderModeWithInterval error :  ' + error + " - " + error.code);
          done();
        } else {
          expect().assertFail();
          hilog.info(domain, tag1, '%{public}s', '[NFC_test] SUB_COMMUNICATION_NFC_Tag_Permissions_static_0300 onReaderModeWithInterval fail :  ');
        }
      }
      done();
    })

    console.info("*************[nfc_test] start nfc js unit test end*************");
  })
}
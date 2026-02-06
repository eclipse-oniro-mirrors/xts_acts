/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import { BundleInfo } from 'bundleManager.BundleInfo';
import bundleManager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";

let domain: int = 0x0000;
let tag: string = 'testTag';
let bundleName: string = 'com.example.bundlenativegetmainelementnametest';

export default function getSignatureAInfo() {
  describe('getSignatureAInfo', () => {

    /**
     * @tc.name   Sub_Bms_Framework_getSignatureInfo_static_02
     * @tc.number Sub_Bms_Framework_getSignatureInfo_static_02
     * @tc.desc   Test getSignatureInfo with error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_getSignatureInfo_static_02', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let datas = bundleManager.getSignatureInfo(0);
        expect().assertFail();
        done();
      }catch(err){
        err = err as BusinessError;
        hilog.error(domain, tag, `Sub_Bms_Framework_getSignatureInfo_static_02 catch failed errCode:${err.code} message:${err.message}`);
        expect(err.code).assertEqual(17700021);
        done();
      };
    })
  })
}
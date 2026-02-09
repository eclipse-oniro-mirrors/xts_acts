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
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import bundle from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";

const ERROR_SCHEME_NOT_IN_QUERYSCHEMES: int = 17700056;
const ERROR_INVALID_LINK: int = 17700055;
let domain: int = 0x0000;
let tag: string = 'testTag';
let bundleName: string = 'ohos.acts.atomic.service.test';

export default function canOpenLink() {
  describe('canOpenLink', () => {

    /**
     * @tc.name   canOpenLinkNotInQuerySchemes_static
     * @tc.number SUB_BMS_CANOPENLINK_static_0030
     * @tc.desc   The scheme of the specified link is not in the querySchemes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('canOpenLinkNotInQuerySchemes_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data = bundle.canOpenLink("https://");
        expect(data).assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `canOpenLinkNotInQuerySchemes_static catch failed errCode:${err.code} message:${err.message}`);
        expect(err.code).assertEqual(ERROR_SCHEME_NOT_IN_QUERYSCHEMES);
        done();
      }
    });

    /**
     * @tc.name   canOpenLinkInvalidLink_static
     * @tc.number SUB_BMS_CANOPENLINK_static_0040
     * @tc.desc   The specified link is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('canOpenLinkInvalidLink_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let data = bundle.canOpenLink("http:/");
        expect(data).assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `canOpenLinkInvalidLink_static catch failed errCode:${err.code} message:${err.message}`);
        expect(err.code).assertEqual(ERROR_INVALID_LINK);
        done();
      }
    });


    /**
     * @tc.name   canOpenLinkEmptyParam_static
     * @tc.number SUB_BMS_CANOPENLINK_static_0070
     * @tc.desc   The parameter is incorrect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('canOpenLinkEmptyParam_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = bundle.canOpenLink("");
        expect(data).assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `canOpenLinkEmptyParam_static catch failed errCode:${err.code} message:${err.message}`);
        expect(err.code).assertEqual(ERROR_INVALID_LINK);
        done();
      }
    });

  })
}
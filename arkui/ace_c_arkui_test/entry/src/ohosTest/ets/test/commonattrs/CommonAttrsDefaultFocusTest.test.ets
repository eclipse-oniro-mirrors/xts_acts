/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function commonAttrsDefaultFocusTest() {
    
  describe('CommonAttrsDefaultFocusTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsDefaultFocus001
     * @tc.number SUB_ARKUI_CAPI_BUTTON_DEFAULTFOCUS_0100
     * @tc.desc   testing defaultFocus for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsDefaultFocus001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDefaultFocus001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsDefaultFocus002
     * @tc.number SUB_ARKUI_CAPI_BUTTON_DEFAULTFOCUS_0200
     * @tc.desc   testing defaultFocus for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsDefaultFocus002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDefaultFocus002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsDefaultFocus003
     * @tc.number SUB_ARKUI_CAPI_BUTTON_DEFAULTFOCUS_0300
     * @tc.desc   testing defaultFocus for commonAttrs with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsDefaultFocus003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDefaultFocus003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsDefaultFocus004
     * @tc.number SUB_ARKUI_CAPI_BUTTON_DEFAULTFOCUS_0400
     * @tc.desc   testing resetAttribute defaultFocus for commonAttrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsDefaultFocus004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDefaultFocus004()).assertEqual(0)
      done()
    })
  })
}
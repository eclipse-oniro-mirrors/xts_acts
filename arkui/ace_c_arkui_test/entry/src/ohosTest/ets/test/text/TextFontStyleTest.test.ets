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

export default function textFontStyleTest() {

  describe('TextFontStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextFontStyle001
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONTSTYLE_0100
     * @tc.desc   testing fontStyle for text with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFontStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFontStyle002
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONTSTYLE_0200
     * @tc.desc   testing fontStyle for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFontStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontStyle002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextFontStyle003
     * @tc.number SUB_ARKUI_CAPI_TEXT_FONTSTYLE_0300
     * @tc.desc   testing fontStyle for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextFontStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontStyle003()).assertEqual(0)
      done()
    })
  })
}

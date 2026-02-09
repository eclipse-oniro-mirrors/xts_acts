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

export default function textMaxFontSizeTest() {

  describe('TextMaxFontSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextMaxFontSize001
     * @tc.number SUB_ARKUI_CAPI_TEXT_MAXFONTSIZE_0100
     * @tc.desc   testing maxFontSize for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextMaxFontSize001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextMaxFontSize001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextMaxFontSize002
     * @tc.number SUB_ARKUI_CAPI_TEXT_MAXFONTSIZE_0200
     * @tc.desc   testing maxFontSize for text with boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextMaxFontSize002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextMaxFontSize002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextMaxFontSize003
     * @tc.number SUB_ARKUI_CAPI_TEXT_MAXFONTSIZE_0300
     * @tc.desc   testing maxFontSize for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextMaxFontSize003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextMaxFontSize003()).assertEqual(0)
      done()
    })
  })
}

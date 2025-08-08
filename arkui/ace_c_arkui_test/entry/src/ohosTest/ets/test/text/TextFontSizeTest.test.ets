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

export default function textFontSizeTest() {

  describe('TextFontSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTSIZE_0100
     * @tc.name       : testTextFontSize001
     * @tc.desc       : testing fontSize for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontSize001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontSize001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTSIZE_0200
     * @tc.name       : testTextFontSize002
     * @tc.desc       : testing fontSize for text with boundary value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontSize002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontSize002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTSIZE_0300
     * @tc.name       : testTextFontSize003
     * @tc.desc       : testing fontSize for text with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextFontSize003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontSize003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_FONTSIZE_0400
     * @tc.name       : testTextFontSize004
     * @tc.desc       : testing fontSize for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextFontSize004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextFontSize004()).assertEqual(0)
      done()
    })
  })
}

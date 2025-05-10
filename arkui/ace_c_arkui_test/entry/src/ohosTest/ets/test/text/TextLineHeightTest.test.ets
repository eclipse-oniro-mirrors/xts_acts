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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textLineHeightTest() {

  describe('TextLineHeightTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEHEIGHT_0100
     * @tc.name       : testTextLineHeight001
     * @tc.desc       : testing lineHeight for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLineHeight001', 0, async (done: Function) => {
      expect(nativeFunc.testTextLineHeight001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEHEIGHT_0200
     * @tc.name       : testTextLineHeight002
     * @tc.desc       : testing lineHeight for text with boundary value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLineHeight002', 0, async (done: Function) => {
      expect(nativeFunc.testTextLineHeight002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEHEIGHT_0300
     * @tc.name       : testTextLineHeight003
     * @tc.desc       : testing lineHeight for text with boundary value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLineHeight003', 0, async (done: Function) => {
      expect(nativeFunc.testTextLineHeight003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINEHEIGHT_0400
     * @tc.name       : testTextLineHeight004
     * @tc.desc       : When the validation setting value is not greater than 0, there is no limit on the height of text lines,
     * and the font size is adaptive
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLineHeight004', 0, async (done: Function) => {
      expect(nativeFunc.testTextLineHeight004()).assertEqual(0)
      done()
    })
  })
}

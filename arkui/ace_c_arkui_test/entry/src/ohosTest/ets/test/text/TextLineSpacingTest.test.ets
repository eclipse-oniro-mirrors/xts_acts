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

export default function textLineSpacingTest() {

  describe('TextLineSpacingTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINE_SPACING_0100
     * @tc.name       : testTextLineSpacing001
     * @tc.desc       : testing lineSpacing for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLineSpacing001', 0, async (done: Function) => {
      expect(nativeFunc.testTextLineSpacing001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINE_SPACING_0200
     * @tc.name       : testTextLineSpacing002
     * @tc.desc       : testing lineSpacing for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLineSpacing002', 0, async (done: Function) => {
      expect(nativeFunc.testTextLineSpacing002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINE_SPACING_0300
     * @tc.name       : testTextLineSpacing003
     * @tc.desc       : testing lineSpacing for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLineSpacing003', 0, async (done: Function) => {
      expect(nativeFunc.testTextLineSpacing003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_LINE_SPACING_0400
     * @tc.name       : testTextLineSpacing004
     * @tc.desc       : testing lineSpacing for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextLineSpacing004', 0, async (done: Function) => {
      expect(nativeFunc.testTextLineSpacing004()).assertEqual(0)
      done()
    })

  })
}

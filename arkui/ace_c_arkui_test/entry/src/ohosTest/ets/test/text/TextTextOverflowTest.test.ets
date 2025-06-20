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

export default function textTextOverflowTest() {

  describe('TextTextOverflowTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_TEXTOVERFLOW_0100
     * @tc.name       : testTextTextOverflow001
     * @tc.desc       : testing textOverflow for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextTextOverflow001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextOverflow001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_TEXTOVERFLOW_0200
     * @tc.name       : testTextTextOverflow002
     * @tc.desc       : testing textOverflow for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextTextOverflow002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextOverflow002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_TEXTOVERFLOW_0300
     * @tc.name       : testTextTextOverflow003
     * @tc.desc       : testing textOverflow for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextTextOverflow003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextOverflow003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_TEXTOVERFLOW_0400
     * @tc.name       : testTextTextOverflow004
     * @tc.desc       : testing textOverflow for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextTextOverflow004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextOverflow004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_TEXTOVERFLOW_0500
     * @tc.name       : testTextTextOverflow005
     * @tc.desc       : testing textOverflow for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextTextOverflow005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextOverflow005()).assertEqual(0)
      done()
    })
  })
}

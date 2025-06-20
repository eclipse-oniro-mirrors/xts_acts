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

export default function textWorkBreakTest() {

  describe('TextWorkBreakTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_WORD_BREAK_0001
     * @tc.name       : testTextWordBreak001
     * @tc.desc       : testing wordBreak for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextWordBreak001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextWordBreak001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_WORD_BREAK_0002
     * @tc.name       : testTextWordBreak002
     * @tc.desc       : testing wordBreak for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextWordBreak002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextWordBreak002()).assertEqual(0)
      done()
    })
    
    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_WORD_BREAK_0003
     * @tc.name       : testTextWordBreak003
     * @tc.desc       : testing wordBreak for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextWordBreak003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextWordBreak003()).assertEqual(0)
      done()
    })
    
    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_WORD_BREAK_0004
     * @tc.name       : testTextWordBreak004
     * @tc.desc       : testing wordBreak for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextWordBreak004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextWordBreak004()).assertEqual(0)
      done()
    })
    
    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_WORD_BREAK_0005
     * @tc.name       : testTextWordBreak005
     * @tc.desc       : testing wordBreak for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextWordBreak005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextWordBreak005()).assertEqual(0)
      done()
    })
    
    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_WORD_BREAK_0006
     * @tc.name       : testTextWordBreak006
     * @tc.desc       : testing wordBreak for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextWordBreak006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextWordBreak006()).assertEqual(0)
      done()
    })
    
    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_WORD_BREAK_0007
     * @tc.name       : testTextWordBreak007
     * @tc.desc       : testing wordBreak for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextWordBreak007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextWordBreak007()).assertEqual(0)
      done()
    })
  })
}

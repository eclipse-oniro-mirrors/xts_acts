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

export default function textTextAlignTest() {

  describe('TextTextAlignTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextTextAlign001
     * @tc.number SUB_ARKUI_CAPI_TEXT_TEXTALIGN_0100
     * @tc.desc   testing textAlign for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextTextAlign001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextAlign001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextTextAlign002
     * @tc.number SUB_ARKUI_CAPI_TEXT_TEXTALIGN_0200
     * @tc.desc   testing textAlign for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextTextAlign002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextAlign002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextTextAlign003
     * @tc.number SUB_ARKUI_CAPI_TEXT_TEXTALIGN_0300
     * @tc.desc   testing textAlign for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextTextAlign003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextAlign003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextTextAlign004
     * @tc.number SUB_ARKUI_CAPI_TEXT_TEXTALIGN_0400
     * @tc.desc   testing textAlign for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextTextAlign004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextAlign004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextTextAlign005
     * @tc.number SUB_ARKUI_CAPI_TEXT_TEXTALIGN_0500
     * @tc.desc   testing textAlign for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextTextAlign005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextTextAlign005()).assertEqual(0)
      done()
    })
  })
}

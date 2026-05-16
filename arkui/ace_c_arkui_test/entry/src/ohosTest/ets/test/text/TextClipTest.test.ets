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

export default function textClipTest() {

  describe('TextClipTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextClip001
     * @tc.number SUB_ARKUI_CAPI_TEXT_CLIP_0100
     * @tc.desc   testing clip for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextClip001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextClip001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextClip002
     * @tc.number SUB_ARKUI_CAPI_TEXT_CLIP_0200
     * @tc.desc   testing clip for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextClip002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextClip002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextClip003
     * @tc.number SUB_ARKUI_CAPI_TEXT_CLIP_0300
     * @tc.desc   testing clip for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextClip003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextClip003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextClip004
     * @tc.number SUB_ARKUI_CAPI_TEXT_CLIP_0400
     * @tc.desc   testing clip for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextClip004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextClip004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextClip005
     * @tc.number SUB_ARKUI_CAPI_TEXT_CLIP_0500
     * @tc.desc   testing clip for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextClip005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextClip005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextClip006
     * @tc.number SUB_ARKUI_CAPI_TEXT_CLIP_0600
     * @tc.desc   testing clip for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextClip006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextClip006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextClip007
     * @tc.number SUB_ARKUI_CAPI_TEXT_CLIP_0700
     * @tc.desc   testing clip for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextClip007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextClip007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextClip008
     * @tc.number SUB_ARKUI_CAPI_TEXT_CLIP_0800
     * @tc.desc   testing clip for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextClip008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextClip008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextClip009
     * @tc.number SUB_ARKUI_CAPI_TEXT_CLIP_0900
     * @tc.desc   testing clip for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextClip009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextClip009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextClip010
     * @tc.number SUB_ARKUI_CAPI_TEXT_CLIP_1000
     * @tc.desc   testing clip for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextClip010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextClip010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextClip011
     * @tc.number SUB_ARKUI_CAPI_TEXT_CLIP_1100
     * @tc.desc   testing clip for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextClip011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextClip011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextClip012
     * @tc.number SUB_ARKUI_CAPI_TEXT_CLIP_1200
     * @tc.desc   testing clip for text with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextClip012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextClip012()).assertEqual(0)
      done()
    })
  })
}

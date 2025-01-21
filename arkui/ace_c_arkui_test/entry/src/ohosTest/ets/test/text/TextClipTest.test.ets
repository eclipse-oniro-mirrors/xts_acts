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

export default function textClipTest() {

  describe('TextClipTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CLIP_0100
     * @tc.name       : testTextClip001
     * @tc.desc       : testing clip for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextClip001', 0, async (done: Function) => {
      expect(nativeFunc.testTextClip001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CLIP_0200
     * @tc.name       : testTextClip002
     * @tc.desc       : testing clip for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextClip002', 0, async (done: Function) => {
      expect(nativeFunc.testTextClip002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CLIP_0300
     * @tc.name       : testTextClip003
     * @tc.desc       : testing clip for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextClip003', 0, async (done: Function) => {
      expect(nativeFunc.testTextClip003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CLIP_0400
     * @tc.name       : testTextClip004
     * @tc.desc       : testing clip for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextClip004', 0, async (done: Function) => {
      expect(nativeFunc.testTextClip004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CLIP_0500
     * @tc.name       : testTextClip005
     * @tc.desc       : testing clip for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextClip005', 0, async (done: Function) => {
      expect(nativeFunc.testTextClip005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CLIP_0600
     * @tc.name       : testTextClip006
     * @tc.desc       : testing clip for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextClip006', 0, async (done: Function) => {
      expect(nativeFunc.testTextClip006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CLIP_0700
     * @tc.name       : testTextClip007
     * @tc.desc       : testing clip for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextClip007', 0, async (done: Function) => {
      expect(nativeFunc.testTextClip007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CLIP_0800
     * @tc.name       : testTextClip008
     * @tc.desc       : testing clip for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextClip008', 0, async (done: Function) => {
      expect(nativeFunc.testTextClip008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CLIP_0900
     * @tc.name       : testTextClip009
     * @tc.desc       : testing clip for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextClip009', 0, async (done: Function) => {
      expect(nativeFunc.testTextClip009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CLIP_1000
     * @tc.name       : testTextClip010
     * @tc.desc       : testing clip for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextClip010', 0, async (done: Function) => {
      expect(nativeFunc.testTextClip010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CLIP_1100
     * @tc.name       : testTextClip011
     * @tc.desc       : testing clip for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextClip011', 0, async (done: Function) => {
      expect(nativeFunc.testTextClip011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_CLIP_1200
     * @tc.name       : testTextClip012
     * @tc.desc       : testing clip for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextClip012', 0, async (done: Function) => {
      expect(nativeFunc.testTextClip012()).assertEqual(0)
      done()
    })
  })
}

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

export default function customComponentClipTest() {

  describe('CustomComponentClipTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomComponentClip001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0100
     * @tc.desc   testing clip for imageSpan with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentClip001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentClip002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0200
     * @tc.desc   testing clip for imageSpan with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentClip002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentClip003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0300
     * @tc.desc   testing clip for imageSpan with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentClip003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentClip004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0400
     * @tc.desc   testing clip for imageSpan with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentClip004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentClip005
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0500
     * @tc.desc   testing clip for imageSpan with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentClip005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentClip006
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0600
     * @tc.desc   testing clip for imageSpan with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentClip006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentClip007
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0700
     * @tc.desc   testing clip for imageSpan with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentClip007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip007()).assertEqual(0)
      done()
    })
  })
}

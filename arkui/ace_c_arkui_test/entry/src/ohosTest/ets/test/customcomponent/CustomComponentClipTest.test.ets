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

export default function customComponentClipTest() {

  describe('CustomComponentClipTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0100
     * @tc.name       : testCustomComponentClip001
     * @tc.desc       : testing clip for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentClip001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0200
     * @tc.name       : testCustomComponentClip002
     * @tc.desc       : testing clip for imageSpan with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentClip002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0300
     * @tc.name       : testCustomComponentClip003
     * @tc.desc       : testing clip for imageSpan with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentClip003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0400
     * @tc.name       : testCustomComponentClip004
     * @tc.desc       : testing clip for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentClip004', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0500
     * @tc.name       : testCustomComponentClip005
     * @tc.desc       : testing clip for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentClip005', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0600
     * @tc.name       : testCustomComponentClip006
     * @tc.desc       : testing clip for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentClip006', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CLIP_0700
     * @tc.name       : testCustomComponentClip007
     * @tc.desc       : testing clip for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentClip007', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentClip007()).assertEqual(0)
      done()
    })
  })
}

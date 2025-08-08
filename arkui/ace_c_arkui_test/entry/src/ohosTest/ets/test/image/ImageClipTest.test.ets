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

export default function imageClipTest() {

  describe('ImageClipTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_CLIP_0100
     * @tc.name       : testImageClip001
     * @tc.desc       : testing clip for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageClip001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageClip001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_CLIP_0200
     * @tc.name       : testImageClip002
     * @tc.desc       : testing clip for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageClip002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageClip002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_CLIP_0300
     * @tc.name       : testImageClip003
     * @tc.desc       : testing clip for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageClip003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageClip003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_CLIP_0400
     * @tc.name       : testImageClip004
     * @tc.desc       : testing clip for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageClip004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageClip004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_CLIP_0500
     * @tc.name       : testImageClip005
     * @tc.desc       : testing clip for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageClip005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageClip005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_CLIP_0600
     * @tc.name       : testImageClip006
     * @tc.desc       : testing clip for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageClip006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageClip006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_CLIP_0700
     * @tc.name       : testImageClip007
     * @tc.desc       : testing clip for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageClip007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageClip007()).assertEqual(0)
      done()
    })

  })
}

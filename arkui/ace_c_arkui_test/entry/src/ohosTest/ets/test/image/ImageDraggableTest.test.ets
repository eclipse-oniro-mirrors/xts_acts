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

export default function imageDraggableTest() {

  describe('ImageDraggableTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_DRAGGABLE_0100
     * @tc.name       : testImageDraggable001
     * @tc.desc       : testing draggable for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageDraggable001', 0, async (done: Function) => {
      expect(nativeFunc.testImageDraggable001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_DRAGGABLE_0200
     * @tc.name       : testImageDraggable002
     * @tc.desc       : testing draggable for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageDraggable002', 0, async (done: Function) => {
      expect(nativeFunc.testImageDraggable002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_DRAGGABLE_0300
     * @tc.name       : testImageDraggable003
     * @tc.desc       : testing draggable for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageDraggable003', 0, async (done: Function) => {
      expect(nativeFunc.testImageDraggable003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_DRAGGABLE_0400
     * @tc.name       : testImageDraggable004
     * @tc.desc       : testing draggable for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageDraggable004', 0, async (done: Function) => {
      expect(nativeFunc.testImageDraggable004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_DRAGGABLE_0500
     * @tc.name       : testImageDraggable005
     * @tc.desc       : testing draggable for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageDraggable005', 0, async (done: Function) => {
      expect(nativeFunc.testImageDraggable005()).assertEqual(0)
      done()
    })

  })
}

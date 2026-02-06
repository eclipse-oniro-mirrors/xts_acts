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

export default function imageResizableTest() {

  describe('ImageResizableTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_RESIZABLE_0100
     * @tc.name       : testImageResizable001
     * @tc.desc       : testing resizable for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageResizable001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageResizable001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_RESIZABLE_0200
     * @tc.name       : testImageResizable002
     * @tc.desc       : testing resizable for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageResizable002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageResizable002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_RESIZABLE_0300
     * @tc.name       : testImageResizable003
     * @tc.desc       : testing resizable for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageResizable003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageResizable003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_RESIZABLE_0400
     * @tc.name       : testImageResizable004
     * @tc.desc       : testing resizable for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageResizable004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageResizable004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_RESIZABLE_0500
     * @tc.name       : testImageResizable005
     * @tc.desc       : testing resizable for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageResizable005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageResizable005()).assertEqual(0)
      done()
    })

  })
}

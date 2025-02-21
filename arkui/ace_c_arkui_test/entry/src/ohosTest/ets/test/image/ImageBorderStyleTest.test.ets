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

export default function imageBorderStyleTest() {

  describe('ImageBorderStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERSTYLE_0100
     * @tc.name       : testImageBorderStyle001
     * @tc.desc       : testing borderstyle for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderStyle001', 0, async (done: Function) => {
      expect(nativeFunc.testImageBorderStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERSTYLE_0200
     * @tc.name       : testImageBorderStyle002
     * @tc.desc       : testing borderstyle for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderStyle002', 0, async (done: Function) => {
      expect(nativeFunc.testImageBorderStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERSTYLE_0300
     * @tc.name       : testImageBorderStyle003
     * @tc.desc       : testing borderstyle for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderStyle003', 0, async (done: Function) => {
      expect(nativeFunc.testImageBorderStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERSTYLE_0400
     * @tc.name       : testImageBorderStyle004
     * @tc.desc       : testing borderstyle for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderStyle004', 0, async (done: Function) => {
      expect(nativeFunc.testImageBorderStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERSTYLE_0500
     * @tc.name       : testImageBorderStyle005
     * @tc.desc       : testing borderstyle for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderStyle005', 0, async (done: Function) => {
      expect(nativeFunc.testImageBorderStyle005()).assertEqual(0)
      done()
    })

  })
}

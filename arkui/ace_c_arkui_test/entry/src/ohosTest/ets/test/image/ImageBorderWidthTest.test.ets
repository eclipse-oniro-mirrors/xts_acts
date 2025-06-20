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

export default function imageBorderWidthTest() {

  describe('ImageBorderWidthTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERWIDTH_0100
     * @tc.name       : testImageBorderWidth001
     * @tc.desc       : testing borderWidth for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderWidth001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderWidth001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERWIDTH_0200
     * @tc.name       : testImageBorderWidth002
     * @tc.desc       : testing borderWidth for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderWidth002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderWidth002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERWIDTH_0300
     * @tc.name       : testImageBorderWidth003
     * @tc.desc       : testing borderWidth for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderWidth003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderWidth003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERWIDTH_0400
     * @tc.name       : testImageBorderWidth004
     * @tc.desc       : testing borderWidth for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderWidth004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderWidth004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERWIDTH_0500
     * @tc.name       : testImageBorderWidth005
     * @tc.desc       : testing borderWidth for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageBorderWidth005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderWidth005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERWIDTH_0600
     * @tc.name       : testImageBorderWidth006
     * @tc.desc       : testing borderWidth for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageBorderWidth006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderWidth006()).assertEqual(0)
      done()
    })

  })
}

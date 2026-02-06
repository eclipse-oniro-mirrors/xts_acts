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

export default function imageBorderRadiusTest() {

  describe('ImageBorderRadiusTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERRADIUS_0100
     * @tc.name       : testImageBorderRadius001
     * @tc.desc       : testing borderRadius for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderRadius001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderRadius001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERRADIUS_0200
     * @tc.name       : testImageBorderRadius002
     * @tc.desc       : testing borderRadius for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderRadius002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderRadius002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERRADIUS_0300
     * @tc.name       : testImageBorderRadius003
     * @tc.desc       : testing borderRadius for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderRadius003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderRadius003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERRADIUS_0400
     * @tc.name       : testImageBorderRadius004
     * @tc.desc       : testing borderRadius for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderRadius004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderRadius004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERRADIUS_0500
     * @tc.name       : testImageBorderRadius005
     * @tc.desc       : testing borderRadius for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderRadius005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderRadius005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERRADIUS_0600
     * @tc.name       : testImageBorderRadius006
     * @tc.desc       : testing borderRadius for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageBorderRadius006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderRadius006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERRADIUS_0700
     * @tc.name       : testImageBorderRadius007
     * @tc.desc       : testing borderRadius for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageBorderRadius007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderRadius007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BORDERRADIUS_0800
     * @tc.name       : testImageBorderRadius008
     * @tc.desc       : testing borderRadius for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageBorderRadius008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageBorderRadius008()).assertEqual(0)
      done()
    })
  })
}

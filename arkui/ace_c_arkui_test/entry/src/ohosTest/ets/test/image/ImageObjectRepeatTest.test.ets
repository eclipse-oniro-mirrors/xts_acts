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

export default function imageObjectRepeatTest() {

  describe('ImageObjectRepeatTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTREPEAT_0100
     * @tc.name       : testImageObjectRepeat001
     * @tc.desc       : testing objectrepeat for image with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageObjectRepeat001', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectRepeat001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTREPEAT_0200
     * @tc.name       : testImageObjectRepeat002
     * @tc.desc       : testing objectrepeat for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageObjectRepeat002', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectRepeat002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTREPEAT_0300
     * @tc.name       : testImageObjectRepeat003
     * @tc.desc       : testing objectrepeat for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageObjectRepeat003', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectRepeat003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTREPEAT_0400
     * @tc.name       : testImageObjectRepeat004
     * @tc.desc       : testing objectrepeat for image with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageObjectRepeat004', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectRepeat004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTREPEAT_0500
     * @tc.name       : testImageObjectRepeat005
     * @tc.desc       : testing objectrepeat for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectRepeat005', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectRepeat005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_OBJECTREPEAT_0600
     * @tc.name       : testImageObjectRepeat006
     * @tc.desc       : testing objectrepeat for image with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testImageObjectRepeat006', 0, async (done: Function) => {
      expect(nativeFunc.testImageObjectRepeat006()).assertEqual(0)
      done()
    })

  })
}

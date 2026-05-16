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

export default function imageTranslateTest() {

  describe('ImageTranslateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageTranslate001
     * @tc.number SUB_ARKUI_CAPI_IMAGE_TRANSLATE_0100
     * @tc.desc   testing translate for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageTranslate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageTranslate001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageTranslate002
     * @tc.number SUB_ARKUI_CAPI_IMAGE_TRANSLATE_0200
     * @tc.desc   testing translate for image with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageTranslate002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageTranslate002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageTranslate003
     * @tc.number SUB_ARKUI_CAPI_IMAGE_TRANSLATE_0300
     * @tc.desc   testing translate for image with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageTranslate003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageTranslate003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageTranslate004
     * @tc.number SUB_ARKUI_CAPI_IMAGE_TRANSLATE_0400
     * @tc.desc   testing translate for image with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageTranslate004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageTranslate004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageTranslate005
     * @tc.number SUB_ARKUI_CAPI_IMAGE_TRANSLATE_0500
     * @tc.desc   testing translate for image with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageTranslate005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageTranslate005()).assertEqual(0)
      done()
    })

  })
}

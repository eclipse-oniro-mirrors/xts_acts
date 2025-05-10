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

export default function commonAttrsBlurTest() {

  describe('CommonAttrsBlurTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BLUR_0100
     * @tc.name       : testCommonAttrsBlur001
     * @tc.desc       : testing blur for commonAttrs with valid value 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBlur001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlur001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BLUR_0200
     * @tc.name       : testCommonAttrsBlur002
     * @tc.desc       : testing blur for commonAttrs with valid value 30
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBlur002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlur002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BLUR_0300
     * @tc.name       : testCommonAttrsBlur003
     * @tc.desc       : testing blur for commonAttrs with valid value 50
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBlur003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlur003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BLUR_0400
     * @tc.name       : testCommonAttrsBlur004
     * @tc.desc       : testing blur for commonAttrs with valid value 100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBlur004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlur004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BLUR_0500
     * @tc.name       : testCommonAttrsBlur005
     * @tc.desc       : testing blur for commonAttrs with invalid value -100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBlur005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlur005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_BLUR_0600
     * @tc.name       : testCommonAttrsBlur006
     * @tc.desc       : testing resetAttribute blur for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsBlur006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlur006()).assertEqual(0)
      done()
    })
  })
}
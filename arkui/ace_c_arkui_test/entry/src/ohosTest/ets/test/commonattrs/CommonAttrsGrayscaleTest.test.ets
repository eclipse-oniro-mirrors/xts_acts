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

export default function commonAttrsGrayscaleTest() {

  describe('CommonAttrsGrayscaleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_GRAYSCALE_0100
     * @tc.name       : testCommonAttrsGrayscale001
     * @tc.desc       : testing grayscale for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsGrayscale001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsGrayscale001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_GRAYSCALE_0200
     * @tc.name       : testCommonAttrsGrayscale002
     * @tc.desc       : testing grayscale for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsGrayscale002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsGrayscale002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_GRAYSCALE_0300
     * @tc.name       : testCommonAttrsGrayscale003
     * @tc.desc       : testing grayscale for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsGrayscale003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsGrayscale003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_GRAYSCALE_0400
     * @tc.name       : testCommonAttrsGrayscale004
     * @tc.desc       : testing grayscale for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsGrayscale004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsGrayscale004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_GRAYSCALE_0500
     * @tc.name       : testCommonAttrsGrayscale005
     * @tc.desc       : testing grayscale for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsGrayscale005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsGrayscale005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_GRAYSCALE_0600
     * @tc.name       : testCommonAttrsGrayscale006
     * @tc.desc       : testing grayscale for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsGrayscale006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsGrayscale006()).assertEqual(0)
      done()
    })

  })
}

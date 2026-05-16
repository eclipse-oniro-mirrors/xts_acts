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

export default function commonAttrsInvertTest() {

  describe('CommonAttrsInvertTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsInvert001
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_INVERT_0100
     * @tc.desc   testing invert for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsInvert001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsInvert001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsInvert002
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_INVERT_0200
     * @tc.desc   testing invert for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsInvert002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsInvert002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsInvert003
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_INVERT_0300
     * @tc.desc   testing invert for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsInvert003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsInvert003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsInvert004
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_INVERT_0400
     * @tc.desc   testing invert for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsInvert004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsInvert004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsInvert005
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_INVERT_0500
     * @tc.desc   testing invert for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsInvert005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsInvert005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsInvert006
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_INVERT_0600
     * @tc.desc   testing invert for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsInvert006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsInvert006()).assertEqual(0)
      done()
    })

  })
}

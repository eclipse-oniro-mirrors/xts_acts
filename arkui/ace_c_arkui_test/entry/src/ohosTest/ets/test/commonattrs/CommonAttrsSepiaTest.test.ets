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

export default function commonAttrsSepiaTest() {

  describe('CommonAttrsSepiaTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsSepia001
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_SEPIA_0100
     * @tc.desc   testing sepia for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsSepia001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSepia001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsSepia002
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_SEPIA_0200
     * @tc.desc   testing sepia for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsSepia002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSepia002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsSepia003
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_SEPIA_0300
     * @tc.desc   testing sepia for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsSepia003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSepia003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsSepia004
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_SEPIA_0400
     * @tc.desc   testing sepia for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsSepia004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSepia004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsSepia005
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_SEPIA_0500
     * @tc.desc   testing sepia for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsSepia005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSepia005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsSepia006
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_SEPIA_0600
     * @tc.desc   testing sepia for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsSepia006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSepia006()).assertEqual(0)
      done()
    })

  })
}

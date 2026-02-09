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

export default function commonAttrsDirectionTest() {

  describe('CommonAttrsDirectionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsDirection001
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_DIRECTION_0100
     * @tc.desc   testing direction for row with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsDirection001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDirection001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsDirection002
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_DIRECTION_0200
     * @tc.desc   testing direction for row with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsDirection002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDirection002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsDirection003
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_DIRECTION_0300
     * @tc.desc   testing direction for row with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsDirection003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDirection003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsDirection004
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_DIRECTION_0400
     * @tc.desc   testing direction for row with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsDirection004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDirection004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsDirection005
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_DIRECTION_0500
     * @tc.desc   testing direction for row with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsDirection005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDirection005()).assertEqual(0)
      done()
    })

  })
}

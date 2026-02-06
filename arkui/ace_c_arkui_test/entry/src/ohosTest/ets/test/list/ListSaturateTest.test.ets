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

export default function listSaturateTest() {

  describe('ListSaturateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testListSaturate001
     * @tc.number SUB_ARKUI_CAPI_LIST_SATURATE_0100
     * @tc.desc   testing saturate for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSaturate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSaturate001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListSaturate002
     * @tc.number SUB_ARKUI_CAPI_LIST_SATURATE_0200
     * @tc.desc   testing saturate for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSaturate002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSaturate002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListSaturate003
     * @tc.number SUB_ARKUI_CAPI_LIST_SATURATE_0300
     * @tc.desc   testing saturate for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSaturate003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSaturate003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListSaturate004
     * @tc.number SUB_ARKUI_CAPI_LIST_SATURATE_0400
     * @tc.desc   testing saturate for list with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSaturate004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSaturate004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListSaturate005
     * @tc.number SUB_ARKUI_CAPI_LIST_SATURATE_0500
     * @tc.desc   Testing saturate for list with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSaturate005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSaturate005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListSaturate006
     * @tc.number SUB_ARKUI_CAPI_LIST_SATURATE_0600
     * @tc.desc   Testing saturate for list with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSaturate006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSaturate006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testListSaturate007
     * @tc.number SUB_ARKUI_CAPI_LIST_SATURATE_0700
     * @tc.desc   Testing saturate for list with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSaturate007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSaturate007()).assertEqual(0)
      done()
    })
  })
}

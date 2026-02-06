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

export default function stackSaturateTest() {

  describe('StackSaturateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testStackSaturate001
     * @tc.number SUB_ARKUI_CAPI_STACK_SATURATE_0100
     * @tc.desc   testing saturate for stack with small value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackSaturate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackSaturate001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackSaturate002
     * @tc.number SUB_ARKUI_CAPI_STACK_SATURATE_0200
     * @tc.desc   testing saturate for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackSaturate002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackSaturate002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackSaturate003
     * @tc.number SUB_ARKUI_CAPI_STACK_SATURATE_0300
     * @tc.desc   testing saturate for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackSaturate003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackSaturate003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackSaturate004
     * @tc.number SUB_ARKUI_CAPI_STACK_SATURATE_0400
     * @tc.desc   testing saturate for stack with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackSaturate004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackSaturate004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackSaturate005
     * @tc.number SUB_ARKUI_CAPI_STACK_SATURATE_0500
     * @tc.desc   testing saturate for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackSaturate005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackSaturate005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackSaturate006
     * @tc.number SUB_ARKUI_CAPI_STACK_SATURATE_0600
     * @tc.desc   testing saturate for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackSaturate006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackSaturate006()).assertEqual(0)
      done()
    })

  })
}

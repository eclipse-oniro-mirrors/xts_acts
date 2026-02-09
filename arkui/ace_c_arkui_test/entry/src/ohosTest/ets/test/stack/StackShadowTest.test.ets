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

export default function stackShadowTest() {

  describe('StackShadowTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testStackShadow001
     * @tc.number SUB_ARKUI_CAPI_STACK_SHADOW_0100
     * @tc.desc   testing shadow for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackShadow001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackShadow001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackShadow002
     * @tc.number SUB_ARKUI_CAPI_STACK_SHADOW_0200
     * @tc.desc   testing shadow for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackShadow002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackShadow002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackShadow003
     * @tc.number SUB_ARKUI_CAPI_STACK_SHADOW_0300
     * @tc.desc   testing shadow for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackShadow003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackShadow003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackShadow004
     * @tc.number SUB_ARKUI_CAPI_STACK_SHADOW_0400
     * @tc.desc   testing shadow for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackShadow004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackShadow004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackShadow005
     * @tc.number SUB_ARKUI_CAPI_STACK_SHADOW_0500
     * @tc.desc   testing shadow for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackShadow005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackShadow005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackShadow006
     * @tc.number SUB_ARKUI_CAPI_STACK_SHADOW_0600
     * @tc.desc   testing shadow for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackShadow006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackShadow006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackShadow007
     * @tc.number SUB_ARKUI_CAPI_STACK_SHADOW_0700
     * @tc.desc   testing shadow for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackShadow007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackShadow007()).assertEqual(0)
      done()
    })

  })
}

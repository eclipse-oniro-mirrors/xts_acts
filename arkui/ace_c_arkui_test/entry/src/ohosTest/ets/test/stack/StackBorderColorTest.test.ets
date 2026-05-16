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

export default function stackBorderColorTest() {

  describe('StackBorderColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testStackBorderColor001
     * @tc.number SUB_ARKUI_CAPI_STACK_BORDERCOLOR_0100
     * @tc.desc   testing borderColor for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBorderColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderColor001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackBorderColor002
     * @tc.number SUB_ARKUI_CAPI_STACK_BORDERCOLOR_0200
     * @tc.desc   testing borderColor for stack with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBorderColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderColor002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackBorderColor003
     * @tc.number SUB_ARKUI_CAPI_STACK_BORDERCOLOR_0300
     * @tc.desc   testing borderColor for stack with small value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBorderColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderColor003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackBorderColor004
     * @tc.number SUB_ARKUI_CAPI_STACK_BORDERCOLOR_0400
     * @tc.desc   testing borderColor for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBorderColor004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderColor004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackBorderColor005
     * @tc.number SUB_ARKUI_CAPI_STACK_BORDERCOLOR_0500
     * @tc.desc   testing borderColor for stack with large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBorderColor005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderColor005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackBorderColor006
     * @tc.number SUB_ARKUI_CAPI_STACK_BORDERCOLOR_0600
     * @tc.desc   testing borderColor for stack with small value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBorderColor006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderColor006()).assertEqual(0)
      done()
    })

  })
}

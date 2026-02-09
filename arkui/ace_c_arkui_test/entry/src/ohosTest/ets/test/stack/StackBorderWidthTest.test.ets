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

export default function stackBorderWidthTest() {

  describe('StackBorderWidthTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testStackBorderWidth001
     * @tc.number SUB_ARKUI_CAPI_STACK_BORDERWIDTH_0100
     * @tc.desc   testing borderwidth for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBorderWidth001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderWidth001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackBorderWidth002
     * @tc.number SUB_ARKUI_CAPI_STACK_BORDERWIDTH_0200
     * @tc.desc   testing borderwidth for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBorderWidth002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderWidth002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackBorderWidth003
     * @tc.number SUB_ARKUI_CAPI_STACK_BORDERWIDTH_0300
     * @tc.desc   testing borderwidth for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBorderWidth003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderWidth003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackBorderWidth004
     * @tc.number SUB_ARKUI_CAPI_STACK_BORDERWIDTH_0400
     * @tc.desc   testing borderwidth for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBorderWidth004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderWidth004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackBorderWidth005
     * @tc.number SUB_ARKUI_CAPI_STACK_BORDERWIDTH_0500
     * @tc.desc   testing borderwidth for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBorderWidth005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderWidth005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackBorderWidth006
     * @tc.number SUB_ARKUI_CAPI_STACK_BORDERWIDTH_0600
     * @tc.desc   testing borderwidth for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackBorderWidth006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderWidth006()).assertEqual(0)
      done()
    })

  })
}

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

export default function stackBorderStyleTest() {

  describe('StackBorderStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERSTYLE_0100
     * @tc.name       : testStackBorderStyle001
     * @tc.desc       : testing borderStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBorderStyle001', 0, async (done: Function) => {
      expect(nativeFunc.testStackBorderStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERSTYLE_0200
     * @tc.name       : testStackBorderStyle002
     * @tc.desc       : testing borderStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBorderStyle002', 0, async (done: Function) => {
      expect(nativeFunc.testStackBorderStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERSTYLE_0300
     * @tc.name       : testStackBorderStyle003
     * @tc.desc       : testing borderStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBorderStyle003', 0, async (done: Function) => {
      expect(nativeFunc.testStackBorderStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERSTYLE_0400
     * @tc.name       : testStackBorderStyle004
     * @tc.desc       : testing borderStyle for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackBorderStyle004', 0, async (done: Function) => {
      expect(nativeFunc.testStackBorderStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERSTYLE_0500
     * @tc.name       : testStackBorderStyle005
     * @tc.desc       : testing borderStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBorderStyle005', 0, async (done: Function) => {
      expect(nativeFunc.testStackBorderStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERSTYLE_0600
     * @tc.name       : testStackBorderStyle006
     * @tc.desc       : testing borderStyle for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackBorderStyle006', 0, async (done: Function) => {
      expect(nativeFunc.testStackBorderStyle006()).assertEqual(0)
      done()
    })
  })
}

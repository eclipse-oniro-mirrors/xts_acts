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

export default function relativecontaineBarrierOptionTest() {

  describe('RelativecontaineBarrierOptionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testRelativeContaineBarrierOption001
     * @tc.number SUB_ARKUI_CAPI_RELATIVE_CONTAINER_BARRIER_0100
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRelativeContaineBarrierOption001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineBarrierOption001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testRelativeContaineBarrierOption002
     * @tc.number SUB_ARKUI_CAPI_RELATIVE_CONTAINER_BARRIER_0200
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRelativeContaineBarrierOption002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineBarrierOption002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testRelativeContaineBarrierOption003
     * @tc.number SUB_ARKUI_CAPI_RELATIVE_CONTAINER_BARRIER_0300
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRelativeContaineBarrierOption003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineBarrierOption003()).assertEqual(0)
      done()
    })

  })
}

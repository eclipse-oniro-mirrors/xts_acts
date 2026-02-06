/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function IsInRenderStateReturnValueTest(){

  describe('IsInRenderStateReturnValueTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   IsInRenderStateReturnValueTest_001
     * @tc.number IsInRenderStateReturnValueTest_001
     * @tc.desc   IsInRenderStateReturnValueTest_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IsInRenderStateReturnValueTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestIsInRenderStateReturnValue001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   IsInRenderStateReturnValueTest_002
     * @tc.number IsInRenderStateReturnValueTest_002
     * @tc.desc   IsInRenderStateReturnValueTest_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IsInRenderStateReturnValueTest_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestIsInRenderStateReturnValue002()).assertEqual(0)
      done()
    })
  })
}
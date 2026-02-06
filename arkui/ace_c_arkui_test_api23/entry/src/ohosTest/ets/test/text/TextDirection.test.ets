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

export default function TextDirectionTest(){

  describe('TextDirectionTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   TextDirection_001
     * @tc.number TextDirection_001
     * @tc.desc   TextDirection_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextDirection_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TextDirection_001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   TextDirection_002
     * @tc.number TextDirection_002
     * @tc.desc   TextDirection_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextDirection_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TextDirection_002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   TextDirection_003
     * @tc.number TextDirection_003
     * @tc.desc   TextDirection_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextDirection_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TextDirection_003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   TextDirection_004
     * @tc.number TextDirection_004
     * @tc.desc   TextDirection_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextDirection_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TextDirection_004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   TextDirection_005
     * @tc.number TextDirection_005
     * @tc.desc   TextDirection_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextDirection_005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TextDirection_005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   TextDirection_006
     * @tc.number TextDirection_006
     * @tc.desc   TextDirection_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextDirection_006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TextDirection_006()).assertEqual(0)
      done()
    })
  })
}
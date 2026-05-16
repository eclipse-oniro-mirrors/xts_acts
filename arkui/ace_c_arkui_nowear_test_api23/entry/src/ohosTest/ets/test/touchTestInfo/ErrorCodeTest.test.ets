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

export default function TestErrorCodeTest(){

  describe('TestErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   TestErrorCodeTest_001
     * @tc.number TestErrorCodeTest_001
     * @tc.desc   TestErrorCodeTest_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestErrorCodeTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   TestErrorCodeTest_002
     * @tc.number TestErrorCodeTest_002
     * @tc.desc   TestErrorCodeTest_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestErrorCodeTest_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   TestErrorCodeTest_003
     * @tc.number TestErrorCodeTest_003
     * @tc.desc   TestErrorCodeTest_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestErrorCodeTest_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   TestErrorCodeTest_004
     * @tc.number TestErrorCodeTest_004
     * @tc.desc   TestErrorCodeTest_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestErrorCodeTest_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode004()).assertEqual(0)
      done()
    })

        /**
     * @tc.name   TestErrorCodeTest_005
     * @tc.number TestErrorCodeTest_005
     * @tc.desc   TestErrorCodeTest_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestErrorCodeTest_005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode005()).assertEqual(0)
      done()
    })
  })
}
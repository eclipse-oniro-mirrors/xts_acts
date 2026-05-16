/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function errorCodeTest() {

  describe('errorCodeTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   errorCodeTest_001
     * @tc.number errorCodeTest_001
     * @tc.desc   errorCodeTest_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCodeTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   errorCodeTest_002
     * @tc.number errorCodeTest_002
     * @tc.desc   errorCodeTest_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCodeTest_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   errorCodeTest_003
     * @tc.number errorCodeTest_003
     * @tc.desc   errorCodeTest_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCodeTest_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   errorCodeTest_004
     * @tc.number errorCodeTest_004
     * @tc.desc   errorCodeTest_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCodeTest_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   errorCodeTest_005
     * @tc.number errorCodeTest_005
     * @tc.desc   errorCodeTest_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCodeTest_005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   errorCodeTest_006
     * @tc.number errorCodeTest_006
     * @tc.desc   errorCodeTest_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCodeTest_006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   errorCodeTest_007
     * @tc.number errorCodeTest_007
     * @tc.desc   errorCodeTest_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCodeTest_007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   errorCodeTest_008
     * @tc.number errorCodeTest_008
     * @tc.desc   errorCodeTest_008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCodeTest_008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   errorCodeTest_009
     * @tc.number errorCodeTest_009
     * @tc.desc   errorCodeTest_009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCodeTest_009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   errorCodeTest_010
     * @tc.number errorCodeTest_010
     * @tc.desc   errorCodeTest_010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCodeTest_010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   errorCodeTest_011
     * @tc.number errorCodeTest_011
     * @tc.desc   errorCodeTest_011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCodeTest_011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   errorCodeTest_012
     * @tc.number errorCodeTest_012
     * @tc.desc   errorCodeTest_012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('errorCodeTest_012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestErrorCode012()).assertEqual(0)
      done()
    })
  })
}
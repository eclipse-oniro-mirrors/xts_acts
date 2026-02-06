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

export default function GridEmptyTest() {
  describe('GridEmptyTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   GridIndexTest_001
     * @tc.number GridIndexTest_001
     * @tc.desc   GridIndexTest_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GridIndexTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.GridIndexTest_001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   GridEmptyTest_001
     * @tc.number GridEmptyTest_001
     * @tc.desc   GridEmptyTest_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GridEmptyTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.GridEmptyTest_001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   GridEmptyTest_002
     * @tc.number GridEmptyTest_002
     * @tc.desc   Test the NODE_GRID_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING with normal values(false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GridEmptyTest_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.GridEmptyTest_002()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   GridEmptyTest_003
     * @tc.number GridEmptyTest_003
     * @tc.desc   Test the NODE_GRID_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING with normal values(true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GridEmptyTest_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.GridEmptyTest_003()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   GridEmptyTest_004
     * @tc.number GridEmptyTest_004
     * @tc.desc   Test the NODE_GRID_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING with values(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GridEmptyTest_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.GridEmptyTest_004()).assertEqual(0);
      done();
    });
  })
}
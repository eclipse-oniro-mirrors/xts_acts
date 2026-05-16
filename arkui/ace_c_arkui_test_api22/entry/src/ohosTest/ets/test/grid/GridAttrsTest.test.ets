/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function gridAttrsTest() {
  describe('GridAttrsTest', () => {

    beforeEach(async (done: Function) => {
      done();
    });

    /**
     * @tc.number      testGridItemAlignment001
     * @tc.name        testGridItemAlignment001
     * @tc.desc        Test grid GridItemAlignment with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridItemAlignment001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridItemAlignment001()).assertEqual(0);
      done();
    });

    /**
     * @tc.number      testGridItemAlignment002
     * @tc.name        testGridItemAlignment002
     * @tc.desc        Test grid GridItemAlignment with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridItemAlignment002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridItemAlignment002()).assertEqual(0);
      done();
    });

    /**
     * @tc.number      TestGridItemAlignment003
     * @tc.name        TestGridItemAlignment003
     * @tc.desc        Test grid GridItemAlignment with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestGridItemAlignment003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridItemAlignment003()).assertEqual(0);
      done();
    });

    /**
     * @tc.number      testGridItemStyle001
     * @tc.name        testGridItemStyle001
     * @tc.desc        Test grid GridItemStyle with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridItemStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridItemStyle001()).assertEqual(0);
      done();
    });

    /**
     * @tc.number      testGridItemStyle002
     * @tc.name        testGridItemStyle002
     * @tc.desc        Test grid GridItemStyle with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridItemStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridItemStyle002()).assertEqual(0);
      done();
    });

    /**
     * @tc.number      testGridItemStyle003
     * @tc.name        testGridItemStyle003
     * @tc.desc        Test grid GridItemStyle with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridItemStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridItemStyle003()).assertEqual(0);
      done();
    });

    /**
     * @tc.number      testGridLayoutOptions001
     * @tc.name        testGridLayoutOptions001
     * @tc.desc        Test grid LayoutOptions with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridLayoutOptions001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridLayoutOptions001()).assertEqual(0);
      done();
    });

    /**
     * @tc.number      testGridLayoutOptions002
     * @tc.name        testGridLayoutOptions002
     * @tc.desc        Test grid LayoutOptions with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridLayoutOptions002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridLayoutOptions002()).assertEqual(0);
      done();
    });

    /**
     * @tc.number      testGridLayoutOptions003
     * @tc.name        testGridLayoutOptions003
     * @tc.desc        Test grid LayoutOptions with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridLayoutOptions003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridLayoutOptions003()).assertEqual(0);
      done();
    });

    /**
     * @tc.number      testGridLayoutOptions004
     * @tc.name        testGridLayoutOptions004
     * @tc.desc        Test grid LayoutOptions with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridLayoutOptions004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testGridLayoutOptions004()).assertEqual(0);
      done();
    });
    /**
     * @tc.number      TestRegisterGetRectByIndexCallback001
     * @tc.name        TestRegisterGetRectByIndexCallback001
     * @tc.desc        Test grid LayoutOptions with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestRegisterGetRectByIndexCallback001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRegisterGetRectByIndexCallback001()).assertEqual(0);
      done();
    });

    /**
     * @tc.number      TestRegisterGetIrregularSizeByIndexCallback001
     * @tc.name        TestRegisterGetIrregularSizeByIndexCallback001
     * @tc.desc        Test grid LayoutOptions with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestRegisterGetIrregularSizeByIndexCallback001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRegisterGetIrregularSizeByIndexCallback001()).assertEqual(0);
      done();
    });

  })
}
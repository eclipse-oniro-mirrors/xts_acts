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

export default function gridAbilityTest() {
  describe('gridAbilityTest', () => {

    beforeEach(async (done: Function) => {
      done();
    });

    /**
     * @tc.number      testGridEditMode001
     * @tc.name        testGridEditMode001
     * @tc.desc        Test grid EditMode with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridEditMode001', Level.LEVEL1, async (done: Function) => {
      console.info('testGridEditMode001 START');
      expect(nativeFunc.testGridEditMode001()).assertEqual(0);
      console.info('testGridEditMode001 END');
      done();
    });

    /**
     * @tc.number      testGridEditMode002
     * @tc.name        testGridEditMode002
     * @tc.desc        Test grid EditMode with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridEditMode002', Level.LEVEL1, async (done: Function) => {
      console.info('testGridEditMode002 START');
      expect(nativeFunc.testGridEditMode001()).assertEqual(0);
      console.info('testGridEditMode002 END');
      done();
    });

    /**
     * @tc.number      testGridMultiSel001
     * @tc.name        testGridMultiSel001
     * @tc.desc        Test grid EditMode with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridMultiSel001', Level.LEVEL1, async (done: Function) => {
      console.info('testGridMultiSel001 START');
      expect(nativeFunc.testGridMultiSel001()).assertEqual(0);
      console.info('testGridMultiSel001 END');
      done();
    });

    /**
     * @tc.number      testGridMultiSel002
     * @tc.name        testGridMultiSel002
     * @tc.desc        Test grid EditMode with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridMultiSel002', Level.LEVEL1, async (done: Function) => {
      console.info('testGridMultiSel002 START');
      expect(nativeFunc.testGridMultiSel002()).assertEqual(0);
      console.info('testGridMultiSel002 END');
      done();
    });

    /**
     * @tc.number      testGridDragAnimation001
     * @tc.name        testGridDragAnimation001
     * @tc.desc        Test grid EditMode with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridDragAnimation001', Level.LEVEL1, async (done: Function) => {
      console.info('testGridDragAnimation001 START');
      expect(nativeFunc.testGridDragAnimation001()).assertEqual(0);
      console.info('testGridDragAnimation001 END');
      done();
    });

    /**
     * @tc.number      testGridDragAnimation002
     * @tc.name        testGridDragAnimation002
     * @tc.desc        Test grid EditMode with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridDragAnimation002', Level.LEVEL1, async (done: Function) => {
      console.info('testGridDragAnimation002 START');
      expect(nativeFunc.testGridDragAnimation002()).assertEqual(0);
      console.info('testGridDragAnimation002 END');
      done();
    });

    /**
     * @tc.number      testGridItemSelectable001
     * @tc.name        testGridItemSelectable001
     * @tc.desc        Test grid EditMode with normal values
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testGridItemSelectable001', Level.LEVEL1, async (done: Function) => {
      console.info('testGridItemSelectable001 START');
      expect(nativeFunc.testGridItemSelectable001()).assertEqual(0);
      console.info('testGridItemSelectable001 END');
      done();
    });
  })
}
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libDrawingNative from 'libdrawingnative.so';
import Utils, { Log } from './Utils.test';


export default function DrawingNativeLatticeTest() {
  describe('DrawingNativeLatticeTest', () => {
    beforeAll(async () => {
    })

    beforeEach(async () => {
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testLatticeCreateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingLattice_0100
     * @tc.desc   Test for testLatticeCreateNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testLatticeCreateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingLattice(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testLatticeCreateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingLattice_0200
     * @tc.desc   Test for testLatticeCreateNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testLatticeCreateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingLattice(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testLatticeCreateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingLattice_0300
     * @tc.desc   Test for testLatticeCreateAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testLatticeCreateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingLattice(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testLatticeCreateEnumTraversal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingLattice_0400
     * @tc.desc   Test for testLatticeCreateEnumTraversal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testLatticeCreateEnumTraversal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingLattice(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testLatticeCreateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingLattice_0500
     * @tc.desc   Test for testLatticeCreateMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testLatticeCreateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingLattice(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testLatticeDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingLattice_0600
     * @tc.desc   Test for testLatticeDestroyNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testLatticeDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingLattice(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testLatticeDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingLattice_0700
     * @tc.desc   Test for testLatticeDestroyNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testLatticeDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingLattice(6);
      expect(result).assertEqual(0);
    })
  })
}
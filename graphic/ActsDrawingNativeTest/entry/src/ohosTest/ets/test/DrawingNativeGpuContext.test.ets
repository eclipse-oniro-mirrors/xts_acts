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


export default function DrawingNativeGpuContextTest() {
  describe('DrawingNativeGpuContextTest', () => {
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
     * @tc.name   testGpuContextCreateFromGLDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingGpuContext_0100
     * @tc.desc   Test for creating and destroying GPU context with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testGpuContextCreateFromGLDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingGpuContext(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testGpuContextDestroyNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingGpuContext_0200
     * @tc.desc   Test for destroying GPU context with NULL parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testGpuContextDestroyNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingGpuContext(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testGpuContextCreateFromGLDestroyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingGpuContext_0300
     * @tc.desc   Test for repeatedly creating and destroying GPU context.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testGpuContextCreateFromGLDestroyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingGpuContext(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testGpuContextCreateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingGpuContext_0400
     * @tc.desc   Test for creating GPU context with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testGpuContextCreateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingGpuContext(3);
      expect(result).assertEqual(0);
    })
  })
}
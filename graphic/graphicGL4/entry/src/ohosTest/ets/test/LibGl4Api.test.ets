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

import { describe, expect, it, TestType, Level, Size } from '@ohos/hypium'
import gl4api from 'libentry.so'

export default function gl4ApiTest() {
  describe('Gl4Test', () => {
    /**
     * @tc.name   testGLTextureARB
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBGL4_GLTEXTUREARBTEST
     * @tc.desc   test glTextureARB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGLTextureARB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = gl4api.gLTextureARBTest();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testGLBufferARB
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBGL4_GLBUFFERARBTEST
     * @tc.desc   test glBufferARB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGLBufferARB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = gl4api.gLBufferARBTest();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testGLUniformARB
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBGL4_GLUNIFORMARBTEST
     * @tc.desc   test glUniformARB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGLUniformARB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = gl4api.gLUniformARBTest();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testGLUniformMatrixARB
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBGL4_GLUNIFORMMATRIXARBTEST
     * @tc.desc   test glUniformMatrixARB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGLUniformMatrixARB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = gl4api.gLUniformMatrixARBTest();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testGLLineStippleHalfEmpty
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBGL4_GLLINESTIPPLE_001
     * @tc.desc   test glLineStippleHalfEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGLLineStippleHalfEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = gl4api.glLineStippleHalfEmpty();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testGLLineStippleMaxFactor
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBGL4_GLLINESTIPPLE_002
     * @tc.desc   test glLineStippleMaxFactor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGLLineStippleMaxFactor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = gl4api.glLineStippleMaxFactor();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testGLLineStippleDottedPattern
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBGL4_GLLINESTIPPLE_003
     * @tc.desc   test glLineStippleDottedPattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGLLineStippleDottedPattern', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = gl4api.glLineStippleDottedPattern();
      expect(result).assertEqual(0);
      done();
    });
  }) // describe
}

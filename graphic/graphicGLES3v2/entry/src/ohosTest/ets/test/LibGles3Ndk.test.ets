/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import gles3ndk from 'libentry.so'

export default function glesNdkTest() {
  describe('Gles3Test', () => {
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSAMPLERPARAMETERFV_0100
     * @tc.name       : testGLSamplerParameterfv001
     * @tc.desc       : test glSamplerParameterfv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLSamplerParameterfv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLSamplerParameterfv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSAMPLERPARAMETERI_0100
     * @tc.name       : testGLSamplerParameteri001
     * @tc.desc       : test glSamplerParameteri
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLSamplerParameteri001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLSamplerParameteri();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSAMPLERPARAMETERIIV_0100
     * @tc.name       : testGLSamplerParameterIiv001
     * @tc.desc       : test glSamplerParameterIiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLSamplerParameterIiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLSamplerParameterIiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSAMPLERPARAMETERIUIV_0100
     * @tc.name       : testGLSamplerParameterIuiv001
     * @tc.desc       : test glSamplerParameterIuiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLSamplerParameterIuiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLSamplerParameterIuiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSAMPLERPARAMETERIV_0100
     * @tc.name       : testGLSamplerParameteriv001
     * @tc.desc       : test glSamplerParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLSamplerParameteriv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLSamplerParameteriv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSCISSOR_0100
     * @tc.name       : testGLScissor001
     * @tc.desc       : test glScissor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLScissor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLScissor();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSHADERBINARY_0100
     * @tc.name       : testGLShaderBinary001
     * @tc.desc       : test glShaderBinary
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLShaderBinary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLShaderBinary();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSHADERSOURCE_0100
     * @tc.name       : testGLShaderSource001
     * @tc.desc       : test glShaderSource
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLShaderSource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLShaderSource();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSTENCILFUNC_0100
     * @tc.name       : testGLStencilFunc001
     * @tc.desc       : test glStencilFunc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLStencilFunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLStencilFunc();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSTENCILFUNCSEPARATE_0100
     * @tc.name       : testGLStencilFuncSeparate001
     * @tc.desc       : test glStencilFuncSeparate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLStencilFuncSeparate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLStencilFuncSeparate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSTENCILMASK_0100
     * @tc.name       : testGLStencilMask001
     * @tc.desc       : test glStencilMask
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLStencilMask001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLStencilMask();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSTENCILMASKSEPARATE_0100
     * @tc.name       : testGLStencilMaskSeparate001
     * @tc.desc       : test glStencilMaskSeparate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLStencilMaskSeparate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLStencilMaskSeparate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSTENCILOP_0100
     * @tc.name       : testGLStencilOp001
     * @tc.desc       : test glStencilOp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLStencilOp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLStencilOp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSTENCILOPSEPARATE_0100
     * @tc.name       : testGLStencilOpSeparate001
     * @tc.desc       : test glStencilOpSeparate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLStencilOpSeparate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLStencilOpSeparate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXBUFFER_0100
     * @tc.name       : testGLTexBuffer001
     * @tc.desc       : test glTexBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXBUFFERRANGE_0100
     * @tc.name       : testGLTexBufferRange001
     * @tc.desc       : test glTexBufferRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexBufferRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexBufferRange();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXIMAGE2D_0100
     * @tc.name       : testGLTexImage2D001
     * @tc.desc       : test glTexImage2D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexImage2D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexImage2D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXIMAGE3D_0100
     * @tc.name       : testGLTexImage3D001
     * @tc.desc       : test glTexImage3D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexImage3D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexImage3D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXPARAMETERF_0100
     * @tc.name       : testGLTexParameterf001
     * @tc.desc       : test glTexParameterf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexParameterf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexParameterf();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXPARAMETERFV_0100
     * @tc.name       : testGLTexParameterfv001
     * @tc.desc       : test glTexParameterfv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexParameterfv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexParameterfv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXPARAMETERI_0100
     * @tc.name       : testGLTexParameteri001
     * @tc.desc       : test glTexParameteri
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexParameteri001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexParameteri();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXPARAMETERIIV_0100
     * @tc.name       : testGLTexParameterIiv001
     * @tc.desc       : test glTexParameterIiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexParameterIiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexParameterIiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXPARAMETERIUIV_0100
     * @tc.name       : testGLTexParameterIuiv001
     * @tc.desc       : test glTexParameterIuiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexParameterIuiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexParameterIuiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXPARAMETERIV_0100
     * @tc.name       : testGLTexParameteriv001
     * @tc.desc       : test glTexParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexParameteriv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexParameteriv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXSTORAGE2D_0100
     * @tc.name       : testGLTexStorage2D001
     * @tc.desc       : test glTexStorage2D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexStorage2D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexStorage2D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXSTORAGE2DMULTISAMPLE_0100
     * @tc.name       : testGLTexStorage2DMultisample001
     * @tc.desc       : test glTexStorage2DMultisample
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexStorage2DMultisample001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLTexStorage2DMultisample();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXSTORAGE3D_0100
     * @tc.name       : testGLTexStorage3D001
     * @tc.desc       : test glTexStorage3D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexStorage3D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexStorage3D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXSTORAGE3DMULTISAMPLE_0100
     * @tc.name       : testGLTexStorage3DMultisample001
     * @tc.desc       : test glTexStorage3DMultisample
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexStorage3DMultisample001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLTexStorage3DMultisample();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXSUBIMAGE2D_0100
     * @tc.name       : testGLTexSubImage2D001
     * @tc.desc       : test glTexSubImage2D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexSubImage2D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexSubImage2D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTEXSUBIMAGE3D_0100
     * @tc.name       : testGLTexSubImage3D001
     * @tc.desc       : test glTexSubImage3D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTexSubImage3D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLTexSubImage3D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLTRANSFORMFEEDBACKVARYINGS_0100
     * @tc.name       : testGLTransformFeedbackVaryings001
     * @tc.desc       : test glTransformFeedbackVaryings
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLTransformFeedbackVaryings001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLTransformFeedbackVaryings();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM1F_0100
     * @tc.name       : testGLUniform1f001
     * @tc.desc       : test glUniform1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform1f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform1f();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM1FV_0100
     * @tc.name       : testGLUniform1fv001
     * @tc.desc       : test glUniform1fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform1fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform1fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM1I_0100
     * @tc.name       : testGLUniform1i001
     * @tc.desc       : test glUniform1i
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform1i001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform1i();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM1IV_0100
     * @tc.name       : testGLUniform1iv001
     * @tc.desc       : test glUniform1iv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform1iv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform1iv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM1UI_0100
     * @tc.name       : testGLUniform1ui001
     * @tc.desc       : test glUniform1ui
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform1ui001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform1ui();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM1UIV_0100
     * @tc.name       : testGLUniform1uiv001
     * @tc.desc       : test glUniform1uiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform1uiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform1uiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM2F_0100
     * @tc.name       : testGLUniform2f001
     * @tc.desc       : test glUniform2f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform2f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform2f();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM2FV_0100
     * @tc.name       : testGLUniform2fv001
     * @tc.desc       : test glUniform2fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform2fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform2fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM2I_0100
     * @tc.name       : testGLUniform2i001
     * @tc.desc       : test glUniform2i
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform2i001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform2i();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM2IV_0100
     * @tc.name       : testGLUniform2iv001
     * @tc.desc       : test glUniform2iv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform2iv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform2iv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM2UI_0100
     * @tc.name       : testGLUniform2ui001
     * @tc.desc       : test glUniform2ui
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform2ui001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform2ui();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM2UIV_0100
     * @tc.name       : testGLUniform2uiv001
     * @tc.desc       : test glUniform2uiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform2uiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform2uiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM3F_0100
     * @tc.name       : testGLUniform3f001
     * @tc.desc       : test glUniform3f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform3f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform3f();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM3FV_0100
     * @tc.name       : testGLUniform3fv001
     * @tc.desc       : test glUniform3fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform3fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform3fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM3I_0100
     * @tc.name       : testGLUniform3i001
     * @tc.desc       : test glUniform3i
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform3i001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform3i();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM3IV_0100
     * @tc.name       : testGLUniform3iv001
     * @tc.desc       : test glUniform3iv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform3iv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform3iv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM3UI_0100
     * @tc.name       : testGLUniform3ui001
     * @tc.desc       : test glUniform3ui
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform3ui001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform3ui();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM3UIV_0100
     * @tc.name       : testGLUniform3uiv001
     * @tc.desc       : test glUniform3uiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform3uiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform3uiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM4F_0100
     * @tc.name       : testGLUniform4f001
     * @tc.desc       : test glUniform4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform4f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform4f();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM4FV_0100
     * @tc.name       : testGLUniform4fv001
     * @tc.desc       : test glUniform4fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform4fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform4fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM4I_0100
     * @tc.name       : testGLUniform4i001
     * @tc.desc       : test glUniform4i
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform4i001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform4i();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM4IV_0100
     * @tc.name       : testGLUniform4iv001
     * @tc.desc       : test glUniform4iv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform4iv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform4iv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM4UI_0100
     * @tc.name       : testGLUniform4ui001
     * @tc.desc       : test glUniform4ui
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform4ui001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform4ui();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORM4UIV_0100
     * @tc.name       : testGLUniform4uiv001
     * @tc.desc       : test glUniform4uiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform4uiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniform4uiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORMBLOCKBINDING_0100
     * @tc.name       : testGLUniformBlockBinding001
     * @tc.desc       : test glUniformBlockBinding
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformBlockBinding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniformBlockBinding();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORMMATRIX2FV_0100
     * @tc.name       : testGLUniformMatrix2fv001
     * @tc.desc       : test glUniformMatrix2fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix2fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniformMatrix2fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORMMATRIX2X3FV_0100
     * @tc.name       : testGLUniformMatrix2x3fv001
     * @tc.desc       : test glUniformMatrix2x3fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix2x3fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniformMatrix2x3fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORMMATRIX2X4FV_0100
     * @tc.name       : testGLUniformMatrix2x4fv001
     * @tc.desc       : test glUniformMatrix2x4fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix2x4fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniformMatrix2x4fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORMMATRIX3FV_0100
     * @tc.name       : testGLUniformMatrix3fv001
     * @tc.desc       : test glUniformMatrix3fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix3fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniformMatrix3fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORMMATRIX3X2FV_0100
     * @tc.name       : testGLUniformMatrix3x2fv001
     * @tc.desc       : test glUniformMatrix3x2fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix3x2fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniformMatrix3x2fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORMMATRIX3X4FV_0100
     * @tc.name       : testGLUniformMatrix3x4fv001
     * @tc.desc       : test glUniformMatrix3x4fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix3x4fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniformMatrix3x4fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORMMATRIX4FV_0100
     * @tc.name       : testGLUniformMatrix4fv001
     * @tc.desc       : test glUniformMatrix4fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix4fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniformMatrix4fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORMMATRIX4X2FV_0100
     * @tc.name       : testGLUniformMatrix4x2fv001
     * @tc.desc       : test glUniformMatrix4x2fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix4x2fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniformMatrix4x2fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNIFORMMATRIX4X3FV_0100
     * @tc.name       : testGLUniformMatrix4x3fv001
     * @tc.desc       : test glUniformMatrix4x3fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix4x3fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUniformMatrix4x3fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUNMAPBUFFER_0100
     * @tc.name       : testGLUnmapBuffer001
     * @tc.desc       : test glUnmapBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUnmapBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUnmapBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUSEPROGRAM_0100
     * @tc.name       : testGLUseProgram001
     * @tc.desc       : test glUseProgram
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUseProgram001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUseProgram();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLUSEPROGRAMSTAGES_0100
     * @tc.name       : testGLUseProgramStages001
     * @tc.desc       : test glUseProgramStages
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUseProgramStages001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLUseProgramStages();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVALIDATEPROGRAM_0100
     * @tc.name       : testGLValidateProgram001
     * @tc.desc       : test glValidateProgram
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLValidateProgram001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLValidateProgram();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVALIDATEPROGRAMPIPELINE_0100
     * @tc.name       : testGLValidateProgramPipeline001
     * @tc.desc       : test glValidateProgramPipeline
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLValidateProgramPipeline001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLValidateProgramPipeline();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIB1F_0100
     * @tc.name       : testGLVertexAttrib1f001
     * @tc.desc       : test glVertexAttrib1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttrib1f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttrib1f();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIB1FV_0100
     * @tc.name       : testGLVertexAttrib1fv001
     * @tc.desc       : test glVertexAttrib1fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttrib1fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttrib1fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIB2F_0100
     * @tc.name       : testGLVertexAttrib2f001
     * @tc.desc       : test glVertexAttrib2f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttrib2f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttrib2f();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIB2FV_0100
     * @tc.name       : testGLVertexAttrib2fv001
     * @tc.desc       : test glVertexAttrib2fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttrib2fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttrib2fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIB3F_0100
     * @tc.name       : testGLVertexAttrib3f001
     * @tc.desc       : test glVertexAttrib3f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttrib3f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttrib3f();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIB3FV_0100
     * @tc.name       : testGLVertexAttrib3fv001
     * @tc.desc       : test glVertexAttrib3fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttrib3fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttrib3fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIB4F_0100
     * @tc.name       : testGLVertexAttrib4f001
     * @tc.desc       : test glVertexAttrib4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttrib4f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttrib4f();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIB4FV_0100
     * @tc.name       : testGLVertexAttrib4fv001
     * @tc.desc       : test glVertexAttrib4fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttrib4fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttrib4fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIBBINDING_0100
     * @tc.name       : testGLVertexAttribBinding001
     * @tc.desc       : test glVertexAttribBinding
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttribBinding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttribBinding();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIBDIVISOR_0100
     * @tc.name       : testGLVertexAttribDivisor001
     * @tc.desc       : test glVertexAttribDivisor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttribDivisor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttribDivisor();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIBFORMAT_0100
     * @tc.name       : testGLVertexAttribFormat001
     * @tc.desc       : test glVertexAttribFormat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttribFormat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttribFormat();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIBI4I_0100
     * @tc.name       : testGLVertexAttribI4i001
     * @tc.desc       : test glVertexAttribI4i
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttribI4i001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttribI4i();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIBI4IV_0100
     * @tc.name       : testGLVertexAttribI4iv001
     * @tc.desc       : test glVertexAttribI4iv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttribI4iv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttribI4iv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIBI4UI_0100
     * @tc.name       : testGLVertexAttribI4ui001
     * @tc.desc       : test glVertexAttribI4ui
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttribI4ui001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttribI4ui();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIBI4UIV_0100
     * @tc.name       : testGLVertexAttribI4uiv001
     * @tc.desc       : test glVertexAttribI4uiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttribI4uiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttribI4uiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIBIFORMAT_0100
     * @tc.name       : testGLVertexAttribIFormat001
     * @tc.desc       : test glVertexAttribIFormat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttribIFormat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttribIFormat();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIBIPOINTER_0100
     * @tc.name       : testGLVertexAttribIPointer001
     * @tc.desc       : test glVertexAttribIPointer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttribIPointer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttribIPointer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXATTRIBPOINTER_0100
     * @tc.name       : testGLVertexAttribPointer001
     * @tc.desc       : test glVertexAttribPointer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexAttribPointer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexAttribPointer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVERTEXBINDINGDIVISOR_0100
     * @tc.name       : testGLVertexBindingDivisor001
     * @tc.desc       : test glVertexBindingDivisor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLVertexBindingDivisor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLVertexBindingDivisor();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLVIEWPORT_0100
     * @tc.name       : testGLViewport001
     * @tc.desc       : test glViewport
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLViewport001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLViewport();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLWAITSYNC_0100
     * @tc.name       : testGLWaitSync001
     * @tc.desc       : test glWaitSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLWaitSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLWaitSync();
      expect(result).assertEqual(0);
      done();
    });

    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLACTIVESHADERPROGRAM_0200
     * @tc.name       : testGLActiveShaderProgram002
     * @tc.desc       : test glActiveShaderProgram
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLActiveShaderProgram002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glActiveShaderProgramAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLACTIVETEXTURE_0200
     * @tc.name       : testGLActiveTexture002
     * @tc.desc       : test glActiveTexture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLActiveTexture002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glActiveTextureAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLATTACHSHADER_0200
     * @tc.name       : testGLAttachShader002
     * @tc.desc       : test glAttachShader
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLAttachShader002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glAttachShaderAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBEGINQUERY_0200
     * @tc.name       : testGLBeginQuery002
     * @tc.desc       : test glBeginQuery
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBeginQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBeginQueryAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBEGINTRANSFORMFEEDBACK_0200
     * @tc.name       : testGLBeginTransformFeedback002
     * @tc.desc       : test glBeginTransformFeedback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBeginTransformFeedback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glBeginTransformFeedbackAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBINDATTRIBLOCATION_0200
     * @tc.name       : testGLBindAttribLocation002
     * @tc.desc       : test glBindAttribLocation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindAttribLocation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBindAttribLocationAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBINDBUFFER_0200
     * @tc.name       : testGLBindBuffer002
     * @tc.desc       : test glBindBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBindBufferAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBINDBUFFERBASE_0200
     * @tc.name       : testGLBindBufferBase002
     * @tc.desc       : test glBindBufferBase
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindBufferBase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBindBufferBaseAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBINDBUFFERRANGE_0200
     * @tc.name       : testGLBindBufferRange002
     * @tc.desc       : test glBindBufferRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindBufferRange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBindBufferRangeAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBINDFRAMEBUFFER_0200
     * @tc.name       : testGLBindFramebuffer002
     * @tc.desc       : test glBindFramebuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindFramebuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBindFramebufferAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBINDIMAGETEXTURE_0200
     * @tc.name       : testGLBindImageTexture002
     * @tc.desc       : test glBindImageTexture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindImageTexture002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBindImageTextureAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBINDPROGRAMPIPELINE_0200
     * @tc.name       : testGLBindProgramPipeline002
     * @tc.desc       : test glBindProgramPipeline
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindProgramPipeline002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBindProgramPipelineAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBINDRENDERBUFFER_0200
     * @tc.name       : testGLBindRenderbuffer002
     * @tc.desc       : test glBindRenderbuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindRenderbuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBindRenderbufferAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBINDSAMPLER_0200
     * @tc.name       : testGLBindSampler002
     * @tc.desc       : test glBindSampler
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindSampler002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBindSamplerAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBINDTEXTURE_0200
     * @tc.name       : testGLBindTexture002
     * @tc.desc       : test glBindTexture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindTexture002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBindTextureAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBINDTRANSFORMFEEDBACK_0200
     * @tc.name       : testGLBindTransformFeedback002
     * @tc.desc       : test glBindTransformFeedback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindTransformFeedback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glBindTransformFeedbackAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBINDVERTEXARRAY_0200
     * @tc.name       : testGLBindVertexArray002
     * @tc.desc       : test glBindVertexArray
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindVertexArray002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBindVertexArrayAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBINDVERTEXBUFFER_0200
     * @tc.name       : testGLBindVertexBuffer002
     * @tc.desc       : test glBindVertexBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindVertexBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBindVertexBufferAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBLENDEQUATION_0200
     * @tc.name       : testGLBlendEquation002
     * @tc.desc       : test glBlendEquation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendEquation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBlendEquationAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBLENDEQUATIONI_0200
     * @tc.name       : testGLBlendEquationi002
     * @tc.desc       : test glBlendEquationi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendEquationi002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBlendEquationiAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBLENDEQUATIONSEPARATE_0200
     * @tc.name       : testGLBlendEquationSeparate002
     * @tc.desc       : test glBlendEquationSeparate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendEquationSeparate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glBlendEquationSeparateAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBLENDEQUATIONSEPARATEI_0200
     * @tc.name       : testGLBlendEquationSeparatei002
     * @tc.desc       : test glBlendEquationSeparatei
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendEquationSeparatei002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glBlendEquationSeparateiAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBLENDFUNC_0200
     * @tc.name       : testGLBlendFunc002
     * @tc.desc       : test glBlendFunc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendFunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBlendFuncAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBLENDFUNCI_0200
     * @tc.name       : testGLBlendFunci002
     * @tc.desc       : test glBlendFunci
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendFunci002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBlendFunciAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBLENDFUNCSEPARATE_0200
     * @tc.name       : testGLBlendFuncSeparate002
     * @tc.desc       : test glBlendFuncSeparate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendFuncSeparate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBlendFuncSeparateAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBLENDFUNCSEPARATEI_0200
     * @tc.name       : testGLBlendFuncSeparatei002
     * @tc.desc       : test glBlendFuncSeparatei
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendFuncSeparatei002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBlendFuncSeparateiAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBLITFRAMEBUFFER_0200
     * @tc.name       : testGLBlitFramebuffer002
     * @tc.desc       : test glBlitFramebuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlitFramebuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBlitFramebufferAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBUFFERDATA_0200
     * @tc.name       : testGLBufferData002
     * @tc.desc       : test glBufferData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBufferData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBufferDataAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLBUFFERSUBDATA_0200
     * @tc.name       : testGLBufferSubData002
     * @tc.desc       : test glBufferSubData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBufferSubData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glBufferSubDataAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCHECKFRAMEBUFFERSTATUS_0200
     * @tc.name       : testGLCheckFramebufferStatus002
     * @tc.desc       : test glCheckFramebufferStatus
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCheckFramebufferStatus002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glCheckFramebufferStatusAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCLEAR_0200
     * @tc.name       : testGLClear002
     * @tc.desc       : test glClear
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClear002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glClearAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCLEARBUFFERFI_0200
     * @tc.name       : testGLClearBufferfi002
     * @tc.desc       : test glClearBufferfi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClearBufferfi002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glClearBufferfiAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCLEARBUFFERFV_0200
     * @tc.name       : testGLClearBufferfv002
     * @tc.desc       : test glClearBufferfv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClearBufferfv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glClearBufferfvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCLEARBUFFERIV_0200
     * @tc.name       : testGLClearBufferiv002
     * @tc.desc       : test glClearBufferiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClearBufferiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glClearBufferivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCLEARBUFFERUIV_0200
     * @tc.name       : testGLClearBufferuiv002
     * @tc.desc       : test glClearBufferuiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClearBufferuiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glClearBufferuivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCLIENTWAITSYNC_0200
     * @tc.name       : testGLClientWaitSync002
     * @tc.desc       : test glClientWaitSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClientWaitSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glClientWaitSyncAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCOLORMASKI_0200
     * @tc.name       : testGLColorMaski002
     * @tc.desc       : test glColorMaski
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLColorMaski002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glColorMaskiAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCOPYBUFFERSUBDATA_0200
     * @tc.name       : testGLCopyBufferSubData002
     * @tc.desc       : test glCopyBufferSubData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCopyBufferSubData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glCopyBufferSubDataAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCOPYIMAGESUBDATA_0200
     * @tc.name       : testGLCopyImageSubData002
     * @tc.desc       : test glCopyImageSubData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCopyImageSubData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glCopyImageSubDataAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCOPYTEXIMAGE2D_0200
     * @tc.name       : testGLCopyTexImage2D002
     * @tc.desc       : test glCopyTexImage2D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCopyTexImage2D002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glCopyTexImage2DAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCOPYTEXSUBIMAGE2D_0200
     * @tc.name       : testGLCopyTexSubImage2D002
     * @tc.desc       : test glCopyTexSubImage2D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCopyTexSubImage2D002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glCopyTexSubImage2DAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCREATESHADER_0200
     * @tc.name       : testGLCreateShader002
     * @tc.desc       : test glCreateShader
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCreateShader002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glCreateShaderAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCREATESHADERPROGRAMV_0200
     * @tc.name       : testGLCreateShaderProgramv002
     * @tc.desc       : test glCreateShaderProgramv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCreateShaderProgramv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glCreateShaderProgramvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCULLFACE_0200
     * @tc.name       : testGLCullFace002
     * @tc.desc       : test glCullFace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCullFace002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glCullFaceAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDEBUGMESSAGECONTROL_0200
     * @tc.name       : testGLDebugMessageControl002
     * @tc.desc       : test glDebugMessageControl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDebugMessageControl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDebugMessageControlAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDELETEBUFFERS_0200
     * @tc.name       : testGLDeleteBuffers002
     * @tc.desc       : test glDeleteBuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteBuffers002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDeleteBuffersAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDELETEFRAMEBUFFERS_0200
     * @tc.name       : testGLDeleteFramebuffers002
     * @tc.desc       : test glDeleteFramebuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteFramebuffers002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDeleteFramebuffersAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDELETEPROGRAM_0200
     * @tc.name       : testGLDeleteProgram002
     * @tc.desc       : test glDeleteProgram
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteProgram002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDeleteProgramAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDELETEPROGRAMPIPELINES_0200
     * @tc.name       : testGLDeleteProgramPipelines002
     * @tc.desc       : test glDeleteProgramPipelines
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteProgramPipelines002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glDeleteProgramPipelinesAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDELETEQUERIES_0200
     * @tc.name       : testGLDeleteQueries002
     * @tc.desc       : test glDeleteQueries
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteQueries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDeleteQueriesAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDELETERENDERBUFFERS_0200
     * @tc.name       : testGLDeleteRenderbuffers002
     * @tc.desc       : test glDeleteRenderbuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteRenderbuffers002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDeleteRenderbuffersAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDELETESAMPLERS_0200
     * @tc.name       : testGLDeleteSamplers002
     * @tc.desc       : test glDeleteSamplers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteSamplers002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDeleteSamplersAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDELETESHADER_0200
     * @tc.name       : testGLDeleteShader002
     * @tc.desc       : test glDeleteShader
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteShader002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDeleteShaderAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDELETESYNC_0200
     * @tc.name       : testGLDeleteSync002
     * @tc.desc       : test glDeleteSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDeleteSyncAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDELETETEXTURES_0200
     * @tc.name       : testGLDeleteTextures002
     * @tc.desc       : test glDeleteTextures
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteTextures002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDeleteTexturesAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDELETETRANSFORMFEEDBACKS_0200
     * @tc.name       : testGLDeleteTransformFeedbacks002
     * @tc.desc       : test glDeleteTransformFeedbacks
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteTransformFeedbacks002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glDeleteTransformFeedbacksAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDELETEVERTEXARRAYS_0200
     * @tc.name       : testGLDeleteVertexArrays002
     * @tc.desc       : test glDeleteVertexArrays
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteVertexArrays002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDeleteVertexArraysAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDEPTHFUNC_0200
     * @tc.name       : testGLDepthFunc002
     * @tc.desc       : test glDepthFunc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDepthFunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDepthFuncAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDETACHSHADER_0200
     * @tc.name       : testGLDetachShader002
     * @tc.desc       : test glDetachShader
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDetachShader002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDetachShaderAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDISABLE_0200
     * @tc.name       : testGLDisable002
     * @tc.desc       : test glDisable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDisable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDisableAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDISABLEI_0200
     * @tc.name       : testGLDisablei002
     * @tc.desc       : test glDisablei
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDisablei002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDisableiAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDISABLEVERTEXATTRIBARRAY_0200
     * @tc.name       : testGLDisableVertexAttribArray002
     * @tc.desc       : test glDisableVertexAttribArray
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDisableVertexAttribArray002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glDisableVertexAttribArrayAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDISPATCHCOMPUTE_0200
     * @tc.name       : testGLDispatchCompute002
     * @tc.desc       : test glDispatchCompute
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDispatchCompute002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDispatchComputeAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDISPATCHCOMPUTEINDIRECT_0200
     * @tc.name       : testGLDispatchComputeIndirect002
     * @tc.desc       : test glDispatchComputeIndirect
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDispatchComputeIndirect002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glDispatchComputeIndirectAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDRAWARRAYS_0200
     * @tc.name       : testGLDrawArrays002
     * @tc.desc       : test glDrawArrays
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawArrays002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDrawArraysAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDRAWARRAYSINDIRECT_0200
     * @tc.name       : testGLDrawArraysIndirect002
     * @tc.desc       : test glDrawArraysIndirect
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawArraysIndirect002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDrawArraysIndirectAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDRAWARRAYSINSTANCED_0200
     * @tc.name       : testGLDrawArraysInstanced002
     * @tc.desc       : test glDrawArraysInstanced
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawArraysInstanced002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDrawArraysInstancedAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDRAWBUFFERS_0200
     * @tc.name       : testGLDrawBuffers002
     * @tc.desc       : test glDrawBuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawBuffers002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDrawBuffersAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLFLUSHMAPPEDBUFFERRANGE_0200
     * @tc.name       : testGLFlushMappedBufferRange002
     * @tc.desc       : test glFlushMappedBufferRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFlushMappedBufferRange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glFlushMappedBufferRangeAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLFRAMEBUFFERPARAMETERI_0200
     * @tc.name       : testGLFramebufferParameteri002
     * @tc.desc       : test glFramebufferParameteri
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFramebufferParameteri002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glFramebufferParameteriAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLFRAMEBUFFERRENDERBUFFER_0200
     * @tc.name       : testGLFramebufferRenderbuffer002
     * @tc.desc       : test glFramebufferRenderbuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFramebufferRenderbuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glFramebufferRenderbufferAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLFRAMEBUFFERTEXTURE_0200
     * @tc.name       : testGLFramebufferTexture002
     * @tc.desc       : test glFramebufferTexture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFramebufferTexture002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glFramebufferTextureAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLFRAMEBUFFERTEXTURE2D_0200
     * @tc.name       : testGLFramebufferTexture2D002
     * @tc.desc       : test glFramebufferTexture2D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFramebufferTexture2D002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glFramebufferTexture2DAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLFRAMEBUFFERTEXTURELAYER_0200
     * @tc.name       : testGLFramebufferTextureLayer002
     * @tc.desc       : test glFramebufferTextureLayer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFramebufferTextureLayer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glFramebufferTextureLayerAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLFRONTFACE_0200
     * @tc.name       : testGLFrontFace002
     * @tc.desc       : test glFrontFace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFrontFace002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glFrontFaceAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGENBUFFERS_0200
     * @tc.name       : testGLGenBuffers002
     * @tc.desc       : test glGenBuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenBuffers002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGenBuffersAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGENERATEMIPMAP_0200
     * @tc.name       : testGLGenerateMipmap002
     * @tc.desc       : test glGenerateMipmap
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenerateMipmap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGenerateMipmapAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGENFRAMEBUFFERS_0200
     * @tc.name       : testGLGenFramebuffers002
     * @tc.desc       : test glGenFramebuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenFramebuffers002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGenFramebuffersAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGENPROGRAMPIPELINES_0200
     * @tc.name       : testGLGenProgramPipelines002
     * @tc.desc       : test glGenProgramPipelines
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenProgramPipelines002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGenProgramPipelinesAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGENQUERIES_0200
     * @tc.name       : testGLGenQueries002
     * @tc.desc       : test glGenQueries
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenQueries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGenQueriesAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGENRENDERBUFFERS_0200
     * @tc.name       : testGLGenRenderbuffers002
     * @tc.desc       : test glGenRenderbuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenRenderbuffers002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGenRenderbuffersAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGENSAMPLERS_0200
     * @tc.name       : testGLGenSamplers002
     * @tc.desc       : test glGenSamplers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenSamplers002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGenSamplersAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGENTEXTURES_0200
     * @tc.name       : testGLGenTextures002
     * @tc.desc       : test glGenTextures
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenTextures002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGenTexturesAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGENTRANSFORMFEEDBACKS_0200
     * @tc.name       : testGLGenTransformFeedbacks002
     * @tc.desc       : test glGenTransformFeedbacks
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenTransformFeedbacks002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glGenTransformFeedbacksAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGENVERTEXARRAYS_0200
     * @tc.name       : testGLGenVertexArrays002
     * @tc.desc       : test glGenVertexArrays
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenVertexArrays002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGenVertexArraysAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETACTIVEATTRIB_0200
     * @tc.name       : testGLGetActiveAttrib002
     * @tc.desc       : test glGetActiveAttrib
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetActiveAttrib002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetActiveAttribAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETATTACHEDSHADERS_0200
     * @tc.name       : testGLGetAttachedShaders002
     * @tc.desc       : test glGetAttachedShaders
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetAttachedShaders002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetAttachedShadersAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETATTRIBLOCATION_0200
     * @tc.name       : testGLGetAttribLocation002
     * @tc.desc       : test glGetAttribLocation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetAttribLocation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetAttribLocationAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETBOOLEANI_V_0200
     * @tc.name       : testGLGetBooleani_v002
     * @tc.desc       : test glGetBooleani_v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetBooleani_v002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetBooleani_vAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETBOOLEANV_0200
     * @tc.name       : testGLGetBooleanv002
     * @tc.desc       : test glGetBooleanv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetBooleanv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetBooleanvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETBUFFERPARAMETERI64V_0200
     * @tc.name       : testGLGetBufferParameteri64v002
     * @tc.desc       : test glGetBufferParameteri64v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetBufferParameteri64v002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glGetBufferParameteri64vAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETBUFFERPARAMETERIV_0200
     * @tc.name       : testGLGetBufferParameteriv002
     * @tc.desc       : test glGetBufferParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetBufferParameteriv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetBufferParameterivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETBUFFERPOINTERV_0200
     * @tc.name       : testGLGetBufferPointerv002
     * @tc.desc       : test glGetBufferPointerv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetBufferPointerv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetBufferPointervAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETFLOATV_0200
     * @tc.name       : testGLGetFloatv002
     * @tc.desc       : test glGetFloatv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetFloatv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetFloatvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETFRAGDATALOCATION_0200
     * @tc.name       : testGLGetFragDataLocation002
     * @tc.desc       : test glGetFragDataLocation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetFragDataLocation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetFragDataLocationAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETFRAMEBUFFERATTACHMENTPARAMETERIV_0200
     * @tc.name       : testGLGetFramebufferAttachmentParameteriv002
     * @tc.desc       : test glGetFramebufferAttachmentParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetFramebufferAttachmentParameteriv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glGetFramebufferAttachmentParameterivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETFRAMEBUFFERPARAMETERIV_0200
     * @tc.name       : testGLGetFramebufferParameteriv002
     * @tc.desc       : test glGetFramebufferParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetFramebufferParameteriv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glGetFramebufferParameterivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETINTEGER64I_V_0200
     * @tc.name       : testGLGetInteger64i_v002
     * @tc.desc       : test glGetInteger64i_v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetInteger64i_v002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetInteger64i_vAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETINTEGER64V_0200
     * @tc.name       : testGLGetInteger64v002
     * @tc.desc       : test glGetInteger64v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetInteger64v002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetInteger64vAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETINTEGERI_V_0200
     * @tc.name       : testGLGetIntegeri_v002
     * @tc.desc       : test glGetIntegeri_v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetIntegeri_v002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetIntegeri_vAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETINTEGERV_0200
     * @tc.name       : testGLGetIntegerv002
     * @tc.desc       : test glGetIntegerv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetIntegerv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetIntegervAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETINTERNALFORMATIV_0200
     * @tc.name       : testGLGetInternalformativ002
     * @tc.desc       : test glGetInternalformativ
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetInternalformativ002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetInternalformativAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETOBJECTLABEL_0200
     * @tc.name       : testGLGetObjectLabel002
     * @tc.desc       : test glGetObjectLabel
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetObjectLabel002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetObjectLabelAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETOBJECTPTRLABEL_0200
     * @tc.name       : testGLGetObjectPtrLabel002
     * @tc.desc       : test glGetObjectPtrLabel
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetObjectPtrLabel002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetObjectPtrLabelAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETPOINTERV_0200
     * @tc.name       : testGLGetPointerv002
     * @tc.desc       : test glGetPointerv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetPointerv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetPointervAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETPROGRAMBINARY_0200
     * @tc.name       : testGLGetProgramBinary002
     * @tc.desc       : test glGetProgramBinary
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramBinary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetProgramBinaryAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETPROGRAMINTERFACEIV_0200
     * @tc.name       : testGLGetProgramInterfaceiv002
     * @tc.desc       : test glGetProgramInterfaceiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramInterfaceiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glGetProgramInterfaceivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETPROGRAMIV_0200
     * @tc.name       : testGLGetProgramiv002
     * @tc.desc       : test glGetProgramiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetProgramivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETPROGRAMPIPELINEIV_0200
     * @tc.name       : testGLGetProgramPipelineiv002
     * @tc.desc       : test glGetProgramPipelineiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramPipelineiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetProgramPipelineivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETPROGRAMRESOURCEINDEX_0200
     * @tc.name       : testGLGetProgramResourceIndex002
     * @tc.desc       : test glGetProgramResourceIndex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramResourceIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glGetProgramResourceIndexAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETPROGRAMRESOURCEIV_0200
     * @tc.name       : testGLGetProgramResourceiv002
     * @tc.desc       : test glGetProgramResourceiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramResourceiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetProgramResourceivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETPROGRAMRESOURCELOCATION_0200
     * @tc.name       : testGLGetProgramResourceLocation002
     * @tc.desc       : test glGetProgramResourceLocation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramResourceLocation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glGetProgramResourceLocationAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETPROGRAMRESOURCENAME_0200
     * @tc.name       : testGLGetProgramResourceName002
     * @tc.desc       : test glGetProgramResourceName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramResourceName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glGetProgramResourceNameAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETQUERYIV_0200
     * @tc.name       : testGLGetQueryiv002
     * @tc.desc       : test glGetQueryiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetQueryiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetQueryivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETQUERYOBJECTUIV_0200
     * @tc.name       : testGLGetQueryObjectuiv002
     * @tc.desc       : test glGetQueryObjectuiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetQueryObjectuiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glGetQueryObjectuivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETRENDERBUFFERPARAMETERIV_0200
     * @tc.name       : testGLGetRenderbufferParameteriv002
     * @tc.desc       : test glGetRenderbufferParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetRenderbufferParameteriv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glGetRenderbufferParameterivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETSAMPLERPARAMETERFV_0200
     * @tc.name       : testGLGetSamplerParameterfv002
     * @tc.desc       : test glGetSamplerParameterfv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetSamplerParameterfv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glGetSamplerParameterfvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETSAMPLERPARAMETERIIV_0200
     * @tc.name       : testGLGetSamplerParameterIiv002
     * @tc.desc       : test glGetSamplerParameterIiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetSamplerParameterIiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glGetSamplerParameterIivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETSAMPLERPARAMETERIUIV_0200
     * @tc.name       : testGLGetSamplerParameterIuiv002
     * @tc.desc       : test glGetSamplerParameterIuiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetSamplerParameterIuiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glGetSamplerParameterIuivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLGETSAMPLERPARAMETERIV_0200
     * @tc.name       : testGLGetSamplerParameteriv002
     * @tc.desc       : test glGetSamplerParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetSamplerParameteriv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glGetSamplerParameterivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM1F_0200
     * @tc.name       : testGLUniform1f002
     * @tc.desc       : test glUniform1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform1f002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform1fAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM1FV_0200
     * @tc.name       : testGLUniform1fv002
     * @tc.desc       : test glUniform1fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform1fv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform1fvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM1I_0200
     * @tc.name       : testGLUniform1i002
     * @tc.desc       : test glUniform1i
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform1i002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform1iAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM1IV_0200
     * @tc.name       : testGLUniform1iv002
     * @tc.desc       : test glUniform1iv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform1iv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform1ivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM1UI_0200
     * @tc.name       : testGLUniform1ui002
     * @tc.desc       : test glUniform1ui
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform1ui002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform1uiAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM1UIV_0200
     * @tc.name       : testGLUniform1uiv002
     * @tc.desc       : test glUniform1uiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform1uiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform1uivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM2F_0200
     * @tc.name       : testGLUniform2f002
     * @tc.desc       : test glUniform2f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform2f002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform2fAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM2FV_0200
     * @tc.name       : testGLUniform2fv002
     * @tc.desc       : test glUniform2fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform2fv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform2fvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM2I_0200
     * @tc.name       : testGLUniform2i002
     * @tc.desc       : test glUniform2i
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform2i002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform2iAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM2IV_0200
     * @tc.name       : testGLUniform2iv002
     * @tc.desc       : test glUniform2iv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform2iv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform2ivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM2UI_0200
     * @tc.name       : testGLUniform2ui002
     * @tc.desc       : test glUniform2ui
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform2ui002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform2uiAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM2UIV_0200
     * @tc.name       : testGLUniform2uiv002
     * @tc.desc       : test glUniform2uiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform2uiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform2uivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM3F_0200
     * @tc.name       : testGLUniform3f002
     * @tc.desc       : test glUniform3f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform3f002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform3fAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM3FV_0200
     * @tc.name       : testGLUniform3fv002
     * @tc.desc       : test glUniform3fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform3fv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform3fvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM3I_0200
     * @tc.name       : testGLUniform3i002
     * @tc.desc       : test glUniform3i
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform3i002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform3iAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM3IV_0200
     * @tc.name       : testGLUniform3iv002
     * @tc.desc       : test glUniform3iv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform3iv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform3ivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM3UI_0200
     * @tc.name       : testGLUniform3ui002
     * @tc.desc       : test glUniform3ui
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform3ui002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform3uiAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM3UIV_0200
     * @tc.name       : testGLUniform3uiv002
     * @tc.desc       : test glUniform3uiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform3uiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform3uivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM4F_0200
     * @tc.name       : testGLUniform4f002
     * @tc.desc       : test glUniform4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform4f002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform4fAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM4FV_0200
     * @tc.name       : testGLUniform4fv002
     * @tc.desc       : test glUniform4fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform4fv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform4fvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM4I_0200
     * @tc.name       : testGLUniform4i002
     * @tc.desc       : test glUniform4i
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform4i002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform4iAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM4IV_0200
     * @tc.name       : testGLUniform4iv002
     * @tc.desc       : test glUniform4iv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform4iv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform4ivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM4UI_0200
     * @tc.name       : testGLUniform4ui002
     * @tc.desc       : test glUniform4ui
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform4ui002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform4uiAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORM4UIV_0200
     * @tc.name       : testGLUniform4uiv002
     * @tc.desc       : test glUniform4uiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniform4uiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniform4uivAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORMBLOCKBINDING_0200
     * @tc.name       : testGLUniformBlockBinding002
     * @tc.desc       : test glUniformBlockBinding
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformBlockBinding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniformBlockBindingAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORMMATRIX2FV_0200
     * @tc.name       : testGLUniformMatrix2fv002
     * @tc.desc       : test glUniformMatrix2fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix2fv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniformMatrix2fvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORMMATRIX2X3FV_0200
     * @tc.name       : testGLUniformMatrix2x3fv002
     * @tc.desc       : test glUniformMatrix2x3fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix2x3fv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniformMatrix2x3fvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORMMATRIX2X4FV_0200
     * @tc.name       : testGLUniformMatrix2x4fv002
     * @tc.desc       : test glUniformMatrix2x4fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix2x4fv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniformMatrix2x4fvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORMMATRIX3FV_0200
     * @tc.name       : testGLUniformMatrix3fv002
     * @tc.desc       : test glUniformMatrix3fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix3fv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniformMatrix3fvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORMMATRIX3X2FV_0200
     * @tc.name       : testGLUniformMatrix3x2fv002
     * @tc.desc       : test glUniformMatrix3x2fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix3x2fv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniformMatrix3x2fvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORMMATRIX3X4FV_0200
     * @tc.name       : testGLUniformMatrix3x4fv002
     * @tc.desc       : test glUniformMatrix3x4fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix3x4fv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniformMatrix3x4fvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORMMATRIX4FV_0200
     * @tc.name       : testGLUniformMatrix4fv002
     * @tc.desc       : test glUniformMatrix4fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix4fv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniformMatrix4fvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORMMATRIX4X2FV_0200
     * @tc.name       : testGLUniformMatrix4x2fv002
     * @tc.desc       : test glUniformMatrix4x2fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix4x2fv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniformMatrix4x2fvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLUNIFORMMATRIX4X3FV_0200
     * @tc.name       : testGLUniformMatrix4x3fv002
     * @tc.desc       : test glUniformMatrix4x3fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLUniformMatrix4x3fv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glUniformMatrix4x3fvAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCOMPILESHADER_0200
     * @tc.name       : testGLCompileShader002
     * @tc.desc       : test glCompileShader
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCompileShader002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glCompileShaderAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCOMPRESSEDTEXIMAGE2D_0200
     * @tc.name       : testGLCompressedTexImage2D002
     * @tc.desc       : test glCompressedTexImage2D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCompressedTexImage2D002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glCompressedTexImage2DAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCOMPRESSEDTEXIMAGE3D_0200
     * @tc.name       : testGLCompressedTexImage3D002
     * @tc.desc       : test glCompressedTexImage3D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCompressedTexImage3D002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glCompressedTexImage3DAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCOMPRESSEDTEXSUBIMAGE2D_0200
     * @tc.name       : testGLCompressedTexSubImage2D002
     * @tc.desc       : test glCompressedTexSubImage2D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCompressedTexSubImage2D002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glCompressedTexSubImage2DAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCOMPRESSEDTEXSUBIMAGE3D_0200
     * @tc.name       : testGLCompressedTexSubImage3D002
     * @tc.desc       : test glCompressedTexSubImage3D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCompressedTexSubImage3D002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glCompressedTexSubImage3DAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLCOPYTEXSUBIMAGE3D_0200
     * @tc.name       : testGLCopyTexSubImage3D002
     * @tc.desc       : test glCopyTexSubImage3D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCopyTexSubImage3D002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glCopyTexSubImage3DAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDRAWELEMENTS_0200
     * @tc.name       : testGLDrawElements002
     * @tc.desc       : test glDrawElements
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawElements002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDrawElementsAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDRAWELEMENTSBASEVERTEX_0200
     * @tc.name       : testGLDrawElementsBaseVertex002
     * @tc.desc       : test glDrawElementsBaseVertex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawElementsBaseVertex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glDrawElementsBaseVertexAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDRAWELEMENTSINDIRECT_0200
     * @tc.name       : testGLDrawElementsIndirect002
     * @tc.desc       : test glDrawElementsIndirect
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawElementsIndirect002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDrawElementsIndirectAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDRAWELEMENTSINSTANCED_0200
     * @tc.name       : testGLDrawElementsInstanced002
     * @tc.desc       : test glDrawElementsInstanced
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawElementsInstanced002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glDrawElementsInstancedAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDRAWELEMENTSINSTANCEDBASEVERTEX_0200
     * @tc.name       : testGLDrawElementsInstancedBaseVertex002
     * @tc.desc       : test glDrawElementsInstancedBaseVertex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawElementsInstancedBaseVertex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glDrawElementsInstancedBaseVertexAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDRAWRANGEELEMENTS_0200
     * @tc.name       : testGLDrawRangeElements002
     * @tc.desc       : test glDrawRangeElements
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawRangeElements002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glDrawRangeElementsAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLDRAWRANGEELEMENTSBASEVERTEX_0200
     * @tc.name       : testGLDrawRangeElementsBaseVertex002
     * @tc.desc       : test glDrawRangeElementsBaseVertex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawRangeElementsBaseVertex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glDrawRangeElementsBaseVertexAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLENABLE_0200
     * @tc.name       : testGLEnable002
     * @tc.desc       : test glEnable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLEnable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glEnableAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLENABLEI_0200
     * @tc.name       : testGLEnablei002
     * @tc.desc       : test glEnablei
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLEnablei002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glEnableiAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLENABLEVERTEXATTRIBARRAY_0200
     * @tc.name       : testGLEnableVertexAttribArray002
     * @tc.desc       : test glEnableVertexAttribArray
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLEnableVertexAttribArray002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.glEnableVertexAttribArrayAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLENDQUERY_0200
     * @tc.name       : testGLEndQuery002
     * @tc.desc       : test glEndQuery
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLEndQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glEndQueryAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLENDTRANSFORMFEEDBACK_0200
     * @tc.name       : testGLEndTransformFeedback002
     * @tc.desc       : test glEndTransformFeedback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLEndTransformFeedback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glEndTransformFeedbackAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLESV3_GLFENCESYNC_0200
     * @tc.name       : testGLFenceSync002
     * @tc.desc       : test glFenceSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFenceSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.glFenceSyncAbnormal();
      expect(result).assertEqual(-1);
      done();
    });
  })
}

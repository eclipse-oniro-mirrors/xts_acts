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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLACTIVESHADERPROGRAM_0100
     * @tc.name       : testGLActiveShaderProgram001
     * @tc.desc       : test glActiveShaderProgram
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLActiveShaderProgram001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLActiveShaderProgram();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLACTIVETEXTURE_0100
     * @tc.name       : testGLActiveTexture001
     * @tc.desc       : test glActiveTexture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLActiveTexture001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLActiveTexture();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLATTACHSHADER_0100
     * @tc.name       : testGLAttachShader001
     * @tc.desc       : test glAttachShader
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLAttachShader001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLAttachShader();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBEGINQUERY_0100
     * @tc.name       : testGLBeginQuery001
     * @tc.desc       : test glBeginQuery
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBeginQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBeginQuery();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBEGINTRANSFORMFEEDBACK_0100
     * @tc.name       : testGLBeginTransformFeedback001
     * @tc.desc       : test glBeginTransformFeedback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBeginTransformFeedback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLBeginTransformFeedback();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBINDATTRIBLOCATION_0100
     * @tc.name       : testGLBindAttribLocation001
     * @tc.desc       : test glBindAttribLocation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindAttribLocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBindAttribLocation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBINDBUFFER_0100
     * @tc.name       : testGLBindBuffer001
     * @tc.desc       : test glBindBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBindBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBINDBUFFERBASE_0100
     * @tc.name       : testGLBindBufferBase001
     * @tc.desc       : test glBindBufferBase
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindBufferBase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBindBufferBase();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBINDBUFFERRANGE_0100
     * @tc.name       : testGLBindBufferRange001
     * @tc.desc       : test glBindBufferRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindBufferRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBindBufferRange();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBINDFRAMEBUFFER_0100
     * @tc.name       : testGLBindFramebuffer001
     * @tc.desc       : test glBindFramebuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindFramebuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBindFramebuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBINDIMAGETEXTURE_0100
     * @tc.name       : testGLBindImageTexture001
     * @tc.desc       : test glBindImageTexture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindImageTexture001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBindImageTexture();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBINDPROGRAMPIPELINE_0100
     * @tc.name       : testGLBindProgramPipeline001
     * @tc.desc       : test glBindProgramPipeline
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindProgramPipeline001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBindProgramPipeline();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBINDRENDERBUFFER_0100
     * @tc.name       : testGLBindRenderbuffer001
     * @tc.desc       : test glBindRenderbuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindRenderbuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBindRenderbuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBINDSAMPLER_0100
     * @tc.name       : testGLBindSampler001
     * @tc.desc       : test glBindSampler
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindSampler001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBindSampler();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBINDTEXTURE_0100
     * @tc.name       : testGLBindTexture001
     * @tc.desc       : test glBindTexture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindTexture001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBindTexture();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBINDTRANSFORMFEEDBACK_0100
     * @tc.name       : testGLBindTransformFeedback001
     * @tc.desc       : test glBindTransformFeedback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindTransformFeedback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLBindTransformFeedback();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBINDVERTEXARRAY_0100
     * @tc.name       : testGLBindVertexArray001
     * @tc.desc       : test glBindVertexArray
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindVertexArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBindVertexArray();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBINDVERTEXBUFFER_0100
     * @tc.name       : testGLBindVertexBuffer001
     * @tc.desc       : test glBindVertexBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBindVertexBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBindVertexBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBLENDBARRIER_0100
     * @tc.name       : testGLBlendBarrier001
     * @tc.desc       : test glBlendBarrier
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendBarrier001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBlendBarrier();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBLENDCOLOR_0100
     * @tc.name       : testGLBlendColor001
     * @tc.desc       : test glBlendColor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendColor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBlendColor();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBLENDEQUATION_0100
     * @tc.name       : testGLBlendEquation001
     * @tc.desc       : test glBlendEquation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendEquation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBlendEquation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBLENDEQUATIONI_0100
     * @tc.name       : testGLBlendEquationi001
     * @tc.desc       : test glBlendEquationi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendEquationi001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBlendEquationi();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBLENDEQUATIONSEPARATE_0100
     * @tc.name       : testGLBlendEquationSeparate001
     * @tc.desc       : test glBlendEquationSeparate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendEquationSeparate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLBlendEquationSeparate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBLENDEQUATIONSEPARATEI_0100
     * @tc.name       : testGLBlendEquationSeparatei001
     * @tc.desc       : test glBlendEquationSeparatei
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendEquationSeparatei001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLBlendEquationSeparatei();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBLENDFUNC_0100
     * @tc.name       : testGLBlendFunc001
     * @tc.desc       : test glBlendFunc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendFunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBlendFunc();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBLENDFUNCI_0100
     * @tc.name       : testGLBlendFunci001
     * @tc.desc       : test glBlendFunci
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendFunci001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBlendFunci();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBLENDFUNCSEPARATE_0100
     * @tc.name       : testGLBlendFuncSeparate001
     * @tc.desc       : test glBlendFuncSeparate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendFuncSeparate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBlendFuncSeparate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBLENDFUNCSEPARATEI_0100
     * @tc.name       : testGLBlendFuncSeparatei001
     * @tc.desc       : test glBlendFuncSeparatei
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlendFuncSeparatei001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBlendFuncSeparatei();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBLITFRAMEBUFFER_0100
     * @tc.name       : testGLBlitFramebuffer001
     * @tc.desc       : test glBlitFramebuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBlitFramebuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBlitFramebuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBUFFERDATA_0100
     * @tc.name       : testGLBufferData001
     * @tc.desc       : test glBufferData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBufferData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBufferData();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLBUFFERSUBDATA_0100
     * @tc.name       : testGLBufferSubData001
     * @tc.desc       : test glBufferSubData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLBufferSubData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLBufferSubData();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCHECKFRAMEBUFFERSTATUS_0100
     * @tc.name       : testGLCheckFramebufferStatus001
     * @tc.desc       : test glCheckFramebufferStatus
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCheckFramebufferStatus001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLCheckFramebufferStatus();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCLEAR_0100
     * @tc.name       : testGLClear001
     * @tc.desc       : test glClear
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLClear();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCLEARBUFFERFI_0100
     * @tc.name       : testGLClearBufferfi001
     * @tc.desc       : test glClearBufferfi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClearBufferfi001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLClearBufferfi();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCLEARBUFFERFV_0100
     * @tc.name       : testGLClearBufferfv001
     * @tc.desc       : test glClearBufferfv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClearBufferfv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLClearBufferfv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCLEARBUFFERIV_0100
     * @tc.name       : testGLClearBufferiv001
     * @tc.desc       : test glClearBufferiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClearBufferiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLClearBufferiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCLEARBUFFERUIV_0100
     * @tc.name       : testGLClearBufferuiv001
     * @tc.desc       : test glClearBufferuiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClearBufferuiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLClearBufferuiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCLEARCOLOR_0100
     * @tc.name       : testGLClearColor001
     * @tc.desc       : test glClearColor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClearColor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLClearColor();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCLEARDEPTHF_0100
     * @tc.name       : testGLClearDepthf001
     * @tc.desc       : test glClearDepthf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClearDepthf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLClearDepthf();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCLEARSTENCIL_0100
     * @tc.name       : testGLClearStencil001
     * @tc.desc       : test glClearStencil
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClearStencil001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLClearStencil();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCLIENTWAITSYNC_0100
     * @tc.name       : testGLClientWaitSync001
     * @tc.desc       : test glClientWaitSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLClientWaitSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLClientWaitSync();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCOLORMASK_0100
     * @tc.name       : testGLColorMask001
     * @tc.desc       : test glColorMask
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLColorMask001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLColorMask();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCOLORMASKI_0100
     * @tc.name       : testGLColorMaski001
     * @tc.desc       : test glColorMaski
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLColorMaski001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLColorMaski();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCOMPILESHADER_0100
     * @tc.name       : testGLCompileShader001
     * @tc.desc       : test glCompileShader
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCompileShader001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLCompileShader();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCOMPRESSEDTEXIMAGE2D_0100
     * @tc.name       : testGLCompressedTexImage2D001
     * @tc.desc       : test glCompressedTexImage2D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCompressedTexImage2D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLCompressedTexImage2D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCOMPRESSEDTEXIMAGE3D_0100
     * @tc.name       : testGLCompressedTexImage3D001
     * @tc.desc       : test glCompressedTexImage3D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCompressedTexImage3D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLCompressedTexImage3D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCOMPRESSEDTEXSUBIMAGE2D_0100
     * @tc.name       : testGLCompressedTexSubImage2D001
     * @tc.desc       : test glCompressedTexSubImage2D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCompressedTexSubImage2D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLCompressedTexSubImage2D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCOMPRESSEDTEXSUBIMAGE3D_0100
     * @tc.name       : testGLCompressedTexSubImage3D001
     * @tc.desc       : test glCompressedTexSubImage3D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCompressedTexSubImage3D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLCompressedTexSubImage3D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCOPYBUFFERSUBDATA_0100
     * @tc.name       : testGLCopyBufferSubData001
     * @tc.desc       : test glCopyBufferSubData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCopyBufferSubData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLCopyBufferSubData();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCOPYIMAGESUBDATA_0100
     * @tc.name       : testGLCopyImageSubData001
     * @tc.desc       : test glCopyImageSubData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCopyImageSubData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLCopyImageSubData();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCOPYTEXIMAGE2D_0100
     * @tc.name       : testGLCopyTexImage2D001
     * @tc.desc       : test glCopyTexImage2D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCopyTexImage2D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLCopyTexImage2D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCOPYTEXSUBIMAGE2D_0100
     * @tc.name       : testGLCopyTexSubImage2D001
     * @tc.desc       : test glCopyTexSubImage2D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCopyTexSubImage2D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLCopyTexSubImage2D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCOPYTEXSUBIMAGE3D_0100
     * @tc.name       : testGLCopyTexSubImage3D001
     * @tc.desc       : test glCopyTexSubImage3D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCopyTexSubImage3D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLCopyTexSubImage3D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCREATEPROGRAM_0100
     * @tc.name       : testGLCreateProgram001
     * @tc.desc       : test glCreateProgram
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCreateProgram001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLCreateProgram();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCREATESHADER_0100
     * @tc.name       : testGLCreateShader001
     * @tc.desc       : test glCreateShader
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCreateShader001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLCreateShader();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCREATESHADERPROGRAMV_0100
     * @tc.name       : testGLCreateShaderProgramv001
     * @tc.desc       : test glCreateShaderProgramv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCreateShaderProgramv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLCreateShaderProgramv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLCULLFACE_0100
     * @tc.name       : testGLCullFace001
     * @tc.desc       : test glCullFace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLCullFace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLCullFace();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDEBUGMESSAGECALLBACK_0100
     * @tc.name       : testGLDebugMessageCallback001
     * @tc.desc       : test glDebugMessageCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDebugMessageCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDebugMessageCallback();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDEBUGMESSAGECONTROL_0100
     * @tc.name       : testGLDebugMessageControl001
     * @tc.desc       : test glDebugMessageControl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDebugMessageControl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDebugMessageControl();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDEBUGMESSAGEINSERT_0100
     * @tc.name       : testGLDebugMessageInsert001
     * @tc.desc       : test glDebugMessageInsert
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDebugMessageInsert001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDebugMessageInsert();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDELETEBUFFERS_0100
     * @tc.name       : testGLDeleteBuffers001
     * @tc.desc       : test glDeleteBuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteBuffers001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDeleteBuffers();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDELETEFRAMEBUFFERS_0100
     * @tc.name       : testGLDeleteFramebuffers001
     * @tc.desc       : test glDeleteFramebuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteFramebuffers001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDeleteFramebuffers();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDELETEPROGRAM_0100
     * @tc.name       : testGLDeleteProgram001
     * @tc.desc       : test glDeleteProgram
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteProgram001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDeleteProgram();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDELETEPROGRAMPIPELINES_0100
     * @tc.name       : testGLDeleteProgramPipelines001
     * @tc.desc       : test glDeleteProgramPipelines
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteProgramPipelines001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLDeleteProgramPipelines();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDELETEQUERIES_0100
     * @tc.name       : testGLDeleteQueries001
     * @tc.desc       : test glDeleteQueries
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteQueries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDeleteQueries();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDELETERENDERBUFFERS_0100
     * @tc.name       : testGLDeleteRenderbuffers001
     * @tc.desc       : test glDeleteRenderbuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteRenderbuffers001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDeleteRenderbuffers();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDELETESAMPLERS_0100
     * @tc.name       : testGLDeleteSamplers001
     * @tc.desc       : test glDeleteSamplers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteSamplers001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDeleteSamplers();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDELETESHADER_0100
     * @tc.name       : testGLDeleteShader001
     * @tc.desc       : test glDeleteShader
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteShader001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDeleteShader();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDELETESYNC_0100
     * @tc.name       : testGLDeleteSync001
     * @tc.desc       : test glDeleteSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDeleteSync();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDELETETEXTURES_0100
     * @tc.name       : testGLDeleteTextures001
     * @tc.desc       : test glDeleteTextures
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteTextures001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDeleteTextures();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDELETETRANSFORMFEEDBACKS_0100
     * @tc.name       : testGLDeleteTransformFeedbacks001
     * @tc.desc       : test glDeleteTransformFeedbacks
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteTransformFeedbacks001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLDeleteTransformFeedbacks();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDELETEVERTEXARRAYS_0100
     * @tc.name       : testGLDeleteVertexArrays001
     * @tc.desc       : test glDeleteVertexArrays
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDeleteVertexArrays001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDeleteVertexArrays();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDEPTHFUNC_0100
     * @tc.name       : testGLDepthFunc001
     * @tc.desc       : test glDepthFunc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDepthFunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDepthFunc();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDEPTHMASK_0100
     * @tc.name       : testGLDepthMask001
     * @tc.desc       : test glDepthMask
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDepthMask001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDepthMask();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDEPTHRANGEF_0100
     * @tc.name       : testGLDepthRangef001
     * @tc.desc       : test glDepthRangef
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDepthRangef001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDepthRangef();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDETACHSHADER_0100
     * @tc.name       : testGLDetachShader001
     * @tc.desc       : test glDetachShader
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDetachShader001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDetachShader();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDISABLE_0100
     * @tc.name       : testGLDisable001
     * @tc.desc       : test glDisable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDisable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDisable();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDISABLEI_0100
     * @tc.name       : testGLDisablei001
     * @tc.desc       : test glDisablei
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDisablei001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDisablei();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDISABLEVERTEXATTRIBARRAY_0100
     * @tc.name       : testGLDisableVertexAttribArray001
     * @tc.desc       : test glDisableVertexAttribArray
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDisableVertexAttribArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLDisableVertexAttribArray();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDISPATCHCOMPUTE_0100
     * @tc.name       : testGLDispatchCompute001
     * @tc.desc       : test glDispatchCompute
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDispatchCompute001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDispatchCompute();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDISPATCHCOMPUTEINDIRECT_0100
     * @tc.name       : testGLDispatchComputeIndirect001
     * @tc.desc       : test glDispatchComputeIndirect
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDispatchComputeIndirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLDispatchComputeIndirect();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDRAWARRAYS_0100
     * @tc.name       : testGLDrawArrays001
     * @tc.desc       : test glDrawArrays
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawArrays001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDrawArrays();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDRAWARRAYSINDIRECT_0100
     * @tc.name       : testGLDrawArraysIndirect001
     * @tc.desc       : test glDrawArraysIndirect
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawArraysIndirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDrawArraysIndirect();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDRAWARRAYSINSTANCED_0100
     * @tc.name       : testGLDrawArraysInstanced001
     * @tc.desc       : test glDrawArraysInstanced
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawArraysInstanced001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDrawArraysInstanced();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDRAWBUFFERS_0100
     * @tc.name       : testGLDrawBuffers001
     * @tc.desc       : test glDrawBuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawBuffers001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDrawBuffers();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDRAWELEMENTS_0100
     * @tc.name       : testGLDrawElements001
     * @tc.desc       : test glDrawElements
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawElements001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDrawElements();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDRAWELEMENTSBASEVERTEX_0100
     * @tc.name       : testGLDrawElementsBaseVertex001
     * @tc.desc       : test glDrawElementsBaseVertex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawElementsBaseVertex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLDrawElementsBaseVertex();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDRAWELEMENTSINDIRECT_0100
     * @tc.name       : testGLDrawElementsIndirect001
     * @tc.desc       : test glDrawElementsIndirect
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawElementsIndirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDrawElementsIndirect();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDRAWELEMENTSINSTANCED_0100
     * @tc.name       : testGLDrawElementsInstanced001
     * @tc.desc       : test glDrawElementsInstanced
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawElementsInstanced001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLDrawElementsInstanced();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDRAWELEMENTSINSTANCEDBASEVERTEX_0100
     * @tc.name       : testGLDrawElementsInstancedBaseVertex001
     * @tc.desc       : test glDrawElementsInstancedBaseVertex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawElementsInstancedBaseVertex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLDrawElementsInstancedBaseVertex();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDRAWRANGEELEMENTS_0100
     * @tc.name       : testGLDrawRangeElements001
     * @tc.desc       : test glDrawRangeElements
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawRangeElements001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLDrawRangeElements();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLDRAWRANGEELEMENTSBASEVERTEX_0100
     * @tc.name       : testGLDrawRangeElementsBaseVertex001
     * @tc.desc       : test glDrawRangeElementsBaseVertex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLDrawRangeElementsBaseVertex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLDrawRangeElementsBaseVertex();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLENABLE_0100
     * @tc.name       : testGLEnable001
     * @tc.desc       : test glEnable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLEnable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLEnable();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLENABLEI_0100
     * @tc.name       : testGLEnablei001
     * @tc.desc       : test glEnablei
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLEnablei001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLEnablei();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLENABLEVERTEXATTRIBARRAY_0100
     * @tc.name       : testGLEnableVertexAttribArray001
     * @tc.desc       : test glEnableVertexAttribArray
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLEnableVertexAttribArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLEnableVertexAttribArray();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLENDQUERY_0100
     * @tc.name       : testGLEndQuery001
     * @tc.desc       : test glEndQuery
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLEndQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLEndQuery();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLENDTRANSFORMFEEDBACK_0100
     * @tc.name       : testGLEndTransformFeedback001
     * @tc.desc       : test glEndTransformFeedback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLEndTransformFeedback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLEndTransformFeedback();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLFENCESYNC_0100
     * @tc.name       : testGLFenceSync001
     * @tc.desc       : test glFenceSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFenceSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLFenceSync();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLFINISH_0100
     * @tc.name       : testGLFinish001
     * @tc.desc       : test glFinish
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFinish001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLFinish();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLFLUSH_0100
     * @tc.name       : testGLFlush001
     * @tc.desc       : test glFlush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFlush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLFlush();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLFLUSHMAPPEDBUFFERRANGE_0100
     * @tc.name       : testGLFlushMappedBufferRange001
     * @tc.desc       : test glFlushMappedBufferRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFlushMappedBufferRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLFlushMappedBufferRange();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLFRAMEBUFFERPARAMETERI_0100
     * @tc.name       : testGLFramebufferParameteri001
     * @tc.desc       : test glFramebufferParameteri
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFramebufferParameteri001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLFramebufferParameteri();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLFRAMEBUFFERRENDERBUFFER_0100
     * @tc.name       : testGLFramebufferRenderbuffer001
     * @tc.desc       : test glFramebufferRenderbuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFramebufferRenderbuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLFramebufferRenderbuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLFRAMEBUFFERTEXTURE_0100
     * @tc.name       : testGLFramebufferTexture001
     * @tc.desc       : test glFramebufferTexture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFramebufferTexture001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLFramebufferTexture();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLFRAMEBUFFERTEXTURE2D_0100
     * @tc.name       : testGLFramebufferTexture2D001
     * @tc.desc       : test glFramebufferTexture2D
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFramebufferTexture2D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLFramebufferTexture2D();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLFRAMEBUFFERTEXTURELAYER_0100
     * @tc.name       : testGLFramebufferTextureLayer001
     * @tc.desc       : test glFramebufferTextureLayer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFramebufferTextureLayer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLFramebufferTextureLayer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLFRONTFACE_0100
     * @tc.name       : testGLFrontFace001
     * @tc.desc       : test glFrontFace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLFrontFace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLFrontFace();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGENBUFFERS_0100
     * @tc.name       : testGLGenBuffers001
     * @tc.desc       : test glGenBuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenBuffers001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGenBuffers();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGENERATEMIPMAP_0100
     * @tc.name       : testGLGenerateMipmap001
     * @tc.desc       : test glGenerateMipmap
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenerateMipmap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGenerateMipmap();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGENFRAMEBUFFERS_0100
     * @tc.name       : testGLGenFramebuffers001
     * @tc.desc       : test glGenFramebuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenFramebuffers001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGenFramebuffers();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGENPROGRAMPIPELINES_0100
     * @tc.name       : testGLGenProgramPipelines001
     * @tc.desc       : test glGenProgramPipelines
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenProgramPipelines001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGenProgramPipelines();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGENQUERIES_0100
     * @tc.name       : testGLGenQueries001
     * @tc.desc       : test glGenQueries
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenQueries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGenQueries();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGENRENDERBUFFERS_0100
     * @tc.name       : testGLGenRenderbuffers001
     * @tc.desc       : test glGenRenderbuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenRenderbuffers001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGenRenderbuffers();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGENSAMPLERS_0100
     * @tc.name       : testGLGenSamplers001
     * @tc.desc       : test glGenSamplers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenSamplers001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGenSamplers();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGENTEXTURES_0100
     * @tc.name       : testGLGenTextures001
     * @tc.desc       : test glGenTextures
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenTextures001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGenTextures();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGENTRANSFORMFEEDBACKS_0100
     * @tc.name       : testGLGenTransformFeedbacks001
     * @tc.desc       : test glGenTransformFeedbacks
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenTransformFeedbacks001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGenTransformFeedbacks();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGENVERTEXARRAYS_0100
     * @tc.name       : testGLGenVertexArrays001
     * @tc.desc       : test glGenVertexArrays
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGenVertexArrays001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGenVertexArrays();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETACTIVEATTRIB_0100
     * @tc.name       : testGLGetActiveAttrib001
     * @tc.desc       : test glGetActiveAttrib
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetActiveAttrib001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetActiveAttrib();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETACTIVEUNIFORM_0100
     * @tc.name       : testGLGetActiveUniform001
     * @tc.desc       : test glGetActiveUniform
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetActiveUniform001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetActiveUniform();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETACTIVEUNIFORMBLOCKIV_0100
     * @tc.name       : testGLGetActiveUniformBlockiv001
     * @tc.desc       : test glGetActiveUniformBlockiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetActiveUniformBlockiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetActiveUniformBlockiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETACTIVEUNIFORMBLOCKNAME_0100
     * @tc.name       : testGLGetActiveUniformBlockName001
     * @tc.desc       : test glGetActiveUniformBlockName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetActiveUniformBlockName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetActiveUniformBlockName();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETACTIVEUNIFORMSIV_0100
     * @tc.name       : testGLGetActiveUniformsiv001
     * @tc.desc       : test glGetActiveUniformsiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetActiveUniformsiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetActiveUniformsiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETATTACHEDSHADERS_0100
     * @tc.name       : testGLGetAttachedShaders001
     * @tc.desc       : test glGetAttachedShaders
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetAttachedShaders001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetAttachedShaders();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETATTRIBLOCATION_0100
     * @tc.name       : testGLGetAttribLocation001
     * @tc.desc       : test glGetAttribLocation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetAttribLocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetAttribLocation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETBOOLEANI_V_0100
     * @tc.name       : testGLGetBooleani_v001
     * @tc.desc       : test glGetBooleani_v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetBooleani_v001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetBooleani_v();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETBOOLEANV_0100
     * @tc.name       : testGLGetBooleanv001
     * @tc.desc       : test glGetBooleanv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetBooleanv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetBooleanv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETBUFFERPARAMETERI64V_0100
     * @tc.name       : testGLGetBufferParameteri64v001
     * @tc.desc       : test glGetBufferParameteri64v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetBufferParameteri64v001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetBufferParameteri64v();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETBUFFERPARAMETERIV_0100
     * @tc.name       : testGLGetBufferParameteriv001
     * @tc.desc       : test glGetBufferParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetBufferParameteriv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetBufferParameteriv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETBUFFERPOINTERV_0100
     * @tc.name       : testGLGetBufferPointerv001
     * @tc.desc       : test glGetBufferPointerv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetBufferPointerv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetBufferPointerv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETDEBUGMESSAGELOG_0100
     * @tc.name       : testGLGetDebugMessageLog001
     * @tc.desc       : test glGetDebugMessageLog
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetDebugMessageLog001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetDebugMessageLog();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETERROR_0100
     * @tc.name       : testGLGetError001
     * @tc.desc       : test glGetError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetError();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETFLOATV_0100
     * @tc.name       : testGLGetFloatv001
     * @tc.desc       : test glGetFloatv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetFloatv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetFloatv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETFRAGDATALOCATION_0100
     * @tc.name       : testGLGetFragDataLocation001
     * @tc.desc       : test glGetFragDataLocation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetFragDataLocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetFragDataLocation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETFRAMEBUFFERATTACHMENTPARAMETERIV_0100
     * @tc.name       : testGLGetFramebufferAttachmentParameteriv001
     * @tc.desc       : test glGetFramebufferAttachmentParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetFramebufferAttachmentParameteriv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetFramebufferAttachmentParameteriv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETFRAMEBUFFERPARAMETERIV_0100
     * @tc.name       : testGLGetFramebufferParameteriv001
     * @tc.desc       : test glGetFramebufferParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetFramebufferParameteriv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetFramebufferParameteriv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETGRAPHICSRESETSTATUS_0100
     * @tc.name       : testGLGetGraphicsResetStatus001
     * @tc.desc       : test glGetGraphicsResetStatus
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetGraphicsResetStatus001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetGraphicsResetStatus();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETINTEGER64I_V_0100
     * @tc.name       : testGLGetInteger64i_v001
     * @tc.desc       : test glGetInteger64i_v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetInteger64i_v001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetInteger64i_v();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETINTEGER64V_0100
     * @tc.name       : testGLGetInteger64v001
     * @tc.desc       : test glGetInteger64v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetInteger64v001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetInteger64v();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETINTEGERI_V_0100
     * @tc.name       : testGLGetIntegeri_v001
     * @tc.desc       : test glGetIntegeri_v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetIntegeri_v001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetIntegeri_v();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETINTEGERV_0100
     * @tc.name       : testGLGetIntegerv001
     * @tc.desc       : test glGetIntegerv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetIntegerv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetIntegerv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETINTERNALFORMATIV_0100
     * @tc.name       : testGLGetInternalformativ001
     * @tc.desc       : test glGetInternalformativ
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetInternalformativ001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetInternalformativ();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETMULTISAMPLEFV_0100
     * @tc.name       : testGLGetMultisamplefv001
     * @tc.desc       : test glGetMultisamplefv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetMultisamplefv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetMultisamplefv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETNUNIFORMFV_0100
     * @tc.name       : testGLGetnUniformfv001
     * @tc.desc       : test glGetnUniformfv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetnUniformfv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetnUniformfv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETNUNIFORMIV_0100
     * @tc.name       : testGLGetnUniformiv001
     * @tc.desc       : test glGetnUniformiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetnUniformiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetnUniformiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETNUNIFORMUIV_0100
     * @tc.name       : testGLGetnUniformuiv001
     * @tc.desc       : test glGetnUniformuiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetnUniformuiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetnUniformuiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETOBJECTLABEL_0100
     * @tc.name       : testGLGetObjectLabel001
     * @tc.desc       : test glGetObjectLabel
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetObjectLabel001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetObjectLabel();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETOBJECTPTRLABEL_0100
     * @tc.name       : testGLGetObjectPtrLabel001
     * @tc.desc       : test glGetObjectPtrLabel
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetObjectPtrLabel001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetObjectPtrLabel();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETPOINTERV_0100
     * @tc.name       : testGLGetPointerv001
     * @tc.desc       : test glGetPointerv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetPointerv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetPointerv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETPROGRAMBINARY_0100
     * @tc.name       : testGLGetProgramBinary001
     * @tc.desc       : test glGetProgramBinary
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramBinary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetProgramBinary();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETPROGRAMINFOLOG_0100
     * @tc.name       : testGLGetProgramInfoLog001
     * @tc.desc       : test glGetProgramInfoLog
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramInfoLog001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetProgramInfoLog();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETPROGRAMINTERFACEIV_0100
     * @tc.name       : testGLGetProgramInterfaceiv001
     * @tc.desc       : test glGetProgramInterfaceiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramInterfaceiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetProgramInterfaceiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETPROGRAMIV_0100
     * @tc.name       : testGLGetProgramiv001
     * @tc.desc       : test glGetProgramiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetProgramiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETPROGRAMPIPELINEINFOLOG_0100
     * @tc.name       : testGLGetProgramPipelineInfoLog001
     * @tc.desc       : test glGetProgramPipelineInfoLog
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramPipelineInfoLog001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetProgramPipelineInfoLog();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETPROGRAMPIPELINEIV_0100
     * @tc.name       : testGLGetProgramPipelineiv001
     * @tc.desc       : test glGetProgramPipelineiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramPipelineiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetProgramPipelineiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETPROGRAMRESOURCEINDEX_0100
     * @tc.name       : testGLGetProgramResourceIndex001
     * @tc.desc       : test glGetProgramResourceIndex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramResourceIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetProgramResourceIndex();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETPROGRAMRESOURCEIV_0100
     * @tc.name       : testGLGetProgramResourceiv001
     * @tc.desc       : test glGetProgramResourceiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramResourceiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetProgramResourceiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETPROGRAMRESOURCELOCATION_0100
     * @tc.name       : testGLGetProgramResourceLocation001
     * @tc.desc       : test glGetProgramResourceLocation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramResourceLocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetProgramResourceLocation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETPROGRAMRESOURCENAME_0100
     * @tc.name       : testGLGetProgramResourceName001
     * @tc.desc       : test glGetProgramResourceName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetProgramResourceName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetProgramResourceName();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETQUERYIV_0100
     * @tc.name       : testGLGetQueryiv001
     * @tc.desc       : test glGetQueryiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetQueryiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetQueryiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETQUERYOBJECTUIV_0100
     * @tc.name       : testGLGetQueryObjectuiv001
     * @tc.desc       : test glGetQueryObjectuiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetQueryObjectuiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetQueryObjectuiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETRENDERBUFFERPARAMETERIV_0100
     * @tc.name       : testGLGetRenderbufferParameteriv001
     * @tc.desc       : test glGetRenderbufferParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetRenderbufferParameteriv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetRenderbufferParameteriv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETSAMPLERPARAMETERFV_0100
     * @tc.name       : testGLGetSamplerParameterfv001
     * @tc.desc       : test glGetSamplerParameterfv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetSamplerParameterfv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetSamplerParameterfv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETSAMPLERPARAMETERIIV_0100
     * @tc.name       : testGLGetSamplerParameterIiv001
     * @tc.desc       : test glGetSamplerParameterIiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetSamplerParameterIiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetSamplerParameterIiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETSAMPLERPARAMETERIUIV_0100
     * @tc.name       : testGLGetSamplerParameterIuiv001
     * @tc.desc       : test glGetSamplerParameterIuiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetSamplerParameterIuiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetSamplerParameterIuiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETSAMPLERPARAMETERIV_0100
     * @tc.name       : testGLGetSamplerParameteriv001
     * @tc.desc       : test glGetSamplerParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetSamplerParameteriv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetSamplerParameteriv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETSHADERINFOLOG_0100
     * @tc.name       : testGLGetShaderInfoLog001
     * @tc.desc       : test glGetShaderInfoLog
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetShaderInfoLog001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetShaderInfoLog();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETSHADERIV_0100
     * @tc.name       : testGLGetShaderiv001
     * @tc.desc       : test glGetShaderiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetShaderiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetShaderiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETSHADERPRECISIONFORMAT_0100
     * @tc.name       : testGLGetShaderPrecisionFormat001
     * @tc.desc       : test glGetShaderPrecisionFormat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetShaderPrecisionFormat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetShaderPrecisionFormat();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETSHADERSOURCE_0100
     * @tc.name       : testGLGetShaderSource001
     * @tc.desc       : test glGetShaderSource
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetShaderSource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetShaderSource();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETSTRING_0100
     * @tc.name       : testGLGetString001
     * @tc.desc       : test glGetString
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetString();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETSTRINGI_0100
     * @tc.name       : testGLGetStringi001
     * @tc.desc       : test glGetStringi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetStringi001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetStringi();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETSYNCIV_0100
     * @tc.name       : testGLGetSynciv001
     * @tc.desc       : test glGetSynciv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetSynciv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetSynciv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETTEXLEVELPARAMETERFV_0100
     * @tc.name       : testGLGetTexLevelParameterfv001
     * @tc.desc       : test glGetTexLevelParameterfv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetTexLevelParameterfv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetTexLevelParameterfv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETTEXLEVELPARAMETERIV_0100
     * @tc.name       : testGLGetTexLevelParameteriv001
     * @tc.desc       : test glGetTexLevelParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetTexLevelParameteriv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetTexLevelParameteriv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETTEXPARAMETERFV_0100
     * @tc.name       : testGLGetTexParameterfv001
     * @tc.desc       : test glGetTexParameterfv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetTexParameterfv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetTexParameterfv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETTEXPARAMETERIIV_0100
     * @tc.name       : testGLGetTexParameterIiv001
     * @tc.desc       : test glGetTexParameterIiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetTexParameterIiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetTexParameterIiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETTEXPARAMETERIUIV_0100
     * @tc.name       : testGLGetTexParameterIuiv001
     * @tc.desc       : test glGetTexParameterIuiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetTexParameterIuiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetTexParameterIuiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETTEXPARAMETERIV_0100
     * @tc.name       : testGLGetTexParameteriv001
     * @tc.desc       : test glGetTexParameteriv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetTexParameteriv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetTexParameteriv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETTRANSFORMFEEDBACKVARYING_0100
     * @tc.name       : testGLGetTransformFeedbackVarying001
     * @tc.desc       : test glGetTransformFeedbackVarying
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetTransformFeedbackVarying001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetTransformFeedbackVarying();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETUNIFORMBLOCKINDEX_0100
     * @tc.name       : testGLGetUniformBlockIndex001
     * @tc.desc       : test glGetUniformBlockIndex
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetUniformBlockIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetUniformBlockIndex();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETUNIFORMFV_0100
     * @tc.name       : testGLGetUniformfv001
     * @tc.desc       : test glGetUniformfv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetUniformfv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetUniformfv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETUNIFORMINDICES_0100
     * @tc.name       : testGLGetUniformIndices001
     * @tc.desc       : test glGetUniformIndices
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetUniformIndices001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetUniformIndices();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETUNIFORMIV_0100
     * @tc.name       : testGLGetUniformiv001
     * @tc.desc       : test glGetUniformiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetUniformiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetUniformiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETUNIFORMLOCATION_0100
     * @tc.name       : testGLGetUniformLocation001
     * @tc.desc       : test glGetUniformLocation
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetUniformLocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetUniformLocation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETUNIFORMUIV_0100
     * @tc.name       : testGLGetUniformuiv001
     * @tc.desc       : test glGetUniformuiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetUniformuiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetUniformuiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETVERTEXATTRIBFV_0100
     * @tc.name       : testGLGetVertexAttribfv001
     * @tc.desc       : test glGetVertexAttribfv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetVertexAttribfv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetVertexAttribfv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETVERTEXATTRIBIIV_0100
     * @tc.name       : testGLGetVertexAttribIiv001
     * @tc.desc       : test glGetVertexAttribIiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetVertexAttribIiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetVertexAttribIiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETVERTEXATTRIBIUIV_0100
     * @tc.name       : testGLGetVertexAttribIuiv001
     * @tc.desc       : test glGetVertexAttribIuiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetVertexAttribIuiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetVertexAttribIuiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETVERTEXATTRIBIV_0100
     * @tc.name       : testGLGetVertexAttribiv001
     * @tc.desc       : test glGetVertexAttribiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetVertexAttribiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLGetVertexAttribiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLGETVERTEXATTRIBPOINTERV_0100
     * @tc.name       : testGLGetVertexAttribPointerv001
     * @tc.desc       : test glGetVertexAttribPointerv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLGetVertexAttribPointerv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLGetVertexAttribPointerv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLHINT_0100
     * @tc.name       : testGLHint001
     * @tc.desc       : test glHint
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLHint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLHint();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLINVALIDATEFRAMEBUFFER_0100
     * @tc.name       : testGLInvalidateFramebuffer001
     * @tc.desc       : test glInvalidateFramebuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLInvalidateFramebuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLInvalidateFramebuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLINVALIDATESUBFRAMEBUFFER_0100
     * @tc.name       : testGLInvalidateSubFramebuffer001
     * @tc.desc       : test glInvalidateSubFramebuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLInvalidateSubFramebuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLInvalidateSubFramebuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISBUFFER_0100
     * @tc.name       : testGLIsBuffer001
     * @tc.desc       : test glIsBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISENABLED_0100
     * @tc.name       : testGLIsEnabled001
     * @tc.desc       : test glIsEnabled
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsEnabled001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsEnabled();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISENABLEDI_0100
     * @tc.name       : testGLIsEnabledi001
     * @tc.desc       : test glIsEnabledi
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsEnabledi001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsEnabledi();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISFRAMEBUFFER_0100
     * @tc.name       : testGLIsFramebuffer001
     * @tc.desc       : test glIsFramebuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsFramebuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsFramebuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISPROGRAM_0100
     * @tc.name       : testGLIsProgram001
     * @tc.desc       : test glIsProgram
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsProgram001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsProgram();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISPROGRAMPIPELINE_0100
     * @tc.name       : testGLIsProgramPipeline001
     * @tc.desc       : test glIsProgramPipeline
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsProgramPipeline001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsProgramPipeline();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISQUERY_0100
     * @tc.name       : testGLIsQuery001
     * @tc.desc       : test glIsQuery
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsQuery();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISRENDERBUFFER_0100
     * @tc.name       : testGLIsRenderbuffer001
     * @tc.desc       : test glIsRenderbuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsRenderbuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsRenderbuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISSAMPLER_0100
     * @tc.name       : testGLIsSampler001
     * @tc.desc       : test glIsSampler
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsSampler001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsSampler();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISSHADER_0100
     * @tc.name       : testGLIsShader001
     * @tc.desc       : test glIsShader
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsShader001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsShader();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISSYNC_0100
     * @tc.name       : testGLIsSync001
     * @tc.desc       : test glIsSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsSync();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISTEXTURE_0100
     * @tc.name       : testGLIsTexture001
     * @tc.desc       : test glIsTexture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsTexture001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsTexture();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISTRANSFORMFEEDBACK_0100
     * @tc.name       : testGLIsTransformFeedback001
     * @tc.desc       : test glIsTransformFeedback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsTransformFeedback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsTransformFeedback();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLISVERTEXARRAY_0100
     * @tc.name       : testGLIsVertexArray001
     * @tc.desc       : test glIsVertexArray
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLIsVertexArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLIsVertexArray();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLLINEWIDTH_0100
     * @tc.name       : testGLLineWidth001
     * @tc.desc       : test glLineWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLLineWidth001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLLineWidth();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLLINKPROGRAM_0100
     * @tc.name       : testGLLinkProgram001
     * @tc.desc       : test glLinkProgram
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLLinkProgram001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLLinkProgram();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLMAPBUFFERRANGE_0100
     * @tc.name       : testGLMapBufferRange001
     * @tc.desc       : test glMapBufferRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLMapBufferRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLMapBufferRange();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLMEMORYBARRIER_0100
     * @tc.name       : testGLMemoryBarrier001
     * @tc.desc       : test glMemoryBarrier
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLMemoryBarrier001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLMemoryBarrier();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLMEMORYBARRIERBYREGION_0100
     * @tc.name       : testGLMemoryBarrierByRegion001
     * @tc.desc       : test glMemoryBarrierByRegion
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLMemoryBarrierByRegion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLMemoryBarrierByRegion();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLMINSAMPLESHADING_0100
     * @tc.name       : testGLMinSampleShading001
     * @tc.desc       : test glMinSampleShading
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLMinSampleShading001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLMinSampleShading();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLOBJECTLABEL_0100
     * @tc.name       : testGLObjectLabel001
     * @tc.desc       : test glObjectLabel
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLObjectLabel001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLObjectLabel();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLOBJECTPTRLABEL_0100
     * @tc.name       : testGLObjectPtrLabel001
     * @tc.desc       : test glObjectPtrLabel
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLObjectPtrLabel001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLObjectPtrLabel();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPATCHPARAMETERI_0100
     * @tc.name       : testGLPatchParameteri001
     * @tc.desc       : test glPatchParameteri
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLPatchParameteri001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLPatchParameteri();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPAUSETRANSFORMFEEDBACK_0100
     * @tc.name       : testGLPauseTransformFeedback001
     * @tc.desc       : test glPauseTransformFeedback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLPauseTransformFeedback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLPauseTransformFeedback();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPIXELSTOREI_0100
     * @tc.name       : testGLPixelStorei001
     * @tc.desc       : test glPixelStorei
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLPixelStorei001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLPixelStorei();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPOLYGONOFFSET_0100
     * @tc.name       : testGLPolygonOffset001
     * @tc.desc       : test glPolygonOffset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLPolygonOffset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLPolygonOffset();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPOPDEBUGGROUP_0100
     * @tc.name       : testGLPopDebugGroup001
     * @tc.desc       : test glPopDebugGroup
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLPopDebugGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLPopDebugGroup();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPRIMITIVEBOUNDINGBOX_0100
     * @tc.name       : testGLPrimitiveBoundingBox001
     * @tc.desc       : test glPrimitiveBoundingBox
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLPrimitiveBoundingBox001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLPrimitiveBoundingBox();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMBINARY_0100
     * @tc.name       : testGLProgramBinary001
     * @tc.desc       : test glProgramBinary
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramBinary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramBinary();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMPARAMETERI_0100
     * @tc.name       : testGLProgramParameteri001
     * @tc.desc       : test glProgramParameteri
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramParameteri001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramParameteri();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM1F_0100
     * @tc.name       : testGLProgramUniform1f001
     * @tc.desc       : test glProgramUniform1f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform1f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform1f();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM1FV_0100
     * @tc.name       : testGLProgramUniform1fv001
     * @tc.desc       : test glProgramUniform1fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform1fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform1fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM1I_0100
     * @tc.name       : testGLProgramUniform1i001
     * @tc.desc       : test glProgramUniform1i
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform1i001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform1i();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM1IV_0100
     * @tc.name       : testGLProgramUniform1iv001
     * @tc.desc       : test glProgramUniform1iv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform1iv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform1iv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM1UI_0100
     * @tc.name       : testGLProgramUniform1ui001
     * @tc.desc       : test glProgramUniform1ui
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform1ui001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform1ui();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM1UIV_0100
     * @tc.name       : testGLProgramUniform1uiv001
     * @tc.desc       : test glProgramUniform1uiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform1uiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform1uiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM2F_0100
     * @tc.name       : testGLProgramUniform2f001
     * @tc.desc       : test glProgramUniform2f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform2f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform2f();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM2FV_0100
     * @tc.name       : testGLProgramUniform2fv001
     * @tc.desc       : test glProgramUniform2fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform2fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform2fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM2I_0100
     * @tc.name       : testGLProgramUniform2i001
     * @tc.desc       : test glProgramUniform2i
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform2i001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform2i();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM2IV_0100
     * @tc.name       : testGLProgramUniform2iv001
     * @tc.desc       : test glProgramUniform2iv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform2iv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform2iv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM2UI_0100
     * @tc.name       : testGLProgramUniform2ui001
     * @tc.desc       : test glProgramUniform2ui
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform2ui001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform2ui();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM2UIV_0100
     * @tc.name       : testGLProgramUniform2uiv001
     * @tc.desc       : test glProgramUniform2uiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform2uiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform2uiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM3F_0100
     * @tc.name       : testGLProgramUniform3f001
     * @tc.desc       : test glProgramUniform3f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform3f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform3f();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM3FV_0100
     * @tc.name       : testGLProgramUniform3fv001
     * @tc.desc       : test glProgramUniform3fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform3fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform3fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM3I_0100
     * @tc.name       : testGLProgramUniform3i001
     * @tc.desc       : test glProgramUniform3i
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform3i001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform3i();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM3IV_0100
     * @tc.name       : testGLProgramUniform3iv001
     * @tc.desc       : test glProgramUniform3iv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform3iv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform3iv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM3UI_0100
     * @tc.name       : testGLProgramUniform3ui001
     * @tc.desc       : test glProgramUniform3ui
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform3ui001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform3ui();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM3UIV_0100
     * @tc.name       : testGLProgramUniform3uiv001
     * @tc.desc       : test glProgramUniform3uiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform3uiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform3uiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM4F_0100
     * @tc.name       : testGLProgramUniform4f001
     * @tc.desc       : test glProgramUniform4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform4f001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform4f();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM4FV_0100
     * @tc.name       : testGLProgramUniform4fv001
     * @tc.desc       : test glProgramUniform4fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform4fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform4fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM4I_0100
     * @tc.name       : testGLProgramUniform4i001
     * @tc.desc       : test glProgramUniform4i
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform4i001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform4i();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM4IV_0100
     * @tc.name       : testGLProgramUniform4iv001
     * @tc.desc       : test glProgramUniform4iv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform4iv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform4iv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM4UI_0100
     * @tc.name       : testGLProgramUniform4ui001
     * @tc.desc       : test glProgramUniform4ui
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform4ui001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform4ui();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORM4UIV_0100
     * @tc.name       : testGLProgramUniform4uiv001
     * @tc.desc       : test glProgramUniform4uiv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniform4uiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniform4uiv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORMMATRIX2FV_0100
     * @tc.name       : testGLProgramUniformMatrix2fv001
     * @tc.desc       : test glProgramUniformMatrix2fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniformMatrix2fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniformMatrix2fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORMMATRIX2X3FV_0100
     * @tc.name       : testGLProgramUniformMatrix2x3fv001
     * @tc.desc       : test glProgramUniformMatrix2x3fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniformMatrix2x3fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniformMatrix2x3fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORMMATRIX2X4FV_0100
     * @tc.name       : testGLProgramUniformMatrix2x4fv001
     * @tc.desc       : test glProgramUniformMatrix2x4fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniformMatrix2x4fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniformMatrix2x4fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORMMATRIX3FV_0100
     * @tc.name       : testGLProgramUniformMatrix3fv001
     * @tc.desc       : test glProgramUniformMatrix3fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniformMatrix3fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniformMatrix3fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORMMATRIX3X2FV_0100
     * @tc.name       : testGLProgramUniformMatrix3x2fv001
     * @tc.desc       : test glProgramUniformMatrix3x2fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniformMatrix3x2fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniformMatrix3x2fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORMMATRIX3X4FV_0100
     * @tc.name       : testGLProgramUniformMatrix3x4fv001
     * @tc.desc       : test glProgramUniformMatrix3x4fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniformMatrix3x4fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniformMatrix3x4fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORMMATRIX4FV_0100
     * @tc.name       : testGLProgramUniformMatrix4fv001
     * @tc.desc       : test glProgramUniformMatrix4fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniformMatrix4fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniformMatrix4fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORMMATRIX4X2FV_0100
     * @tc.name       : testGLProgramUniformMatrix4x2fv001
     * @tc.desc       : test glProgramUniformMatrix4x2fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniformMatrix4x2fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniformMatrix4x2fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPROGRAMUNIFORMMATRIX4X3FV_0100
     * @tc.name       : testGLProgramUniformMatrix4x3fv001
     * @tc.desc       : test glProgramUniformMatrix4x3fv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLProgramUniformMatrix4x3fv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLProgramUniformMatrix4x3fv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLPUSHDEBUGGROUP_0100
     * @tc.name       : testGLPushDebugGroup001
     * @tc.desc       : test glPushDebugGroup
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLPushDebugGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLPushDebugGroup();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLREADBUFFER_0100
     * @tc.name       : testGLReadBuffer001
     * @tc.desc       : test glReadBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLReadBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLReadBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLREADNPIXELS_0100
     * @tc.name       : testGLReadnPixels001
     * @tc.desc       : test glReadnPixels
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLReadnPixels001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLReadnPixels();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLREADPIXELS_0100
     * @tc.name       : testGLReadPixels001
     * @tc.desc       : test glReadPixels
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLReadPixels001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLReadPixels();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLRELEASESHADERCOMPILER_0100
     * @tc.name       : testGLReleaseShaderCompiler001
     * @tc.desc       : test glReleaseShaderCompiler
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLReleaseShaderCompiler001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLReleaseShaderCompiler();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLRENDERBUFFERSTORAGE_0100
     * @tc.name       : testGLRenderbufferStorage001
     * @tc.desc       : test glRenderbufferStorage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLRenderbufferStorage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLRenderbufferStorage();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLRENDERBUFFERSTORAGEMULTISAMPLE_0100
     * @tc.name       : testGLRenderbufferStorageMultisample001
     * @tc.desc       : test glRenderbufferStorageMultisample
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLRenderbufferStorageMultisample001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLRenderbufferStorageMultisample();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLRESUMETRANSFORMFEEDBACK_0100
     * @tc.name       : testGLResumeTransformFeedback001
     * @tc.desc       : test glResumeTransformFeedback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLResumeTransformFeedback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = gles3ndk.gLResumeTransformFeedback();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSAMPLECOVERAGE_0100
     * @tc.name       : testGLSampleCoverage001
     * @tc.desc       : test glSampleCoverage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLSampleCoverage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLSampleCoverage();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSAMPLEMASKI_0100
     * @tc.name       : testGLSampleMaski001
     * @tc.desc       : test glSampleMaski
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLSampleMaski001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLSampleMaski();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBGLES3_GLSAMPLERPARAMETERF_0100
     * @tc.name       : testGLSamplerParameterf001
     * @tc.desc       : test glSamplerParameterf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGLSamplerParameterf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = gles3ndk.gLSamplerParameterf();
      expect(result).assertEqual(0);
      done();
    });
  })
}

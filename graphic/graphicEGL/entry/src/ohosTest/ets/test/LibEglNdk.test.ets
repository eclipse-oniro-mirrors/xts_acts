/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the License);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, TestType, Level, Size } from '@ohos/hypium'
import eglndk from 'libentry.so'

export default function libEglNdkTest() {
  describe('LibEGLTest', () => {
    /**
     * @tc.name   testEglChooseConfig001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCHOOSECONFIG_0100
     * @tc.desc   test eglChooseConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglChooseConfig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglChooseConfig();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglChooseConfig002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCHOOSECONFIG_0200
     * @tc.desc   test eglChooseConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglChooseConfig002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglChooseConfigAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglCopyBuffers001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCOPYBUFFERS_0100
     * @tc.desc   test eglCopyBuffers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCopyBuffers001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCopyBuffersAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglCreateContext001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATECONTEXT_0100
     * @tc.desc   test eglCreateContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCreateContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateContext();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglCreateContext002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATECONTEXT_0200
     * @tc.desc   test eglCreateContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCreateContext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateContextAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglCreatePbufferSurface001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEPBUFFERSURFACE_0100
     * @tc.desc   test eglCreatePbufferSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCreatePbufferSurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = eglndk.eglCreatePbufferSurface();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglCreatePbufferSurface002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEPBUFFERSURFACE_0200
     * @tc.desc   test eglCreatePbufferSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCreatePbufferSurface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = eglndk.eglCreatePbufferSurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglCreatePixmapSurface001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEPIXMAPSURFACE_0100
     * @tc.desc   test eglCreatePixmapSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCreatePixmapSurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreatePixmapSurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglCreateWindowSurface001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEWINDOWSURFACE_0100
     * @tc.desc   test eglCreateWindowSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCreateWindowSurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateWindowSurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglDestroyContext001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYCONTEXT_0100
     * @tc.desc   test eglDestroyContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglDestroyContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroyContext();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglDestroyContext002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYCONTEXT_0200
     * @tc.desc   test eglDestroyContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglDestroyContext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroyContextAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglDestroySurface001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYSURFACE_0100
     * @tc.desc   test eglDestroySurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglDestroySurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroySurface();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglDestroySurface002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYSURFACE_0200
     * @tc.desc   test eglDestroySurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglDestroySurface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroySurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglGetConfigAttrib001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCONFIGATTRIB_0100
     * @tc.desc   test eglGetConfigAttrib
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetConfigAttrib001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetConfigAttrib();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglGetConfigAttrib002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCONFIGATTRIB_0200
     * @tc.desc   test eglGetConfigAttrib
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetConfigAttrib002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetConfigAttribAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglGetConfigs001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCONFIGS_0100
     * @tc.desc   test eglGetConfigs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetConfigs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetConfigs();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglGetConfigs002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCONFIGS_0200
     * @tc.desc   test eglGetConfigs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetConfigs002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetConfigsAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglGetCurrentDisplay001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCURRENTDISPLAY_0100
     * @tc.desc   test eglGetCurrentDisplay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetCurrentDisplay001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetCurrentDisplay();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglGetCurrentDisplay002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCURRENTDISPLAY_0200
     * @tc.desc   test eglGetCurrentDisplay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetCurrentDisplay002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetCurrentDisplayAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglGetCurrentSurface001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCURRENTSURFACE_0100
     * @tc.desc   test eglGetCurrentSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetCurrentSurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetCurrentSurface();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglGetCurrentSurface002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCURRENTSURFACE_0200
     * @tc.desc   test eglGetCurrentSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetCurrentSurface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetCurrentSurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglGetDisplay001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETDISPLAY_0100
     * @tc.desc   test eglGetDisplay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetDisplay001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetDisplay();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglGetError001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETERROR_0100
     * @tc.desc   test eglGetError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetError();
      expect(result).assertEqual(1);
      done();
    });
    
    
    /**
     * @tc.name   testEglGetProcAddress001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETPROCADDRESS_0100
     * @tc.desc   test eglGetProcAddress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetProcAddress001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetProcAddress();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglGetProcAddress002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETPROCADDRESS_0200
     * @tc.desc   test eglGetProcAddress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetProcAddress002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetProcAddressAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglInitialize001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLINITIALIZE_0100
     * @tc.desc   test eglInitialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglInitialize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglInitialize();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglInitialize002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLINITIALIZE_0200
     * @tc.desc   test eglInitialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglInitialize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglInitializeAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglMakeCurrent001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLMAKECURRENT_0100
     * @tc.desc   test eglMakeCurrent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglMakeCurrent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglMakeCurrent();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglMakeCurrent002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLMAKECURRENT_0200
     * @tc.desc   test eglMakeCurrent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglMakeCurrent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglMakeCurrentAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglSwapBuffersWithDamageKHRRect1
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSWAPBUFFERSWITHDAMAGEKHR_0100
     * @tc.desc   test eglSwapBuffersWithDamageKHR with one rectangle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglSwapBuffersWithDamageKHRRect1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
       async (done: Function) => {
      let result: number = eglndk.eglSwapBuffersWithDamageKHRRect1();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglSwapBuffersWithDamageKHRRect2
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSWAPBUFFERSWITHDAMAGEKHR_0200
     * @tc.desc   test eglSwapBuffersWithDamageKHR with two rectangle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglSwapBuffersWithDamageKHRRect2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
       async (done: Function) => {
      let result: number = eglndk.eglSwapBuffersWithDamageKHRRect2();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglSwapBuffersWithDamageKHRSurfaceRectsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSWAPBUFFERSWITHDAMAGEKHR_0300
     * @tc.desc   testEglSwapBuffersWithDamageKHRSurfaceRectsNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglSwapBuffersWithDamageKHRSurfaceRectsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
       async (done: Function) => {
      let result: number = eglndk.EglSwapBuffersWithDamageKHRSurfaceRectsNull();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglQueryContext001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYCONTEXT_0100
     * @tc.desc   test eglQueryContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglQueryContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQueryContext();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglQueryContext002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYCONTEXT_0200
     * @tc.desc   test eglQueryContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglQueryContext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQueryContextAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglQueryString001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYSTRING_0100
     * @tc.desc   test eglQueryString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglQueryString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQueryString();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglQueryString002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYSTRING_0200
     * @tc.desc   test eglQueryString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglQueryString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQueryStringAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglQuerySurface001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYSURFACE_0100
     * @tc.desc   test eglQuerySurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglQuerySurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQuerySurface();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.name   testEglQuerySurface002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYSURFACE_0200
     * @tc.desc   test eglQuerySurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglQuerySurface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQuerySurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglSwapBuffers001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSWAPBUFFERS_0100
     * @tc.desc   test eglSwapBuffers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglSwapBuffers001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglSwapBuffers();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglSwapBuffers002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSWAPBUFFERS_0200
     * @tc.desc   test eglSwapBuffers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglSwapBuffers002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglSwapBuffersAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglTerminate001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLTERMINATE_0100
     * @tc.desc   test eglTerminate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglTerminate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglTerminate();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglTerminate002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLTERMINATE_0200
     * @tc.desc   test eglTerminate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglTerminate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglTerminateAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglWaitGL001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLWAITGL_0100
     * @tc.desc   test eglWaitGL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglWaitGL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglWaitGL();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglWaitNative001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLWAITNATIVE_0100
     * @tc.desc   test eglWaitNative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglWaitNative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglWaitNative();
      expect(result).assertEqual(1);
      done();
    });


    /**
     * @tc.name   testEglBindTexImage001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLBINDTEXIMAGE_0100
     * @tc.desc   test eglBindTexImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglBindTexImage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglBindTexImage();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglBindTexImage002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLBINDTEXIMAGE_0200
     * @tc.desc   test eglBindTexImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglBindTexImage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglBindTexImageAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglReleaseTexImage001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLRELEASETEXIMAGE_0100
     * @tc.desc   test eglReleaseTexImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglReleaseTexImage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglReleaseTexImage();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglReleaseTexImage002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLRELEASETEXIMAGE_0200
     * @tc.desc   test eglReleaseTexImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglReleaseTexImage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglReleaseTexImageAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglSurfaceAttrib001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSURFACEATTRIB_0100
     * @tc.desc   test eglSurfaceAttrib
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglSurfaceAttrib001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglSurfaceAttrib();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglSurfaceAttrib002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSURFACEATTRIB_0200
     * @tc.desc   test eglSurfaceAttrib
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglSurfaceAttrib002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglSurfaceAttribAbnormal();
      expect(result).assertEqual(1);
      done();
    });


    /**
     * @tc.name   testEglSwapInterval002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSWAPINTERVAL_0200
     * @tc.desc   test eglSwapInterval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglSwapInterval002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglSwapIntervalAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglBindAPI001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLBINDAPI_0100
     * @tc.desc   test eglBindAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglBindAPI001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglBindAPI();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglBindAPI002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLBINDAPI_0200
     * @tc.desc   test eglBindAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglBindAPI002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglBindAPIAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglQueryAPI001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYAPI_0100
     * @tc.desc   test eglQueryAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglQueryAPI001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQueryAPI();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglCreatePbufferFromClientBuffer001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEPBUFFERFROMCLIENTBUFFER_0100
     * @tc.desc   test eglCreatePbufferFromClientBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCreatePbufferFromClientBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = eglndk.eglCreatePbufferFromClientBufferAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglReleaseThread001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLRELEASETHREAD_0100
     * @tc.desc   test eglReleaseThread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglReleaseThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglReleaseThread();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglWaitClient001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLWAITCLIENT_0100
     * @tc.desc   test eglWaitClient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglWaitClient001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglWaitClient();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglGetCurrentContext001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCURRENTCONTEXT_0100
     * @tc.desc   test eglGetCurrentContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetCurrentContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetCurrentContext();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglCreateSync001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATESYNC_0100
     * @tc.desc   test eglCreateSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCreateSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateSync();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglCreateSync002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATESYNC_0200
     * @tc.desc   test eglCreateSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCreateSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateSyncAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglDestroySync001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYSYNC_0100
     * @tc.desc   test eglDestroySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglDestroySync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroySync();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglDestroySync002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYSYNC_0200
     * @tc.desc   test eglDestroySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglDestroySync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroySyncAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglClientWaitSync001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCLIENTWAITSYNC_0100
     * @tc.desc   test eglClientWaitSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglClientWaitSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglClientWaitSync();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglClientWaitSync002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCLIENTWAITSYNC_0200
     * @tc.desc   test eglClientWaitSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglClientWaitSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglClientWaitSyncAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglGetSyncAttrib001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETSYNCATTRIB_0100
     * @tc.desc   test eglGetSyncAttrib
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetSyncAttrib001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetSyncAttrib();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglGetSyncAttrib002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETSYNCATTRIB_0200
     * @tc.desc   test eglGetSyncAttrib
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetSyncAttrib002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetSyncAttribAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglCreateImage001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEIMAGE_0100
     * @tc.desc   test eglCreateImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCreateImage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateImage();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglCreateImage002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEIMAGE_0200
     * @tc.desc   test eglCreateImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCreateImage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateImageAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglDestroyImage001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYIMAGE_0100
     * @tc.desc   test eglDestroyImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglDestroyImage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroyImage();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglDestroyImage002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYIMAGE_0200
     * @tc.desc   test eglDestroyImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglDestroyImage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroyImageAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglGetPlatformDisplay001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETPLATFORMDISPLAY_0100
     * @tc.desc   test eglGetPlatformDisplay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetPlatformDisplay001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetPlatformDisplay();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglGetPlatformDisplay002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETPLATFORMDISPLAY_0200
     * @tc.desc   test eglGetPlatformDisplay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglGetPlatformDisplay002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetPlatformDisplayAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglCreatePlatformWindowSurface001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEPLATFORMWINDOWSURFACE_0100
     * @tc.desc   test eglCreatePlatformWindowSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCreatePlatformWindowSurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = eglndk.eglCreatePlatformWindowSurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglCreatePlatformPixmapSurface001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEPLATFORMPIXMAPSURFACE_0100
     * @tc.desc   test eglCreatePlatformPixmapSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglCreatePlatformPixmapSurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = eglndk.eglCreatePlatformPixmapSurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglWaitSync001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLWAITSYNC_0100
     * @tc.desc   test eglWaitSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglWaitSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglWaitSync();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testEglWaitSync002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLWAITSYNC_0200
     * @tc.desc   test eglWaitSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEglWaitSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglWaitSyncAbnormal();
      expect(result).assertEqual(1);
      done();
    });
  })
}

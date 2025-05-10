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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCHOOSECONFIG_0100
     * @tc.name       : testEglChooseConfig001
     * @tc.desc       : test eglChooseConfig
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglChooseConfig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglChooseConfig();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCHOOSECONFIG_0200
     * @tc.name       : testEglChooseConfig002
     * @tc.desc       : test eglChooseConfig
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglChooseConfig002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglChooseConfigAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCOPYBUFFERS_0100
     * @tc.name       : testEglCopyBuffers001
     * @tc.desc       : test eglCopyBuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCopyBuffers001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCopyBuffersAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATECONTEXT_0100
     * @tc.name       : testEglCreateContext001
     * @tc.desc       : test eglCreateContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCreateContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateContext();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATECONTEXT_0200
     * @tc.name       : testEglCreateContext002
     * @tc.desc       : test eglCreateContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCreateContext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateContextAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEPBUFFERSURFACE_0100
     * @tc.name       : testEglCreatePbufferSurface001
     * @tc.desc       : test eglCreatePbufferSurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCreatePbufferSurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = eglndk.eglCreatePbufferSurface();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEPBUFFERSURFACE_0200
     * @tc.name       : testEglCreatePbufferSurface002
     * @tc.desc       : test eglCreatePbufferSurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCreatePbufferSurface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = eglndk.eglCreatePbufferSurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEPIXMAPSURFACE_0100
     * @tc.name       : testEglCreatePixmapSurface001
     * @tc.desc       : test eglCreatePixmapSurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCreatePixmapSurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreatePixmapSurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEWINDOWSURFACE_0100
     * @tc.name       : testEglCreateWindowSurface001
     * @tc.desc       : test eglCreateWindowSurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCreateWindowSurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateWindowSurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYCONTEXT_0100
     * @tc.name       : testEglDestroyContext001
     * @tc.desc       : test eglDestroyContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglDestroyContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroyContext();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYCONTEXT_0200
     * @tc.name       : testEglDestroyContext002
     * @tc.desc       : test eglDestroyContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglDestroyContext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroyContextAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYSURFACE_0100
     * @tc.name       : testEglDestroySurface001
     * @tc.desc       : test eglDestroySurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglDestroySurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroySurface();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYSURFACE_0200
     * @tc.name       : testEglDestroySurface002
     * @tc.desc       : test eglDestroySurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglDestroySurface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroySurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCONFIGATTRIB_0100
     * @tc.name       : testEglGetConfigAttrib001
     * @tc.desc       : test eglGetConfigAttrib
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetConfigAttrib001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetConfigAttrib();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCONFIGATTRIB_0200
     * @tc.name       : testEglGetConfigAttrib002
     * @tc.desc       : test eglGetConfigAttrib
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetConfigAttrib002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetConfigAttribAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCONFIGS_0100
     * @tc.name       : testEglGetConfigs001
     * @tc.desc       : test eglGetConfigs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetConfigs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetConfigs();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCONFIGS_0200
     * @tc.name       : testEglGetConfigs002
     * @tc.desc       : test eglGetConfigs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetConfigs002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetConfigsAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCURRENTDISPLAY_0100
     * @tc.name       : testEglGetCurrentDisplay001
     * @tc.desc       : test eglGetCurrentDisplay
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetCurrentDisplay001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetCurrentDisplay();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCURRENTDISPLAY_0200
     * @tc.name       : testEglGetCurrentDisplay002
     * @tc.desc       : test eglGetCurrentDisplay
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetCurrentDisplay002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetCurrentDisplayAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCURRENTSURFACE_0100
     * @tc.name       : testEglGetCurrentSurface001
     * @tc.desc       : test eglGetCurrentSurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetCurrentSurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetCurrentSurface();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCURRENTSURFACE_0200
     * @tc.name       : testEglGetCurrentSurface002
     * @tc.desc       : test eglGetCurrentSurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetCurrentSurface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetCurrentSurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETDISPLAY_0100
     * @tc.name       : testEglGetDisplay001
     * @tc.desc       : test eglGetDisplay
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetDisplay001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetDisplay();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETERROR_0100
     * @tc.name       : testEglGetError001
     * @tc.desc       : test eglGetError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetError();
      expect(result).assertEqual(1);
      done();
    });
    
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETPROCADDRESS_0100
     * @tc.name       : testEglGetProcAddress001
     * @tc.desc       : test eglGetProcAddress
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetProcAddress001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetProcAddress();
      expect(result).assertEqual(1);
      done();
    });

     /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETPROCADDRESS_0200
     * @tc.name       : testEglGetProcAddress002
     * @tc.desc       : test eglGetProcAddress
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetProcAddress002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetProcAddressAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLINITIALIZE_0100
     * @tc.name       : testEglInitialize001
     * @tc.desc       : test eglInitialize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglInitialize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglInitialize();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLINITIALIZE_0200
     * @tc.name       : testEglInitialize002
     * @tc.desc       : test eglInitialize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglInitialize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglInitializeAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLMAKECURRENT_0100
     * @tc.name       : testEglMakeCurrent001
     * @tc.desc       : test eglMakeCurrent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglMakeCurrent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglMakeCurrent();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLMAKECURRENT_0200
     * @tc.name       : testEglMakeCurrent002
     * @tc.desc       : test eglMakeCurrent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglMakeCurrent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglMakeCurrentAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYCONTEXT_0100
     * @tc.name       : testEglQueryContext001
     * @tc.desc       : test eglQueryContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglQueryContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQueryContext();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYCONTEXT_0200
     * @tc.name       : testEglQueryContext002
     * @tc.desc       : test eglQueryContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglQueryContext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQueryContextAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYSTRING_0100
     * @tc.name       : testEglQueryString001
     * @tc.desc       : test eglQueryString
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglQueryString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQueryString();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYSTRING_0200
     * @tc.name       : testEglQueryString002
     * @tc.desc       : test eglQueryString
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglQueryString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQueryStringAbnormal();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYSURFACE_0100
     * @tc.name       : testEglQuerySurface001
     * @tc.desc       : test eglQuerySurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglQuerySurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQuerySurface();
      expect(result).assertEqual(1);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYSURFACE_0200
     * @tc.name       : testEglQuerySurface002
     * @tc.desc       : test eglQuerySurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglQuerySurface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQuerySurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSWAPBUFFERS_0100
     * @tc.name       : testEglSwapBuffers001
     * @tc.desc       : test eglSwapBuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglSwapBuffers001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglSwapBuffers();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSWAPBUFFERS_0200
     * @tc.name       : testEglSwapBuffers002
     * @tc.desc       : test eglSwapBuffers
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglSwapBuffers002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglSwapBuffersAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLTERMINATE_0100
     * @tc.name       : testEglTerminate001
     * @tc.desc       : test eglTerminate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglTerminate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglTerminate();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLTERMINATE_0200
     * @tc.name       : testEglTerminate002
     * @tc.desc       : test eglTerminate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglTerminate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglTerminateAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLWAITGL_0100
     * @tc.name       : testEglWaitGL001
     * @tc.desc       : test eglWaitGL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglWaitGL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglWaitGL();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLWAITNATIVE_0100
     * @tc.name       : testEglWaitNative001
     * @tc.desc       : test eglWaitNative
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglWaitNative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglWaitNative();
      expect(result).assertEqual(1);
      done();
    });


    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLBINDTEXIMAGE_0100
     * @tc.name       : testEglBindTexImage001
     * @tc.desc       : test eglBindTexImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglBindTexImage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglBindTexImage();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLBINDTEXIMAGE_0200
     * @tc.name       : testEglBindTexImage002
     * @tc.desc       : test eglBindTexImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglBindTexImage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglBindTexImageAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLRELEASETEXIMAGE_0100
     * @tc.name       : testEglReleaseTexImage001
     * @tc.desc       : test eglReleaseTexImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglReleaseTexImage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglReleaseTexImage();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLRELEASETEXIMAGE_0200
     * @tc.name       : testEglReleaseTexImage002
     * @tc.desc       : test eglReleaseTexImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglReleaseTexImage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglReleaseTexImageAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSURFACEATTRIB_0100
     * @tc.name       : testEglSurfaceAttrib001
     * @tc.desc       : test eglSurfaceAttrib
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglSurfaceAttrib001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglSurfaceAttrib();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSURFACEATTRIB_0200
     * @tc.name       : testEglSurfaceAttrib002
     * @tc.desc       : test eglSurfaceAttrib
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglSurfaceAttrib002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglSurfaceAttribAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSWAPINTERVAL_0100
     * @tc.name       : testEglSwapInterval001
     * @tc.desc       : test eglSwapInterval
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLSWAPINTERVAL_0200
     * @tc.name       : testEglSwapInterval002
     * @tc.desc       : test eglSwapInterval
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglSwapInterval002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglSwapIntervalAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLBINDAPI_0100
     * @tc.name       : testEglBindAPI001
     * @tc.desc       : test eglBindAPI
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglBindAPI001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglBindAPI();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLBINDAPI_0200
     * @tc.name       : testEglBindAPI002
     * @tc.desc       : test eglBindAPI
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglBindAPI002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglBindAPIAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLQUERYAPI_0100
     * @tc.name       : testEglQueryAPI001
     * @tc.desc       : test eglQueryAPI
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglQueryAPI001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglQueryAPI();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEPBUFFERFROMCLIENTBUFFER_0100
     * @tc.name       : testEglCreatePbufferFromClientBuffer001
     * @tc.desc       : test eglCreatePbufferFromClientBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCreatePbufferFromClientBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = eglndk.eglCreatePbufferFromClientBufferAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLRELEASETHREAD_0100
     * @tc.name       : testEglReleaseThread001
     * @tc.desc       : test eglReleaseThread
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglReleaseThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglReleaseThread();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLWAITCLIENT_0100
     * @tc.name       : testEglWaitClient001
     * @tc.desc       : test eglWaitClient
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglWaitClient001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglWaitClient();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETCURRENTCONTEXT_0100
     * @tc.name       : testEglGetCurrentContext001
     * @tc.desc       : test eglGetCurrentContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetCurrentContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetCurrentContext();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATESYNC_0100
     * @tc.name       : testEglCreateSync001
     * @tc.desc       : test eglCreateSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCreateSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateSync();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATESYNC_0200
     * @tc.name       : testEglCreateSync002
     * @tc.desc       : test eglCreateSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCreateSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateSyncAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYSYNC_0100
     * @tc.name       : testEglDestroySync001
     * @tc.desc       : test eglDestroySync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglDestroySync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroySync();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYSYNC_0200
     * @tc.name       : testEglDestroySync002
     * @tc.desc       : test eglDestroySync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglDestroySync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroySyncAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCLIENTWAITSYNC_0100
     * @tc.name       : testEglClientWaitSync001
     * @tc.desc       : test eglClientWaitSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglClientWaitSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglClientWaitSync();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCLIENTWAITSYNC_0200
     * @tc.name       : testEglClientWaitSync002
     * @tc.desc       : test eglClientWaitSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglClientWaitSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglClientWaitSyncAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETSYNCATTRIB_0100
     * @tc.name       : testEglGetSyncAttrib001
     * @tc.desc       : test eglGetSyncAttrib
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetSyncAttrib001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetSyncAttrib();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETSYNCATTRIB_0200
     * @tc.name       : testEglGetSyncAttrib002
     * @tc.desc       : test eglGetSyncAttrib
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetSyncAttrib002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetSyncAttribAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEIMAGE_0100
     * @tc.name       : testEglCreateImage001
     * @tc.desc       : test eglCreateImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCreateImage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateImage();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEIMAGE_0200
     * @tc.name       : testEglCreateImage002
     * @tc.desc       : test eglCreateImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCreateImage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglCreateImageAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYIMAGE_0100
     * @tc.name       : testEglDestroyImage001
     * @tc.desc       : test eglDestroyImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglDestroyImage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroyImage();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLDESTROYIMAGE_0200
     * @tc.name       : testEglDestroyImage002
     * @tc.desc       : test eglDestroyImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglDestroyImage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglDestroyImageAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETPLATFORMDISPLAY_0100
     * @tc.name       : testEglGetPlatformDisplay001
     * @tc.desc       : test eglGetPlatformDisplay
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetPlatformDisplay001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetPlatformDisplay();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLGETPLATFORMDISPLAY_0200
     * @tc.name       : testEglGetPlatformDisplay002
     * @tc.desc       : test eglGetPlatformDisplay
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglGetPlatformDisplay002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglGetPlatformDisplayAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEPLATFORMWINDOWSURFACE_0100
     * @tc.name       : testEglCreatePlatformWindowSurface001
     * @tc.desc       : test eglCreatePlatformWindowSurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCreatePlatformWindowSurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = eglndk.eglCreatePlatformWindowSurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLCREATEPLATFORMPIXMAPSURFACE_0100
     * @tc.name       : testEglCreatePlatformPixmapSurface001
     * @tc.desc       : test eglCreatePlatformPixmapSurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglCreatePlatformPixmapSurface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = eglndk.eglCreatePlatformPixmapSurfaceAbnormal();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLWAITSYNC_0100
     * @tc.name       : testEglWaitSync001
     * @tc.desc       : test eglWaitSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglWaitSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglWaitSync();
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_LIBEGL_EGLWAITSYNC_0200
     * @tc.name       : testEglWaitSync002
     * @tc.desc       : test eglWaitSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testEglWaitSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = eglndk.eglWaitSyncAbnormal();
      expect(result).assertEqual(1);
      done();
    });
  })
}

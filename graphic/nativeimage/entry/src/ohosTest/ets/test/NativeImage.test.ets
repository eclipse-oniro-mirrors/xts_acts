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
import nativeimage from 'libnativeimage.so'
import deviceInfo from '@ohos.deviceInfo'
import { taskpool } from '@kit.ArkTS'


// 定义需要子线程执行的独立函数
@Concurrent
async function oHNativeWindowDropBufferModeSetTrueNormal(): Promise<number> {
  return nativeimage.oHNativeWindowDropBufferModeSetTrueNormal();
}

@Concurrent
async function oHNativeWindowDropBufferModeSetTrueNormal2(): Promise<number> {
  return nativeimage.oHNativeWindowDropBufferModeSetTrueNormal2();
}

@Concurrent
async function oHNativeImageAcquireLatestNativeWindowBufferAbNormal01(): Promise<number> {
  return nativeimage.oHNativeImageAcquireLatestNativeWindowBufferAbNormal01();
}

export default function nativeImageTest() {
    describe('NativeImageTest', () => {
      let deviceTypeInfo: string = deviceInfo.deviceType;
    /**
     * @tc.name   testOHNativeImageCreate001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_CREATE001
     * @tc.desc   test OH_NativeImage_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeimage.oHNativeImageCreate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeImageAcquireNativeWindow001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_ACQUIRENATIVEWINDOW001
     * @tc.desc   test OH_NativeImage_AcquireNativeWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageAcquireNativeWindow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageAcquireNativeWindow();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeImageAcquireNativeWindow002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_ACQUIRENATIVEWINDOW002
     * @tc.desc   test OH_NativeImage_AcquireNativeWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageAcquireNativeWindow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageAcquireNativeWindowAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHNativeImageAttachContext001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_ATTACHCONTEXT001
     * @tc.desc   test OH_NativeImageAttachContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageAttachContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageAttachContext();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeImageAttachContext002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_ATTACHCONTEXT002
     * @tc.desc   test OH_NativeImageAttachContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageAttachContext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageAttachContextAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHNativeImageDetachContext001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_DETACHCONTEXT001
     * @tc.desc   test OH_NativeImage_DetachContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageDetachContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageDetachContext();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testOHNativeImageDetachContext002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_DETACHCONTEXT002
     * @tc.desc   test OH_NativeImage_DetachContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageDetachContext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageDetachContextAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHNativeImageUpdateSurfaceImage001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_UPDATESURFACEIMAGE001
     * @tc.desc   test OH_NativeImage_UpdateSurfaceImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageUpdateSurfaceImage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageUpdateSurfaceImage();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeImageUpdateSurfaceImageBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_UPDATESURFACEIMAGE
     * @tc.desc   test OH_NativeImage_UpdateSurfaceImageBoundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageUpdateSurfaceImageBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageUpdateSurfaceImageBoundary();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeImageUpdateSurfaceImage002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_UPDATESURFACEIMAGE002
     * @tc.desc   test OH_NativeImage_UpdateSurfaceImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageUpdateSurfaceImage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageUpdateSurfaceImageAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHNativeImageGetTimestamp001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_GETTIMESTAMP001
     * @tc.desc   test OH_NativeImage_GetTimestamp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageGetTimestamp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageGetTimestamp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeImageGetTransformMatrix001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_GETTRANSFORMMATRIX001
     * @tc.desc   test OH_NativeImage_GetTransformMatrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageGetTransformMatrix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageGetTransformMatrix();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeImageGetTransformMatrix002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_GETTRANSFORMMATRIX002
     * @tc.desc   test OH_NativeImage_GetTransformMatrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageGetTransformMatrix002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageGetTransformMatrixAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHNativeImageDestroy001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_DESTROY001
     * @tc.desc   test OH_NativeImage_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeImageDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageDestroy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageCreateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0100
     * @tc.desc   test OH_NativeImage_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageCreateNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageCreateNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageCreateAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0101
     * @tc.desc   test OH_NativeImage_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageCreateAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeimage.oHNativeImageCreateAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageDestroy
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0102
     * @tc.desc   test OH_NativeImage_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageDestroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeimage.oHNativeImageDestroy1();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageCreateMuch
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0103
     * @tc.desc   test OH_NativeImage_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageCreateMuch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeimage.oHNativeImageCreateMuch();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageAcquireNativeWindowNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0200
     * @tc.desc   test OH_NativeImage_AcquireNativeWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageAcquireNativeWindowNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageAcquireNativeWindowNullptr();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageAcquireNativeWindowNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0201
     * @tc.desc   test OH_NativeImage_AcquireNativeWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageAcquireNativeWindowNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageAcquireNativeWindowNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageAttachContextNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0300
     * @tc.desc   test OH_NativeImage_AttachContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageAttachContextNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAttachContextNullptr();
      console.info("testNativeImageAttachContextNullptr result:" + result)
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageDetachContextNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0301
     * @tc.desc   test OH_NativeImage_DetachContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageDetachContextNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageDetachContextNullptr();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageAttachContextNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0302
     * @tc.desc   test OH_NativeImage_AcquireNativeWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageAttachContextNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAttachContextNormal();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageDetachContextNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0303
     * @tc.desc   test OH_NativeImage_DetachContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageDetachContextNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageDetachContextNormal();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageGetSurfaceIdNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0400
     * @tc.desc   test OH_NativeImage_GetSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageGetSurfaceIdNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetSurfaceIdNullptr();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeGetSurfaceIdNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0401
     * @tc.desc   test OH_NativeImage_GetSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeGetSurfaceIdNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeimage.oHNativeGetSurfaceIdNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageUpdateSurfaceImageNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0500
     * @tc.desc   test OH_NativeImage_UpdateSurfaceImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageUpdateSurfaceImageNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageUpdateSurfaceImageNullptr();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageGetTimestampNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0501
     * @tc.desc   test OH_NativeImage_GetTimestamp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageGetTimestampNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageGetTimestampNullptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageGetTransformMatrixNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0502
     * @tc.desc   test OH_NativeImage_GetTransformMatrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageGetTransformMatrixNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetTransformMatrixNullptr();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageGetTransformMatrixV2Nullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0503
     * @tc.desc   test OH_NativeImage_GetTransformMatrixV2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageGetTransformMatrixV2Nullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetTransformMatrixV2Nullptr();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageUpdateSurfaceImageNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0504
     * @tc.desc   test OH_NativeImage_UpdateSurfaceImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageUpdateSurfaceImageNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageUpdateSurfaceImageNormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageGetTimestampNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0505
     * @tc.desc   test OH_NativeImage_UpdateSurfaceImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageGetTimestampNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetTimestampNormal();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      expect(result[2]).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageGetTransformMatrixNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0507
     * @tc.desc   test OH_NativeImage_UpdateSurfaceImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageGetTransformMatrixNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetTransformMatrixNormal();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageGetTransformMatrixV2Normal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0508
     * @tc.desc   test OH_NativeImage_UpdateSurfaceImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageGetTransformMatrixV2Normal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetTransformMatrixV2Normal();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageSetOnFrameAvailableListenerNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0600
     * @tc.desc   test OH_NativeImage_SetOnFrameAvailableListener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageSetOnFrameAvailableListenerNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageSetOnFrameAvailableListenerNullptr();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageUnSetOnFrameAvailableListenerNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0601
     * @tc.desc   test OH_NativeImage_UnsetOnFrameAvailableListener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageUnSetOnFrameAvailableListenerNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageUnSetOnFrameAvailableListenerNullptr();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageSetOnFrameAvailableListenerNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0602
     * @tc.desc   test OH_NativeImage_SetOnFrameAvailableListener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageSetOnFrameAvailableListenerNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageSetOnFrameAvailableListenerNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageUnsetOnFrameAvailableListenerNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0603
     * @tc.desc   test OH_NativeImage_UnsetOnFrameAvailableListener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageUnsetOnFrameAvailableListenerNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageUnsetOnFrameAvailableListenerNormal();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });
    
    /**
     * @tc.name   testNativeImageGetBufferMatrixNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0700
     * @tc.desc   test OH_NativeImage_GetBufferMatrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageGetBufferMatrixNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageGetBufferMatrixNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageGetBufferMatrixNormal01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0701
     * @tc.desc   test OH_NativeImage_GetBufferMatrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageGetBufferMatrixNormal01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetBufferMatrixNormal01();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageGetBufferMatrixAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0702
     * @tc.desc   test OH_NativeImage_GetBufferMatrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageGetBufferMatrixAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetBufferMatrixAbNormal();
      expect(result[0]).assertEqual(40001000);
      expect(result[1]).assertEqual(40001000);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageGetBufferMatrixCall
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0703
     * @tc.desc   test OH_NativeImage_GetBufferMatrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageGetBufferMatrixCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageGetBufferMatrixCall();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageAcquireNativeWindowBufferNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0800
     * @tc.desc   test OH_NativeImage_AcquireNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageAcquireNativeWindowBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferNormal();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageAcquireNativeWindowBufferCall
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0900
     * @tc.desc   test OH_NativeImage_AcquireNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageAcquireNativeWindowBufferCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferCall();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageAcquireNativeWindowBufferAbNormal01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1000
     * @tc.desc   test OH_NativeImage_AcquireNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageAcquireNativeWindowBufferAbNormal01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferAbNormal01();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageAcquireNativeWindowBufferAbNormal02
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1100
     * @tc.desc   test OH_NativeImage_AcquireNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageAcquireNativeWindowBufferAbNormal02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferAbNormal02();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageAcquireNativeWindowBufferAbNormal03
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1200
     * @tc.desc   test OH_NativeImage_AcquireNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageAcquireNativeWindowBufferAbNormal03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferAbNormal03();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeImageAcquireNativeWindowBufferAbNormal04
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1300
     * @tc.desc   test OH_NativeImage_AcquireNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageAcquireNativeWindowBufferAbNormal04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferAbNormal04();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageAcquireNativeWindowBufferAbNormal05
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1400
     * @tc.desc   test OH_NativeImage_AcquireNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageAcquireNativeWindowBufferAbNormal05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferAbNormal05();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeImageReleaseNativeWindowBufferAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1500
     * @tc.desc   test OH_NativeImage_ReleaseNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageReleaseNativeWindowBufferAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageReleaseNativeWindowBufferAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testConsumerSurfaceSetDefaultUsageNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1600
     * @tc.desc   test OH_NativeImage_SetDefaultUsageNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConsumerSurfaceSetDefaultUsageNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHConsumerSurfaceSetDefaultUsageNormal();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testConsumerSurfaceSetDefaultUsageCall
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1700
     * @tc.desc   test OH_NativeImage_SetDefaultUsageCall
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConsumerSurfaceSetDefaultUsageCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHConsumerSurfaceSetDefaultUsageCall();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testConsumerSurfaceSetDefaultUsageAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1800
     * @tc.desc   test OH_NativeImage_SetDefaultUsageAbNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConsumerSurfaceSetDefaultUsageAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHConsumerSurfaceSetDefaultUsageAbNormal();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(40001000);
      done();
    });
  
    /**
     * @tc.name   testConsumerSurfaceSetDefaultSizeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1900
     * @tc.desc   test OH_NativeImage_SetDefaultSizeNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConsumerSurfaceSetDefaultSizeNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHConsumerSurfaceSetDefaultSizeNormal();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(0);
      expect(result[5]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testConsumerSurfaceSetDefaultSizeCall
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2000
     * @tc.desc   test OH_NativeImage_SetDefaultSizeCall
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConsumerSurfaceSetDefaultSizeCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHConsumerSurfaceSetDefaultSizeCall();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testConsumerSurfaceSetDefaultSizeAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2100
     * @tc.desc   test OH_NativeImage_SetDefaultSizeAbNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConsumerSurfaceSetDefaultSizeAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHConsumerSurfaceSetDefaultSizeAbNormal();
      expect(result[0]).assertEqual(40001000);
      expect(result[1]).assertEqual(40001000);
      expect(result[2]).assertEqual(40001000);
      expect(result[3]).assertEqual(40001000);
      expect(result[4]).assertEqual(40001000);
      done();
    });

    /**
     * @tc.name   testConsumerSurfaceSetDefaultSizeAbNormal01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2200
     * @tc.desc   test OH_NativeImage_SetDefaultSizeAbNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConsumerSurfaceSetDefaultSizeAbNormal01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHConsumerSurfaceSetDefaultSizeAbNormal01();
      expect(result[0]).assertEqual(40001000);
      expect(result[1]).assertEqual(40001000);
      expect(result[2]).assertEqual(40001000);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(40001000);
      done();
    });

    /**
     * @tc.name   testConsumerSurfaceCreateAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2300
     * @tc.desc   test OH_NativeImage_SetDefaultSizeAbNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConsumerSurfaceCreateAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHConsumerSurfaceCreateAbNormal();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testConsumerSurfaceSetDefaultUsageSizeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2400
     * @tc.desc   test OHConsumerSurfaceSetDefaultUsageSizeNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConsumerSurfaceSetDefaultUsageSizeNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeimage.OHConsumerSurfaceSetDefaultUsageSizeNormal();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowDropBufferModeSetTrueNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2500
     * @tc.desc   test testNativeWindowDropBufferModeSetTrueNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowDropBufferModeSetTrueNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          // 通过 taskpool 调度到子线程执行
          const result = await taskpool.execute(oHNativeWindowDropBufferModeSetTrueNormal);
          expect(result).assertEqual(0);
        } catch (err) {
          console.error(`Task execution failed: ${err}`);
        } finally {
          done();  // 确保完成回调
        }
      });

    /**
     * @tc.name   testNativeWindowDropBufferModeSetTrueNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2600
     * @tc.desc   test testNativeWindowDropBufferModeSetTrueNormal2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeWindowDropBufferModeSetTrueNormal2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          // 通过 taskpool 调度到子线程执行
          const result = await taskpool.execute(oHNativeWindowDropBufferModeSetTrueNormal2);
          expect(result).assertEqual(0);
        } catch (err) {
          console.error(`Task execution failed: ${err}`);
        } finally {
          done();  // 确保完成回调
        }
      });

    /**
     * @tc.name   testNativeWindowDropBufferModeSetAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2700
     * @tc.desc   test testNativeWindowDropBufferModeSetAbNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowDropBufferModeSetAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeWindowDropBufferModeSetAbNormal();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageReleaseNativeWindowBufferNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2800
     * @tc.desc   test OH_NativeImage_ReleaseNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageReleaseNativeWindowBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageReleaseNativeWindowBufferNormal();
        expect(result).assertEqual(0);
        done();
    });

    /**
     * @tc.name   testNativeImageReleaseNativeWindowBufferAbnormal01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2900
     * @tc.desc   test OH_NativeImage_ReleaseNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageReleaseNativeWindowBufferAbnormal01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageReleaseNativeWindowBufferAbnormal01();
        expect(result).assertEqual(0);
        done();
    });

    /**
     * @tc.name   testNativeImageCreateWithSingleBufferModeUsingTextImageNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3000
     * @tc.desc   test oH_NativeImage_CreateWithSingleBufferMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageCreateWithSingleBufferModeUsingTextImageNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageCreateWithSingleBufferModeUsingTextImageNormal();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageCreateWithSingleBufferModeUsingTextImageNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3001
     * @tc.desc   test oH_NativeImage_CreateWithSingleBufferMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeImageCreateWithSingleBufferModeUsingTextImageNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageCreateWithSingleBufferModeUsingTextImageNull();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageCreateWithSingleBufferModeUsingTextImageAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3002
     * @tc.desc   test oH_NativeImage_CreateWithSingleBufferMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeImageCreateWithSingleBufferModeUsingTextImageAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: Array<number> = nativeimage.oHNativeImageCreateWithSingleBufferModeUsingTextImageAbnormal();
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageCreateWithSingleBufferModeUsingTextImageMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3003
     * @tc.desc   test oH_NativeImage_CreateWithSingleBufferMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeImageCreateWithSingleBufferModeUsingTextImageMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageCreateWithSingleBufferModeUsingTextImageMultipleCalls();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3100
     * @tc.desc   test oH_ConsumerSurface_CreateWithSingleBufferMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: Array<number> = nativeimage.oHConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageNormal();
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3101
     * @tc.desc   test oH_ConsumerSurface_CreateWithSingleBufferMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: Array<number> = nativeimage.oHConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageAbnormal();
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(0);
        expect(result[2]).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3102
     * @tc.desc   test oH_ConsumerSurface_CreateWithSingleBufferMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageMultipleCalls();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageReleaseTextImageNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3200
     * @tc.desc   test oH_NativeImage_ReleaseTextImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageReleaseTextImageNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageReleaseTextImageNormal();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageReleaseTextImageNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3201
     * @tc.desc   test oH_NativeImage_ReleaseTextImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeImageReleaseTextImageNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageReleaseTextImageNull();
        expect(result).assertEqual(-1);
        done();
      });

    /**
     * @tc.name   testNativeImageReleaseTextImageMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3202
     * @tc.desc   test oH_NativeImage_ReleaseTextImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeImageReleaseTextImageMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageReleaseTextImageMultipleCalls();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageReleaseTextImageDestroyImage
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3203
     * @tc.desc   test oH_NativeImage_ReleaseTextImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeImageReleaseTextImageDestroyImage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageReleaseTextImageDestroyImage();
        expect(result).assertEqual(40001000);
        done();
      });

    /**
     * @tc.name   testNativeImageGetColorSpaceNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3300
     * @tc.desc   test oH_NativeImage_GetColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageGetColorSpaceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageGetColorSpaceNormal();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageGetColorSpaceNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3301
     * @tc.desc   test oH_NativeImage_GetColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeImageGetColorSpaceNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageGetColorSpaceNull();
        expect(result).assertEqual(-1);
        done();
      });

    /**
     * @tc.name   testNativeImageGetColorSpaceMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3302
     * @tc.desc   test oH_NativeImage_GetColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeImageGetColorSpaceMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageGetColorSpaceMultipleCalls();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageGetColorSpaceDestoryImage
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3303
     * @tc.desc   test oH_NativeImage_GetColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeImageGetColorSpaceDestoryImage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageGetColorSpaceDestoryImage();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageCreateWithSingleBufferModeTest1
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3400
     * @tc.desc   test oH_NativeImage_CreateWithSingleBufferMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNativeImageCreateWithSingleBufferModeTest1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        if (deviceTypeInfo == "default") {
          console.log("This testcase does not support rk");
          done();
        } else {
          let result: number = nativeimage.oHNativeImageCreateWithSingleBufferModeTest1();
          expect(result).assertEqual(0);
          done();
        }
      });

    /**
     * @tc.name   testNativeImageCreateWithSingleBufferModeTest2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3401
     * @tc.desc   test oH_NativeImage_CreateWithSingleBufferMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNativeImageCreateWithSingleBufferModeTest2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageCreateWithSingleBufferModeTest2();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageCreateWithSingleBufferModeTest3
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3402
     * @tc.desc   test oH_NativeImage_CreateWithSingleBufferMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNativeImageCreateWithSingleBufferModeTest3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageCreateWithSingleBufferModeTest3();
        expect(result).assertEqual(40001000);
        done();
      });

    /**
     * @tc.name   testConsumerSurfaceCreateWithSingleBufferModeTest
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3500
     * @tc.desc   test oH_ConsumerSurface_CreateWithSingleBufferMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConsumerSurfaceCreateWithSingleBufferModeTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let result: number = nativeimage.oHConsumerSurfaceCreateWithSingleBufferModeTest();
        expect(result).assertEqual(-1);
        done();
      });

    /**
     * @tc.name   testNativeImageAcquireLatestNativeWindowBufferAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3600
     * @tc.desc   test OH_NativeImage_AcquireLatestNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeImageAcquireLatestNativeWindowBufferAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageAcquireLatestNativeWindowBufferAbNormal();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageAcquireLatestNativeWindowBufferAbNormal01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3601
     * @tc.desc   test OH_NativeImage_AcquireLatestNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeImageAcquireLatestNativeWindowBufferAbNormal01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          // 通过 taskpool 调度到子线程执行
          const result = await taskpool.execute(oHNativeImageAcquireLatestNativeWindowBufferAbNormal01);
          expect(result).assertEqual(0);
        } catch (err) {
          console.error(`Task execution failed: ${err}`);
        } finally {
          done();  // 确保完成回调
        }
      });

    /**
     * @tc.name   testNativeImageAcquireLatestNativeWindowBufferAbNormal02
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3602
     * @tc.desc   test OH_NativeImage_AcquireLatestNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeImageAcquireLatestNativeWindowBufferAbNormal02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageAcquireLatestNativeWindowBufferAbNormal02();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageAcquireLatestNativeWindowBufferAbNormal03
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3603
     * @tc.desc   test OH_NativeImage_AcquireLatestNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeImageAcquireLatestNativeWindowBufferAbNormal03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageAcquireLatestNativeWindowBufferAbNormal03();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageAcquireLatestNativeWindowBufferCall
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3604
     * @tc.desc   test OH_NativeImage_AcquireLatestNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeImageAcquireLatestNativeWindowBufferCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageAcquireLatestNativeWindowBufferCall();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeImageCreateWithSingleBufferModeChangeTextureTarget
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3700
     * @tc.desc   test OH_NativeImage_CreateWithSingleBufferMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeImageCreateWithSingleBufferModeChangeTextureTarget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeImageCreateWithSingleBufferModeChangeTextureTarget();
        expect(result).assertEqual(0);
        done();
      });

      /**
       * @tc.name   testNativeImageIsReleasedNull
       * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3800
       * @tc.desc   test OH_NativeImage_IsReleased
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testNativeImageIsReleasedNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: Function) => {
          let result: number = nativeimage.oHNativeImageIsReleasedNull();
          expect(result).assertEqual(0);
          done();
        });
      /**
       * @tc.name   testNativeImageIsReleasedNull1
       * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3801
       * @tc.desc   test OH_NativeImage_IsReleased
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testNativeImageIsReleasedNull1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: Function) => {
          let result: number = nativeimage.oHNativeImageIsReleasedNull1();
          expect(result).assertEqual(0);
          done();
        });
      /**
       * @tc.name   testNativeImageIsReleasedNormal0
       * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3802
       * @tc.desc   test OH_NativeImage_IsReleased
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNativeImageIsReleasedNormal0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
        async (done: Function) => {
          let result: number = nativeimage.oHNativeImageIsReleasedNormal0();
          expect(result).assertEqual(0);
          done();
        });
      /**
       * @tc.name   testNativeImageIsReleasedNormal1
       * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3803
       * @tc.desc   test OH_NativeImage_IsReleased
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNativeImageIsReleasedNormal1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
        async (done: Function) => {
          let result: number = nativeimage.oHNativeImageIsReleasedNormal1();
          expect(result).assertEqual(0);
          done();
        });
      /**
       * @tc.name   testNativeImageReleasedNull
       * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3804
       * @tc.desc   test OH_NativeImage_Release
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testNativeImageReleasedNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: Function) => {
          let result: number = nativeimage.oHNativeImageReleasedNull();
          expect(result).assertEqual(0);
          done();
        });
      /**
       * @tc.name   testNativeImageReleasedNormal
       * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3805
       * @tc.desc   test OH_NativeImage_Release
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNativeImageReleasedNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
        async (done: Function) => {
          let result: number = nativeimage.oHNativeImageReleasedNormal();
          expect(result).assertEqual(0);
          done();
        });
      /**
       * @tc.name   testNativeImageReleasedNormal1
       * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3806
       * @tc.desc   test OH_NativeImage_Release
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNativeImageReleasedNormal1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
        async (done: Function) => {
          let result: Array<number> = nativeimage.oHNativeImageReleasedNormal1();
          expect(result[0]).assertEqual(0);
          expect(result[1]).assertEqual(0);
          expect(result[2]).assertEqual(0);
          done();
        });
      /**
       * @tc.name   testNativeImageIsReleasedCalls
       * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3807
       * @tc.desc   test OH_NativeImage_IsReleased
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testNativeImageIsReleasedCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: Function) => {
          let result: number = nativeimage.oHNativeImageIsReleasedCalls();
          expect(result).assertEqual(0);
          done();
        });
      /**
       * @tc.name   testNativeImageReleasedCalls
       * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3808
       * @tc.desc   test OH_NativeImage_Release
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testNativeImageReleasedCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: Function) => {
          let result: number = nativeimage.oHNativeImageReleasedCalls();
          expect(result).assertEqual(0);
          done();
        });
      /**
       * @tc.name   testNativeImageReleaseAbnormal
       * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3809
       * @tc.desc   test OH_NativeImage_IsReleased OH_NativeImage_Release
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testNativeImageReleaseAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: Function) => {
          let result: number = nativeimage.oHNativeImageReleaseAbnormal();
          expect(result).assertEqual(0);
          done();
        });
      /**
       * @tc.name   testNativeErrorCodeCover
       * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_3900
       * @tc.desc   test ErrorCode
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testNativeErrorCodeCover', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: Function) => {
          let result: number = nativeimage.oHNativeErrorCodeCover();
          expect(result).assertEqual(0);
          done();
        });
  })
}
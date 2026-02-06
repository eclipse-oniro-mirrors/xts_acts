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

export default function nativeImageTest() {
    describe('NativeImageTest', () => {
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_CREATE001
     * @tc.name       : testOHNativeImageCreate001
     * @tc.desc       : test OH_NativeImage_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeimage.oHNativeImageCreate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_ACQUIRENATIVEWINDOW001
     * @tc.name       : testOHNativeImageAcquireNativeWindow001
     * @tc.desc       : test OH_NativeImage_AcquireNativeWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageAcquireNativeWindow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageAcquireNativeWindow();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_ACQUIRENATIVEWINDOW002
     * @tc.name       : testOHNativeImageAcquireNativeWindow002
     * @tc.desc       : test OH_NativeImage_AcquireNativeWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageAcquireNativeWindow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageAcquireNativeWindowAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_ATTACHCONTEXT001
     * @tc.name       : testOHNativeImageAttachContext001
     * @tc.desc       : test OH_NativeImageAttachContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageAttachContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageAttachContext();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_ATTACHCONTEXT002
     * @tc.name       : testOHNativeImageAttachContext002
     * @tc.desc       : test OH_NativeImageAttachContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageAttachContext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageAttachContextAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_DETACHCONTEXT001
     * @tc.name       : testOHNativeImageDetachContext001
     * @tc.desc       : test OH_NativeImage_DetachContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageDetachContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageDetachContext();
      expect(result).assertEqual(0);
      done();
    });
   /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_DETACHCONTEXT002
     * @tc.name       : testOHNativeImageDetachContext002
     * @tc.desc       : test OH_NativeImage_DetachContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageDetachContext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageDetachContextAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_UPDATESURFACEIMAGE001
     * @tc.name       : testOHNativeImageUpdateSurfaceImage001
     * @tc.desc       : test OH_NativeImage_UpdateSurfaceImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageUpdateSurfaceImage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageUpdateSurfaceImage();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_UPDATESURFACEIMAGE
     * @tc.name       : testOHNativeImageUpdateSurfaceImageBoundary
     * @tc.desc       : test OH_NativeImage_UpdateSurfaceImageBoundary
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageUpdateSurfaceImageBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageUpdateSurfaceImageBoundary();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_UPDATESURFACEIMAGE002
     * @tc.name       : testOHNativeImageUpdateSurfaceImage002
     * @tc.desc       : test OH_NativeImage_UpdateSurfaceImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageUpdateSurfaceImage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageUpdateSurfaceImageAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_GETTIMESTAMP001
     * @tc.name       : testOHNativeImageGetTimestamp001
     * @tc.desc       : test OH_NativeImage_GetTimestamp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageGetTimestamp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageGetTimestamp();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_GETTRANSFORMMATRIX001
     * @tc.name       : testOHNativeImageGetTransformMatrix001
     * @tc.desc       : test OH_NativeImage_GetTransformMatrix
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageGetTransformMatrix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageGetTransformMatrix();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_GETTRANSFORMMATRIX002
     * @tc.name       : testOHNativeImageGetTransformMatrix002
     * @tc.desc       : test OH_NativeImage_GetTransformMatrix
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageGetTransformMatrix002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageGetTransformMatrixAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_IMAGE_OH_NATIVEIMAGE_DESTROY001
     * @tc.name       : testOHNativeImageDestroy001
     * @tc.desc       : test OH_NativeImage_Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeImageDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageDestroy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0100
     * @tc.name       : testNativeImageCreateNormal
     * @tc.desc       : test OH_NativeImage_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeImageCreateNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageCreateNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0101
     * @tc.name       : testNativeImageCreateAbnormal
     * @tc.desc       : test OH_NativeImage_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeImageCreateAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeimage.oHNativeImageCreateAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0102
     * @tc.name       : testNativeImageDestroy
     * @tc.desc       : test OH_NativeImage_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeImageDestroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeimage.oHNativeImageDestroy1();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0103
     * @tc.name       : testNativeImageCreateMuch
     * @tc.desc       : test OH_NativeImage_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeImageCreateMuch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeimage.oHNativeImageCreateMuch();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0200
     * @tc.name       : testNativeImageAcquireNativeWindowNullptr
     * @tc.desc       : test OH_NativeImage_AcquireNativeWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeImageAcquireNativeWindowNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageAcquireNativeWindowNullptr();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0201
     * @tc.name       : testNativeImageAcquireNativeWindowNormal
     * @tc.desc       : test OH_NativeImage_AcquireNativeWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeImageAcquireNativeWindowNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageAcquireNativeWindowNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0300
     * @tc.name       : testNativeImageAttachContextNullptr
     * @tc.desc       : test OH_NativeImage_AttachContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0301
     * @tc.name       : testNativeImageDetachContextNullptr
     * @tc.desc       : test OH_NativeImage_DetachContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeImageDetachContextNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageDetachContextNullptr();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0302
     * @tc.name       : testNativeImageAttachContextNormal
     * @tc.desc       : test OH_NativeImage_AcquireNativeWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeImageAttachContextNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAttachContextNormal();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0303
     * @tc.name       : testNativeImageDetachContextNormal
     * @tc.desc       : test OH_NativeImage_DetachContext
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0400
     * @tc.name       : testNativeImageGetSurfaceIdNullptr
     * @tc.desc       : test OH_NativeImage_GetSurfaceId
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeImageGetSurfaceIdNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetSurfaceIdNullptr();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0401
     * @tc.name       : testNativeGetSurfaceIdNormal
     * @tc.desc       : test OH_NativeImage_GetSurfaceId
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeGetSurfaceIdNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeimage.oHNativeGetSurfaceIdNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0500
     * @tc.name       : testNativeImageUpdateSurfaceImageNullptr
     * @tc.desc       : test OH_NativeImage_UpdateSurfaceImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeImageUpdateSurfaceImageNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageUpdateSurfaceImageNullptr();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0501
     * @tc.name       : testNativeImageGetTimestampNullptr
     * @tc.desc       : test OH_NativeImage_GetTimestamp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeImageGetTimestampNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageGetTimestampNullptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0502
     * @tc.name       : testNativeImageGetTransformMatrixNullptr
     * @tc.desc       : test OH_NativeImage_GetTransformMatrix
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeImageGetTransformMatrixNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetTransformMatrixNullptr();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0503
     * @tc.name       : testNativeImageGetTransformMatrixV2Nullptr
     * @tc.desc       : test OH_NativeImage_GetTransformMatrixV2
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeImageGetTransformMatrixV2Nullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetTransformMatrixV2Nullptr();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0504
     * @tc.name       : testNativeImageUpdateSurfaceImageNormal
     * @tc.desc       : test OH_NativeImage_UpdateSurfaceImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeImageUpdateSurfaceImageNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageUpdateSurfaceImageNormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0505
     * @tc.name       : testNativeImageGetTimestampNormal
     * @tc.desc       : test OH_NativeImage_UpdateSurfaceImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0507
     * @tc.name       : testNativeImageGetTransformMatrixNormal
     * @tc.desc       : test OH_NativeImage_UpdateSurfaceImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeImageGetTransformMatrixNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetTransformMatrixNormal();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0508
     * @tc.name       : testNativeImageGetTransformMatrixV2Normal
     * @tc.desc       : test OH_NativeImage_UpdateSurfaceImage
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeImageGetTransformMatrixV2Normal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetTransformMatrixV2Normal();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0600
     * @tc.name       : testNativeImageSetOnFrameAvailableListenerNullptr
     * @tc.desc       : test OH_NativeImage_SetOnFrameAvailableListener
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeImageSetOnFrameAvailableListenerNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageSetOnFrameAvailableListenerNullptr();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0601
     * @tc.name       : testNativeImageUnSetOnFrameAvailableListenerNullptr
     * @tc.desc       : test OH_NativeImage_UnsetOnFrameAvailableListener
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeImageUnSetOnFrameAvailableListenerNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageUnSetOnFrameAvailableListenerNullptr();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0602
     * @tc.name       : testNativeImageSetOnFrameAvailableListenerNormal
     * @tc.desc       : test OH_NativeImage_SetOnFrameAvailableListener
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeImageSetOnFrameAvailableListenerNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageSetOnFrameAvailableListenerNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0603
     * @tc.name       : testNativeImageUnsetOnFrameAvailableListenerNormal
     * @tc.desc       : test OH_NativeImage_UnsetOnFrameAvailableListener
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
      * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0700
      * @tc.name       : testNativeImageGetBufferMatrixNormal
      * @tc.desc       : test OH_NativeImage_GetBufferMatrix
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testNativeImageGetBufferMatrixNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageGetBufferMatrixNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
      * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0701
      * @tc.name       : testNativeImageGetBufferMatrixNormal01
      * @tc.desc       : test OH_NativeImage_GetBufferMatrix
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testNativeImageGetBufferMatrixNormal01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageGetBufferMatrixNormal01();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
      * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0702
      * @tc.name       : testNativeImageGetBufferMatrixAbNormal
      * @tc.desc       : test OH_NativeImage_GetBufferMatrix
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 3
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
      * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0703
      * @tc.name       : testNativeImageGetBufferMatrixNormal
      * @tc.desc       : test OH_NativeImage_GetBufferMatrix
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testNativeImageGetBufferMatrixCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageGetBufferMatrixCall();
      expect(result).assertEqual(0);
      done();
    });

    /**
      * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0800
      * @tc.name       : testNativeImageAcquireNativeWindowBufferNormal
      * @tc.desc       : test OH_NativeImage_AcquireNativeWindowBuffer
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testNativeImageAcquireNativeWindowBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferNormal();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_0900
    * @tc.name       : testNativeImageAcquireNativeWindowBufferCall
    * @tc.desc       : test OH_NativeImage_AcquireNativeWindowBuffer
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testNativeImageAcquireNativeWindowBufferCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferCall();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1000
    * @tc.name       : testNativeImageAcquireNativeWindowBufferAbNormal01
    * @tc.desc       : test OH_NativeImage_AcquireNativeWindowBuffer
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testNativeImageAcquireNativeWindowBufferAbNormal01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferAbNormal01();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1100
    * @tc.name       : testNativeImageAcquireNativeWindowBufferAbNormal02
    * @tc.desc       : test OH_NativeImage_AcquireNativeWindowBuffer
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testNativeImageAcquireNativeWindowBufferAbNormal02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferAbNormal02();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1200
    * @tc.name       : testNativeImageAcquireNativeWindowBufferAbNormal03
    * @tc.desc       : test OH_NativeImage_AcquireNativeWindowBuffer
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testNativeImageAcquireNativeWindowBufferAbNormal03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferAbNormal03();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1300
    * @tc.name       : testNativeImageAcquireNativeWindowBufferAbNormal04
    * @tc.desc       : test OH_NativeImage_AcquireNativeWindowBuffer
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testNativeImageAcquireNativeWindowBufferAbNormal04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferAbNormal04();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1400
    * @tc.name       : testNativeImageAcquireNativeWindowBufferAbNormal05
    * @tc.desc       : test OH_NativeImage_AcquireNativeWindowBuffer
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testNativeImageAcquireNativeWindowBufferAbNormal05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHNativeImageAcquireNativeWindowBufferAbNormal05();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1500
    * @tc.name       : testNativeImageReleaseNativeWindowBufferAbnormal
    * @tc.desc       : test OH_NativeImage_ReleaseNativeWindowBuffer
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testNativeImageReleaseNativeWindowBufferAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeimage.oHNativeImageReleaseNativeWindowBufferAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1600
    * @tc.name       : testNativeImageSetDefaultUsageNormal
    * @tc.desc       : test OH_NativeImage_SetDefaultUsageNormal
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
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
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1700
    * @tc.name       : testConsumerSurfaceSetDefaultUsageCall
    * @tc.desc       : test OH_NativeImage_SetDefaultUsageCall
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConsumerSurfaceSetDefaultUsageCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHConsumerSurfaceSetDefaultUsageCall();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1800
    * @tc.name       : testConsumerSurfaceSetDefaultUsageAbNormal
    * @tc.desc       : test OH_NativeImage_SetDefaultUsageAbNormal
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
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
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_1900
    * @tc.name       : testConsumerSurfaceSetDefaultSizeNormal
    * @tc.desc       : test OH_NativeImage_SetDefaultSizeNormal
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
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
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2000
    * @tc.name       : testConsumerSurfaceSetDefaultSizeCall
    * @tc.desc       : test OH_NativeImage_SetDefaultSizeCall
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */  
    it('testConsumerSurfaceSetDefaultSizeCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeimage.oHConsumerSurfaceSetDefaultSizeCall();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2100
    * @tc.name       : testConsumerSurfaceSetDefaultSizeAbNormal
    * @tc.desc       : test OH_NativeImage_SetDefaultSizeAbNormal
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
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
    * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2200
    * @tc.name       : testConsumerSurfaceSetDefaultSizeAbNormal
    * @tc.desc       : test OH_NativeImage_SetDefaultSizeAbNormal
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2300
     * @tc.name       : testConsumerSurfaceSetDefaultSizeAbNormal
     * @tc.desc       : test OH_NativeImage_SetDefaultSizeAbNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testConsumerSurfaceCreateAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHConsumerSurfaceCreateAbNormal();
        expect(result).assertEqual(0);
        done();
      });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2400
     * @tc.name       : testConsumerSurfaceSetDefaultUsageSizeNormal
     * @tc.desc       : test OHConsumerSurfaceSetDefaultUsageSizeNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testConsumerSurfaceSetDefaultUsageSizeNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeimage.OHConsumerSurfaceSetDefaultUsageSizeNormal();
        expect(result).assertEqual(0);
        done();
      });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2500
     * @tc.name       : TestNativeWindowDropBufferModeSetTrueNormal
     * @tc.desc       : test testNativeWindowDropBufferModeSetTrueNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowDropBufferModeSetTrueNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeWindowDropBufferModeSetTrueNormal();
        expect(result).assertEqual(0);
        done();
      });
      /**
       * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2600
       * @tc.name       : testNativeWindowDropBufferModeSetTrueNormal2
       * @tc.desc       : test testNativeWindowDropBufferModeSetTrueNormal2
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
      it('testNativeWindowDropBufferModeSetTrueNormal2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
        async (done: Function) => {
          let result: number = nativeimage.oHNativeWindowDropBufferModeSetTrueNormal2();
          expect(result).assertEqual(0);
          done();
        });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_IMAGE_2700
     * @tc.name       : testNativeWindowDropBufferModeSetAbNormal
     * @tc.desc       : test testNativeWindowDropBufferModeSetAbNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowDropBufferModeSetAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeimage.oHNativeWindowDropBufferModeSetAbNormal();
        expect(result).assertEqual(0);
        done();
      });
  })
}

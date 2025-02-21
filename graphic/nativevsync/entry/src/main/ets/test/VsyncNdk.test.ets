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

import { describe, expect, it } from '@ohos/hypium'
import vsync from 'libvsyncndk.so'

export default function vsyncNdkTest() {
  describe('NativeVsyncNdkTest', () => {

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_NATIVEVSYNC_CREATE_0100
     * @tc.name       : testOHNativeVSyncCreate001
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncCreate001', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_NATIVEVSYNC_CREATE_0200
     * @tc.name       : testOHNativeVSyncCreate002
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncCreate002', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateFOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_NATIVEVSYNC_REQUESTFRAME_0100
     * @tc.name       : testOHNativeVSyncRequestFrame001
     * @tc.desc       : test OH_NativeVSync_RequestFrame
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncRequestFrame001', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrame();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_NATIVEVSYNC_REQUESTFRAME_0200
     * @tc.name       : testOHNativeVSyncRequestFrame002
     * @tc.desc       : test OH_NativeVSync_RequestFrame
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncRequestFrame002', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrameFOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_NATIVEVSYNC_REQUESTFRAME_0300
     * @tc.name       : testOHNativeVSyncRequestFrame003
     * @tc.desc       : test OH_NativeVSync_RequestFrame
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncRequestFrame003', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrameFTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_NATIVEVSYNC_GETPERIOD_0100
     * @tc.name       : testOHNativeVSyncGetPeriod001
     * @tc.desc       : test OH_NativeVSync_GetPeriod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncGetPeriod001', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncGetPeriod();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_NATIVEVSYNC_GETPERIOD_0100
     * @tc.name       : testOHNativeVSyncGetPeriod002
     * @tc.desc       : test OH_NativeVSync_GetPeriod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncGetPeriod002', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncGetPeriodFOne();
      expect(result).assertEqual(0);
      done();
    });


  })
}
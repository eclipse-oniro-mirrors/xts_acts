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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libGraphics2DApi20 from 'libgraphicsApiNdk.so'
export default function ErrorCodeWindowTest() {
  describe('ErrorCodeWindowTest', () => {
    /**
     * @tc.number  : SUB_OH_Drawing_BufferErrorCodeWindow_0100
     * @tc.name    : SUB_OH_Drawing_BufferErrorCodeWindow_0100
     * @tc.desc    : test SUB_OH_Drawing_BufferErrorCodeWindow ok Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_BufferErrorCodeWindow_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_BufferErrorCodeWindow_0100 start====");
          let result: number = libGraphics2DApi20.OHDrawingBufferErrorCodeWindowOK();
          console.info("====>SUB_OH_OHNativeErrorCode_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_BufferErrorCodeWindow_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_OHNativeErrorCodeWindowBuffer_0200
     * @tc.name    : SUB_OH_OHNativeErrorCodeWindowBuffer_0200
     * @tc.desc    : test SUB_OH_OHNativeErrorCodeWindowBuffer invalid Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_OHNativeErrorCodeWindowBuffer_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_OHNativeErrorCodeWindowBuffer_0200 start====");
          let result: number = libGraphics2DApi20.OHNativeErrorCodeWindowBufferInvalid();
          console.info("====>SUB_OH_OHNativeErrorCodeWindowBuffer_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_OHNativeErrorCodeWindowBuffer_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_OHNativeErrorCodeWindowNo_0300
     * @tc.name    : SUB_OH_OHNativeErrorCodeWindowNo_0300
     * @tc.desc    : test SUB_OH_OHNativeErrorCodeWindow return NoBuffer Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_OHNativeErrorCodeWindowNo_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_OHNativeErrorCodeWindowNo_0300 start====");
          let result: number = libGraphics2DApi20.OHNativeErrorCodeWindowNoBuffer();
          console.info("====>SUB_OH_OHNativeErrorCodeWindowNo_0300 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_OHNativeErrorCodeWindowNo_0300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeWindow_ErrCode_0400
     * @tc.name    : SUB_OH_NativeWindow_ErrCode_0400
     * @tc.desc    : test SUB_OH_OHNativeErrorCodeWindow return BUFFER_STATE_INVALID Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeWindow_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeWindow_ErrCode_0400 start====");
          let result: number = libGraphics2DApi20.OHNativeWindow_ErrCodeBUFFER_STATE_INVALID();
          console.info("====>SUB_OH_NativeWindow_ErrCode_0400 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeWindow_ErrCode_0400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_ErrorCodeWindowInvalid_0400
     * @tc.name    : SUB_OH_ErrorCodeWindowInvalid_0400
     * @tc.desc    : test SUB_OH_ErrorCodeWindowInvalid_0400 return BUFFER_STATE_INVALID Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_ErrorCodeWindowInvalid_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_ErrorCodeWindowInvalid_0400 start====");
          let result: number = libGraphics2DApi20.OHErrorCodeWindowInvalid();
          console.info("====>SUB_OH_ErrorCodeWindowInvalid_0400 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_ErrorCodeWindowInvalid_0400 catch err: " + err);
          done();
        }
      })
  })
}

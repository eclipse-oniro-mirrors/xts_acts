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
const OH_DRAWING_SUCCESS = 0;
const OH_DRAWING_ERROR_INVALID_PARAMETER = 401;
export default function BufferTextTest() {
  describe('BufferTextTest', () => {
    /**
     * @tc.number  : SUB_OH_NativeBuffer_GetColorSpace_0100
     * @tc.name    : SUB_OH_NativeBuffer_GetColorSpace_0100
     * @tc.desc    : test SUB_OH_NativeBuffer_GetColorSpace success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeBuffer_GetColorSpace_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeBuffer_GetColorSpace_0100 start====");
          let result: number = libGraphics2DApi20.getColorSpaceSuccess();
          console.info("====>SUB_OH_NativeBuffer_GetColorSpace_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeBuffer_GetColorSpace_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeBuffer_GetColorSpace_0200
     * @tc.name    : SUB_OH_NativeBuffer_GetColorSpace_0200
     * @tc.desc    : test SUB_OH_NativeBuffer_GetColorSpace fail Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeBuffer_GetColorSpace_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeBuffer_GetColorSpace_0200 start====");
          let result: number = libGraphics2DApi20.getColorSpaceFail();
          console.info("====>SUB_OH_NativeBuffer_GetColorSpace_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeBuffer_GetColorSpace_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeBuffer_SetMetadataValue_0100
     * @tc.name    : SUB_OH_NativeBuffer_SetMetadataValue_0100
     * @tc.desc    : test SUB_OH_NativeBuffer_SetMetadataValue success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeBuffer_SetMetadataValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeBuffer_SetMetadataValue_0100 start====");
          let result: number = libGraphics2DApi20.setMetadataValueSuccess();
          console.info("====>SUB_OH_NativeBuffer_SetMetadataValue_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeBuffer_SetMetadataValue_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeBuffer_SetMetadataValue_0200
     * @tc.name    : SUB_OH_NativeBuffer_SetMetadataValue_0200
     * @tc.desc    : test SUB_OH_NativeBuffer_SetMetadataValue fail Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeBuffer_SetMetadataValue_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeBuffer_SetMetadataValue_0200 start====");
          let result: number = libGraphics2DApi20.getColorSpaceFail();
          console.info("====>SUB_OH_NativeBuffer_SetMetadataValue_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeBuffer_SetMetadataValue_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeBuffer_GetMetadataValue_0100
     * @tc.name    : SUB_OH_NativeBuffer_GetMetadataValue_0100
     * @tc.desc    : test SUB_OH_NativeBuffer_GetMetadataValue success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeBuffer_GetMetadataValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeBuffer_GetMetadataValue_0100 start====");
          let result: number = libGraphics2DApi20.getMetadataValueSuccess();
          console.info("====>SUB_OH_NativeBuffer_GetMetadataValue_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeBuffer_GetMetadataValue_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_NativeBuffer_GetMetadataValueFail_0200
     * @tc.name    : SUB_OH_NativeBuffer_GetMetadataValueFail_0200
     * @tc.desc    : test SUB_OH_NativeBuffer_GetMetadataValue fail Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_NativeBuffer_GetMetadataValueFail_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_NativeBuffer_GetMetadataValueFail_0200 start====");
          let result: number = libGraphics2DApi20.getMetadataValueFail();
          console.info("====>SUB_OH_NativeBuffer_GetMetadataValueFail_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_NativeBuffer_GetMetadataValueFail_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_RunBufferGlyphs_0100
     * @tc.name    : SUB_OH_Drawing_RunBufferGlyphs_0100
     * @tc.desc    : test SUB_OH_Drawing_RunBufferGlyphs success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_RunBufferGlyphs_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RunBufferGlyphs_0100 start====");
          let result: number = libGraphics2DApi20.runBufferGlyphsSuccess();
          console.info("====>SUB_OH_Drawing_RunBufferGlyphs_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RunBufferGlyphs_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_RunBufferPos_0100
     * @tc.name    : SUB_OH_Drawing_RunBufferPos_0100
     * @tc.desc    : test SUB_OH_Drawing_RunBufferPos success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_RunBufferPos_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RunBufferPos_0100 start====");
          let result: number = libGraphics2DApi20.runBufferPosSuccess();
          console.info("====>SUB_OH_Drawing_RunBufferPos_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RunBufferPos_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_RunBufferUtf8text_0100
     * @tc.name    : SUB_OH_Drawing_RunBufferUtf8text_0100
     * @tc.desc    : test SUB_OH_Drawing_RunBufferPos success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_RunBufferUtf8text_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RunBufferUtf8text_0100 start====");
          let result: number = libGraphics2DApi20.runBufferUtf8textSuccess();
          console.info("====>SUB_OH_Drawing_RunBufferUtf8text_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RunBufferUtf8text_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_RunBufferClusters_0100
     * @tc.name    : SUB_OH_Drawing_RunBufferClusters_0100
     * @tc.desc    : test SUB_OH_Drawing_RunBufferClusters success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_RunBufferClusters_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RunBufferClusters_0100 start====");
          let result: number = libGraphics2DApi20.runBufferClustersSuccess();
          console.info("====>SUB_OH_Drawing_RunBufferClusters_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RunBufferClusters_0100 catch err: " + err);
          done();
        }
      })
    /**
     * @tc.number  : SUB_OH_Drawing_SystemFontType_0100
     * @tc.name    : SUB_OH_Drawing_SystemFontType_0100
     * @tc.desc    : test SUB_OH_Drawing_SystemFontType success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_SystemFontType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_SystemFontType_0100 start====");
          let result: number = libGraphics2DApi20.systemFontTypeSuccess();
          console.info("====>SUB_OH_Drawing_SystemFontType_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_SystemFontType_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_TextUndefinedGlyphDisplayDEFAULT_0100
     * @tc.name    : SUB_OH_Drawing_TextUndefinedGlyphDisplayDEFAULT_0100
     * @tc.desc    : test SUB_OH_Drawing_TextUndefinedGlyphDisplayDEFAULT success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_TextUndefinedGlyphDisplayDEFAULT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_TextUndefinedGlyphDisplayDEFAULT_0100 start====");
          let result: number = libGraphics2DApi20.textUndefinedGlyphDisplayDEFAULT();
          console.info("====>SUB_OH_Drawing_TextUndefinedGlyphDisplayDEFAULT_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_TextUndefinedGlyphDisplayDEFAULT_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_TextUndefinedGlyphDisplayTOFU_0100
     * @tc.name    : SUB_OH_Drawing_TextUndefinedGlyphDisplayTOFU_0100
     * @tc.desc    : test SUB_OH_Drawing_TextUndefinedGlyphDisplayTOFU success Scene
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_TextUndefinedGlyphDisplayTOFU_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_TextUndefinedGlyphDisplayTOFU_0100 start====");
          let result: number = libGraphics2DApi20.textUndefinedGlyphDisplayTOFU();
          console.info("====>SUB_OH_Drawing_TextUndefinedGlyphDisplayTOFU_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_TextUndefinedGlyphDisplayTOFU_0100 catch err: " + err);
          done();
        }
      })
  })
}

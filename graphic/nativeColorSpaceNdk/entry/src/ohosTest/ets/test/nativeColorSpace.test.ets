/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import nativeColorSpaceNdk from 'libcolorSpaceNdk.so';

export default function nativeColorSpaceTest() {
  describe('NativeColorSpaceTest', () => {
    /**
     * @tc.name   testOHCreateColorSpaceFromName
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_CreateColorSpaceFromName
     * @tc.desc   test OH_Create_Color_Space_From_Name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCreateColorSpaceFromName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHCreateColorSpaceFromName();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHCreateFromPrimariesAndGamma
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_CreateFromPrimariesAndGamma
     * @tc.desc   test OH_Create_From_Primaries_And_Gamma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCreateFromPrimariesAndGamma', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHCreateFromPrimariesAndGamma();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDestroy
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_Destroy
     * @tc.desc   test OH_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDestroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHDestroy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHGetColorSpaceName
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_GetColorSpaceName
     * @tc.desc   test OH_GetColorSpaceName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHGetColorSpaceName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHGetColorSpaceName();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHGetColorSpaceName001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_GetColorSpaceName001
     * @tc.desc   test OH_GetColorSpaceName001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHGetColorSpaceName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHGetColorSpaceName001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHGetWhitePoint
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_GetWhitePoint
     * @tc.desc   test OH_Get_White_Point
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHGetWhitePoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHGetWhitePoint();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHGetWhitePoint001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_GetWhitePoint001
     * @tc.desc   test OH_Get_White_Point001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHGetWhitePoint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHGetWhitePoint001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHGetGamma
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_GetGamma
     * @tc.desc   test OH_Get_Gamma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHGetGamma', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHGetGamma();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHGetGamma001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_GetGamma001
     * @tc.desc   test OH_Get_Gamma001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHGetGamma001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHGetGamma001();
      expect(result).assertEqual(0);
      done();
    });
  })
}
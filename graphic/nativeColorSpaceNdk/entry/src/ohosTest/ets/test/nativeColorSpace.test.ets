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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import nativeColorSpaceNdk from 'libcolorSpaceNdk.so';

export default function nativeColorSpaceTest() {
  describe('NativeColorSpaceTest', () => {
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_CreateColorSpaceFromName
     * @tc.name       : testOHCreateColorSpaceFromName
     * @tc.desc       : test OH_Create_Color_Space_From_Name
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHCreateColorSpaceFromName', 0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHCreateColorSpaceFromName();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_CreateFromPrimariesAndGamma
     * @tc.name       : testOHCreateFromPrimariesAndGamma
     * @tc.desc       : test OH_Create_From_Primaries_And_Gamma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHCreateFromPrimariesAndGamma', 0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHCreateFromPrimariesAndGamma();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_Destroy
     * @tc.name       : testOHDestroy
     * @tc.desc       : test OH_Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDestroy', 0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHDestroy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_GetColorSpaceName
     * @tc.name       : testOHGetColorSpaceName
     * @tc.desc       : test OH_GetColorSpaceName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetColorSpaceName', 0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHGetColorSpaceName();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_GetColorSpaceName001
     * @tc.name       : testOHGetColorSpaceName001
     * @tc.desc       : test OH_GetColorSpaceName001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetColorSpaceName001', 0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHGetColorSpaceName001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_GetWhitePoint
     * @tc.name       : testOHGetWhitePoint
     * @tc.desc       : test OH_Get_White_Point
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetWhitePoint', 0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHGetWhitePoint();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_GetWhitePoint001
     * @tc.name       : testOHGetWhitePoint001
     * @tc.desc       : test OH_Get_White_Point001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetWhitePoint001', 0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHGetWhitePoint001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_GetGamma
     * @tc.name       : testOHGetGamma
     * @tc.desc       : test OH_Get_Gamma
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetGamma', 0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHGetGamma();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_COLOR_SPACE_OH_GetGamma001
     * @tc.name       : testOHGetGamma001
     * @tc.desc       : test OH_Get_Gamma001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetGamma001', 0, async (done: Function) => {
      let result: number = nativeColorSpaceNdk.oHGetGamma001();
      expect(result).assertEqual(0);
      done();
    });
  })
}
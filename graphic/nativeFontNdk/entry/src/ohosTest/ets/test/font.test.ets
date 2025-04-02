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
import nativeFontNdk from 'libnativeFontNdk.so';

export default function fontTest() {
  describe('FontTest', () => {
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontDescriptorByFullName_001
     * @tc.name       : testOHDrawingGetFontDescriptorByFullName001
     * @tc.desc       : test OH_Drawing_GetFontDescriptorByFullName_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetFontDescriptorByFullName001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetFontDescriptorByFullName001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontDescriptorByFullName_002
     * @tc.name       : testOHDrawingGetFontDescriptorByFullName002
     * @tc.desc       : test OH_Drawing_GetFontDescriptorByFullName_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetFontDescriptorByFullName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetFontDescriptorByFullName002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontDescriptorByFullName_003
     * @tc.name       : testOHDrawingGetFontDescriptorByFullName003
     * @tc.desc       : test OH_Drawing_GetFontDescriptorByFullName_003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetFontDescriptorByFullName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingGetFontDescriptorByFullName003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontDescriptorByFullName_004
     * @tc.name       : testOHDrawingGetFontDescriptorByFullName004
     * @tc.desc       : test OH_Drawing_GetFontDescriptorByFullName_004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetFontDescriptorByFullName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingGetFontDescriptorByFullName004();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNamesByType_001
     * @tc.name       : testOHDrawingGetSystemFontFullNamesByType001
     * @tc.desc       : test OH_Drawing_GetSystemFontFullNamesByType_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetSystemFontFullNamesByType001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetSystemFontFullNamesByType001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNamesByType_002
     * @tc.name       : testOHDrawingGetSystemFontFullNamesByType002
     * @tc.desc       : test OH_Drawing_GetSystemFontFullNamesByType_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetSystemFontFullNamesByType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingGetSystemFontFullNamesByType002();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNameByIndex_001
     * @tc.name       : testOHDrawingGetSystemFontFullNameByIndex001
     * @tc.desc       : test OH_Drawing_GetSystemFontFullNameByIndex_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetSystemFontFullNameByIndex001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetSystemFontFullNameByIndex001();
      expect(result).assertEqual(0);
      done();
    });  

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetDrawingArraySize_001
     * @tc.name       : testOHDrawingGetDrawingArraySize001
     * @tc.desc       : test OH_Drawing_GetDrawingArraySize_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetDrawingArraySize001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetDrawingArraySize001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontCollectionGlobalInstance_001
     * @tc.name       : testOHDrawingGetFontCollectionGlobalInstance001
     * @tc.desc       : test OH_Drawing_GetFontCollectionGlobalInstance_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetFontCollectionGlobalInstance001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetFontCollectionGlobalInstance001();
      expect(result).assertEqual(0);
      done();
    });
  })
}
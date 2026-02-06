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

export default function RectFontTest() {
  describe('RectFontTest', () => {
    /**
     * @tc.name   SUB_OH_Drawing_RectGetArraySize_0100
     * @tc.number SUB_OH_Drawing_RectGetArraySize_0100,
     * @tc.desc   test SUB_OH_Drawing_RectGetArraySize success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RectGetArraySize_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RectGetArraySize_0100 start====");
          let result: number = libGraphics2DApi20.rectGetArraySizeSuccess();
          console.info("====>SUB_OH_Drawing_RectGetArraySize_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RectGetArraySize_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_RectGetArraySize_0200
     * @tc.number SUB_OH_Drawing_RectGetArraySize_0200,
     * @tc.desc   test SUB_OH_Drawing_RectGetArraySize fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RectGetArraySize_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RectGetArraySize_0200 start====");
          let result: number = libGraphics2DApi20.rectGetArraySizeFail();
          console.info("====>SUB_OH_Drawing_RectGetArraySize_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RectGetArraySize_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_RectGetArrayElement_0100
     * @tc.number SUB_OH_Drawing_RectGetArrayElement_0100,
     * @tc.desc   test SUB_OH_Drawing_RectGetArrayElement success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RectGetArrayElement_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RectGetArrayElement_0100 start====");
          let result: number = libGraphics2DApi20.rectGetArrayElementSuccess();
          console.info("====>SUB_OH_Drawing_RectGetArrayElement_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RectGetArrayElement_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_RectGetArrayElement_0200
     * @tc.number SUB_OH_Drawing_RectGetArrayElement_0200
     * @tc.desc   test SUB_OH_Drawing_RectGetArrayElement success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RectGetArrayElement_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RectGetArrayElement_0200 start====");
          let result: number = libGraphics2DApi20.rectGetArrayElementFail();
          console.info("====>SUB_OH_Drawing_RectGetArrayElement_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RectGetArrayElement_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_RectDestroyArray_0100
     * @tc.number SUB_OH_Drawing_RectDestroyArray_0100,
     * @tc.desc   test SUB_OH_Drawing_RectDestroyArray success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RectDestroyArray_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RectDestroyArray_0100 start====");
          let result: number = libGraphics2DApi20.rectDestroyArraySuccess();
          console.info("====>SUB_OH_Drawing_RectDestroyArray_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RectDestroyArray_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_RectDestroyArray_0200
     * @tc.number SUB_OH_Drawing_RectDestroyArray_0200,
     * @tc.desc   test SUB_OH_Drawing_RectDestroyArray fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RectDestroyArray_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RectDestroyArray_0200 start====");
          let result: number = libGraphics2DApi20.rectDestroyArrayFail();
          console.info("====>SUB_OH_Drawing_RectDestroyArray_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RectDestroyArray_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_RoundRectOffset_0100
     * @tc.number SUB_OH_Drawing_RoundRectOffset_0100
     * @tc.desc   test SUB_OH_Drawing_RoundRectOffset_0200 success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RoundRectOffset_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_RoundRectOffset_0100 start====");
          let result: number = libGraphics2DApi20.roundRectOffsetSuccess();
          console.info("====> SUB_OH_Drawing_RoundRectOffset_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_RoundRectOffset_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_RoundRectOffset_0200
     * @tc.number SUB_OH_Drawing_RoundRectOffset_0200
     * @tc.desc   test SUB_OH_Drawing_RoundRectOffset_0200 success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RoundRectOffset_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_RoundRectOffset_0200 start====");
          let result: number = libGraphics2DApi20.roundRectOffsetFail();
          console.info("====> SUB_OH_Drawing_RoundRectOffset_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_RoundRectOffset_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures_0100
     * @tc.number SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures_0100
     * @tc.desc   test SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures_0100 start====");
          let result: number = libGraphics2DApi20.fontMeasureSingleCharacterWithFeaturesSuccess();
          console.info("====> SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures_0200
     * @tc.number SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures_0200
     * @tc.desc   test SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures_0200 start====");
          let result: number = libGraphics2DApi20.fontMeasureSingleCharacterWithFeaturesFail();
          console.info("====> SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontMeasureSingleCharacterWithFeatures_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontMeasureText_0100
     * @tc.number SUB_OH_Drawing_FontMeasureText_0100
     * @tc.desc   test SUB_OH_Drawing_FontMeasureText success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontMeasureText_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontMeasureText_0100 start====");
          let result: number = libGraphics2DApi20.fontMeasureTextSuccess();
          console.info("====> SUB_OH_Drawing_FontMeasureText_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontMeasureText_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontMeasureText_0200
     * @tc.number SUB_OH_Drawing_FontMeasureText_0200
     * @tc.desc   test SUB_OH_Drawing_FontMeasureText fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontMeasureText_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontMeasureText_0200 start====");
          let result: number = libGraphics2DApi20.fontMeasureTextFail();
          console.info("====> SUB_OH_Drawing_FontMeasureText_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontMeasureText_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontMeasureTextWithBrushOrPen_0200
     * @tc.number SUB_OH_Drawing_FontMeasureTextWithBrushOrPen_0200
     * @tc.desc   test SUB_OH_Drawing_FontMeasureTextWithBrushOrPen fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontMeasureTextWithBrushOrPen_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontMeasureTextWithBrushOrPen_0200 start====");
          let result: number = libGraphics2DApi20.fontMeasureTextWithBrushOrPenFail();
          console.info("====> SUB_OH_Drawing_FontMeasureTextWithBrushOrPen_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontMeasureTextWithBrushOrPen_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontGetWidthsBounds_0200
     * @tc.number SUB_OH_Drawing_FontGetWidthsBounds_0200
     * @tc.desc   test SUB_OH_Drawing_FontGetWidthsBounds success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontGetWidthsBounds_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontGetWidthsBounds_0200 start====");
          let result: number = libGraphics2DApi20.fontGetWidthsBoundsFail();
          console.info("====> SUB_OH_Drawing_FontGetWidthsBounds_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontGetWidthsBounds_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontGetPos_0100
     * @tc.number SUB_OH_Drawing_FontGetPos_0100
     * @tc.desc   test SUB_OH_Drawing_FontGetPos success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontGetPos_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontGetPos_0100 start====");
          let result: number = libGraphics2DApi20.fontGetPosSuccess();
          console.info("====> SUB_OH_Drawing_FontGetPos_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontGetPos_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontGetPos_0200
     * @tc.number SUB_OH_Drawing_FontGetPos_0200
     * @tc.desc   test SUB_OH_Drawing_FontGetPos fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontGetPos_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontGetPos_0200 start====");
          let result: number = libGraphics2DApi20.fontGetPosFail();
          console.info("====> SUB_OH_Drawing_FontGetPos_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontGetPos_0200 catch err: " + err);
          done();
        }
      })
    /**
     * @tc.name   SUB_OH_Drawing_FontGetBounds_0100
     * @tc.number SUB_OH_Drawing_FontGetBounds_0100
     * @tc.desc   test SUB_OH_Drawing_FontGetSpacing fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontGetBounds_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontGetBounds_0100 start====");
          let result: number = libGraphics2DApi20.fontGetBoundsFail();
          console.info("====> SUB_OH_Drawing_FontGetBounds_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontGetBounds_0100 catch err: " + err);
          done();
        }
      })
    /**
     * @tc.name   SUB_OH_Drawing_FontGetSpacing_0100
     * @tc.number SUB_OH_Drawing_FontGetSpacing_0100
     * @tc.desc   test SUB_OH_Drawing_FontGetSpacing success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontGetSpacing_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontGetSpacing_0100 start====");
          let result: number = libGraphics2DApi20.fontGetSpacingSuccess();
          console.info("====> SUB_OH_Drawing_FontGetSpacing_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontGetSpacing_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontGetSpacing_0200
     * @tc.number SUB_OH_Drawing_FontGetSpacing_0200
     * @tc.desc   test SUB_OH_Drawing_FontGetSpacing fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontGetSpacing_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontGetSpacing_0200 start====");
          let result: number = libGraphics2DApi20.fontGetSpacingFail();
          console.info("====> SUB_OH_Drawing_FontGetSpacing_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontGetSpacing_0200 catch err: " + err);
          done();
        }
      })


    /**
     * @tc.name   SUB_OH_Drawing_FontGetPathForGlyph_0100
     * @tc.number SUB_OH_Drawing_FontGetPathForGlyph_0100
     * @tc.desc   test SUB_OH_Drawing_FontGetPathForGlyph success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontGetPathForGlyph_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontGetPathForGlyph_0100 start====");
          let result: number = libGraphics2DApi20.fontGetPathForGlyphSuccess();
          console.info("====> SUB_OH_Drawing_FontGetPathForGlyph_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontGetPathForGlyph_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontGetPathForGlyph_0200
     * @tc.number SUB_OH_Drawing_FontGetPathForGlyph_0200
     * @tc.desc   test SUB_OH_Drawing_FontGetPathForGlyph fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontGetPathForGlyph_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontGetPathForGlyph_0200 start====");
          let result: number = libGraphics2DApi20.fontGetPathForGlyphFail();
          console.info("====> SUB_OH_Drawing_FontGetPathForGlyph_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontGetPathForGlyph_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontGetTextPath_0100
     * @tc.number SUB_OH_Drawing_FontGetTextPath_0100
     * @tc.desc   test SUB_OH_Drawing_FontGetTextPath success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontGetTextPath_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontGetTextPath_0100 start====");
          let result: number = libGraphics2DApi20.fontGetTextPathSuccess();
          console.info("====> SUB_OH_Drawing_FontGetTextPath_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontGetTextPath_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontGetTextPath_0200
     * @tc.number SUB_OH_Drawing_FontGetTextPath_0200
     * @tc.desc   test SUB_OH_Drawing_FontGetTextPath fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontGetTextPath_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontGetTextPath_0200 start====");
          let result: number = libGraphics2DApi20.fontGetTextPathFail();
          console.info("====> SUB_OH_Drawing_FontGetTextPath_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontGetTextPath_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontFeaturesCreate_0100
     * @tc.number SUB_OH_Drawing_FontFeaturesCreate_0100
     * @tc.desc   test SUB_OH_Drawing_FontFeaturesCreate success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontFeaturesCreate_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontFeaturesCreate_0100 start====");
          let result: number = libGraphics2DApi20.fontFeaturesCreateSuccess();
          console.info("====> SUB_OH_Drawing_FontFeaturesCreate_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontFeaturesCreate_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontFeaturesAddFeature_0100
     * @tc.number SUB_OH_Drawing_FontFeaturesAddFeature_0100
     * @tc.desc   test SUB_OH_Drawing_FontFeaturesAddFeature success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontFeaturesAddFeature_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontFeaturesAddFeature_0100 start====");
          let result: number = libGraphics2DApi20.fontFeaturesAddFeatureSuccess();
          console.info("====> SUB_OH_Drawing_FontFeaturesAddFeature_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontFeaturesAddFeature_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontFeaturesAddFeature_0200
     * @tc.number SUB_OH_Drawing_FontFeaturesAddFeature_0200
     * @tc.desc   test SUB_OH_Drawing_FontFeaturesAddFeature fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontFeaturesAddFeature_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontFeaturesAddFeature_0200 start====");
          let result: number = libGraphics2DApi20.fontFeaturesAddFeatureFail();
          console.info("====> SUB_OH_Drawing_FontFeaturesAddFeature_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontFeaturesAddFeature_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontFeaturesDestroy_0100
     * @tc.number SUB_OH_Drawing_FontFeaturesDestroy_0100
     * @tc.desc   test SUB_OH_Drawing_FontFeaturesDestroy success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontFeaturesDestroy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontFeaturesDestroy_0100 start====");
          let result: number = libGraphics2DApi20.fontFeaturesDestroySuccess();
          console.info("====> SUB_OH_Drawing_FontFeaturesDestroy_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontFeaturesDestroy_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_FontFeaturesDestroy_0200
     * @tc.number SUB_OH_Drawing_FontFeaturesDestroy_0200
     * @tc.desc   test SUB_OH_Drawing_FontFeaturesDestroy fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_FontFeaturesDestroy_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_Drawing_FontFeaturesDestroy_0200 start====");
          let result: number = libGraphics2DApi20.fontFeaturesDestroyFail();
          console.info("====> SUB_OH_Drawing_FontFeaturesDestroy_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====> SUB_OH_Drawing_FontFeaturesDestroy_0200 catch err: " + err);
          done();
        }
      })

  })
}

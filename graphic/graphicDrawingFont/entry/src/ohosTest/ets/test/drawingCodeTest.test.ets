/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import drawing from "@ohos.graphics.drawing"
import common2D from '@ohos.graphics.common2D';
import image from "@ohos.multimedia.image";

export default function drawingCodeTest() {
  describe('drawingCodeTest', () => {
    console.info('describe drawingCodeTest start!!!');
    beforeAll(() => {
      console.info('before all');
    })
    beforeEach(() => {
      console.info('before each');
    })
    afterEach(async (done: Function) => {
      console.info('afterEach');
      done();
    })
    afterAll(() => {
      console.info('afterAll');
    })
    /**
     * @tc.name   PathMoveTo
     * @tc.number SUB_GRAPHIC_DrawingCode_PathMoveTo
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PathMoveTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('test PathMoveTo begin');
      try {
        let path = new drawing.Path();
        path.moveTo(null, 10);
        console.log('test enum value of PathMoveTo Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PathMoveTo Manager error ' + err.code);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   PathLineTo
     * @tc.number SUB_GRAPHIC_DrawingCode_PathLineTo
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PathLineTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.lineTo(null, 15);
        console.log('test enum value of PathLineTo Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PathLineTo Manager error ' + err.code);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   PathArcTo
     * @tc.number SUB_GRAPHIC_DrawingCode_PathArcTo
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PathArcTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.arcTo(null, 15, 10, 10, 10, 10);
        console.log('test enum value of PathArcTo Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PathArcTo Manager error ' + err.code);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   PathQuadTo
     * @tc.number SUB_GRAPHIC_DrawingCode_PathQuadTo
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PathQuadTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.quadTo(null, 15, 10, 10);
        console.log('test enum value of PathQuadTo Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PathQuadTo Manager error ' + err.code);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   PathCubicTo
     * @tc.number SUB_GRAPHIC_DrawingCode_PathCubicTo
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PathCubicTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(null, 10, 10, 10, 15, 15);
        console.log('test enum value of PathCubicTo Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PathCubicTo Manager error' + err.code);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   FontEnableSubpixel
     * @tc.number SUB_GRAPHIC_DrawingCode_FontEnableSubpixel
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontEnableSubpixel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let font = new drawing.Font();
        font.enableSubpixel(null);
        console.log('test enum value of FontEnableSubpixel Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of FontEnableSubpixel Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of FontEnableSubpixel Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   FontEnableEmbolden
     * @tc.number SUB_GRAPHIC_DrawingCode_FontEnableEmbolden
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontEnableEmbolden', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let font = new drawing.Font();
        font.enableEmbolden(null);
        console.log('test enum value of FontEnableEmbolden Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of FontEnableEmbolden Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of FontEnableEmbolden Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   FontEnableLinearMetrics
     * @tc.number SUB_GRAPHIC_DrawingCode_FontEnableLinearMetrics
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontEnableLinearMetrics', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let font = new drawing.Font();
        font.enableLinearMetrics(null);
        console.log('test enum value of FontEnableLinearMetrics Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of FontEnableLinearMetrics Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of FontEnableLinearMetrics Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   FontSetSize
     * @tc.number SUB_GRAPHIC_DrawingCode_FontSetSize
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontSetSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let font = new drawing.Font();
        font.setSize(null);
        console.log('test enum value of FontSetSize Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of FontSetSize Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of FontSetSize Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   FontSetTypeface
     * @tc.number SUB_GRAPHIC_DrawingCode_FontSetTypeface
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontSetTypeface', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let font = new drawing.Font();
        font.setTypeface(null);
        console.log('test enum value of FontSetTypeface Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of FontSetTypeface Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of FontSetTypeface Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   ColorFilterCreateBlendModeColorFilter
     * @tc.number SUB_GRAPHIC_DrawingCode_ColorFilterCreateBlendModeColorFilter
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ColorFilterCreateBlendModeColorFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      try {
        const color : common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter(null, drawing.BlendMode.SRC);
        console.log('test enum value of ColorFilterCreateBlendModeColorFilter Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of ColorFilterCreateBlendModeColorFilter Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of ColorFilterCreateBlendModeColorFilter Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   ColorFilterCreateComposeColorFilter
     * @tc.number SUB_GRAPHIC_DrawingCode_ColorFilterCreateComposeColorFilter
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ColorFilterCreateComposeColorFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      try {
        const color : common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
        let colorFilter1 = drawing.ColorFilter.createBlendModeColorFilter(color, drawing.BlendMode.SRC);
        let colorFilter2 = drawing.ColorFilter.createBlendModeColorFilter(color, drawing.BlendMode.DST);
        let colorFilter = drawing.ColorFilter.createComposeColorFilter(null, null);
        console.log('test enum value of ColorFilterCreateComposeColorFilter Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of ColorFilterCreateComposeColorFilter Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of ColorFilterCreateComposeColorFilter Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   PenSetColor
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetColor
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PenSetColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setColor(null, 255, 0, 0);
        console.log('test enum value of PenSetColor Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetColor Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of PenSetColor Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   PenSetStrokeWidth
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetStrokeWidth
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PenSetStrokeWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(null);
        console.log('test enum value of PenSetStrokeWidth Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetStrokeWidth Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of PenSetStrokeWidth Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   PenSetStrokeWidth
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetStrokeWidth
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PenSetStrokeWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(null);
        console.log('test enum value of PenSetStrokeWidth Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetStrokeWidth Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of PenSetStrokeWidth Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   PenSetAntiAlias
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetAntiAlias
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PenSetAntiAlias', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setAntiAlias(null);
        console.log('test enum value of PenSetAntiAlias Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetAntiAlias Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of PenSetAntiAlias Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   PenSetBlendMode
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetBlendMode
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PenSetBlendMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setBlendMode(null);
        console.log('test enum value of PenSetBlendMode Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetBlendMode Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of PenSetBlendMode Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   PenSetJoinStyle
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetJoinStyle
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PenSetJoinStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        pen.setJoinStyle(null);
        console.log('test enum value of PenSetJoinStyle Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetJoinStyle Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of PenSetJoinStyle Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   PenSetCapStyle
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetCapStyle
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PenSetCapStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        pen.setCapStyle(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetCapStyle Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of PenSetCapStyle Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   PenSetDither
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetDither
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PenSetDither', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setDither(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetDither Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of PenSetDither Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   BrushSetColor
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetColor
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BrushSetColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        brush.setColor(null, 255, 0, 0);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetColor Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of BrushSetColor Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   BrushSetAntiAlias
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetAntiAlias
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BrushSetAntiAlias', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        brush.setAntiAlias(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetAntiAlias Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of BrushSetAntiAlias Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   BrushSetAlpha
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetAlpha
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BrushSetAlpha', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        brush.setAlpha(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetAlpha Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of BrushSetAlpha Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   BrushSetColorFilter
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetColorFilter
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BrushSetColorFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        let colorFilter = drawing.ColorFilter.createLinearToSRGBGamma();
        brush.setColorFilter(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetColorFilter Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of BrushSetColorFilter Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   BrushSetMaskFilter
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetMaskFilter
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BrushSetMaskFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10);
        brush.setMaskFilter(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetMaskFilter Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of BrushSetMaskFilter Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   BrushSetShadowLayer
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetShadowLayer
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BrushSetShadowLayer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        brush.setShadowLayer(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetShadowLayer Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of BrushSetShadowLayer Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   BrushSetShadowLayer
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetShadowLayer
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BrushSetShadowLayer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        brush.setShadowLayer(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetShadowLayer Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of BrushSetShadowLayer Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   BrushSetBlendMode
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetBlendMode
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BrushSetBlendMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        brush.setBlendMode(null);
        done()
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetBlendMode Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of BrushSetBlendMode Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   RegionIsPointContained
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionIsPointContained
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegionIsPointContained', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        let flag: boolean = false;
        flag = region.isPointContained(null,200);
        done()
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of RegionIsPointContained Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of RegionIsPointContained Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   RegionIsRegionContained
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionIsRegionContained
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegionIsRegionContained', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        let flag: boolean = false;
        flag = region.isRegionContained(null)
        done()
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of RegionIsRegionContained Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of RegionIsRegionContained Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   RegionOp
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionOp
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegionOp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = false;
        flag = region.op(null,null);
        done()
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of RegionOp Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of RegionOp Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   RegionQuickReject
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionQuickReject
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegionQuickReject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        let flag: boolean = false;
        flag = region.quickReject(null, 50, 70, 70);
        done()
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of RegionQuickReject Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of RegionQuickReject Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   RegionSetPath
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionSetPath
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegionSetPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let region = new drawing.Region();
        let path = new drawing.Path();
        region.setRect(100, 100, 400, 400);
        path.arcTo(50, 50, 300, 300, 0, 359);
        let flag: boolean = false;
        flag = region.setPath(null,region);
        done()
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of RegionSetPath Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of RegionSetPath Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   RegionSetPathTwo
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionSetPathTwo
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegionSetPathTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let region = new drawing.Region();
        let path = new drawing.Path();
        region.setRect(100, 100, 400, 400);
        path.arcTo(50, 50, 300, 300, 0, 359);
        let flag: boolean = false;
        flag = region.setPath(null,region);
        done()
      } catch (err) {
        if (err.code == 401) {
          console.log('RegionSetPathTwo test enum value of RegionSetPath Manager error' + err.code);
          done();
        } else {
          console.log('RegionSetPathTwo test enum value of RegionSetPath Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   RegionSetRect
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionSetRect
     * @tc.desc   test the drawing of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegionSetRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let region = new drawing.Region();
        let flag: boolean = false;
        flag = region.setRect(null, 50, 300, 300);
        done()
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of RegionSetRect Manager error' + err.code);
          done();
        } else {
          console.log('test enum value of RegionSetRect Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
  })
}
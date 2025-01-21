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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import drawing from "@ohos.graphics.drawing"
import common2D from '@ohos.graphics.common2D';
export default function drawingCodeTest(context, windowStage, abilityStorage) {
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
     * @tc.number SUB_GRAPHIC_DrawingCode_PathMoveTo
     * @tc.name Test PathMoveTo
     * @tc.desc test the drawing of create
     */
    it('PathMoveTo', 0, async (done: Function) => {
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
          expect(true).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PathLineTo
     * @tc.name Test PathLineTo
     * @tc.desc test the drawing of create
     */
    it('PathLineTo', 0, async (done: Function) => {
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
          expect(true).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PathArcTo
     * @tc.name Test PathArcTo
     * @tc.desc test the drawing of create
     */
    it('PathArcTo', 0, async (done: Function) => {
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
          expect(true).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PathQuadTo
     * @tc.name Test PathQuadTo
     * @tc.desc test the drawing of create
     */
    it('PathQuadTo', 0, async (done: Function) => {
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
          expect(true).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PathCubicTo
     * @tc.name Test PathCubicTo
     * @tc.desc test the drawing of create
     */
    it('PathCubicTo', 0, async (done: Function) => {
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
          expect(true).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_CanvasConstruct
     * @tc.name Test CanvasConstruct
     * @tc.desc test the drawing of create
     */
    it('CanvasConstruct', 0, async (done: Function) => {
      try {
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: 3,
          size: {
            height: 4,
            width: 6
          }
        }
        console.log('test enum value of CanvasConstruct Manager success1');
        const canvas = new drawing.Canvas(null);
        console.log('test enum value of CanvasConstruct Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of CanvasConstruct Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of CanvasConstruct Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_FontEnableSubpixel
     * @tc.name Test FontEnableSubpixel
     * @tc.desc test the drawing of create
     */
    it('FontEnableSubpixel', 0, async (done: Function) => {
      try {
        let font = new drawing.Font();
        font.enableSubpixel(null);
        console.log('test enum value of FontEnableSubpixel Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of FontEnableSubpixel Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of FontEnableSubpixel Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_FontEnableEmbolden
     * @tc.name Test FontEnableEmbolden
     * @tc.desc test the drawing of create
     */
    it('FontEnableEmbolden', 0, async (done: Function) => {
      try {
        let font = new drawing.Font();
        font.enableEmbolden(null);
        console.log('test enum value of FontEnableEmbolden Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of FontEnableEmbolden Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of FontEnableEmbolden Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_FontEnableLinearMetrics
     * @tc.name Test FontEnableLinearMetrics
     * @tc.desc test the drawing of create
     */
    it('FontEnableLinearMetrics', 0, async (done: Function) => {
      try {
        let font = new drawing.Font();
        font.enableLinearMetrics(null);
        console.log('test enum value of FontEnableLinearMetrics Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of FontEnableLinearMetrics Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of FontEnableLinearMetrics Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_FontSetSize
     * @tc.name Test FontSetSize
     * @tc.desc test the drawing of create
     */
    it('FontSetSize', 0, async (done: Function) => {
      try {
        let font = new drawing.Font();
        font.setSize(null);
        console.log('test enum value of FontSetSize Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of FontSetSize Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of FontSetSize Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_FontSetTypeface
     * @tc.name Test FontSetTypeface
     * @tc.desc test the drawing of create
     */
    it('FontSetTypeface', 0, async (done: Function) => {
      try {
        let font = new drawing.Font();
        font.setTypeface(null);
        console.log('test enum value of FontSetTypeface Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of FontSetTypeface Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of FontSetTypeface Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_FontMeasureText
     * @tc.name Test FontMeasureText
     * @tc.desc test the drawing of create
     */
    it('FontMeasureText', 0, async (done: Function) => {
      try {
        let font = new drawing.Font();
        font.measureText();
        console.log('test enum value of FontMeasureText Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of FontMeasureText Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of FontMeasureText Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_ColorFilterCreateBlendModeColorFilter
     * @tc.name Test ColorFilterCreateBlendModeColorFilter
     * @tc.desc test the drawing of create
     */
    it('ColorFilterCreateBlendModeColorFilter', 0, async (done: Function) => {
      try {
        const color : common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter(null, drawing.BlendMode.SRC);
        console.log('test enum value of ColorFilterCreateBlendModeColorFilter Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of ColorFilterCreateBlendModeColorFilter Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of ColorFilterCreateBlendModeColorFilter Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_ColorFilterCreateComposeColorFilter
     * @tc.name Test ColorFilterCreateComposeColorFilter
     * @tc.desc test the drawing of create
     */
    it('ColorFilterCreateComposeColorFilter', 0, async (done: Function) => {
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
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of ColorFilterCreateComposeColorFilter Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetColor
     * @tc.name Test PenSetColor
     * @tc.desc test the drawing of create
     */
    it('PenSetColor', 0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setColor(null, 255, 0, 0);
        console.log('test enum value of PenSetColor Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetColor Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of PenSetColor Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetStrokeWidth
     * @tc.name Test PenSetStrokeWidth
     * @tc.desc test the drawing of create
     */
    it('PenSetStrokeWidth', 0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(null);
        console.log('test enum value of PenSetStrokeWidth Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetStrokeWidth Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of PenSetStrokeWidth Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetStrokeWidth
     * @tc.name Test PenSetStrokeWidth
     * @tc.desc test the drawing of create
     */
    it('PenSetStrokeWidth', 0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(null);
        console.log('test enum value of PenSetStrokeWidth Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetStrokeWidth Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of PenSetStrokeWidth Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetAntiAlias
     * @tc.name Test PenSetAntiAlias
     * @tc.desc test the drawing of create
     */
    it('PenSetAntiAlias', 0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setAntiAlias(null);
        console.log('test enum value of PenSetAntiAlias Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetAntiAlias Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of PenSetAntiAlias Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetAlpha
     * @tc.name Test PenSetAlpha
     * @tc.desc test the drawing of create
     */
    it('PenSetAlpha', 0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setAlpha();
        console.log('test enum value of PenSetAlpha Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetAlpha Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of PenSetAlpha Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetColorFilter
     * @tc.name Test PenSetColorFilter
     * @tc.desc test the drawing of create
     */
    it('PenSetColorFilter', 0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        let colorFilter = drawing.ColorFilter.createLinearToSRGBGamma();
        pen.setColorFilter(null,null);
        console.log('test enum value of PenSetColorFilter Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetColorFilter Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of PenSetColorFilter Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetMaskFilter
     * @tc.name Test PenSetMaskFilter
     * @tc.desc test the drawing of create
     */
    it('PenSetMaskFilter', 0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10);
        pen.setMaskFilter();
        console.log('test enum value of PenSetMaskFilter Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetMaskFilter Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of PenSetMaskFilter Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetPathEffect
     * @tc.name Test PenSetPathEffect
     * @tc.desc test the drawing of create
     */
    it('PenSetPathEffect', 0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let pathEffect = drawing.PathEffect.createDashPathEffect([30, 10], 0);
        pen.setPathEffect();
        console.log('test enum value of PenSetPathEffect Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetPathEffect Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of PenSetPathEffect Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetShadowLayer
     * @tc.name Test PenSetShadowLayer
     * @tc.desc test the drawing of create
     */
    it('PenSetShadowLayer', 0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        let color : common2D.Color = {alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00};
        let shadowLayer = drawing.ShadowLayer.create(3, -3, 3, color);
        pen.setShadowLayer();
        console.log('test enum value of PenSetShadowLayer Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetShadowLayer Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of PenSetShadowLayer Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetBlendMode
     * @tc.name Test PenSetBlendMode
     * @tc.desc test the drawing of create
     */
    it('PenSetBlendMode', 0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setBlendMode(null);
        console.log('test enum value of PenSetBlendMode Manager success');
        expect().assertFail();
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetBlendMode Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of PenSetBlendMode Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetJoinStyle
     * @tc.name Test PenSetJoinStyle
     * @tc.desc test the drawing of create
     */
    it('PenSetJoinStyle', 0, async (done: Function) => {
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
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of PenSetJoinStyle Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetCapStyle
     * @tc.name Test PenSetCapStyle
     * @tc.desc test the drawing of create
     */
    it('PenSetCapStyle', 0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        pen.setCapStyle(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetCapStyle Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of PenSetCapStyle Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_PenSetDither
     * @tc.name Test PenSetDither
     * @tc.desc test the drawing of create
     */
    it('PenSetDither', 0, async (done: Function) => {
      try {
        const pen = new drawing.Pen();
        pen.setDither(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of PenSetDither Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of PenSetDither Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetColor
     * @tc.name Test BrushSetColor
     * @tc.desc test the drawing of create
     */
    it('BrushSetColor', 0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        brush.setColor(null, 255, 0, 0);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetColor Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of BrushSetColor Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetAntiAlias
     * @tc.name Test BrushSetAntiAlias
     * @tc.desc test the drawing of create
     */
    it('BrushSetAntiAlias', 0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        brush.setAntiAlias(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetAntiAlias Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of BrushSetAntiAlias Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetAlpha
     * @tc.name Test BrushSetAlpha
     * @tc.desc test the drawing of create
     */
    it('BrushSetAlpha', 0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        brush.setAlpha(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetAlpha Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of BrushSetAlpha Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetColorFilter
     * @tc.name Test BrushSetColorFilter
     * @tc.desc test the drawing of create
     */
    it('BrushSetColorFilter', 0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        let colorFilter = drawing.ColorFilter.createLinearToSRGBGamma();
        brush.setColorFilter(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetColorFilter Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of BrushSetColorFilter Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetMaskFilter
     * @tc.name Test BrushSetMaskFilter
     * @tc.desc test the drawing of create
     */
    it('BrushSetMaskFilter', 0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10);
        brush.setMaskFilter(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetMaskFilter Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of BrushSetMaskFilter Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetShadowLayer
     * @tc.name Test BrushSetShadowLayer
     * @tc.desc test the drawing of create
     */
    it('BrushSetShadowLayer', 0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        brush.setShadowLayer(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetShadowLayer Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of BrushSetShadowLayer Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetShadowLayer
     * @tc.name Test BrushSetShadowLayer
     * @tc.desc test the drawing of create
     */
    it('BrushSetShadowLayer', 0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        brush.setShadowLayer(null);
        done();
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetShadowLayer Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of BrushSetShadowLayer Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_BrushSetBlendMode
     * @tc.name Test BrushSetBlendMode
     * @tc.desc test the drawing of create
     */
    it('BrushSetBlendMode', 0, async (done: Function) => {
      try {
        const brush = new drawing.Brush();
        brush.setBlendMode(null);
        done()
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of BrushSetBlendMode Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of BrushSetBlendMode Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionIsPointContained
     * @tc.name Test RegionIsPointContained
     * @tc.desc test the drawing of create
     */
    it('RegionIsPointContained', 0, async (done: Function) => {
      try {
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        let flag: boolean = false;
        flag = region.isPointContained(null,200);
        done()
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of RegionIsPointContained Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of RegionIsPointContained Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionIsRegionContained
     * @tc.name Test RegionIsRegionContained
     * @tc.desc test the drawing of create
     */
    it('RegionIsRegionContained', 0, async (done: Function) => {
      try {
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        let flag: boolean = false;
        flag = region.isRegionContained(null)
        done()
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of RegionIsRegionContained Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of RegionIsRegionContained Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionOp
     * @tc.name Test RegionOp
     * @tc.desc test the drawing of create
     */
    it('RegionOp', 0, async (done: Function) => {
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
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of RegionOp Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionQuickReject
     * @tc.name Test RegionQuickReject
     * @tc.desc test the drawing of create
     */
    it('RegionQuickReject', 0, async (done: Function) => {
      try {
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        let flag: boolean = false;
        flag = region.quickReject(null, 50, 70, 70);
        done()
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of RegionQuickReject Manager error' + err.code);
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of RegionQuickReject Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionSetPath
     * @tc.name Test RegionSetPath
     * @tc.desc test the drawing of create
     */
    it('RegionSetPath', 0, async (done: Function) => {
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
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of RegionSetPath Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionSetPath
     * @tc.name Test RegionSetPath
     * @tc.desc test the drawing of create
     */
    it('RegionSetPath', 0, async (done: Function) => {
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
          expect(true).assertTrue();
          done();
        } else {
          console.log('test enum value of RegionSetPath Manager error1' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_GRAPHIC_DrawingCode_RegionSetRect
     * @tc.name Test RegionSetRect
     * @tc.desc test the drawing of create
     */
    it('RegionSetRect', 0, async (done: Function) => {
      try {
        let region = new drawing.Region();
        let flag: boolean = false;
        flag = region.setRect(null, 50, 300, 300);
        done()
      } catch (err) {
        if (err.code == 401) {
          console.log('test enum value of RegionSetRect Manager error' + err.code);
          expect(true).assertTrue();
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
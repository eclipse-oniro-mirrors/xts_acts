/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsCanvasPart9Test(): void {
  describe('DrawingTsCanvasPart9Test', () => {
    let pixel: image.PixelMap;
    
    beforeEach(async (): Promise<void> => {
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 100,
          width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
    })

    beforeAll(() => {

    })

    afterEach(() => {

    })

    afterAll(() => {

    })
    /**
     * @tc.name   testCanvasResetClipNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5600
     * @tc.desc   testCanvasResetClipNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasResetClipNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasResetClipNormal';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      try {
        canvas.clipRect(rect);
        console.log(msg + " clipRect success");
        canvas.resetClip();
        console.log(msg + " resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5700
     * @tc.desc   testCanvasResetClipMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasResetClipMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testCanvasResetClipMultipleCalls';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      try {
        canvas.clipRect(rect);
        console.log(msg + " clipRect success");
        canvas.resetClip();
        console.log(msg + " resetClip 1 success");
        canvas.resetClip();
        console.log(msg + " resetClip 2 success");
        canvas.resetClip();
        console.log(msg + " resetClip 3 success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipAfterClipPath
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5800
     * @tc.desc   testCanvasResetClipAfterClipPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasResetClipAfterClipPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testCanvasResetClipAfterClipPath';
      let canvas = new drawing.Canvas(pixel);
      let path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      path.lineTo(100, 10);
      path.close();
      try {
        canvas.clipPath(path, drawing.ClipOp.INTERSECT, true);
        console.log(msg + " clipPath success");
        canvas.resetClip();
        console.log(msg + " resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipAfterClipRoundRect
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5900
     * @tc.desc   testCanvasResetClipAfterClipRoundRect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasResetClipAfterClipRoundRect', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testCanvasResetClipAfterClipRoundRect';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      let roundRect = new drawing.RoundRect(rect, 10, 10);
      try {
        canvas.clipRoundRect(roundRect, drawing.ClipOp.INTERSECT, true);
        console.log(msg + " clipRoundRect success");
        canvas.resetClip();
        console.log(msg + " resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipWithoutClip
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6000
     * @tc.desc   testCanvasResetClipWithoutClip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResetClipWithoutClip', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCanvasResetClipWithoutClip';
      let canvas = new drawing.Canvas(pixel);
      try {
        canvas.resetClip();
        console.log(msg + " resetClip success without clip");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipWithSaveRestore
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6100
     * @tc.desc   testCanvasResetClipWithSaveRestore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResetClipWithSaveRestore', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCanvasResetClipWithSaveRestore';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      try {
        canvas.save();
        console.log(msg + " save success");
        canvas.clipRect(rect);
        console.log(msg + " clipRect success");
        canvas.resetClip();
        console.log(msg + " resetClip success");
        canvas.restore();
        console.log(msg + " restore success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipWithDifferentClipOps
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6200
     * @tc.desc   testCanvasResetClipWithDifferentClipOps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResetClipWithDifferentClipOps', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCanvasResetClipWithDifferentClipOps';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      try {
        canvas.clipRect(rect, drawing.ClipOp.INTERSECT, true);
        console.log(msg + " clipRect INTERSECT success");
        canvas.resetClip();
        console.log(msg + " resetClip 1 success");
        
        canvas.clipRect(rect, drawing.ClipOp.DIFFERENCE, true);
        console.log(msg + " clipRect DIFFERENCE success");
        canvas.resetClip();
        console.log(msg + " resetClip 2 success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipWithDrawOperations
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6300
     * @tc.desc   testCanvasResetClipWithDrawOperations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasResetClipWithDrawOperations', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasResetClipWithDrawOperations';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      let brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      try {
        canvas.clipRect(rect);
        console.log(msg + " clipRect success");
        canvas.attachBrush(brush);
        canvas.drawRect({ left: 10, right: 200, top: 100, bottom: 300 });
        console.log(msg + " drawRect 1 success (with clip)");
        canvas.resetClip();
        console.log(msg + " resetClip success");
        canvas.drawRect({ left: 10, right: 200, top: 100, bottom: 300 });
        console.log(msg + " drawRect 2 success (without clip)");
        canvas.detachBrush();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipWithTransform
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6400
     * @tc.desc   testCanvasResetClipWithTransform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasResetClipWithTransform', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasResetClipWithTransform';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      try {
        canvas.translate(10, 10);
        console.log(msg + " translate success");
        canvas.scale(2, 2);
        console.log(msg + " scale success");
        canvas.rotate(30, 100, 100);
        console.log(msg + " rotate success");
        
        canvas.clipRect(rect);
        console.log(msg + " clipRect success");
        canvas.resetClip();
        console.log(msg + " resetClip success");
        
        let matrix = canvas.getTotalMatrix();
        console.log(msg + " getTotalMatrix success");
        expect(matrix !== null).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDrawGlyphsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6500
     * @tc.desc   testDrawGlyphsNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDrawGlyphsNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg: string = 'testDrawGlyphsNormal';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font);
        console.log(msg + " drawGlyphs success");
        canvas.detachBrush();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDrawGlyphsNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_0700
     * @tc.desc   testDrawGlyphsNormal2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDrawGlyphsNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg: string = 'testDrawGlyphsNormal2';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [300.56, 400.954, 300.4568];
        let positions: Array<common2D.Point> = [
          { x: 100.45, y: 100.11 },
          { x: 200.4563, y: 100.4862 },
          { x: 150.7895, y: 200.258 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font);
        console.log(msg + " drawGlyphs success");
        canvas.detachBrush();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDrawGlyphsGlyphCountZero
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_0800
     * @tc.desc   testDrawGlyphsGlyphCountZero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDrawGlyphsGlyphCountZero', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg: string = 'testDrawGlyphsGlyphCountZero';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [300.56, 400.954, 300.4568];
        let positions: Array<common2D.Point> = [
          { x: 100.45, y: 100.11 },
          { x: 200.4563, y: 100.4862 },
          { x: 150.7895, y: 200.258 }
        ];
        canvas.drawGlyphs(glyphIds, 1, positions, 1, 0, font);
        console.log(msg + " drawGlyphs success");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithEmptyGlyphIdsArray
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6600
     * @tc.desc   testDrawGlyphsWithEmptyGlyphIdsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDrawGlyphsWithEmptyGlyphIdsArray', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg: string = 'testDrawGlyphsWithEmptyGlyphIdsArray';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with empty arrays success");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithEmptyPositionsArray
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6700
     * @tc.desc   testDrawGlyphsWithEmptyPositionsArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawGlyphsWithEmptyPositionsArray', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg: string = 'testDrawGlyphsWithEmptyPositionsArray';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200];
        let positions: Array<common2D.Point> = [];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with empty positions success");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithGlyphIdOffset
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6800
     * @tc.desc   testDrawGlyphsWithGlyphIdOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawGlyphsWithGlyphIdOffset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg: string = 'testDrawGlyphsWithGlyphIdOffset';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300, 400, 500];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 2, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with glyphIdOffset success");
        canvas.detachBrush();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithPositionOffset
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6900
     * @tc.desc   testDrawGlyphsWithPositionOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawGlyphsWithPositionOffset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg: string = 'testDrawGlyphsWithPositionOffset';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 50.0, y: 50.0 },
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 1, 3, font);
        console.log(msg + " drawGlyphs with positionOffset success");
        canvas.detachBrush();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithZeroGlyphCount
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_7000
     * @tc.desc   testDrawGlyphsWithZeroGlyphCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawGlyphsWithZeroGlyphCount', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg: string = 'testDrawGlyphsWithZeroGlyphCount';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 0, font);
        console.log(msg + " drawGlyphs with zero glyphCount success");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithNegativeGlyphCount
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_7100
     * @tc.desc   testDrawGlyphsWithNegativeGlyphCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawGlyphsWithNegativeGlyphCount', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg: string = 'testDrawGlyphsWithNegativeGlyphCount';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, -1, font);
        console.log(msg + " drawGlyphs with negative glyphCount should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithMaxGlyphIdOffset
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_7200
     * @tc.desc   testDrawGlyphsWithMaxGlyphIdOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithMaxGlyphIdOffset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithMaxGlyphIdOffset';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 100000, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with max glyphIdOffset should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithMaxPositionOffset
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_7300
     * @tc.desc   testDrawGlyphsWithMaxPositionOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithMaxPositionOffset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithMaxPositionOffset';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 100000, 3, font);
        console.log(msg + " drawGlyphs with max positionOffset should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithInvalidOffsetCombination
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_7400
     * @tc.desc   testDrawGlyphsWithInvalidOffsetCombination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithInvalidOffsetCombination', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithInvalidOffsetCombination';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 2, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with invalid offset combination should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithInvalidPositionOffsetCombination
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_7500
     * @tc.desc   testDrawGlyphsWithInvalidPositionOffsetCombination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithInvalidPositionOffsetCombination', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithInvalidPositionOffsetCombination';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 2, 3, font);
        console.log(msg + " drawGlyphs with invalid position offset combination should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithNullFont
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_7600
     * @tc.desc   testDrawGlyphsWithNullFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithNullFont', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithNullFont';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font | null = null;
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with null font should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithNullGlyphIds
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_7700
     * @tc.desc   testDrawGlyphsWithNullGlyphIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithNullGlyphIds', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithNullGlyphIds';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      let glyphIds: Array<number> | null = null;
      try {
        canvas.attachBrush(brush);
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with null glyphIds should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithNullPositions
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_7800
     * @tc.desc   testDrawGlyphsWithNullPositions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithNullPositions', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithNullPositions';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      let positions: Array<common2D.Point> | null = null;
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with null positions should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithUndefinedFont
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_7900
     * @tc.desc   testDrawGlyphsWithUndefinedFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithUndefinedFont', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithUndefinedFont';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font | undefined = undefined;
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with undefined font should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithUndefinedGlyphIds
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_8000
     * @tc.desc   testDrawGlyphsWithUndefinedGlyphIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithUndefinedGlyphIds', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithUndefinedGlyphIds';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      let glyphIds: Array<number> | undefined = undefined;
      try {
        canvas.attachBrush(brush);
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with undefined glyphIds should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithUndefinedPositions
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_8100
     * @tc.desc   testDrawGlyphsWithUndefinedPositions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithUndefinedPositions', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithUndefinedPositions';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      let positions: Array<common2D.Point> | undefined = undefined;
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with undefined positions should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithUndefinedglyphIdOffset
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_0100
     * @tc.desc   testDrawGlyphsWithUndefinedglyphIdOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithUndefinedglyphIdOffset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithUndefinedglyphIdOffset';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      let positions: Array<common2D.Point> = [
        { x: 100.0, y: 100.0 },
        { x: 200.0, y: 100.0 },
        { x: 150.0, y: 200.0 }
      ];
      let glyphIds: Array<number> = [100, 200, 300];
      try {
        canvas.attachBrush(brush);
        canvas.drawGlyphs(glyphIds, undefined, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with undefined positions should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithNullglyphIdOffset
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_0200
     * @tc.desc   testDrawGlyphsWithNullglyphIdOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithNullglyphIdOffset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithNullglyphIdOffset';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      let positions: Array<common2D.Point> = [
        { x: 100.0, y: 100.0 },
        { x: 200.0, y: 100.0 },
        { x: 150.0, y: 200.0 }
      ];
      let glyphIds: Array<number> = [100, 200, 300];
      try {
        canvas.attachBrush(brush);
        canvas.drawGlyphs(glyphIds, null, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with undefined positions should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithNullPositionOffset
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_0300
     * @tc.desc   testDrawGlyphsWithNullPositionOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithNullPositionOffset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithNullPositionOffset';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      let positions: Array<common2D.Point> = [
        { x: 100.0, y: 100.0 },
        { x: 200.0, y: 100.0 },
        { x: 150.0, y: 200.0 }
      ];
      let glyphIds: Array<number> = [100, 200, 300];
      try {
        canvas.attachBrush(brush);
        canvas.drawGlyphs(glyphIds, 0, positions, null, 3, font);
        console.log(msg + " drawGlyphs with undefined positions should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithUndefinedPositionOffset
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_0400
     * @tc.desc   testDrawGlyphsWithUndefinedPositionOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithUndefinedPositionOffset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithUndefinedPositionOffset';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      let positions: Array<common2D.Point> = [
        { x: 100.0, y: 100.0 },
        { x: 200.0, y: 100.0 },
        { x: 150.0, y: 200.0 }
      ];
      let glyphIds: Array<number> = [100, 200, 300];
      try {
        canvas.attachBrush(brush);
        canvas.drawGlyphs(glyphIds, 0, positions, undefined, 3, font);
        console.log(msg + " drawGlyphs with undefined positions should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithUndefinedGlyphCount
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_0500
     * @tc.desc   testDrawGlyphsWithUndefinedGlyphCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithUndefinedGlyphCount', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithUndefinedGlyphCount';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      let positions: Array<common2D.Point> = [
        { x: 100.0, y: 100.0 },
        { x: 200.0, y: 100.0 },
        { x: 150.0, y: 200.0 }
      ];
      let glyphIds: Array<number> = [100, 200, 300];
      try {
        canvas.attachBrush(brush);
        canvas.drawGlyphs(glyphIds, 0, positions, 0, undefined, font);
        console.log(msg + " drawGlyphs with undefined positions should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithNullGlyphCount
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_0600
     * @tc.desc   testDrawGlyphsWithNullGlyphCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithNullGlyphCount', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithNullGlyphCount';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      let positions: Array<common2D.Point> = [
        { x: 100.0, y: 100.0 },
        { x: 200.0, y: 100.0 },
        { x: 150.0, y: 200.0 }
      ];
      let glyphIds: Array<number> = [100, 200, 300];
      try {
        canvas.attachBrush(brush);
        canvas.drawGlyphs(glyphIds, 0, positions, 0, null, font);
        console.log(msg + " drawGlyphs with undefined positions should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithGlyphIdOffsetMin
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_8200
     * @tc.desc   testDrawGlyphsWithGlyphIdOffsetMin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithGlyphIdOffsetMin', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithGlyphIdOffsetMin';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, -1, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with min values should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testDrawGlyphsGlyphIdsEffectiveScope2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_1200
     * @tc.desc   testDrawGlyphsGlyphIdsEffectiveScope2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsGlyphIdsEffectiveScope2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsGlyphIdsEffectiveScope2';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, -2, positions, 0, 2, font);
        console.log(msg + " drawGlyphs with min values should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testDrawGlyphsPositionOffsetMinus
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_0900
     * @tc.desc   testDrawGlyphsPositionOffsetMinus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsPositionOffsetMinus', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsPositionOffsetMinus';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 1, positions, -2, 2, font);
        console.log(msg + " drawGlyphs with min values should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testDrawGlyphsPositionOffsetMinus2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_1100
     * @tc.desc   testDrawGlyphsPositionOffsetMinus2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsPositionOffsetMinus2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsPositionOffsetMinus2';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 1, positions, -1, 2, font);
        console.log(msg + " drawGlyphs with min values should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithMaxValues
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_8300
     * @tc.desc   testDrawGlyphsWithMaxValues
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithMaxValues', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithMaxValues';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, Number.MAX_VALUE, positions, Number.MAX_VALUE, Number.MAX_VALUE, font);
        console.log(msg + " drawGlyphs with max values should throw error");
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithMinValues
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_1000
     * @tc.desc   testDrawGlyphsWithMinValues
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithMinValues', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithMinValues';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, Number.MIN_VALUE, positions, Number.MIN_VALUE, Number.MIN_VALUE, font);
        console.log(msg + " drawGlyphs with max values should throw error")
        canvas.detachBrush();
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_8400
     * @tc.desc   testDrawGlyphsWithMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawGlyphsWithMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testDrawGlyphsWithMultipleCalls';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds1: Array<number> = [100, 200, 300];
        let positions1: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds1, 0, positions1, 0, 3, font);
        console.log(msg + " drawGlyphs 1 success");
        
        let glyphIds2: Array<number> = [400, 500, 600];
        let positions2: Array<common2D.Point> = [
          { x: 50.0, y: 50.0 },
          { x: 150.0, y: 50.0 },
          { x: 100.0, y: 150.0 }
        ];
        canvas.drawGlyphs(glyphIds2, 0, positions2, 0, 3, font);
        console.log(msg + " drawGlyphs 2 success");
        
        let glyphIds3: Array<number> = [700, 800, 900];
        let positions3: Array<common2D.Point> = [
          { x: 75.0, y: 75.0 },
          { x: 175.0, y: 75.0 },
          { x: 125.0, y: 175.0 }
        ];
        canvas.drawGlyphs(glyphIds3, 0, positions3, 0, 3, font);
        console.log(msg + " drawGlyphs 3 success");
        canvas.detachBrush();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithDifferentFonts
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_8500
     * @tc.desc   testDrawGlyphsWithDifferentFonts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawGlyphsWithDifferentFonts', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testDrawGlyphsWithDifferentFonts';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font1: drawing.Font = new drawing.Font();
      font1.setSize(10);
      let font2: drawing.Font = new drawing.Font();
      font2.setSize(30);
      let font3: drawing.Font = new drawing.Font();
      font3.setSize(50);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font1);
        console.log(msg + " drawGlyphs with font1 success");
        
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font2);
        console.log(msg + " drawGlyphs with font2 success");
        
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font3);
        console.log(msg + " drawGlyphs with font3 success");
        canvas.detachBrush();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithTransform
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_8600
     * @tc.desc   testDrawGlyphsWithTransform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawGlyphsWithTransform', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testDrawGlyphsWithTransform';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        canvas.translate(10, 10);
        console.log(msg + " translate success");
        canvas.scale(2, 2);
        console.log(msg + " scale success");
        canvas.rotate(30, 100, 100);
        console.log(msg + " rotate success");
        
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font);
        console.log(msg + " drawGlyphs after transform success");
        canvas.detachBrush();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithBrushAndPen
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_8700
     * @tc.desc   testDrawGlyphsWithBrushAndPen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawGlyphsWithBrushAndPen', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testDrawGlyphsWithBrushAndPen';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let brushColor: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(brushColor);
      let pen: drawing.Pen = new drawing.Pen();
      let penColor: common2D.Color = { alpha: 255, red: 0, green: 255, blue: 0 };
      pen.setColor(penColor);
      pen.setStrokeWidth(5);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        console.log(msg + " attachBrush success");
        
        let glyphIds: Array<number> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with brush success");
        
        canvas.detachBrush();
        canvas.attachPen(pen);
        console.log(msg + " attachPen success");
        
        canvas.drawGlyphs(glyphIds, 0, positions, 0, 3, font);
        console.log(msg + " drawGlyphs with pen success");
        canvas.detachPen();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsOpaqueNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_8800
     * @tc.desc   testIsOpaqueNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsOpaqueNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg: string = 'testIsOpaqueNormal';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      try {
        let result: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque success, result: " + result);
        expect(typeof result).assertEqual('boolean');
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsOpaqueReturnsTrue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_8900
     * @tc.desc   testIsOpaqueReturnsTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsOpaqueReturnsTrue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async(): Promise<void> => {
      const msg: string = 'testIsOpaqueReturnsTrue';
      let isOpaque_pixel: image.PixelMap;
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_565,
        alphaType: image.AlphaType.OPAQUE,
        size: {
          height: 100,
          width: 100
        }
      }
      isOpaque_pixel = await image.createPixelMap(color, opts);
      if(isOpaque_pixel){
        let canvas: drawing.Canvas = new drawing.Canvas(isOpaque_pixel);
        try {
          let result: boolean = canvas.isOpaque();
          console.log(msg + " isOpaque result: " + result);
          expect(result).assertEqual(true);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      } else {
        console.info(msg + ` image createPixelMap error`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsOpaqueReturnsTrue2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_9000
     * @tc.desc   testIsOpaqueReturnsTrue2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsOpaqueReturnsTrue2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async(): Promise<void> => {
      const msg: string = 'testIsOpaqueReturnsTrue2';
      let isOpaque_pixel: image.PixelMap;
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_888,
        alphaType: image.AlphaType.OPAQUE,
        size: {
          height: 100,
          width: 100
        }
      }
      isOpaque_pixel = await image.createPixelMap(color, opts);
      if(isOpaque_pixel){
        let canvas: drawing.Canvas = new drawing.Canvas(isOpaque_pixel);
        try {
          let result: boolean = canvas.isOpaque();
          console.log(msg + " isOpaque result: " + result);
          expect(result).assertEqual(true);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      } else {
        console.info(msg + ` image createPixelMap error`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsOpaqueMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_9100
     * @tc.desc   testIsOpaqueMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsOpaqueMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg: string = 'testIsOpaqueMultipleCalls';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      try {
        let result1: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque 1 result: " + result1);
        expect(result1).assertEqual(false);
        
        let result2: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque 2 result: " + result2);
        expect(result2).assertEqual(false);
        
        let result3: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque 3 result: " + result3);
        expect(result3).assertEqual(false);
        
        expect(result1).assertEqual(result2);
        expect(result2).assertEqual(result3);
        console.log(msg + " isOpaque returns consistent results");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsOpaqueAfterDraw
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_9200
     * @tc.desc   testIsOpaqueAfterDraw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsOpaqueAfterDraw', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testIsOpaqueAfterDraw';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      try {
        let resultBefore: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque before draw result: " + resultBefore);
        expect(resultBefore).assertEqual(false);
        
        canvas.attachBrush(brush);
        canvas.drawRect({ left: 10, right: 200, top: 100, bottom: 300 });
        console.log(msg + " drawRect success");
        canvas.detachBrush();
        
        let resultAfter: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque after draw result: " + resultAfter);
        expect(resultAfter).assertEqual(false);
        
        expect(typeof resultBefore).assertEqual('boolean');
        expect(typeof resultAfter).assertEqual('boolean');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsOpaqueWithSaveRestore
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_9300
     * @tc.desc   testIsOpaqueWithSaveRestore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsOpaqueWithSaveRestore', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testIsOpaqueWithSaveRestore';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      try {
        let resultBefore: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque before save result: " + resultBefore);
        expect(resultBefore).assertEqual(false);
        
        canvas.save();
        console.log(msg + " save success");
        
        let resultAfterSave: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque after save result: " + resultAfterSave);
        expect(resultAfterSave).assertEqual(false);
        
        canvas.restore();
        console.log(msg + " restore success");
        
        let resultAfterRestore: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque after restore result: " + resultAfterRestore);
        expect(resultAfterRestore).assertEqual(false);
        
        expect(typeof resultBefore).assertEqual('boolean');
        expect(typeof resultAfterSave).assertEqual('boolean');
        expect(typeof resultAfterRestore).assertEqual('boolean');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsOpaqueWithTransform
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_9400
     * @tc.desc   testIsOpaqueWithTransform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsOpaqueWithTransform', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testIsOpaqueWithTransform';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      try {
        let resultBefore: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque before transform result: " + resultBefore);
        expect(resultBefore).assertEqual(false);
        
        canvas.translate(10, 10);
        console.log(msg + " translate success");
        canvas.scale(2, 2);
        console.log(msg + " scale success");
        canvas.rotate(30, 100, 100);
        console.log(msg + " rotate success");
        
        let resultAfter: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque after transform result: " + resultAfter);
        expect(resultAfter).assertEqual(false);
        
        expect(typeof resultBefore).assertEqual('boolean');
        expect(typeof resultAfter).assertEqual('boolean');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsOpaqueWithClip
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_9500
     * @tc.desc   testIsOpaqueWithClip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsOpaqueWithClip', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testIsOpaqueWithClip';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      try {
        let resultBefore: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque before clip result: " + resultBefore);
        expect(resultBefore).assertEqual(false);
        
        canvas.clipRect(rect);
        console.log(msg + " clipRect success");
        
        let resultAfter: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque after clip result: " + resultAfter);
        expect(resultAfter).assertEqual(false);
        
        canvas.resetClip();
        console.log(msg + " resetClip success");
        
        let resultAfterReset: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque after resetClip result: " + resultAfterReset);
        expect(resultAfterReset).assertEqual(false);
        
        expect(typeof resultBefore).assertEqual('boolean');
        expect(typeof resultAfter).assertEqual('boolean');
        expect(typeof resultAfterReset).assertEqual('boolean');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testIsOpaqueWithLayer
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_9600
     * @tc.desc   testIsOpaqueWithLayer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsOpaqueWithLayer', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testIsOpaqueWithLayer';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      try {
        let resultBefore: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque before layer result: " + resultBefore);
        expect(resultBefore).assertEqual(false);
        
        canvas.save();
        console.log(msg + " save success");
        canvas.clipRect(rect);
        console.log(msg + " clipRect success");
        
        let resultAfterClip: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque after clip in layer result: " + resultAfterClip);
        expect(resultAfterClip).assertEqual(false);
        
        canvas.restore();
        console.log(msg + " restore success");
        
        let resultAfterRestore: boolean = canvas.isOpaque();
        console.log(msg + " isOpaque after restore from layer result: " + resultAfterRestore);
        expect(resultAfterRestore).assertEqual(false);
        
        expect(typeof resultBefore).assertEqual('boolean');
        expect(typeof resultAfterClip).assertEqual('boolean');
        expect(typeof resultAfterRestore).assertEqual('boolean');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDrawGlyphsWithOverflowOffsetSum
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_1300
     * @tc.desc   test drawGlyphs when glyphCount + glyphIdOffset or glyphCount + positionOffset exceeds 0x7FFFFFFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawGlyphsWithOverflowOffsetSum', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testDrawGlyphsWithOverflowOffsetSum';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      canvas.attachBrush(brush);
      let glyphIds: Array<number> = [100, 200, 300];
      let positions: Array<common2D.Point> = [
        { x: 100.0, y: 100.0 },
        { x: 200.0, y: 100.0 },
        { x: 150.0, y: 200.0 }
      ];
      try {
      // Test: glyphCount + glyphIdOffset > 0x7FFFFFFF, sum should be capped at 0x7FFFFFFF
      canvas.drawGlyphs(glyphIds, 2147483646, positions, 0, 2, font);
      console.log(msg + " drawGlyphs with glyphIdOffset + glyphCount > 0x7FFFFFFF handled correctly");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
      try {
        // Test: glyphCount + positionOffset > 0x7FFFFFFF, sum should be capped at 0x7FFFFFFF
        canvas.drawGlyphs(glyphIds, 0, positions, 2147483646, 2, font);
        console.log(msg + " drawGlyphs with positionOffset + glyphCount > 0x7FFFFFFF handled correctly");
      } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(25900001);
        }
      canvas.detachBrush();
    })
  })
}

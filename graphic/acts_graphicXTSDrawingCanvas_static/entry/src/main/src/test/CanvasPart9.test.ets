/*
 * Copyright (C) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level} from "../../../hypium/index";
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsCanvasPart9Test(): void {
  describe('DrawingTsCanvasPart9Test', () => {
    let pixel: image.PixelMap | undefined;
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
    /**
     * @tc.name   testCanvasResetClipNormal1Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5600
     * @tc.desc   testCanvasResetClipNormal1Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasResetClipNormal1Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCanvasResetClipNormal1Static';
      let canvas = new drawing.Canvas(pixel!);
      try {
        canvas.resetClip();
        console.log(msg + "resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `resetClip errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipNormal2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5700
     * @tc.desc   testCanvasResetClipNormal2Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasResetClipNormal2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testCanvasResetClipNormal2Static';
      let canvas = new drawing.Canvas(pixel!);
      let rect: common2D.Rect = { left: 10.0, top: 100.0, right: 200.0, bottom: 300.0 };
      try {
        canvas.clipRect(rect, drawing.ClipOp.INTERSECT, true);
        console.log(msg + "clipRect success");
        canvas.resetClip();
        console.log(msg + "resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `resetClip errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipNormal3Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5800
     * @tc.desc   testCanvasResetClipNormal3Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasResetClipNormal3Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testCanvasResetClipNormal3Static';
      let canvas = new drawing.Canvas(pixel!);
      let path = new drawing.Path();
      path.addCircle(50.0, 50.0, 30.0, drawing.PathDirection.CLOCKWISE);
      try {
        canvas.clipPath(path, drawing.ClipOp.INTERSECT, true);
        console.log(msg + "clipPath success");
        canvas.resetClip();
        console.log(msg + "resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `resetClip errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5900
     * @tc.desc   testCanvasResetClipMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResetClipMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testCanvasResetClipMultipleCallsStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        for (let i = 0; i < 10; i++) {
          canvas.resetClip();
          console.log(msg + "resetClip success step: " + i);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `resetClip errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipWithMatrixStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_6000
     * @tc.desc   testCanvasResetClipWithMatrixStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResetClipWithMatrixStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testCanvasResetClipWithMatrixStatic';
      let canvas = new drawing.Canvas(pixel!);
      let matrix = new drawing.Matrix();
      matrix.setMatrix([2.0, 0.0, 0.0, 0.0, 2.0, 0.0, 0.0, 0.0, 1.0]);
      try {
        canvas.setMatrix(matrix);
        console.log(msg + "setMatrix success");
        canvas.resetClip();
        console.log(msg + "resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `resetClip errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipAfterDrawStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_6100
     * @tc.desc   testCanvasResetClipAfterDrawStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResetClipAfterDrawStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testCanvasResetClipAfterDrawStatic';
      let canvas = new drawing.Canvas(pixel!);
      let rect: common2D.Rect = { left: 10.0, top: 10.0, right: 50.0, bottom: 50.0 };
      try {
        canvas.drawRect(rect);
        console.log(msg + "drawRect success");
        canvas.resetClip();
        console.log(msg + "resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `resetClip errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDrawGlyphsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_6500
     * @tc.desc   testDrawGlyphsNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDrawGlyphsNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg: string = 'testDrawGlyphsNormalStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsNormal2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_STATIC_0700
     * @tc.desc   testDrawGlyphsNormal2Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDrawGlyphsNormal2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg: string = 'testDrawGlyphsNormal2Static';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [300, 400, 300];
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
     * @tc.name   testDrawGlyphsGlyphCountZeroStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_STATIC_0800
     * @tc.desc   testDrawGlyphsGlyphCountZeroStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDrawGlyphsGlyphCountZeroStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg: string = 'testDrawGlyphsGlyphCountZeroStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [300, 400, 300];
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
     * @tc.name   testDrawGlyphsWithEmptyGlyphIdsArrayStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_6600
     * @tc.desc   testDrawGlyphsWithEmptyGlyphIdsArrayStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDrawGlyphsWithEmptyGlyphIdsArrayStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg: string = 'testDrawGlyphsWithEmptyGlyphIdsArrayStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [];
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
     * @tc.name   testDrawGlyphsWithEmptyPositionsArrayStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_6700
     * @tc.desc   testDrawGlyphsWithEmptyPositionsArrayStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawGlyphsWithEmptyPositionsArrayStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg: string = 'testDrawGlyphsWithEmptyPositionsArrayStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200];
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
     * @tc.name   testDrawGlyphsWithGlyphIdOffsetStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_6800
     * @tc.desc   testDrawGlyphsWithGlyphIdOffsetStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawGlyphsWithGlyphIdOffsetStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg: string = 'testDrawGlyphsWithGlyphIdOffsetStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300, 400, 500];
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
     * @tc.name   testDrawGlyphsWithPositionOffsetStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_6900
     * @tc.desc   testDrawGlyphsWithPositionOffsetStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawGlyphsWithPositionOffsetStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg: string = 'testDrawGlyphsWithPositionOffsetStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsWithZeroGlyphCountStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_7000
     * @tc.desc   testDrawGlyphsWithZeroGlyphCountStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawGlyphsWithZeroGlyphCountStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg: string = 'testDrawGlyphsWithZeroGlyphCountStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsWithNegativeGlyphCountStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_7100
     * @tc.desc   testDrawGlyphsWithNegativeGlyphCountStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawGlyphsWithNegativeGlyphCountStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg: string = 'testDrawGlyphsWithNegativeGlyphCountStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsWithMaxGlyphIdOffsetStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_7200
     * @tc.desc   testDrawGlyphsWithMaxGlyphIdOffsetStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithMaxGlyphIdOffsetStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithMaxGlyphIdOffsetStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsWithMaxPositionOffsetStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_7300
     * @tc.desc   testDrawGlyphsWithMaxPositionOffsetStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithMaxPositionOffsetStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithMaxPositionOffsetStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsWithInvalidOffsetCombinationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_7400
     * @tc.desc   testDrawGlyphsWithInvalidOffsetCombinationStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithInvalidOffsetCombinationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithInvalidOffsetCombinationStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsWithInvalidPositionOffsetCombinationStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_7500
     * @tc.desc   testDrawGlyphsWithInvalidPositionOffsetCombinationStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithInvalidPositionOffsetCombinationStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithInvalidPositionOffsetCombinationStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsWithGlyphIdOffsetMinStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_8200
     * @tc.desc   testDrawGlyphsWithGlyphIdOffsetMinStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithGlyphIdOffsetMinStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithGlyphIdOffsetMinStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsGlyphIdsEffectiveScope2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_STATIC_1200
     * @tc.desc   testDrawGlyphsGlyphIdsEffectiveScope2Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsGlyphIdsEffectiveScope2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsGlyphIdsEffectiveScope2Static';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsPositionOffsetMinusStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_STATIC_0900
     * @tc.desc   testDrawGlyphsPositionOffsetMinusStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsPositionOffsetMinusStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsPositionOffsetMinusStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsPositionOffsetMinus2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_STATIC_1100
     * @tc.desc   testDrawGlyphsPositionOffsetMinus2Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsPositionOffsetMinus2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsPositionOffsetMinus2Static';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsWithMaxValuesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_8300
     * @tc.desc   testDrawGlyphsWithMaxValuesStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithMaxValuesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithMaxValuesStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, (Number.MAX_VALUE).toInt(), positions, (Number.MAX_VALUE).toInt(), (Number.MAX_VALUE).toInt(), font);
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
     * @tc.name   testDrawGlyphsWithMinValuesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_STATIC_1000
     * @tc.desc   testDrawGlyphsWithMinValuesStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDrawGlyphsWithMinValuesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testDrawGlyphsWithMinValuesStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds: Array<int> = [100, 200, 300];
        let positions: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds, (Number.MIN_VALUE).toInt(), positions, (Number.MIN_VALUE).toInt(), (Number.MIN_VALUE).toInt(), font);
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
     * @tc.name   testDrawGlyphsWithMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_8400
     * @tc.desc   testDrawGlyphsWithMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawGlyphsWithMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testDrawGlyphsWithMultipleCallsStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      try {
        canvas.attachBrush(brush);
        let glyphIds1: Array<int> = [100, 200, 300];
        let positions1: Array<common2D.Point> = [
          { x: 100.0, y: 100.0 },
          { x: 200.0, y: 100.0 },
          { x: 150.0, y: 200.0 }
        ];
        canvas.drawGlyphs(glyphIds1, 0, positions1, 0, 3, font);
        console.log(msg + " drawGlyphs 1 success");

        let glyphIds2: Array<int> = [400, 500, 600];
        let positions2: Array<common2D.Point> = [
          { x: 50.0, y: 50.0 },
          { x: 150.0, y: 50.0 },
          { x: 100.0, y: 150.0 }
        ];
        canvas.drawGlyphs(glyphIds2, 0, positions2, 0, 3, font);
        console.log(msg + " drawGlyphs 2 success");

        let glyphIds3: Array<int> = [700, 800, 900];
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
     * @tc.name   testDrawGlyphsWithDifferentFontsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_8500
     * @tc.desc   testDrawGlyphsWithDifferentFontsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawGlyphsWithDifferentFontsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testDrawGlyphsWithDifferentFontsStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
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
        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsWithTransformStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_8600
     * @tc.desc   testDrawGlyphsWithTransformStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawGlyphsWithTransformStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testDrawGlyphsWithTransformStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
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

        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testDrawGlyphsWithBrushAndPenStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_8700
     * @tc.desc   testDrawGlyphsWithBrushAndPenStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawGlyphsWithBrushAndPenStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testDrawGlyphsWithBrushAndPenStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let brushColor: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(brushColor);
      let pen: drawing.Pen = new drawing.Pen();
      let penColor: common2D.Color = { alpha: 255, red: 0, green: 255, blue: 0 };
      pen.setColor(penColor);
      pen.setStrokeWidth(5);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);

      let result: boolean = canvas.isOpaque();
      console.log(msg + " isOpaque success, result: " + result);
      try {
        canvas.attachBrush(brush);
        console.log(msg + " attachBrush success");

        let glyphIds: Array<int> = [100, 200, 300];
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
     * @tc.name   testIsOpaqueNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_8800
     * @tc.desc   testIsOpaqueNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsOpaqueNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg: string = 'testIsOpaqueNormalStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
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
     * @tc.name   testIsOpaqueReturnsTrueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_8900
     * @tc.desc   testIsOpaqueReturnsTrueStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsOpaqueReturnsTrueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async(): Promise<void> => {
      const msg: string = 'testIsOpaqueReturnsTrueStatic';
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
     * @tc.name   testIsOpaqueReturnsTrue2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_9000
     * @tc.desc   testIsOpaqueReturnsTrue2Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsOpaqueReturnsTrue2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async(): Promise<void> => {
      const msg: string = 'testIsOpaqueReturnsTrue2Static';
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
     * @tc.name   testIsOpaqueMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_9100
     * @tc.desc   testIsOpaqueMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsOpaqueMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg: string = 'testIsOpaqueMultipleCallsStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
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
     * @tc.name   testIsOpaqueAfterDrawStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_9200
     * @tc.desc   testIsOpaqueAfterDrawStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsOpaqueAfterDrawStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testIsOpaqueAfterDrawStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
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
     * @tc.name   testIsOpaqueWithSaveRestoreStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_9300
     * @tc.desc   testIsOpaqueWithSaveRestoreStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsOpaqueWithSaveRestoreStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testIsOpaqueWithSaveRestoreStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
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
     * @tc.name   testIsOpaqueWithTransformStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_9400
     * @tc.desc   testIsOpaqueWithTransformStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsOpaqueWithTransformStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg: string = 'testIsOpaqueWithTransformStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
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
     * @tc.name   testIsOpaqueWithClipStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_9500
     * @tc.desc   testIsOpaqueWithClipStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsOpaqueWithClipStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testIsOpaqueWithClipStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
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
     * @tc.name   testIsOpaqueWithLayerStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_9600
     * @tc.desc   testIsOpaqueWithLayerStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsOpaqueWithLayerStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testIsOpaqueWithLayerStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
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
     * @tc.name   testDrawGlyphsWithOverflowOffsetSumStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_DRAWGLYPHS_STATIC_1300
     * @tc.desc   test drawGlyphs when glyphCount + glyphIdOffset or glyphCount + positionOffset exceeds 0x7FFFFFFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawGlyphsWithOverflowOffsetSumStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg: string = 'testDrawGlyphsWithOverflowOffsetSumStatic';
      let canvas: drawing.Canvas = new drawing.Canvas(pixel!);
      let brush: drawing.Brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      let font: drawing.Font = new drawing.Font();
      font.setSize(20);
      canvas.attachBrush(brush);
      let glyphIds: Array<int> = [100, 200, 300];
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

/*
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
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';
import { common2D, drawing } from '@kit.ArkGraphics2D';
import image from '@ohos.multimedia.image';

async function sleep(time: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, time);
  });
}

export default function graphicDrawingPathTest() {
  describe('graphicDrawingPathTest', ()=> {
    console.log('describe graphicDrawingPathTest start!!!')

    beforeAll(async ()=> {
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_001
     * @tc.name      : testPathIteratorVerb
     * @tc.desc      : The property of drawing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPathIteratorVerb', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = " ====testPathIteratorVerb==== "
      try {
        console.info(msg + ' Succeeded in PathIteratorVerb.');
        expect(drawing.PathIteratorVerb.MOVE == 0).assertTrue()
        expect(drawing.PathIteratorVerb.LINE == 1).assertTrue()
        expect(drawing.PathIteratorVerb.QUAD == 2).assertTrue()
        expect(drawing.PathIteratorVerb.CONIC == 3).assertTrue()
        expect(drawing.PathIteratorVerb.CUBIC == 4).assertTrue()
        expect(drawing.PathIteratorVerb.CLOSE == 5).assertTrue()
        expect(drawing.PathIteratorVerb.DONE == drawing.PathIteratorVerb.CLOSE + 1	).assertTrue()
        console.info(msg + ' drawing.PathIteratorVerb.MOVE: ' + drawing.PathIteratorVerb.MOVE);
        console.info(msg + ' drawing.PathIteratorVerb.LINE: ' + drawing.PathIteratorVerb.LINE);
        console.info(msg + ' drawing.PathIteratorVerb.QUAD: ' + drawing.PathIteratorVerb.QUAD);
        console.info(msg + ' drawing.PathIteratorVerb.CONIC: ' + drawing.PathIteratorVerb.CONIC);
        console.info(msg + ' drawing.PathIteratorVerb.CUBIC: ' + drawing.PathIteratorVerb.CUBIC);
        console.info(msg + ' drawing.PathIteratorVerb.CLOSE: ' + drawing.PathIteratorVerb.CLOSE);
        console.info(msg + ' drawing.PathIteratorVerb.DONE: ' + drawing.PathIteratorVerb.DONE);
        done()
      } catch (err) {
        console.log(msg + " Faild in drawing.PathIteratorVerb " + JSON.stringify(err))
        console.log(msg + " Faild in drawing.PathIteratorVerb " + err)
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_002
     * @tc.name      : testPathDashStyle
     * @tc.desc      : The property of drawing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPathDashStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = " ====testPathDashStyle==== "
      try {
        console.info(msg + ' Succeeded in PathDashStyle.');
        expect(drawing.PathDashStyle.TRANSLATE == 0).assertTrue()
        expect(drawing.PathDashStyle.ROTATE == 1).assertTrue()
        expect(drawing.PathDashStyle.MORPH == 2).assertTrue()
        console.info(msg + ' drawing.PathDashStyle.TRANSLATE: ' + drawing.PathDashStyle.TRANSLATE);
        console.info(msg + ' drawing.PathDashStyle.ROTATE: ' + drawing.PathDashStyle.ROTATE);
        console.info(msg + ' drawing.PathDashStyle.MORPH: ' + drawing.PathDashStyle.MORPH);
        done()
      } catch (err) {
        console.log(msg + " Faild in drawing.PathDashStyle " + JSON.stringify(err))
        console.log(msg + " Faild in drawing.PathDashStyle " + err)
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_003
     * @tc.name      : testPathIteratorNext
     * @tc.desc      : The Interface of drawing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPathIteratorNext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = " ====testPathIteratorNext==== "
      try {
        let path: drawing.Path = new drawing.Path();
        path.moveTo(10, 20);
        let iter: drawing.PathIterator = new drawing.PathIterator(path);
        let verbStr: Array<string> = ["MOVE", "LINE", "QUAD", "CONIC", "CUBIC", "CLOSE", "DONE"];
        let pointCount: Array<number> = [1,2,3,4,4,0,0]; //1,2,3,3.5,4,0,0
        let points: Array<common2D.Point> = [{x: 0, y: 0}, {x: 0, y: 0}, {x: 0, y: 0}, {x: 0, y: 0}];
        let offset = 0;
        let verb = iter.next(points, offset);
        console.info(msg + ' iter.next(points, offset): ' + verb);
        done()
      } catch (err) {
        console.log(msg + " Faild in PathIterator.next " + JSON.stringify(err))
        console.log(msg + " Faild in PathIterator.next " + err)
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_004
     * @tc.name      : testPathIteratorPeek
     * @tc.desc      : The Interface of drawing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPathIteratorPeek', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = " ====testPathIteratorPeek==== "
      try {
        let path: drawing.Path = new drawing.Path();
        let iter: drawing.PathIterator = new drawing.PathIterator(path);
        let res = iter.peek();
        console.info(msg + ' iter.peek(): ' + res);
        done()
      } catch (err) {
        console.log(msg + " Faild in PathIterator.peek " + JSON.stringify(err))
        console.log(msg + " Faild in PathIterator.peek " + err)
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_005
     * @tc.name      : testPathIteratorHasNext
     * @tc.desc      : The Interface of drawing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPathIteratorHasNext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = " ====testPathIteratorHasNext==== "
      try {
        let path: drawing.Path = new drawing.Path();
        let iter: drawing.PathIterator = new drawing.PathIterator(path);
        let res = iter.hasNext();
        console.info(msg + ' iter.hasNext(): ' + res);
        done()
      } catch (err) {
        console.log(msg + " Faild in PathIterator.hasNext " + JSON.stringify(err))
        console.log(msg + " Faild in PathIterator.hasNext " + err)
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_006
     * @tc.name      : testPathGetPathIterator
     * @tc.desc      : The Interface of drawing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPathGetPathIterator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = " ====testPathGetPathIterator==== "
      try {
        let path: drawing.Path = new drawing.Path();
        let iter = path.getPathIterator();
        console.info(msg + ' iter.getPathIterator(): ' + iter);
        console.info(msg + ' iter.getPathIterator(): ' + JSON.stringify(iter));
        done()
      } catch (err) {
        console.log(msg + " Faild in Path.getPathIterator " + JSON.stringify(err))
        console.log(msg + " Faild in Path.getPathIterator " + err)
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_007
     * @tc.name      : testPathEffectCreatePathDashEffect
     * @tc.desc      : The Interface of drawing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPathEffectCreatePathDashEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = " ====testPathEffectCreatePathDashEffect==== "
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      }
      image.createPixelMap(color, opts).then((pixelMap) => {
        const canvas = new drawing.Canvas(pixelMap);
        let pen = new drawing.Pen();
        const penColor: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 }
        pen.setColor(penColor);
        pen.setStrokeWidth(10);
        canvas.attachPen(pen);
        pen.setAntiAlias(true);

        const path = new drawing.Path();
        path.moveTo(100, 100);
        path.lineTo(150, 50);
        path.lineTo(200, 100);

        const path1 = new drawing.Path();
        path1.moveTo(0, 0);
        path1.lineTo(10, 0);
        path1.lineTo(20, 10);
        path1.lineTo(0,10);

        let pathEffect1: drawing.PathEffect = drawing.PathEffect.createPathDashEffect(path1, 50, -30,
            drawing.PathDashStyle.MORPH);
        pen.setPathEffect(pathEffect1);

        canvas.attachPen(pen);
        canvas.drawPath(path);
        canvas.detachPen();
        console.info(msg + ' drawing.PathEffect.createPathDashEffect: ' + pathEffect1);
        console.info(msg + ' drawing.PathEffect.createPathDashEffect: ' + JSON.stringify(pathEffect1));
        done()
      }).catch((err: BusinessError) => {
        console.log(msg + " Faild in drawing.PathEffect.createPathDashEffect " + JSON.stringify(err))
        console.log(msg + " Faild in drawing.PathEffect.createPathDashEffect " + err)
        expect().assertFail()
        done()
      })
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_008
     * @tc.name      : testPathEffectCreateSumPathEffect
     * @tc.desc      : The Interface of drawing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPathEffectCreateSumPathEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = " ====testPathEffectCreateSumPathEffect==== "
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      }
      image.createPixelMap(color, opts).then((pixelMap) => {
        const canvas = new drawing.Canvas(pixelMap);
        let intervals = [10, 5];
        let pathEffectOne = drawing.PathEffect.createDashPathEffect(intervals, 5);
        let pathEffectTwo = drawing.PathEffect.createDashPathEffect(intervals, 10);
        let effect = drawing.PathEffect.createSumPathEffect(pathEffectOne, pathEffectTwo);
        console.info(msg + ' drawing.PathEffect.createSumPathEffect: ' + effect);
        console.info(msg + ' drawing.PathEffect.createSumPathEffect: ' + JSON.stringify(effect));
        done()
      }).catch((err: BusinessError) => {
        console.log(msg + " Faild in drawing.PathEffect.createSumPathEffect " + JSON.stringify(err))
        console.log(msg + " Faild in drawing.PathEffect.createSumPathEffect " + err)
        expect().assertFail()
        done()
      })
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_009
     * @tc.name      : testPathEffectCreateDiscretePathEffect
     * @tc.desc      : The Interface of drawing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPathEffectCreateDiscretePathEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = " ====testPathEffectCreateDiscretePathEffect==== "
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      }
      image.createPixelMap(color, opts).then((pixelMap) => {
        const canvas = new drawing.Canvas(pixelMap);
        let effect = drawing.PathEffect.createDiscretePathEffect(100, -50, 0);
        console.info(msg + ' drawing.PathEffect.createDiscretePathEffect: ' + effect);
        console.info(msg + ' drawing.PathEffect.createDiscretePathEffect: ' + JSON.stringify(effect));
        done()
      }).catch((err: BusinessError) => {
        console.log(msg + " Faild in drawing.PathEffect.createDiscretePathEffect " + JSON.stringify(err))
        console.log(msg + " Faild in drawing.PathEffect.createDiscretePathEffect " + err)
        expect().assertFail()
        done()
      })
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_010
     * @tc.name      : testPathEffectCreateComposePathEffect
     * @tc.desc      : The Interface of drawing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPathEffectCreateComposePathEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = " ====testPathEffectCreateComposePathEffect==== "
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4,
          width: 6
        }
      }
      image.createPixelMap(color, opts).then((pixelMap) => {
        const canvas = new drawing.Canvas(pixelMap);
        let pathEffect1 = drawing.PathEffect.createCornerPathEffect(100);
        let pathEffect2 = drawing.PathEffect.createCornerPathEffect(10);
        let effect = drawing.PathEffect.createComposePathEffect(pathEffect1, pathEffect2);
        console.info(msg + ' drawing.PathEffect.createComposePathEffect: ' + effect);
        console.info(msg + ' drawing.PathEffect.createComposePathEffect: ' + JSON.stringify(effect));
        done()
      }).catch((err: BusinessError) => {
        console.log(msg + " Faild in drawing.PathEffect.createComposePathEffect " + JSON.stringify(err))
        console.log(msg + " Faild in drawing.PathEffect.createComposePathEffect " + err)
        expect().assertFail()
        done()
      })
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_011
     * @tc.name      : testPenGetHexColor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenGetHexColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = " ====testPenGetHexColor==== "
      try {
        let color : common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
        let pen = new drawing.Pen();
        pen.setColor(color);
        let hex_color: number = pen.getHexColor();
        console.info(msg + ' getHexColor:  ', hex_color.toString(16));
        console.info(msg + ' pen.getHexColor: ' + JSON.stringify(hex_color));
        done()
      } catch (err) {
        console.log(msg + " Faild in pen.getHexColor " + JSON.stringify(err))
        console.log(msg + " Faild in pen.getHexColor " + err)
        expect().assertFail()
        done()
      }
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_011
     * @tc.name      : testBrushGetHexColor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushGetHexColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = " ====testBrushGetHexColor==== "
      try {
        let color : common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
        let brush = new drawing.Brush();
        brush.setColor(color);
        let hex_color: number = brush.getHexColor();
        console.info(msg + ' brush.getHexColor:  ', hex_color.toString(16));
        console.info(msg + ' brush.getHexColor: ' + JSON.stringify(hex_color));
        done()
      } catch (err) {
        console.log(msg + " Faild in brush.getHexColor " + JSON.stringify(err))
        console.log(msg + " Faild in brush.getHexColor " + err)
        expect().assertFail()
        done()
      }
    })
    
  })
}
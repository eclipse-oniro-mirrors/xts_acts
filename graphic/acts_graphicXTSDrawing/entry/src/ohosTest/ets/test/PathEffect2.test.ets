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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text";
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image';

export default function PathEffect2() {

  describe('PathEffect2', () => {
    let myColor: common2D.Color;
    beforeAll(() => {
      myColor = { alpha: 255, red: 255, green: 0, blue: 0 };
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0100
     * @tc.desc   The property of PathDashStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
        console.log(msg + " Failed in drawing.PathDashStyle " + JSON.stringify(err))
        console.log(msg + " Failed in drawing.PathDashStyle " + err)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0200
     * @tc.desc   The Interface of drawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let msg = " ====testPathEffectCreateDiscretePathEffect==== "
        const color = new ArrayBuffer(96);
        let opts : image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: {
            height: 4,
            width: 6
          }
        }
        image.createPixelMap(color, opts).then((pixelMap) => {
          const canvas = new drawing.Canvas(pixelMap);
          let effect = drawing.PathEffect.createDiscretePathEffect(100, -50, 0);
          console.info(msg + ' drawing.PathEffect.createDiscretePathEffect: ' + effect);
          done()
        }).catch((err) => {
          console.log(msg + " Failed in drawing.PathEffect.createDiscretePathEffect " + err)
          expect().assertFail()
          done()
        })
      })
    /**
     * @tc.name   testPathEffectCreateDiscretePathEffectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0201
     * @tc.desc   The Interface of createDiscretePathEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPathEffectCreateDiscretePathEffectNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let msg = " ====testPathEffectCreateDiscretePathEffectNull==== "
        try {
          let effect = drawing.PathEffect.createDiscretePathEffect(null, -50, 0);
          console.info(msg + ' 1 drawing.PathEffect.createDiscretePathEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 1 createDiscretePathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
        try {
          let effect = drawing.PathEffect.createDiscretePathEffect(undefined, -50, 0);
          console.info(msg + ' 2 drawing.PathEffect.createDiscretePathEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 2 createDiscretePathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
        try {
          let effect = drawing.PathEffect.createDiscretePathEffect(100, null, 0);
          console.info(msg + ' 3 drawing.PathEffect.createDiscretePathEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 3 createDiscretePathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
        try {
          let effect = drawing.PathEffect.createDiscretePathEffect(100, undefined, 0);
          console.info(msg + ' 4 drawing.PathEffect.createDiscretePathEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 4 createDiscretePathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
        try {
          let effect = drawing.PathEffect.createDiscretePathEffect(100, -50, null);
          console.info(msg + ' 5 drawing.PathEffect.createDiscretePathEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 5 createDiscretePathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
        try {
          let effect = drawing.PathEffect.createDiscretePathEffect(100, -50, undefined);
          console.info(msg + ' 6 drawing.PathEffect.createDiscretePathEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 6 createDiscretePathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
      })
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0300
     * @tc.desc   The Interface of drawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let msg = " ====testPathEffectCreateComposePathEffect==== "
        const color = new ArrayBuffer(96);
        let opts : image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: {
            height: 4,
            width: 6
          }
        }
        image.createPixelMap(color, opts).then((pixelMap) => {
          const canvas = new drawing.Canvas(pixelMap);
          let pathEffect1 = drawing.PathEffect.createCornerPathEffect(100);
          let pathEffect2 = drawing.PathEffect.createCornerPathEffect(10);
          if (pathEffect1 != undefined && pathEffect2 != undefined){
            let effect = drawing.PathEffect.createComposePathEffect(pathEffect1, pathEffect2);
            console.info(msg + ' drawing.PathEffect.createComposePathEffect: ' + effect);
          }else{
            expect().assertFail()
          }
          done()
        }).catch((err) => {
          console.log(msg + " Failed in drawing.PathEffect.createComposePathEffect " + err)
          expect().assertFail()
          done()
        })
      })
    /**
     * @tc.name   testPathEffectCreateComposePathEffectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0301
     * @tc.desc   The Interface of testPathEffectCreateComposePathEffectNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPathEffectCreateComposePathEffectNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = " ====testPathEffectCreateComposePathEffectNull==== "
      let pathEffect1 = drawing.PathEffect.createCornerPathEffect(100);
      let pathEffect2 = drawing.PathEffect.createCornerPathEffect(10);
      try {
        let effect = drawing.PathEffect.createComposePathEffect(null, pathEffect2);
        console.info(msg + ' 1 drawing.PathEffect.createComposePathEffect success ');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 1 createComposePathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let effect = drawing.PathEffect.createComposePathEffect(undefined, pathEffect2);
        console.info(msg + ' 2 drawing.PathEffect.createComposePathEffect success ');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 2 createComposePathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let effect = drawing.PathEffect.createComposePathEffect(pathEffect1, null);
        console.info(msg + ' 3 drawing.PathEffect.createComposePathEffect success ');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 3 createComposePathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let effect = drawing.PathEffect.createComposePathEffect(pathEffect1, undefined);
        console.info(msg + ' 4 drawing.PathEffect.createComposePathEffect success ');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 4 createComposePathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0400
     * @tc.desc   The Interface of drawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let msg = " ====testPathEffectCreateSumPathEffect==== "
        const color = new ArrayBuffer(96);
        let opts : image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
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
          if (pathEffectOne != undefined && pathEffectTwo != undefined){
            let effect = drawing.PathEffect.createSumPathEffect(pathEffectOne, pathEffectTwo);
            console.info(msg + ' drawing.PathEffect.createSumPathEffect: ' + effect);
          }else{
            expect().assertFail()
          }
          done()
        }).catch((err) => {
          console.log(msg + " Failed in drawing.PathEffect.createSumPathEffect " + err)
          expect().assertFail()
          done()
        })
      })
    /**
     * @tc.name   testPathEffectCreateSumPathEffectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0401
     * @tc.desc   The Interface of testPathEffectCreateSumPathEffectNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPathEffectCreateSumPathEffectNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let msg = " ====testPathEffectCreateSumPathEffectNull==== ";
      let intervals = [10, 5];
      let pathEffectOne = drawing.PathEffect.createDashPathEffect(intervals, 5);
      let pathEffectTwo = drawing.PathEffect.createDashPathEffect(intervals, 10);
      try {
        drawing.PathEffect.createSumPathEffect(null, pathEffectTwo);
        console.info(msg + ' 1 drawing.PathEffect.createSumPathEffect success ');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 1 createSumPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.PathEffect.createSumPathEffect(undefined, pathEffectTwo);
        console.info(msg + ' 2 drawing.PathEffect.createSumPathEffect success ');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 2 createSumPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.PathEffect.createSumPathEffect(pathEffectOne, null);
        console.info(msg + ' 3 drawing.PathEffect.createSumPathEffect success ');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 3 createSumPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.PathEffect.createSumPathEffect(pathEffectOne, undefined);
        console.info(msg + ' 4 drawing.PathEffect.createSumPathEffect success ');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 4 createSumPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0500
     * @tc.desc   The Interface of drawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0500',
     TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
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
        let pathEffect2: drawing.PathEffect = drawing.PathEffect.createPathDashEffect(path1, 50, -30,
          drawing.PathDashStyle.TRANSLATE);
        let pathEffect3: drawing.PathEffect = drawing.PathEffect.createPathDashEffect(path1, 50, -30,
          drawing.PathDashStyle.ROTATE);
        pen.setPathEffect(pathEffect1);

        canvas.attachPen(pen);
        canvas.drawPath(path);
        canvas.detachPen();
        console.info(msg + ' drawing.PathEffect.createPathDashEffect: ' + pathEffect1);
        console.info(msg + ' drawing.PathEffect.createPathDashEffect: ' + JSON.stringify(pathEffect1));
        done()
      }).catch((err: BusinessError) => {
        console.log(msg + " Failed in drawing.PathEffect.createPathDashEffect " + JSON.stringify(err))
        console.log(msg + " Failed in drawing.PathEffect.createPathDashEffect " + err)
        expect().assertFail()
        done()
      })
    })
    /**
     * @tc.name   estPathEffectCreatePathDashEffectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_0501
     * @tc.desc   The Interface of drawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('estPathEffectCreatePathDashEffectNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let msg = " ====estPathEffectCreatePathDashEffectNull==== ";
        const path1 = new drawing.Path();
        try {
          let effect = drawing.PathEffect.createPathDashEffect(null, 50, -30, drawing.PathDashStyle.MORPH);
          console.info(msg + ' 1 drawing.PathEffect.createPathDashEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 1 createPathDashEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
        try {
          let effect = drawing.PathEffect.createPathDashEffect(undefined, 50, -30, drawing.PathDashStyle.TRANSLATE);
          console.info(msg + ' 2 drawing.PathEffect.createPathDashEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 2 createPathDashEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
        try {
          let effect = drawing.PathEffect.createPathDashEffect(path1, null, -30, drawing.PathDashStyle.ROTATE);
          console.info(msg + ' 3 drawing.PathEffect.createPathDashEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 3 createPathDashEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
        try {
          let effect = drawing.PathEffect.createPathDashEffect(path1, undefined, -30, drawing.PathDashStyle.MORPH);
          console.info(msg + ' 4 drawing.PathEffect.createPathDashEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 4 createPathDashEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
        try {
          let effect = drawing.PathEffect.createPathDashEffect(path1, 50, null, drawing.PathDashStyle.MORPH);
          console.info(msg + ' 5 drawing.PathEffect.createPathDashEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 5 createPathDashEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
        try {
          let effect = drawing.PathEffect.createPathDashEffect(path1, 50, undefined, drawing.PathDashStyle.MORPH);
          console.info(msg + ' 6 drawing.PathEffect.createPathDashEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 6 createPathDashEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
        try {
          let effect = drawing.PathEffect.createPathDashEffect(path1, 50, -30, null);
          console.info(msg + ' 7 drawing.PathEffect.createPathDashEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 7 createPathDashEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
        try {
          let effect = drawing.PathEffect.createPathDashEffect(path1, 50, -30, undefined);
          console.info(msg + ' 8 drawing.PathEffect.createPathDashEffect success ');
          expect().assertFail();
        } catch (e) {
          console.info(msg + ` 8 createPathDashEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
      })
  })
}

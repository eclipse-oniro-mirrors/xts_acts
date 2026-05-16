/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import { getEnumCount, getRandomNumber } from './Util.test';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function shadowEffectTest() {
  describe('DrawingTsShadowEffectTest', () => {
    let pixel: image.PixelMap;
    let pixelMap: image.PixelMap;

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async() => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小,取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 100,
          width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
      pixelMap = await image.createPixelMap(color, opts);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testShaderEffectCreateColorShaderNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0200
     * @tc.desc   Test for testShaderEffectCreateColorShaderNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateColorShaderNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateColorShaderNormalStatic';

      try {
        let shaderEffect = drawing.ShaderEffect.createColorShader(0x00000000);
        console.info(msg + ' createColorShader successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createColorShader(0xFFFFFFFF.toInt());
        console.info(msg + ' createColorShader successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateColorShaderMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0201
     * @tc.desc   Test for testShaderEffectCreateColorShaderMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateColorShaderMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateColorShaderMultipleCallsStatic';

      try {
        let color = 0x00000000
        for ( let i = 0 ; i < 20 ; i ++ ) {
          ++ color;
          let shaderEffect = drawing.ShaderEffect.createColorShader(color);
          console.info(msg + ' createColorShader successed,shaderEffect:' + JSON.stringify(shaderEffect));
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testShaderEffectCreateLinearGradientNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0300
     * @tc.desc   Test for testShaderEffectCreateLinearGradientNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateLinearGradientNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateLinearGradientNormalStatic';
      let matrix = new drawing.Matrix();

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100, y: 100}, {x: 300, y: 300}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT);
        console.info(msg + ' createLinearGradient create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
        shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100, y: 100}, {x: 300, y: 300}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.CLAMP);
        console.info(msg + ' createLinearGradient create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
        shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100, y: 100}, {x: 300, y: 300}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.MIRROR);
        console.info(msg + ' createLinearGradient create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
        shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100, y: 100}, {x: 300, y: 300}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.DECAL);
        console.info(msg + ' createLinearGradient1 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 4 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearGradient1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,null,null);
        console.info(msg + ' createLinearGradient2 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 5 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearGradient2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,null);
        console.info(msg + ' createLinearGradient3 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 6 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearGradient3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.2,3]);
        console.info(msg + ' createLinearGradient4 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 7 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearGradient4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.2,3], matrix);
        console.info(msg + ' createLinearGradient5 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 8 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearGradient5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.2,3], matrix);
        console.info(msg + ' createLinearGradient6 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 9 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearGradient6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: -100.1, y: -100.1}, {x: 300.1, y: 300.1}, [0xFF00FF00.toInt()], drawing.TileMode.REPEAT,[0.2], matrix);
        console.info(msg + ' createLinearGradient7 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 10 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearGradient7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createLinearGradient(
          {x: Math.random() * Number.MAX_VALUE, y: Math.random() * Number.MAX_VALUE},
          {x: Math.random() * Number.MAX_VALUE, y:Math.random() * Number.MAX_VALUE},
          [0xFF00FF00.toInt(),0xFF00FF00.toInt()], drawing.TileMode.REPEAT,[0,2], matrix);
        console.info(msg + ' createLinearGradient8 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 11 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearGradient8 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: -100.1}, {x: 100.1, y: -100.1}, [], drawing.TileMode.REPEAT,[], matrix);
        console.info(msg + ' createLinearGradient9 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        if(shaderEffect == undefined){
          console.info(msg + ' 12 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearGradient9 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateLinearGradientMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0301
     * @tc.desc   Test for testShaderEffectCreateLinearGradientMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateLinearGradientMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateLinearGradientMultipleCallsStatic';
      let itemList: drawing.TileMode[] = [
        drawing.TileMode.CLAMP,
        drawing.TileMode.REPEAT,
        drawing.TileMode.DECAL,
        drawing.TileMode.MIRROR
      ];
      try {
        let matrix = new drawing.Matrix();
        const randomEnum = Math.floor(4 * Math.random()).toInt();
        for ( let i = 0 ; i < 20 ; i ++ ) {
          let shaderEffect = drawing.ShaderEffect.createLinearGradient(
            {x : Math.random() * Number.MAX_VALUE, y : Math.random() * Number.MAX_VALUE},
            {x : Math.random() * Number.MAX_VALUE, y : Math.random() * Number.MAX_VALUE},
            [ 0xFF00FF00.toInt(), 0xFFFF0000.toInt() ], itemList[randomEnum], [ getRandomNumber(0,100), getRandomNumber(0,100)], matrix);
          console.info(msg + ' createLinearGradient create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testShaderEffectCreateLinearGradientToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0302
     * @tc.desc   Test for testShaderEffectCreateLinearGradientToNullStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateLinearGradientToNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateLinearGradientToNullStatic';
      try {
        let matrix = new drawing.Matrix();
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1},
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,undefined, matrix);
        console.info(msg + ` createLinearGradient create 1 successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` create errorCode 1 is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1},
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.9], undefined);
        console.info(msg + ` createLinearGradient create 2 successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` create errorCode 2 is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1},
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,null, matrix);
        console.info(msg + ` createLinearGradient create 3 successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` create errorCode 3 is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1},
          [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.9], null);
        console.info(msg + ` createLinearGradient create 4 successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` create errorCode 4 is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateLinearGradientAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0304
     * @tc.desc   Test for testShaderEffectCreateLinearGradientAbNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateLinearGradientAbNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateLinearGradientAbNormalStatic';
      try {
        drawing.ShaderEffect.createLinearGradient({x : 100, y : 100}, {x : 300, y : 300}, [ 0xFFFFFFFF.toInt() + 1, 0xFFFF0000.toInt() ], drawing.TileMode.REPEAT);
        console.info(msg + ' createLinearGradient successed');
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createLinearGradient({x : 100, y : 100}, {x : 300, y : 300}, [ - 1, 0xFFFF0000.toInt() ], drawing.TileMode.REPEAT);
        console.info(msg + ' createLinearGradient successed');
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testShaderEffectCreateRadialGradientNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0400
     * @tc.desc   Test for testShaderEffectCreateRadialGradientNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateRadialGradientNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateRadialGradientNormalStatic';
      let matrix = new drawing.Matrix();

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100, y: 100}, 100, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT);
        console.info(msg + ' createRadialGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
        shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100, y: 100}, 100, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.CLAMP);
        console.info(msg + ' createRadialGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
        shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100, y: 100}, 100, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.MIRROR);
        console.info(msg + ' createRadialGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
        shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100, y: 100}, 100, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.DECAL);
        console.info(msg + ' createRadialGradient1 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 4 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 100.1, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,null,null);
        console.info(msg + ' createRadialGradient2 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 5 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 100, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,null);
        console.info(msg + ' createRadialGradient3 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 6 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.9]);
        console.info(msg + ' createRadialGradient4 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 7 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 80, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.9],matrix);
        console.info(msg + ' createRadialGradient5 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 8 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1},50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.9],matrix);
        console.info(msg + ' createRadialGradient6 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 9 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: -100.1, y: -100.1}, 100, [0xFF00FF00.toInt(),0xFF00FF00.toInt()], drawing.TileMode.REPEAT,[0.1,0.9],matrix);
        console.info(msg + ' createRadialGradient7 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 10 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: Number.MAX_VALUE, y: Number.MAX_VALUE}, Number.MAX_VALUE, [0xFF00FF00.toInt(),0xFF00FF00.toInt()], drawing.TileMode.REPEAT,[0.1,0.9],matrix);
        console.info(msg + ' createRadialGradient8 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 11 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient8 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1},100, [0xFF00FF00.toInt(),0xFF00FF00.toInt()], drawing.TileMode.REPEAT,[],matrix);
        console.info(msg + ' createRadialGradient9 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 12 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient9 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1},100, [0xFF00FF00.toInt(),0xFF00FF00.toInt(),0xFF00FF00.toInt()], drawing.TileMode.REPEAT,[0.1,0.9,10],matrix);
        console.info(msg + ' createRadialGradient10 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 13 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient10 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 50, [], drawing.TileMode.REPEAT,[],matrix);
        console.info(msg + ' createRadialGradient11 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 14 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient11 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 0, [0xFF00FF00.toInt(),0xFF00FF00.toInt()], drawing.TileMode.REPEAT,[0.1,0.9],matrix);
        console.info(msg + ' createRadialGradient12 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 15 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient12 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, -1, [0xFF00FF00.toInt(),0xFF00FF00.toInt()], drawing.TileMode.REPEAT,[0.1,0.9],matrix);
        console.info(msg + ' createRadialGradient13 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 16 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient13 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateRadialGradientMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0401
     * @tc.desc   Test for testShaderEffectCreateRadialGradientMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateRadialGradientMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateRadialGradientMultipleCallsStatic';
      let itemList: drawing.TileMode[] = [
        drawing.TileMode.CLAMP,
        drawing.TileMode.REPEAT,
        drawing.TileMode.DECAL,
        drawing.TileMode.MIRROR
      ];
      try {
        let matrix = new drawing.Matrix();
        const randomEnum = Math.floor(4 * Math.random()).toInt();
        for ( let i = 0 ; i < 20 ; i ++ ) {
          let shaderEffect = drawing.ShaderEffect.createRadialGradient(
            {x: Math.random() * Number.MAX_VALUE, y: Math.random() * Number.MAX_VALUE}, Math.random() * Number.MAX_VALUE,
             [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], itemList[randomEnum],[Math.random() * Number.MAX_VALUE,Math.random() * Number.MAX_VALUE], matrix);
          console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateRadialGradientToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0402
     * @tc.desc   Test for testShaderEffectCreateRadialGradientToNullStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateRadialGradientToNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateRadialGradientToNullStatic';
      let matrix = new drawing.Matrix();
      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 80, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,undefined,matrix);
        console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1},50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.9],undefined);
        console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testShaderEffectCreateSweepGradientNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0500
     * @tc.desc   Test for testShaderEffectCreateSweepGradientNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateSweepGradientNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateSweepGradientNormalStatic';
      let matrix_ = new drawing.Matrix();
      let matrix = new drawing.Matrix();
      matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x: 100, y: 100}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,100,200);
        console.info(msg + ' createSweepGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
        shaderEffect = drawing.ShaderEffect.createSweepGradient({x: 100, y: 100}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.CLAMP,100,200);
        console.info(msg + ' createSweepGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
        shaderEffect = drawing.ShaderEffect.createSweepGradient({x: 100, y: 100}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.MIRROR,100,200);
        console.info(msg + ' createSweepGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
        shaderEffect = drawing.ShaderEffect.createSweepGradient({x: 100, y: 100}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.DECAL,100,200);
        console.info(msg + ' createSweepGradient1 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 4 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00.toInt(),0xFFFF0000.toInt()],drawing.TileMode.REPEAT,0,360,null,null);
        console.info(msg + ' createSweepGradient2 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 5 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:-100.1,y:100.1},[0xFF00FF00.toInt(),0xFFFF0000.toInt()],drawing.TileMode.REPEAT,360,0,null,null);
        console.info(msg + ' createSweepGradient3 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 6 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:-100.1,y:100.1},[0xFF00FF00.toInt(),0xFFFF0000.toInt()],drawing.TileMode.REPEAT,180.1,180.1,null);
        console.info(msg + ' createSweepGradient4 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 7 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:-100.1},[0xFF00FF00.toInt(),0xFFFF0000.toInt()],drawing.TileMode.REPEAT,180.1,180.1,[0.1,0.9]);
        console.info(msg + ' createSweepGradient5 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 8 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:-100.1,y:-100.1},[0xFF00FF00.toInt(),0xFFFF0000.toInt()],drawing.TileMode.REPEAT,30,90,[0.1,0.9],matrix_);
        console.info(msg + ' createSweepGradient6 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 9 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:-100.1,y:100.1},[0xFF00FF00.toInt(),0xFFFF0000.toInt()],drawing.TileMode.REPEAT,30,90,[2,0.9],matrix);
        console.info(msg + ' createSweepGradient7 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 10 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00.toInt(),0xFF00FF00.toInt()],drawing.TileMode.REPEAT,30,90,[0.1,0.9,5],matrix);
        console.info(msg + ' createSweepGradient8 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 11 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient8 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00.toInt(),0xFF00FF00.toInt()],drawing.TileMode.REPEAT,30,90,[],matrix);
        console.info(msg + ' createSweepGradient9 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 12 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient9 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect=drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00.toInt(),0xFF00FF00.toInt()],drawing.TileMode.REPEAT,-30,90,[0.1,0.9],matrix);
        console.info(msg + ' createSweepGradient10 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 13 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient10 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00.toInt(),0xFF00FF00.toInt()],drawing.TileMode.REPEAT,361,90,[0.1,0.9],matrix);
        console.info(msg + ' createSweepGradient11 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 14 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient11 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00.toInt(),0xFF00FF00.toInt()],drawing.TileMode.REPEAT,90,-30,[0.1,0.9],matrix);
        console.info(msg + ' createSweepGradient12 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 15 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient12 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect= drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00.toInt(),0xFF00FF00.toInt()],drawing.TileMode.REPEAT,90,361,[0.1,0.9],matrix);
        console.info(msg + ' createSweepGradient13 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 16 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient13 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[],drawing.TileMode.REPEAT,90,90,[],matrix);
        console.info(msg + ' createSweepGradient14 successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 17 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient14 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateSweepGradientMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0501
     * @tc.desc   Test for testShaderEffectCreateSweepGradientMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateSweepGradientMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateSweepGradientMultipleCallsStatic';
      let matrix_ = new drawing.Matrix();

      try {
        for ( let i = 0 ; i < 20 ; i ++ ) {
          let shaderEffect = drawing.ShaderEffect.createSweepGradient(
              {x : Math.random() * Number.MAX_VALUE, y : Math.random() * Number.MAX_VALUE},
            [ 0xFF00FF00.toInt(), 0xFFFF0000.toInt() ], drawing.TileMode.REPEAT, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            [ Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE ], matrix_);
          console.info(msg + ' createSweepGradient successed,shaderEffect:' + shaderEffect);
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testShaderEffectCreateSweepGradientToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0502
     * @tc.desc   Test for testShaderEffectCreateSweepGradientToNullStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateSweepGradientToNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateSweepGradientToNullStatic';
      let matrix_ = new drawing.Matrix();
      try {
        drawing.ShaderEffect.createSweepGradient({x:100,y:100},[0xFF00FF00.toInt(),0xFFFF0000.toInt()],drawing.TileMode.REPEAT,30,90,undefined,matrix_);
        console.info(msg + ' createSweepGradient11 successed');
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient11 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createSweepGradient({x:100,y:100},[0xFF00FF00.toInt(),0xFFFF0000.toInt()],drawing.TileMode.REPEAT,30,90,[0.1,0.9],undefined);
        console.info(msg + ' createSweepGradient12 successed');
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSweepGradient12 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testShaderEffectCreateConicalGradientNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0600
     * @tc.desc   Test for testShaderEffectCreateConicalGradientNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateConicalGradientNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateConicalGradientNormalStatic';
      let matrix_ = new drawing.Matrix();
      let matrix = new drawing.Matrix();
      matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200, y: 200}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
        shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200, y: 200}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.CLAMP);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
        shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200, y: 200}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.MIRROR);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
        shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200, y: 200}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.DECAL);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 4 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: -100, y: -100}, 100, {x: 200, y: 200}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT, null);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 5 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,null,null);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 6 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.3],null);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 7 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.3],matrix_);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 8 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.3],matrix);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 9 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.3,0.6],matrix);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 10 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [], drawing.TileMode.REPEAT,[],matrix);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 11 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,2],matrix);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 12 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, -1, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.3],matrix_);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 13 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1},0, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.3],matrix_);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 14 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, -1, {x: 200.1, y: 200.1}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.3],matrix_);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 15 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 0, {x: 200.1, y: 200.1}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.3],matrix_);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        if(shaderEffect == undefined){
          console.info(msg + ' 16 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateConicalGradientMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0601
     * @tc.desc   Test for testShaderEffectCreateConicalGradientMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateConicalGradientMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateConicalGradientMultipleCallsStatic';

      try {
        let matrix_ = new drawing.Matrix();
        for ( let i = 0 ; i < 20 ; i ++ ) {
          let shaderEffect = drawing.ShaderEffect.createConicalGradient(
            {x : Math.random() * Number.MAX_VALUE, y : Math.random() * Number.MAX_VALUE},Math.random() * Number.MAX_VALUE,
            {x : Math.random() * Number.MAX_VALUE, y : Math.random() * Number.MAX_VALUE},Math.random() * Number.MAX_VALUE,
            [0xFF00FF00.toInt(), 0xFFFF0000.toInt()],  drawing.TileMode.REPEAT, [ Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE ], matrix_);
          console.info(msg + ' create createConicalGradient,shaderEffect:'+shaderEffect);
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateConicalGradientToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_STATIC_0602
     * @tc.desc   Test for testShaderEffectCreateConicalGradientToNullStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateConicalGradientToNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateConicalGradientToNullStatic';
      let matrix_ = new drawing.Matrix();
      let matrix = new drawing.Matrix();
      matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,undefined,matrix);
        console.info(msg + ' createConicalGradient successed');
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT,[0.1,0.3,0.6],undefined);
        console.info(msg + ' createConicalGradient successed');
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
  })
}
/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import uiEffect from '@ohos.graphics.uiEffect';
import { getEnumCount, getRandomNumber } from './utils';
import common2D from '@ohos.graphics.common2D';

export default function shadowEffectTest() {
  describe('DrawingTsShadowEffectTest', () => {
    let pixel: image.PixelMap;
    const DEFAULT = 0;
    let pixelMap: image.PixelMap;

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async() => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小,取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable : true, pixelFormat : 3, size : {
          height : 100, width : 100
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
     * @tc.name   testShaderEffectCreateColorShaderNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0200
     * @tc.desc   Test for testShaderEffectCreateColorShaderNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateColorShaderNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateColorShaderNormal';

      try {
        let shaderEffect = drawing.ShaderEffect.createColorShader(0x00000000);
        console.info(msg + ' createColorShader successed,shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createColorShader(0xFFFFFFFF);
        console.info(msg + ' createColorShader successed,shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateColorShaderMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0201
     * @tc.desc   Test for testShaderEffectCreateColorShaderMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateColorShaderMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateColorShaderMultipleCalls';

      try {
        let color = 0x00000000
        for ( let i = 0 ; i < 20 ; i ++ ) {
          ++ color;
          let shaderEffect = drawing.ShaderEffect.createColorShader(color);
          console.info(msg + ' createColorShader successed,shaderEffect:' + JSON.stringify(shaderEffect));
        }
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateColorShaderToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0202
     * @tc.desc   Test for testShaderEffectCreateColorShaderToNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateColorShaderToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateColorShaderToNull';

      try {
        drawing.ShaderEffect.createColorShader(null);
        console.info(msg + ' createColorShader successed');
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createColorShader(undefined);
        console.info(msg + ' createColorShader successed');
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testShaderEffectCreateLinearGradientNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0300
     * @tc.desc   Test for testShaderEffectCreateLinearGradientNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateLinearGradientNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateLinearGradientNormal';
      let matrix = new drawing.Matrix();

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100, y: 100}, {x: 300, y: 300}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT);
        console.info(msg + ' createLinearGradient create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100, y: 100}, {x: 300, y: 300}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.CLAMP);
        console.info(msg + ' createLinearGradient create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100, y: 100}, {x: 300, y: 300}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.MIRROR);
        console.info(msg + ' createLinearGradient create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100, y: 100}, {x: 300, y: 300}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.DECAL);
        console.info(msg + ' createLinearGradient1 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createLinearGradient1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,null,null);
        console.info(msg + ' createLinearGradient2 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createLinearGradient2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,null);
        console.info(msg + ' createLinearGradient3 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createLinearGradient3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.2,3]);
        console.info(msg + ' createLinearGradient4 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createLinearGradient4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.2,3], matrix);
        console.info(msg + ' createLinearGradient5 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createLinearGradient5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.2,3], matrix);
        console.info(msg + ' createLinearGradient6 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createLinearGradient6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: -100.1, y: -100.1}, {x: 300.1, y: 300.1}, [0xFF00FF00], drawing.TileMode.REPEAT,[0.2], matrix);
        console.info(msg + ' createLinearGradient7 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createLinearGradient7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createLinearGradient(
          {x: Math.random() * Number.MAX_VALUE, y: Math.random() * Number.MAX_VALUE},
          {x: Math.random() * Number.MAX_VALUE, y:Math.random() * Number.MAX_VALUE},
          [0xFF00FF00,0xFF00FF00], drawing.TileMode.REPEAT,[0,2], matrix);
        console.info(msg + ' createLinearGradient8 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createLinearGradient8 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: -100.1}, {x: 100.1, y: -100.1}, [], drawing.TileMode.REPEAT,[], matrix);
        console.info(msg + ' createLinearGradient9 create successed,shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createLinearGradient9 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let matrix = new drawing.Matrix();
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x : 100.1, y : 100.1}, {x : 300.1, y : 300.1},
          [], drawing.TileMode.REPEAT, [0.1,0.9], matrix);
        console.info(msg + ` [] createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` [] create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateLinearGradientMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0301
     * @tc.desc   Test for testShaderEffectCreateLinearGradientMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateLinearGradientMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateLinearGradientMultipleCalls';

      try {
        let matrix = new drawing.Matrix();
        const randomEnum = Math.floor(Math.random() * (getEnumCount(drawing.TileMode)));
        for ( let i = 0 ; i < 20 ; i ++ ) {
          let shaderEffect = drawing.ShaderEffect.createLinearGradient(
            {x : Math.random() * Number.MAX_VALUE, y : Math.random() * Number.MAX_VALUE},
            {x : Math.random() * Number.MAX_VALUE, y : Math.random() * Number.MAX_VALUE},
            [ 0xFF00FF00, 0xFFFF0000 ], randomEnum, [ getRandomNumber(0,100), getRandomNumber(0,100)], matrix);
          console.info(msg + ' createLinearGradient create successed,shaderEffect:' + JSON.stringify(shaderEffect));
        }
      } catch( e ) {
        console.info(msg + ` createLinearGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testShaderEffectCreateLinearGradientToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0302
     * @tc.desc   Test for testShaderEffectCreateLinearGradientToNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateLinearGradientToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateLinearGradientToNull';

      try {
        let matrix = new drawing.Matrix();
        let shaderEffect = drawing.ShaderEffect.createLinearGradient(null, {x : 300.1, y : 300.1},
          [ 0xFF00FF00, 0xFFFF0000 ], drawing.TileMode.REPEAT, [0.1,0.9], matrix);
        console.info(msg + ` createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createLinearGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x : 100.1, y : 100.1}, null,
          [ 0xFF00FF00, 0xFFFF0000 ], drawing.TileMode.REPEAT, [0.1,0.9], matrix);
        console.info(msg + ` createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x : 100.1, y : 100.1}, {x : 300.1, y : 300.1},
          null, drawing.TileMode.REPEAT, [0.1,0.9], matrix);
        console.info(msg + ` createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x : 100.1, y : 100.1}, {x : 300.1, y : 300.1},
          [ 0xFF00FF00, 0xFFFF0000 ], null, null, null);
        console.info(msg + ` createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let shaderEffect = drawing.ShaderEffect.createLinearGradient(undefined, {x: 300.1, y: 300.1},
          [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.9], matrix);
        console.info(msg + ` createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, undefined,
          [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.9], matrix);
        console.info(msg + ` createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1},
          undefined, drawing.TileMode.REPEAT,[0.1,0.9], matrix);
        console.info(msg + ` createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1},
          [0xFF00FF00, 0xFFFF0000], undefined,null, null);
        console.info(msg + ` createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1},
        [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,undefined, matrix);
        console.info(msg + ` createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1},
          [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.9], undefined);
        console.info(msg + ` createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testShaderEffectCreateLinearGradientAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0304
     * @tc.desc   Test for testShaderEffectCreateLinearGradientAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateLinearGradientAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateLinearGradientAbnormal';

      try {
        drawing.ShaderEffect.createLinearGradient({x : 100, y : 100}, {x : 300, y : 300}, [ 0xFF00FF00, 0xFFFF0000 ], 10);
        console.info(msg + ' createLinearGradient successed');
      } catch( e ) {
        console.info(msg + ` createLinearGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createLinearGradient({x : 100, y : 100}, {x : 300, y : 300}, [ 0xFFFFFFFF + 1, 0xFFFF0000 ], drawing.TileMode.REPEAT);
        console.info(msg + ' createLinearGradient successed');
      } catch( e ) {
        console.info(msg + ` createLinearGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createLinearGradient({x : 100, y : 100}, {x : 300, y : 300}, [ - 1, 0xFFFF0000 ], drawing.TileMode.REPEAT);
        console.info(msg + ' createLinearGradient successed');
      } catch( e ) {
        console.info(msg + ` createLinearGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testShaderEffectCreateRadialGradientNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0400
     * @tc.desc   Test for testShaderEffectCreateRadialGradientNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateRadialGradientNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateRadialGradientNormal';
      let matrix = new drawing.Matrix();

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100, y: 100}, 100, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT);
        console.info(msg + ' createRadialGradient successed,shaderEffect:' + shaderEffect);
        shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100, y: 100}, 100, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.CLAMP);
        console.info(msg + ' createRadialGradient successed,shaderEffect:' + shaderEffect);
        shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100, y: 100}, 100, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.MIRROR);
        console.info(msg + ' createRadialGradient successed,shaderEffect:' + shaderEffect);
        shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100, y: 100}, 100, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.DECAL);
        console.info(msg + ' createRadialGradient1 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createRadialGradient1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 100.1, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,null,null);
        console.info(msg + ' createRadialGradient2 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createRadialGradient2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 100, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,null);
        console.info(msg + ' createRadialGradient3 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createRadialGradient3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.9]);
        console.info(msg + ' createRadialGradient4 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createRadialGradient4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 80, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.9],matrix);
        console.info(msg + ' createRadialGradient5 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createRadialGradient5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1},50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.9],matrix);
        console.info(msg + ' createRadialGradient6 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createRadialGradient6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: -100.1, y: -100.1}, 100, [0xFF00FF00,0xFF00FF00], drawing.TileMode.REPEAT,[0.1,0.9],matrix);
        console.info(msg + ' createRadialGradient7 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createRadialGradient7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: Number.MAX_VALUE, y: Number.MAX_VALUE}, Number.MAX_VALUE, [0xFF00FF00,0xFF00FF00], drawing.TileMode.REPEAT,[0.1,0.9],matrix);
        console.info(msg + ' createRadialGradient8 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createRadialGradient8 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1},100, [0xFF00FF00,0xFF00FF00], drawing.TileMode.REPEAT,[],matrix);
        console.info(msg + ' createRadialGradient9 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createRadialGradient9 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1},100, [0xFF00FF00,0xFF00FF00,0xFF00FF00], drawing.TileMode.REPEAT,[0.1,0.9,10],matrix);
        console.info(msg + ' createRadialGradient10 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createRadialGradient10 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 50, [], drawing.TileMode.REPEAT,[],matrix);
        console.info(msg + ' createRadialGradient11 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createRadialGradient11 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 0, [0xFF00FF00,0xFF00FF00], drawing.TileMode.REPEAT,[0.1,0.9],matrix);
        console.info(msg + ' createRadialGradient12 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createRadialGradient12 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, -1, [0xFF00FF00,0xFF00FF00], drawing.TileMode.REPEAT,[0.1,0.9],matrix);
        console.info(msg + ' createRadialGradient13 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createRadialGradient13 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateRadialGradientMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0401
     * @tc.desc   Test for testShaderEffectCreateRadialGradientMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateRadialGradientMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateRadialGradientMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        const randomEnum = Math.floor(Math.random() * (getEnumCount(drawing.TileMode)));
        for ( let i = 0 ; i < 20 ; i ++ ) {
          let shaderEffect = drawing.ShaderEffect.createRadialGradient(
            {x: Math.random() * Number.MAX_VALUE, y: Math.random() * Number.MAX_VALUE}, Math.random() * Number.MAX_VALUE,
             [0xFF00FF00, 0xFFFF0000], randomEnum,[Math.random() * Number.MAX_VALUE,Math.random() * Number.MAX_VALUE], matrix);
          console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
        }
      } catch( e ) {
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateRadialGradientToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0402
     * @tc.desc   Test for testShaderEffectCreateRadialGradientToNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateRadialGradientToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateRadialGradientToNull';
      let matrix = new drawing.Matrix();

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient(null, 100, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT);
        console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, null, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,null,null);
        console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 100, null, drawing.TileMode.REPEAT,null);
        console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 50, [0xFF00FF00, 0xFFFF0000], null,[0.1,0.9]);
        console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient(undefined, 100, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT);
        console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1},undefined, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,null,null);
        console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 100, undefined, drawing.TileMode.REPEAT,null);
        console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 50, [0xFF00FF00, 0xFFFF0000], undefined,[0.1,0.9]);
        console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1}, 80, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,undefined,matrix);
        console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createRadialGradient({x: 100.1, y: 100.1},50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.9],undefined);
        console.info(msg + ' createRadialGradient successed, shaderEffect:' + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testShaderEffectCreateRadialGradientAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0403
     * @tc.desc   Test for testShaderEffectCreateRadialGradientAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateRadialGradientAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateRadialGradientAbnormal';

      try {
        drawing.ShaderEffect.createRadialGradient({x : 100, y : 100}, 100, [ 0xFF00FF00, 0xFFFF0000 ], 10);
        console.info(msg + ' createRadialGradient successed');
      } catch( e ) {
        console.info(msg + ` createRadialGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testShaderEffectCreateSweepGradientNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0500
     * @tc.desc   Test for testShaderEffectCreateSweepGradientNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateSweepGradientNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateSweepGradientNormal';
      let matrix_ = new drawing.Matrix();
      let matrix = new drawing.Matrix();
      matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])
      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x: 100, y: 100}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,100,200);
        console.info(msg + ' createSweepGradient successed,shaderEffect:' + shaderEffect);
        shaderEffect = drawing.ShaderEffect.createSweepGradient({x: 100, y: 100}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.CLAMP,100,200);
        console.info(msg + ' createSweepGradient successed,shaderEffect:' + shaderEffect);
        shaderEffect = drawing.ShaderEffect.createSweepGradient({x: 100, y: 100}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.MIRROR,100,200);
        console.info(msg + ' createSweepGradient successed,shaderEffect:' + shaderEffect);
        shaderEffect = drawing.ShaderEffect.createSweepGradient({x: 100, y: 100}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.DECAL,100,200);
        console.info(msg + ' createSweepGradient1 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00,0xFFFF0000],drawing.TileMode.REPEAT,0,360,null,null);
        console.info(msg + ' createSweepGradient2 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:-100.1,y:100.1},[0xFF00FF00,0xFFFF0000],drawing.TileMode.REPEAT,360,0,null,null);
        console.info(msg + ' createSweepGradient3 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:-100.1,y:100.1},[0xFF00FF00,0xFFFF0000],drawing.TileMode.REPEAT,180.1,180.1,null);
        console.info(msg + ' createSweepGradient4 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:-100.1},[0xFF00FF00,0xFFFF0000],drawing.TileMode.REPEAT,180.1,180.1,[0.1,0.9]);
        console.info(msg + ' createSweepGradient5 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:-100.1,y:-100.1},[0xFF00FF00,0xFFFF0000],drawing.TileMode.REPEAT,30,90,[0.1,0.9],matrix_);
        console.info(msg + ' createSweepGradient6 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:-100.1,y:100.1},[0xFF00FF00,0xFFFF0000],drawing.TileMode.REPEAT,30,90,[2,0.9],matrix);
        console.info(msg + ' createSweepGradient7 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00,0xFF00FF00],drawing.TileMode.REPEAT,30,90,[0.1,0.9,5],matrix);
        console.info(msg + ' createSweepGradient8 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient8 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00,0xFF00FF00],drawing.TileMode.REPEAT,30,90,[],matrix);
        console.info(msg + ' createSweepGradient9 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient9 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect=drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00,0xFF00FF00],drawing.TileMode.REPEAT,-30,90,[0.1,0.9],matrix);
        console.info(msg + ' createSweepGradient10 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient10 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00,0xFF00FF00],drawing.TileMode.REPEAT,361,90,[0.1,0.9],matrix);
        console.info(msg + ' createSweepGradient11 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient11 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00,0xFF00FF00],drawing.TileMode.REPEAT,90,-30,[0.1,0.9],matrix);
        console.info(msg + ' createSweepGradient12 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient12 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect= drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[0xFF00FF00,0xFF00FF00],drawing.TileMode.REPEAT,90,361,[0.1,0.9],matrix);
        console.info(msg + ' createSweepGradient13 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient13 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1},[],drawing.TileMode.REPEAT,90,90,[],matrix);
        console.info(msg + ' createSweepGradient14 successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createSweepGradient14 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateSweepGradientMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0501
     * @tc.desc   Test for testShaderEffectCreateSweepGradientMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateSweepGradientMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateSweepGradientMultipleCalls';
      let matrix_ = new drawing.Matrix();

      try {
        for ( let i = 0 ; i < 20 ; i ++ ) {
          let shaderEffect = drawing.ShaderEffect.createSweepGradient(
              {x : Math.random() * Number.MAX_VALUE, y : Math.random() * Number.MAX_VALUE},
            [ 0xFF00FF00, 0xFFFF0000 ], drawing.TileMode.REPEAT, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            [ Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE ], matrix_);
          console.info(msg + ' createSweepGradient successed,shaderEffect:' + shaderEffect);
        }
      } catch( e ) {
        console.info(msg + ` createSweepGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testShaderEffectCreateSweepGradientToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0502
     * @tc.desc   Test for testShaderEffectCreateSweepGradientToNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateSweepGradientToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateSweepGradientToNull';
      let matrix_ = new drawing.Matrix();

      try {
        drawing.ShaderEffect.createSweepGradient(null, [0xFF00FF00,0xFFFF0000], drawing.TileMode.REPEAT, 30, 90, [0.1,0.9], matrix_);
        console.info(msg + ' createSweepGradient1 successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createSweepGradient({x:100.1,y:100.1}, null, drawing.TileMode.REPEAT,30,90,[0.1,0.9], matrix_);
        console.info(msg + ' createSweepGradient2 successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createSweepGradient({x:100,y:100},[0xFF00FF00,0xFFFF0000],null,30,90,[0.1,0.9],matrix_);
        console.info(msg + ' createSweepGradient3 successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createSweepGradient({x:100,y:100},[0xFF00FF00,0xFFFF0000],drawing.TileMode.REPEAT,null,90,[0.1,0.9],matrix_);
        console.info(msg + ' createSweepGradient4 successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createSweepGradient({x:100,y:100},[0xFF00FF00,0xFFFF0000],drawing.TileMode.REPEAT,30,null,[0.1,0.9],matrix_);
        console.info(msg + ' createSweepGradient5 successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createSweepGradient(undefined,[0xFF00FF00,0xFFFF0000],drawing.TileMode.REPEAT,30,90,[0.1,0.9],matrix_);
        console.info(msg + ' createSweepGradient6 successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createSweepGradient({x:100,y:100},undefined,drawing.TileMode.REPEAT,30,90,[0.1,0.9],matrix_);
        console.info(msg + ' createSweepGradient7 successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createSweepGradient({x:100,y:100},[0xFF00FF00,0xFFFF0000],undefined,30,90,[0.1,0.9],matrix_);
        console.info(msg + ' createSweepGradient8 successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient8 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createSweepGradient({x:100,y:100},[0xFF00FF00,0xFFFF0000],drawing.TileMode.REPEAT,undefined,90,[0.1,0.9],matrix_);
        console.info(msg + ' createSweepGradient9 successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient9 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createSweepGradient({x:100,y:100},[0xFF00FF00,0xFFFF0000],drawing.TileMode.REPEAT,30,undefined,[0.1,0.9],matrix_);
        console.info(msg + ' createSweepGradient10 successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient10 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createSweepGradient({x:100,y:100},[0xFF00FF00,0xFFFF0000],drawing.TileMode.REPEAT,30,90,undefined,matrix_);
        console.info(msg + ' createSweepGradient11 successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient11 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createSweepGradient({x:100,y:100},[0xFF00FF00,0xFFFF0000],drawing.TileMode.REPEAT,30,90,[0.1,0.9],undefined);
        console.info(msg + ' createSweepGradient12 successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient12 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testShaderEffectCreateSweepGradientAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0504
     * @tc.desc   Test for testShaderEffectCreateSweepGradientAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateSweepGradientAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateSweepGradientAbnormal';

      try {
        let shaderEffect =drawing.ShaderEffect.createSweepGradient({x: 100, y: 100}, [0xFF00FF00, 0xFFFF0000], 10,100,200);
        console.info(msg + ' createSweepGradient successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testShaderEffectCreateConicalGradientNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0600
     * @tc.desc   Test for testShaderEffectCreateConicalGradientNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateConicalGradientNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateConicalGradientNormal';
      let matrix_ = new drawing.Matrix();
      let matrix = new drawing.Matrix();
      matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200, y: 200}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200, y: 200}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.CLAMP);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200, y: 200}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.MIRROR);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
        shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200, y: 200}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.DECAL);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: -100, y: -100}, 100, {x: 200, y: 200}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT, null);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,null,null);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3],null);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3],matrix_);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3],matrix);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3,0.6],matrix);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [], drawing.TileMode.REPEAT,[],matrix);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,2],matrix);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, -1, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3],matrix_);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1},0, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3],matrix_);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, -1, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3],matrix_);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 0, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3],matrix_);
        console.info(msg + ' createConicalGradient successed,shaderEffect:' + shaderEffect);
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateConicalGradientMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0601
     * @tc.desc   Test for testShaderEffectCreateConicalGradientMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateConicalGradientMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateConicalGradientMultipleCalls';

      try {
        let matrix_ = new drawing.Matrix();
        for ( let i = 0 ; i < 20 ; i ++ ) {
          let shaderEffect = drawing.ShaderEffect.createConicalGradient(
            {x : Math.random() * Number.MAX_VALUE, y : Math.random() * Number.MAX_VALUE},Math.random() * Number.MAX_VALUE,
            {x : Math.random() * Number.MAX_VALUE, y : Math.random() * Number.MAX_VALUE},Math.random() * Number.MAX_VALUE,
            [0xFF00FF00, 0xFFFF0000],  drawing.TileMode.REPEAT, [ Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE ], matrix_);
          console.info(msg + ' create createConicalGradient,shaderEffect:'+shaderEffect);
        }
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShaderEffectCreateConicalGradientToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0602
     * @tc.desc   Test for testShaderEffectCreateConicalGradientToNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateConicalGradientToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateConicalGradientToNull';
      let matrix_ = new drawing.Matrix();
      let matrix = new drawing.Matrix();
      matrix.setMatrix([ 1, 1, 1, 1, 1, 1, 1, 1, 1])

      try {
        drawing.ShaderEffect.createConicalGradient(null, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3,0.6],matrix);
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, null, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3,0.6],matrix);
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100,null, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3,0.6],matrix);
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, null, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3,0.6],matrix)
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, null,drawing.TileMode.REPEAT,[0.1,0.3,0.6],matrix);
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], null,[0.1,0.3,0.6],matrix);
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient(undefined, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3,0.6],matrix);
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, undefined, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3,0.6],matrix);
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100,undefined, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3,0.6],matrix);
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, undefined, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3,0.6],matrix);
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, undefined,drawing.TileMode.REPEAT,[0.1,0.3,0.6],matrix);
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], undefined,[0.1,0.3,0.6],matrix);
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,undefined,matrix);
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createConicalGradient({x: 100, y: 100}, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.3,0.6],undefined);
        console.info(msg + ' createConicalGradient successed');
      } catch( e ) {
        console.info(msg + ` createConicalGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testShaderEffectCreateConicalGradientAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0603
     * @tc.desc   Test for testShaderEffectCreateConicalGradientAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateConicalGradientAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateConicalGradientAbnormal';

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient(null, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], 10);
        console.info(msg + ' create createConicalGradient,shaderEffect:'+shaderEffect);
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testShaderEffectCreateComposeShaderNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0700
     * @tc.desc   Test for testShaderEffectCreateComposeShaderNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateComposeShaderNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateComposeShaderNormal';
      try {
        let dstShader = drawing.ShaderEffect.createColorShader(0xFF0000FF);
        let srcShader = drawing.ShaderEffect.createColorShader(0xFFFF0000);
        let shader1 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.CLEAR);
        expect(shader1 != null || shader1 != undefined).assertTrue();
        let shader2 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.SRC);
        expect(shader2 != null || shader2 != undefined).assertTrue();
        let shader3 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.DST);
        expect(shader3 != null || shader3 != undefined).assertTrue();
        let shader4 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.SRC_OVER);
        expect(shader4 != null || shader4 != undefined).assertTrue();
        let shader5 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.DST_OVER);
        expect(shader5 != null || shader5 != undefined).assertTrue();
        let shader6 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.SRC_IN);
        expect(shader6 != null || shader6 != undefined).assertTrue();
        let shader7 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.DST_IN);
        expect(shader7 != null || shader7 != undefined).assertTrue();
        let shader8 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.SRC_OUT);
        expect(shader8 != null || shader8 != undefined).assertTrue();
        let shader9 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.DST_OUT);
        expect(shader9 != null || shader9 != undefined).assertTrue();
        let shader10 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.SRC_ATOP);
        expect(shader10 != null || shader10 != undefined).assertTrue();
        let shader11 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.DST_ATOP);
        expect(shader11 != null || shader11 != undefined).assertTrue();
        let shader12 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.XOR);
        expect(shader12 != null || shader12 != undefined).assertTrue();
        let shader13 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.PLUS);
        expect(shader13 != null || shader13 != undefined).assertTrue();
        let shader14 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.MODULATE);
        expect(shader14 != null || shader14 != undefined).assertTrue();
        let shader15 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.SCREEN);
        expect(shader15 != null || shader15 != undefined).assertTrue();
        let shader16 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.OVERLAY);
        expect(shader16 != null || shader16 != undefined).assertTrue();
        let shader17 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.DARKEN);
        expect(shader17 != null || shader17 != undefined).assertTrue();
        let shader18 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.LIGHTEN);
        expect(shader18 != null || shader18 != undefined).assertTrue();
        let shader19 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.COLOR_DODGE);
        expect(shader19 != null || shader19 != undefined).assertTrue();
        let shader20 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.COLOR_BURN);
        expect(shader20 != null || shader20 != undefined).assertTrue();
        let shader21 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.HARD_LIGHT);
        expect(shader21 != null || shader21 != undefined).assertTrue();
        let shader22 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.SOFT_LIGHT);
        expect(shader22 != null || shader22 != undefined).assertTrue();
        let shader23 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.DIFFERENCE);
        expect(shader23 != null || shader23 != undefined).assertTrue();
        let shader24 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.EXCLUSION);
        expect(shader24 != null || shader24 != undefined).assertTrue();
        let shader25 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.MULTIPLY);
        expect(shader25 != null || shader25 != undefined).assertTrue();
        let shader26 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.HUE);
        expect(shader26 != null || shader26 != undefined).assertTrue();
        let shader27 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.SATURATION);
        expect(shader27 != null || shader27 != undefined).assertTrue();
        let shader28 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.COLOR);
        expect(shader28 != null || shader28 != undefined).assertTrue();
        let shader29 = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.LUMINOSITY);
        expect(shader29 != null || shader29 != undefined).assertTrue();
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testShaderEffectCreateComposeShaderMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0701
     * @tc.desc   Test for testShaderEffectCreateComposeShaderMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShaderEffectCreateComposeShaderMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testShaderEffectCreateComposeShaderMultipleCalls';
      for (let i = 0; i < 20; i++) {
        let dstShader = drawing.ShaderEffect.createColorShader(0xFFFF0000);
        let centerPt: common2D.Point = { x: 100, y: 100 };
        let srcShader = drawing.ShaderEffect.createSweepGradient(centerPt, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT, 100, 200);
        try {
          let shader = drawing.ShaderEffect.createComposeShader(dstShader, srcShader, drawing.BlendMode.SRC);
          expect(shader != null || shader != undefined).assertTrue();
        } catch( e ) {
          console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testShaderEffectCreateComposeShaderToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0702
     * @tc.desc   Test for testShaderEffectCreateComposeShaderToNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateComposeShaderToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testShaderEffectCreateComposeShaderToNull';
      let dstShader = drawing.ShaderEffect.createColorShader(0xFF0000FF);
      let srcShader = drawing.ShaderEffect.createColorShader(0xFFFF0000);
      try {
        let shader = drawing.ShaderEffect.createComposeShader(null, srcShader, drawing.BlendMode.SRC);
        console.info(msg + ' createLightingColorFilter shader successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter shader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let shader2 = drawing.ShaderEffect.createComposeShader(undefined, srcShader, drawing.BlendMode.SRC);
        console.info(msg + ' createLightingColorFilter shader2 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter shader2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let shader3 = drawing.ShaderEffect.createComposeShader(dstShader, null, drawing.BlendMode.SRC);
        console.info(msg + ' createLightingColorFilter shader3 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter shader3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let shader4 = drawing.ShaderEffect.createComposeShader(dstShader, undefined, drawing.BlendMode.SRC);
        console.info(msg + ' createLightingColorFilter shader4 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter shader4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testShaderEffectCreateComposeShaderAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0703
     * @tc.desc   Test for testShaderEffectCreateComposeShaderAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateComposeShaderAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testShaderEffectCreateComposeShaderAbnormal';
      try {
        let dstShader = drawing.ShaderEffect.createColorShader(0xFFFF0000);
        let centerPt: common2D.Point = { x: 100, y: 100 };
        let srcShader = drawing.ShaderEffect.createSweepGradient(centerPt, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT, 100, 200);
        let shader = drawing.ShaderEffect.createComposeShader(dstShader, srcShader,35);
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter shader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(25900001);
      }
    });
    /**
     * @tc.name   testShaderEffectCreateImageShaderNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0800
     * @tc.desc   Test for testShaderEffectCreateImageShaderNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateImageShaderNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShaderEffectCreateImageShaderNormal';
      let matrix = new drawing.Matrix();
      let options = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
      try {
        let imageShader = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.CLAMP, drawing.TileMode.CLAMP, options, matrix);
        console.info(msg + ' createImageShader imageShader successed');
        expect(imageShader != null || imageShader != undefined).assertTrue();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let imageShader2 = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.REPEAT, drawing.TileMode.REPEAT, options, matrix);
        console.info(msg + ' createImageShader imageShader2 successed');
        expect(imageShader2 != null || imageShader2 != undefined).assertTrue();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let imageShader3 = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.MIRROR, drawing.TileMode.MIRROR, options, matrix);
        console.info(msg + ' createImageShader imageShader3 successed');
        expect(imageShader3 != null || imageShader3 != undefined).assertTrue();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let imageShader4 = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.DECAL, drawing.TileMode.DECAL, options, matrix);
        console.info(msg + ' createImageShader imageShader4 successed');
        expect(imageShader4 != null || imageShader4 != undefined).assertTrue();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      matrix.setTranslation(100, 100);
      let sx: number = 2;
      let sy: number = 0.5;
      let px: number = 1;
      let py: number = 1;
      matrix.postScale(sx, sy, px, py);
      options = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
      try {
        let imageShader5 = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.REPEAT, drawing.TileMode.MIRROR, options, matrix);
        console.info(msg + ' createImageShader imageShader5 successed');
        expect(imageShader5 != null || imageShader5 != undefined).assertTrue();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let imageShader6 = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.REPEAT, drawing.TileMode.MIRROR, options);
        console.info(msg + ' createImageShader imageShader6 successed');
        expect(imageShader6 != null || imageShader6 != undefined).assertTrue();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let imageShader7 = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.REPEAT, drawing.TileMode.MIRROR, options, null);
        console.info(msg + ' createImageShader imageShader7 successed');
        expect(imageShader7 != null || imageShader7 != undefined).assertTrue();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testShaderEffectCreateImageShaderMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0801
     * @tc.desc   Test for testShaderEffectCreateImageShaderMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShaderEffectCreateImageShaderMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testShaderEffectCreateImageShaderMultipleCalls';
      for (let i = 0; i < 20; i++) {
        let matrix = new drawing.Matrix();
        let options = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        try {
          let imageShader = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.REPEAT, drawing.TileMode.MIRROR, options, matrix);
          console.info(msg + ' createImageShader imageShader successed' + i);
          expect(imageShader != null || imageShader != undefined).assertTrue()
        } catch( e ) {
          console.info(msg + ` createImageShader imageShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testShaderEffectCreateImageShaderToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0802
     * @tc.desc   Test for testShaderEffectCreateImageShaderToNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateImageShaderToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testShaderEffectCreateImageShaderToNull';
      let matrix = new drawing.Matrix();
      let options = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
      try {
        let imageShader = drawing.ShaderEffect.createImageShader(null, drawing.TileMode.REPEAT, drawing.TileMode.MIRROR, options, matrix);
        console.info(msg + ' createImageShader imageShader successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let imageShader2 = drawing.ShaderEffect.createImageShader(undefined, drawing.TileMode.REPEAT, drawing.TileMode.MIRROR, options, matrix);
        console.info(msg + ' createImageShader imageShader2 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let imageShader3 = drawing.ShaderEffect.createImageShader(pixel, null, drawing.TileMode.MIRROR, options, matrix);
        console.info(msg + ' createImageShader imageShader3 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let imageShader4 = drawing.ShaderEffect.createImageShader(pixel, undefined, drawing.TileMode.MIRROR, options, matrix);
        console.info(msg + ' createImageShader imageShader4 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let imageShader5 = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.REPEAT, null, options, matrix);
        console.info(msg + ' createImageShader imageShader5 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let imageShader6 = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.REPEAT, undefined, options, matrix);
        console.info(msg + ' createImageShader imageShader6 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let imageShader7 = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.REPEAT, drawing.TileMode.MIRROR, null, matrix);
        console.info(msg + ' createImageShader imageShader7 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let imageShader8 = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.REPEAT, drawing.TileMode.MIRROR, undefined, matrix);
        console.info(msg + ' createImageShader imageShader8 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader8 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let imageShader9 = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.REPEAT, drawing.TileMode.MIRROR, options, undefined);
        console.info(msg + ' createImageShader imageShader9 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader9 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testShaderEffectCreateImageShaderAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0803
     * @tc.desc   Test for testShaderEffectCreateImageShaderAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateImageShaderAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testShaderEffectCreateImageShaderAbnormal';
      let matrix = new drawing.Matrix();
      let options = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
      try {
        let imageShader = drawing.ShaderEffect.createImageShader(pixel, 10, drawing.TileMode.MIRROR, options, matrix);
        console.info(msg + ' createImageShader imageShader successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(25900001);
      }
      try {
        let imageShader2 = drawing.ShaderEffect.createImageShader(pixel, drawing.TileMode.REPEAT, 10, options, matrix);
        console.info(msg + ' createImageShader imageShader2 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createImageShader imageShader2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(25900001);
      }
    });
  })
}
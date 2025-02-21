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

import { afterAll, afterEach, beforeAll, describe, expect, it } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import uiEffect from '@ohos.graphics.uiEffect';
import { getEnumCount, getRandomNumber } from './utils';

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0200
     * @tc.name      : testShaderEffectCreateColorShaderNormal
     * @tc.desc      : Test for testShaderEffectCreateColorShaderNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateColorShaderNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0201
     * @tc.name      : testShaderEffectCreateColorShaderMultipleCalls
     * @tc.desc      : Test for testShaderEffectCreateColorShaderMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateColorShaderMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0202
     * @tc.name      : testShaderEffectCreateColorShaderToNull
     * @tc.desc      : Test for testShaderEffectCreateColorShaderToNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateColorShaderToNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0203
     * @tc.name      : testShaderEffectCreateColorShaderMismatch
     * @tc.desc      : Test for testShaderEffectCreateColorShaderMismatch.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateColorShaderMismatch', DEFAULT, () => {
      const msg = 'testShaderEffectCreateColorShaderMismatch';

      try {
        drawing.ShaderEffect.createColorShader(0x00000000, 0x00000000);
        console.info(msg + ' createColorShader successed');
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createColorShader();
        console.info(msg + ' createColorShader successed');
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createColorShader('s');
        console.info(msg + ' createColorShader successed');
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0204
     * @tc.name      : testShaderEffectCreateColorShaderAbnormal
     * @tc.desc      : Test for testShaderEffectCreateColorShaderAbnormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateColorShaderAbnormal', DEFAULT, () => {
      const msg = 'testShaderEffectCreateColorShaderAbnormal';
      try {
        drawing.ShaderEffect.createColorShader({alpha : - 1, red : 255, green : 0, blue : 0});
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createColorShader({alpha : 255, red : - 1, green : 0, blue : 0});
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createColorShader({alpha : 255, red : 255, green : - 1, blue : 0});
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.ShaderEffect.createColorShader({alpha : 255, red : 255, green : 0, blue : - 1});
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.ShaderEffect.createColorShader({alpha : 256, red : 255, green : 0, blue : 0});
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createColorShader({alpha : 255, red : 256, green : 0, blue : 0});
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createColorShader({alpha : 255, red : 255, green : 256, blue : 0});
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShaderEffect.createColorShader({alpha : 255, red : 255, green : 0, blue : 256});
      } catch( e ) {
        console.info(msg + ` createColorShader errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0300
     * @tc.name      : testShaderEffectCreateLinearGradientNormal
     * @tc.desc      : Test for testShaderEffectCreateLinearGradientNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateLinearGradientNormal', DEFAULT, () => {
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
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0301
     * @tc.name      : testShaderEffectCreateLinearGradientMultipleCalls
     * @tc.desc      : Test for testShaderEffectCreateLinearGradientMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateLinearGradientMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0302
     * @tc.name      : testShaderEffectCreateLinearGradientToNull
     * @tc.desc      : Test for testShaderEffectCreateLinearGradientToNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateLinearGradientToNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0303
     * @tc.name      : testShaderEffectCreateLinearGradientMismatch
     * @tc.desc      : Test for testShaderEffectCreateLinearGradientMismatch.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateLinearGradientMismatch', DEFAULT, () => {
      const msg = 'testShaderEffectCreateLinearGradientMismatch';

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 0, 0, 1])
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1},
          [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.9], matrix, matrix);
        console.info(msg + ` createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100.1, y: 100.1}, {x: 300.1, y: 300.1}, [0xFF00FF00, 0xFFFF0000]);
        console.info(msg + ` createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 0, 0, 1])
        let shaderEffect = drawing.ShaderEffect.createLinearGradient('s', {x: 300.1, y: 300.1}, [0xFF00FF00, 0xFFFF0000], drawing.TileMode.REPEAT,[0.1,0.9], matrix);
        console.info(msg + ` createLinearGradient create successed,shaderEffect:` + JSON.stringify(shaderEffect));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0304
     * @tc.name      : testShaderEffectCreateLinearGradientAbnormal
     * @tc.desc      : Test for testShaderEffectCreateLinearGradientAbnormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateLinearGradientAbnormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0400
     * @tc.name      : testShaderEffectCreateRadialGradientNormal
     * @tc.desc      : Test for testShaderEffectCreateRadialGradientNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateRadialGradientNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0401
     * @tc.name      : testShaderEffectCreateRadialGradientMultipleCalls
     * @tc.desc      : Test for testShaderEffectCreateRadialGradientMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateRadialGradientMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0402
     * @tc.name      : testShaderEffectCreateRadialGradientToNull
     * @tc.desc      : Test for testShaderEffectCreateRadialGradientToNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateRadialGradientToNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0403
     * @tc.name      : testShaderEffectCreateRadialGradientAbnormal
     * @tc.desc      : Test for testShaderEffectCreateRadialGradientAbnormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateRadialGradientAbnormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0500
     * @tc.name      : testShaderEffectCreateSweepGradientNormal
     * @tc.desc      : Test for testShaderEffectCreateSweepGradientNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateSweepGradientNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0501
     * @tc.name      : testShaderEffectCreateSweepGradientMultipleCalls
     * @tc.desc      : Test for testShaderEffectCreateSweepGradientMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateSweepGradientMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0502
     * @tc.name      : testShaderEffectCreateSweepGradientToNull
     * @tc.desc      : Test for testShaderEffectCreateSweepGradientToNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateSweepGradientToNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0503
     * @tc.name      : testShaderEffectCreateSweepGradientMismatch
     * @tc.desc      : Test for testShaderEffectCreateSweepGradientMismatch.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateSweepGradientMismatch', DEFAULT, () => {
      const msg = 'testShaderEffectCreateSweepGradientMismatch';

      try {
        let matrix_ = new drawing.Matrix();
        drawing.ShaderEffect.createSweepGradient({
          x : - 100.1, y : - 100.1
        }, [ 0xFF00FF00, 0xFFFF0000 ], drawing.TileMode.REPEAT, 30, 90, 2, matrix_, matrix_);
        console.info(msg + ' createSweepGradient successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix_ = new drawing.Matrix();
        drawing.ShaderEffect.createSweepGradient({
          x : - 100.1, y : - 100.1
        }, [ 0xFF00FF00, 0xFFFF0000 ], drawing.TileMode.REPEAT, 30);
        console.info(msg + ' createSweepGradient successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix_ = new drawing.Matrix();
        drawing.ShaderEffect.createSweepGradient('s', [ 0xFF00FF00, 0xFFFF0000 ], drawing.TileMode.REPEAT, 30, 90, 2, matrix_);
        console.info(msg + ' createSweepGradient successed');
      } catch( e ) {
        console.info(msg + ` createSweepGradient errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0504
     * @tc.name      : testShaderEffectCreateSweepGradientAbnormal
     * @tc.desc      : Test for testShaderEffectCreateSweepGradientAbnormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateSweepGradientAbnormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0600
     * @tc.name      : testShaderEffectCreateConicalGradientNormal
     * @tc.desc      : Test for testShaderEffectCreateConicalGradientNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateConicalGradientNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0601
     * @tc.name      : testShaderEffectCreateConicalGradientMultipleCalls
     * @tc.desc      : Test for testShaderEffectCreateConicalGradientMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateConicalGradientMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0602
     * @tc.name      : testShaderEffectCreateConicalGradientToNull
     * @tc.desc      : Test for testShaderEffectCreateConicalGradientToNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateConicalGradientToNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADEREFFECT_0603
     * @tc.name      : testShaderEffectCreateConicalGradientAbnormal
     * @tc.desc      : Test for testShaderEffectCreateConicalGradientAbnormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testShaderEffectCreateConicalGradientAbnormal', DEFAULT, () => {
      const msg = 'testShaderEffectCreateConicalGradientAbnormal';

      try {
        let shaderEffect = drawing.ShaderEffect.createConicalGradient(null, 100, {x: 200.1, y: 200.1}, 50, [0xFF00FF00, 0xFFFF0000], 10);
        console.info(msg + ' create createConicalGradient,shaderEffect:'+shaderEffect);
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
  })
}
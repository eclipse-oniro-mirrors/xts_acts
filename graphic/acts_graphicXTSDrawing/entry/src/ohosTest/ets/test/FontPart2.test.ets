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

import { afterAll , afterEach , beforeAll , beforeEach , describe , expect , it, TestType, Size, Level } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import { getEnumCount } from './utils';
import buffer from '@ohos.buffer';

export default function fontPart2Test() {
  describe('DrawingTsFontPart2Test' , () => {
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async() => {

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name   testFontCountTextTextNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0800
     * @tc.desc   Test for testFontCountTextTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontCountTextTextNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontCountTextTextNormal';
      let font = new drawing.Font();

      try {
        let resultNumber: number = font.countText('ABCDE');
        expect(resultNumber == 5).assertTrue();
        console.info(msg + ' countTextText successed,resultNumber correct');
      } catch( e ) {
        console.info(msg + ` countTextText errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let resultNumber: number = font.countText('你好');
        expect(resultNumber == 2).assertTrue();
        console.info(msg + ' countTextText successed,resultNumber correct');
      } catch( e ) {
        console.info(msg + ` countTextText errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let resultNumber: number = font.countText('！@#￥2223@##');
        expect(resultNumber == 11).assertTrue();
        console.info(msg + ' countTextText successed,resultNumber correct');
      } catch( e ) {
        console.info(msg + ` countTextText errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let resultNumber: number = font.countText('魑魅魍魉');
        expect(resultNumber == 4).assertTrue();
        console.info(msg + ' countTextText successed,resultNumber correct');
      } catch( e ) {
        console.info(msg + ` countTextText errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let resultNumber: number = font.countText('');
        expect(resultNumber == 0).assertTrue();
        console.info(msg + ' countTextText successed,resultNumber correct');
      } catch( e ) {
        console.info(msg + ` countTextText errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontCountTextTextNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0801
     * @tc.desc   Test for testFontCountTextTextNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontCountTextTextNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontCountTextTextNull';
      let font = new drawing.Font();

      try {
        font.countText(null);
        console.info(msg + ' countTextText succeeded');
      } catch( e ) {
        console.info(msg + ` countTextText errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.countText(undefined);
        console.info(msg + ' countTextText succeeded');
      } catch( e ) {
        console.info(msg + ` countTextText errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontCountTextTextMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0803
     * @tc.desc   Test for testFontCountTextTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontCountTextTextMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontCountTextTextMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let resultNumber: number = font.countText('ABCDE');
          expect(resultNumber == 5).assertTrue();
          console.info(msg + ' countTextText successed,resultNumber correct');
        } catch( e ) {
          console.info(msg + ` countTextText errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetAndGetEdgingNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0900
     * @tc.desc   Test for testFontSetAndGetEdgingNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndGetEdgingNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontSetAndGetEdgingNormal';
      let font = new drawing.Font();

      try {
        font.setEdging(drawing.FontEdging.ALIAS);
        let edging: drawing.FontEdging = font.getEdging();
        expect(edging == drawing.FontEdging.ALIAS).assertTrue();
        console.info(msg + ' setAndGetEdging successed,GetEdging:' + edging);
      } catch( e ) {
        console.info(msg + ` setAndGetEdging errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setEdging(drawing.FontEdging.ANTI_ALIAS);
        let edging: drawing.FontEdging = font.getEdging();
        expect(edging == drawing.FontEdging.ANTI_ALIAS).assertTrue();
        console.info(msg + ' setAndGetEdging successed,GetEdging:' + edging);
      } catch( e ) {
        console.info(msg + ` setAndGetEdging errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setEdging(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        let edging: drawing.FontEdging = font.getEdging();
        expect(edging == drawing.FontEdging.SUBPIXEL_ANTI_ALIAS).assertTrue();
        console.info(msg + ' setAndGetEdging successed,GetEdging:' + edging);
      } catch( e ) {
        console.info(msg + ` setAndGetEdging errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontSetAndGetEdgingNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0901
     * @tc.desc   Test for testFontSetAndGetEdgingNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetEdgingNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndGetEdgingNull';
      let font = new drawing.Font();

      try {
        font.setEdging(null);
        console.info(msg + ' setEdging succeeded');
      } catch( e ) {
        console.info(msg + ` setEdging errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.setEdging(undefined);
        console.info(msg + ' setEdging succeeded');
      } catch( e ) {
        console.info(msg + ` setEdging errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontSetAndGetEdgingMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0903
     * @tc.desc   Test for testFontSetAndGetEdgingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetEdgingMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndGetEdgingMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.FontEdging));
        try {
          font.setEdging(randomEnum);
          let edging: drawing.FontEdging = font.getEdging();
          console.info(msg + ' setAndGetEdging successed,GetEdging:' + edging);
        } catch( e ) {
          console.info(msg + ` setAndGetEdging errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.FontEdging));
        try {
          font.setEdging(randomEnum);
          console.info(msg + ' setEdging successed');
        } catch( e ) {
          console.info(msg + ` setEdging errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let edging: drawing.FontEdging = font.getEdging();
          console.info(msg + ' getEdging successed,GetEdging:' + edging);
        } catch( e ) {
          console.info(msg + ` getEdging errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetAndGetEdgingAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0904
     * @tc.desc   Test for testFontSetAndGetEdgingAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetEdgingAbnormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndGetEdgingAbnormal';
      let font = new drawing.Font();

      try {
        font.setEdging(10);
        console.info(msg + ' setEdging succeeded');
      } catch( e ) {
        console.info(msg + ` setEdging errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontSetAndGetHintingNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1000
     * @tc.desc   Test for testFontSetAndGetHintingNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndGetHintingNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontSetAndGetHintingNormal';
      let font = new drawing.Font();

      try {
        font.setHinting(drawing.FontHinting.NONE);
        let hinting: drawing.FontHinting = font.getHinting();
        expect(hinting == drawing.FontHinting.NONE).assertTrue();
        console.info(msg + ' setAndGetHinting successed,getHinting:' + hinting);
      } catch( e ) {
        console.info(msg + ` setAndGetHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setHinting(drawing.FontHinting.SLIGHT);
        let hinting: drawing.FontHinting = font.getHinting();
        expect(hinting == drawing.FontHinting.SLIGHT).assertTrue();
        console.info(msg + ' setAndGetHinting successed,getHinting:' + hinting);
      } catch( e ) {
        console.info(msg + ` setAndGetHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setHinting(drawing.FontHinting.NORMAL);
        let hinting: drawing.FontHinting = font.getHinting();
        expect(hinting == drawing.FontHinting.NORMAL).assertTrue();
        console.info(msg + ' setAndGetHinting successed,getHinting:' + hinting);
      } catch( e ) {
        console.info(msg + ` setAndGetHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setHinting(drawing.FontHinting.FULL);
        let hinting: drawing.FontHinting = font.getHinting();
        expect(hinting == drawing.FontHinting.FULL).assertTrue();
        console.info(msg + ' setAndGetHinting successed,getHinting:' + hinting);
      } catch( e ) {
        console.info(msg + ` setAndGetHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontSetAndGetHintingNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1001
     * @tc.desc   Test for testFontSetAndGetHintingNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetHintingNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndGetHintingNull';
      let font = new drawing.Font();

      try {
        font.setHinting(null);
        console.info(msg + ' setHinting succeeded');
      } catch( e ) {
        console.info(msg + ` setHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.setHinting(undefined);
        console.info(msg + ' setHinting succeeded');
      } catch( e ) {
        console.info(msg + ` setHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontSetAndGetHintingMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1003
     * @tc.desc   Test for testFontSetAndGetHintingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetHintingMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndGetHintingMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.FontHinting));
        try {
          font.setHinting(randomEnum);
          let hinting: drawing.FontHinting = font.getHinting()
          console.info(msg + ' setAndGetHinting successed,getHinting:' + hinting);
        } catch( e ) {
          console.info(msg + ` setAndGetHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.FontHinting));
        try {
          font.setHinting(randomEnum);
          console.info(msg + ' setHinting successed');
        } catch( e ) {
          console.info(msg + ` setHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let hinting: drawing.FontHinting = font.getHinting();
          console.info(msg + ' getHinting successed,getHinting:' + hinting);
        } catch( e ) {
          console.info(msg + ` getHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetAndGetHintingAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1004
     * @tc.desc   Test for testFontSetAndGetHintingAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetHintingAbnormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndGetHintingAbnormal';
      let font = new drawing.Font();

      try {
        font.setHinting(10);
        console.info(msg + ' setAndGetHinting succeeded');
      } catch( e ) {
        console.info(msg + ` setAndGetHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontSetAndGetScaleXNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1100
     * @tc.desc   Test for testFontSetAndGetScaleXNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndGetScaleXNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontSetAndGetScaleXNormal';
      let font = new drawing.Font();

      try {
        font.setScaleX(2);
        let scaleX: number = font.getScaleX();
        expect(scaleX == 2).assertTrue();
        console.info(msg + ' setAndGetScaleX successed,getScaleX:' + scaleX);
      } catch( e ) {
        console.info(msg + ` setAndGetScaleX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setScaleX(0.5);
        let scaleX: number = font.getScaleX();
        expect(scaleX == 0.5).assertTrue();
        console.info(msg + ' setAndGetScaleX successed,getScaleX:' + scaleX);
      } catch( e ) {
        console.info(msg + ` setAndGetScaleX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setScaleX(0);
        let scaleX: number = font.getScaleX();
        expect(scaleX == 0).assertTrue();
        console.info(msg + ' setAndGetScaleX successed,getScaleX:' + scaleX);
      } catch( e ) {
        console.info(msg + ` setAndGetScaleX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setScaleX(-1);
        let scaleX: number = font.getScaleX();
        expect(scaleX == -1).assertTrue();
        console.info(msg + ' setAndGetScaleX successed,getScaleX:' + scaleX);
      } catch( e ) {
        console.info(msg + ` setAndGetScaleX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontSetAndGetScaleXNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1101
     * @tc.desc   Test for testFontSetAndGetScaleXNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetScaleXNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndGetScaleXNull';
      let font = new drawing.Font();

      try {
        font.setScaleX(null);
        console.info(msg + ' setAndGetScaleX succeeded');
      } catch( e ) {
        console.info(msg + ` setAndGetScaleX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.setScaleX(undefined);
        console.info(msg + ' setAndGetScaleX succeeded');
      } catch( e ) {
        console.info(msg + ` setAndGetScaleX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontSetAndGetScaleXMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1103
     * @tc.desc   Test for testFontSetAndGetScaleXMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetScaleXMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndGetScaleXMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          font.setScaleX(Math.random() * Number.MAX_VALUE);
          let scaleX: number = font.getScaleX();
          console.info(msg + ' setAndGetScaleX successed,getScaleX:' + scaleX);
        } catch( e ) {
          console.info(msg + ` setAndGetScaleX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          font.setScaleX(Math.random() * Number.MAX_VALUE);
          console.info(msg + ' setScaleX successed');
        } catch( e ) {
          console.info(msg + ` setScaleX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let scaleX: number = font.getScaleX();
          console.info(msg + ' getScaleX successed,getScaleX:' + scaleX);
        } catch( e ) {
          console.info(msg + ` getScaleX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetAndGetSkewXNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1200
     * @tc.desc   Test for testFontSetAndGetSkewXNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndGetSkewXNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontSetAndGetSkewXNormal';
      let font = new drawing.Font();

      try {
        font.setSkewX(2);
        let skewX: number = font.getSkewX();
        expect(skewX == 2).assertTrue();
        console.info(msg + ' setAndGetSkewX successed,getSkewX:' + skewX);
      } catch( e ) {
        console.info(msg + ` setAndGetSkewX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setSkewX(0.5);
        let skewX: number = font.getSkewX();
        expect(skewX == 0.5).assertTrue();
        console.info(msg + ' setAndGetSkewX successed,getSkewX:' + skewX);
      } catch( e ) {
        console.info(msg + ` setAndGetSkewX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setSkewX(0);
        let skewX: number = font.getSkewX();
        expect(skewX == 0).assertTrue();
        console.info(msg + ' setAndGetSkewX successed,getSkewX:' + skewX);
      } catch( e ) {
        console.info(msg + ` setAndGetSkewX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setSkewX(- 1);
        let skewX: number = font.getSkewX();
        expect(skewX == -1).assertTrue();
        console.info(msg + ' setAndGetSkewX successed,getSkewX:' + skewX);
      } catch( e ) {
        console.info(msg + ` setAndGetSkewX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontSetAndGetSkewXNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1201
     * @tc.desc   Test for testFontSetAndGetSkewXNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetSkewXNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndGetSkewXNull';
      let font = new drawing.Font();

      try {
        font.setSkewX(null);
        console.info(msg + ' setAndGetSkewX succeeded');
      } catch( e ) {
        console.info(msg + ` setAndGetSkewX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.setSkewX(undefined);
        console.info(msg + ' setAndGetSkewX succeeded');
      } catch( e ) {
        console.info(msg + ` setAndGetSkewX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontSetAndGetSkewXMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1203
     * @tc.desc   Test for testFontSetAndGetSkewXMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetSkewXMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndGetSkewXMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          font.setSkewX(Math.random() * Number.MAX_VALUE);
          let skewX: number = font.getSkewX();
          console.info(msg + ' setAndGetSkewX successed,getSkewX:' + skewX);
        } catch( e ) {
          console.info(msg + ` setAndGetSkewX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          font.setSkewX(Math.random() * Number.MAX_VALUE);
          console.info(msg + ' setSkewX successed');
        } catch( e ) {
          console.info(msg + ` setSkewX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let skewX: number = font.getSkewX();
          console.info(msg + ' getSkewX successed,getSkewX:' + skewX);
        } catch( e ) {
          console.info(msg + ` getSkewX errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontIsSubpixelNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1300
     * @tc.desc   Test for testFontIsSubpixelNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontIsSubpixelNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontIsSubpixelNormal';
      let font = new drawing.Font();

      try {
        font.enableSubpixel(true);
        let subpixel: boolean = font.isSubpixel();
        expect(subpixel == true).assertTrue();
        console.info(msg + ' enableSubpixel successed,isSubpixel:' + subpixel);
      } catch( e ) {
        console.info(msg + ` enableSubpixel errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.enableSubpixel(false);
        let subpixel: boolean = font.isSubpixel();
        expect(subpixel == false).assertTrue();
        console.info(msg + ' enableSubpixel successed,isSubpixel:' + subpixel);
      } catch( e ) {
        console.info(msg + ` enableSubpixel errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontIsSubpixelMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1303
     * @tc.desc   Test for testFontIsSubpixelMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontIsSubpixelMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontIsSubpixelMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let subpixel: boolean = font.isSubpixel();
          expect(subpixel == false).assertTrue();
          console.info(msg + ' isSubpixel successed,isSubpixel:' + subpixel);
        } catch( e ) {
          console.info(msg + ` isSubpixel errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontIsLinearMetricsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1400
     * @tc.desc   Test for testFontIsLinearMetricsNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontIsLinearMetricsNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontIsLinearMetricsNormal';
      let font = new drawing.Font();

      try {
        font.enableLinearMetrics(true);
        let linearMetrics: boolean = font.isLinearMetrics();
        expect(linearMetrics == true).assertTrue();
        console.info(msg + ' enableLinearMetrics successed,isSubpixel:' + linearMetrics);
      } catch( e ) {
        console.info(msg + ` enableLinearMetrics errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.enableLinearMetrics(false);
        let linearMetrics: boolean = font.isLinearMetrics();
        expect(linearMetrics == false).assertTrue();
        console.info(msg + ' enableLinearMetrics successed,isSubpixel:' + linearMetrics);
      } catch( e ) {
        console.info(msg + ` enableLinearMetrics errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontIsLinearMetricsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1402
     * @tc.desc   Test for testFontIsLinearMetricsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontIsLinearMetricsMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontIsLinearMetricsMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let linearMetrics: boolean = font.isLinearMetrics();
          expect(linearMetrics == false).assertTrue();
          console.info(msg + ' isLinearMetrics successed,linearMetrics:' + linearMetrics);
        } catch( e ) {
          console.info(msg + ` isLinearMetrics errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontIsEmboldenNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1500
     * @tc.desc   Test for testFontIsEmboldenNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontIsEmboldenNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontIsEmboldenNormal';
      let font = new drawing.Font();

      try {
        font.enableEmbolden(true);
        let embolden: boolean = font.isEmbolden();
        expect(embolden == true).assertTrue();
        console.info(msg + ' enableEmbolden successed,embolden:' + embolden);
      } catch( e ) {
        console.info(msg + ` enableEmbolden errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.enableEmbolden(false);
        let embolden: boolean = font.isEmbolden();
        expect(embolden == false).assertTrue();
        console.info(msg + ' enableEmbolden successed,embolden:' + embolden);
      } catch( e ) {
        console.info(msg + ` enableEmbolden errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontIsEmboldenMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1502
     * @tc.desc   Test for testFontIsEmboldenMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontIsEmboldenMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontIsEmboldenMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let embolden: boolean = font.isEmbolden();
          expect(embolden == false).assertTrue();
          console.info(msg + ' isEmbolden successed,embolden:' + embolden);
        } catch( e ) {
          console.info(msg + ` isEmbolden errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontMeasureSingleCharacterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1600
     * @tc.desc   Test for testFontMeasureSingleCharacterNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureSingleCharacterNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontMeasureSingleCharacterNormal';
      let font = new drawing.Font();

      try {
        let width: number = font.measureSingleCharacter("你");
        expect(width == 12).assertTrue();
        console.info(msg + ' measureSingleCharacter successed,width:' + width);
      } catch( e ) {
        console.info(msg + ` measureSingleCharacter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let width: number = font.measureSingleCharacter("A");
        expect(width == 8).assertTrue();
        console.info(msg + ' measureSingleCharacter successed,width:' + width);
      } catch( e ) {
        console.info(msg + ` measureSingleCharacter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let width: number = font.measureSingleCharacter("1");
        expect(width == 7).assertTrue();
        console.info(msg + ' measureSingleCharacter successed,width:' + width);
      } catch( e ) {
        console.info(msg + ` measureSingleCharacter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontMeasureSingleCharacterNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1601
     * @tc.desc   Test for testFontMeasureSingleCharacterNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureSingleCharacterNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontMeasureSingleCharacterNull';
      let font = new drawing.Font();

      try {
        font.measureSingleCharacter(null);
        console.info(msg + ' measureSingleCharacter succeeded');
      } catch( e ) {
        console.info(msg + ` measureSingleCharacter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.measureSingleCharacter(undefined);
        console.info(msg + ' measureSingleCharacter succeeded');
      } catch( e ) {
        console.info(msg + ` measureSingleCharacter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontMeasureSingleCharacterMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1603
     * @tc.desc   Test for testFontMeasureSingleCharacterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureSingleCharacterMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontMeasureSingleCharacterMultipleCalls';
      let font = new drawing.Font();
      const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

      for ( let i = 0 ; i < 20 ; i ++ ) {
        const randomString = characters.charAt(Math.floor(Math.random()*characters.length));
        try {
          let width: number = font.measureSingleCharacter(randomString)
          console.info(msg + ' measureSingleCharacter successed,width:' + width);
        } catch( e ) {
          console.info(msg + ` measureSingleCharacter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontMeasureSingleCharacterAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1604
     * @tc.desc   Test for testFontMeasureSingleCharacterAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureSingleCharacterAbnormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontMeasureSingleCharacterAbnormal';
      let font = new drawing.Font();

      try {
        let width = font.measureSingleCharacter("");
        console.info(msg + ' measureSingleCharacter successed,width:' + width);
      } catch( e ) {
        console.info(msg + ` measureSingleCharacter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let width = font.measureSingleCharacter("abdcdefg");
        console.info(msg + ' measureSingleCharacter successed,width:' + width);
      } catch( e ) {
        console.info(msg + ` measureSingleCharacter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontSetAndIsBaselineSnapNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1700
     * @tc.desc   Test for testFontSetAndIsBaselineSnapNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndIsBaselineSnapNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontSetAndIsBaselineSnapNormal';
      let font = new drawing.Font();

      try {
        let baselineSnap: boolean = font.isBaselineSnap();
        expect(baselineSnap == true).assertTrue();
        console.info(msg + ' setAndIsBaselineSnap successed,baselineSnap:' + baselineSnap);
      } catch( e ) {
        console.info(msg + ` setAndIsBaselineSnap errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setBaselineSnap(true);
        let baselineSnap: boolean = font.isBaselineSnap();
        expect(baselineSnap == true).assertTrue();
        console.info(msg + ' setAndIsBaselineSnap successed,baselineSnap:' + baselineSnap);
      } catch( e ) {
        console.info(msg + ` setAndIsBaselineSnap errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setBaselineSnap(false);
        let baselineSnap: boolean = font.isBaselineSnap();
        expect(baselineSnap == false).assertTrue();
        console.info(msg + ' setAndIsBaselineSnap successed,baselineSnap:' + baselineSnap);
      } catch( e ) {
        console.info(msg + ` setAndIsBaselineSnap errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontSetAndIsBaselineSnapNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1701
     * @tc.desc   Test for testFontSetAndIsBaselineSnapNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndIsBaselineSnapNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndIsBaselineSnapNull';
      let font = new drawing.Font();

      try {
        font.setBaselineSnap(null);
        console.info(msg + ' setAndIsBaselineSnap successed');
      } catch( e ) {
        console.info(msg + ` setAndIsBaselineSnap errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.setBaselineSnap(undefined);
        console.info(msg + ' setAndIsBaselineSnap succeeded');
      } catch( e ) {
        console.info(msg + ` setAndIsBaselineSnap errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontSetAndIsBaselineSnapMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1703
     * @tc.desc   Test for testFontSetAndIsBaselineSnapMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndIsBaselineSnapMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndIsBaselineSnapMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          const randomBoolean = Math.random() < 0.5;
          font.setBaselineSnap(randomBoolean);
          let baselineSnap: boolean = font.isBaselineSnap();
          console.info(msg + ' setAndIsBaselineSnap successed,baselineSnap:' + baselineSnap);
        } catch( e ) {
          console.info(msg + ` setAndIsBaselineSnap errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          const randomBoolean = Math.random() < 0.5;
          font.setBaselineSnap(randomBoolean);
          console.info(msg + ' setBaselineSnap successed');
        } catch( e ) {
          console.info(msg + ` setBaselineSnap errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let baselineSnap: boolean = font.isBaselineSnap();
          console.info(msg + ' isBaselineSnap successed,baselineSnap:' + baselineSnap);
        } catch( e ) {
          console.info(msg + ` isBaselineSnap errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetAndIsForceAutoHintingNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1800
     * @tc.desc   Test for testFontSetAndIsForceAutoHintingNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndIsForceAutoHintingNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontSetAndIsForceAutoHintingNormal';
      let font = new drawing.Font();

      try {
        let forceAutoHinting: boolean = font.isForceAutoHinting();
        expect(forceAutoHinting == false).assertTrue();
        console.info(msg + ' SetAndIsForceAutoHinting successed,isForceAutoHinting:' + forceAutoHinting);
      } catch( e ) {
        console.info(msg + ` SetAndIsForceAutoHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setForceAutoHinting(true);
        let forceAutoHinting: boolean = font.isForceAutoHinting();
        expect(forceAutoHinting == true).assertTrue();
        console.info(msg + ' SetAndIsForceAutoHinting successed,isForceAutoHinting:' + forceAutoHinting);
      } catch( e ) {
        console.info(msg + ` SetAndIsForceAutoHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setForceAutoHinting(false);
        let forceAutoHinting: boolean = font.isForceAutoHinting();
        expect(forceAutoHinting == false).assertTrue();
        console.info(msg + ' SetAndIsForceAutoHinting successed,isForceAutoHinting:' + forceAutoHinting);
      } catch( e ) {
        console.info(msg + ` SetAndIsForceAutoHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontSetAndIsForceAutoHintingNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1801
     * @tc.desc   Test for testFontSetAndIsForceAutoHintingNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndIsForceAutoHintingNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndIsForceAutoHintingNull';
      let font = new drawing.Font();

      try {
        font.setForceAutoHinting(null);
        console.info(msg + ' setForceAutoHinting successed');
      } catch( e ) {
        console.info(msg + ` setForceAutoHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.setForceAutoHinting(undefined);
        console.info(msg + ' setForceAutoHinting succeeded');
      } catch( e ) {
        console.info(msg + ` setForceAutoHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontSetAndIsForceAutoHintingMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1803
     * @tc.desc   Test for testFontSetAndIsForceAutoHintingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndIsForceAutoHintingMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndIsForceAutoHintingMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          const randomBoolean = Math.random() < 0.5;
          font.setForceAutoHinting(randomBoolean);
          let forceAutoHinting: boolean = font.isForceAutoHinting();
          console.info(msg + ' setAndIsForceAutoHinting successed,forceAutoHinting:' + forceAutoHinting);
        } catch( e ) {
          console.info(msg + ` setAndIsForceAutoHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          const randomBoolean = Math.random() < 0.5;
          font.setForceAutoHinting(randomBoolean);
          console.info(msg + ' setForceAutoHinting successed');
        } catch( e ) {
          console.info(msg + ` setForceAutoHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let forceAutoHinting: boolean = font.isForceAutoHinting();
          console.info(msg + ' isForceAutoHinting successed,forceAutoHinting:' + forceAutoHinting);
        } catch( e ) {
          console.info(msg + ` isForceAutoHinting errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetAndIsEmbeddedBitmapsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1900
     * @tc.desc   Test for testFontSetAndIsEmbeddedBitmapsNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndIsEmbeddedBitmapsNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontSetAndIsEmbeddedBitmapsNormal';
      let font = new drawing.Font();

      try {
        let embeddedBitmaps: boolean = font.isEmbeddedBitmaps();
        expect(embeddedBitmaps == false).assertTrue();
        console.info(msg + ' isEmbeddedBitmaps successed');
      } catch( e ) {
        console.info(msg + ` isEmbeddedBitmaps errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setEmbeddedBitmaps(true);
        let embeddedBitmaps: boolean = font.isEmbeddedBitmaps();
        expect(embeddedBitmaps == true).assertTrue();
        console.info(msg + ' setAndIsEmbeddedBitmaps successed,embeddedBitmaps:' + embeddedBitmaps);
      } catch( e ) {
        console.info(msg + ` setAndIsEmbeddedBitmaps errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        font.setEmbeddedBitmaps(false);
        let embeddedBitmaps: boolean = font.isEmbeddedBitmaps();
        expect(embeddedBitmaps == false).assertTrue();
        console.info(msg + ' setAndIsEmbeddedBitmaps successed,embeddedBitmaps:' + embeddedBitmaps);
      } catch( e ) {
        console.info(msg + ` setAndIsEmbeddedBitmaps errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontSetAndIsEmbeddedBitmapsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1901
     * @tc.desc   Test for testFontSetAndIsEmbeddedBitmapsNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndIsEmbeddedBitmapsNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndIsEmbeddedBitmapsNull';
      let font = new drawing.Font();

      try {
        font.setEmbeddedBitmaps(null);
        console.info(msg + ' setEmbeddedBitmaps successed');
      } catch( e ) {
        console.info(msg + ` setEmbeddedBitmaps errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.setEmbeddedBitmaps(undefined);
        console.info(msg + ' setEmbeddedBitmaps succeeded');
      } catch( e ) {
        console.info(msg + ` setEmbeddedBitmaps errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontSetAndIsEmbeddedBitmapsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1903
     * @tc.desc   Test for testFontSetAndIsEmbeddedBitmapsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndIsEmbeddedBitmapsMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndIsEmbeddedBitmapsMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          const randomBoolean = Math.random() < 0.5;
          font.setEmbeddedBitmaps(randomBoolean);
          let embeddedBitmaps: boolean = font.isEmbeddedBitmaps();
          console.info(msg + ' setAndIsEmbeddedBitmaps successed,embeddedBitmaps:' + embeddedBitmaps);
        } catch( e ) {
          console.info(msg + ` setAndIsEmbeddedBitmaps errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          const randomBoolean = Math.random() < 0.5;
          font.setEmbeddedBitmaps(randomBoolean);
          console.info(msg + ' setEmbeddedBitmaps successed');
        } catch( e ) {
          console.info(msg + ` setEmbeddedBitmaps errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let embeddedBitmaps: boolean = font.isEmbeddedBitmaps();
          console.info(msg + ' isEmbeddedBitmaps successed,embeddedBitmaps:' + embeddedBitmaps);
        } catch( e ) {
          console.info(msg + ` isEmbeddedBitmaps errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontGetTextPathForCharacterNormal1
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1904
     * @tc.desc   Test for testFontGetTextPathForCharacterNormal1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathForCharacterNormal1' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontGetTextPathForCharacterNormal1';
      let font = new drawing.Font();
      let myString: string = "Hello, TypeScript!";
      let path: drawing.Path | null = null;
      try {
        path = font.getTextPath(myString, buffer.from(myString).length, 0, 200);
        expect(path).not().assertNull();
        expect(path.getLength(false)).assertLarger(0);
        console.info(msg + ' getTextPath successed');
      } catch(e) {
        console.info(msg + ' getTextPath failed');
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetTextPathForCharacterNormal2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1905
     * @tc.desc   Test for testFontGetTextPathForCharacterNormal2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathForCharacterNormal2' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontGetTextPathForCharacterNormal2';
      let font = new drawing.Font();
      try {
        let myString: string = " ";
        let path = font.getTextPath(myString, buffer.from(myString).length, 0, 200);
        expect(path).not().assertNull();
        expect(path.getLength(false) == 0).assertTrue();
        console.info(msg + ' GetTextPath successed,path length:' + path.getLength(false));
      } catch( e ) {
        console.info(msg + ` GetTextPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetTextPathForCharacterNormal3
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1906
     * @tc.desc   Test for testFontGetTextPathForCharacterNormal3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathForCharacterNormal3' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontGetTextPathForCharacterNormal3';
      let font = new drawing.Font();
      try {
        let myString: string = "Hello, TypeScript!";
        let path = font.getTextPath(myString, buffer.from(myString).length, -1, -1);
        expect(path).not().assertNull();
        console.info(msg + ' GetTextPath successed');
      } catch( e ) {
        console.info(msg + ` GetTextPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetTextPathForCharacterNormal4
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1907
     * @tc.desc   Test for testFontGetTextPathForCharacterNormal4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathForCharacterNormal4' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontGetTextPathForCharacterNormal4';
      let font = new drawing.Font();
      let flag = false;
      let myString: string = "Hello, TypeScript!";
      try {
        let path = font.getTextPath(myString, buffer.from(myString).length, 0, 200);
        if(path.getLength(false) >= 0){
          flag = true
        }
        expect(path).not().assertNull();
        expect(flag).assertEqual(true);
        console.info(msg + ' GetTextPath successed');
      } catch( e ) {
        console.info(msg + ` GetTextPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        font.getTextPath('', buffer.from(myString).length, -1, -1);
        console.info(msg + ` 2 GetTextPath success`);
      } catch( e ) {
        console.info(msg + ` 2 GetTextPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetTextPathParameterError1
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1907
     * @tc.desc   Test for testFontGetTextPathParameterError1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathParameterError1' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontGetTextPathParameterError1';
      let font = new drawing.Font();
      let myString: string = "Hello, TypeScript!";
      try {
        font.getTextPath(null, buffer.from(myString).length, -1, -1);
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 1 GetTextPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.getTextPath(undefined, buffer.from(myString).length, -1, -1);
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` 2 GetTextPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontGetTextPathParameterError2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1908
     * @tc.desc   Test for testFontGetTextPathParameterError2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathParameterError2' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontGetTextPathParameterError2';
      let font = new drawing.Font();
      let myString: string = "Hello, TypeScript!";
      try {
        font.getTextPath(myString, null, -1, -1);
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` GetTextPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().not().assertFail();
      }

      try {
        font.getTextPath(myString, undefined, -1, -1);
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` GetTextPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().not().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetTextPathParameterError3
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1909
     * @tc.desc   Test for testFontGetTextPathParameterError3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathParameterError3' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontGetTextPathParameterError3';
      let font = new drawing.Font();
      let myString: string = "Hello, TypeScript!";
      try {
        font.getTextPath(myString, buffer.from(myString).length, null, -1);
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` GetTextPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().not().assertFail();
      }

      try {
        font.getTextPath(myString, buffer.from(myString).length, undefined, -1);
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` GetTextPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().not().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetTextPathParameterError4
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1910
     * @tc.desc   Test for testFontGetTextPathParameterError4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathParameterError4' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontGetTextPathParameterError4';
      let font = new drawing.Font();
      let myString: string = "Hello, TypeScript!";
      try {
        font.getTextPath(myString, buffer.from(myString).length, 0, null);
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` GetTextPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().not().assertFail();
      }

      try {
        font.getTextPath(myString, buffer.from(myString).length, 0, undefined);
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` GetTextPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().not().assertFail();
      }
    });

  });
}
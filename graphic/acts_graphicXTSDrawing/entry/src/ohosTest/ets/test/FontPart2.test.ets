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

import { afterAll , afterEach , beforeAll , beforeEach , describe , expect , it } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import { getEnumCount } from './utils';

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0800
     * @tc.name      : testFontCountTextTextNormal
     * @tc.desc      : Test for testFontCountTextTextNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontCountTextTextNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0801
     * @tc.name      : testFontCountTextTextNull
     * @tc.desc      : Test for testFontCountTextTextNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontCountTextTextNull' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0803
     * @tc.name      : testFontCountTextTextMultipleCalls
     * @tc.desc      : Test for testFontCountTextTextMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontCountTextTextMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0900
     * @tc.name      : testFontSetAndGetEdgingNormal
     * @tc.desc      : Test for testFontSetAndGetEdgingNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontSetAndGetEdgingNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0901
     * @tc.name      : testFontSetAndGetEdgingNull
     * @tc.desc      : Test for testFontSetAndGetEdgingNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndGetEdgingNull' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0903
     * @tc.name      : testFontSetAndGetEdgingMultipleCalls
     * @tc.desc      : Test for testFontSetAndGetEdgingMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndGetEdgingMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0904
     * @tc.name      : testFontSetAndGetEdgingAbnormal
     * @tc.desc      : Test for testFontSetAndGetEdgingAbnormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndGetEdgingAbnormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1000
     * @tc.name      : testFontSetAndGetHintingNormal
     * @tc.desc      : Test for testFontSetAndGetHintingNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontSetAndGetHintingNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1001
     * @tc.name      : testFontSetAndGetHintingNull
     * @tc.desc      : Test for testFontSetAndGetHintingNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndGetHintingNull' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1003
     * @tc.name      : testFontSetAndGetHintingMultipleCalls
     * @tc.desc      : Test for testFontSetAndGetHintingMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndGetHintingMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1004
     * @tc.name      : testFontSetAndGetHintingAbnormal
     * @tc.desc      : Test for testFontSetAndGetHintingAbnormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndGetHintingAbnormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1100
     * @tc.name      : testFontSetAndGetScaleXNormal
     * @tc.desc      : Test for testFontSetAndGetScaleXNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontSetAndGetScaleXNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1101
     * @tc.name      : testFontSetAndGetScaleXNull
     * @tc.desc      : Test for testFontSetAndGetScaleXNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndGetScaleXNull' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1103
     * @tc.name      : testFontSetAndGetScaleXMultipleCalls
     * @tc.desc      : Test for testFontSetAndGetScaleXMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndGetScaleXMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1200
     * @tc.name      : testFontSetAndGetSkewXNormal
     * @tc.desc      : Test for testFontSetAndGetSkewXNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontSetAndGetSkewXNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1201
     * @tc.name      : testFontSetAndGetSkewXNull
     * @tc.desc      : Test for testFontSetAndGetSkewXNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndGetSkewXNull' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1203
     * @tc.name      : testFontSetAndGetSkewXMultipleCalls
     * @tc.desc      : Test for testFontSetAndGetSkewXMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndGetSkewXMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1300
     * @tc.name      : testFontIsSubpixelNormal
     * @tc.desc      : Test for testFontIsSubpixelNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontIsSubpixelNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1303
     * @tc.name      : testFontIsSubpixelMultipleCalls
     * @tc.desc      : Test for testFontIsSubpixelMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontIsSubpixelMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1400
     * @tc.name      : testFontIsLinearMetricsNormal
     * @tc.desc      : Test for testFontIsLinearMetricsNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontIsLinearMetricsNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1402
     * @tc.name      : testFontIsLinearMetricsMultipleCalls
     * @tc.desc      : Test for testFontIsLinearMetricsMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontIsLinearMetricsMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1500
     * @tc.name      : testFontIsEmboldenNormal
     * @tc.desc      : Test for testFontIsEmboldenNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontIsEmboldenNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1502
     * @tc.name      : testFontIsEmboldenMultipleCalls
     * @tc.desc      : Test for testFontIsEmboldenMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontIsEmboldenMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1600
     * @tc.name      : testFontMeasureSingleCharacterNormal
     * @tc.desc      : Test for testFontMeasureSingleCharacterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontMeasureSingleCharacterNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1601
     * @tc.name      : testFontMeasureSingleCharacterNull
     * @tc.desc      : Test for testFontMeasureSingleCharacterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontMeasureSingleCharacterNull' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1603
     * @tc.name      : testFontMeasureSingleCharacterMultipleCalls
     * @tc.desc      : Test for testFontMeasureSingleCharacterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontMeasureSingleCharacterMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1604
     * @tc.name      : testFontMeasureSingleCharacterAbnormal
     * @tc.desc      : Test for testFontMeasureSingleCharacterAbnormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontMeasureSingleCharacterAbnormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1700
     * @tc.name      : testFontSetAndIsBaselineSnapNormal
     * @tc.desc      : Test for testFontSetAndIsBaselineSnapNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontSetAndIsBaselineSnapNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1701
     * @tc.name      : testFontSetAndIsBaselineSnapNull
     * @tc.desc      : Test for testFontSetAndIsBaselineSnapNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndIsBaselineSnapNull' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1703
     * @tc.name      : testFontSetAndIsBaselineSnapMultipleCalls
     * @tc.desc      : Test for testFontSetAndIsBaselineSnapMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndIsBaselineSnapMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1800
     * @tc.name      : testFontSetAndIsForceAutoHintingNormal
     * @tc.desc      : Test for testFontSetAndIsForceAutoHintingNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontSetAndIsForceAutoHintingNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1801
     * @tc.name      : testFontSetAndIsForceAutoHintingNull
     * @tc.desc      : Test for testFontSetAndIsForceAutoHintingNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndIsForceAutoHintingNull' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1803
     * @tc.name      : testFontSetAndIsForceAutoHintingMultipleCalls
     * @tc.desc      : Test for testFontSetAndIsForceAutoHintingMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndIsForceAutoHintingMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1900
     * @tc.name      : testFontSetAndIsEmbeddedBitmapsNormal
     * @tc.desc      : Test for testFontSetAndIsEmbeddedBitmapsNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontSetAndIsEmbeddedBitmapsNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1901
     * @tc.name      : testFontSetAndIsEmbeddedBitmapsNull
     * @tc.desc      : Test for testFontSetAndIsEmbeddedBitmapsNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndIsEmbeddedBitmapsNull' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_1903
     * @tc.name      : testFontSetAndIsEmbeddedBitmapsMultipleCalls
     * @tc.desc      : Test for testFontSetAndIsEmbeddedBitmapsMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndIsEmbeddedBitmapsMultipleCalls' , DEFAULT , () => {
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
  });
}
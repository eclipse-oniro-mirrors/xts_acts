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
import FaultLogger from '@ohos.faultLogger';
import { getRandomNumber } from './utils';
import common2D from '@ohos.graphics.common2D';

export default function fontPart3Test() {
  describe('DrawingTsFontPart3Test' , () => {
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
     * @tc.name   testFontTextToGlyphsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2000
     * @tc.desc   Test for testFontTextToGlyphsNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontTextToGlyphsNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontTextToGlyphsNormal';
      let font = new drawing.Font();

      try {
        let glyphs : number[] = font.textToGlyphs('奇8龍@Fly#龘2023!*你好');
        expect(glyphs.length == 17).assertTrue();
        console.info(msg + ' textToGlyphs1 successed,glyphs:' + glyphs.length);
      } catch( e ) {
        console.info(msg + ` textToGlyphs1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let glyphs : number[] = font.textToGlyphs('奇8龍@Fly#龘2023!*你好',17);
        expect(glyphs.length == 17).assertTrue();
        console.info(msg + ' textToGlyphs2 successed,glyphs:' + glyphs.length);
      } catch( e ) {
        console.info(msg + ` textToGlyphs2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let glyphs : number[] = font.textToGlyphs("", 0);
        console.info(msg + ' textToGlyphs5 successed,glyphs:' + glyphs);
        expect(glyphs.length == 0).assertEqual(true);
      } catch( e ) {
        console.info(msg + ` textToGlyphs5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontTextToGlyphsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2001
     * @tc.desc   Test for testFontTextToGlyphsNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontTextToGlyphsNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontTextToGlyphsNull';
      let font = new drawing.Font();

      try {
        font.textToGlyphs(null, 2);
        console.info(msg + ' 1 textToGlyphs successed');
      } catch( e ) {
        console.info(msg + ` 1 textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        font.textToGlyphs(undefined, 2);
        console.info(msg + ' 2 textToGlyphs successed');
      } catch( e ) {
        console.info(msg + ` 2 textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.textToGlyphs('奇8龍@Fly#龘2023!*你好', null);
        console.info(msg + ' 3 textToGlyphs succeeded');
      } catch( e ) {
        console.info(msg + ` 3 textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.textToGlyphs(null, 2);
        console.info(msg + ' 4 textToGlyphs successed');
      } catch( e ) {
        console.info(msg + ` 4 textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.textToGlyphs('奇8龍@Fly#龘2023!*你好', undefined);
        console.info(msg + ' 5 textToGlyphs succeeded');
      } catch( e ) {
        console.info(msg + ` 5 textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontTextToGlyphsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2003
     * @tc.desc   Test for testFontTextToGlyphsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontTextToGlyphsMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontTextToGlyphsMultipleCalls';
      let font = new drawing.Font();
      const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

      for ( let i = 0 ; i < 20 ; i ++ ) {  
        let randomString = ''
        for(let j = 0; j < 10 ; j++){
          randomString += characters.charAt(Math.floor(Math.random()*characters.length));
        }
        try {
          let glyphs : number[] = font.textToGlyphs(randomString, 10);
          expect(glyphs.length == 10).assertTrue();
          console.info(msg + ' textToGlyphs successed,glyphs:' + glyphs.length);
        } catch( e ) {
          console.info(msg + ` textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontTextToGlyphsAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2004
     * @tc.desc   Test for testFontTextToGlyphsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontTextToGlyphsAbnormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontTextToGlyphsAbnormal';
      let font = new drawing.Font();

      try {
        let glyphs : number[] = font.textToGlyphs('奇8龍@Fly#龘2023!*你好',15);
        console.info(msg + ' textToGlyphs succeeded');
      } catch( e ) {
        console.info(msg + ` textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let glyphs : number[] = font.textToGlyphs('奇8龍@Fly#龘2023!*你好',20);
        console.info(msg + ' textToGlyphs succeeded');
      } catch( e ) {
        console.info(msg + ` textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let glyphs : number[] = font.textToGlyphs("", -1);
        console.info(msg + ' textToGlyphs succeeded');
      } catch( e ) {
        console.info(msg + ` textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontGetWidthsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2100
     * @tc.desc   Test for testFontGetWidthsNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetWidthsNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontGetWidthsNormal';
      let font = new drawing.Font();

      try {
        let widths : number[] = font.getWidths([0]);
        expect(widths.length == 1).assertTrue();
        console.info(msg + ' getWidths successed,widths:' + widths.length);
      } catch( e ) {
        console.info(msg + ` getWidths errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let widths : number[] = font.getWidths([]);
        expect(widths == undefined).assertTrue();
        console.info(msg + ' getWidths successed,widths:' + widths);
      } catch( e ) {
        console.info(msg + ` getWidths errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testFontGetWidthsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2101
     * @tc.desc   Test for testFontGetWidthsNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetWidthsNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontGetWidthsNull';
      let font = new drawing.Font();

      try {
        font.getWidths(null);
        console.info(msg + ' getWidths successed');
      } catch( e ) {
        console.info(msg + ` getWidths errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.getWidths(undefined);
        console.info(msg + ' getWidths succeeded');
      } catch( e ) {
        console.info(msg + ` getWidths errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontGetWidthsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2103
     * @tc.desc   Test for testFontGetWidthsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetWidthsMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontGetWidthsMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          font.getWidths([getRandomNumber(1, 100)]);
          console.info(msg + ' getWidths successed');
        } catch( e ) {
          console.info(msg + ` getWidths errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontGetBoundsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2200
     * @tc.desc   Test for testFontGetBoundsNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetBoundsNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontGetWidthsNormal';
      let font = new drawing.Font();

      try {
        let bounds : common2D.Rect[] = font.getBounds([0]);
        expect(bounds.length == 1).assertTrue();
        console.info(msg + ' getBounds successed,bounds:' + bounds.length);
      } catch( e ) {
        console.info(msg + ` getBounds errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let bounds : common2D.Rect[] = font.getBounds([Number.MAX_VALUE]);
        expect(bounds.length == 1).assertTrue();
        console.info(msg + ' getBounds successed,bounds:' + bounds.length);
      } catch( e ) {
        console.info(msg + ` getBounds errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let bounds : common2D.Rect[] = font.getBounds([Number.MIN_VALUE]);
        expect(bounds.length == 1).assertTrue();
        console.info(msg + ' getBounds successed,bounds:' + bounds.length);
      } catch( e ) {
        console.info(msg + ` getBounds errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let bounds : common2D.Rect[] = font.getBounds([]);
      } catch( e ) {
        console.info(msg + ` getBounds errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontGetBoundsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2201
     * @tc.desc   Test for testFontGetBoundsNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetBoundsNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontGetBoundsNull';
      let font = new drawing.Font();

      try {
        font.getBounds(null);
        console.info(msg + ' getBounds successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` getBounds errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.getBounds(undefined);
        console.info(msg + ' getBounds succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` getBounds errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontGetBoundsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2203
     * @tc.desc   Test for testFontGetBoundsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetBoundsMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontGetBoundsMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let bounds : common2D.Rect[] = font.getBounds([getRandomNumber(1, 100)]);
          expect(bounds.length == 1).assertTrue();
          console.info(msg + ' getBounds successed');
        } catch( e ) {
          console.info(msg + ` getBounds errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontCreatePathForGlyphNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2300
     * @tc.desc   Test for testFontCreatePathForGlyphNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontCreatePathForGlyphNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontCreatePathForGlyphNormal';
      let font = new drawing.Font();

      try {
        let glyphs : number[] = font.textToGlyphs('hello');
        let path : drawing.Path = font.createPathForGlyph(glyphs[0]);
        expect(path.getLength(false) > 0).assertTrue();
        console.info(msg + ' createPathForGlyph successed,path length:' + path.getLength(false));

      } catch( e ) {
        console.info(msg + ` createPathForGlyph errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let glyphs : number[] = font.textToGlyphs(' ');
        let path : drawing.Path = font.createPathForGlyph(glyphs[0]);
        expect(path.getLength(false) == 0).assertTrue();
        console.info(msg + ' createPathForGlyph successed,path length:' + path.getLength(false));
      } catch( e ) {
        console.info(msg + ` createPathForGlyph errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let path : drawing.Path = font.createPathForGlyph(Number.MAX_VALUE);
        expect(path != undefined).assertTrue();
      } catch( e ) {
        console.info(msg + ` createPathForGlyph errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let path : drawing.Path = font.createPathForGlyph(Number.MIN_VALUE);
        expect(path != undefined).assertTrue();
      } catch( e ) {
        console.info(msg + ` createPathForGlyph errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let path : drawing.Path = font.createPathForGlyph(65535);
        expect(path == undefined).assertTrue();
      } catch( e ) {
        console.info(msg + ` createPathForGlyph errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontCreatePathForGlyphNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2301
     * @tc.desc   Test for testFontCreatePathForGlyphNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontCreatePathForGlyphNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontCreatePathForGlyphNull';
      let font = new drawing.Font();

      try {
        font.createPathForGlyph(null);
        console.info(msg + ' createPathForGlyph successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createPathForGlyph errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.createPathForGlyph(undefined);
        console.info(msg + ' createPathForGlyph succeeded');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createPathForGlyph errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontCreatePathForGlyphMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2303
     * @tc.desc   Test for testFontCreatePathForGlyphMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontCreatePathForGlyphMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontCreatePathForGlyphMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let path : drawing.Path = font.createPathForGlyph(getRandomNumber(1, 100));
          expect(path != undefined).assertTrue();
          console.info(msg + ' createPathForGlyph successed');
        } catch( e ) {
          console.info(msg + ` createPathForGlyph errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testFontSetAndIsThemeFontFollowedMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2203
     * @tc.desc   Test for testFontSetAndIsThemeFontFollowedMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndIsThemeFontFollowedMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndIsThemeFontFollowedMultipleCalls';
      let font = new drawing.Font();
      let followed: boolean = false;
      for ( let i = 0 ; i < 20 ; i ++ ) {
        followed = !followed;
        font.setThemeFontFollowed(followed);
        let finallyFollowed: boolean = font.isThemeFontFollowed()
        console.info(msg + "font is theme font followed: " + finallyFollowed);
        expect(finallyFollowed).assertEqual(followed);
      }
    });
    /**
     * @tc.name   testFontSetAndIsThemeFontFollowedNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2200
     * @tc.desc   Test for testFontSetAndIsThemeFontFollowedNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndIsThemeFontFollowedNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndIsThemeFontFollowedNormal';
      let font = new drawing.Font();
      let initialFollowed: boolean = font.isThemeFontFollowed()
      console.info(msg + "Initial value font is theme font followed: " + initialFollowed);
      expect(initialFollowed).assertEqual(false);
      font.setThemeFontFollowed(true);
      let followed: boolean = font.isThemeFontFollowed()
      console.info(msg + "followed is: " + followed);
      expect(followed).assertEqual(true);
      font.setThemeFontFollowed(false);
      let followed2: boolean = font.isThemeFontFollowed()
      console.info(msg + "followed2 is: " + followed2);
      expect(followed2).assertEqual(false);
    });
    /**
     * @tc.name   testFontSetAndIsThemeFontFollowedNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2201
     * @tc.desc   Test for testFontSetAndIsThemeFontFollowedNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndIsThemeFontFollowedNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testFontSetAndIsThemeFontFollowedNull';
      let font = new drawing.Font();
      try {
        font.setThemeFontFollowed(null);
        console.info(msg + 'setThemeFontFollowed successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + `setThemeFontFollowed null errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
      try {
        font.setThemeFontFollowed(undefined);
        console.info(msg + 'setThemeFontFollowed successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + `setThemeFontFollowed undefined errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    });
    /**
     * @tc.name   testFontMeasureSingleCharacterWithFeaturesNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2400
     * @tc.desc   Test for testFontMeasureSingleCharacterWithFeaturesNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureSingleCharacterWithFeaturesNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testFontMeasureSingleCharacterWithFeaturesNormal';
      const font = new drawing.Font();
      font.setSize(70);
      let fontFeatures : Array<drawing.FontFeature> = [];
      try {
        let width = font.measureSingleCharacterWithFeatures("H", fontFeatures);
        expect(width).assertEqual(52);
        console.info(msg + 'measureSingleCharacterWithFeatures 1 successed width: ' + width);
      } catch (e) {
        console.info(msg + `measureSingleCharacterWithFeatures 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let width2 = font.measureSingleCharacterWithFeatures("你", fontFeatures);
        expect(width2).assertEqual(70);
        console.info(msg + 'measureSingleCharacterWithFeatures 2 successed width2: ' + width2);
      } catch (e) {
        console.info(msg + `measureSingleCharacterWithFeatures 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let width3 = font.measureSingleCharacterWithFeatures("（", fontFeatures);
        expect(width3).assertEqual(70);
        console.info(msg + 'measureSingleCharacterWithFeatures 3 successed width3: ' + width3);
      } catch (e) {
        console.info(msg + `measureSingleCharacterWithFeatures 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let width4 = font.measureSingleCharacterWithFeatures("｛", fontFeatures);
        expect(width4).assertEqual(70);
        console.info(msg + 'measureSingleCharacterWithFeatures 4 successed width4: ' + width4);
      } catch (e) {
        console.info(msg + `measureSingleCharacterWithFeatures 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      fontFeatures.push({name: 'calt', value: 40});
      try {
        let width5 = font.measureSingleCharacterWithFeatures("8", fontFeatures);
        expect(width5).assertEqual(40);
        console.info(msg + 'measureSingleCharacterWithFeatures 5 successed width5: ' + width5);
      } catch (e) {
        console.info(msg + `measureSingleCharacterWithFeatures 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      fontFeatures.push({name: 'calt', value: 40});
      fontFeatures.push({name: 'ccmp', value:11});
      fontFeatures.push({name: 'frac', value:22});
      try {
        let width6 = font.measureSingleCharacterWithFeatures("7", fontFeatures);
        expect(width6).assertEqual(23);
        console.info(msg + 'measureSingleCharacterWithFeatures 6 successed width6: ' + width6);
      } catch (e) {
        console.info(msg + `measureSingleCharacterWithFeatures 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontMeasureSingleCharacterWithFeaturesNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2401
     * @tc.desc   testFontMeasureSingleCharacterWithFeaturesNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureSingleCharacterWithFeaturesNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontMeasureSingleCharacterWithFeaturesNull';
      const font = new drawing.Font();
      font.setSize(70);
      let fontFeatures : Array<drawing.FontFeature> = [];
      try {
        font.measureSingleCharacterWithFeatures(null, fontFeatures);
        console.info(msg + `measureSingleCharacterWithFeatures 1 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `measureSingleCharacterWithFeatures 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        font.measureSingleCharacterWithFeatures(undefined, fontFeatures);
        console.info(msg + `measureSingleCharacterWithFeatures 2 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `measureSingleCharacterWithFeatures 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        font.measureSingleCharacterWithFeatures("H", null);
        console.info(msg + `measureSingleCharacterWithFeatures 3 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `measureSingleCharacterWithFeatures 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        font.measureSingleCharacterWithFeatures("H", undefined);
        console.info(msg + `measureSingleCharacterWithFeatures 4 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `measureSingleCharacterWithFeatures 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testFontMeasureSingleCharacterWithFeaturesMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2403
     * @tc.desc   testFontMeasureSingleCharacterWithFeaturesMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureSingleCharacterWithFeaturesMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontMeasureSingleCharacterWithFeaturesMultipleCalls';
      const font = new drawing.Font();
      for(let i = 0; i < 20; i++) {
        font.setSize(70);
        let fontFeatures : Array<drawing.FontFeature> = [];
        fontFeatures.push({name: 'calt', value: 40});
        try {
          let width = font.measureSingleCharacterWithFeatures("8", fontFeatures);
          console.info(msg + `measureSingleCharacterWithFeatures step: ${i} success width: ${width}`);
          expect(width).assertEqual(40);
        } catch (e) {
          console.info(msg + `measureSingleCharacterWithFeatures  errorCode is:  ${e.code} + errormsg is: ${e.message} step: ${i}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.name   testFontMeasureSingleCharacterWithFeaturesAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2402
     * @tc.desc   testFontMeasureSingleCharacterWithFeaturesAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureSingleCharacterWithFeaturesAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontMeasureSingleCharacterWithFeaturesAbnormal';
      const font = new drawing.Font();
      font.setSize(70);
      let fontFeatures : Array<drawing.FontFeature> = [];
      fontFeatures.push({name: 'calt', value: 40});
      try {
        font.measureSingleCharacterWithFeatures("", fontFeatures);
        console.info(msg + `measureSingleCharacterWithFeatures 1 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `measureSingleCharacterWithFeatures 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
      try {
        font.measureSingleCharacterWithFeatures("aa", fontFeatures);
        console.info(msg + `measureSingleCharacterWithFeatures 2 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `measureSingleCharacterWithFeatures 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
  });
}

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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import common2D from '@ohos.graphics.common2D';
import { getRandomNumber } from './utils';

export default function penPart2Test() {
  describe('DrawingTsPenPart2Test', () => {
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
     * @tc.name   testPenSetImageFilterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1400
     * @tc.desc   Test for testPenSetImageFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetImageFilterNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetImageFilterNormal';
      const pen = new drawing.Pen();
      let imgFilter = new drawing.ImageFilter();

      try {
        pen.setImageFilter(imgFilter);
        console.info(msg + ' setImageFilter successed');
      } catch( e ) {
        console.info(msg + ` setImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        pen.setImageFilter(null);
        console.info(msg + ' setImageFilter(null) succeeded');
      } catch( e ) {
        console.info(msg + ` setImageFilter(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenSetImageFilterNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1401
     * @tc.desc   Test for testPenSetImageFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetImageFilterNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetImageFilterNull';
      const pen = new drawing.Pen();

      try {
        pen.setImageFilter(undefined);
        console.info(msg + ' setImageFilter(undefined) succeeded');
      } catch( e ) {
        console.info(msg + ` setImageFilter(undefined) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testPenSetImageFilterMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1403
     * @tc.desc   Test for testPenSetImageFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetImageFilterMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetImageFilterMultipleCalls';
      const pen = new drawing.Pen();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        let imgFilter = new drawing.ImageFilter();
        try {
          pen.setImageFilter(imgFilter);
          console.info(msg + ' setImageFilter succeeded');
        } catch( e ) {
          console.info(msg + ` setImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenGetColorFilterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1500
     * @tc.desc   Test for testPenGetColorFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetColorFilterNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenGetColorFilterNormal';
      const pen = new drawing.Pen();
      try {
        let cf = drawing.ColorFilter.createLumaColorFilter();
        let cf2 = pen.getColorFilter();
        console.info(msg + ' getColorFilter successed,colorFilter:' + cf2);
      } catch( e ) {
        console.info(msg + ` getColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenGetColorFilterMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1502
     * @tc.desc   Test for testPenGetColorFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetColorFilterMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenGetColorFilterMultipleCalls';
      const pen = new drawing.Pen();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let cf2 = pen.getColorFilter();
          console.info(msg + ' getColorFilter succeeded,colorFilter:' + cf2);
        } catch( e ) {
          console.info(msg + ` getColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenGetFillPathNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1600
     * @tc.desc   Test for testPenGetFillPathNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetFillPathNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenGetFillPathNormal';
      const pen = new drawing.Pen();
      let pathSrc: drawing.Path = new drawing.Path();
      let pathDst: drawing.Path = new drawing.Path();

      try {
        let fillPath = pen.getFillPath(pathSrc, pathDst);
        expect(fillPath == false).assertTrue();
        console.info(msg + ' getFillPath successed,fillPath:'+ fillPath);
      } catch( e ) {
        console.info(msg + ` getFillPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        pathSrc.moveTo(0, 0);
        pathSrc.lineTo(100, 100);
        let fillPath = pen.getFillPath(pathSrc, pathDst);
        expect(fillPath == false).assertTrue();
        console.info(msg + ' getFillPath successed,fillPath:'+ fillPath);
      } catch( e ) {
        console.info(msg + ` getFillPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        pen.setStrokeWidth(5);
        let fillPath = pen.getFillPath(pathSrc, pathDst);
        expect(fillPath == true).assertTrue();
        console.info(msg + ' getFillPath successed, 3 fillPath:'+ fillPath);
      } catch( e ) {
        console.info(msg + ` getFillPath errorCode 3 is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenGetFillPathNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1601
     * @tc.desc   Test for testPenGetFillPathNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetFillPathNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenGetFillPathNull';
      const pen = new drawing.Pen();
      let pathSrc: drawing.Path = new drawing.Path();
      let pathDst: drawing.Path = new drawing.Path();

      try {
        pen.getFillPath(null, pathDst);
        console.info(msg + ' getFillPath(null) succeeded');
      } catch( e ) {
        console.info(msg + ` getFillPath(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.getFillPath(pathSrc, null);
        console.info(msg + ' getFillPath(null) succeeded');
      } catch( e ) {
        console.info(msg + ` getFillPath(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.getFillPath(undefined, pathDst);
        console.info(msg + ' getFillPath(undefined) succeeded');
      } catch( e ) {
        console.info(msg + ` getFillPath(undefined) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.getFillPath(pathSrc, undefined);
        console.info(msg + ' getFillPath(undefined) succeeded');
      } catch( e ) {
        console.info(msg + ` getFillPath(undefined) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testPenGetFillPathMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1603
     * @tc.desc   Test for testPenGetFillPathMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetFillPathMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenGetFillPathMultipleCalls';
      const pen = new drawing.Pen();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        let pathSrc: drawing.Path = new drawing.Path();
        let pathDst: drawing.Path = new drawing.Path();
        try {
          let fillPath = pen.getFillPath(pathSrc, pathDst);
          expect(fillPath == false).assertTrue();
          console.info(msg + ' getFillPath successed,fillPath:'+ fillPath);
        } catch( e ) {
          console.info(msg + ` getFillPath errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenConstructorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1700
     * @tc.desc   Test for testPenConstructorNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenConstructorNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenConstructorNormal';
      const pen = new drawing.Pen();

      try {
        const pen = new drawing.Pen();
        console.info(msg + ' drawing.Pen() successed');
      } catch( e ) {
        console.info(msg + ` drawing.Pen() errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        const newpen = new drawing.Pen(pen);
        console.info(msg + ' drawing.Pen(pen) successed');
      } catch( e ) {
        console.info(msg + ` drawing.Pen(pen) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let penColor: common2D.Color = ({
          alpha : 0, red : 0, green : 0, blue : 0
        });
        pen.setColor(penColor);
        let newpen = new drawing.Pen(pen);
        console.info(msg + ' drawing.Pen(pen) successed');
      } catch( e ) {
        console.info(msg + ` drawing.Pen(pen) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenConstructorMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1703
     * @tc.desc   Test for testPenConstructorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenConstructorMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenConstructorMultipleCalls';

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          const pen = new drawing.Pen();
          const newpen = new drawing.Pen(pen);
          console.info(msg + ' drawing.Pen(pen) succeeded');
        } catch( e ) {
          console.info(msg + ` drawing.Pen(pen) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenGetAlphaNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1800
     * @tc.desc   Test for testPenGetAlphaNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetAlphaNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenGetAlphaNormal';
      const pen = new drawing.Pen();
      try {
        let alpha = pen.getAlpha();
        expect(alpha == 255).assertTrue();
        console.info(msg + ' pen.getAlpha() successed,alpha:' + alpha);
      } catch( e ) {
        console.info(msg + ` pen.getAlpha() errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        pen.setAlpha(128);
        let alpha = pen.getAlpha();
        expect(alpha == 128).assertTrue();
        console.info(msg + ' pen.getAlpha() successed,alpha:' + alpha);
      } catch( e ) {
        console.info(msg + ` pen.getAlpha() errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        pen.setAlpha(255.1);
        let alpha = pen.getAlpha();
        expect(alpha == 255).assertTrue();
        console.info(msg + ' pen.getAlpha() successed,alpha:' + alpha);
      } catch( e ) {
        console.info(msg + ` pen.getAlpha() errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenGetAlphaMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1802
     * @tc.desc   Test for testPenGetAlphaMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetAlphaMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenGetAlphaMultipleCalls';
      const pen = new drawing.Pen();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let alpha = pen.getAlpha();
          console.info(msg + ' pen.getAlpha() successed,alpha:' + alpha);
        } catch( e ) {
          console.info(msg + ` pen.getAlpha() errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenIsAntiAliasNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1900
     * @tc.desc   Test for testPenIsAntiAliasNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenIsAntiAliasNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenIsAntiAliasNormal';
      const pen = new drawing.Pen();

      try {
        let isAntiAlias = pen.isAntiAlias();
        expect(isAntiAlias == false).assertTrue();
        console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
      } catch( e ) {
        console.info(msg + ` isAntiAlias errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        pen.setAntiAlias(true);
        let isAntiAlias = pen.isAntiAlias();
        expect(isAntiAlias == true).assertTrue()
        console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
      } catch( e ) {
        console.info(msg + ` isAntiAlias errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        pen.setAntiAlias(false);
        let isAntiAlias = pen.isAntiAlias();
        expect(isAntiAlias == false).assertTrue()
        console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
      } catch( e ) {
        console.info(msg + ` isAntiAlias errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenIsAntiAliasMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1902
     * @tc.desc   Test for testPenIsAntiAliasMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenIsAntiAliasMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenIsAntiAliasMultipleCalls';
      const pen = new drawing.Pen();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let isAntiAlias = pen.isAntiAlias();
          expect(isAntiAlias == false).assertTrue();
          console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
        } catch( e ) {
          console.info(msg + ` isAntiAlias errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenGetColorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2000
     * @tc.desc   Test for testPenGetColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetColorNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenGetColorNormal';
      const pen = new drawing.Pen();
      try {
        let colorGet = pen.getColor();
        expect(colorGet != null).assertTrue();
        console.info(msg + ' getColor successed,colorGet:' + JSON.stringify(colorGet));
      } catch( e ) {
        console.info(msg + ` getColor errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        const colors : common2D.Color ={
          alpha : 0, red : 0, green : 0, blue : 0
        }
        pen.setColor(colors);
        let colorGet = pen.getColor();
        expect(colors.alpha == colorGet.alpha).assertTrue();
        expect(colors.red == colorGet.red).assertTrue();
        expect(colors.green == colorGet.green).assertTrue();
        expect(colors.blue == colorGet.blue).assertTrue();
        console.info(msg + ' getColor 2 successed,colorGet:'+ JSON.stringify(colorGet));
        console.info(`${msg} 2 colorGet.alpha: ${colorGet.alpha} colorGet.red: ${colorGet.red} colorGet.green: ${colorGet.green} colorGet.blue: ${colorGet.blue}`);
        console.info(msg + ' getColor 2 successed,colors:'+ JSON.stringify(colors));
        console.info(`${msg} 2 colors.alpha: ${colors.alpha} colors.red: ${colors.red} colors.green: ${colors.green} colors.blue: ${colors.blue}`);
      } catch( e ) {
        console.info(msg + ` getColor2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        const colors : common2D.Color ={
          alpha : 255, red : 255, green : 255, blue : 255
        }
        pen.setColor(colors);
        let colorGet = pen.getColor();
        expect(colors.alpha == colorGet.alpha).assertTrue();
        expect(colors.red == colorGet.red).assertTrue();
        expect(colors.green == colorGet.green).assertTrue();
        expect(colors.blue == colorGet.blue).assertTrue();
        console.info(msg + ' getColor 3 successed,colorGet:'+ JSON.stringify(colorGet));
        console.info(`${msg} 3 colorGet.alpha: ${colorGet.alpha} colorGet.red: ${colorGet.red} colorGet.green: ${colorGet.green} colorGet.blue: ${colorGet.blue}`);
        console.info(msg + ' getColor 3 successed,colors:'+ JSON.stringify(colors));
        console.info(`${msg} 3 colors.alpha: ${colors.alpha} colors.red: ${colors.red} colors.green: ${colors.green} colors.blue: ${colors.blue}`);
      } catch( e ) {
        console.info(msg + ` getColor errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenGetColorMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2002
     * @tc.desc   Test for testPenGetColorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetColorMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenGetColorMultipleCalls';
      const pen = new drawing.Pen();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let colorGet = pen.getColor();
          console.info(msg + ' getColor successed,colorGet:' + JSON.stringify(colorGet));
        } catch( e ) {
          console.info(msg + ` getColor errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenGetWidthNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2100
     * @tc.desc   Test for testPenGetWidthNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetWidthNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenGetWidthNormal';
      const pen = new drawing.Pen();

      try {
        let width = pen.getWidth();
        expect(width == 0).assertTrue();
        console.info(msg + ' getWidth successed,width:' + width);
      } catch( e ) {
        console.info(msg + ` getWidth errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        pen.setStrokeWidth(30);
        let width = pen.getWidth();
        expect(width == 30).assertTrue();
        console.info(msg + ' getWidth successed,width:' + width);
      } catch( e ) {
        console.info(msg + ` getWidth errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        pen.setStrokeWidth(50.1);
        let width = pen.getWidth();
        expect(Math.floor(width) == 50).assertTrue();
        console.info(msg + ' getWidth successed,width:' + width);
      } catch( e ) {
        console.info(msg + ` getWidth errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenGetWidthMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2102
     * @tc.desc   Test for testPenGetWidthMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetWidthMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenGetWidthMultipleCalls';
      const pen = new drawing.Pen();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let width = pen.getWidth();
          expect(width == 0).assertTrue();
          console.info(msg + ' getWidth successed,width:' + width);
        } catch( e ) {
          console.info(msg + ` getWidth errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenSetGetMiterLimitNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2200
     * @tc.desc   Test for testPenSetGetMiterLimitNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetGetMiterLimitNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetGetMiterLimitNormal';
      const pen = new drawing.Pen();

      try {
        let miter = pen.getMiterLimit();
        expect(miter != null).assertTrue();
        console.info(msg + ' getMiterLimit1 successed,miter:' + miter);
      } catch( e ) {
        console.info(msg + ` getMiterLimit1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        pen.setMiterLimit(5);
        let miter = pen.getMiterLimit();
        expect(miter == 5).assertTrue();
        console.info(msg + ' getMiterLimit2 successed,miter:' + miter);
      } catch( e ) {
        console.info(msg + ` getMiterLimit2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        pen.setMiterLimit(20.1);
        let miter = pen.getMiterLimit();
        expect(Math.floor(miter) == 20).assertTrue();
        console.info(msg + ' getMiterLimit3 successed,miter:' + miter);
      } catch( e ) {
        console.info(msg + ` getMiterLimit3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        pen.setMiterLimit(0);
        let miter = pen.getMiterLimit();
        expect(miter == 0).assertTrue();
        console.info(msg + ' getMiterLimit4 successed,miter:' + miter);
      } catch( e ) {
        console.info(msg + ` getMiterLimit4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        pen.setMiterLimit(-1);
        let miter = pen.getMiterLimit();
        expect(miter == -1).assertTrue();
        console.info(msg + ' getMiterLimit5 successed,miter:' + miter);
      } catch( e ) {
        console.info(msg + ` getMiterLimit5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenSetGetMiterLimitNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2201
     * @tc.desc   Test for testPenSetGetMiterLimitNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetGetMiterLimitNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetGetMiterLimitNull';
      const pen = new drawing.Pen();

      try {
        pen.setMiterLimit(undefined);
        console.info(msg + ' setMiterLimit(undefined) succeeded');
      } catch( e ) {
        console.info(msg + ` setMiterLimit(undefined) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setMiterLimit(null);
        console.info(msg + ' setMiterLimit(null) succeeded');
      } catch( e ) {
        console.info(msg + ` setMiterLimit(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testPenSetGetMiterLimitMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2203
     * @tc.desc   Test for testPenSetGetMiterLimitMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetGetMiterLimitMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetGetMiterLimitMultipleCalls';
      const pen = new drawing.Pen();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          pen.setMiterLimit(getRandomNumber(1, 100));
          console.info(msg + ' setMiterLimit succeeded');
        } catch( e ) {
          console.info(msg + ` setMiterLimit errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          pen.getMiterLimit();
          console.info(msg + ' getMiterLimit succeeded');
        } catch( e ) {
          console.info(msg + ` getMiterLimit errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        let randomNumber = getRandomNumber(1, 100)
        try {
          pen.setMiterLimit(randomNumber);
          let miter = pen.getMiterLimit();
          expect(miter == randomNumber).assertTrue();
          console.info(msg + ' setAndGetMiterLimit succeeded');
        } catch( e ) {
          console.info(msg + ` setAndGetMiterLimit errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenSetShaderEffectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2300
     * @tc.desc   Test for testPenSetShaderEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetShaderEffectNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetShaderEffectNormal';
      const pen = new drawing.Pen();
      const shaderEffect = new drawing.ShaderEffect();

      try {
        pen.setShaderEffect(shaderEffect);
        console.info(msg + ' setShaderEffect successed');
      } catch( e ) {
        console.info(msg + ` setShaderEffect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        pen.setShaderEffect(null);
        console.info(msg + ' setShaderEffect successed');
      } catch( e ) {
        console.info(msg + ` setShaderEffect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testPenSetShaderEffectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2301
     * @tc.desc   Test for testPenSetShaderEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetShaderEffectNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetShaderEffectNull';
      const pen = new drawing.Pen();

      try {
        pen.setShaderEffect(undefined);
        console.info(msg + ' setShaderEffect(null) succeeded');
      } catch( e ) {
        console.info(msg + ` setShaderEffect(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testPenSetShaderEffectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2303
     * @tc.desc   Test for testPenSetShaderEffectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetShaderEffectMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetShaderEffectMultipleCalls';
      const pen = new drawing.Pen();
      const shaderEffect = new drawing.ShaderEffect();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          pen.setShaderEffect(shaderEffect);
          console.info(msg + ' setShaderEffect succeeded');
        } catch( e ) {
          console.info(msg + ` setShaderEffect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenResetNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2400
     * @tc.desc   Test for testPenResetNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenResetNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenResetNormal';
      const pen = new drawing.Pen();

      try {
        pen.reset();
        console.info(msg + ' reset successed');
      } catch( e ) {
        console.info(msg + ` reset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        const brush_color: common2D.Color = {
          alpha : 255, // Alpha 透明度，完全不透明
          red : 255, // 红色分量
          green : 0, // 绿色分量
          blue : 0     // 蓝色分量
        };
        pen.setColor(brush_color);
        pen.reset();
        console.info(msg + ' reset successed');
      } catch( e ) {
        console.info(msg + ` reset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenResetMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2402
     * @tc.desc   Test for testPenResetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenResetMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenResetMultipleCalls';
      const pen = new drawing.Pen();
      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          pen.reset();
          console.info(msg + ' reset succeeded');
        } catch( e ) {
          console.info(msg + ` reset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testPenSetAndGetColor4fNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2500
     * @tc.desc   Test for testPenSetAndGetColor4fNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetAndGetColor4fNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetAndGetColor4fNormal';
      const pen = new drawing.Pen();
      // 枚举值除去UNKNOWN与CUSTOM不可用于直接创建色域对象。
      let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG);
      let color4f:common2D.Color4f = {alpha:0.8, red:0.5, green:0.4, blue:0.7};
      try {
        pen.setColor4f(color4f, colorSpace);
        console.info(msg + ' setColor4f successed');
        let color = pen.getColor4f();
        console.info(msg + ' getColor4f successed color is: ' + JSON.stringify(color));
        let dif_alpha = Math.abs(color.alpha-color4f.alpha);
        expect( dif_alpha < 0.0001).assertEqual(true);
        let dif_red = Math.abs(color.red-color4f.red);
        expect( dif_red < 0.0001).assertEqual(true);
        let dif_green = Math.abs(color.green-color4f.green);
        expect( dif_green < 0.0001).assertEqual(true);
        let dif_blue = Math.abs(color.blue-color4f.blue);
        expect( dif_blue < 0.0001).assertEqual(true);
      } catch( e ) {
        console.info(msg + ` 1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        color4f = {alpha:1, red:1, green:1, blue:1};
        pen.setColor4f(color4f, colorSpace);
        let color2 = pen.getColor4f();
        console.info(msg + ' setColor4f 2 successed');
        let color = pen.getColor4f();
        console.info(msg + ' getColor4f 2 successed color2 is: ' + JSON.stringify(color2));
        let dif_alpha = Math.abs(color2.alpha-color4f.alpha);
        expect( dif_alpha < 0.0001).assertEqual(true);
        let dif_red = Math.abs(color2.red-color4f.red);
        expect( dif_red < 0.0001).assertEqual(true);
        let dif_green = Math.abs(color2.green-color4f.green);
        expect( dif_green < 0.0001).assertEqual(true);
        let dif_blue = Math.abs(color2.blue-color4f.blue);
        expect( dif_blue < 0.0001).assertEqual(true);
      } catch( e ) {
        console.info(msg + ` 2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        color4f = {alpha:0, red:0, green:0, blue:0};
        pen.setColor4f(color4f, colorSpace);
        console.info(msg + ' setColor4f 3 successed');
        let color3 = pen.getColor4f();
        console.info(msg + ' getColor4f 3 successed color3 is: ' + JSON.stringify(color3));
        let dif_alpha = Math.abs(color3.alpha-color4f.alpha);
        expect( dif_alpha < 0.0001).assertEqual(true);
        let dif_red = Math.abs(color3.red-color4f.red);
        expect( dif_red < 0.0001).assertEqual(true);
        let dif_green = Math.abs(color3.green-color4f.green);
        expect( dif_green < 0.0001).assertEqual(true);
        let dif_blue = Math.abs(color3.blue-color4f.blue);
        expect( dif_blue < 0.0001).assertEqual(true);
      } catch( e ) {
        console.info(msg + ` 3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        pen.setColor4f(color4f, null);
        console.info(msg + ' setColor4f 4 successed');
        let color4 = pen.getColor4f();
        console.info(msg + ' getColor4f 4 successed color4 is: ' + JSON.stringify(color4));
        let dif_alpha = Math.abs(color4.alpha-color4f.alpha);
        expect( dif_alpha < 0.0001).assertEqual(true);
        let dif_red = Math.abs(color4.red-color4f.red);
        expect( dif_red < 0.0001).assertEqual(true);
        let dif_green = Math.abs(color4.green-color4f.green);
        expect( dif_green < 0.0001).assertEqual(true);
        let dif_blue = Math.abs(color4.blue-color4f.blue);
        expect( dif_blue < 0.0001).assertEqual(true);
      } catch( e ) {
        console.info(msg + ` 4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPenSetAndGetColor4fNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2501
     * @tc.desc   testPenSetAndGetColor4fNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetAndGetColor4fNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetAndGetColor4fNull';
      const pen = new drawing.Pen();
      let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG);
      let color4f:common2D.Color4f = {alpha:0.8, red:0.5, green:0.4, blue:0.7};
      try {
        pen.setColor4f(null, colorSpace);
        console.info(msg + `setColor4f 1 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `setColor4f 1 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        pen.setColor4f(undefined, colorSpace);
        console.info(msg + `setColor4f 2 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `setColor4f 2 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        pen.setColor4f(null, null);
        console.info(msg + `setColor4f 3 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `setColor4f 3 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        pen.setColor4f(color4f, undefined);
        console.info(msg + `setColor4f 4 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `setColor4f 4 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testPenSetAndGetColor4fMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2502
     * @tc.desc   testPenSetAndGetColor4fMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetAndGetColor4fMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetAndGetColor4fMultipleCalls';
      try {
        for (let i = 0; i < 20; i += 1) {
          const pen = new drawing.Pen();
          let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG);
          let color4f:common2D.Color4f = {alpha:Math.random() *1, red:Math.random() *1, green:Math.random() *1, blue:Math.random() *1};
          console.info(msg + 'setColor4f  color4f is ' + JSON.stringify(color4f) +' step: ' +i);
          pen.setColor4f(color4f, colorSpace);
          console.info(msg + 'setColor4f success step is ' + i);
          let color = pen.getColor4f();
          console.info(msg + 'getColor4f success color is ' + JSON.stringify(color) +' step: ' +i);
          let dif_alpha = Math.abs(color.alpha-color4f.alpha);
          expect( dif_alpha < 0.0001).assertEqual(true);
          let dif_red = Math.abs(color.red-color4f.red);
          expect( dif_red < 0.0001).assertEqual(true);
          let dif_green = Math.abs(color.green-color4f.green);
          expect( dif_green < 0.0001).assertEqual(true);
          let dif_blue = Math.abs(color.blue-color4f.blue);
          expect( dif_blue < 0.0001).assertEqual(true);
        }
      } catch (e) {
        console.info(msg + `isInterpolate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPenSetAndGetColor4fBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2503
     * @tc.desc   testPenSetAndGetColor4fBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetAndGetColor4fBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetAndGetColor4fBoundaryValue';
      const pen = new drawing.Pen();
      try {
        pen.setColor4f( {alpha:1.1, red:1, green:1, blue:1}, null);
        console.info(msg + `setColor4f 1 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 1 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect().assertFail()
      }
      try {
        pen.setColor4f( {alpha:-0.999, red:1, green:1, blue:1}, null);
        console.info(msg + `setColor4f 2 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        pen.setColor4f( {alpha:1, red:1.1, green:1, blue:1}, null);
        console.info(msg + `setColor4f 3 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        pen.setColor4f( {alpha:1, red:-0.999, green:1, blue:1}, null);
        console.info(msg + `setColor4f 4 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        pen.setColor4f( {alpha:1, red:1, green:1.1, blue:1}, null);
        console.info(msg + `setColor4f 5 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        pen.setColor4f( {alpha:1, red:1, green:-0.999, blue:1}, null);
        console.info(msg + `setColor4f 6 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        pen.setColor4f( {alpha:1, red:1, green:1, blue:1.1}, null);
        console.info(msg + `setColor4f 7 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        pen.setColor4f( {alpha:1, red:1, green:1, blue:-0.999}, null);
        console.info(msg + `setColor4f 8 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  });
}
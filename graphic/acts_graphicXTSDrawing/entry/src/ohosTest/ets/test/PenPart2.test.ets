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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1400
     * @tc.name      : testPenSetImageFilterNormal
     * @tc.desc      : Test for testPenSetImageFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetImageFilterNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1401
     * @tc.name      : testPenSetImageFilterNull
     * @tc.desc      : Test for testPenSetImageFilterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetImageFilterNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1403
     * @tc.name      : testPenSetImageFilterMultipleCalls
     * @tc.desc      : Test for testPenSetImageFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetImageFilterMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1500
     * @tc.name      : testPenGetColorFilterNormal
     * @tc.desc      : Test for testPenGetColorFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenGetColorFilterNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1502
     * @tc.name      : testPenGetColorFilterMultipleCalls
     * @tc.desc      : Test for testPenGetColorFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenGetColorFilterMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1600
     * @tc.name      : testPenGetFillPathNormal
     * @tc.desc      : Test for testPenGetFillPathNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenGetFillPathNormal', DEFAULT, () => {
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
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1601
     * @tc.name      : testPenGetFillPathNull
     * @tc.desc      : Test for testPenGetFillPathNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenGetFillPathNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1603
     * @tc.name      : testPenGetFillPathMultipleCalls
     * @tc.desc      : Test for testPenGetFillPathMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenGetFillPathMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1700
     * @tc.name      : testPenConstructorNormal
     * @tc.desc      : Test for testPenConstructorNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenConstructorNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1703
     * @tc.name      : testPenConstructorMultipleCalls
     * @tc.desc      : Test for testPenConstructorMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenConstructorMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1800
     * @tc.name      : testPenGetAlphaNormal
     * @tc.desc      : Test for testPenGetAlphaNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenGetAlphaNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1802
     * @tc.name      : testPenGetAlphaMultipleCalls
     * @tc.desc      : Test for testPenGetAlphaMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenGetAlphaMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1900
     * @tc.name      : testPenIsAntiAliasNormal
     * @tc.desc      : Test for testPenIsAntiAliasNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenIsAntiAliasNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1902
     * @tc.name      : testPenIsAntiAliasMultipleCalls
     * @tc.desc      : Test for testPenIsAntiAliasMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenIsAntiAliasMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2000
     * @tc.name      : testPenGetColorNormal
     * @tc.desc      : Test for testPenGetColorNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenGetColorNormal', DEFAULT, () => {
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
        expect(JSON.stringify(colorGet) == JSON.stringify(colors)).assertTrue();
        console.info(msg + ' getColor2 successed,colorGet:'+ JSON.stringify(colorGet));
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
        expect(JSON.stringify(colorGet) == JSON.stringify(colors)).assertTrue();
        console.info(msg + ' getColor2 successed,colorGet:'+ JSON.stringify(colorGet));
      } catch( e ) {
        console.info(msg + ` getColor errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2002
     * @tc.name      : testPenGetColorMultipleCalls
     * @tc.desc      : Test for testPenGetColorMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenGetColorMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2100
     * @tc.name      : testPenGetWidthNormal
     * @tc.desc      : Test for testPenGetWidthNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenGetWidthNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2102
     * @tc.name      : testPenGetWidthMultipleCalls
     * @tc.desc      : Test for testPenGetWidthMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenGetWidthMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2200
     * @tc.name      : testPenSetGetMiterLimitNormal
     * @tc.desc      : Test for testPenSetGetMiterLimitNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetGetMiterLimitNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2201
     * @tc.name      : testPenSetGetMiterLimitNull
     * @tc.desc      : Test for testPenSetGetMiterLimitNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetGetMiterLimitNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2203
     * @tc.name      : testPenSetGetMiterLimitMultipleCalls
     * @tc.desc      : Test for testPenSetGetMiterLimitMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetGetMiterLimitMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2300
     * @tc.name      : testPenSetShaderEffectNormal
     * @tc.desc      : Test for testPenSetShaderEffectNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetShaderEffectNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2301
     * @tc.name      : testPenSetShaderEffectNull
     * @tc.desc      : Test for testPenSetShaderEffectNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetShaderEffectNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2303
     * @tc.name      : testPenSetShaderEffectMultipleCalls
     * @tc.desc      : Test for testPenSetShaderEffectMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetShaderEffectMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2400
     * @tc.name      : testPenResetNormal
     * @tc.desc      : Test for testPenResetNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenResetNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_2402
     * @tc.name      : testPenResetMultipleCalls
     * @tc.desc      : Test for testPenResetMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenResetMultipleCalls', DEFAULT, () => {
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
  });
}
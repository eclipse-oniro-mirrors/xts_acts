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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Size,
  Level
} from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';

export default function fontPart2Test() {
  describe('DrawingTsFontPart2Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {

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
     * @tc.name   testFontCountTextTextNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0800
     * @tc.desc   Test for testFontCountTextTextNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontCountTextTextNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontCountTextTextNormalStatic';
      let font = new drawing.Font();

      try {
        let resultNumber: number = font.countText('ABCDE');
        expect(resultNumber == 5).assertTrue();
        console.info(msg + ' countTextText successed,resultNumber correct');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` countTextText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let resultNumber: number = font.countText('你好');
        expect(resultNumber == 2).assertTrue();
        console.info(msg + ' countTextText successed,resultNumber correct');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` countTextText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let resultNumber: number = font.countText('！@#￥2223@##');
        expect(resultNumber == 11).assertTrue();
        console.info(msg + ' countTextText successed,resultNumber correct');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` countTextText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let resultNumber: number = font.countText('魑魅魍魉');
        expect(resultNumber == 4).assertTrue();
        console.info(msg + ' countTextText successed,resultNumber correct');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` countTextText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let resultNumber: number = font.countText('');
        expect(resultNumber == 0).assertTrue();
        console.info(msg + ' countTextText successed,resultNumber correct');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` countTextText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontCountTextText_MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0803
     * @tc.desc   Test for testFontCountTextText_MultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontCountTextText_MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontCountTextText_MultipleCallsStatic';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        try {
          let resultNumber: number = font.countText('ABCDE');
          expect(resultNumber == 5).assertTrue();
          console.info(msg + ' countTextText successed,resultNumber correct');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` countTextText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetAndGetEdgingNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0900
     * @tc.desc   Test for testFontSetAndGetEdgingNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndGetEdgingNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontSetAndGetEdgingNormalStatic';
      let font = new drawing.Font();

      try {
        font.setEdging(drawing.FontEdging.ALIAS);
        let edging: drawing.FontEdging | undefined= font.getEdging();
        expect(edging == drawing.FontEdging.ALIAS).assertTrue();
        console.info(msg + ' setAndGetEdging successed,GetEdging:' + edging);
        if(edging == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetEdging errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setEdging(drawing.FontEdging.ANTI_ALIAS);
        let edging: drawing.FontEdging | undefined= font.getEdging();
        expect(edging == drawing.FontEdging.ANTI_ALIAS).assertTrue();
        console.info(msg + ' setAndGetEdging successed,GetEdging:' + edging);
        if(edging == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetEdging errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setEdging(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        let edging: drawing.FontEdging | undefined= font.getEdging();
        expect(edging == drawing.FontEdging.SUBPIXEL_ANTI_ALIAS).assertTrue();
        console.info(msg + ' setAndGetEdging successed,GetEdging:' + edging);
        if(edging == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetEdging errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontSetAndGetEdging_MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0903
     * @tc.desc   Test for testFontSetAndGetEdging_MultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetEdging_MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontSetAndGetEdging_MultipleCallsStatic';
      let font = new drawing.Font();
      let itemList: drawing.FontEdging[]= [
        drawing.FontEdging.ALIAS,
        drawing.FontEdging.ANTI_ALIAS,
        drawing.FontEdging.SUBPIXEL_ANTI_ALIAS
      ];
      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(Math.random() * 3).toInt();
        try {
          font.setEdging(itemList[randomEnum]);
          let edging: drawing.FontEdging | undefined= font.getEdging();
          console.info(msg + ' setAndGetEdging successed,GetEdging:' + edging);
          expect(edging == itemList[randomEnum]).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setAndGetEdging errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(Math.random() * 3).toInt();
        try {
          font.setEdging(itemList[randomEnum]);
          console.info(msg + ' setEdging successed');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setEdging errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          let edging: drawing.FontEdging | undefined= font.getEdging();
          console.info(msg + ' getEdging successed,GetEdging:' + edging);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getEdging errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testFontSetAndGetHintingNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1000
     * @tc.desc   Test for testFontSetAndGetHintingNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndGetHintingNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontSetAndGetHintingNormalStatic';
      let font = new drawing.Font();

      try {
        font.setHinting(drawing.FontHinting.NONE);
        let hinting: drawing.FontHinting | undefined= font.getHinting();
        expect(hinting == drawing.FontHinting.NONE).assertTrue();
        console.info(msg + ' setAndGetHinting successed,getHinting:' + hinting);
        if(hinting == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetHinting errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setHinting(drawing.FontHinting.SLIGHT);
        let hinting: drawing.FontHinting | undefined= font.getHinting();
        expect(hinting == drawing.FontHinting.SLIGHT).assertTrue();
        console.info(msg + ' setAndGetHinting successed,getHinting:' + hinting);
        if(hinting == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetHinting errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setHinting(drawing.FontHinting.NORMAL);
        let hinting: drawing.FontHinting | undefined= font.getHinting();
        expect(hinting == drawing.FontHinting.NORMAL).assertTrue();
        console.info(msg + ' setAndGetHinting successed,getHinting:' + hinting);
        if(hinting == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetHinting errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setHinting(drawing.FontHinting.FULL);
        let hinting: drawing.FontHinting | undefined= font.getHinting();
        expect(hinting == drawing.FontHinting.FULL).assertTrue();
        console.info(msg + ' setAndGetHinting successed,getHinting:' + hinting);
        if(hinting == undefined){
          console.info(msg + ' 4 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetHinting errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontSetAndGetHinting_MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1003
     * @tc.desc   Test for testFontSetAndGetHinting_MultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetHinting_MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontSetAndGetHinting_MultipleCallsStatic';
      let font = new drawing.Font();
      let itemList: drawing.FontHinting[]= [
        drawing.FontHinting.NONE,
        drawing.FontHinting.SLIGHT,
        drawing.FontHinting.NORMAL,
        drawing.FontHinting.FULL
      ];
      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(Math.random() * 4).toInt();
        try {
          font.setHinting(itemList[randomEnum]);
          let hinting: drawing.FontHinting | undefined= font.getHinting()
          console.info(msg + ' setAndGetHinting successed,getHinting:' + hinting);
          expect(hinting == itemList[randomEnum]).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setAndGetHinting errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(Math.random() * 4).toInt();
        try {
          font.setHinting(itemList[randomEnum]);
          console.info(msg + ' setHinting successed');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setHinting errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          let hinting: drawing.FontHinting | undefined= font.getHinting();
          console.info(msg + ' getHinting successed,getHinting:' + hinting);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getHinting errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testFontSetAndGetScaleXNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1100
     * @tc.desc   Test for testFontSetAndGetScaleXNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndGetScaleXNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontSetAndGetScaleXNormalStatic';
      let font = new drawing.Font();

      try {
        font.setScaleX(2);
        let scaleX: number = font.getScaleX();
        expect(scaleX == 2).assertTrue();
        console.info(msg + ' setAndGetScaleX successed,getScaleX:' + scaleX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetScaleX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setScaleX(0.5);
        let scaleX: number = font.getScaleX();
        expect(scaleX == 0.5).assertTrue();
        console.info(msg + ' setAndGetScaleX successed,getScaleX:' + scaleX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetScaleX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setScaleX(0);
        let scaleX: number = font.getScaleX();
        expect(scaleX == 0).assertTrue();
        console.info(msg + ' setAndGetScaleX successed,getScaleX:' + scaleX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetScaleX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setScaleX(-1);
        let scaleX: number = font.getScaleX();
        expect(scaleX == -1).assertTrue();
        console.info(msg + ' setAndGetScaleX successed,getScaleX:' + scaleX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetScaleX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontSetAndGetScaleX_MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1103
     * @tc.desc   Test for testFontSetAndGetScaleX_MultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetScaleX_MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontSetAndGetScaleX_MultipleCallsStatic';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        try {
          font.setScaleX(Math.random() * Number.MAX_VALUE);
          let scaleX: number = font.getScaleX();
          console.info(msg + ' setAndGetScaleX successed,getScaleX:' + scaleX);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setAndGetScaleX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          font.setScaleX(Math.random() * Number.MAX_VALUE);
          console.info(msg + ' setScaleX successed');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setScaleX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          let scaleX: number = font.getScaleX();
          console.info(msg + ' getScaleX successed,getScaleX:' + scaleX);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getScaleX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetAndGetSkewXNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1200
     * @tc.desc   Test for testFontSetAndGetSkewXNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndGetSkewXNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontSetAndGetSkewXNormalStatic';
      let font = new drawing.Font();

      try {
        font.setSkewX(2);
        let skewX: number = font.getSkewX();
        expect(skewX == 2).assertTrue();
        console.info(msg + ' setAndGetSkewX successed,getSkewX:' + skewX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetSkewX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setSkewX(0.5);
        let skewX: number = font.getSkewX();
        expect(skewX == 0.5).assertTrue();
        console.info(msg + ' setAndGetSkewX successed,getSkewX:' + skewX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetSkewX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setSkewX(0);
        let skewX: number = font.getSkewX();
        expect(skewX == 0).assertTrue();
        console.info(msg + ' setAndGetSkewX successed,getSkewX:' + skewX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetSkewX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setSkewX(-1);
        let skewX: number = font.getSkewX();
        expect(skewX == -1).assertTrue();
        console.info(msg + ' setAndGetSkewX successed,getSkewX:' + skewX);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetSkewX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontSetAndGetSkewX_MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1203
     * @tc.desc   Test for testFontSetAndGetSkewX_MultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndGetSkewX_MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontSetAndGetSkewX_MultipleCallsStatic';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        try {
          font.setSkewX(Math.random() * Number.MAX_VALUE);
          let skewX: number = font.getSkewX();
          console.info(msg + ' setAndGetSkewX successed,getSkewX:' + skewX);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setAndGetSkewX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          font.setSkewX(Math.random() * Number.MAX_VALUE);
          console.info(msg + ' setSkewX successed');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setSkewX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          let skewX: number = font.getSkewX();
          console.info(msg + ' getSkewX successed,getSkewX:' + skewX);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getSkewX errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontIsSubpixelNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1300
     * @tc.desc   Test for testFontIsSubpixelNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontIsSubpixelNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontIsSubpixelNormalStatic';
      let font = new drawing.Font();

      try {
        font.enableSubpixel(true);
        let subpixel: boolean = font.isSubpixel();
        expect(subpixel == true).assertTrue();
        console.info(msg + ' enableSubpixel successed,isSubpixel:' + subpixel);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` enableSubpixel errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.enableSubpixel(false);
        let subpixel: boolean = font.isSubpixel();
        expect(subpixel == false).assertTrue();
        console.info(msg + ' enableSubpixel successed,isSubpixel:' + subpixel);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` enableSubpixel errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontIsSubpixel_MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1303
     * @tc.desc   Test for testFontIsSubpixel_MultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontIsSubpixel_MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontIsSubpixel_MultipleCallsStatic';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        try {
          let subpixel: boolean = font.isSubpixel();
          expect(subpixel == false).assertTrue();
          console.info(msg + ' isSubpixel successed,isSubpixel:' + subpixel);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` isSubpixel errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontIsLinearMetricsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1400
     * @tc.desc   Test for testFontIsLinearMetricsNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontIsLinearMetricsNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontIsLinearMetricsNormalStatic';
      let font = new drawing.Font();

      try {
        font.enableLinearMetrics(true);
        let linearMetrics: boolean = font.isLinearMetrics();
        expect(linearMetrics == true).assertTrue();
        console.info(msg + ' enableLinearMetrics successed,isSubpixel:' + linearMetrics);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` enableLinearMetrics errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.enableLinearMetrics(false);
        let linearMetrics: boolean = font.isLinearMetrics();
        expect(linearMetrics == false).assertTrue();
        console.info(msg + ' enableLinearMetrics successed,isSubpixel:' + linearMetrics);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` enableLinearMetrics errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontIsLinearMetrics_MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1402
     * @tc.desc   Test for testFontIsLinearMetrics_MultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontIsLinearMetrics_MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontIsLinearMetrics_MultipleCallsStatic';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        try {
          let linearMetrics: boolean = font.isLinearMetrics();
          expect(linearMetrics == false).assertTrue();
          console.info(msg + ' isLinearMetrics successed,linearMetrics:' + linearMetrics);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` isLinearMetrics errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontIsEmboldenNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1500
     * @tc.desc   Test for testFontIsEmboldenNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontIsEmboldenNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontIsEmboldenNormalStatic';
      let font = new drawing.Font();

      try {
        font.enableEmbolden(true);
        let embolden: boolean = font.isEmbolden();
        expect(embolden == true).assertTrue();
        console.info(msg + ' enableEmbolden successed,embolden:' + embolden);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` enableEmbolden errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.enableEmbolden(false);
        let embolden: boolean = font.isEmbolden();
        expect(embolden == false).assertTrue();
        console.info(msg + ' enableEmbolden successed,embolden:' + embolden);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` enableEmbolden errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontIsEmbolden_MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1502
     * @tc.desc   Test for testFontIsEmbolden_MultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontIsEmbolden_MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontIsEmbolden_MultipleCallsStatic';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        try {
          let embolden: boolean = font.isEmbolden();
          expect(embolden == false).assertTrue();
          console.info(msg + ' isEmbolden successed,embolden:' + embolden);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` isEmbolden errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontMeasureSingleCharacterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1600
     * @tc.desc   Test for testFontMeasureSingleCharacterNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureSingleCharacterNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontMeasureSingleCharacterNormalStatic';
      let font = new drawing.Font();

      try {
        let width: number = font.measureSingleCharacter("你");
        expect(width == 12).assertTrue();
        console.info(msg + ' measureSingleCharacter successed,width:' + width);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` measureSingleCharacter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let width: number = font.measureSingleCharacter("A");
        expect(width == 8).assertTrue();
        console.info(msg + ' measureSingleCharacter successed,width:' + width);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` measureSingleCharacter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let width: number = font.measureSingleCharacter("1");
        expect(width == 7).assertTrue();
        console.info(msg + ' measureSingleCharacter successed,width:' + width);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` measureSingleCharacter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontMeasureSingleCharacter_MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1603
     * @tc.desc   Test for testFontMeasureSingleCharacter_MultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureSingleCharacter_MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontMeasureSingleCharacter_MultipleCallsStatic';
      let font = new drawing.Font();
      const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

      for (let i = 0; i < 20; i++) {
        const randomString = characters.charAt(Math.floor(Math.random() * characters.length).toInt());
        try {
          let width: number = font.measureSingleCharacter(randomString+ '')
          console.info(msg + ' measureSingleCharacter successed,width:' + width);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` measureSingleCharacter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontMeasureSingleCharacterAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1604
     * @tc.desc   Test for testFontMeasureSingleCharacterAbNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureSingleCharacterAbNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontMeasureSingleCharacterAbNormalStatic';
      let font = new drawing.Font();

      try {
        let width = font.measureSingleCharacter("");
        console.info(msg + ' measureSingleCharacter successed,width:' + width);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` measureSingleCharacter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let width = font.measureSingleCharacter("abdcdefg");
        console.info(msg + ' measureSingleCharacter successed,width:' + width);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` measureSingleCharacter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontSetAndIsBaselineSnapNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1700
     * @tc.desc   Test for testFontSetAndIsBaselineSnapNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndIsBaselineSnapNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontSetAndIsBaselineSnapNormalStatic';
      let font = new drawing.Font();

      try {
        let baselineSnap: boolean = font.isBaselineSnap();
        expect(baselineSnap == true).assertTrue();
        console.info(msg + ' setAndIsBaselineSnap successed,baselineSnap:' + baselineSnap);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndIsBaselineSnap errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setBaselineSnap(true);
        let baselineSnap: boolean = font.isBaselineSnap();
        expect(baselineSnap == true).assertTrue();
        console.info(msg + ' setAndIsBaselineSnap successed,baselineSnap:' + baselineSnap);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndIsBaselineSnap errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setBaselineSnap(false);
        let baselineSnap: boolean = font.isBaselineSnap();
        expect(baselineSnap == false).assertTrue();
        console.info(msg + ' setAndIsBaselineSnap successed,baselineSnap:' + baselineSnap);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndIsBaselineSnap errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontSetAndIsBaselineSnap_MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1703
     * @tc.desc   Test for testFontSetAndIsBaselineSnap_MultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndIsBaselineSnap_MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontSetAndIsBaselineSnap_MultipleCallsStatic';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        try {
          const randomBoolean = Math.random() < 0.5;
          font.setBaselineSnap(randomBoolean);
          let baselineSnap: boolean = font.isBaselineSnap();
          console.info(msg + ' setAndIsBaselineSnap successed,baselineSnap:' + baselineSnap);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setAndIsBaselineSnap errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          const randomBoolean = Math.random() < 0.5;
          font.setBaselineSnap(randomBoolean);
          console.info(msg + ' setBaselineSnap successed');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setBaselineSnap errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          let baselineSnap: boolean = font.isBaselineSnap();
          console.info(msg + ' isBaselineSnap successed,baselineSnap:' + baselineSnap);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` isBaselineSnap errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetAndIsForceAutoHintingNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1800
     * @tc.desc   Test for testFontSetAndIsForceAutoHintingNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndIsForceAutoHintingNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontSetAndIsForceAutoHintingNormalStatic';
      let font = new drawing.Font();

      try {
        let forceAutoHinting: boolean = font.isForceAutoHinting();
        expect(forceAutoHinting == false).assertTrue();
        console.info(msg + ' SetAndIsForceAutoHinting successed,isForceAutoHinting:' + forceAutoHinting);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndIsForceAutoHinting errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setForceAutoHinting(true);
        let forceAutoHinting: boolean = font.isForceAutoHinting();
        expect(forceAutoHinting == true).assertTrue();
        console.info(msg + ' SetAndIsForceAutoHinting successed,isForceAutoHinting:' + forceAutoHinting);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndIsForceAutoHinting errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setForceAutoHinting(false);
        let forceAutoHinting: boolean = font.isForceAutoHinting();
        expect(forceAutoHinting == false).assertTrue();
        console.info(msg + ' SetAndIsForceAutoHinting successed,isForceAutoHinting:' + forceAutoHinting);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndIsForceAutoHinting errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontSetAndIsForceAutoHinting_MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1803
     * @tc.desc   Test for testFontSetAndIsForceAutoHinting_MultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndIsForceAutoHinting_MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontSetAndIsForceAutoHinting_MultipleCallsStatic';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        try {
          const randomBoolean = Math.random() < 0.5;
          font.setForceAutoHinting(randomBoolean);
          let forceAutoHinting: boolean = font.isForceAutoHinting();
          console.info(msg + ' setAndIsForceAutoHinting successed,forceAutoHinting:' + forceAutoHinting);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setAndIsForceAutoHinting errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          const randomBoolean = Math.random() < 0.5;
          font.setForceAutoHinting(randomBoolean);
          console.info(msg + ' setForceAutoHinting successed');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setForceAutoHinting errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          let forceAutoHinting: boolean = font.isForceAutoHinting();
          console.info(msg + ' isForceAutoHinting successed,forceAutoHinting:' + forceAutoHinting);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` isForceAutoHinting errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetAndIsEmbeddedBitmapsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1900
     * @tc.desc   Test for testFontSetAndIsEmbeddedBitmapsNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetAndIsEmbeddedBitmapsNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontSetAndIsEmbeddedBitmapsNormalStatic';
      let font = new drawing.Font();

      try {
        let embeddedBitmaps: boolean = font.isEmbeddedBitmaps();
        expect(embeddedBitmaps == false).assertTrue();
        console.info(msg + ' isEmbeddedBitmaps successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEmbeddedBitmaps errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setEmbeddedBitmaps(true);
        let embeddedBitmaps: boolean = font.isEmbeddedBitmaps();
        expect(embeddedBitmaps == true).assertTrue();
        console.info(msg + ' setAndIsEmbeddedBitmaps successed,embeddedBitmaps:' + embeddedBitmaps);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndIsEmbeddedBitmaps errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.setEmbeddedBitmaps(false);
        let embeddedBitmaps: boolean = font.isEmbeddedBitmaps();
        expect(embeddedBitmaps == false).assertTrue();
        console.info(msg + ' setAndIsEmbeddedBitmaps successed,embeddedBitmaps:' + embeddedBitmaps);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndIsEmbeddedBitmaps errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontSetAndIsEmbeddedBitmaps_MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1903
     * @tc.desc   Test for testFontSetAndIsEmbeddedBitmaps_MultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetAndIsEmbeddedBitmaps_MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontSetAndIsEmbeddedBitmaps_MultipleCallsStatic';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        try {
          const randomBoolean = Math.random() < 0.5;
          font.setEmbeddedBitmaps(randomBoolean);
          let embeddedBitmaps: boolean = font.isEmbeddedBitmaps();
          console.info(msg + ' setAndIsEmbeddedBitmaps successed,embeddedBitmaps:' + embeddedBitmaps);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setAndIsEmbeddedBitmaps errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          const randomBoolean = Math.random() < 0.5;
          font.setEmbeddedBitmaps(randomBoolean);
          console.info(msg + ' setEmbeddedBitmaps successed');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setEmbeddedBitmaps errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          let embeddedBitmaps: boolean = font.isEmbeddedBitmaps();
          console.info(msg + ' isEmbeddedBitmaps successed,embeddedBitmaps:' + embeddedBitmaps);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` isEmbeddedBitmaps errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testFontGetTextPathForCharacterNormal1Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1904
     * @tc.desc   Test for testFontGetTextPathForCharacterNormal1Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathForCharacterNormal1Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontGetTextPathForCharacterNormal1Static';
      let font = new drawing.Font();
      let myString: string = "Hello, TypeScript!";
      let path: drawing.Path | undefined = undefined;
      try {
        path = font.getTextPath(myString, buffer.from(myString).length, 0, 200);
        expect(path).not().assertNull();
        if (path) {
          let result = path.getLength(false);
          expect(result).assertLarger(0);
        }
        if(path == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
        console.info(msg + ' getTextPath successed');
      } catch (e: BusinessError) {
        console.info(msg + ' getTextPath failed');
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetTextPathForCharacterNormal2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1905
     * @tc.desc   Test for testFontGetTextPathForCharacterNormal2Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathForCharacterNormal2Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontGetTextPathForCharacterNormal2Static';
      let font = new drawing.Font();
      try {
        let myString: string = " ";
        let path = font.getTextPath(myString, buffer.from(myString).length, 0, 200);
        expect(path).not().assertNull();
        if (path) {
          let result = path.getLength(false);
          expect(result == 0).assertTrue();
          console.info(msg + ' GetTextPath successed,path length:' + result);
        }
      } catch (e: BusinessError) {
        console.info(msg + ` GetTextPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetTextPathForCharacterNormal3Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1906
     * @tc.desc   Test for testFontGetTextPathForCharacterNormal3Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathForCharacterNormal3Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontGetTextPathForCharacterNormal3Static';
      let font = new drawing.Font();
      try {
        let myString: string = "Hello, TypeScript!";
        let path = font.getTextPath(myString, buffer.from(myString).length, -1, -1);
        expect(path).not().assertNull();
        console.info(msg + ' GetTextPath successed');
      } catch (e: BusinessError) {
        console.info(msg + ` GetTextPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetTextPathForCharacterNormal4Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_1907
     * @tc.desc   Test for testFontGetTextPathForCharacterNormal4Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetTextPathForCharacterNormal4Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontGetTextPathForCharacterNormal4Static';
      let font = new drawing.Font();
      try {
        let myString: string = "Hello, TypeScript!";
        let path = font.getTextPath(myString, buffer.from(myString).length, 0, 200);
        expect(path).not().assertNull();
        if (path) {
          let result: number = path.getLength(false);
          expect(result >= 0).assertEqual(true);
        }
        console.info(msg + ' GetTextPath successed');
      } catch (e: BusinessError) {
        console.info(msg + ` GetTextPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
  });
}
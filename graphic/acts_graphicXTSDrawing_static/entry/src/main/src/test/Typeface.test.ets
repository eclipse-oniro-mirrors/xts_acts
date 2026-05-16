/*
 * Copyright (C) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import drawing from '@ohos.graphics.drawing';
import { BusinessError } from '@ohos.base';
import { $r, $rawfile, Color, ResourceColor } from '@ohos.arkui.component'

export default function typefaceTest() {
  describe('DrawingTsTypeFaceTest', () => {
    const DEFAULT = 0;
    const FONT_PATH = "/system/fonts/Harmon" + "yOS_Sans_Italic.ttf";

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
     * @tc.name   testTypeFaceGetFamilyNameNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0100
     * @tc.desc   Test for testTypeFaceGetFamilyNameNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTypeFaceGetFamilyNameNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testTypeFaceGetFamilyNameNormalStatic';
      try {
        let font = new drawing.Font();
        let typeface = font.getTypeface();
        if(typeface){
          let familyName = typeface.getFamilyName();
          if(familyName) {
            console.info(msg + ' getFamilyName successed');
          }
          if(familyName == undefined) {
            console.info(msg + ' getFamilyName failed');
            expect().assertFail();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getFamilyName errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTypeFaceGetFamilyNameMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0102
     * @tc.desc   Test for testTypeFaceGetFamilyNameMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeFaceGetFamilyNameMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTypeFaceGetFamilyNameMultipleCallsStatic';

      let font = new drawing.Font();
      let typeface = font.getTypeface();
      if(typeface){
        for (let i = 0; i < 20; i++) {
          try {
            let familyName =  typeface.getFamilyName();
            console.info(msg + ' getFamilyName successed');
            if(familyName == undefined) {
              console.info(msg + ' getFamilyName failed');
              expect().assertFail();
            }
          } catch (e) {
            e = e as BusinessError;
            console.info(msg + ` getFamilyName errorCode is:  ${e.code} + errormsg is: ${e.message}`);
            expect().assertFail();
          }
        }
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromFileNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0200
     * @tc.desc   testTypeFaceMakeFromFileNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTypeFaceMakeFromFileNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testTypeFaceMakeFromFileNormalStatic';
      let font = new drawing.Font();
      try {
        let str = FONT_PATH;
        let mytypeface = drawing.Typeface.makeFromFile(str);
        if(mytypeface == undefined){
          console.info(msg + ' 1 test failed.');
          expect().assertFail();
        }
        mytypeface = drawing.Typeface.makeFromFile("");
        expect(mytypeface == undefined).assertTrue();
        console.info(msg + ' test succeeded.');
      } catch (e) {
        console.info(msg + ` test failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromFileMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0202
     * @tc.desc   testTypeFaceMakeFromFileMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeFaceMakeFromFileMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testTypeFaceMakeFromFileMultipleCallsStatic';
      let font = new drawing.Font();
      try {
        for (let i = 0; i < 20; i += 1) {
          let str = FONT_PATH;
          const mytypeface = drawing.Typeface.makeFromFile(str);
        }
        console.info(msg + ' test succeeded.');
      } catch (e) {
        console.info(msg + ` test failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromFileAbnormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0203
     * @tc.desc   testTypeFaceMakeFromFileAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeFaceMakeFromFileAbnormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testTypeFaceMakeFromFileAbnormalStatic';
      try {
        const mytypeface = drawing.Typeface.makeFromFile("hello_world");
        console.info(msg + ' test failed.');
      } catch (e) {
        console.info(msg + ` test succeeded, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        const mytypeface = drawing.Typeface.makeFromFile("/system/fonts/FakePath.ttf");
        console.info(msg + ' test failed.');
      } catch (e) {
        console.info(msg + ` test succeeded, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromRawFileAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0302
     * @tc.desc   testTypeFaceMakeFromRawFileAbNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeFaceMakeFromRawFileAbNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileAbNormalStatic';
      try {
        const mytypeface: drawing.Typeface | undefined = drawing.Typeface.makeFromRawFile($rawfile('image.png'));
        console.info(msg + ' makeFromRawFile image.png success' + JSON.stringify(mytypeface));
        expect(mytypeface == null).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeFromRawFile image.png errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromRawFileMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0301
     * @tc.desc   testTypeFaceMakeFromRawFileMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeFaceMakeFromRawFileMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileMultipleCallsStatic';
      try {
        for (let i = 0; i < 20; i += 1) {
          let mytypeface: drawing.Typeface | undefined =
            drawing.Typeface.makeFromRawFile($rawfile('HarmonyOS_Sans_Condensed.ttf'));
          console.info(msg + ' makeFromRawFile HarmonyOS_Sans_Condensed.ttf success' + JSON.stringify(mytypeface));
          if (mytypeface) {
            expect(!!mytypeface).assertTrue();
          }
          if(mytypeface == undefined){
            console.info(msg + ' makeFromRawFile  failed' + JSON.stringify(mytypeface));
            expect().assertFail();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeFromRawFile HarmonyOS_Sans_Condensed.ttf errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromRawFileNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0300
     * @tc.desc   testTypeFaceMakeFromRawFileNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeFaceMakeFromRawFileNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileNormalStatic';
      try {
        let mytypeface: drawing.Typeface | undefined =
          drawing.Typeface.makeFromRawFile($rawfile('HarmonyOS_Sans_Condensed.ttf'));
        console.info(msg + ' makeFromRawFile HarmonyOS_Sans_Condensed.ttf success' + JSON.stringify(mytypeface));
        if (mytypeface) {
          expect(!!mytypeface).assertTrue();
        }
        if(mytypeface == undefined){
          console.info(msg + ' makeFromRawFile  mytypeface failed' + JSON.stringify(mytypeface));
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeFromRawFile HarmonyOS_Sans_Condensed.ttf errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let mytypeface2: drawing.Typeface | undefined = drawing.Typeface.makeFromRawFile($rawfile('ttf/HarmonyOS_Sans_Condensed.ttf'));
        console.info(msg + ' makeFromRawFile ttf/HarmonyOS_Sans_Condensed.ttf success' + JSON.stringify(mytypeface2));
        if (mytypeface2) {
          expect(!!mytypeface2).assertTrue();
        }
        if(mytypeface2 == undefined){
          console.info(msg + ' makeFromRawFile  mytypeface2 failed' + JSON.stringify(mytypeface2));
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeFromRawFile ttf/HarmonyOS_Sans_Condensed.ttf errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromFileWithArgumentsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0400
     * @tc.desc   testTypeFaceMakeFromFileWithArgumentsNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTypeFaceMakeFromFileWithArgumentsNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testTypeFaceMakeFromFileWithArgumentsNormalStatic';
      let str = "/system/fonts/HarmonyOS_Sans_Italic.ttf";
      try {
        let typeFaceArgument = new drawing.TypefaceArguments();
        let mytypeface = drawing.Typeface.makeFromFileWithArguments(str, typeFaceArgument!);
        if(mytypeface == undefined){
          console.info(msg + ' makeFromFileWithArguments mytypeface failed');
          expect().assertFail();
        } else {
          console.info(msg + ' makeFromFileWithArguments successed');
          expect(mytypeface != null || mytypeface != undefined).assertTrue()
        }
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromFileWithArgumentsMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0401
     * @tc.desc   testTypeFaceMakeFromFileWithArgumentsMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeFaceMakeFromFileWithArgumentsMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromFileWithArgumentsMultipleCallsStatic';
      for (let i = 0; i < 20; i++) {
        let str = "/system/fonts/HarmonyOS_Sans_Italic.ttf";
        try {
          let typeFaceArgument = new drawing.TypefaceArguments();
          let mytypeface = drawing.Typeface.makeFromFileWithArguments(str, typeFaceArgument!);
          if(mytypeface == undefined){
            console.info(msg + ' makeFromFileWithArguments mytypeface failed');
            expect().assertFail();
          } else {
            console.info(msg + ' makeFromFileWithArguments successed step: ' + i );
            expect(mytypeface != null || mytypeface != undefined).assertTrue()
          }
        } catch (e) {
          console.info(msg + ` makeFromFileWithArguments errorCode is:  ${e.code}, errorMessage is: ${e.message} step: ${i}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromFileWithArgumentsNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0402
     * @tc.desc   testTypeFaceMakeFromFileWithArgumentsNullStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeFaceMakeFromFileWithArgumentsNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromFileWithArgumentsNullStatic';
      try {
        let typeFaceArgument = new drawing.TypefaceArguments();
        let mytypeface5 = drawing.Typeface.makeFromFileWithArguments("", typeFaceArgument!);
        console.info(msg + ` makeFromFileWithArguments mytypeface5 success`);
        expect(mytypeface5).assertEqual(undefined);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeFromFileWithArguments mytypeface5 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromCurrentNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0500
     * @tc.desc   testTypeFaceMakeFromCurrentNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTypeFaceMakeFromCurrentNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testTypeFaceMakeFromCurrentNormalStatic';
      let typeArguments = new drawing.TypefaceArguments();
      let myTypeFace = drawing.Typeface.makeFromFile("/system/fonts/HarmonyOS_Sans.ttf");
      try {
        let  typeFace1 = myTypeFace!.makeFromCurrent(typeArguments);
        if(typeFace1 == undefined){
          console.info(msg + ' makeFromCurrent typeFace1 failed');
          expect().assertFail();
        } else {
          console.info(msg + ' makeFromCurrent typeFace1 successed');
          expect(typeFace1 != null || typeFace1 != undefined).assertTrue()
        }
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments typeFace1 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      typeArguments.addVariation("wght", 100);
      try {
        let  typeFace2 = myTypeFace!.makeFromCurrent(typeArguments);
        if(typeFace2 == undefined){
          console.info(msg + ' makeFromCurrent typeFace2 failed');
          expect().assertFail();
        } else {
          console.info(msg + ' makeFromCurrent typeFace2 successed');
          expect(typeFace2 != null || typeFace2 != undefined).assertTrue()
        }
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments typeFace2  errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromCurrentMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0501
     * @tc.desc   testTypeFaceMakeFromCurrentMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeFaceMakeFromCurrentMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromCurrentMultipleCallsStatic';
      for (let i = 0; i < 20; i++) {
        let typeArguments = new drawing.TypefaceArguments();
        let myTypeFace = drawing.Typeface.makeFromFile("/system/fonts/HarmonyOS_Sans.ttf");
        try {
          let  typeFace1 = myTypeFace!.makeFromCurrent(typeArguments)
          if(typeFace1 == undefined){
            console.info(msg + ' makeFromCurrent typeFace1 failed');
            expect().assertFail();
          } else {
            console.info(msg + ' makeFromCurrent successed step: ' + i );
            expect(typeFace1 != null || typeFace1 != undefined).assertTrue()
          }
        } catch (e) {
          console.info(msg + ` makeFromCurrent errorCode is:  ${e.code}, errorMessage is: ${e.message} step: ${i}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromRawFileWithArgumentsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0600
     * @tc.desc   testTypeFaceMakeFromRawFileWithArgumentsNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTypeFaceMakeFromRawFileWithArgumentsNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testTypeFaceMakeFromRawFileWithArgumentsNormalStatic';
      let typeFaceArgument = new drawing.TypefaceArguments();
      try {
        let myTypeFace = drawing.Typeface.makeFromRawFileWithArguments($rawfile('HarmonyOS_Sans_Condensed.ttf'), typeFaceArgument!);
        if(myTypeFace == undefined){
          console.info(msg + ' makeFromRawFileWithArguments myTypeFace failed');
          expect().assertFail();
        } else {
          console.info(msg + ' makeFromRawFileWithArguments myTypeFace successed');
          expect(myTypeFace != null || myTypeFace != undefined).assertTrue()
        }
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments myTypeFace errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let myTypeFace2 = drawing.Typeface.makeFromRawFileWithArguments($rawfile('ttf/HarmonyOS_Sans_Condensed.ttf'), typeFaceArgument!);
        if(myTypeFace2 == undefined){
          console.info(msg + ' makeFromRawFileWithArguments myTypeFace2 failed');
          expect().assertFail();
        } else {
          console.info(msg + ' makeFromRawFileWithArguments myTypeFace2 successed');
          expect(myTypeFace2 != null || myTypeFace2 != undefined).assertTrue()
        }
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments myTypeFace2 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromRawFileWithArgumentsMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0601
     * @tc.desc   testTypeFaceMakeFromRawFileWithArgumentsMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeFaceMakeFromRawFileWithArgumentsMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileWithArgumentsMultipleCallsStatic';
      for (let i = 0; i < 20; i++) {
        try {
          let typeFaceArgument = new drawing.TypefaceArguments();
          let myTypeFace = drawing.Typeface.makeFromRawFileWithArguments($rawfile('HarmonyOS_Sans_Condensed.ttf'), typeFaceArgument!)
          if(myTypeFace == undefined){
            console.info(msg + ' makeFromRawFileWithArguments myTypeFace failed');
            expect().assertFail();
          } else {
            console.info(msg + ' makeFromRawFileWithArguments successed step: ' + i );
            expect(myTypeFace != null || myTypeFace != undefined).assertTrue()
          }
        } catch (e) {
          console.info(msg + ` makeFromRawFileWithArguments errorCode is:  ${e.code}, errorMessage is: ${e.message} step: ${i}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTypeFaceMakeFromRawFileWithArgumentsAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0603
     * @tc.desc   testTypeFaceMakeFromRawFileWithArgumentsAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeFaceMakeFromRawFileWithArgumentsAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileWithArgumentsAbnormal';
      let typeFaceArgument = new drawing.TypefaceArguments();
      try {
        let myTypeFace = drawing.Typeface.makeFromRawFileWithArguments($rawfile('image.png'), typeFaceArgument!);
        console.info(msg + ` makeFromFileWithArguments myTypeFace success`);
        expect(myTypeFace).assertEqual(undefined)
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments myTypeFace errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let myTypeFace2 = drawing.Typeface.makeFromRawFileWithArguments($r('app.boolean.apptest1'), typeFaceArgument!);
        console.info(msg + ` makeFromFileWithArguments myTypeFace2 success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments mytypeface2 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    });
    /**
     * @tc.name   testTypeFaceIsBoldNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0700
     * @tc.desc   testTypeFaceIsBoldNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTypeFaceIsBoldNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testTypeFaceIsBoldNormalStatic';
      const font = new drawing.Font();
      try {
        let typeface = font.getTypeface() as drawing.Typeface;
        let result = typeface.isBold() ;
        console.info(msg + ' isBold 1 success ' + JSON.stringify(result));
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isBold 1 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let str = "/system/fonts/NotoSansBengaliUI-Bold.ttf";
        let typeface = drawing.Typeface.makeFromFile(str) as drawing.Typeface;
        let result = typeface.isBold();
        console.info(msg + ' isBold 2 success ' + JSON.stringify(result));
        expect(result).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isBold 2 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let str = "/system/fonts/HarmonyOS_Sans.ttf";
        let typeface = drawing.Typeface.makeFromFile(str) as drawing.Typeface;
        let result = typeface.isBold();
        console.info(msg + ' isBold 3 success ' + JSON.stringify(result));
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isBold 3 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTypeFaceIsBoldMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0701
     * @tc.desc   Test for testTypeFaceIsBoldMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeFaceIsBoldMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTypeFaceIsBoldMultipleCallsStatic';
      const font = new drawing.Font();
      let str = "/system/fonts/NotoSansBengaliUI-Bold.ttf";
      let typeface = drawing.Typeface.makeFromFile(str) as drawing.Typeface;
      for (let i = 0; i < 20; i++) {
        try {
          let result = typeface.isBold();
          console.info(msg + ' isBold successed step is: ' + i + "result is: " + result);
          expect(result).assertEqual(true);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` isBold errorCode is:  ${e.code} + errormsg is: ${e.message} step is: ${i}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTypeFaceIsItalicNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0800
     * @tc.desc   testTypeFaceIsItalicNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTypeFaceIsItalicNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testTypeFaceIsItalicNormalStatic';
      const font = new drawing.Font();
      try {
        let typeface = font.getTypeface() as drawing.Typeface;
        let result = typeface.isItalic() ;
        console.info(msg + ' isItalic 1 success ' + JSON.stringify(result));
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isItalic 1 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let str = "/system/fonts/HarmonyOS_Sans_Italic.ttf";
        let typeface = drawing.Typeface.makeFromFile(str) as drawing.Typeface;
        let result = typeface.isItalic();
        console.info(msg + ' isItalic 2 success ' + JSON.stringify(result));
        expect(result).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isItalic 2 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let str = "/system/fonts/HarmonyOS_Sans.ttf";
        let typeface = drawing.Typeface.makeFromFile(str) as drawing.Typeface;
        let result = typeface.isItalic();
        console.info(msg + ' isItalic 3 success ' + JSON.stringify(result));
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isItalic 3 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTypeFaceIsItalicMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0801
     * @tc.desc   Test for testTypeFaceIsItalicMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeFaceIsItalicMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTypeFaceIsItalicMultipleCallsStatic';
      const font = new drawing.Font();
      let str = "/system/fonts/HarmonyOS_Sans_Italic.ttf";
      let typeface = drawing.Typeface.makeFromFile(str) as drawing.Typeface;
      for (let i = 0; i < 20; i++) {
        try {
          let result = typeface.isItalic();
          console.info(msg + ' isItalic successed step is: ' + i + "result is: " + result);
          expect(result).assertEqual(true);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` isItalic errorCode is:  ${e.code} + errormsg is: ${e.message} step is: ${i}`);
          expect().assertFail();
        }
      }
    });
  })
}
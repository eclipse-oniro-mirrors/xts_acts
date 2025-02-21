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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0100
     * @tc.name      : testTypeFaceGetFamilyNameNormal
     * @tc.desc      : Test for testTypeFaceGetFamilyNameNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTypeFaceGetFamilyNameNormal', DEFAULT, () => {
      const msg = 'testTypeFaceGetFamilyNameNormal';
      try {
        let font = new drawing.Font();
        let typeface = font.getTypeface();
        typeface.getFamilyName();
        console.info(msg + ' getFamilyName successed');
      } catch (e) {
        console.info(msg + ` getFamilyName errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0102
     * @tc.name      : testTypeFaceGetFamilyNameMultipleCalls
     * @tc.desc      : Test for testTypeFaceGetFamilyNameMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceGetFamilyNameMultipleCalls', DEFAULT, () => {
      const msg = 'testTypeFaceGetFamilyNameMultipleCalls';

      let font = new drawing.Font();
      let typeface = font.getTypeface();
      for (let i = 0; i < 20; i++) {
        try {
          typeface.getFamilyName();
          console.info(msg + ' getFamilyName successed');
        } catch (e) {
          console.info(msg + ` getFamilyName errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0200
     * @tc.name      : testTypeFaceMakeFromFileNormal
     * @tc.desc      : testTypeFaceMakeFromFileNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTypeFaceMakeFromFileNormal', DEFAULT, () => {
      const msg = 'testTypeFaceMakeFromFileNormal';
      let font = new drawing.Font();

      try {
        let str = FONT_PATH;
        let mytypeface = drawing.Typeface.makeFromFile(str);

        mytypeface = drawing.Typeface.makeFromFile("");

        console.info(msg + ' test succeeded.');
      } catch (e) {
        console.info(msg + ` test failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0202
     * @tc.name      : testTypeFaceMakeFromFileMultipleCalls
     * @tc.desc      : testTypeFaceMakeFromFileMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromFileMultipleCalls', 3, () => {
      const msg = 'testTypeFaceMakeFromFileMultipleCalls';
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0203
     * @tc.name      : testTypeFaceMakeFromFileAbnormal
     * @tc.desc      : testTypeFaceMakeFromFileAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromFileAbnormal', 3, () => {
      const msg = 'testTypeFaceMakeFromFileAbnormal';

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

  })
}
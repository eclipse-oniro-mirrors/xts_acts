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
import { getEnumCount } from './utils';
import common2D from '@ohos.graphics.common2D';


export default function textBlob2Test() {
  describe('DrawingTsTextBlob2Test', () => {
    const DEFAULT = 0;
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_0300
     * @tc.name      : testTextBlobMakeFromPosTextNormal
     * @tc.desc      : testTextBlobMakeFromPosTextNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTextBlobMakeFromPosTextNormal', DEFAULT, () => {
      const msg = 'testTextBlobMakeFromPosTextNormal';
      let font = new drawing.Font();

      try {
        let points: common2D.Point[] = [];
        drawing.TextBlob.makeFromPosText("drawing", points.length, points, font);
        points = [{
          x: 100, y: 100
        }];
        font.setSize(30);
        drawing.TextBlob.makeFromPosText("你好", points.length, points, font);
        points = [{
          x: 100, y: 100
        }, {
          x: 200.1, y: 200.1
        }, {
          x: 300, y: 300
        }];
        drawing.TextBlob.makeFromPosText("中文魑認識", points.length, points, font);
        drawing.TextBlob.makeFromPosText("", points.length, points, font);
        console.info(msg + ' makeFromString succeeded for empty string');
      } catch (e) {
        console.info(msg + ` makeFromString failed for empty string, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_0301
     * @tc.name      : testTextBlobMakeFromPosTextNull
     * @tc.desc      : testTextBlobMakeFromPosTextNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlobMakeFromPosTextNull', 3, () => {
      const msg = 'testTextBlobMakeFromPosTextNull';
      let font = new drawing.Font();
      let points: common2D.Point[] = [];
      points = [{
        x: 100, y: 100
      }];
      font.setSize(30);
      const text = "你好";


      try {
        drawing.TextBlob.makeFromPosText(null, points.length, points, font);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromPosText(text, null, points, font);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromPosText(text, points.length, null, font);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromPosText(text, points.length, points, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromPosText(undefined, points.length, points, font);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromPosText(text, undefined, points, font);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromPosText(text, points.length, undefined, font);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromPosText(text, points.length, points, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_0303
     * @tc.name      : testTextBlobMakeFromPosTextMultipleCalls
     * @tc.desc      : testTextBlobMakeFromPosTextMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlobMakeFromPosTextMultipleCalls', 3, () => {
      const msg = 'testTextBlobMakeFromPosTextMultipleCalls';
      let font = new drawing.Font();
      const points: common2D.Point[] = [{
        x: 100, y: 100
      }];
      try {
        for (let i = 0; i < 20; i += 1) {
          drawing.TextBlob.makeFromPosText("drawing", points.length, points, font);
        }

        console.info(msg + ' test succeeded.');
      } catch (e) {
        console.info(msg + ` test failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_0304
     * @tc.name      : testTextBlobMakeFromPosTextAbnormal
     * @tc.desc      : testTextBlobMakeFromPosTextAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlobMakeFromPosTextAbnormal', 3, () => {
      const msg = 'testTextBlobMakeFromPosTextAbnormal';
      let font = new drawing.Font();

      try {
        font = new drawing.Font();
        let points: common2D.Point[] = [{
          x: 100, y: 100
        }, {
          x: 200.1, y: 200.1
        }, {
          x: 300, y: 300
        }];
        drawing.TextBlob.makeFromPosText("drawing", 1, points, font);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_0300
     * @tc.name      : testTextBlobMakeFromPosTextNormal
     * @tc.desc      : testTextBlobMakeFromPosTextNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlobMakeFromPosTextNormal', 3, () => {
      const msg = 'testTextBlobMakeFromPosTextNormal';
      let font = new drawing.Font();

      try {
        let textBlob = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        let id = textBlob.uniqueID();

        textBlob = drawing.TextBlob.makeFromString("中文魑認識", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        id = textBlob.uniqueID();

        console.info(msg + ' test succeeded.');
      } catch (e) {
        console.info(msg + ` test failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_0303
     * @tc.name      : testTextBlobMakeFromPosTextMultipleCalls
     * @tc.desc      : testTextBlobMakeFromPosTextMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlobMakeFromPosTextMultipleCalls', 3, () => {
      const msg = 'testTextBlobMakeFromPosTextMultipleCalls';
      let font = new drawing.Font();

      try {
        for (let i = 0; i < 20; i += 1) {
          const randomString = Math.random().toString(36).substring(2, 12);
          let textBlob = drawing.TextBlob.makeFromString(randomString, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
          textBlob.uniqueID()
        }
        console.info(msg + ' test succeeded.');
      } catch (e) {
        console.info(msg + ` test failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });

  });
}
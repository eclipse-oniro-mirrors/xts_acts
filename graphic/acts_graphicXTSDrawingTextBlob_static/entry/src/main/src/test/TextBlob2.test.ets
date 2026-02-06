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
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';


export default function textBlob2Test() {
  describe('DrawingTsTextBlob2Test', () => {
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
     * @tc.name   testTextBlobMakeFromPosTextNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_STATIC_0300
     * @tc.desc   testTextBlobMakeFromPosTextNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextBlobMakeFromPosTextNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testTextBlobMakeFromPosTextNormalStatic';
      let font = new drawing.Font();

      try {
        let points: common2D.Point[] = [];
        drawing.TextBlob.makeFromPosText("drawing", points.length, points, font);
        console.info(msg + ' 1 makeFromString succeeded for empty string');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` 1 makeFromString failed for empty string, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let points: common2D.Point[] = [{
          x: 100, y: 100
        }];
        font.setSize(30);
        drawing.TextBlob.makeFromPosText("你好", points.length, points, font);
        console.info(msg + ' 2 makeFromString succeeded for empty string');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` 2 makeFromString failed for empty string, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let points: common2D.Point[] = [{
          x: 100, y: 100
        }, {
          x: 200.1, y: 200.1
        }, {
          x: 300, y: 300
        }];
        drawing.TextBlob.makeFromPosText("中文魑認識", points.length, points, font);
        console.info(msg + ' 3 makeFromString succeeded for empty string');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          `3 makeFromString failed for empty string, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let points: common2D.Point[] = [{
          x: 100, y: 100
        }, {
          x: 200.1, y: 200.1
        }, {
          x: 300, y: 300
        }];
        drawing.TextBlob.makeFromPosText("", points.length, points, font);
        console.info(msg + '4  makeFromString succeeded for empty string');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          `4 makeFromString failed for empty string, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testTextBlobMakeFromPosTextMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_STATIC_0303
     * @tc.desc   testTextBlobMakeFromPosTextMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobMakeFromPosTextMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTextBlobMakeFromPosTextMultipleCallsStatic';
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
        e = e as BusinessError;
        console.info(msg + ` test failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTextBlobMakeFromPosTextAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_STATIC_0304
     * @tc.desc   testTextBlobMakeFromPosTextAbNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobMakeFromPosTextAbNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTextBlobMakeFromPosTextAbNormalStatic';
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
        e = e as BusinessError;
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    });
    /**
     * @tc.name   testTextBlobMakeFromStringNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_STATIC_0400
     * @tc.desc   testTextBlobMakeFromStringNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobMakeFromStringNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTextBlobMakeFromStringNormalStatic';
      let font = new drawing.Font();
      try {
        let textBlob = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        if (textBlob) {
          let id = textBlob.uniqueID();
        }
        console.info(msg + ' test 1 succeeded.');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` test 1 failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let textBlob = drawing.TextBlob.makeFromString("中文魑認識", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        if (textBlob) {
          let id = textBlob.uniqueID();
        }
        console.info(msg + ' 2 test succeeded.');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` 2 test failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTextBlobMakeFromStringMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_STATIC_0403
     * @tc.desc   testTextBlobMakeFromStringMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobMakeFromStringMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTextBlobMakeFromStringMultipleCallsStatic';
      let font = new drawing.Font();

      try {
        for (let i = 0; i < 20; i += 1) {
          const randomString = Math.random().toString(36).substring(2, 12);
          let textBlob = drawing.TextBlob.makeFromString(randomString, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
          if (textBlob) {
            textBlob.uniqueID()
          }
        }
        console.info(msg + ' test succeeded.');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` test failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });

  });
}
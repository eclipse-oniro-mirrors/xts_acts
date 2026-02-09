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


export default function textBlobTest() {
  describe('DrawingTsTextBlobTest', () => {
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
     * @tc.name   testTextBlobMakeFromStringNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_STATIC_0100
     * @tc.desc   Test for testTextBlobMakeFromStringNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextBlobMakeFromStringNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testTextBlobMakeFromStringNormalStatic';
      let font = new drawing.Font();
      try {
        let textBlob = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        if(textBlob == undefined){
          console.info(msg + ' textBlob makeFromString failed for encoding');
          expect().assertFail();
        }
        let textBlob1 = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        if(textBlob1 == undefined){
          console.info(msg + ' textBlob1 makeFromString failed for encoding');
          expect().assertFail();
        }
        let textBlob2 = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF32);
        if(textBlob2 == undefined){
          console.info(msg + ' textBlob2 makeFromString failed for encoding');
          expect().assertFail();
        }
        let textBlob3 = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        if(textBlob3 == undefined){
          console.info(msg + ' textBlob3 makeFromString failed for encoding');
          expect().assertFail();
        }
        console.info(msg + ' makeFromString succeeded for encoding');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeFromString failed for encoding, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.TextBlob.makeFromString("中文魑認識", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' makeFromString succeeded for Chinese string');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeFromString failed for Chinese string, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.TextBlob.makeFromString("中文魑認識", font);
        console.info(msg + ' makeFromString succeeded for Chinese string without specifying TextEncoding');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeFromString failed for Chinese string without specifying TextEncoding, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.TextBlob.makeFromString("", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' makeFromString succeeded for empty string');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeFromString failed for empty string, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTextBlobMakeFromStringMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_STATIC_0103
     * @tc.desc   Test for testTextBlobMakeFromStringMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobMakeFromStringMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTextBlobMakeFromStringMultipleCallsStatic';
      let font = new drawing.Font();
      let itemList: drawing.TextEncoding[] =
        [
          drawing.TextEncoding.TEXT_ENCODING_UTF8,
          drawing.TextEncoding.TEXT_ENCODING_UTF16,
          drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID,
          drawing.TextEncoding.TEXT_ENCODING_UTF32
        ];
      for (let i = 0; i < 20; i++) {
        // Generate a random string
        let randomString = Math.random().toString(36).substring(7);
        // Generate a random TextEncoding value
        const randomEnum = Math.floor(4 * Math.random()).toInt();
        try {
          drawing.TextBlob.makeFromString(randomString, font, itemList[randomEnum]);
          console.info(`${msg} makeFromString succeeded for call ${i + 1}`);
        } catch (e) {
          e = e as BusinessError;
          console.info(`${msg} makeFromString failed for call ${i +
            1}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testTextBlobMakeFromRunBufferBoundsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_STATIC_0200
     * @tc.desc   Test for testTextBlobMakeFromRunBufferBoundsNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextBlobMakeFromRunBufferBoundsNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testTextBlobMakeFromRunBufferBoundsNormalStatic';
      let font = new drawing.Font(); // Create a new Font object

      // Make a TextBlob from a run buffer using the Font object and various bounds
      let runBuffer: drawing.TextBlobRunBuffer[] = [
        {
          glyph: 65, positionX: 0, positionY: 0
        },
        {
          glyph: 227, positionX: 14.9, positionY: 0
        }
      ];

      let boundsList: common2D.Rect[] = [
        {
          left: 0,
          right: 0,
          top: 100,
          bottom: 100
        },
        {
          left: 100.32,
          right: 100.5,
          top: 400.2,
          bottom: 400.3
        },
        {
          left: 0,
          right: 0,
          top: 0,
          bottom: 100
        },
        {
          left: 0,
          right: 100,
          top: 100,
          bottom: 100
        },
        {
          left: 100,
          right: 100,
          top: 100,
          bottom: 100
        },
        {
          left: -100,
          right: 100,
          top: -100,
          bottom: 100
        },
        {
          left: 100,
          right: -100,
          top: 100,
          bottom: -100
        },
        {
          left: 200,
          right: 100,
          top: 200,
          bottom: 100
        },
      ];
      for (let bounds of boundsList) {
        try {
          const textBlob = drawing.TextBlob.makeFromRunBuffer(runBuffer, font, bounds);
          if (textBlob) {
            const b = textBlob.bounds();
            if (b) {
              console.info(`${msg} bounds result is ${JSON.stringify(b)}`);
              console.info(`${msg} bounds input is ${JSON.stringify(bounds)}`);
              if (bounds.left < bounds.right && bounds.top < bounds.bottom) {
                expect(Math.round(bounds.left)).assertEqual(Math.round(b.left));
                expect(Math.round(bounds.right)).assertEqual(Math.round(b.right));
                expect(Math.round(bounds.top)).assertEqual(Math.round(b.top));
                expect(Math.round(bounds.bottom)).assertEqual(Math.round(b.bottom));
              } else {
                expect(0).assertEqual(b.left);
                expect(0).assertEqual(b.right);
                expect(0).assertEqual(b.top);
                expect(0).assertEqual(b.bottom);
              }
            }
            if(b == undefined){
              console.info(`${msg} bounds failed  ${JSON.stringify(bounds)}`);
              expect().assertFail();
            }
          }
          if(textBlob == undefined){
            console.info(`${msg} makeFromRunBuffer failed for bounds ${JSON.stringify(bounds)}`);
            expect().assertFail();
          }
          console.info(`${msg} makeFromRunBuffer succeeded for bounds ${JSON.stringify(bounds)}`);
        } catch (e) {
          e = e as BusinessError;
          console.info(`${msg} makeFromRunBuffer failed for bounds ${JSON.stringify(bounds)}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }

      try {
        drawing.TextBlob.makeFromRunBuffer(runBuffer, font, undefined);
        console.info(`${msg} makeFromRunBuffer succeeded for bounds ${JSON.stringify(undefined)}`);
      } catch (e) {
        e = e as BusinessError;
        console.info(`${msg} makeFromRunBuffer failed for bounds ${JSON.stringify(undefined)}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        // Make a TextBlob from an empty run buffer using the Font object
        drawing.TextBlob.makeFromRunBuffer([], font);
        console.info(msg + ' makeFromRunBuffer succeeded for empty run buffer');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeFromRunBuffer failed for empty run buffer, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testTextBlobMakeFromRunBufferBoundsMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_STATIC_0203
     * @tc.desc   Test for testTextBlobMakeFromRunBufferBoundsMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTextBlobMakeFromRunBufferBoundsMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTextBlobMakeFromRunBufferBoundsMultipleCallsStatic';
      let font = new drawing.Font(); // Create a new Font object

      for (let i = 0; i < 20; i++) {
        // Generate a random run buffer
        let randomRunBuffer: drawing.TextBlobRunBuffer[] = [
          {
            glyph: Math.floor(Math.random() * 100).toInt(),
            positionX: Math.floor(Math.random() * 100),
            positionY: Math.floor(Math.random() * 100)
          },
          {
            glyph: Math.floor(Math.random() * 100).toInt(),
            positionX: Math.floor(Math.random() * 100),
            positionY: Math.floor(Math.random() * 100)
          }
        ];

        // Generate random bounds
        let randomBounds: common2D.Rect = {
          left: Math.floor(Math.random() * 100),
          top: Math.floor(Math.random() * 100),
          right: Math.floor(Math.random() * 100 + 100),
          bottom: Math.floor(Math.random() * 100 + 100)
        };

        try {
          // Make a TextBlob from the random run buffer using the Font object and random bounds
          let textBlob = drawing.TextBlob.makeFromRunBuffer(randomRunBuffer, font, randomBounds);
          console.info(`${msg} makeFromRunBuffer succeeded`);
          if (textBlob) {
            try {
              // Call bounds method
              const result = textBlob.bounds();
              if (result) {
                console.info(`${msg} bounds result is ` + JSON.stringify(result));
                console.info(`${msg} bounds input is ` + JSON.stringify(randomBounds));
                expect(randomBounds.left).assertEqual(result.left);
                expect(randomBounds.top).assertEqual(result.top);
                expect(randomBounds.right).assertEqual(result.right);
                expect(randomBounds.bottom).assertEqual(result.bottom);
                console.info(`${msg} bounds succeeded`);
              }
              if(result == undefined){
                console.info(`${msg} failed for bounds ${JSON.stringify(result)}`);
                expect().assertFail();
              }
            } catch (e) {
              e = e as BusinessError;
              console.info(`${msg} bounds failed, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
              expect().assertFail();
            }
          }
          if(textBlob == undefined){
            console.info(`${msg} undefined makeFromRunBuffer failed  ${JSON.stringify(textBlob)}`);
            expect().assertFail();
          }

        } catch (e) {
          e = e as BusinessError;
          console.info(`${msg} makeFromRunBuffer failed, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });


  });
}
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


export default function textBlobTest() {
  describe('DrawingTsTextBlobTest', () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_0100
     * @tc.name      : testTextBlobMakeFromStringNormal
     * @tc.desc      : Test for testTextBlobMakeFromStringNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTextBlobMakeFromStringNormal', DEFAULT, () => {
      const msg = 'testTextBlobMakeFromStringNormal';

      let font = new drawing.Font();

      try {
        drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF32);
        drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        console.info(msg + ' makeFromString succeeded for encoding');
      } catch (e) {
        console.info(msg + ` makeFromString failed for encoding, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.TextBlob.makeFromString("中文魑認識", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' makeFromString succeeded for Chinese string');
      } catch (e) {
        console.info(msg + ` makeFromString failed for Chinese string, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.TextBlob.makeFromString("中文魑認識", font);
        console.info(msg + ' makeFromString succeeded for Chinese string without specifying TextEncoding');
      } catch (e) {
        console.info(msg + ` makeFromString failed for Chinese string without specifying TextEncoding, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.TextBlob.makeFromString("", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' makeFromString succeeded for empty string');
      } catch (e) {
        console.info(msg + ` makeFromString failed for empty string, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_0101
     * @tc.name      : testTextBlobMakeFromStringNull
     * @tc.desc      : Test for testTextBlobMakeFromStringNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlobMakeFromStringNull', DEFAULT, () => {
      const msg = 'testTextBlobMakeFromStringNull';
      let font = new drawing.Font();

      try {
        drawing.TextBlob.makeFromString(undefined, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' makeFromString succeeded for undefined string');
      } catch (e) {
        console.info(msg + ` makeFromString failed for undefined string, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromString("drawing", undefined, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' makeFromString succeeded for undefined font');
      } catch (e) {
        console.info(msg + ` makeFromString failed for undefined font, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromString("drawing", font, undefined);
        console.info(msg + ' makeFromString succeeded for undefined TextEncoding');
      } catch (e) {
        console.info(msg + ` makeFromString failed for undefined TextEncoding, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromString(null, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' makeFromString succeeded for null string');
      } catch (e) {
        console.info(msg + ` makeFromString failed for null string, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromString("drawing", null, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' makeFromString succeeded for null font');
      } catch (e) {
        console.info(msg + ` makeFromString failed for null font, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromString("drawing", font, null);
        console.info(msg + ' makeFromString succeeded for null TextEncoding');
      } catch (e) {
        console.info(msg + ` makeFromString failed for null TextEncoding, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_0103
     * @tc.name      : testTextBlobMakeFromStringMultipleCalls
     * @tc.desc      : Test for testTextBlobMakeFromStringMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlobMakeFromStringMultipleCalls', DEFAULT, () => {
      const msg = 'testTextBlobMakeFromStringMultipleCalls';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        // Generate a random string
        let randomString = Math.random().toString(36).substring(7);

        // Generate a random TextEncoding value
        let randomEncoding = Math.floor(Math.random() * getEnumCount(drawing.TextEncoding));

        try {
          drawing.TextBlob.makeFromString(randomString, font, randomEncoding);
          console.info(`${msg} makeFromString succeeded for call ${i + 1}`);
        } catch (e) {
          console.info(`${msg} makeFromString failed for call ${i + 1}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_0200
     * @tc.name      : testTextBlobMakeFromRunBufferBoundsNormal
     * @tc.desc      : Test for testTextBlobMakeFromRunBufferBoundsNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTextBlobMakeFromRunBufferBoundsNormal', DEFAULT, () => {
      const msg = 'testTextBlobMakeFromRunBufferBoundsNormal';
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
          left: 0, right: 0, top: 100, bottom: 100
        },
        {
          left: 100.32, right: 100.5, top: 400.2, bottom: 400.3
        },
        {
          left: 0, right: 0, top: 0, bottom: 100
        },
        {
          left: 0, right: 100, top: 100, bottom: 100
        },
        {
          left: 100, right: 100, top: 100, bottom: 100
        },
        {
          left: -100, right: 100, top: -100, bottom: 100
        },
        {
          left: 100, right: -100, top: 100, bottom: -100
        },
        {
          left: 200, right: 100, top: 200, bottom: 100
        },
      ];

      try {
        drawing.TextBlob.makeFromRunBuffer(runBuffer, font, null);
        console.info(`${msg} makeFromRunBuffer succeeded for bounds ${JSON.stringify(null)}`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds ${JSON.stringify(null)}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      for (let bounds of boundsList) {
        try {
          const textBlob = drawing.TextBlob.makeFromRunBuffer(runBuffer, font, bounds);
          const b = textBlob.bounds();
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
          console.info(`${msg} makeFromRunBuffer succeeded for bounds ${JSON.stringify(bounds)}`);
        } catch (e) {
          console.info(`${msg} makeFromRunBuffer failed for bounds ${JSON.stringify(bounds)}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }

      try {
        drawing.TextBlob.makeFromRunBuffer(runBuffer, font, undefined);
        console.info(`${msg} makeFromRunBuffer succeeded for bounds ${JSON.stringify(undefined)}`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds ${JSON.stringify(undefined)}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        // Make a TextBlob from an empty run buffer using the Font object
        drawing.TextBlob.makeFromRunBuffer([], font);
        console.info(msg + ' makeFromRunBuffer succeeded for empty run buffer');
      } catch (e) {
        console.info(msg + ` makeFromRunBuffer failed for empty run buffer, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_0201
     * @tc.name      : testTextBlobMakeFromRunBufferBoundsNull
     * @tc.desc      : Test for testTextBlobMakeFromRunBufferBoundsNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlobMakeFromRunBufferBoundsNull', DEFAULT, () => {
      const msg = 'testTextBlobMakeFromRunBufferBoundsNull';
      let font = new drawing.Font();

      let runBuffer: drawing.TextBlobRunBuffer[] = [
        {
          glyph: 65, positionX: 0, positionY: 0
        },
        {
          glyph: 227, positionX: 14.9, positionY: 0
        }
      ];

      try {
        drawing.TextBlob.makeFromRunBuffer(undefined, font);
        console.info(`${msg} makeFromRunBuffer succeeded for bounds ${JSON.stringify(undefined)}`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds ${JSON.stringify(undefined)}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromRunBuffer(runBuffer, undefined);
        console.info(`${msg} makeFromRunBuffer succeeded for bounds ${JSON.stringify(undefined)}`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds ${JSON.stringify(undefined)}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromRunBuffer(null, font);
        console.info(`${msg} makeFromRunBuffer succeeded for bounds ${JSON.stringify(null)}`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds ${JSON.stringify(null)}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromRunBuffer(runBuffer, null);
        console.info(`${msg} makeFromRunBuffer succeeded for bounds ${JSON.stringify(null)}`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds ${JSON.stringify(null)}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromRunBuffer(runBuffer, font, {
          left: null, right: 0, top: 10, bottom: 10
        });
        console.info(`${msg} makeFromRunBuffer succeeded for bounds with null left value`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds with null left value, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromRunBuffer(runBuffer, font, {
          left: 0, right: null, top: 10, bottom: 10
        });
        console.info(`${msg} makeFromRunBuffer succeeded for bounds with null right value`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds with null right value, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromRunBuffer(runBuffer, font, {
          left: 0, right: 100, top: null, bottom: 10
        });
        console.info(`${msg} makeFromRunBuffer succeeded for bounds with null top value`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds with null top value, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromRunBuffer(runBuffer, font, {
          left: 0, right: 100, top: 10, bottom: null
        });
        console.info(`${msg} makeFromRunBuffer succeeded for bounds with null bottom value`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds with null bottom value, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromRunBuffer(runBuffer, font, {
          left: undefined, right: 0, top: 10, bottom: 10
        });
        console.info(`${msg} makeFromRunBuffer succeeded for bounds with undefined left value`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds with undefined left value, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromRunBuffer(runBuffer, font, {
          left: 0, right: undefined, top: 10, bottom: 10
        });
        console.info(`${msg} makeFromRunBuffer succeeded for bounds with undefined right value`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds with undefined right value, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromRunBuffer(runBuffer, font, {
          left: 0, right: 100, top: undefined, bottom: 10
        });
        console.info(`${msg} makeFromRunBuffer succeeded for bounds with undefined top value`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds with undefined top value, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.TextBlob.makeFromRunBuffer(runBuffer, font, {
          left: 0, right: 100, top: 10, bottom: undefined
        });
        console.info(`${msg} makeFromRunBuffer succeeded for bounds with undefined bottom value`);
      } catch (e) {
        console.info(`${msg} makeFromRunBuffer failed for bounds with undefined bottom value, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TEXTBLOB_0203
     * @tc.name      : testTextBlobMakeFromRunBufferBoundsMultipleCalls
     * @tc.desc      : Test for testTextBlobMakeFromRunBufferBoundsMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlobMakeFromRunBufferBoundsMultipleCalls', DEFAULT, () => {
      const msg = 'testTextBlobMakeFromRunBufferBoundsMultipleCalls';
      let font = new drawing.Font(); // Create a new Font object

      for (let i = 0; i < 20; i++) {
        // Generate a random run buffer
        let randomRunBuffer: drawing.TextBlobRunBuffer[] = [
          {
            glyph: Math.floor(Math.random() * 100),
            positionX: Math.floor(Math.random() * 100),
            positionY: Math.floor(Math.random() * 100)
          },
          {
            glyph: Math.floor(Math.random() * 100),
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

          try {
            // Call bounds method
            const result = textBlob.bounds();
            console.info(`${msg} bounds result is ` + JSON.stringify(result));
            console.info(`${msg} bounds input is ` + JSON.stringify(randomBounds));
            expect(randomBounds.left).assertEqual(result.left);
            expect(randomBounds.top).assertEqual(result.top);
            expect(randomBounds.right).assertEqual(result.right);
            expect(randomBounds.bottom).assertEqual(result.bottom);
            console.info(`${msg} bounds succeeded`);
          } catch (e) {
            console.info(`${msg} bounds failed, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
            expect().assertFail();
          }
        } catch (e) {
          console.info(`${msg} makeFromRunBuffer failed, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });


  });
}
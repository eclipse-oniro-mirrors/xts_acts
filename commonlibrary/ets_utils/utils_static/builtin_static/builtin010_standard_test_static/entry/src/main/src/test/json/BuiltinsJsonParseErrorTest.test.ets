/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsJsonParseErrorTest() {
  describe('BuiltinsJsonParseErrorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.name builtinsJsonParseErrorTest0001
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0001
     * @tc.desc Test constructor with Empty String message
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const msg = "";
      const start = 0;
      const end = 10;
      const error = new JsonParseError(msg, start as int, end as int);

      expect(error.message).assertEqual(" at 0..10");
      expect(error instanceof Error).assertTrue();
    });

    /**
     * @tc.name builtinsJsonParseErrorTest0002
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0002
     * @tc.desc Test constructor with Special Characters string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const error = new JsonParseError(specialChars, 5 as int, 5 as int);

      expect(error.message).assertEqual(`${specialChars} at 5..5`);
    });

    /**
     * @tc.name builtinsJsonParseErrorTest0003
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0003
     * @tc.desc Test constructor with Escape Sequences string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const escapes = "Line1\nLine2\tTab\rReturn";
      const error = new JsonParseError(escapes, 100 as int, 200 as int);

      expect(error.message).assertEqual("Line1\nLine2\tTab\rReturn at 100..200");
    });

    /**
     * @tc.name builtinsJsonParseErrorTest0004
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0004
     * @tc.desc Test constructor with Emoji and Unicode string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emoji = "Error \ud83d\ude3c occurred";
      const error = new JsonParseError(emoji, 1 as int, 1 as int);

      expect(error.message).assertEqual("Error 😼 occurred at 1..1");
    });

    /**
     * @tc.name builtinsJsonParseErrorTest0005
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0005
     * @tc.desc Test constructor with Keyword-like strings
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error1 = new JsonParseError("null", 0 as int, 0 as int);
      expect(error1.message).assertEqual("null at 0..0");

      const error2 = new JsonParseError("NaN", 1 as int, 1 as int);
      expect(error2.message).assertEqual("NaN at 1..1");

      const error3 = new JsonParseError("undefined", 2 as int, 2 as int);
      expect(error3.message).assertEqual("undefined at 2..2");
    });

    /**
     * @tc.name builtinsJsonParseErrorTest0006
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0006
     * @tc.desc Test constructor with Optional Offsets (undefined)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new JsonParseError("Parsing Failed");
      expect(error.message).assertEqual("Parsing Failed at undefined..undefined");
    });

    /**
     * @tc.name builtinsJsonParseErrorTest0007
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0007
     * @tc.desc Test constructor with One Optional Offset
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new JsonParseError("Error", 123 as int);
      expect(error.message).assertEqual("Error at 123..undefined");
    });

    /**
     * @tc.name builtinsJsonParseErrorTest0008
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0008
     * @tc.desc Test constructor with Zero offsets
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new JsonParseError("Zero Error", 0 as int, 0 as int);
      expect(error.message).assertEqual("Zero Error at 0..0");
    });

    /**
     * @tc.name builtinsJsonParseErrorTest0009
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0009
     * @tc.desc Test constructor with Negative offsets
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new JsonParseError("Negative", -1 as int, -100 as int);
      expect(error.message).assertEqual("Negative at -1..-100");
    });

    /**
     * @tc.name builtinsJsonParseErrorTest0010
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0010
     * @tc.desc Test constructor with Max Safe Integer offsets
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const max = Number.MAX_SAFE_INTEGER;
      const error = new JsonParseError("Max Int", max.toInt(), max.toInt());
      expect(error.message).assertEqual(`Max Int at ${max.toInt()}..${max.toInt()}`);
    });

    /**
     * @tc.name builtinsJsonParseErrorTest0011
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0011
     * @tc.desc Test constructor with Floating Point offsets
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const start = 1.5;
      const end = 10.99;

      const startInt = start.toInt();
      const endInt = end.toInt();

      const error = new JsonParseError("Float", startInt, endInt);
      expect(error.message).assertEqual(`Float at ${startInt}..${endInt}`);
    });

    /**
     * @tc.name builtinsJsonParseErrorTest0012
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0012
     * @tc.desc Test constructor with NaN and Infinity offsets
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nanVal = NaN.toInt();
      const infVal = Infinity.toInt();
      const negInfVal = -Infinity.toInt();

      const error1 = new JsonParseError("Special", nanVal, infVal);
      expect(error1.message).assertEqual(`Special at ${nanVal}..${infVal}`);

      const error2 = new JsonParseError("Special2", negInfVal, nanVal);
      expect(error2.message).assertEqual(`Special2 at ${negInfVal}..${nanVal}`);
    });

    /**
     * @tc.name builtinsJsonParseErrorTest0013
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0013
     * @tc.desc Test constructor with explicitly passed undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new JsonParseError("Explicit Undef", undefined, undefined);
      expect(error.message).assertEqual("Explicit Undef at undefined..undefined");
    });

    /**
     * @tc.name builtinsJsonParseErrorTest0014
     * @tc.number BUILTINS_JSON_PARSE_ERROR_TEST_0014
     * @tc.desc Test constructor with large string logic
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonParseErrorTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let longMsg = "A";
      for(let i=0; i<10; i++) {
        longMsg += longMsg;
      }
      const error = new JsonParseError(longMsg, 0 as int, 1 as int);
      expect(error.message.startsWith("AAAA")).assertTrue();
      expect(error.message.endsWith(" at 0..1")).assertTrue();
    });
  })
}
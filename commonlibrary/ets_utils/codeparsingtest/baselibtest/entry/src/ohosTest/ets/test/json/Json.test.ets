/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { JSON } from '@kit.ArkTS';

const nullChars = [0, 1];

function reviverFunc(key: string, value: Object) {
  if (key === "age") {
    return value as number + 1;
  }
  return value;
}

export default function JsonTest() {
  describe('jsonTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_0100
     * @tc.name       : testParse0001
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0001";
      try {
        let numberText = '{"largeNumber":112233445566778899}';
        let numberObj = JSON.parse(numberText, undefined, undefined) as Object;
        console.info((numberObj as object)?.["largeNumber"]);
        expect((numberObj as object)?.["largeNumber"]).assertEqual(112233445566778900)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_0300
     * @tc.name       : testParse0003
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0003";
      try {
        let numberObj = JSON.parse(null) as Object;
        console.info(`${TAG} numberObj: ${numberObj}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_0400
     * @tc.name       : testParse0004
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0004";
      try {
        let numberObj = JSON.parse('true') as Object;
        console.info(`${TAG} numberObj: ${numberObj}`);
        expect(numberObj).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_0500
     * @tc.name       : testParse0005
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0005";
      try {
        let numberObj = JSON.parse('false') as Object;
        console.info(`${TAG} numberObj: ${numberObj}`);
        expect(numberObj).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_0600
     * @tc.name       : testParse0006
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0006";
      try {
        let numberObj = JSON.parse('12\t\r\n 34') as Object;
        console.info(`${TAG} numberObj: ${numberObj}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_0700
     * @tc.name       : testParse0007
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0007";
      try {
        let numberObj = JSON.parse('\u2028\u20291234') as Object;
        console.info(`${TAG} numberObj: ${numberObj}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_0800
     * @tc.name       : testParse0008
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0008";
      let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
      try {
        let numberText = '\t\r \n{' +
          '"property"\t\r \n:\t\r \n{\t\r \n}\t\r \n,\t\r \n' +
          '"prop2"\t\r \n:\t\r \n' +
          '[\t\r \ntrue\t\r \n,\t\r \nnull\t\r \n,123.456\t\r \n]' +
          '\t\r \n}\t\r \n';
        let numberObj = JSON.parse(numberText);
        console.info(`${TAG} success: +numberObj` + numberObj?.toString);
        expect(numberObj?.toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_0900
     * @tc.name       : testParse0009
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0009";
      try {
        let numberObj = JSON.parse('12 34') as Object;
        console.info(`${TAG} numberObj: ${numberObj}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_1000
     * @tc.name       : testParse0010
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0010";
      try {
        let numberText = '\"abc\"';
        let numberObj = JSON.parse(numberText);
        console.info(`${TAG} numberObj: ${numberObj}`);
        expect(numberObj).assertEqual('abc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_1100
     * @tc.name       : testParse0011
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0011";
      try {
        let numberText = '';
        let numberObj = JSON.parse(numberText);
        console.info(`${TAG} numberObj: ${numberObj}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_1200
     * @tc.name       : testParse0012
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0012";
      try {
        let numberObj = JSON.parse("\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007");
        console.info(`${TAG} numberObj: ${numberObj}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_1300
     * @tc.name       : testParse0013
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0013";
      try {
        let numberText = "\"\\u0058\"";
        let numberObj = JSON.parse(numberText);
        console.info(`${TAG} numberObj: ${numberObj}`);
        expect(numberObj).assertEqual('X');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_1400
     * @tc.name       : testParse0014
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0014";
      try {
        let numberText = '\"\\\\\"';
        let numberObj = JSON.parse(numberText);
        console.info(`${TAG} numberObj: ${numberObj}`);
        expect(numberObj?.toString()).assertEqual('\\');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_1500
     * @tc.name       : testParse0015
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0015";
      try {
        let numberObj = JSON.parse('{ "name" : ' + nullChars[0] + '"John" : ' + nullChars[0] + ' }');
        console.info(`${TAG} numberObj: ${numberObj}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_1600
     * @tc.name       : testParse0016
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0016";
      try {
        let jsonText = '{"large":112233445566778899}';
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
        }
        let numberObj = JSON.parse(jsonText, undefined, options) as Object;
        expect(numberObj.toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_1700
     * @tc.name       : testParse0017
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0017";
      try {
        let jsonText = '{"small":123}';
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.ALWAYS_PARSE_AS_BIGINT,
        }
        let numberObj = JSON.parse(jsonText, undefined, options) as Object;
        expect(numberObj.toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_1800
     * @tc.name       : testParse0018
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0018";
      try {
        let jsonText = '{"deci":1234567890.0123456}';
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
        }
        let numberObj = JSON.parse(jsonText, undefined, options) as Object;
        expect(typeof (numberObj)).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_1900
     * @tc.name       : testParse0019
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0019";
      try {
        let jsonText = '{"normal":511428}';
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.DEFAULT,
        }
        let numberObj = JSON.parse(jsonText, undefined, options) as Object;
        expect(numberObj.toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_2000
     * @tc.name       : testParse0020
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0020";
      try {
        let jsonText = '{"shortExp":1.79e+308}';
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
        }
        let numberObj = JSON.parse(jsonText, undefined, options) as Object;
        expect(numberObj.toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_2100
     * @tc.name       : testParse0021
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0021";
      try {
        let jsonText = '{"long":9007199254740900}';
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
        }
        let numberObj = JSON.parse(jsonText, undefined, options) as Object;
        expect(numberObj.toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_2200
     * @tc.name       : testParse0022
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0022";
      try {
        let jsonText = '{"number":1122}';
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.ALWAYS_PARSE_AS_BIGINT,
        }
        let numberObj = JSON.parse(jsonText, undefined, options) as Object;
        expect(numberObj.toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_2300
     * @tc.name       : testParse0023
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0023";
      try {
        let jsonText = '{"big":112233445566778898}';
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.ALWAYS_PARSE_AS_BIGINT,
        }
        let numberObj = JSON.parse(jsonText, reviverFunc, options) as Object;
        expect(typeof (numberObj)).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_2400
     * @tc.name       : testParse0024
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0024";
      try {
        let numberObj = JSON.parse('undefined') as Object;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_2500
     * @tc.name       : testParse0025
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0025";
      try {
        let numberObj = JSON.parse(null) as Object;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_2600
     * @tc.name       : testParse0026
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0026";
      try {
        let numberObj = JSON.parse(undefined) as Object;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_2700
     * @tc.name       : testParse0027
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0027";
      try {
        let numberObj = JSON.parse(' ') as Object;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_2800
     * @tc.name       : testParse0028
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0028";
      try {
        let json = '!!\"\"##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~'
        let numberObj = JSON.parse(json) as Object;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_2900
     * @tc.name       : testParse0029
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0029";
      try {
        let json = '{"!!""##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~": "special", "age": 30}'
        let numberObj = JSON.parse(json) as Object;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_3000
     * @tc.name       : testParse0030
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0030";
      try {
        let json = '{"special": "!!""##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~", "age": 30}'
        let numberObj = JSON.parse(json) as Object;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_3100
     * @tc.name       : testParse0031
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0031";
      try {
        let numberObj = JSON.parse('{"name": "", "age": 30}') as Object;
        expect(typeof (numberObj)).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_3200
     * @tc.name       : testParse0032
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0032";
      try {
        let numberObj = JSON.parse('{"name": null, "age": 30}') as Object;
        expect(typeof (numberObj)).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_3300
     * @tc.name       : testParse0033
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0033";
      try {
        let numberObj = JSON.parse('{"name": true, "age": 30}') as Object;
        expect(typeof (numberObj)).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_3400
     * @tc.name       : testParse0034
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0034";
      try {
        let numberObj = JSON.parse('{"name": {"name": "John", "age": 30}, "age": 30}') as Object;
        expect(typeof (numberObj)).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_3500
     * @tc.name       : testParse0035
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0035";
      try {
        let numberObj = JSON.parse('{"name": [true,false], "age": 30}') as Object;
        expect(typeof (numberObj)).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONPARSE_3600
     * @tc.name       : testParse0036
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParse0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testParse0036";
      try {
        let numberObj = JSON.parse('{null: "John", "age": 30}') as Object;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_0100
     * @tc.name       : testStringify0001
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0001";
      try {
        let str1 = JSON.stringify({}, undefined, '');
        expect(str1).assertEqual('{}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_0200
     * @tc.name       : testStringify0002
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0002";
      try {
        let str1 = JSON.stringify({
          name: "joy", age: 30
        });
        expect(str1).assertEqual('{"name":"joy","age":30}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_0300
     * @tc.name       : testStringify0003
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0003";
      try {
        let str1 = JSON.stringify({
          1: "John", 2: 30, 3: "New York"
        }, [1, 2]);
        expect(str1).assertEqual('{"1":"John","2":30}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_0400
     * @tc.name       : testStringify0004
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0004";
      try {
        let str1 = JSON.stringify({
          1: "John", 2: 30, 3: "New York"
        }, [1, 2], 1);
        expect(str1).assertEqual('{\n "1": "John",\n "2": 30\n}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_0500
     * @tc.name       : testStringify0005
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0005";
      try {
        let str1 = JSON.stringify({
          1: "John", 2: 30, 3: "New York"
        }, [1, 2], 'www');
        expect(str1).assertEqual('{\nwww"1": "John",\nwww"2": 30\n}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_0600
     * @tc.name       : testStringify0006
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0006";
      try {
        let str1 = JSON.stringify({
          1: "John", 2: 30, 3: "New York"
        }, [1, 2], '  ');
        expect(str1).assertEqual('{\n  "1": "John",\n  "2": 30\n}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_0700
     * @tc.name       : testStringify0007
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0007";
      try {
        let str1 = JSON.stringify({
          1: "John", 2: 30, 3: "New York"
        }, []);
        expect(str1).assertEqual('{}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_0800
     * @tc.name       : testStringify0008
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0008";
      try {
        let str1 = JSON.stringify(undefined);
        expect(str1).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_0900
     * @tc.name       : testStringify0009
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0009";
      try {
        let str1 = JSON.stringify(null);
        console.info(`${TAG} str is: ` + str1);
        expect(str1).assertEqual('null');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_1000
     * @tc.name       : testStringify0010
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0010";
      try {
        let str1 = JSON.stringify("");
        console.info(`${TAG} str is: ` + str1);
        expect(str1).assertEqual('""');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_1100
     * @tc.name       : testStringify0011
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0011";
      try {
        let str1 = JSON.stringify('!!""##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~');
        console.info(`${TAG} str is: ` + str1);
        expect(str1).assertEqual('"!!\\"\\"##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\\\\\]]^^__``{{||}}~~"');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_1200
     * @tc.name       : testStringify0012
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0012";
      try {
        let str1 = JSON.stringify({
          1: "!!\"\"##$$%%''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~"
        });
        console.info(`${TAG} str is: ` + str1);
        expect(str1).assertEqual('{"1":"!!\\"\\"##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\\\\\]]^^__``{{||}}~~"}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_1300
     * @tc.name       : testStringify0013
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0013";
      try {
        let str1 = JSON.stringify({
          1: "!!\"\"##$$%%''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~", 2: 30, 3: "aaaa"
        }, [55555555]);
        console.info(`${TAG} str is: ` + str1);
        expect(str1).assertEqual('{}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_1400
     * @tc.name       : testStringify0014
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0014";
      try {
        let str1 = JSON.stringify({
          "!!\"\"##$$%%''(())**++,,--..//::;;<<==>>??@@[[\\]]^^__``{{||}}~~": "special", "age": 30
        });
        console.info(`${TAG} str is: ` + str1);
        expect(str1)
          .assertEqual('{"!!\\"\\"##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~":"special","age":30}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_1500
     * @tc.name       : testStringify0015
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0015";
      try {
        let str1 = JSON.stringify({
          name: null, "age": 30
        });
        console.info(`${TAG} str is: ` + str1);
        expect(str1).assertEqual('{"name":null,"age":30}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_1600
     * @tc.name       : testStringify0016
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0016";
      try {
        let str1 = JSON.stringify({
          name: "", age: 30
        });
        console.info(`${TAG} str is: ` + str1);
        expect(str1).assertEqual('{"name":"","age":30}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_1700
     * @tc.name       : testStringify0017
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0017";
      try {
        let str1 = JSON.stringify({
          name: {
            name: "John"
          }, age: 30
        });
        console.info(`${TAG} str is: ` + str1);
        expect(str1).assertEqual('{"name":{"name":"John"},"age":30}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_1800
     * @tc.name       : testStringify0018
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0018";
      try {
        let str1 = JSON.stringify({
          1: "John", 2: 30, 3: "New York"
        }, undefined, undefined);
        console.info(`${TAG} str is: ` + str1);
        expect(str1).assertEqual('{"1":"John","2":30,"3":"New York"}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_1900
     * @tc.name       : testStringify0019
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0019";
      try {
        let str1 = JSON.stringify({
          name: true, age: 30
        });
        console.info(`${TAG} str is: ` + str1);
        expect(str1).assertEqual('{"name":true,"age":30}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_2000
     * @tc.name       : testStringify0020
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0020";
      try {
        let str1 = JSON.stringify({
          1: "John", 2: 30, 3: "New York"
        }, reviverFunc);
        console.info(`${TAG} str is: ` + str1);
        expect(str1).assertEqual('{"1":"John","2":30,"3":"New York"}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_2100
     * @tc.name       : testStringify0021
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0021";
      try {
        let str1 = JSON.stringify({
          1: "John", 2: 30, 3: "New York"
        }, reviverFunc, undefined);
        console.info(`${TAG} str is: ` + str1);
        expect(str1).assertEqual('{"1":"John","2":30,"3":"New York"}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_2200
     * @tc.name       : testStringify0022
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStringify0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testStringify0022";
      try {
        let str1 = JSON.stringify({
          1: "John", 2: 30, 3: "New York"
        }, reviverFunc, "000");
        console.info(`${TAG} str is: ` + str1);
        expect(str1).assertEqual('{\n' +
          '000"1": "John",\n' +
          '000"2": 30,\n' +
          '000"3": "New York"\n' +
          '}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONSTRINGIFY_2300
     * @tc.name       : testStringify0023
     * @tc.desc       : Testing JSON testStringify function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testStringify0023',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const TAG = "testStringify0023";
    //   try {
    //     let options: JSON.ParseOptions = {
    //       bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
    //     }
    //     let str1 = JSON.stringify({"big":112233445566778898} ,reviverFunc, '');
    //     console.info(`${TAG} str is: ` +str1);
    //     expect(str1).assertEqual('');
    //   } catch (err) {
    //     console.error(`${TAG} failed, error: ${err.code}`);
    //     expect().assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONHAS_0100
     * @tc.name       : testHas0001
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0001";
      try {
        let jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.has(obj, "name");
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONHAS_0200
     * @tc.name       : testHas0002
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0002";
      try {
        let jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.has(obj, "sex");
        expect(rst).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONHAS_0300
     * @tc.name       : testHas0003
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0003";
      try {
        let jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.has(undefined, "name");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONHAS_0400
     * @tc.name       : testHas0004
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0004";
      try {
        let jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.has(obj, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONHAS_0500
     * @tc.name       : testHas0005
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0005";
      try {
        let jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.has(obj, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONHAS_0600
     * @tc.name       : testHas0006
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0006";
      try {
        let jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.has(obj, '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONHAS_0700
     * @tc.name       : testHas0007
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0007";
      try {
        let jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.has(obj, ' ');
        expect(rst).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONHAS_0800
     * @tc.name       : testHas0008
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0008";
      try {
        let jsonText = '{"name":""}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.has(obj, 'name');
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONHAS_0900
     * @tc.name       : testHas0009
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0009";
      try {
        let jsonText = '{"name":true}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.has(obj, 'name');
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONHAS_1000
     * @tc.name       : testHas0010
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0010";
      try {
        let jsonText = '{"name":null}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.has(obj, 'name');
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONHAS_1100
     * @tc.name       : testHas0011
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0011";
      try {
        let jsonText = '{"":"null"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.has(obj, '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONHAS_1200
     * @tc.name       : testHas0012
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0012";
      try {
        let jsonText =
          '{"!!\\"\\"##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\\\\\]]^^__``{{||}}~~": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.has(obj, "!!\"\"##$$%%''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONHAS_1300
     * @tc.name       : testHas0013
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHas0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHas0013";
      try {
        let jsonText =
          '{"name": "!!\\"\\"##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\\\\\]]^^__``{{||}}~~", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.has(obj, "name");
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONREMOVE_0100
     * @tc.name       : testRemove0001
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0001";
      try {
        const jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        expect((obj as object)?.["name"]).assertEqual('John');
        let rst = JSON.remove(obj, "name");
        expect((obj as object)?.["name"]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONREMOVE_0200
     * @tc.name       : testRemove0002
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemove0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0002";
      try {
        const jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        expect((obj as object)?.["sex"]).assertEqual(undefined);
        let rst = JSON.remove(obj, "sex");
        expect((obj as object)?.["sex"]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONREMOVE_0200
     * @tc.name       : testRemove0003
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemove0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0003";
      try {
        const jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.remove(undefined, "name");
        expect((obj as object)?.["name"]).assertEqual(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONREMOVE_0400
     * @tc.name       : testRemove0004
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemove0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0004";
      try {
        const jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.remove(obj, undefined);
        expect((obj as object)?.["name"]).assertEqual(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONREMOVE_0500
     * @tc.name       : testRemove0005
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemove0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0005";
      try {
        const jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.remove(obj, null);
        expect((obj as object)?.["name"]).assertEqual(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONREMOVE_0600
     * @tc.name       : testRemove0006
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemove0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0006";
      try {
        const jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.remove(obj, "");
        expect((obj as object)?.["name"]).assertEqual(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONREMOVE_0700
     * @tc.name       : testRemove0007
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemove0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0007";
      try {
        const jsonText = '{"name": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.remove(obj, " ");
        expect((obj as object)?.["name"]).assertEqual('John');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONREMOVE_0800
     * @tc.name       : testRemove0008
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemove0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0008";
      try {
        const jsonText = '{"name": ""}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.remove(obj, "name");
        expect((obj as object)?.["name"]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONREMOVE_0900
     * @tc.name       : testRemove0009
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemove0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0009";
      try {
        const jsonText = '{"name": true}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.remove(obj, "name");
        expect((obj as object)?.["name"]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONREMOVE_1000
     * @tc.name       : testRemove0010
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemove0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0010";
      try {
        const jsonText = '{"name": null}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.remove(obj, "name");
        expect((obj as object)?.["name"]).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONREMOVE_1100
     * @tc.name       : testRemove0011
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemove0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0011";
      try {
        const jsonText = '{"": null}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.remove(obj, "");
        expect((obj as object)?.["name"]).assertEqual(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONREMOVE_1200
     * @tc.name       : testRemove0012
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemove0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0012";
      try {
        const jsonText =
          '{"!!\"\"##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~": "John", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.remove(obj, "!!\"\"##$$%%''(())**++,,--..//::;;<<==>>??@@[[\\]]^^__``{{||}}~~");
        //expect((obj as object)?.["name"]).assertEqual(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_JSONREMOVE_1300
     * @tc.name       : testRemove0013
     * @tc.desc       : Testing JSON testHas function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemove0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testRemove0013";
      try {
        const jsonText =
          '{"name": "!!\"\"##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~", "age": 30, "city": "New York"}';
        let obj = JSON.parse(jsonText);
        let rst = JSON.remove(obj, "name");
        expect((obj as object)?.["name"]).assertEqual(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

  })
}
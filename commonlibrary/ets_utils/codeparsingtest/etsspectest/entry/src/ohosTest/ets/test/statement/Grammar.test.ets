/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { num1, num2, num3, num4, obj, sym, theProtoObj, unusualPropertyNames1, unusualPropertyNames2 } from './Grammar';

let TAG = '';

function test() {
  return
  {
    key: "value"
  }
}

interface GeneratedObjectLiteralInterface_1 {
  key: string;
}

function test1() {
  return ({ key: "value" } as GeneratedObjectLiteralInterface_1);
}

interface GeneratedObjectLiteralInterface_2 {}

interface GeneratedObjectLiteralInterface_3 {
  javascript: number;
  html: number;
  css: number;
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ActsGrammarTest() {
  describe('ActsGrammarTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.name   testVariable001
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_VARIABLE_0100
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVariable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testVariable001';
      try {
        const Früh = "foobar";
        expect(Früh).assertEqual("foobar");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testVariable002
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_VARIABLE_0200
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVariable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testVariable002';
      try {
        const früh = "barfoo";
        expect(früh).assertEqual("barfoo");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testUnicode001
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_UNICODE_0100
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnicode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUnicode001';
      try {
        const Früh = "早";
        const früh = "晚";
        expect(Früh).assertEqual("早");
        expect(früh).assertEqual("晚");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testUnicode002
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_UNICODE_0200
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnicode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUnicode002';
      try {
        const greeting = "你好，世界！";
        expect(greeting).assertEqual("你好，世界！");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testUnicode003
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_UNICODE_0300
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnicode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUnicode003';
      try {
        const unicodeEscape = "\u4F60\u597D";
        expect(unicodeEscape).assertEqual("\u4F60\u597D");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testUnicode004
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_UNICODE_0400
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnicode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUnicode004';
      try {
        const newline = "这是第一行\n这是第二行";
        expect(newline).assertEqual("这是第一行\n这是第二行");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testUnicode005
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_UNICODE_0500
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnicode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUnicode005';
      try {
        const tab = "这是第一列\t这是第二列";
        expect(tab).assertEqual("这是第一列\t这是第二列");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testUnicode006
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_UNICODE_0600
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnicode006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUnicode006';
      try {
        const quote = '这是单引号中的 "双引号"';
        expect(quote).assertEqual('这是单引号中的 "双引号"');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testUnicode007
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_UNICODE_0700
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnicode007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUnicode007';
      try {
        const backslash = "这是反斜杠 \\";
        expect(backslash).assertEqual("这是反斜杠 \\");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testUnicode008
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_UNICODE_0800
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnicode008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUnicode008';
      try {
        const $symbol = "这是一个符号变量";
        expect($symbol).assertEqual("这是一个符号变量");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testUnicode009
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_UNICODE_0900
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnicode009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUnicode009';
      try {
        const _underscore = "这是一个下划线变量";
        expect(_underscore).assertEqual("这是一个下划线变量");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testUnicode010
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_UNICODE_1000
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnicode010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUnicode010';
      try {
        const specialChars = "!@#$%^&*()_+{}|:\"<>?`~";
        expect(specialChars).assertEqual("!@#$%^&*()_+{}|:\"<>?`~");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testUnicode011
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_UNICODE_1100
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnicode011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUnicode011';
      try {
        const name = "Alice";
        const age = 30;
        const message = `你好，${name}！你今年 ${age} 岁。`;
        expect(message).assertEqual(`你好，${name}！你今年 ${age} 岁。`);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testUnicode012
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_UNICODE_1200
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnicode012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUnicode012';
      try {
        const specialMessage = `这是第一行\n这是第二行\t这是制表符`;
        expect(specialMessage).assertEqual(`这是第一行\n这是第二行\t这是制表符`);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testPeriod001
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_PERIOD_0100
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPeriod001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testPeriod001';
      try {
        const a = 1
        const b = 2
        expect(a).assertEqual(1);
        expect(b).assertEqual(2);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testPeriod002
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_PERIOD_0200
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPeriod002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testPeriod002';
      try {
        const c = 3;
        const d = 4;
        expect(c).assertEqual(3);
        expect(d).assertEqual(4);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testPeriod003
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_PERIOD_0300
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPeriod003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testPeriod003';
      try {
        expect(String(test())).assertEqual('undefined');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testPeriod004
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_PERIOD_0400
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPeriod004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testPeriod004';
      try {
        expect(JSON.stringify(test1())).assertEqual('{"key":"value"}');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testPeriod005
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_PERIOD_0500
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPeriod005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testPeriod005';
      try {
        const x = 10;
        const y = 20;
        expect(x).assertEqual(10);
        expect(y).assertEqual(20);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testPeriod006
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_PERIOD_0600
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPeriod006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testPeriod006';
      try {
        let x = 6;
        if (x > 5) {
          expect("x is greater than 5").assertEqual("x is greater than 5");
        }
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testPeriod007
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_PERIOD_0700
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPeriod007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testPeriod007';
      try {
        const z = 30;

        expect(z).assertEqual(30);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testExegesis001
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_EXEGESIS_0100
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExegesis001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testExegesis001';
      try {
        let str = "单行注释 - 基本用法";
        expect(str).assertEqual("单行注释 - 基本用法");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testExegesis002
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_EXEGESIS_0200
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExegesis002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testExegesis002';
      try {
        let str = "单行注释 - 单行注释后跟代码";
        expect(str).assertEqual("单行注释 - 单行注释后跟代码");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testExegesis003
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_EXEGESIS_0300
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExegesis003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testExegesis003';
      try {
        let str = "单行注释 - 多个单行注释";
        expect(str).assertEqual("单行注释 - 多个单行注释");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testExegesis004
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_EXEGESIS_0400
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExegesis004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testExegesis004';
      try {
        let str = "单行注释 - 单行注释中的特殊字符";
        expect(str).assertEqual("单行注释 - 单行注释中的特殊字符");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testExegesis005
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_EXEGESIS_0500
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExegesis005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testExegesis005';
      try {
        /* 基本用法 */
        let str = "多行注释 - 基本用法";
        expect(str).assertEqual("多行注释 - 基本用法");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testExegesis006
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_EXEGESIS_0600
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExegesis006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testExegesis006';
      try {
        /* 多行注释中的换行
         * 这是一个多行注释 */
        let str = "多行注释 - 多行注释中的换行";
        expect(str).assertEqual("多行注释 - 多行注释中的换行");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testExegesis007
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_EXEGESIS_0700
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExegesis007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testExegesis007';
      try {
        /* 多行注释后跟代码 */
        let str = "多行注释 - 多行注释后跟代码";
        expect(str).assertEqual("多行注释 - 多行注释后跟代码");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testExegesis008
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_EXEGESIS_0800
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExegesis008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testExegesis008';
      try {
        /* 多行注释中的特殊字符 @#$%^&*()_+{}:"<>?|,./;'[]\ * */
        let str = "多行注释 - 多行注释中的特殊字符";
        expect(str).assertEqual("多行注释 - 多行注释中的特殊字符");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testExegesis009
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_EXEGESIS_0900
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExegesis009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testExegesis009';
      try {
        let str = "多行注释 - 多行注释中的嵌套尝试";
        expect(str).assertEqual("多行注释 - 多行注释中的嵌套尝试");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testExegesis010
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_EXEGESIS_1000
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExegesis010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testExegesis010';
      try {
        /* 通过转义正斜杠 /* 嵌套注释 *\/ */
        let str = "嵌套注释处理 - 转义正斜杠";
        expect(str).assertEqual("嵌套注释处理 - 转义正斜杠");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testExegesis011
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_EXEGESIS_1100
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExegesis011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testExegesis011';
      try {
        let str = "嵌套注释处理 - 使用单行注释替代";
        expect(str).assertEqual("嵌套注释处理 - 使用单行注释替代");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testExegesis012
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_EXEGESIS_1200
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExegesis012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testExegesis012';
      try {
        /* 避免嵌套注释 */
        let str = "嵌套注释处理 - 避免嵌套";
        expect(str).assertEqual("嵌套注释处理 - 避免嵌套");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDeclare001
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_DECLARE_0100
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeclare001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testDeclare001';
      try {
        let Number_hits = 10;
        let temp99 = 20;
        let $credit = 30;
        let _name = "Alice";
        expect(Number_hits).assertEqual(10);
        expect(temp99).assertEqual(20);
        expect($credit).assertEqual(30);
        expect(_name).assertEqual("Alice");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testDeclare002
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_DECLARE_0200
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeclare002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testDeclare002';
      try {
        let å = "å";
        let ü = "ü";
        expect(å).assertEqual("å");
        expect(ü).assertEqual("ü");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDeclare003
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_DECLARE_0300
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeclare003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testDeclare003';
      try {
        let \u0061 = "a";
        expect(\u0061).assertEqual("a");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testType001
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_0100
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType001';
      try {
        const bool = true;
        const n = null;
        const undef = undefined;
        const num = 42;
        const bigInt = 9007199254740992n;
        const str = "Hello, World!";
        expect(String(typeof bool)).assertEqual('boolean');
        expect(String(typeof n)).assertEqual('object');
        expect(String(typeof undef)).assertEqual('undefined');
        expect(String(typeof num)).assertEqual('number');
        expect(String(typeof bigInt)).assertEqual('bigint');
        expect(String(typeof str)).assertEqual('string');
        expect(String(typeof sym)).assertEqual('symbol');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testType002
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_0200
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType002';
      try {
        const obj: GeneratedObjectLiteralInterface_2 = {};
        expect(obj instanceof Object).assertEqual(true);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testType003
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_0300
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType003';
      try {
        let b1 = Boolean(true);
        let b2 = Boolean(false);
        let b3 = Boolean(1);
        let b4 = Boolean(0);
        let b5 = Boolean("Hello");
        let b6 = Boolean("");
        let b7 = Boolean(null);
        let b8 = Boolean(undefined);
        let b9 = Boolean(NaN);
        let b10 = Boolean(42);
        let b11 = Boolean(9007199254740992n);
        let b12 = Boolean(sym);
        expect(b1).assertEqual(true);
        expect(b2).assertEqual(false);
        expect(b3).assertEqual(true);
        expect(b4).assertEqual(false);
        expect(b5).assertEqual(true);
        expect(b6).assertEqual(false);
        expect(b7).assertEqual(false);
        expect(b8).assertEqual(false);
        expect(b9).assertEqual(false);
        expect(b10).assertEqual(true);
        expect(b11).assertEqual(true);
        expect(b12).assertEqual(true);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testType004
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_0400
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType004';
      try {
        let n1 = Number(true);
        let n2 = Number(false);
        let n3 = Number("42");
        let n5 = Number("Hello");
        let n6 = Number("");
        let n7 = Number(null);
        let n8 = Number(undefined);
        let n9 = Number(NaN);
        let n10 = Number(42);
        let n11 = Number(9007199254740992n);
        expect(n1).assertEqual(1);
        expect(n2).assertEqual(0);
        expect(n3).assertEqual(42);
        expect(String(n5)).assertEqual("NaN");
        expect(n6).assertEqual(0);
        expect(n7).assertEqual(0);
        expect(String(n8)).assertEqual("NaN");
        expect(String(n9)).assertEqual("NaN");
        expect(n10).assertEqual(42);
        expect(n11).assertEqual(9007199254740992);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testType005
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_0500
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType005';
      try {
        let s1 = String(true);
        let s2 = String(false);
        let s3 = String(42);
        let s4 = String(9007199254740992n);
        let s5 = String("Hello");
        let s6 = String("");
        let s7 = String(null);
        let s8 = String(undefined);
        let s9 = String(NaN);
        let s10 = String(sym);
        expect(s1).assertEqual("true");
        expect(s2).assertEqual("false");
        expect(s3).assertEqual("42");
        expect(s4).assertEqual("9007199254740992");
        expect(s5).assertEqual("Hello");
        expect(s6).assertEqual("");
        expect(s7).assertEqual("null");
        expect(s8).assertEqual("undefined");
        expect(s9).assertEqual("NaN");
        expect(s10).assertEqual("Symbol(key)");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect(e.message).assertContain('TypeError: Cannot convert a Symbol value to a number');
      }
      done();
    });

    /**
     * @tc.name   testType006
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_0600
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType006';
      try {
        let bi1 = BigInt(42);
        let bi3 = BigInt(true);
        let bi4 = BigInt(false);
        expect(bi1).assertEqual(42n);
        expect(bi3).assertEqual(1n);
        expect(bi4).assertEqual(0n);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testType007
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_0700
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType007';
      try {
        if (true) {
          let a = "true is truthy";
          expect(a).assertEqual("true is truthy");
        }

        if (1) {
          let a1 = "1 is truthy";
          expect(a1).assertEqual("1 is truthy");
        }

        if ("Hello") {
          let a2 = "Hello is truthy";
          expect(a2).assertEqual("Hello is truthy");
        }

        if (0) {
          let a3 = "0 is truthy";
          expect(a3).assertEqual("0 is truthy");
        }

        if (null) {
          let a4 = "null is truthy";
          expect(a4).assertEqual("null is truthy");
        }

        if (undefined) {
          let a5 = "undefined is truthy";
          expect(a5).assertEqual("undefined is truthy");
        }

        if (NaN) {
          let a6 = "NaN is truthy";
          expect(a6).assertEqual("NaN is truthy");
        }

        if ("") {
          let a7 = "empty is truthy";
          expect(a7).assertEqual("empty is truthy");
        }

      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testType008
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_0800
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType008';
      try {
        expect(num1).assertEqual(43);
        expect(num2).assertEqual(42);
        expect(42 + "42").assertEqual("4242");
        expect(42 + "").assertEqual("42");
        expect(num3).assertEqual(42);
        expect(String(num4)).assertEqual("NaN");
        expect(String(42 + NaN)).assertEqual("NaN");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testType009
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_0900
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType009';
      try {
        expect("" + true).assertEqual("true");
        expect("" + false).assertEqual("false");
        expect("" + 42).assertEqual("42");
        expect("" + 9007199254740992n).assertEqual("9007199254740992");
        expect("" + "Hello").assertEqual("Hello");
        expect("" + "").assertEqual("");
        expect("" + null).assertEqual("null");
        expect("" + undefined).assertEqual("undefined");
        expect("" + NaN).assertEqual("NaN");
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testType010
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_1000
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType010';
      try {
        const bigInt1 = 9007199254740992n;

        const bigInt2 = BigInt(9007199254740992);
        const bigInt3 = BigInt("9007199254740992");

        expect(bigInt1).assertEqual(9007199254740992n);
        expect(bigInt2).assertEqual(9007199254740992n);
        expect(bigInt3).assertEqual(9007199254740992n);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testType011
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_1100
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType011';
      try {
        const a = 9007199254740992n;
        const b = 100n;
        expect(a + b).assertEqual(9007199254741092n);
        expect(a - b).assertEqual(9007199254740892n);
        expect(a * b).assertEqual(900719925474099200n);
        expect(a / b).assertEqual(90071992547409n);
        expect(a % b).assertEqual(92n);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testType012
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_1200
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType012';
      try {
        const num = 100;
        const bigNum = 9007199254740992n;
        expect(bigNum + BigInt(num)).assertEqual(9007199254741092n);
        expect(Number(bigNum) + num).assertEqual(9007199254741092);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testType013
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_1300
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType013';
      try {
        const bigNum = 9007199254740992n;

        expect(String(typeof bigNum)).assertEqual('bigint');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testType014
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_1400
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType014';
      try {
        const bigNum = 9007199254740992n;
        expect(String(bigNum)).assertEqual("9007199254740992");
        expect(bigNum.toString()).assertEqual("9007199254740992");
        expect(Boolean(bigNum)).assertEqual(true);
        expect(Boolean(0n)).assertEqual(false);
        expect(Number(bigNum)).assertEqual(9007199254740992);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testType015
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_1500
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType015';
      try {
        const bigNum = 9007199254740992n;
        expect("" + bigNum).assertEqual("9007199254740992");
        if (bigNum) {
          let a = "bigNum is truthy";
          expect(a).assertEqual("bigNum is truthy");
        }
        if (0n) {
          let a1 = "0n is truthy";
          expect(a1).assertEqual("0n is truthy");
        } else {
          let a2 = "0n is falsy";
          expect(a2).assertEqual("0n is falsy");
        }

      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testType016
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_TYPE_1600
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testType016';
      try {
        let a = 9007199254740992n;
        let b = 9007199254740992n;
        let c = 9007199254740993n;
        expect(a === b).assertEqual(true);
        console.log((b === c).toString());
        expect(a === c).assertEqual(false);
        expect(a < c).assertEqual(true);
        expect(a > c).assertEqual(false);
        expect(a === BigInt(9007199254740992)).assertEqual(true);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testLiteral001
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_LITERAL_0100
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLiteral001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testLiteral001';
      try {
        expect(unusualPropertyNames1).assertEqual('空字符串');
        expect(unusualPropertyNames2).assertEqual('砰！');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testLiteral002
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_LITERAL_0200
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLiteral002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testLiteral002';
      try {
        expect(theProtoObj.protoMethod()).assertEqual("proto method");
        expect(obj.handler.handle()).assertEqual("handler method");
        expect(obj.toString()).assertEqual("d [object Object]");
        expect(obj.prop_42).assertEqual(42);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testLiteral003
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_LITERAL_0300
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLiteral003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testLiteral003';
      try {
        const str1 = '在 JavaScript 中，“\n” 是换行符。';
        const str2 = `在 JavaScript 中，模板字符串可以
跨越行，但是由双引号和单引号
包裹的字符串不行。`;
        const name = 'Lev';
        const time = 'today';
        const str3 = `你好 ${name}，${time} 过得怎么样？`;
        expect(str1).assertEqual('在 JavaScript 中，“\n” 是换行符。');
        expect(str2).assertEqual(`在 JavaScript 中，模板字符串可以
跨越行，但是由双引号和单引号
包裹的字符串不行。`);
        expect(str3).assertEqual(`你好 ${name}，${time} 过得怎么样？`);
        expect("John 的猫".length).assertEqual(7);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testLiteral004
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_LITERAL_0400
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLiteral004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testLiteral004';
      try {
        const todos = ["学习 JavaScript", "学习 Web API", "构建网站", "利润！"];
        const progress: GeneratedObjectLiteralInterface_3 = { javascript: 20, html: 50, css: 10 };
        expect(`我需要做：${JSON.stringify(todos)}当前进度为：${JSON.stringify(progress)}`)
          .assertEqual('我需要做：["学习 JavaScript","学习 Web API","构建网站","利润！"]当前进度为：{"javascript":20,"html":50,"css":10}');
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testLiteral005
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_LITERAL_0500
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLiteral005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testLiteral005';
      try {
        const re = /ab+c/;
        expect(re.test("abc")).assertEqual(true);
        expect(re.test("abbc")).assertEqual(true);
        expect(re.test("ac")).assertEqual(false);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testLiteral006
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_LITERAL_0600
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLiteral006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testLiteral006';
      try {
        const decimal = 123;
        const octal = 0o123;
        const hex = 0x123;
        const binary = 0b111;
        const bigInt = 123456789123456789n;
        expect(decimal).assertEqual(123);
        expect(octal).assertEqual(83);
        expect(hex).assertEqual(291);
        expect(binary).assertEqual(7);
        expect(bigInt).assertEqual(123456789123456789n);
        const float1 = 3.1415926;
        const float2 = .123456789;
        const float3 = 3.1E+12;
        const float4 = .1e-23;
        expect(float1).assertEqual(3.1415926);
        expect(float2).assertEqual(0.123456789);
        expect(float3).assertEqual(3100000000000);
        expect(float4).assertEqual(1e-24);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testLiteral007
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_LITERAL_0700
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLiteral007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testLiteral007';
      try {
        const bool1 = true;
        const bool2 = false;
        expect(bool1).assertEqual(true);
        expect(bool2).assertEqual(false);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testLiteral008
     * @tc.number SUB_COMMONLIBRARY_BUILTIN_BASIC_LITERAL_0800
     * @tc.desc   Test syntax and data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLiteral008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testLiteral008';
      try {
        const fish = ["Lion", , "Angel"];
        const myList = ["home", , "school", ,];
        const myList2 = [, "home", , "school"];
        const myList3 = ["home", , "school", ,];
        expect(String(fish)).assertEqual("Lion,,Angel");
        expect(fish[1]).assertEqual(undefined);
        expect(String(myList)).assertEqual('home,,school,');
        expect(myList.length).assertEqual(4);
        expect(String(myList2)).assertEqual(',home,,school');
        expect(myList2.length).assertEqual(4);
        expect(String(myList3)).assertEqual('home,,school,');
        expect(myList3.length).assertEqual(4);
      } catch (e) {
        console.error(TAG, ` failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
  })
}
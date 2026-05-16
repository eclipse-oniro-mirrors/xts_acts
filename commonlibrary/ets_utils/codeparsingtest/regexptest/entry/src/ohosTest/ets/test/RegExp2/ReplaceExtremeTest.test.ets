/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  extreme17_1CustomSymbolReplaceObject,
  extreme17_2RegexpSymbolReplaceDirectCall,
  extreme17_3ParameterOrderVerification,
  extreme18_1RecursiveReplacement,
  extreme18_2ConditionalReplacement,
  extreme18_3AccumulativeReplacement,
  extreme18_4ContextAwareReplacement,
  extreme18_5LookupTableReplacement
} from './RegExpHelper';

export default function replaceExtremeTest() {

    describe('Symbol_replace_Custom_Behavior', () => {
      /**
       * @tc.name testReplace0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0100
       * @tc.desc   Test Custom Symbol replace Object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme17_1CustomSymbolReplaceObject()).assertEqual('olleH!');
      });

      /**
       * @tc.name testReplace0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0200
       * @tc.desc   Test RegExp Symbol replace Direct Call
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
      */
      it('testReplace0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme17_2RegexpSymbolReplaceDirectCall()).assertEqual('Hello There, There!');
      });

      /**
       * @tc.name testReplace0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0300
       * @tc.desc   Test Parameter Order Verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme17_3ParameterOrderVerification()).assertTrue();
      });
    });

    describe('Advanced_Scenario_Tests', () => {
      /**
       * @tc.name testReplace0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0400
       * @tc.desc   Test Recursive Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme18_1RecursiveReplacement()).assertEqual('abc');
      });

      /**
       * @tc.name testReplace0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0500
       * @tc.desc   Test Conditional Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme18_2ConditionalReplacement()).assertEqual('item10, item20, item30');
      });

      /**
       * @tc.name testReplace0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0600
       * @tc.desc   Test Accumulative Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme18_3AccumulativeReplacement()).assertEqual('a1 b2 c3 d4 e5');
      });

      /**
       * @tc.name testReplace0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0700
       * @tc.desc   Test Context Aware Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme18_4ContextAwareReplacement()).assertEqual('HELLO world hi universe');
      });

      /**
       * @tc.name testReplace0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0800
       * @tc.desc   Test Lookup Table Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme18_5LookupTableReplacement()).assertEqual('dog bird cat');
      });
    });

    describe('Boundary_Case_Extension_Tests', () => {
      /**
       * @tc.name testReplace0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0900
       * @tc.desc   Test Extreme Quantifier Value
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a'.repeat(1000);
        const regex = /a{1000}/;
        const result = str.replace(regex, 'X');
        expect(result).assertEqual('X');
      });

      /**
       * @tc.name testReplace0109
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_1000
       * @tc.desc   Test Many Capture Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let pattern = '';
        for (let i = 0; i < 50; i++) {
          pattern += '(\\w)';
        }
        const regex = new RegExp(`^${pattern}$`);
        const str = 'a'.repeat(50);
        const result = str.replace(regex, 'X');
        expect(result).assertEqual('X');
      });

      /**
       * @tc.name testReplace0110
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_1100
       * @tc.desc   Test Deeply Nested Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex = /(((a)))/;
        const str = 'a';
        const result = str.replace(regex, 'X');
        expect(result).assertEqual('X');
      });

      /**
       * @tc.name testReplace0111
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_1200
       * @tc.desc   Test Zero Match Loop Guard
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test';
        const regex = /(?=)/g;
        const result = str.replace(regex, 'X');
        expect(result).assertEqual('XtXeXsXtX');
      });

      /**
       * @tc.name testReplace0112
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_1300
       * @tc.desc   Test Special Unicode Combination
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'e\u0301';
        const result1 = str.replace(/^./u, 'X');
        const result2 = str.replace(/^\S/u, 'X');
        expect(result1).assertEqual('X\u0301');
        expect(result2).assertEqual('X\u0301');
      });
    });

    describe('String_Parameter_Extension_Tests', () => {
      /**
       * @tc.name testReplace0113
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_1400
       * @tc.desc   Test String Pattern Auto Escape
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a.b.c';
        const result = str.replace('.', '_');
        expect(result).assertEqual('a_b.c');
      });

      /**
       * @tc.name testReplace0114
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_1500
       * @tc.desc   Test String Pattern Limitations
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'John Smith';
        const result = str.replace('(\\w+)\\s(\\w+)', '$2, $1');
        expect(result).assertEqual('John Smith');
      });

      /**
       * @tc.name testReplace0115
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_1600
       * @tc.desc   Test String Pattern vs Regex Pattern Comparison
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test test';
        const result1 = str.replace('test', 'X');
        const result2 = str.replace(/test/, 'X');
        const result3 = str.replace(/test/g, 'X');
        expect(result1).assertEqual('X test');
        expect(result2).assertEqual('X test');
        expect(result3).assertEqual('X X');
      });
    });

}



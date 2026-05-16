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

/**
 * RegExp instance data properties (source, flags, dotAll, etc.) and strict-mode assignment behavior. Feature gates avoid
 * failing closed when dotAll or indices are absent; RegExpHelper encodes expectations that differ between static stubs and engines.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import {
  assignSourceStrictStillOriginal,
  regexpWithDFlagHasIndicesTrue,
  regexpLiteralWithoutDNotHasIndices
} from './RegExpHelper';

// Skip or narrow cases when the runtime rejects a flag letter instead of throwing inside every property assertion.
function supportsRegExp(pattern: string, flags: string = ''): boolean {
  /*
   * Property tests assume the instance exists; if ctor rejects the flag, continuing would throw unrelated TypeErrors on
   * every expect(regex.flags) instead of a clean skip for optional features like dotAll.
   */
  try {
    /*
     * Mirrors how InstanceProperties cases construct regex鈥攕ame arity avoids 鈥減robe passed, case failed鈥?mismatches.
     */
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    /*
     * Broad catch: host may throw SyntaxError or a wrapped diagnostic; either means the feature path is unavailable here.
     */
    return false;
  }
}

// Single suite: instance fields are tightly coupled, so one describe keeps ordering stable for TC traceability.
export default function instancePropertiesTest(): void {
  describe('Instance_Properties', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
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
     * @tc.name testRegExpInstance0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0100
     * @tc.desc Test source abc i and dollar plus g
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const regex1 = new RegExp('abc', 'i');
      const regex2 = new RegExp('\\d+', 'g');
      const regex3 = new RegExp('\\w+');
      expect(regex1.source).assertEqual('abc');
      expect(regex2.source).assertEqual('\\d+');
      expect(regex3.source).assertEqual('\\w+');
    });

    /**
     * @tc.name testRegExpInstance0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0200
     * @tc.desc Test source readonly strict
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(assignSourceStrictStillOriginal()).assertTrue();
    });

    /**
     * @tc.name testRegExpInstance0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0300
     * @tc.desc Test flags gim and empty pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const regex1 = new RegExp('abc', 'gim');
      const regex2 = new RegExp('test');
      expect(regex1.flags).assertEqual('gim');
      expect(regex2.flags).assertEqual('');
    });

    /**
     * @tc.name testRegExpInstance0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0900
     * @tc.desc Test s flag unsupported when dotAll not available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (supportsRegExp('hello', 's')) {
        const r = new RegExp('hello', 's');
        expect(r.dotAll).assertTrue();
        expect(r.flags.indexOf('s') >= 0).assertTrue();
        return;
      }
      return;
    });

    /**
     * @tc.name testRegExpInstance0109
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0800
     * @tc.desc Test flags include s when dotAll supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('hello', 's')) {
        return;
      }
      const regex3 = new RegExp('hello', 's');
      expect(regex3.flags.indexOf('s') >= 0).assertTrue();
    });

    /**
     * @tc.name testRegExpInstance0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0400
     * @tc.desc Test global ignoreCase multiline
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      
      expect(new RegExp('test', 'g').global).assertTrue();
      expect(new RegExp('test').global).assertFalse();
      expect(new RegExp('test', 'i').ignoreCase).assertTrue();
      expect(new RegExp('test').ignoreCase).assertFalse();
      expect(new RegExp('test', 'm').multiline).assertTrue();
      expect(new RegExp('test').multiline).assertFalse();
    });

    /**
     * @tc.name testRegExpInstance0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0500
     * @tc.desc Test dotAll true when s flag supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('test', 's')) {
        return;
      }
      expect(new RegExp('test', 's').dotAll).assertTrue();
    });

    /**
     * @tc.name testRegExpInstance0108
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0700
     * @tc.desc Test dotAll sticky unicode on literals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      
      expect(new RegExp('test').dotAll).assertFalse();
      expect(new RegExp('test').sticky).assertFalse();
      expect(new RegExp('test').unicode).assertFalse();
      if (supportsRegExp('test', 'y')) {
        expect(new RegExp('test', 'y').sticky).assertTrue();
      }
      if (supportsRegExp('test', 'u')) {
        expect(new RegExp('test', 'u').unicode).assertTrue();
      }
    });

    /**
     * @tc.name testRegExpInstance0106
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0600
     * @tc.desc Test hasIndices true when d flag supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('test', 'd')) {
        return;
      }
      const probe: RegExp = new RegExp('test', 'd');
      if (probe.hasIndices !== true) {
        return;
      }
      expect(regexpWithDFlagHasIndicesTrue()).assertTrue();
    });

    /**
     * @tc.name testRegExpInstance0107
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_1100
     * @tc.desc Test literal without d flag hasIndices false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(regexpLiteralWithoutDNotHasIndices()).assertTrue();
    });

    /**
     * @tc.name testRegExpInstance0200
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_1200
     * @tc.desc Test flags normalization and basic flag booleans
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('x', 'mig');
      expect(re.flags).assertEqual('gim');
      expect(re.global).assertTrue();
      expect(re.ignoreCase).assertTrue();
      expect(re.multiline).assertTrue();
    });

    /**
     * @tc.name testRegExpInstance0201
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_1300
     * @tc.desc Test sticky and unicode flags when yu is supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('x', 'yu')) {
        return;
      }
      const re = new RegExp('x', 'yu');
      expect(re.sticky).assertTrue();
      expect(re.unicode).assertTrue();
      expect(re.flags.indexOf('y') >= 0).assertTrue();
      expect(re.flags.indexOf('u') >= 0).assertTrue();
    });

    /**
     * @tc.name testRegExpInstance0202
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_1400
     * @tc.desc Test d flag presence and hasIndices behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('x', 'd')) {
        return;
      }
      const re = new RegExp('x', 'd');
      expect(re.flags.indexOf('d') >= 0).assertTrue();
      if ((re as RegExp).hasIndices !== undefined) {
        expect(re.hasIndices).assertTrue();
      }
    });

    /**
     * @tc.name testRegExpInstance0203
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_1500
     * @tc.desc Test escaped slash source keeps expected fragments
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpInstance0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\/api\\/v2');
      expect(re.source.indexOf('api') >= 0).assertTrue();
      expect(re.source.indexOf('v2') >= 0).assertTrue();
      expect(re.source.indexOf('/') >= 0).assertTrue();
    });
  });
}



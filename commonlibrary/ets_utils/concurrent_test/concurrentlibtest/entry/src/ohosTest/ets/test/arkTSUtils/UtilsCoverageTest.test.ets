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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, lang } from '@kit.ArkTS';

@Sendable
class Test {
  name: string = '';
  value: number = 0;
}

@Sendable
class TestObj implements lang.ISendable {
  value: number = 100;
}

export default function utilsCoverageTest() {
  describe('utilsCoverageTest', () => {


    /**
     * @tc.name   asyncLockQueryPropertyValidation001
     * @tc.number SUB_UTILS_ASYNC_LOCK_QUERY_PROPERTY_VALIDATION_001
     * @tc.desc   Test AsyncLock.query property validation for held and pending arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncLockQueryPropertyValidation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const TAG: string = 'asyncLockQueryPropertyValidation001';
        try {
          const lockName = 'testLockQuery';
          let lock = ArkTSUtils.locks.AsyncLock.request(lockName);

          let state = ArkTSUtils.locks.AsyncLock.query(lockName);
          expect(state?.held.length).assertEqual(0);
          expect(state?.pending.length).assertEqual(0);
        } catch (error) {
          console.error(`${TAG} catch error: ${error}`);
          expect().assertFail();
        }
        done()
      })

    /**
     * @tc.name   asyncLockLockAsyncReturnValidation001
     * @tc.number SUB_UTILS_ASYNC_LOCK_LOCK_ASYNC_RETURN_VALIDATION_001
     * @tc.desc   Test AsyncLock.lockAsync return type validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncLockLockAsyncReturnValidation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const TAG: string = 'asyncLockLockAsyncReturnValidation001';
        try {
          let lock = new ArkTSUtils.locks.AsyncLock();

          // Test with string return
          let result = await lock.lockAsync<string>(() => {
            return "test result";
          });
          expect(result).assertEqual("test result");

          // Test with number return
          let numberResult = await lock.lockAsync<number>(() => {
            return 42;
          });
          expect(numberResult).assertEqual(42);

          // Test with boolean return
          let boolResult = await lock.lockAsync<boolean>(() => {
            return true;
          });
          expect(boolResult).assertTrue();

          // Test with object return
          let objResult = await lock.lockAsync<TestObj>(() => {
            return new TestObj();
          });
          expect(objResult.value).assertEqual(100);
        } catch (error) {
          console.error(`${TAG} catch error: ${error}`);
          expect().assertFail();
        }
        done()
      })

    /**
     * @tc.name   conditionVariableRequestReturnValidation001
     * @tc.number SUB_UTILS_CONDITION_VARIABLE_REQUEST_RETURN_VALIDATION_001
     * @tc.desc   Test ConditionVariable.request return type validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('conditionVariableRequestReturnValidation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const TAG: string = 'conditionVariableRequestReturnValidation001';
        try {
          let conditionVar = ArkTSUtils.locks.ConditionVariable.request("testCondition");
          expect(conditionVar instanceof ArkTSUtils.locks.ConditionVariable).assertTrue();
        } catch (error) {
          console.error(`${TAG} catch error: ${error}`);
          expect().assertFail();
        }
        done()
      })

    /**
     * @tc.name   asonParseNullUndefined004
     * @tc.number SUB_UTILS_ASON_PARSE_NULL_UNDEFINED_004
     * @tc.desc   Test ASON.parse with undefined reviver parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseNullUndefined004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseNullUndefined004';
      try {
        let jsonText = '{"name": "test", "value": 42}';
        // Test with undefined reviver parameter
        let result = ArkTSUtils.ASON.parse(jsonText, undefined) as Test;
        expect(result.name).assertEqual("test");
        expect(result.value).assertEqual(42);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   asonParseNullUndefined006
     * @tc.number SUB_UTILS_ASON_PARSE_NULL_UNDEFINED_006
     * @tc.desc   Test ASON.parse with undefined options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseNullUndefined006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseNullUndefined006';
      try {
        let jsonText = '{"name": "test", "value": 42}';
        // Test with undefined options parameter
        let result = ArkTSUtils.ASON.parse(jsonText, undefined, undefined) as Test;
        expect(result.name).assertEqual("test");
        expect(result.value).assertEqual(42);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   asonParseReturnValidation001
     * @tc.number SUB_UTILS_ASON_PARSE_RETURN_VALIDATION_001
     * @tc.desc   Test ASON.parse return type validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseReturnValidation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseReturnValidation001';
      try {
        // Test valid JSON string
        let jsonText = '{"name": "test", "value": 42}';
        let result = ArkTSUtils.ASON.parse(jsonText) as Test;
        expect(result.name).assertEqual("test");
        expect(result.value).assertEqual(42);
        expect(typeof result).assertEqual("object");

        // Test empty JSON object
        let emptyJsonText = '{}';
        let emptyResult = ArkTSUtils.ASON.parse(emptyJsonText);
        expect(JSON.stringify(emptyResult)).assertEqual("{}");
        expect(typeof emptyResult).assertEqual("object");

        // Test JSON array
        let arrayJsonText = '[1, 2, 3]';
        let arrayResult = ArkTSUtils.ASON.parse(arrayJsonText) as collections.Array<number>;
        expect(arrayResult.length).assertEqual(3);
        expect(arrayResult[0]).assertEqual(1);
        expect(arrayResult[1]).assertEqual(2);
        expect(arrayResult[2]).assertEqual(3);

        // Test null JSON text
        let nullJsonText = 'null';
        let nullResult = ArkTSUtils.ASON.parse(nullJsonText);
        expect(nullResult).assertEqual(null);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   sendableLruCacheRemoveReturnValidation001
     * @tc.number SUB_UTILS_SENDABLE_LRU_CACHE_REMOVE_RETURN_VALIDATION_001
     * @tc.desc   Test SendableLruCache.remove return type validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheRemoveReturnValidation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const TAG: string = 'sendableLruCacheRemoveReturnValidation001';
        try {
          let cache = new ArkTSUtils.SendableLruCache<string, number>();

          // Add some values
          cache.put("key1", 100);
          cache.put("key2", 200);

          // Test removing existing key
          let result1 = cache.remove("key1");
          expect(result1).assertEqual(100);

          // Test removing non-existing key
          let result2 = cache.remove("nonExistentKey");
          expect(result2).assertUndefined();

          // Verify key was actually removed
          let result3 = cache.get("key1");
          expect(result3).assertUndefined();
        } catch (error) {
          console.error(`${TAG} catch error: ${error}`);
          expect().assertFail();
        }
        done()
      })


    /**
     * @tc.name   asyncLockRequestEmptyString001
     * @tc.number SUB_UTILS_ASYNC_LOCK_REQUEST_EMPTY_STRING_001
     * @tc.desc   Test AsyncLock.request with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncLockRequestEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asyncLockRequestEmptyString001';
      try {
        // Test with empty string parameter
        let lock = ArkTSUtils.locks.AsyncLock.request("");
        expect(lock instanceof ArkTSUtils.locks.AsyncLock).assertTrue();
        expect(lock.name).assertEqual("");
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   asyncLockQueryEmptyString001
     * @tc.number SUB_UTILS_ASYNC_LOCK_QUERY_EMPTY_STRING_001
     * @tc.desc   Test AsyncLock.query with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncLockQueryEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asyncLockQueryEmptyString001';
      try {
        // Create a lock first
        let lock = ArkTSUtils.locks.AsyncLock.request("");

        // Test with empty string parameter
        let state = ArkTSUtils.locks.AsyncLock.query("");
        expect(state.held.length).assertEqual(0);
        expect(state.pending.length).assertEqual(0);
        expect(Array.isArray(state.held)).assertTrue();
        expect(Array.isArray(state.pending)).assertTrue();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   conditionVariableRequestEmptyString001
     * @tc.number SUB_UTILS_CONDITION_VARIABLE_REQUEST_EMPTY_STRING_001
     * @tc.desc   Test ConditionVariable.request with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('conditionVariableRequestEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const TAG: string = 'conditionVariableRequestEmptyString001';
        try {
          // Test with empty string parameter
          let conditionVar = ArkTSUtils.locks.ConditionVariable.request("");
          expect(conditionVar instanceof ArkTSUtils.locks.ConditionVariable).assertTrue();
        } catch (error) {
          console.error(`${TAG} catch error: ${error}`);
          expect().assertFail();
        }
        done()
      })
    /**
     * @tc.name   asonParseEmptyString001
     * @tc.number SUB_UTILS_ASON_PARSE_EMPTY_STRING_001
     * @tc.desc   Test ASON.parse with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseEmptyString001';
      try {
        // Test with empty string parameter
        let result = ArkTSUtils.ASON.parse("");
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        // error code 401 expect(error.code).assertEqual(401);
      }
      done()
    })

    /**
     * @tc.name   asonParseEmptyString002
     * @tc.number SUB_UTILS_ASON_PARSE_EMPTY_STRING_002
     * @tc.desc   Test ASON.parse with empty string JSON object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseEmptyString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseEmptyString002';
      try {
        // Test with empty JSON object string
        let result = ArkTSUtils.ASON.parse("{}");
        expect(JSON.stringify(result)).assertEqual("{}");
        expect(typeof result).assertEqual("object");
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   asonParseEmptyString003
     * @tc.number SUB_UTILS_ASON_PARSE_EMPTY_STRING_003
     * @tc.desc   Test ASON.parse with empty string JSON array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseEmptyString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseEmptyString003';
      try {
        // Test with empty JSON array string
        let result = ArkTSUtils.ASON.parse("[]") as collections.Array<number>;
        expect(result.length).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   sendableLruCacheEmptyString001
     * @tc.number SUB_UTILS_SENDABLE_LRU_CACHE_EMPTY_STRING_001
     * @tc.desc   Test SendableLruCache with empty string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'sendableLruCacheEmptyString001';
      try {
        let cache = new ArkTSUtils.SendableLruCache<string, number>();

        // Add a value with empty string key
        cache.put("", 100);
        let getResult = cache.get("");
        expect(getResult).assertEqual(100);

        // Test contains with empty string key
        let containsResult = cache.contains("");
        expect(containsResult).assertTrue();

        // Test remove with empty string key
        let removeResult = cache.remove("");
        expect(removeResult).assertEqual(100);

        // Verify removal
        let afterRemoveResult = cache.get("");
        expect(afterRemoveResult).assertUndefined();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })
  });
}
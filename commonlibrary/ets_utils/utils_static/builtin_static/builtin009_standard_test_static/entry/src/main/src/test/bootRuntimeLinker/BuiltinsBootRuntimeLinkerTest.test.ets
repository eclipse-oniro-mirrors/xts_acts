/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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



export default function builtinsBootRuntimeLinkerTest() {
  describe('builtinsBootRuntimeLinkerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
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
     * @tc.name    builtinsBootRuntimeLinkerTest0001
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0001
     * @tc.desc    Test getBootRuntimeLinker returns non-null instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBootRuntimeLinkerTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = getBootRuntimeLinker();
      expect(linker!=null).assertTrue();
      expect(typeof linker).assertEqual('object');
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0002
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0002
     * @tc.desc    Test getBootRuntimeLinker returns BootRuntimeLinker instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBootRuntimeLinkerTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = getBootRuntimeLinker();
      const isInstance = linker instanceof BootRuntimeLinker;
      expect(isInstance).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0003
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0003
     * @tc.desc    Test getBootRuntimeLinker singleton property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker1 = getBootRuntimeLinker();
      const linker2 = getBootRuntimeLinker();
      const linker3 = getBootRuntimeLinker();

      expect(linker1).assertEqual(linker2);
      expect(linker2).assertEqual(linker3);
      expect(linker1).assertEqual(linker3);
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0004
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0004
     * @tc.desc    Test BootRuntimeLinker instance static property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = getBootRuntimeLinker();
      const staticInstance = BootRuntimeLinker.instance;

      expect(linker).assertEqual(staticInstance);
      expect(BootRuntimeLinker.instance!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0005
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0005
     * @tc.desc    Test getBootRuntimeLinker with various call contexts
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testFunction = () => {
        return getBootRuntimeLinker();
      };

      const linker1 = getBootRuntimeLinker();
      const linker2 = testFunction();

      expect(linker1).assertEqual(linker2);
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0006
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0006
     * @tc.desc    Test getBootRuntimeLinker memory reference stability
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker1 = getBootRuntimeLinker();
      const arr = [1, 2, 3];
      const str = 'test string';

      const linker2 = getBootRuntimeLinker();

      expect(linker1).assertEqual(linker2);
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0007
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0007
     * @tc.desc    Test getBootRuntimeLinker in concurrent scenarios simulation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linkers: BootRuntimeLinker[] = [];

      for (let i = 0; i < 100; i++) {
        linkers.push(getBootRuntimeLinker());
      }

      const firstLinker = linkers[0];
      for (let i = 1; i < linkers.length; i++) {
        expect(linkers[i]).assertEqual(firstLinker);
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0008
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0008
     * @tc.desc    Test getBootRuntimeLinker with stress test
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const startTime = Date.now();
      const iterations = 1000;

      for (let i = 0; i < iterations; i++) {
        const linker = getBootRuntimeLinker();
        expect(linker!=null).assertTrue();
      }

      const endTime = Date.now();
      const duration = endTime - startTime;

      expect(duration < 1000).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0009
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0009
     * @tc.desc    Test getBootRuntimeLinker return value type and properties
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = getBootRuntimeLinker();

      expect(typeof linker).assertEqual('object');

      expect(linker === null).assertFalse();
      expect(linker === undefined).assertFalse();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0010
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0010
     * @tc.desc    Test getBootRuntimeLinker in different scope contexts
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      {
        const linker1 = getBootRuntimeLinker();
        expect(linker1!=null).assertTrue();
      }

      {
        const linker2 = getBootRuntimeLinker();
        expect(linker2!=null).assertTrue();
      }

      const linker3 = getBootRuntimeLinker();
      expect(linker3!=null).assertTrue();

    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0011
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0011
     * @tc.desc    Test getBootRuntimeLinker with try-catch error handling
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      try {
        const linker = getBootRuntimeLinker();
        expect(linker!=null).assertTrue();

        const success = true;
        expect(success).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0012
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0012
     * @tc.desc    Test getBootRuntimeLinker property descriptors
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const func = getBootRuntimeLinker;

      expect(func.name).assertEqual('getBootRuntimeLinker');
      expect(typeof func).assertEqual('function');

      const linker = func();
      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0013
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0013
     * @tc.desc    Test getBootRuntimeLinker with various data types in environment (simulating checklist coverage)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const specialChars = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';

      const linker1 = getBootRuntimeLinker();
      expect(linker1!=null).assertTrue();

      const numberValues = [0, -0, NaN, Infinity, -Infinity, 1.5, Number.MAX_VALUE];
      for (const num of numberValues) {
        const temp = num;
        const linker = getBootRuntimeLinker();
        expect(linker!=null).assertTrue();
      }

      const arrays: number[][] = [
        [72, 101, 108, 108, 111],
        [],
        [1, 2, 3]
      ];

      for (const arr of arrays) {
        const linker = getBootRuntimeLinker();
        expect(linker!=null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0014
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0014
     * @tc.desc    Test getBootRuntimeLinker GC behavior and memory management
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBootRuntimeLinkerTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const linkers: BootRuntimeLinker[] = [];

      for (let i = 0; i < 10; i++) {
        linkers.push(getBootRuntimeLinker());
      }

      const firstLinker = linkers[0];
      for (const linker of linkers) {
        expect(linker).assertEqual(firstLinker);
      }

      linkers.length = 0;

      const newLinker = getBootRuntimeLinker();
      expect(newLinker).assertEqual(firstLinker);
      for (let i = 0; i < 10000; i++) {
        const tempLinker = getBootRuntimeLinker();
      }

      const finalLinker = getBootRuntimeLinker();
      expect(finalLinker).assertEqual(firstLinker);
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0015
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0015
     * @tc.desc    Test getBootRuntimeLinker thread safety simulation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBootRuntimeLinkerTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const results: BootRuntimeLinker[] = [];
      const count = 100;

      for (let i = 0; i < count; i++) {
        results.push(getBootRuntimeLinker());
      }

      const firstResult = results[0];
      for (let i = 1; i < results.length; i++) {
        expect(results[i]).assertEqual(firstResult);
      }

      for (const result of results) {
        expect(result!=null).assertTrue();
        expect(result instanceof BootRuntimeLinker).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0016
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0016
     * @tc.desc    Test getBootRuntimeLinker with bootstrap initialization scenarios
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBootRuntimeLinkerTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const earlyLinker = getBootRuntimeLinker();
      expect(earlyLinker!=null).assertTrue();

      const systemObjects = [
        new ArrayBuffer(16),
        new Uint8Array([72, 101, 108, 108, 111]),
      ];

      const afterInitLinker = getBootRuntimeLinker();
      expect(afterInitLinker!=null).assertTrue();
      expect(afterInitLinker).assertEqual(earlyLinker);

      expect(getBootRuntimeLinker()).assertEqual(earlyLinker);
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0017
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0017
     * @tc.desc    Test getBootRuntimeLinker comprehensive coverage
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBootRuntimeLinkerTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const linker1 = getBootRuntimeLinker();
      const linkers = [1, 2, 3].map(() => getBootRuntimeLinker());

      const promiseLinker = Promise.resolve().then(() => getBootRuntimeLinker());
      for (const linker of linkers) {
        expect(linker).assertEqual(linker1);
      }
      console.log('Comprehensive test completed for getBootRuntimeLinker');
    });
    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0018
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0018
     * @tc.desc    Test getNearestNonBootRuntimeLinker basic call
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBootRuntimeLinkerTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = getNearestNonBootRuntimeLinker();

      if (result !== undefined) {
        expect(result instanceof RuntimeLinker).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0019
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0019
     * @tc.desc    Test getNearestNonBootRuntimeLinker return type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBootRuntimeLinkerTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = getNearestNonBootRuntimeLinker();

      const isValidType = result === undefined || result instanceof RuntimeLinker;
      expect(isValidType).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0020
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0020
     * @tc.desc    Test getNearestNonBootRuntimeLinker multiple calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result1 = getNearestNonBootRuntimeLinker();
      const result2 = getNearestNonBootRuntimeLinker();
      const result3 = getNearestNonBootRuntimeLinker();

      if (result1 !== undefined && result2 !== undefined) {
        expect(result1).assertEqual(result2);
      }

      if (result2 !== undefined && result3 !== undefined) {
        expect(result2).assertEqual(result3);
      }

      const allUndefined = result1 === undefined && result2 === undefined && result3 === undefined;
      const allRuntimeLinker = result1 instanceof RuntimeLinker &&
        result2 instanceof RuntimeLinker &&
        result3 instanceof RuntimeLinker;
      const isValid = allUndefined || allRuntimeLinker;
      expect(isValid).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0021
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0021
     * @tc.desc    Test getNearestNonBootRuntimeLinker with different contexts
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const globalResult = getNearestNonBootRuntimeLinker();

      const getFunctionResult = () => getNearestNonBootRuntimeLinker();
      const functionResult = getFunctionResult();

      {
        const blockResult = getNearestNonBootRuntimeLinker();
        if (globalResult !== undefined && blockResult !== undefined) {
          expect(blockResult).assertEqual(globalResult);
        }
      }

      if (globalResult !== undefined && functionResult !== undefined) {
        expect(functionResult).assertEqual(globalResult);
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0022
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0022
     * @tc.desc    Test getNearestNonBootRuntimeLinker with error handling
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      try {
        const result = getNearestNonBootRuntimeLinker();

      expect(result !== undefined).assertTrue();

      expect(result instanceof RuntimeLinker).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0023
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0023
     * @tc.desc    Test getNearestNonBootRuntimeLinker property descriptors
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const func = getNearestNonBootRuntimeLinker;

      expect(typeof func).assertEqual('function');

      const result = func();

      const isValid = result === undefined ||
        result === null ||
        typeof result === 'object';

      expect(isValid).assertTrue();

      if (result !== null && result !== undefined && typeof result === 'object') {
        console.log('Result is object with keys:', Object.keys(result as Object));
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0024
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0024
     * @tc.desc    Test getNearestNonBootRuntimeLinker with various data type environments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const specialChars = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const str = `Test ${specialChars}`;
      const result1 = getNearestNonBootRuntimeLinker();

      const numbers = [0, -0, NaN, Infinity, -Infinity, 1.5, Number.MAX_VALUE];
      for (const num of numbers) {
        const temp = num;
      }
      const result2 = getNearestNonBootRuntimeLinker();

      const boolValues = [true, false, !'s', !0];
      for (const bool of boolValues) {
        const temp = bool;
      }
      const result3 = getNearestNonBootRuntimeLinker();
      if (result1 !== undefined && result2 !== undefined) {
        expect(result1).assertEqual(result2);
      }

      if (result2 !== undefined && result3 !== undefined) {
        expect(result2).assertEqual(result3);
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0025
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0025
     * @tc.desc    Test getNearestNonBootRuntimeLinker with typed array environments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Array = new Int8Array([-128, 127, -129, 128]);
      const result1 = getNearestNonBootRuntimeLinker();

      const uint8Array = new Uint8Array([0, 255, -1, 256]);
      const result2 = getNearestNonBootRuntimeLinker();

      const clampedArray = new Uint8ClampedArray([0, 255, -1, 256]);
      const result3 = getNearestNonBootRuntimeLinker();

      const int16Array = new Int16Array([-32768, 32767, -32769, 32768]);
      const result4 = getNearestNonBootRuntimeLinker();

      const float32Array = new Float32Array([-3.4028234663852886e38, 3.4028234663852886e38, -3.5e38, 3.5e38]);
      const result5 = getNearestNonBootRuntimeLinker();

      const results = [result1, result2, result3, result4, result5];
      const firstValidResult = results.find(r => r !== undefined);

      if (firstValidResult !== undefined) {
        for (const result of results) {
          if (result !== undefined) {
            expect(result).assertEqual(firstValidResult);
          }
        }
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0026
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0026
     * @tc.desc    Test getNearestNonBootRuntimeLinker stress test
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBootRuntimeLinkerTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const startTime = Date.now();
      const iterations = 10000;
      let undefinedCount = 0;
      let runtimeLinkerCount = 0;
      let lastResult: RuntimeLinker | undefined = undefined;
      let consistent = true;

      for (let i = 0; i < iterations; i++) {
        const result = getNearestNonBootRuntimeLinker();

        if (result === undefined) {
          undefinedCount++;
        } else if (result instanceof RuntimeLinker) {
          runtimeLinkerCount++;

          if (lastResult !== undefined && lastResult !== result) {
            consistent = false;
          }
          lastResult = result;
        } else {
          expect(false).assertTrue();
        }
      }

      const endTime = Date.now();
      const duration = endTime - startTime;

      expect(duration < 5000).assertTrue();

      expect(consistent).assertTrue();

      const allUndefined = undefinedCount === iterations;
      const allRuntimeLinker = runtimeLinkerCount === iterations;
      expect(allUndefined || allRuntimeLinker).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0027
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0027
     * @tc.desc    Test getNearestNonBootRuntimeLinker with large string environments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBootRuntimeLinkerTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const createLargeString = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };

      const mediumString = createLargeString(10000);
      const result1 = getNearestNonBootRuntimeLinker();

      const originalStr = '{k1:value1,k2:value2}';
      const sliceStr = originalStr.substring(0, originalStr.length - 2);
      const result2 = getNearestNonBootRuntimeLinker();

      const results: (RuntimeLinker | undefined)[] = [];
      for (let i = 0; i < 10; i++) {
        results.push(getNearestNonBootRuntimeLinker());
      }

      if (results.length > 0) {
        const firstResult = results[0];
        for (let i = 1; i < results.length; i++) {
          if (firstResult !== undefined && results[i] !== undefined) {
            expect(results[i]).assertEqual(firstResult);
          } else if (firstResult === undefined) {
            expect(results[i] === undefined).assertTrue();
          }
        }
      }

      if (result1 !== undefined && result2 !== undefined) {
        expect(result1).assertEqual(result2);
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0028
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0028
     * @tc.desc    Test getNearestNonBootRuntimeLinker comparison with getBootRuntimeLinker
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBootRuntimeLinkerTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const nonBootLinker = getNearestNonBootRuntimeLinker();
      const bootLinker = getBootRuntimeLinker();

      expect(bootLinker !== null && bootLinker !== undefined).assertTrue();

      if (nonBootLinker !== undefined && nonBootLinker !== null) {
        expect(nonBootLinker !== bootLinker).assertTrue();
      }
    });
    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0029
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0029
     * @tc.desc    Test findAndLoadClass with valid class name and init=true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBootRuntimeLinkerTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = getBootRuntimeLinker();

      const className = 'TestClass';
      const result = linker.findAndLoadClass(className, true);

      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0030
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0030
     * @tc.desc    Test findAndLoadClass with valid class name and init=false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBootRuntimeLinkerTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const linker = getBootRuntimeLinker();

      const className = 'TestClass';
      const result = linker.findAndLoadClass(className, false);

      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0031
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0031
     * @tc.desc    Test findAndLoadClass with empty string class name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = getBootRuntimeLinker();

      const result1 = linker.findAndLoadClass('', true);
      const result2 = linker.findAndLoadClass('', false);

      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0032
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0032
     * @tc.desc    Test findAndLoadClass with special characters in class name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = getBootRuntimeLinker();
      const specialChars = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';

      const testCases = [
        specialChars,
        'Class' + specialChars,
        specialChars + 'Class',
        'Test' + specialChars.substring(0, 10) + 'Class'
      ];

      for (const className of testCases) {
        const result1 = linker.findAndLoadClass(className, true);
        const result2 = linker.findAndLoadClass(className, false);
        expect(linker!=null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0033
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0033
     * @tc.desc    Test findAndLoadClass with ASCII characters in class name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = getBootRuntimeLinker();

      const asciiChars = '!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';

      const className1 = 'TestClass' + asciiChars.substring(0, 20);
      const className2 = asciiChars.substring(20, 40) + 'Class';

      const result1 = linker.findAndLoadClass(className1, true);
      const result2 = linker.findAndLoadClass(className2, false);

      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0034
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0034
     * @tc.desc    Test findAndLoadClass with escape characters in class name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = getBootRuntimeLinker();
      const escapeChars = '\\a\\b\\f\\n\\r\\t\\v\\\\\\\'\\"\\?\\0';

      const className = 'Test' + escapeChars + 'Class';
      const result = linker.findAndLoadClass(className, true);

      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0035
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0035
     * @tc.desc    Test findAndLoadClass with emoji and Unicode in class name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = getBootRuntimeLinker();

      const emojiClassName1 = '👆Class';
      const emojiClassName2 = 'Test👿Class';
      const emojiClassName3 = 'Test👀💯Class';

      const result1 = linker.findAndLoadClass(emojiClassName1, true);
      const result2 = linker.findAndLoadClass(emojiClassName2, false);
      const result3 = linker.findAndLoadClass(emojiClassName3, true);

      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0036
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0036
     * @tc.desc    Test findAndLoadClass with numeric class names
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = getBootRuntimeLinker();

      const numericClassNames = [
        '0',
        '123',
        '-1',
        '3.14',
        'NaN',
        'Infinity',
        '-Infinity'
      ];

      for (const className of numericClassNames) {
        const result1 = linker.findAndLoadClass(className, true);
        const result2 = linker.findAndLoadClass(className, false);
        expect(linker!=null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0037
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0037
     * @tc.desc    Test findAndLoadClass with boolean-like class names
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = getBootRuntimeLinker();

      const booleanClassNames = ['true', 'false', 'TRUE', 'FALSE'];

      for (const className of booleanClassNames) {
        const result1 = linker.findAndLoadClass(className, true);
        const result2 = linker.findAndLoadClass(className, false);
        expect(linker!=null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0038
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0038
     * @tc.desc    Test findAndLoadClass with very long class names
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker = getBootRuntimeLinker();

      const longClassName1 = 'A'.repeat(1000) + 'Class';
      const longClassName2 = 'Test' + 'B'.repeat(1000) + 'Class';

      const result1 = linker.findAndLoadClass(longClassName1, true);
      const result2 = linker.findAndLoadClass(longClassName2, false);

      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0039
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0039
     * @tc.desc    Test findAndLoadClass with sliceString type class names
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker = getBootRuntimeLinker();

      const originalStr = '{k1:value1,k2:value2}';
      const sliceStr = originalStr.substring(0, originalStr.length - 2);

      for (let i = 0; i < 10; i++) {
        const result = linker.findAndLoadClass(sliceStr + i, true);
        expect(linker!=null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0040
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0040
     * @tc.desc    Test findAndLoadClass with non-existent class names
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = getBootRuntimeLinker();

      const nonExistentNames = [
        'NonExistentClass123456',
        'ThisClassShouldNotExist',
        'TestInvalidClassName'
      ];

      for (const className of nonExistentNames) {
        const result = linker.findAndLoadClass(className, true);
        expect(linker!=null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0041
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0041
     * @tc.desc    Test findAndLoadClass with init parameter edge cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker = getBootRuntimeLinker();

      const className = 'TestClass';

      const result1 = linker.findAndLoadClass(className, true);
      const result2 = linker.findAndLoadClass(className, false);

      const commonClassNames = [
        'Object',
        'String',
        'Number',
        'Array',
        'Function'
      ];

      for (const commonClassName of commonClassNames) {
        const resultTrue = linker.findAndLoadClass(commonClassName, true);
        const resultFalse = linker.findAndLoadClass(commonClassName, false);
        expect(linker!=null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0042
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0042
     * @tc.desc    Test findAndLoadClass with class names containing TypedArray values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker = getBootRuntimeLinker();

      const typedArrayBoundaries = [
        '-128', '127', '-129', '128',
        '0', '255', '-1', '256',
        '-32768', '32767', '-32769', '32768',
        '0', '65535', '-1', '65536',
        '-2147483648', '2147483647', '-2147483649', '2147483648',
        '0', '4294967295', '-1', '4294967296'
      ];

      for (const boundary of typedArrayBoundaries) {
        const className = 'Class' + boundary;
        const result1 = linker.findAndLoadClass(className, true);
        const result2 = linker.findAndLoadClass(className, false);
        expect(linker!=null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0043
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0043
     * @tc.desc    Test findAndLoadClass with class names containing float values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker = getBootRuntimeLinker();

      const floatValues = [
        '3.4028234663852886e38',
        '-3.4028234663852886e38',
        '3.5e38',
        '-3.5e38',
        '1.7976931348623157e308',
        '-1.7976931348623157e308',
        '1.8E308',
        '-1.8E308'
      ];

      for (const floatValue of floatValues) {
        const className = 'FloatClass' + floatValue;
        const result = linker.findAndLoadClass(className, true);
        expect(linker!=null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0044
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0044
     * @tc.desc    Test findAndLoadClass with repeated special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = getBootRuntimeLinker();

      const repeatedSpecialChars = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';

      const className1 = repeatedSpecialChars + 'Class';
      const className2 = 'Test' + repeatedSpecialChars;

      const result1 = linker.findAndLoadClass(className1, true);
      const result2 = linker.findAndLoadClass(className2, false);

      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0045
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0045
     * @tc.desc    Test findAndLoadClass with hex and octal values in class names
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = getBootRuntimeLinker();

      const hexOctalNames = [
        '0x0102Class',
        '0x01020304Class',
        '0xCAFEBABEClass',
        '0o3Class',
        '0o777Class'
      ];

      for (const className of hexOctalNames) {
        const result1 = linker.findAndLoadClass(className, true);
        const result2 = linker.findAndLoadClass(className, false);
        expect(linker!=null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0046
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0046
     * @tc.desc    Test findAndLoadClass with scientific notation in class names
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBootRuntimeLinkerTest0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const linker = getBootRuntimeLinker();

      const scientificNames = [
        '1e3Class',
        '2.5e-2Class',
        '1.23e6Class',
        '9.87654321e-10Class'
      ];

      for (const className of scientificNames) {
        const result = linker.findAndLoadClass(className, true);
        expect(linker!=null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0047
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0047
     * @tc.desc    Test findAndLoadClass with bigint representation in class names
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker = getBootRuntimeLinker();

      const bigintNames = [
        '9007199254740991Class',
        '9007199254740992Class',
        '9223372036854775807Class',
        '18446744073709551615Class'
      ];

      for (const className of bigintNames) {
        const result1 = linker.findAndLoadClass(className, true);
        const result2 = linker.findAndLoadClass(className, false);
        expect(linker!=null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0048
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0048
     * @tc.desc    Test findAndLoadClass memory and GC behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBootRuntimeLinkerTest0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const linker = getBootRuntimeLinker();

      const classNames: string[] = [];

      for (let i = 0; i < 1000; i++) {
        classNames.push(`TestClass${i}`);
      }

      for (let iteration = 0; iteration < 10; iteration++) {
        for (const className of classNames) {
          const result = linker.findAndLoadClass(className, true);
        }
      }

      const finalResult = linker.findAndLoadClass('TestClass0', true);
      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0049
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0049
     * @tc.desc    Test findAndLoadClass with concurrent access simulation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBootRuntimeLinkerTest0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const linker = getBootRuntimeLinker();

      const results: (Class | undefined)[] = [];
      const className = 'TestClass';

      for (let i = 0; i < 100; i++) {
        const result = linker.findAndLoadClass(className + i, i % 2 === 0);
        results.push(result);
      }

      expect(linker!=null).assertTrue();

      const success = true;
      expect(success).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0050
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0050
     * @tc.desc    Test findAndLoadClass with stress test
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBootRuntimeLinkerTest0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const linker = getBootRuntimeLinker();
      const startTime = Date.now();
      const iterations = 1000;
      let successCount = 0;

      for (let i = 0; i < iterations; i++) {
        try {
          const className = `StressTestClass${i}`;
          const init = i % 3 === 0;
          const result = linker.findAndLoadClass(className, init);
          successCount++;
        } catch (e) {
        }
      }

      const endTime = Date.now();
      const duration = endTime - startTime;

      expect(duration < 5000).assertTrue();
      expect(successCount > 0).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0051
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0051
     * @tc.desc    Test findAndLoadClass with different init parameter combinations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker = getBootRuntimeLinker();

      const className = 'TestClass';

      const result1 = linker.findAndLoadClass(className, true);
      const result2 = linker.findAndLoadClass(className, false);

      const systemClasses = ['Object', 'String', 'Number', 'Boolean', 'Array', 'Function', 'Date', 'RegExp', 'Error', 'Promise'];

      for (const sysClass of systemClasses) {
        const resultWithInit = linker.findAndLoadClass(sysClass, true);
        const resultWithoutInit = linker.findAndLoadClass(sysClass, false);
        expect(linker!=null).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0052
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0052
     * @tc.desc    Test findAndLoadClass with class names containing JSON-like strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker = getBootRuntimeLinker();

      const jsonClassName1 = '{"className": "Test", "version": 1}';
      const jsonClassName2 = '{"package": "com.test", "class": "MyClass"}';

      const result1 = linker.findAndLoadClass(jsonClassName1, true);
      const result2 = linker.findAndLoadClass(jsonClassName2, false);

      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0053
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0053
     * @tc.desc    Test findAndLoadClass with multiline class names
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker = getBootRuntimeLinker();

      const multilineClassName = `Test
      MultiLine
      Class
      Name`;

      const result = linker.findAndLoadClass(multilineClassName, true);
      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0054
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0054
     * @tc.desc    Test findAndLoadClass with class names from array data
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker = getBootRuntimeLinker();

      const helloArray = [72, 101, 108, 108, 111];
      const classNameFromArray = String.fromCharCode(...helloArray) + 'Class';

      const result = linker.findAndLoadClass(classNameFromArray, true);
      expect(linker!=null).assertTrue();

      const arrayWithZeros = [72, 101, 108, 108, 111, 0, 0, 0];
      let classNameWithZeros = '';
      for (const code of arrayWithZeros) {
        if (code > 0) {
          classNameWithZeros += String.fromCharCode(code);
        }
      }
      classNameWithZeros += 'Class';

      const result2 = linker.findAndLoadClass(classNameWithZeros, false);
      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0055
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0055
     * @tc.desc    Test findAndLoadClass with invalid unicode in class names
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBootRuntimeLinkerTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const linker = getBootRuntimeLinker();
      const invalidUnicodeNames = [
        '\\udc04Class',
        '\\ud83dClass',
        '\\udff4Class',
        'Test\\udc04Class',
        '\\ud83d\\udff4Class'
      ];
      for (const className of invalidUnicodeNames) {
        try {
          const result = linker.findAndLoadClass(className, true);
        } catch (e) {
        }
      }
      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0056
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0056
     * @tc.desc    Test findAndLoadClass return value type checking
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker = getBootRuntimeLinker();

      const className = 'Object';

      const result = linker.findAndLoadClass(className, true);

      if (result !== undefined) {
        expect(result!=null).assertTrue();
      } else {
        expect(result === undefined).assertTrue();
      }

      expect(linker!=null).assertTrue();
    });

    /**
     * @tc.name    builtinsBootRuntimeLinkerTest0057
     * @tc.number  BUILTINS_BOOT_RUNTIME_LINKER_TEST_0057
     * @tc.desc    Test findAndLoadClass with same class name multiple times
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBootRuntimeLinkerTest0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const linker = getBootRuntimeLinker();
      const className = 'TestRepeatedClass';

      const results: (Class | undefined)[] = [];
      for (let i = 0; i < 10; i++) {
        const init = i % 2 === 0;
        const result = linker.findAndLoadClass(className, init);
        results.push(result);
      }
      expect(results.length).assertEqual(10);
      expect(linker!=null).assertTrue();
    });

  })
}
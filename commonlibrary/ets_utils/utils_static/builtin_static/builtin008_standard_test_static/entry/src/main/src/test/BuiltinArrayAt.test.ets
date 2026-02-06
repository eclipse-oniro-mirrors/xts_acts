/**
 * Copyright (c) 2025-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function BuiltinArrayAtTest() {
  describe("BuiltinArrayAtTest", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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

    console.log(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0001
     * @tc.name     testBuiltinArrayAt0001
     * @tc.desc     Test at() with a valid positive index.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0001";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, 1);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_200
     * @tc.name     testBuiltinArrayAt0002
     * @tc.desc     Test at() with a valid negative index.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0002";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, -1);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0600_01
     * @tc.name     testBuiltinArrayAt0006
     * @tc.desc     Test at() with index 0 on a single-element array.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0006";
      try {
        let arr: FixedArray<boolean> = [true];
        let result = at(arr, 0);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0700_01
     * @tc.name     testBuiltinArrayAt0007
     * @tc.desc     Test at() with index -1 on a single-element array.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0007";
      try {
        let arr: FixedArray<boolean> = [true];
        let result = at(arr, -1);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1000_1
     * @tc.name     testBuiltinArrayAt00010
     * @tc.desc     Test at() with index -0 (treated as 0).
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt00010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt00010";
      try {
        let arr: FixedArray<boolean> = [false, true];
        let result = at(arr, -0);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1100_01
     * @tc.name     testBuiltinArrayAt00011
     * @tc.desc     Test at() with a large positive index within bounds.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt00011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt00011";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true];
        let result = at(arr, 4);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1200_01
     * @tc.name     testBuiltinArrayAt00012
     * @tc.desc     Test at() with a large negative index within bounds.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt00012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt00012";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true];
        let result = at(arr, -3);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1400_01
     * @tc.name     testBuiltinArrayAt00014
     * @tc.desc     Test at() with index equals to negative length (out-of-bound).
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt00014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt00014";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, -3);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0100_01
     * @tc.name     testBuiltinArrayAt10001_01
     * @tc.desc     Test at() with positive index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt10001_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt10001_01";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, 1);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0200_01
     * @tc.name     testBuiltinArrayAt10002_01
     * @tc.desc     Test at() with negative index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt10002_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt10002_01";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, -1);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_400
     * @tc.name     testBuiltinArrayAt10004_01
     * @tc.desc     Test at() with boundary conditions
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt10004_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt10004_01";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let first = at(arr, 0);
        let last = at(arr, -1);
        expect(first).assertEqual(true);
        expect(last).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_1100
     * @tc.name     testBuiltinArrayAt10011
     * @tc.desc     Test at() with non-primitive value (Boolean object wrapper)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayAt10011';
      try {
        const arr: Boolean[] = [new Boolean(true), new Boolean(false)];
        expect(arr.at(0)?.valueOf()).assertTrue();
        expect(arr.at(-1)?.valueOf()).assertFalse();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_0100
     * @tc.name     testBuiltinArrayAt20001
     * @tc.desc     Test basic functionality of at() with positive index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20001";
      try {
        let arr: FixedArray<byte> = [10, 20, 30, 40];
        let result = at(arr, 2);
        expect(result).assertEqual(30);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_0200
     * @tc.name     testBuiltinArrayAt20002
     * @tc.desc     Test at() with negative index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20002";
      try {
        let arr: FixedArray<byte> = [10, 20, 30, 40];
        let result = at(arr, -1);
        expect(result).assertEqual(40);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_0400
     * @tc.name     testBuiltinArrayAt20004
     * @tc.desc     Test at() with edge case indices
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20004";
      try {
        let arr: FixedArray<byte> = [10, 20];
        expect(at(arr, 0)).assertEqual(10);
        expect(at(arr, -1)).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_1200
     * @tc.name     testBuiltinArrayAt20012
     * @tc.desc     Verify at() handles concurrent use across multiple arrays
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20012";
      try {
        let a1: FixedArray<byte> = [10, 20];
        let a2: FixedArray<byte> = [30, 40, 50];
        expect(at(a1, 1)).assertEqual(20);
        expect(at(a2, -1)).assertEqual(50);
        expect(at(a1, -2)).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_1300
     * @tc.name     testBuiltinArrayAt20013
     * @tc.desc     Verify at() with positive index on single-element array
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20013";
      try {
        let arr: FixedArray<byte> = [42];
        expect(at(arr, 0)).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_1400
     * @tc.name     testBuiltinArrayAt20014
     * @tc.desc     Verify at() with negative index on single-element array
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20014";
      try {
        let arr: FixedArray<byte> = [42];
        expect(at(arr, -1)).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0100_01
     * @tc.name     testBuiltinArrayAt30001
     * @tc.desc     Test at() with valid positive index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt30001";
      try {
        let arr: FixedArray<byte> = [10, 50, 100];
        let result = at(arr, 1);
        expect(result).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_020
     * @tc.name     testBuiltinArrayAt30002
     * @tc.desc     Test at() with valid negative index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt30002";
      try {
        let arr: FixedArray<byte> = [10, 50, 100];
        let result = at(arr, -1);
        expect(result).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0400_01
     * @tc.name     testBuiltinArrayAt30004
     * @tc.desc     Test at() with edge cases (first and last elements)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt30004";
      try {
        let arr: FixedArray<byte> = [10, 50, 100];
        expect(at(arr, 0)).assertEqual(10);
        expect(at(arr, -3)).assertEqual(10);
        expect(at(arr, 2)).assertEqual(100);
        expect(at(arr, -1)).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_800
	* @tc.name     testBuiltinArrayAt30008
	* @tc.desc     Test at() with +0 and -0 indices
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt30008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt30008";
		try {
		let arr: FixedArray<byte> = [10, 50, 100];
		expect(at(arr, +0)).assertEqual(10);
		expect(at(arr, -0)).assertEqual(10);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1300_02
	* @tc.name     testBuiltinArrayAt30013
	* @tc.desc     Test at() with concurrent-like read (read-only stability)
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt30013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt30013";
		try {
		let arr: FixedArray<byte> = [1, 2, 3, 4, 5];
		for (let i = 0; i < 10; i++) {
			expect(at(arr, -2)).assertEqual(4);
		}
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0100_03
	* @tc.name     testBuiltinArrayAt50001
	* @tc.desc     Testing at() with positive index.
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt50001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt50001";
		try {
		let arr: FixedArray<number> = [1, 2, 3];
		let result = at(arr, 1);
		expect(result).assertEqual(2);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0200_02
	* @tc.name     testBuiltinArrayAt50002
	* @tc.desc     Testing at() with negative index.
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt50002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt50002";
		try {
		let arr: FixedArray<number> = [1, 2, 3];
		let result = at(arr, -1);
		expect(result).assertEqual(3);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0100_04
	* @tc.name     testBuiltinArrayAt60001
	* @tc.desc     Testing at() with valid positive index
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt60001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt60001";
		try {
		let arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
		let result = at(arr, 2);
		expect(result).assertEqual(3.3);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0200_03
	* @tc.name     testBuiltinArrayAt60002
	* @tc.desc     Testing at() with valid negative index
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt60002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt60002";
		try {
		let arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
		let result = at(arr, -1);
		expect(result).assertEqual(4.4);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_FIXEDARRAY_AT_0100
	* @tc.name     testBuiltinArrayAt70001
	* @tc.desc     Testing at() with positive index.
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt70001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt70001";
		try {
		let arr: FixedArray<double> = [1.1, 2.2, 3.3];
		let result = at(arr, 1);
		expect(result).assertEqual(2.2);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_FIXEDARRAY_AT_0200
	* @tc.name     testBuiltinArrayAt70002
	* @tc.desc     Testing at() with negative index.
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt70002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt70002";
		try {
		let arr: FixedArray<double> = [1.1, 2.2, 3.3];
		let result = at(arr, -1);
		expect(result).assertEqual(3.3);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0100_02
	* @tc.name     testBuiltinArrayAt80001
	* @tc.desc     Test at() with positive index
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt80001";
		try {
		let arr: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
		let result = at(arr, 4);
		expect(result).assertEqual(5.5);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0200_02
	* @tc.name     testBuiltinArrayAt80002
	* @tc.desc     Test at() with negative index
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt80002";
		try {
		let arr: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
		let result = at(arr, -1);
		expect(result).assertEqual(5.5);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0100_03
	* @tc.name     testBuiltinArrayAt90001
	* @tc.desc     Test at() with positive index
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt90001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt90001";
		try {
		let arr: FixedArray<float> = [5.1f, 5.2f, 5.0f, 5.4f, 5.5f];
		let result = at(arr, 2);
		expect(result).assertEqual(5.0f);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0200_03
	* @tc.name     testBuiltinArrayAt90002
	* @tc.desc     Test at() with negative index
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt90002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt90002";
		try {
		let arr: FixedArray<float> = [5.1f, 5.2f, 5.3f, 5.4f, 5.5f];
		let result = at(arr, -1);
		expect(result).assertEqual(5.5f);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0100_04
	* @tc.name     testBuiltinArrayAt10001
	* @tc.desc     Test at() with valid positive index
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt10001";
		try {
		let arr: FixedArray<int> = [10, 20, 30, 40];
		let result = at(arr, 1);
		expect(result).assertEqual(20);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0200_04
	* @tc.name     testBuiltinArrayAt10002
	* @tc.desc     Test at() with valid negative index
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt10002";
		try {
		let arr: FixedArray<int> = [10, 20, 30, 40];
		let result = at(arr, -1);
		expect(result).assertEqual(40);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0500
	* @tc.name     testBuiltinArrayAt10005
	* @tc.desc     Test at() with zero index
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt10005";
		try {
		let arr: FixedArray<int> = [10, 20, 30, 40];
		let result = at(arr, 0);
		expect(result).assertEqual(10);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0100_05
	* @tc.name     testBuiltinArrayAt110001
	* @tc.desc     Test `at()` with a valid positive index.
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt110001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt110001";
		try {
		let arr: FixedArray<int> = [10, 20, 30, 40];
		let result = at(arr, 1);
		expect(result).assertEqual(20);
		} catch (err) {
		console.error(`${TAG} is fail, err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0200_04
	* @tc.name     testBuiltinArrayAt110002
	* @tc.desc     Test `at()` with a valid negative index.
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt110002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt110002";
		try {
		let arr: FixedArray<int> = [10, 20, 30, 40];
		let result = at(arr, -1);
		expect(result).assertEqual(40);
		} catch (err) {
		console.error(`${TAG} is fail, err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_ARRAY_AT_0100
	* @tc.name     testBuiltinArrayAt120001
	* @tc.desc     Testing at() with positive index.
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt120001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt120001";
		try {
		let arr: FixedArray<long> = [10, 20, 30, 40];
		let result = at(arr, 1);
		expect(result).assertEqual(20);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_ARRAY_AT_0200
	* @tc.name     testBuiltinArrayAt120002
	* @tc.desc     Testing at() with negative index.
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt120002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt120002";
		try {
		let arr: FixedArray<long> = [10, 20, 30, 40];
		let result = at(arr, -1);
		expect(result).assertEqual(40);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0100_05
	* @tc.name     testBuiltinArrayAt130001
	* @tc.desc     Test at() with positive index
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt130001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt130001";
		try {
		let arr: FixedArray<long> = [100, 200, 300];
		let result = at(arr, 1);
		expect(result).assertEqual(200);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0200_05
	* @tc.name     testBuiltinArrayAt130002
	* @tc.desc     Test at() with negative index
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt130002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt130002";
		try {
		let arr: FixedArray<long> = [100, 200, 300];
		let result = at(arr, -1);
		expect(result).assertEqual(300);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0100_06
	* @tc.name     testBuiltinArrayAt140001
	* @tc.desc     Testing at() with positive index.
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt140001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt140001";
		try {
		let arr: FixedArray<short> = [10, 20, 30, 40];
		let result = at(arr, 1);
		expect(result).assertEqual(20);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0200_05
	* @tc.name     testBuiltinArrayAt140002
	* @tc.desc     Testing at() with negative index.
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt140002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt140002";
		try {
		let arr: FixedArray<short> = [10, 20, 30, 40];
		let result = at(arr, -1);
		expect(result).assertEqual(40);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0400_07
	* @tc.name     testBuiltinArrayAt140004
	* @tc.desc     Testing at() with boundary index values.
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt140004";
		try {
		let arr: FixedArray<short> = [10, 20, 30, 40];
		let first = at(arr, 0);
		let last = at(arr, -1);
		let justBeforeFirst = at(arr, -4);
		let justAfterLast = at(arr, 3);
		expect(first).assertEqual(10);
		expect(last).assertEqual(40);
		expect(justBeforeFirst).assertEqual(10);
		expect(justAfterLast).assertEqual(40);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0100_07
	* @tc.name     testBuiltinArrayAt150001
	* @tc.desc     Testing at() with valid positive index
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt150001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt150001";
		try {
		let arr: FixedArray<short> = [10, 20, 30, 40, 50];
		let result = at(arr, 2);
		expect(result).assertEqual(30);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
	/**
	* @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0200
	* @tc.name     testBuiltinArrayAt150002
	* @tc.desc     Testing at() with valid negative index
	* @tc.level    LEVEL1
	* @tc.size     MEDIUMTEST
	* @tc.type     FUNCTION
	*/
	it('testBuiltinArrayAt150002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayAt150002";
		try {
		let arr: FixedArray<short> = [10, 20, 30, 40, 50];
		let result = at(arr, -2);
		expect(result).assertEqual(40);
		} catch (err) {
		console.error(`${TAG} is fail,err is ${err}`);
		expect().assertFail();
		}
	});
	
		/**
		* @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0100_-2
		* @tc.name    testBuiltinArrayconcat0001
		* @tc.desc    Testing basic concatenation of two boolean arrays
		* @tc.level   LEVEL1
		* @tc.size    MEDIUMTEST
		* @tc.type    FUNCTION
		*/
		it('testBuiltinArrayconcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
		let TAG = "testBuiltinArrayconcat0001";
		try {
			let arr1: FixedArray<boolean> = [true, false];
			let arr2: FixedArray<boolean> = [false, true];
			let result = concat(arr1, arr2);
			expect(result.length).assertEqual(4);
			expect(result[0]).assertEqual(true);
			expect(result[1]).assertEqual(false);
			expect(result[2]).assertEqual(false);
			expect(result[3]).assertEqual(true);
		} catch (err) {
			console.error(`${TAG} is fail,err is ${err}`);
			expect().assertFail();
		}
		});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_14500
     * @tc.name   testBuiltinArrayAt0145
     * @tc.desc   Testing at() with single-element array.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0145";
      try {
        let arr: FixedArray<number> = [5];
        let result = at(arr, 0);
        expect(Number(result)).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_14600
     * @tc.name   testBuiltinArrayAt0146
     * @tc.desc   Testing at() with index 0 on single-element array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0146";
      try {
        let arr: FixedArray<double> = [9.9];
        let result = at(arr, 0);
        expect(result).assertEqual(9.9);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_14700
     * @tc.name   testBuiltinArrayAt0147
     * @tc.desc   Testing at() with index -1 on single-element array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0147";
      try {
        let arr: FixedArray<double> = [9.9];
        let result = at(arr, -1);
        expect(result).assertEqual(9.9);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_15300
     * @tc.name   testBuiltinArrayAt0153
     * @tc.desc   Testing at() with index -0 (should behave like 0)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0153";
      try {
        let arr: FixedArray<double> = [42.0, 43.0];
        let result = at(arr, -0);
        expect(result).assertEqual(42.0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

  });
}
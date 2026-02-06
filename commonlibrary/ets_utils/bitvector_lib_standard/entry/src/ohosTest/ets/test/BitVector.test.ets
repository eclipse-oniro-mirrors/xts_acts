/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium";
import { collections, ArkTSUtils } from '@kit.ArkTS';

export default function BitVectorTest() {
  describe("BitVectorTest", () => {
    beforeAll(() => {
      console.log("beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.");
    });
    beforeEach(() => {
      console.log("beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.");
    });
    afterEach(() => {
      console.log("afterEach: Test case-level clearance conditions, which are executed after each test case is executed.");
    });
    afterAll(() => {
      console.log("afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed");
    });
    console.log("start################################start");
    /**
     * @tc.name   BitVector_constructor_Func_001
     * @tc.number BITVECTOR_TEST_001
     * @tc.desc   A constructor used to create a BitVector object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_constructor_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(10);
        expect(bitVector.length).assertEqual(10);
    });
    /**
     * @tc.name   BitVector_push_Func_001
     * @tc.number BITVECTOR_TEST_002
     * @tc.desc   Appends the bit element to the end of this bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_push_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(0);
        let res0 = bitVector.push(0);
        let res1 = bitVector.push(1);
        let res2 = bitVector.push(0);
        let res3 = bitVector.push(1);
        let res4 = bitVector.push(1);
        expect(res0).assertEqual(true);
        expect(res1).assertEqual(true);
        expect(res2).assertEqual(true);
        expect(res3).assertEqual(true);
        expect(res4).assertEqual(true);
        expect(bitVector.length).assertEqual(5);
    });
    /**
     * @tc.name   BitVector_push_Func_002
     * @tc.number BITVECTOR_TEST_003
     * @tc.desc   Appends the bit element to the end of this bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_push_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(64);
    });
    /**
     * @tc.name   BitVector_push_Func_003
     * @tc.number BITVECTOR_TEST_004
     * @tc.desc   Appends the bit element to the end of this bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_push_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
    });
    /**
     * @tc.name   BitVector_pop_Func_001
     * @tc.number BITVECTOR_TEST_005
     * @tc.desc   Retrieves and removes the bit element to the end of this bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_pop_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(1);
        let res0 = bitVector.pop();
        let res1 = bitVector.pop();
        let res2 = bitVector.pop();
        let res3 = bitVector.pop();
        let res4 = bitVector.pop();
        expect(res0).assertEqual(1);
        expect(res1).assertEqual(1);
        expect(res2).assertEqual(0);
        expect(res3).assertEqual(1);
        expect(res4).assertEqual(0);
        expect(bitVector.length).assertEqual(0);
    });
    /**
     * @tc.name   BitVector_pop_Func_002
     * @tc.number BITVECTOR_TEST_006
     * @tc.desc   Retrieves and removes the bit element to the end of this bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_pop_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(bitVectorLength);
        for (let i = 0; i < bitVectorLength; i++) {
          let res1 = bitVector.pop();
          expect(res1).assertEqual(0);
        }
        expect(bitVector.length).assertEqual(0);
    });
    /**
     * @tc.name   BitVector_pop_Func_003
     * @tc.number BITVECTOR_TEST_007
     * @tc.desc   Retrieves and removes the bit element to the end of this bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_pop_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        for (let i = 0; i < bitVectorLength; i++) {
          let res1 = bitVector.pop();
          expect(res1).assertEqual(0);
        }
        expect(bitVector.length).assertEqual(10);
    });
    /**
     * @tc.name   BitVector_has_Func_001
     * @tc.number BITVECTOR_TEST_008
     * @tc.desc   Check if bit vector contains a particular bit element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        let res0 = bitVector.has(1, 3, 6);
        expect(res0).assertEqual(true);
        let res1 = bitVector.has(1, 0, 2);
        expect(res1).assertEqual(false);
        let res2 = bitVector.has(0, 3, 5);
        expect(res2).assertEqual(false);
        let res3 = bitVector.has(0, 0, 3);
        expect(res3).assertEqual(true);
    });
    /**
     * @tc.name   BitVector_has_Func_002
     * @tc.number BITVECTOR_TEST_009
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.has(0, 8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_has_Func_003
     * @tc.number BITVECTOR_TEST_010
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.has(0, 0.1, 6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 0.1`);
        }
    });
    /**
     * @tc.name   BitVector_has_Func_004
     * @tc.number BITVECTOR_TEST_011
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.has(0, -3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_has_Func_005
     * @tc.number BITVECTOR_TEST_012
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.has(0, -3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_has_Func_006
     * @tc.number BITVECTOR_TEST_013
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(64);
        let res0 = bitVector.has(1, 0, 31);
        expect(res0).assertEqual(false);
        let res1 = bitVector.has(1, 32, 64);
        expect(res1).assertEqual(true);
        let res2 = bitVector.has(0, 0, 32);
        expect(res2).assertEqual(true);
        let res3 = bitVector.has(0, 32, 63);
        expect(res3).assertEqual(false);
    });
    /**
     * @tc.name   BitVector_has_Func_007
     * @tc.number BITVECTOR_TEST_014
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        let res0 = bitVector.has(1, 10, 41);
        expect(res0).assertEqual(false);
        let res1 = bitVector.has(1, 42, bitVectorLength + 10);
        expect(res1).assertEqual(true);
        let res2 = bitVector.has(0, 10, 42);
        expect(res2).assertEqual(true);
        let res3 = bitVector.has(0, 42, (bitVectorLength + 10) - 1);
        expect(res3).assertEqual(false);
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_001
     * @tc.number BITVECTOR_TEST_015
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.setBitsByRange(0, 1, 4);
        expect(bitVector[1]).assertEqual(0);
        expect(bitVector[2]).assertEqual(0);
        expect(bitVector[3]).assertEqual(0);
        bitVector.setBitsByRange(1, 1, 4);
        expect(bitVector[1]).assertEqual(1);
        expect(bitVector[2]).assertEqual(1);
        expect(bitVector[3]).assertEqual(1);
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_002
     * @tc.number BITVECTOR_TEST_016
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.setBitsByRange(0, 8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_003
     * @tc.number BITVECTOR_TEST_017
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.setBitsByRange(0, 0.1, 6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 0.1`);
        }
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_004
     * @tc.number BITVECTOR_TEST_018
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.setBitsByRange(0, -3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_005
     * @tc.number BITVECTOR_TEST_019
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.setBitsByRange(0, -3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_006
     * @tc.number BITVECTOR_TEST_020
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(64);
        bitVector.setBitsByRange(1, 0, 32);
        for (let i = 0; i < 32; i++) {
          expect(bitVector[i]).assertEqual(1);
        }
        bitVector.setBitsByRange(0, 32, 64);
        for (let i = 32; i < 64; i++) {
          expect(bitVector[i]).assertEqual(0);
        }
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_007
     * @tc.number BITVECTOR_TEST_021
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        bitVector.setBitsByRange(1, 10, 42);
        for (let i = 10; i < 42; i++) {
          expect(bitVector[i]).assertEqual(1);
        }
        bitVector.setBitsByRange(0, 42, 74);
        for (let i = 42; i < 74; i++) {
          expect(bitVector[i]).assertEqual(0);
        }
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_001
     * @tc.number BITVECTOR_TEST_022
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.getBitsByRange(0, 3);
        expect(bitVector[0]).assertEqual(1);
        expect(bitVector[1]).assertEqual(1);
        expect(bitVector[2]).assertEqual(0);
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_002
     * @tc.number BITVECTOR_TEST_023
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getBitsByRange(8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_003
     * @tc.number BITVECTOR_TEST_024
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getBitsByRange(0.1, 6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 0.1`);
        }
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_004
     * @tc.number BITVECTOR_TEST_025
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getBitsByRange(-3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_005
     * @tc.number BITVECTOR_TEST_026
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getBitsByRange(-3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_006
     * @tc.number BITVECTOR_TEST_027
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector_old = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector_old.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector_old.length).assertEqual(64);
        let bitVector_new: collections.BitVector = bitVector_old.getBitsByRange(0, 64);
        for (let i = 0; i < bitVectorLength; i++) {
          expect(bitVector_new[i]).assertEqual(0);
        }
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_007
     * @tc.number BITVECTOR_TEST_028
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector_old = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector_old.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector_old.length).assertEqual(bitVectorLength + 10);
        let bitVector_new: collections.BitVector = bitVector_old.getBitsByRange(0, bitVectorLength + 10);
        for (let i = 10; i < bitVectorLength + 10; i++) {
          expect(bitVector_new[i]).assertEqual(0);
        }
    });
    /**
     * @tc.name   BitVector_resize_Func_001
     * @tc.number BITVECTOR_TEST_029
     * @tc.desc   Resize the bitVector's length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_resize_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.resize(4);
        expect(bitVector.length).assertEqual(4);
    });
    /**
     * @tc.name   BitVector_resize_Func_002
     * @tc.number BITVECTOR_TEST_030
     * @tc.desc   Resize the bitVector's length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_resize_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.resize(5);
        expect(bitVector[0]).assertEqual(1);
        expect(bitVector[1]).assertEqual(1);
        expect(bitVector[2]).assertEqual(1);
        expect(bitVector[3]).assertEqual(1);
        expect(bitVector[4]).assertEqual(1);
    });
    /**
     * @tc.name   BitVector_resize_Func_003
     * @tc.number BITVECTOR_TEST_031
     * @tc.desc   Resize the bitVector's length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_resize_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.resize(10);
        expect(bitVector[5]).assertEqual(0);
        expect(bitVector[6]).assertEqual(0);
        expect(bitVector[7]).assertEqual(0);
        expect(bitVector[8]).assertEqual(0);
        expect(bitVector[9]).assertEqual(0);
    });
    /**
     * @tc.name   BitVector_resize_Func_004
     * @tc.number BITVECTOR_TEST_032
     * @tc.desc   Resize the bitVector's length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_resize_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          bitVector.resize(-4);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "length" is out of range. It must be >= 0. Received value is: -4`);
        }
    });
    /**
     * @tc.name   BitVector_resize_Func_005
     * @tc.number BITVECTOR_TEST_033
     * @tc.desc   Resize the bitVector's length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_resize_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          bitVector.resize(6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "size" must be integer. Received value is: 6.1`);
        }
    });
    /**
     * @tc.name   BitVector_resize_Func_006
     * @tc.number BITVECTOR_TEST_034
     * @tc.desc   Resize the bitVector's length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_resize_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        bitVector.resize(63);
        expect(bitVector.length).assertEqual(63);
    });
    /**
     * @tc.name   BitVector_resize_Func_007
     * @tc.number BITVECTOR_TEST_035
     * @tc.desc   Resize the bitVector's length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_resize_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        bitVector.resize(64);
        expect(bitVector.length).assertEqual(64);
    });
    /**
     * @tc.name   BitVector_resize_Func_008
     * @tc.number BITVECTOR_TEST_036
     * @tc.desc   Resize the bitVector's length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_resize_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(1);
          expect(res0).assertEqual(true);
        }
        bitVector.resize(100);
        for (let i = bitVectorLength; i < 100; i++) {
          expect(0).assertEqual(bitVector[i]);
        }
    });
    /**
     * @tc.name   BitVector_resize_Func_009
     * @tc.number BITVECTOR_TEST_037
     * @tc.desc   Resize the bitVector's length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_resize_Func_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        bitVector.resize(64);
        expect(bitVector.length).assertEqual(bitVectorLength);
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_001
     * @tc.number BITVECTOR_TEST_038
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        let res1 = bitVector.getBitCountByRange(0, 0, 5);
        expect(res1).assertEqual(3);
        let res2 = bitVector.getBitCountByRange(1, 0, 5);
        expect(res2).assertEqual(2);
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_002
     * @tc.number BITVECTOR_TEST_039
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getBitCountByRange(0, 8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_003
     * @tc.number BITVECTOR_TEST_040
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getBitCountByRange(0, 0.1, 6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 0.1`);
        }
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_004
     * @tc.number BITVECTOR_TEST_041
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getBitCountByRange(0, -3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_005
     * @tc.number BITVECTOR_TEST_042
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getBitCountByRange(0, -3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_006
     * @tc.number BITVECTOR_TEST_043
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(64);
        let res1 = bitVector.getBitCountByRange(0, 0, 64);
        expect(res1).assertEqual(32);
        let res2 = bitVector.getBitCountByRange(1, 0, 64);
        expect(res2).assertEqual(32);
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_007
     * @tc.number BITVECTOR_TEST_044
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        let res1 = bitVector.getBitCountByRange(0, 10, bitVectorLength + 10);
        expect(res1).assertEqual(32);
        let res2 = bitVector.getBitCountByRange(1, 10, bitVectorLength + 10);
        expect(res2).assertEqual(32);
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_001
     * @tc.number BITVECTOR_TEST_045
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        let res1 = bitVector.getIndexOf(0, 0, 5);
        expect(res1).assertEqual(2);
        let res2 = bitVector.getIndexOf(1, 0, 5);
        expect(res2).assertEqual(0);
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_002
     * @tc.number BITVECTOR_TEST_046
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getIndexOf(0, 8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_003
     * @tc.number BITVECTOR_TEST_047
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getIndexOf(0, -3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_004
     * @tc.number BITVECTOR_TEST_048
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getIndexOf(0, -3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_005
     * @tc.number BITVECTOR_TEST_049
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getIndexOf(0, 0.1, 6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 0.1`);
        }
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_006
     * @tc.number BITVECTOR_TEST_050
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(64);
        let res1 = bitVector.getIndexOf(0, 0, 64);
        expect(res1).assertEqual(0);
        let res2 = bitVector.getIndexOf(1, 0, 64);
        expect(res2).assertEqual(32);
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_007
     * @tc.number BITVECTOR_TEST_051
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        let res1 = bitVector.getIndexOf(0, 10, bitVectorLength + 10);
        expect(res1).assertEqual(10);
        let res2 = bitVector.getIndexOf(1, 10, bitVectorLength + 10);
        expect(res2).assertEqual(42);
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_001
     * @tc.number BITVECTOR_TEST_052
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        let res1 = bitVector.getLastIndexOf(0, 0, 5);
        expect(res1).assertEqual(4);
        let res2 = bitVector.getLastIndexOf(1, 0, 5);
        expect(res2).assertEqual(3);
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_002
     * @tc.number BITVECTOR_TEST_053
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getLastIndexOf(0, 8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_003
     * @tc.number BITVECTOR_TEST_054
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getLastIndexOf(0, -3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_004
     * @tc.number BITVECTOR_TEST_055
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getLastIndexOf(0, -3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_005
     * @tc.number BITVECTOR_TEST_056
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getLastIndexOf(0, 0.1, 6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 0.1`);
        }
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_006
     * @tc.number BITVECTOR_TEST_057
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(64);
        let res1 = bitVector.getLastIndexOf(0, 0, 64);
        expect(res1).assertEqual(31);
        let res2 = bitVector.getLastIndexOf(1, 0, 64);
        expect(res2).assertEqual(63);
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_007
     * @tc.number BITVECTOR_TEST_058
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        let res1 = bitVector.getLastIndexOf(0, 10, bitVectorLength + 10);
        expect(res1).assertEqual(41);
        let res2 = bitVector.getLastIndexOf(1, 10, bitVectorLength + 10);
        expect(res2).assertEqual(73);
    });
    /**
     * @tc.name   BitVector_flipBitByIndex_Func_001
     * @tc.number BITVECTOR_TEST_059
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.flipBitByIndex(0);
        bitVector.flipBitByIndex(1);
        bitVector.flipBitByIndex(2);
        bitVector.flipBitByIndex(3);
        bitVector.flipBitByIndex(4);
        expect(bitVector[0]).assertEqual(0);
        expect(bitVector[1]).assertEqual(0);
        expect(bitVector[2]).assertEqual(0);
        expect(bitVector[3]).assertEqual(0);
        expect(bitVector[4]).assertEqual(1);
    });
    /**
     * @tc.name   BitVector_flipBitByIndex_Func_002
     * @tc.number BITVECTOR_TEST_060
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.flipBitByIndex(20);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 7. Received value is: 20`);
        }
    });
    /**
     * @tc.name   BitVector_flipBitByIndex_Func_003
     * @tc.number BITVECTOR_TEST_061
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          bitVector.flipBitByIndex(6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "index" must be integer. Received value is: 6.1`);
        }
    });
    /**
     * @tc.name   BitVector_flipBitByIndex_Func_004
     * @tc.number BITVECTOR_TEST_062
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(64);
        for (let i = 0; i < bitVectorLength; i++) {
          bitVector.flipBitByIndex(i);
        }
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            expect(bitVector[i]).assertEqual(0);
          } else {
            expect(bitVector[i]).assertEqual(1);
          }
        }
    });
    /**
     * @tc.name   BitVector_flipBitByIndex_Func_005
     * @tc.number BITVECTOR_TEST_063
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        for (let i = 10; i < bitVectorLength + 10; i++) {
          bitVector.flipBitByIndex(i);
        }
        for (let i = 10; i < bitVectorLength + 10; i++) {
          if (i >= 42) {
            expect(bitVector[i]).assertEqual(0);
          } else {
            expect(bitVector[i]).assertEqual(1);
          }
        }
    });
    /**
     * @tc.name   BitVector_flipBitsByRange_Func_001
     * @tc.number BITVECTOR_TEST_064
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.flipBitsByRange(0, 4);
        expect(bitVector[0]).assertEqual(0);
        expect(bitVector[1]).assertEqual(0);
        expect(bitVector[2]).assertEqual(1);
        expect(bitVector[3]).assertEqual(0);
    });
    /**
     * @tc.name   BitVector_flipBitsByRange_Func_002
     * @tc.number BITVECTOR_TEST_065
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          bitVector.flipBitsByRange(8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_flipBitsByRange_Func_003
     * @tc.number BITVECTOR_TEST_066
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          bitVector.flipBitsByRange(-3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_flipBitsByRange_Func_004
     * @tc.number BITVECTOR_TEST_067
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          bitVector.flipBitsByRange(-3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_flipBitsByRange_Func_005
     * @tc.number BITVECTOR_TEST_068
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          bitVector.flipBitsByRange(3.11, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 3.11`);
        }
    });
    /**
     * @tc.name   BitVector_flipBitsByRange_Func_006
     * @tc.number BITVECTOR_TEST_069
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(64);
        bitVector.flipBitsByRange(0, 32);
        for (let i = 0; i < bitVectorLength; i++) {
          expect(bitVector[i]).assertEqual(1);
        }
    });
    /**
     * @tc.name   BitVector_flipBitsByRange_Func_007
     * @tc.number BITVECTOR_TEST_070
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        bitVector.flipBitsByRange(10, 74);
        for (let i = 10; i < bitVectorLength + 10; i++) {
          if (i >= 42) {
            expect(bitVector[i]).assertEqual(0);
          } else {
            expect(bitVector[i]).assertEqual(1);
          }
        }
    });
    /**
     * @tc.name   BitVector_Values_Func_001
     * @tc.number BITVECTOR_TEST_071
     * @tc.desc   returns an iterator.Each item of the iterator is a Javascript Object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_Values_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        let vec: Array<number> = [];
        let a: Array<number> = [1, 1, 0, 1, 0];
        let itr = bitVector.values();
        let tmp: IteratorResult<number> = itr.next();
        while (!tmp.done) {
          vec.push(tmp.value);
          tmp = itr.next();
        }
        expect(vec.length).assertEqual(a.length);
        for (let i = 0; i < a.length; i++) {
          expect(vec[i]).assertEqual(a[i]);
        }
    });
    /**
     * @tc.name   BitVector_Values_Func_002
     * @tc.number BITVECTOR_TEST_072
     * @tc.desc   returns an iterator.Each item of the iterator is a Javascript Object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_Values_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(64);
        let vec: Array<number> = [];
        let itr = bitVector.values();
        let tmp: IteratorResult<number> = itr.next();
        while (!tmp.done) {
          vec.push(tmp.value);
          tmp = itr.next();
        }
        expect(vec.length).assertEqual(bitVectorLength);
        for (let i = 0; i < bitVectorLength; i++) {
          expect(vec[i]).assertEqual(0);
        }
    });
    /**
     * @tc.name   BitVector_Values_Func_003
     * @tc.number BITVECTOR_TEST_073
     * @tc.desc   returns an iterator.Each item of the iterator is a Javascript Object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_Values_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        let vec: Array<number> = [];
        let itr = bitVector.values();
        let tmp: IteratorResult<number> = itr.next();
        while (!tmp.done) {
          vec.push(tmp.value);
          tmp = itr.next();
        }
        expect(vec.length).assertEqual(bitVectorLength + 10);
        for (let i = 10; i < bitVectorLength + 10; i++) {
          expect(vec[i]).assertEqual(0);
        }
    });
    /**
     * @tc.name   BitVector_setAllBits_Func_001
     * @tc.number BITVECTOR_TEST_074
     * @tc.desc   Sets all of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setAllBits_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.setAllBits(0);
        expect(bitVector[0]).assertEqual(0);
        expect(bitVector[1]).assertEqual(0);
        expect(bitVector[2]).assertEqual(0);
        expect(bitVector[3]).assertEqual(0);
        expect(bitVector[4]).assertEqual(0);
        bitVector.setAllBits(1);
        expect(bitVector[0]).assertEqual(1);
        expect(bitVector[1]).assertEqual(1);
        expect(bitVector[2]).assertEqual(1);
        expect(bitVector[3]).assertEqual(1);
        expect(bitVector[4]).assertEqual(1);
    });
    /**
     * @tc.name   BitVector_setAllBits_Func_002
     * @tc.number BITVECTOR_TEST_075
     * @tc.desc   Sets all of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setAllBits_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(64);
        bitVector.setAllBits(1);
        for (let i = 0; i < bitVectorLength; i++) {
          expect(bitVector[i]).assertEqual(1);
        }
        bitVector.setAllBits(0);
        for (let i = 0; i < bitVectorLength; i++) {
          expect(bitVector[i]).assertEqual(0);
        }
    });
    /**
     * @tc.name   BitVector_setAllBits_Func_003
     * @tc.number BITVECTOR_TEST_076
     * @tc.desc   Sets all of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setAllBits_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        bitVector.setAllBits(1);
        for (let i = 10; i < bitVectorLength + 10; i++) {
          expect(bitVector[i]).assertEqual(1);
        }
        bitVector.setAllBits(0);
        for (let i = 10; i < bitVectorLength + 10; i++) {
          expect(bitVector[i]).assertEqual(0);
        }
    });
    /**
     * @tc.name   BitVector_has_Func_008
     * @tc.number BITVECTOR_TEST_077
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 20;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 10) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(20);
        let res0 = bitVector.has(1, 0, 10);
        expect(res0).assertEqual(true);
        let res1 = bitVector.has(1, 0, 9);
        expect(res1).assertEqual(false);
        let res2 = bitVector.has(0, 10, 19);
        expect(res2).assertEqual(false);
        let res3 = bitVector.has(0, 0, 19);
        expect(res3).assertEqual(true);
    });
    /**
     * @tc.name   BitVector_constructor_Func_002
     * @tc.number BITVECTOR_TEST_078
     * @tc.desc   A constructor used to create a BitVector object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_constructor_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let tmp:string = "a";
        let a:number = JSON.parse(JSON.stringify(tmp)) as number;
        try {
          let bitVector = new collections.BitVector(a);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message)
            .assertEqual(`The type of "length" must be integer. Received value is: a`);
        }
    });
    /**
     * @tc.name   BitVector_push_Func_004
     * @tc.number BITVECTOR_TEST_079
     * @tc.desc   Check if the push is non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_push_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(NaN);
        bitVector.push(Infinity);
        bitVector.push(-2);
        bitVector.push(-4);
        bitVector.push(5);
        bitVector.push(0);
        expect(bitVector[0]).assertEqual(1);
        expect(bitVector[1]).assertEqual(1);
        expect(bitVector[2]).assertEqual(1);
        expect(bitVector[3]).assertEqual(1);
        expect(bitVector[4]).assertEqual(1);
        expect(bitVector[5]).assertEqual(0);
    });
    /**
     * @tc.name   BitVector_has_Func_009
     * @tc.number BITVECTOR_TEST_080
     * @tc.desc   Check the situation where element is set to non-0 and non-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        expect(bitVector.length).assertEqual(6);
        let res0 = bitVector.has(0, 0, 2);
        expect(res0).assertEqual(true);
        let res1 = bitVector.has(1, 0, 2);
        expect(res1).assertEqual(false);
        let res2 = bitVector.has(0, 3, 5);
        expect(res2).assertEqual(false);
        let res3 = bitVector.has(1, 3, 5);
        expect(res3).assertEqual(true);
        let res4 = bitVector.has(-3, 3, 5);
        expect(res4).assertEqual(true);
        let res5 = bitVector.has(7, 3, 5);
        expect(res5).assertEqual(true);
        let res6 = bitVector.has(NaN, 3, 5);
        expect(res6).assertEqual(true);
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_008
     * @tc.number BITVECTOR_TEST_081
     * @tc.desc   Check for abnormal input parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        try {
          let bitVector = new collections.BitVector(0);
          let tmp:string = "test";
          let a:number = JSON.parse(JSON.stringify(tmp)) as number;
          bitVector.push(0);
          bitVector.push(0);
          bitVector.push(0);
          bitVector.push(0);
          bitVector.push(0);
          bitVector.setBitsByRange(1, a, 4);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message)
            .assertEqual(`The type of "fromIndex" must be integer. Received value is: test`);
        }
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_009
     * @tc.number BITVECTOR_TEST_082
     * @tc.desc   Check for abnormal input parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        try {
          let bitVector = new collections.BitVector(2);
          bitVector.setBitsByRange(1, 0, 3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 2. Received value is: 3`);
        }
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_008
     * @tc.number BITVECTOR_TEST_083
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let old_bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = old_bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(old_bitVector.length).assertEqual(bitVectorLength);
        try {
          let tmp:string = "test";
          let a:number = JSON.parse(JSON.stringify(tmp)) as number;
          let new_bitVector: collections.BitVector = old_bitVector.getBitsByRange(0, a);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message)
            .assertEqual(`The type of "toIndex" must be integer. Received value is: test`);
        }
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_008
     * @tc.number BITVECTOR_TEST_084
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector: collections.BitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        let bitVectorLength:number = 5;
        expect(bitVector.length).assertEqual(bitVectorLength);
        try {
          let tmp:string = "test";
          let a:number = JSON.parse(JSON.stringify(tmp)) as number;
          let res: number = bitVector.getBitCountByRange(1, 1, a);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message)
            .assertEqual(`The type of "toIndex" must be integer. Received value is: test`);
        }
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_008
     * @tc.number BITVECTOR_TEST_085
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector: collections.BitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        let bitVectorLength:number = 5;
        expect(bitVector.length).assertEqual(bitVectorLength);
        try {
          let tmp:string = "test";
          let a:number = JSON.parse(JSON.stringify(tmp)) as number;
          let res: number = bitVector.getIndexOf(0, 0, a);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message)
            .assertEqual(`The type of "toIndex" must be integer. Received value is: test`);
        }
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_008
     * @tc.number BITVECTOR_TEST_086
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector: collections.BitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        let bitVectorLength:number = 5;
        expect(bitVector.length).assertEqual(bitVectorLength);
        try {
          let tmp:string = "test";
          let a:number = JSON.parse(JSON.stringify(tmp)) as number;
          let res: number = bitVector.getLastIndexOf(0, 1, a);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message)
            .assertEqual(`The type of "toIndex" must be integer. Received value is: test`);
        }
    });
    /**
     * @tc.name   BitVector_flipBitByIndex_Func_006
     * @tc.number BITVECTOR_TEST_087
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        try {
          let res = bitVector.flipBitByIndex(-2);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 6. Received value is: -2`);
        }
    });
    /**
     * @tc.name   BitVector_flipBitByIndex_Func_007
     * @tc.number BITVECTOR_TEST_088
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        try {
          let tmp:string = "test";
          let a:number = JSON.parse(JSON.stringify(tmp)) as number;
          let res = bitVector.flipBitByIndex(a);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "index" must be integer. Received value is: test`);
        }
    });
    /**
     * @tc.name   BitVector_flipBitsByRange_Func_008
     * @tc.number BITVECTOR_TEST_089
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(1);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(bitVectorLength);
        try {
          let tmp:string = "test";
          let a:number = JSON.parse(JSON.stringify(tmp)) as number;
          bitVector.flipBitsByRange(10, a);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "toIndex" must be integer. Received value is: test`);
        }
    });
    /**
     * @tc.name   BitVector_index_Func_001
     * @tc.number BITVECTOR_TEST_090
     * @tc.desc   Subscript access abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_index_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        let tmp:string = "test";
        let a:number = JSON.parse(JSON.stringify(tmp)) as number;
        let value:number = bitVector[a];
        expect(value).assertEqual(undefined);
    });
  });
}
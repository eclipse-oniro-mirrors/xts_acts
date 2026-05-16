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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { objectProChangeTest0100, objectProChangeTest0101, objectProChangeTest0102,
  objectProChangeTest0103,
  objectProChangeTest0201,
  objectProChangeTest0202,
  objectProChangeTest0203,
  objectProChangeTest0301,
  objectProChangeTest0302,
  objectProChangeTest0303,
  objectProChangeTest0401,
  objectProChangeTest0501,
  objectProChangeTest0601} from './ObjectProChange';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function objectProChangeTest() {
  describe('objectProChangeTest', () => {
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
     * @tc.number SUB_OBJECT_PRO_CHANGE_TEST_0100
     * @tc.name objectProChangeTest0100
     * @tc.desc Object literal increase attribute
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectProChangeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
      let obj = objectProChangeTest0100();
      expect(Object.keys(obj)).assertContain('a');
      expect(Object.keys(obj)).not().assertContain('d');
      obj = objectProChangeTest0101();
      expect(Object.keys(obj)).assertContain('d');
      obj = objectProChangeTest0102();
      expect(Object.keys(obj)).assertContain('d');
      let obj1 = objectProChangeTest0103();
      expect(Object.keys(obj1)).assertContain('d');
    });

    /**
     * @tc.number SUB_OBJECT_PRO_CHANGE_TEST_0200
     * @tc.name objectProChangeTest0200
     * @tc.desc Object literal increase more attribute
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectProChangeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
      let obj = objectProChangeTest0100();
      expect(Object.keys(obj)).assertContain('a');
      expect(Object.keys(obj)).not().assertContain('d');
      expect(Object.keys(obj)).not().assertContain('e');
      expect(Object.keys(obj)).not().assertContain('f');
      obj = objectProChangeTest0201();
      expect(Object.keys(obj)).assertContain('d');
      expect(Object.keys(obj)).assertContain('e');
      expect(Object.keys(obj)).assertContain('f');
      obj = objectProChangeTest0202();
      expect(Object.keys(obj)).assertContain('d');
      expect(Object.keys(obj)).assertContain('e');
      expect(Object.keys(obj)).assertContain('f');
      let obj1 = objectProChangeTest0203();
      expect(Object.keys(obj1)).assertContain('d');
      expect(Object.keys(obj1)).assertContain('e');
      expect(Object.keys(obj1)).assertContain('f');
    });

    /**
     * @tc.number SUB_OBJECT_PRO_CHANGE_TEST_0300
     * @tc.name objectProChangeTest0300
     * @tc.desc Object literal delete attribute
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectProChangeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
      let obj = objectProChangeTest0100();
      expect(Object.keys(obj)).assertContain('a');
      obj = objectProChangeTest0301();
      expect(Object.keys(obj)).not().assertContain('a');
      obj = objectProChangeTest0302();
      expect(Object.keys(obj)).not().assertContain('a');
      expect(Object.keys(obj)).not().assertContain('b');
      let obj1 = objectProChangeTest0303();
      expect(Object.keys(obj1)).not().assertContain('a');
      expect(Object.keys(obj1)).not().assertContain('b');
      expect(Object.keys(obj1)).not().assertContain('c');
    });

    /**
     * @tc.number SUB_OBJECT_PRO_CHANGE_TEST_0400
     * @tc.name objectProChangeTest0400
     * @tc.desc Object literal increase attribute
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectProChangeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
      let obj = objectProChangeTest0100();
      expect(Object.keys(obj)).assertContain('a');
      let obj1 = objectProChangeTest0401();
      expect(Object.keys(obj1)).assertContain('age');
      expect(Object.keys(obj1)).assertContain('gender');
    });

    /**
     * @tc.number SUB_OBJECT_PRO_CHANGE_TEST_0500
     * @tc.name objectProChangeTest0500
     * @tc.desc Object literal defineProperty increase attribute
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectProChangeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
      let obj = objectProChangeTest0100();
      expect(Object.keys(obj)).assertContain('a');
      expect(Object.keys(obj)).not().assertContain('age');
      expect(Object.keys(obj)).not().assertContain('gender');
      let obj1 = objectProChangeTest0501();
      expect(Object.keys(obj1)).assertContain('age');
      expect(Object.keys(obj1)).assertContain('gender');
    });

    /**
     * @tc.number SUB_OBJECT_PRO_CHANGE_TEST_0600
     * @tc.name objectProChangeTest0600
     * @tc.desc Object literal defineProperties increase attribute
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('objectProChangeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,  () => {
      let obj = objectProChangeTest0100();
      expect(Object.keys(obj)).assertContain('a');
      expect(Object.keys(obj)).not().assertContain('age');
      expect(Object.keys(obj)).not().assertContain('gender');
      let obj1 = objectProChangeTest0601();
      expect(Object.keys(obj1)).assertContain('age');
      expect(Object.keys(obj1)).assertContain('gender');
    });

  });
}

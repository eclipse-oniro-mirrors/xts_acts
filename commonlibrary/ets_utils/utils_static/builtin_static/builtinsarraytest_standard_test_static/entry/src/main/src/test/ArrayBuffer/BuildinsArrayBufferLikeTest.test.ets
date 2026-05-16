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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

type ArrayBufferLike1 = ArrayBuffer | ArrayBuffer

export default function builtinsArrayBufferLikeTest() {
  describe('BuiltinsArrayBufferLikeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
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
     * @tc.name   buildinsArrayBufferLikeTest1001
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_LIKE_TEST_1001
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buildinsArrayBufferLikeTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:() => void) => {
        let bbb: ArrayBufferLike1 = new ArrayBuffer(12);
        expect(12).assertEqual(bbb.byteLength)
        done();
      })

    /**
     * @tc.name   buildinsArrayBufferLikeTest1002
     * @tc.number SUB_BUILDINS_ARRAYBUFFER_LIKE_TEST_1002
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayBufferLikeTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:() => void) => {
        let bbb1: ArrayBufferLike1 = new ArrayBuffer(12)
        expect(12).assertEqual(bbb1.byteLength)
        done();
      })
  })
}
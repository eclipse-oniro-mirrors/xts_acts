/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from "@ohos/hypium"

import napitest from 'libnapitest.so'

export default function napiBufferTest() {

  describe('napiBufferTest', () => {

    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[napiBufferTest] after each called')
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0001
     * @tc.name napiBufferTest003
     * @tc.desc aceNapiEtsTest
     */
    it('napiBufferTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(napitest.BufferCopy().toString()).assertDeepEquals(napitest.testStr);
    })
  })
}
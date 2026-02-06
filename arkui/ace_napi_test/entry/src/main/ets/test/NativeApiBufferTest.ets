/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"

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
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0001
    * @tc.name      napiBufferTest001
    * @tc.desc      aceNapiEtsTest
    */
    it('napiBufferTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(napitest.CreateBuffer().toString()).assertDeepEquals(napitest.testStr);
      expect(napitest.CreateExternalBuffer().toString()).assertDeepEquals(napitest.testStr);
    })

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0001
    * @tc.name      napiBufferTest002
    * @tc.desc      aceNapiEtsTest
    */
    it('napiBufferTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer: Object = napitest.CreateBuffer();
      expect(napitest.IsBuffer(buffer)).assertTrue();
      expect(napitest.GetBufferInfo(buffer)).assertTrue();
    })
  })
}
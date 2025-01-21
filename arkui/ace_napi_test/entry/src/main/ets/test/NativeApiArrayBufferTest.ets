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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"

// @ts-ignore
import napitest from 'libnapitest.so'

export default function napiArrayBufferTest() {

  describe('napiArrayBufferTest', function () {

    /**
    * run after testcase
    */
    afterEach(async function () {
      console.info('[napiArrayBufferTest] after each called')
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0001
    * @tc.name      napiArrayBufferTest001
    * @tc.desc      aceNapiEtsTest
    */
    it('napiArrayBufferTest001', 0, function () {
      const buffer = napitest.External();
      expect(!napitest.IsDetachedTest(buffer.buffer)).assertTrue();
    })

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0002
    * @tc.name      napiArrayBufferTest002
    * @tc.desc      aceNapiEtsTest
    */
    it('napiArrayBufferTest002', 0, function () {
      const buffer = new ArrayBuffer(128);
      expect(!napitest.IsDetachedTest(buffer)).assertTrue();
    })

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0003
    * @tc.name      napiArrayBufferTest003
    * @tc.desc      aceNapiEtsTest
    */
    it('napiArrayBufferTest003', 0, function () {
      const buffer = napitest.External();
      expect(!napitest.IsDetachedTest(buffer.buffer)).assertTrue();
      napitest.DetachTest(buffer);
      expect(napitest.IsDetachedTest(buffer.buffer)).assertTrue();
    })
  })
}
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

import { describe, expect, it } from '@ohos/hypium'
import capability from 'libcapabilityndk.so'

export default function CapabilityNdkTest() {
  describe('MuslCapabilityTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CAPABILITY_CAPSET_0100
     * @tc.name       : testMuslCapabilityCapset001
     * @tc.desc       : test capset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslCapabilityCapset001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: number = capability.capset();
      expect(result).assertEqual(resultTrue);
      done()
    });

  })
}
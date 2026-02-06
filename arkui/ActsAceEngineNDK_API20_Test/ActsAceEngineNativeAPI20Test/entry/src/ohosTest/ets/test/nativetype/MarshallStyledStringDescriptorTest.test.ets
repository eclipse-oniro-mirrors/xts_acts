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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libnativetype from 'libnativetype.so'
import Utils from '../common/Utils';

const OS_ACCOUNT_ERR_INVALID_PARAMETER = 12300002;

export default function MarshallStyledStringDescriptorTest() {
  describe('MarshallStyledStringDescriptorTest', () => {
    /**
     * @tc.number  : SUB_ArkUI_ACE_MarshallStyledStringDescriptorTest_0100
     * @tc.name    : testArkUIACEMarshallStyledStringDescriptorTest0100
     * @tc.desc    : testing OH_ArkUI_MarshallStyledStringDescriptor interface.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIACEMarshallStyledStringDescriptorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_MarshallStyledStringDescriptorTest_0100 start====");
          await Utils.sleep(500);
          let Result: number = libnativetype.ErrorCodeParamInvalid();
          expect(Result).assertEqual(401);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_MarshallStyledStringDescriptorTest_0100 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        }
      })
  })
}

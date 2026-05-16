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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium'
import huksndk from 'libhuksndk.so'

export default function SecurityHuksApiTest() {
  describe('SecurityHuksApiTest', () => {
    /**
     * @tc.name   SUB_Security_HUKS_Type_Native_API22_Func_0300
     * @tc.number SUB_Security_HUKS_Type_Native_API22_Func_0300
     * @tc.desc   test OH_Huks_ErrCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_Type_Native_API22_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksndk.huksNativeApi22Type0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_Type_Native_API22_Func_0400
     * @tc.number SUB_Security_HUKS_Type_Native_API22_Func_0400
     * @tc.desc   test OH_Huks_Tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_Type_Native_API22_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksndk.huksNativeApi22Type0400();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_Type_Native_API22_Func_0500
     * @tc.number SUB_Security_HUKS_Type_Native_API22_Func_0500
     * @tc.desc   test OH_Huks_KeyClassType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_Type_Native_API22_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksndk.huksNativeApi22Type0500();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_Type_Native_API22_Func_0600
     * @tc.number SUB_Security_HUKS_Type_Native_API22_Func_0600
     * @tc.desc   test OH_Huks_AlgSuite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_Type_Native_API22_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksndk.huksNativeApi22Type0600();
      expect(result).assertEqual(0);
    });
  })
}

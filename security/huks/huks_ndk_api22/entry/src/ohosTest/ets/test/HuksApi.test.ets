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
import huksNdk from 'libentry.so'

export default function SecurityHuksApiTest() {
  describe('SecurityHuksApiTest', () => {
    /**
     * @tc.name   SUB_Security_HUKS_Utils_Native_API22_Func_0100
     * @tc.number SUB_Security_HUKS_Utils_Native_API22_Func_0100
     * @tc.desc   test OH_Huks_InitExternalCryptoParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_Utils_Native_API22_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksNdk.huksNativeApi22Utils0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_Utils_Native_API22_Func_0200
     * @tc.number SUB_Security_HUKS_Utils_Native_API22_Func_0200
     * @tc.desc   test OH_Huks_AddExternalCryptoParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_Utils_Native_API22_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksNdk.huksNativeApi22Utils0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_Utils_Native_API22_Func_0300
     * @tc.number SUB_Security_HUKS_Utils_Native_API22_Func_0300
     * @tc.desc   test OH_Huks_BuildExternalCryptoParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_Utils_Native_API22_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksNdk.huksNativeApi22Utils0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_Utils_Native_API22_Func_0400
     * @tc.number SUB_Security_HUKS_Utils_Native_API22_Func_0400
     * @tc.desc   test OH_Huks_FreeExternalCryptoParamSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_Utils_Native_API22_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksNdk.huksNativeApi22Utils0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_Utils_Native_API22_Func_0500
     * @tc.number SUB_Security_HUKS_Utils_Native_API22_Func_0500
     * @tc.desc   test OH_Huks_GetExternalCryptoParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_Utils_Native_API22_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksNdk.huksNativeApi22Utils0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_Type_Native_API22_Func_0100
     * @tc.number SUB_Security_HUKS_Type_Native_API22_Func_0100
     * @tc.desc   test OH_Huks_ExternalCryptoTag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_Type_Native_API22_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksNdk.huksNativeApi22Type0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_Type_Native_API22_Func_0200
     * @tc.number SUB_Security_HUKS_Type_Native_API22_Func_0200
     * @tc.desc   test OH_Huks_ExternalPinAuthState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_Type_Native_API22_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksNdk.huksNativeApi22Type0200();
      expect(result).assertEqual(0);
    });
  })
}

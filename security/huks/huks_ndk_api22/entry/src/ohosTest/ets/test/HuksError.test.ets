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

export default function SecurityHuksErrorTest() {
  describe('SecurityHuksErrorTest', () => {
    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0100
     * @tc.number SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0100
     * @tc.desc   test OH_Huks_RegisterProvider, error code 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksNdk.huksNativeApi22Err0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0200
     * @tc.number SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0200
     * @tc.desc   test OH_Huks_UnregisterProvider, error code 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksNdk.huksNativeApi22Err0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0300
     * @tc.number SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0300
     * @tc.desc   test OH_Huks_OpenResource, error code 12000012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksNdk.huksNativeApi22Err0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0400
     * @tc.number SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0400
     * @tc.desc   test OH_Huks_CloseResource, error code 12000012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksNdk.huksNativeApi22Err0400();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0500
     * @tc.number SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0500
     * @tc.desc   test OH_Huks_GetUkeyPinAuthState, error code 12000012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksNdk.huksNativeApi22Err0500();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0600
     * @tc.number SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0600
     * @tc.desc   test OH_Huks_GetProperty, error code 12000012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_HUKS_ErrorCode_Native_API22_Interface_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = huksNdk.huksNativeApi22Err0600();
      expect(result).assertEqual(0);
    });
  })
}

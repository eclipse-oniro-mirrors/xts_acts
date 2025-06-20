/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium"
import bundlendk from 'libbundlendk.so'

const BUNDLE_NAME = "com.actsbundle.napitest"
const FINGER_PRINT = "8E93863FC32EE238060BF69A9B37E2608FFFB21F93C862DD511CBAC9F30024B5"
const APP_ID = "com.actsbundle.napitest_BNtg4JBClbl92Rgc3jm/RfcAdrHXaM8F0QOiwVEhnV5ebE5jNIYnAx+weFRT3QTyUjRNdhmc2aAzWyi+5t5CoBM="
const APP_IDENTIFIER = "test-app-identifier"

export default function budnleNdkNativeTest() {
    describe('BundleNdkTest', () => {

      /**
      * @tc.number    SUB_BMS_BASIC_ETS_NATIVE_0200
      * @tc.name      budnleNdkNativeTest002
      * @tc.desc      budnleNdkNativeTest
      */
      it('BundleNdkTest002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () =>  {
          console.info("Test NAPI data= " + JSON.stringify(bundlendk.getCurrentApplicationInfo()));
          expect(bundlendk.getCurrentApplicationInfo().bundleName).assertEqual(BUNDLE_NAME);
          expect(bundlendk.getCurrentApplicationInfo().fingerprint).assertEqual(FINGER_PRINT);
          expect(bundlendk.getCurrentApplicationInfo().appId).assertEqual(APP_ID);
          expect(bundlendk.getCurrentApplicationInfo().appIdentifier).assertEqual(APP_IDENTIFIER);
      });

    })
}

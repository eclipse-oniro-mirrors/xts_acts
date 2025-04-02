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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
// @ts-ignore
import bundlendk from 'libbundlendk.so'

const BUNDLE_NAME = "com.actsbundle.napitest"
const FINGER_PRINT = "8E93863FC32EE238060BF69A9B37E2608FFFB21F93C862DD511CBAC9F30024B5"

export default function budnleNdkNativeTest() {
    describe('BundleNdkTest', function () {

      /**
      * @tc.number    SUB_BMS_BASIC_ETS_NATIVE_0100
      * @tc.name      budnleNdkNativeTest001
      * @tc.desc      budnleNdkNativeTest
      */
      it('BundleNdkTest001', 0, async function (done) {
          let data = bundlendk.getCurrentApplicationInfo();
          console.info("Test NAPI data= " + JSON.stringify(data));
          expect(data.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.fingerprint).assertEqual(FINGER_PRINT);
          done()
      });

    })
}

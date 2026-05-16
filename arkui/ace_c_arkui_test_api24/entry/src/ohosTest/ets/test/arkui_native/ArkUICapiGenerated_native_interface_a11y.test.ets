/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import arkuiCapiTest from 'libarkuicapigen.so'


export default function arkuiNativeCapiNativeInterfaceA11y() {
  describe('NativeInterfaceA11y (native_interface_a11y)', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(50);
      done();
    });

    /**
     * @tc.number  TestArkUICapi_007
     * @tc.name    TestArkUICapi_007
     * @tc.desc    Case: TestArkUICapi_007. C API: element info create / set component id / destroy.
     *             Non-ASCII details are in the workbook and native C++ comments.
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_007', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_007()).assertEqual(0)
      done()
    })

  });
}

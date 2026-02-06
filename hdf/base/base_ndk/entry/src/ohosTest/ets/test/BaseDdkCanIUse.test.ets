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

import { beforeAll, describe, it, expect, TestType, Size, Level } from "@ohos/hypium"
import baseDdkNdkTest from 'libbaseddkndk.so'

export default function baseDdkCanIUseTest() {
  describe('baseDdkCanIUseTest', () => {
    const TAG: string = "[baseDdkCanIUseTest]";
    
    /**
     * @tc.name   testBaseDdkDdkCanIUseTest001
     * @tc.number SUB_Driver_Ext_BaseDdkCanIUse_0100
     * @tc.desc   Operation success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBaseDdkDdkCanIUseTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testBaseDdkDdkCanIUseTest001---------------------------');
      let flag = canIUse("SystemCapability.Driver.DDK.Extension");
      expect(flag).assertEqual(false);
      done();
    });
  })
}

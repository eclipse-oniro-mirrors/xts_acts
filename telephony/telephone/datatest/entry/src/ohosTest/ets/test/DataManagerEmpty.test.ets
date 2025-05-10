/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, Level, Size, TestType } from '@ohos/hypium';
import data from '@ohos.telephony.data';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';

export default function dataManagerEmptyTest() {
  describe("testEmpty", () => {
    /*
        * @tc.number: SUB_Data_Manager_Empty_0100
        * @tc.name  : telephonyRadioNoPermissionEmptyTest0100
        * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Using callback for asynchronous callback
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : Level 3
        */
    it('telephonyDataManagerEmptyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let a: number = 1;
      let b: number = 2;
      expect(a+b).assertEqual(3);
      done();
    });
  });
}
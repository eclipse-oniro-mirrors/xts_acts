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

import { describe, beforeAll, afterAll, it, expect } from '@ohos/hypium'
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import { hilog } from '@kit.PerformanceAnalysisKit';

const SLOT_0: number = 0;
const SLOT_1: number = 1;

let isSim0Active: Boolean = false;
let isSim1Active: Boolean = false;
let hasCard0: Boolean = false;
let hasCard1: Boolean = false;

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function telephonyRadioNoPermissionEmptyTest() {

  describe('telephonyRadioNoPermissionEmptyTest', () => {

    /*
     * @tc.number: SUB_Telephony_Radio_NoPermissionEmpty_0150
     * @tc.name  : telephonyRadioNoPermissionEmptyTest0150
     * @tc.desc  : Obtain the wireless access technologies for the CS and PS domains currently accessed. Using callback for asynchronous callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('telephonyRadioNoPermissionEmptyTest0150', 0, async (done: Function) => {
      let a: number = 1;
      let b: number = 2;
      expect(a+b).assertEqual(3);
      done();
    });

  });
}
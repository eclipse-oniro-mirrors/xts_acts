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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import appManager from "@ohos.app.ability.appManager"

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function appManagerStaticTest() {
  describe('appManagerStaticTest', () => {

    /**
     * @tc.number: Public_API_Test_App_Manager_Static_0100
     * @tc.name: Public_API_Test_App_Manager_Static_0100
     * @tc.desc: Test the third-party application get ProcessState enum will be right
     * @tc.level 3
     */
    it('Public_API_Test_App_Manager_Static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect(appManager.ProcessState.STATE_CREATE + '').assertEqual('0');
      expect(appManager.ProcessState.STATE_FOREGROUND + '').assertEqual('1');
      expect(appManager.ProcessState.STATE_ACTIVE + '').assertEqual('2');
      expect(appManager.ProcessState.STATE_BACKGROUND + '').assertEqual('3');
      expect(appManager.ProcessState.STATE_DESTROY + '').assertEqual('4');
      done();
    })
  })
}

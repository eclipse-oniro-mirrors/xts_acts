/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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


import { describe, expect, beforeAll, afterAll, it, TestType, Size, Level } from '@ohos/hypium'
import rpc from './@ohos.rpc';
import Want from './@ohos.app.ability.Want';
import { Callback } from './@ohos.base';
import Context from './application/Context';
import { PanelInfo } from './@ohos.selectionInput.SelectionPanel';
import ExtensionContext from './application/ExtensionContext';
import { selectionManager, SelectionExtensionContext } from '@kit.BasicServicesKit';

const TAG = '[SelectionManagerCanIUseTest]';
export default function SelectionManagerCanIUseTest() {
  describe('SelectionManagerCanIUseTest', () => {

    beforeAll(async () => {
      console.log(TAG, '************* Unit SelectionManagerCanIUseTest start*************');
    })

    afterAll(async () => {
      console.log(TAG, '************* Unit SelectionManagerCanIUseTest end*************');
    })



    /**
     * @tc.name   testSelectionManagerCanIUseTest0100
     * @tc.number SUB_Selection_CanIUse_0100
     * @tc.desc   OH_SelectionCanIUse testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerCanIUseTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let flag = canIUse("SystemCapability.SelectionInput.Selection");
      expect(flag).assertEqual(false);
      done();
    });
  })
}

'use static';
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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  Level
} from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

export default function AddMonitorWildcardUnerfined() {
  describe('AddMonitorWildcardUnerfined', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info("beforeAll case");
    });

    beforeEach(async () => {
      console.info("AddMonitorWildcardUnerfined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AddMonitor/AddMonitorWildcardUnerfined",
      }
      try {
        const AddMonitorWildcardUnerfined = AppStorage.get<Router>("router") as Router
        AddMonitorWildcardUnerfined.clear();
        let pages:router.RouterState = AddMonitorWildcardUnerfined.getState();
        console.info("get AddMonitorWildcardUnerfined state pages: " + JSON.stringify(pages));
        if (!("AddMonitorWildcardUnerfined" == pages.name)) {
          console.info("get AddMonitorWildcardUnerfined state pages.name: " + JSON.stringify(pages.name));
          // let result = await AddMonitorWildcardUnerfined.pushUrl(options);
          AddMonitorWildcardUnerfined.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push AddMonitorWildcardUnerfined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AddMonitorWildcardUnerfined page error:" + err);
      }
      console.info("AddMonitorWildcardUnerfined beforeEach end");
    });

    afterEach(() => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.number SUB_ARKUI_API_AddMonitorWildcardUnerfined_0100
     * @tc.name   SUB_ARKUI_API_AddMonitorWildcardUnerfined_0100
     * @tc.desc   Test addMonitor with wildcard path 'cls.*' to monitor object property changes
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SUB_ARKUI_API_AddMonitorWildcardUnerfined_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_AddMonitorWildcardUnerfined_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      // Click button to change propA - this should trigger onClsChanged callback
      let changePropABtn = await driver.findComponent(ON.id('ButtonPropA'));
      await CommonFunc.sleep(1000);
      await (changePropABtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // Get updated num value (should be incremented)
      let strJson2 = inspector.getInspectorByKey('ButtonPropA');
      await CommonFunc.sleep(1000);
      let updatedNum = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('label'));

      expect(updatedNum).assertEqual('"Change propA:101 num1:0"');

      done();
    });
  })
}

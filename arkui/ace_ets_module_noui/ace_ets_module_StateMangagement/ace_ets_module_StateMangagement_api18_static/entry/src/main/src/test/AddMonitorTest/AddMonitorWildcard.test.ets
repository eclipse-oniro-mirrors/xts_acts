'use static';
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

export default function AddMonitorWildcard() {
  describe('AddMonitorWildcard', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info("beforeAll case");
    });

    beforeEach(async () => {
      console.info("AddMonitorWildcard beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AddMonitor/AddMonitorWildcard",
      }
      try {
        const AddMonitorWildcard = AppStorage.get<Router>("router") as Router
        AddMonitorWildcard.clear();
        let pages:router.RouterState = AddMonitorWildcard.getState();
        console.info("get AddMonitorWildcard state pages: " + JSON.stringify(pages));
        if (!("AddMonitorWildcard" == pages.name)) {
          console.info("get AddMonitorWildcard state pages.name: " + JSON.stringify(pages.name));
          // let result = await AddMonitorWildcard.pushUrl(options);
          AddMonitorWildcard.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push AddMonitorWildcard success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AddMonitorWildcard page error:" + err);
      }
      console.info("AddMonitorWildcard beforeEach end");
    });

    afterEach(() => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.number SUB_ARKUI_API_AddMonitorWildcard_0100
     * @tc.name   SUB_ARKUI_API_AddMonitorWildcard_0100
     * @tc.desc   Test addMonitor with wildcard path 'cls.*' to monitor object property changes
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SUB_ARKUI_API_AddMonitorWildcard_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_AddMonitorWildcard_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      // Click button to change propA - this should trigger onClsChanged callback
      let changePropABtn = await driver.findComponent(ON.id('ButtonChangePropA'));
      await CommonFunc.sleep(1000);
      await (changePropABtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // Get updated num value (should be incremented)
      let strJson2 = inspector.getInspectorByKey('ButtonChangePropA');
      await CommonFunc.sleep(1000);
      let updatedNum = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('label'));

      expect(updatedNum).assertEqual('"Change propA:101 num:1"');

      done();
    });

    /**
     * @tc.number SUB_ARKUI_API_AddMonitorWildcard_0200
     * @tc.name   SUB_ARKUI_API_AddMonitorWildcard_0200
     * @tc.desc   Test addMonitor with wildcard path monitoring propB changes
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SUB_ARKUI_API_AddMonitorWildcard_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_AddMonitorWildcard_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);


      // Click first button to change propB
      let changePropBBtn1 = await driver.findComponent(ON.id('ButtonChangePropB1'));
      await CommonFunc.sleep(1000);
      await (changePropBBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // Get updated num value (should be incremented)
      let strJson2 = inspector.getInspectorByKey('ButtonChangePropB1');
      await CommonFunc.sleep(1000);
      let updatedNum = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('label'));

      expect(updatedNum).assertEqual('"Change propB:101 num:2"');

      done();
    });

    /**
     * @tc.number SUB_ARKUI_API_AddMonitorWildcard_0300
     * @tc.name   SUB_ARKUI_API_AddMonitorWildcard_0300
     * @tc.desc   Test clearMonitor to cancel monitoring - callback should not trigger after clear
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SUB_ARKUI_API_AddMonitorWildcard_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_AddMonitorWildcard_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);


      // Click clear button to cancel monitoring
      let clearBtn = await driver.findComponent(ON.id('ButtonClear'));
      await CommonFunc.sleep(1000);
      await (clearBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // Click button to change propB - callback should NOT trigger after clear
      let changePropBBtn2 = await driver.findComponent(ON.id('ButtonChangePropB2'));
      await CommonFunc.sleep(1000);
      await (changePropBBtn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // Get num value - should remain 0 since monitor was cleared
      let strJson2 = inspector.getInspectorByKey('ButtonChangePropB2');
      await CommonFunc.sleep(1000);
      let updatedNum = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('label'));

      // Verify num is still 0 (callback was not triggered after clear)
      expect(updatedNum).assertEqual('"Change propB:102 num:2"');

      done();
    });
  })
}

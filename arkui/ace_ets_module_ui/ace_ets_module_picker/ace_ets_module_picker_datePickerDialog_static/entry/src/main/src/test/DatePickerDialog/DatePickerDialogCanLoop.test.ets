'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function DatePickerDialogCanLoopTest() {
  describe('DatePickerDialogCanLoopTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("DatePickerDialogCanLoopTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.datePickerDialog.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("DatePickerDialogCanLoopTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePickerDialogCanLoop',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DatePickerDialogCanLoopTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerDialogCanLoop" == pages.name)) {
          console.info("get DatePickerDialogCanLoopTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push DatePickerDialogCanLoopTest page error:" + err);
      }
      console.info("DatePickerDialogCanLoopTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("DatePickerDialogCanLoopTest after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0100
     * @tc.number SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0100
     * @tc.desc   Test canLoop false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0100] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('canLoop_false'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0100] click success');
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dataPicker1 = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
        .getArray('$children')[1].getArray('$children')[0];
      expect(dataPicker1.getElement('$attrs').getString('canLoop')).assertEqual('false');
      let cancelBtn = await (driver.findComponent(ON.text('确定')) as Promise<Component>);
      await (cancelBtn?.click() as Promise<void>);
      console.info('[SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0100] END');
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0200
     * @tc.number SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0200
     * @tc.desc   Test canLoop true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0200] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('canLoop_true'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0200] click success');
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dataPicker1 = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
        .getArray('$children')[1].getArray('$children')[0];
      expect(dataPicker1.getElement('$attrs').getString('canLoop')).assertEqual('true');
      let cancelBtn = await (driver.findComponent(ON.text('确定')) as Promise<Component>);
      await (cancelBtn?.click() as Promise<void>);
      console.info('[SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0200] END');
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0300
     * @tc.number SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0300
     * @tc.desc   Test canLoop undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0300] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('canLoop_undefined'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0300] click success');
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dataPicker1 = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
        .getArray('$children')[1].getArray('$children')[0];
      expect(dataPicker1.getElement('$attrs').getString('canLoop')).assertEqual('true');
      let cancelBtn = await (driver.findComponent(ON.text('确定')) as Promise<Component>);
      await (cancelBtn?.click() as Promise<void>);
      console.info('[SUB_ARKUI_DATEPICKERDIALOG_CANLOOP_STATIC_0300] END');
      done();
    });
  })
}

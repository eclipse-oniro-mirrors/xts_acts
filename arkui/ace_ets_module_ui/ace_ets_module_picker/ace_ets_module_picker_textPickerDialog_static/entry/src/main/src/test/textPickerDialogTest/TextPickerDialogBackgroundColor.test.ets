'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils'

export default function TextPickerDialogBackgroundColorTest() {
  describe('TextPickerDialogBackgroundColorTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextPickerDialogBackgroundColorTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.picker.textPickerDialog.static', 'EntryAbility')
    });

    beforeEach(async (): Promise<void> => {
      console.info('TextPickerDialogBackgroundColorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/TextPickerDialogBackgroundColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextPickerDialogBackgroundColorTest state pages:' + JSON.stringify(pages));
        if (!('TextPickerDialogBackgroundColor' == pages.name)) {
          console.info('get TextPickerDialogBackgroundColorTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('push TextPickerDialogBackgroundColorTest page error:' + err);
      }
      console.info('TextPickerDialogBackgroundColorTest beforeEach end');
    });


    /**
     * @tc.number   TextPickerDialogBackgroundColorTest_001
     * @tc.name     TextPickerDialogBackgroundColorTest_001
     * @tc.desc     TextPickerDialogBackgroundColorTest_001
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerDialogBackgroundColorTest_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('BG001'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      console.info('[TextPickerDialogBackgroundColorTest_001] component obj is: ' + JSON.stringify(backgroundColor));
      expect(backgroundColor).assertEqual('#FFFFC0CB');
      let cancelBtn = await (driver.findComponent(ON.text('确定')) as Promise<Component>);
      await (cancelBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      done();
    })
    /**
     * @tc.number   TextPickerDialogBackgroundColorTest_002
     * @tc.name     TextPickerDialogBackgroundColorTest_002
     * @tc.desc     TextPickerDialogBackgroundColorTest_002
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerDialogBackgroundColorTest_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      let btn2 = await driver.findComponent(ON.id('BG002'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      console.info('[TextPickerDialogBackgroundColorTest_002] ' + JSON.stringify(backgroundColor));
      expect(backgroundColor).assertEqual('#A90B5DF8');
      let cancelBtn = await (driver.findComponent(ON.text('确定')) as Promise<Component>);
      await (cancelBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      done();
    })
    /**
     * @tc.number   TextPickerDialogBackgroundColorTest_003
     * @tc.name     TextPickerDialogBackgroundColorTest_003
     * @tc.desc     TextPickerDialogBackgroundColorTest_003
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerDialogBackgroundColorTest_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn3 = await driver.findComponent(ON.id('BG003'));
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      console.info('[TextPickerDialogBackgroundColorTest_003] component obj is: ' + JSON.stringify(backgroundColor));
      expect(backgroundColor).assertEqual('#FFFFFFFF');
      let cancelBtn = await (driver.findComponent(ON.text('确定')) as Promise<Component>);
      await (cancelBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      done();
    })
    /**
     * @tc.number   TextPickerDialogBackgroundColorTest_004
     * @tc.name     TextPickerDialogBackgroundColorTest_004
     * @tc.desc     TextPickerDialogBackgroundColorTest_004
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerDialogBackgroundColorTest_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn4 = await driver.findComponent(ON.id('BG004'));
      await (btn4?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      console.info('[TextPickerDialogBackgroundColorTest_004] component obj is: ' + JSON.stringify(backgroundColor));
      expect(backgroundColor).assertEqual('#FFFFFFFF');
      let cancelBtn = await (driver.findComponent(ON.text('确定')) as Promise<Component>);
      await (cancelBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      done();
    })
  })
}

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

export default function hoverModeAreaTest() {
  describe('hoverModeAreaTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('hoverModeAreaTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.picker.textPickerDialog.static', 'EntryAbility')
    });

    beforeEach(async (): Promise<void> => {
      console.info('hoverModeAreaTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/TextPickerDialog_hoverModeArea',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get hoverModeAreaTest state pages:' + JSON.stringify(pages));
        if (!('backgroundBlurStyle' == pages.name)) {
          console.info('get hoverModeAreaTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('push hoverModeAreaTest page error:' + err);
      }
      console.info('hoverModeAreaTest beforeEach end');
    });

    /**
     * @tc.number   TextPickerDialogHoverModeAreaTest_static_001
     * @tc.name     TextPickerDialogHoverModeAreaTest_static_001
     * @tc.desc     TextPickerDialogHoverModeAreaTest_static_001
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerDialogHoverModeAreaTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('show1'));
      button?.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let value: string = tree.getArray('$children')[1].getElement('$attrs').getString('HoverModeAreaType');
      expect(value).assertEqual('TOP_SCREEN');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await CommonFunc.sleep(1000);
      done();
    })

    /**
     * @tc.number   TextPickerDialogHoverModeAreaTest_static_002
     * @tc.name     TextPickerDialogHoverModeAreaTest_static_002
     * @tc.desc     TextPickerDialogHoverModeAreaTest_static_002
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerDialogHoverModeAreaTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('show2'));
      button?.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let value: string = tree.getArray('$children')[1].getElement('$attrs').getString('HoverModeAreaType');
      expect(value).assertEqual('BOTTOM_SCREEN');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await CommonFunc.sleep(1000);
      done();
    })

    /**
     * @tc.number   TextPickerDialogHoverModeAreaTest_static_003
     * @tc.name     TextPickerDialogHoverModeAreaTest_static_003
     * @tc.desc     TextPickerDialogHoverModeAreaTest_static_003
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerDialogHoverModeAreaTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('show3'));
      button?.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let value: string = tree.getArray('$children')[1].getElement('$attrs').getString('HoverModeAreaType');
      expect(value).assertEqual('BOTTOM_SCREEN');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await CommonFunc.sleep(1000);
      done();
    })

  })
}

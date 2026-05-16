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

export default function TextPickerDialogShadowTest() {
  describe('TextPickerDialogShadowTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextPickerDialogShadowTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.textPickerDialog.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("TextPickerDialogShadowTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/textPickerDialog/TextPickerDialogShadow',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("TextPickerDialogShadow" == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextPickerDialogShadow page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextPickerDialogShadow after each called");
    });


    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0100
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0100
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0100
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('shadow1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getElement('shadow').getString('color');
      expect(shadow).assertEqual('#FFFF0000');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      done();
    })


    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0200
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0200
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0200
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('shadow2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultXS');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      done();
    })


    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0300
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0300
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0300
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('shadow3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultSM');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      done();
    })


    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0400
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0400
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0400
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('shadow4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultMD');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      done();
    })


    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0500
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0500
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0500
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('shadow5'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultLG');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      done();
    })


    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0600
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0600
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0600
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('shadow6'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingSM');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      done();
    })


    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0700
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0700
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0700
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_SHADOW_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('shadow7'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingMD');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      done();
    })

  })
}

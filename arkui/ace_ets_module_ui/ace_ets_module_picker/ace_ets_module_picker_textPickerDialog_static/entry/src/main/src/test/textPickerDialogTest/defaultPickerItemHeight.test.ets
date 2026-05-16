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

export default function defaultPickerItemHeight() {
  describe('defaultPickerItemHeight', () => {
    beforeAll(async (): Promise<void> => {
      console.info("defaultPickerItemHeight beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.textPickerDialog.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("defaultPickerItemHeight beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/TextPickerDialog_defaultPickerItemHeight',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get defaultPickerItemHeight state pages:" + JSON.stringify(pages));
        if (!("TextPickerDialog_defaultPickerItemHeight" == pages.name)) {
          console.info("get defaultPickerItemHeight pages.name:" + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push defaultPickerItemHeight page error:" + err);
      }
      console.info("defaultPickerItemHeight beforeEach end");
    });


    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0100
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0100
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0100
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('show1'));
      button?.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let value = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
        .getArray('$children')[0].getElement('$attrs').getString('defaultPickerItemHeight');
      expect(value).assertEqual('91.00vp');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await CommonFunc.sleep(1000);
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0200
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0200
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0200
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('show2'));
      button?.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let value = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
        .getArray('$children')[0].getElement('$attrs').getString('defaultPickerItemHeight');
      expect(value).assertEqual('81.00vp');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await CommonFunc.sleep(1000);
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0300
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0300
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0300
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('show3'));
      button?.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let value = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
        .getArray('$children')[0].getElement('$attrs').getString('defaultPickerItemHeight');
      expect(value).assertEqual('-50.00vp');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await CommonFunc.sleep(1000);
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0400
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0400
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0400
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('show4'));
      button?.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let value = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
        .getArray('$children')[0].getElement('$attrs').getString('defaultPickerItemHeight');
      expect(value).assertEqual('999.00vp');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await CommonFunc.sleep(1000);
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0500
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0500
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0500
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_DEFAULTPICKERITEMHEIGHT_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('show5'));
      button?.click();
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let value = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
        .getArray('$children')[0].getElement('$attrs').getString('defaultPickerItemHeight');
      expect(value).assertEqual('0.00px');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await CommonFunc.sleep(1000);
      done();
    })
  })
}

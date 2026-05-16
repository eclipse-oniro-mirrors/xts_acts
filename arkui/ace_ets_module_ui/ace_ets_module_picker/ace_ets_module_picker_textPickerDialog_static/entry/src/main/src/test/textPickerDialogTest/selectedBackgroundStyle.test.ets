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

export default function selectedBackgroundStyleTest() {
  describe('selectedBackgroundStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("selectedBackgroundStyleTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.textPickerDialog.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("selectedBackgroundStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/selectedBackgroundStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get selectedBackgroundStyleTest state pages:" + JSON.stringify(pages));
        if (!("selectedBackgroundStyle" == pages.name)) {
          console.info("get selectedBackgroundStyleTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push selectedBackgroundStyleTest page error:" + err);
      }
      console.info("selectedBackgroundStyleTest beforeEach end");
    });
    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0100
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0100
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0100
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0100 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('selectedBackgroundStyle1'));
      btn?.click()
      await Utils.sleep(2000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      let textPicker1 = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
        .getArray('$children')[0];
      expect(textPicker1.getElement('$attrs').getElement('selectedBackgroundStyle').getString('color'))
        .assertEqual('#FFE3F8F9');
      expect(textPicker1.getElement('$attrs').getElement('selectedBackgroundStyle').getString('borderRadius'))
        .assertEqual
        ('radiusTopLeft: [10.00vp]radiusTopRight: [10.00vp]radiusBottomLeft: [10.00vp]radiusBottomRight: [10.00vp]');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0200
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0200
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0200
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0200 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('selectedBackgroundStyle2'));
      btn?.click()
      await Utils.sleep(2000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      let textPicker1 = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
        .getArray('$children')[0];
      expect(textPicker1.getElement('$attrs').getElement('selectedBackgroundStyle').getString('color'))
        .assertEqual('#FFFFC0CB');
      expect(textPicker1.getElement('$attrs').getElement('selectedBackgroundStyle').getString('borderRadius'))
        .assertEqual
        ('radiusTopLeft: [30.00vp]radiusTopRight: [0.00vp]radiusBottomLeft: [30.00vp]radiusBottomRight: [0.00vp]');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0200] END');
      done();
    });
    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0300
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0300
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0300
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0300 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('selectedBackgroundStyle3'));
      btn?.click()
      await Utils.sleep(2000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      let textPicker1 = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
        .getArray('$children')[0];
      expect(textPicker1.getElement('$attrs').getElement('selectedBackgroundStyle').getString('color'))
        .assertEqual('#FF808080');
      expect(textPicker1.getElement('$attrs').getElement('selectedBackgroundStyle').getString('borderRadius'))
        .assertEqual
        ('radiusTopLeft: [NA]radiusTopRight: [NA]radiusBottomLeft: [30.00vp]radiusBottomRight: [10.00vp]');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0300] END');
      done();
    });
    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0400
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0400
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0400
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0400 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('selectedBackgroundStyle4'));
      btn?.click()
      await Utils.sleep(2000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      let textPicker1 = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
        .getArray('$children')[0];
      expect(textPicker1.getElement('$attrs').getElement('selectedBackgroundStyle').getString('color'))
        .assertEqual('#FF808080');
      expect(textPicker1.getElement('$attrs').getElement('selectedBackgroundStyle').getString('borderRadius'))
        .assertEqual
        ('radiusTopLeft: [24.00vp]radiusTopRight: [24.00vp]radiusBottomLeft: [24.00vp]radiusBottomRight: [24.00vp]');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_SELECTEDBGSTYLE_STATIC_0400] END');
      done();
    });
  })
}


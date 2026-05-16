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
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function TextPickerDialogBackgroundEffectTest() {
  describe('TextPickerDialogBackgroundEffectTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextPickerDialogBackgroundEffectTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.textPickerDialog.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextPickerDialogBackgroundEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/TextPickerDialogBackgroundEffect',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextPickerDialogBackgroundEffectTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerDialogCanLoop" == pages.name)) {
          console.info("get TextPickerDialogBackgroundEffectTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push TextPickerDialogBackgroundEffectTest page error:" + err);
      }
      console.info("TextPickerDialogBackgroundEffectTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("TextPickerDialogBackgroundEffectTest after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0100
     * @tc.number SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0100
     * @tc.desc   SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0100] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('DatePickerDialog_Effect001'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0100] click success');
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dataPicker1 = tree.getArray('$children')[1];
      let date =dataPicker1.getArray('$children')[0];
      let jsonOption = date.getElement('$attrs').getElement('backgroundEffect').getElement('options');

      let uniRenderFlag: string = dataPicker1.getElement('$attrs').getString('uniRender');
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0100] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(jsonOption.getDouble('radius')).assertEqual(0);
        expect(jsonOption.getDouble('saturation')).assertEqual(1);
        expect(jsonOption.getDouble('brightness')).assertEqual(1);
        expect(jsonOption.getString('color')).assertEqual('#00000000');
        expect(jsonOption.getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(jsonOption.getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(jsonOption.getString('inactiveColor')).assertEqual('#00000000');
        expect(jsonOption.getString('blurOption')).assertEqual('[0,0]');
      } else {
        expect(jsonOption.getDouble('radius')).assertEqual(40);
        expect(jsonOption.getDouble('saturation')).assertEqual(25);
        expect(jsonOption.getDouble('brightness')).assertEqual(2);
        expect(jsonOption.getString('color')).assertEqual('#FFFFC0CB');
        expect(jsonOption.getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(jsonOption.getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(jsonOption.getString('inactiveColor')).assertEqual('#FF0000FF');
        expect(jsonOption.getString('blurOption')).assertEqual('[20.000000,20.000000]');
      }
      let cancelBtn = await (driver.findComponent(ON.text('确定')) as Promise<Component>);
      await (cancelBtn?.click() as Promise<void>);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0100] END');
      done();
    });
    /**
     * @tc.name   SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0200
     * @tc.number SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0200
     * @tc.desc   SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0200] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('DatePickerDialog_Effect002'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0200] click success');
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dataPicker1 = tree.getArray('$children')[1];
      let date =dataPicker1.getArray('$children')[0];
      let jsonOption = date.getElement('$attrs').getElement('backgroundEffect').getElement('options');
      expect(jsonOption.getDouble('radius')).assertEqual(0);
      expect(jsonOption.getDouble('saturation')).assertEqual(1);
      expect(jsonOption.getDouble('brightness')).assertEqual(1);
      expect(jsonOption.getString('color')).assertEqual('#00000000');
      expect(jsonOption.getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
      expect(jsonOption.getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(jsonOption.getString('inactiveColor')).assertEqual('#00000000');
      expect(jsonOption.getString('blurOption')).assertEqual('[0,0]');
      let cancelBtn = await (driver.findComponent(ON.text('确定')) as Promise<Component>);
      await (cancelBtn?.click() as Promise<void>);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_BGEFFECT_STATIC_0200] END');
      done();
    });
  })
}
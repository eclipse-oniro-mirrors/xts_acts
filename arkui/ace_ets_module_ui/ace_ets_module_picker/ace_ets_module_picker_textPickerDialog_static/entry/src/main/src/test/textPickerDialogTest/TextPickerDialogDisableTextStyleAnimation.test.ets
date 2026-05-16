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

export default function textPickerDialogDisableTextStyleAnimationTest() {
  describe('textPickerDialogDisableTextStyleAnimationTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("textPickerDialogDisableTextStyleAnimationTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.textPickerDialog.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('textPickerDialogDisableTextStyleAnimationTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/TextPickerDialogDisableTextStyleAnimation',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get textPickerDialogDisableTextStyleAnimationTest state pages:' + JSON.stringify(pages));
        if (!('TextPickerDialogDisableTextStyleAnimation' == pages.name)) {
          console.info('get textPickerDialogDisableTextStyleAnimationTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push textPickerDialogDisableTextStyleAnimationTest page error:' + err);
      }
      console.info('textPickerDialogDisableTextStyleAnimationTest beforeEach end');
    });
       
    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0100
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0100
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0100
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0100 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('true'));
      await (btn?.click() as Promise<void>)
      await Utils.sleep(2000);

      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0100] obj is: ' + JSON.stringify(obj));

      let textPicker = obj.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[0];
      let disableTextStyleAnimationValue = textPicker.getElement('$attrs').getString('disableTextStyleAnimation');

      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0100] obj disableTextStyleAnimationValue is: ' + disableTextStyleAnimationValue);
      expect(disableTextStyleAnimationValue).assertEqual('true');

      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0100] END');
      done();
    });   
    
    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0200
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0200
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0200
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0200 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('false'));
      await (btn?.click() as Promise<void>)
      await Utils.sleep(2000);

      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0200] obj is: ' + JSON.stringify(obj));

      let textPicker = obj.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[0];
      let disableTextStyleAnimationValue = textPicker.getElement('$attrs').getString('disableTextStyleAnimation');

      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0200] obj disableTextStyleAnimationValue is: ' + disableTextStyleAnimationValue);
      expect(disableTextStyleAnimationValue).assertEqual('false');

      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0200] END');
      done();
    });
 
    /**
     * @tc.number   SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0300
     * @tc.name     SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0300
     * @tc.desc     SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0300
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0300 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('undefined'));
      await (btn?.click() as Promise<void>)
      await Utils.sleep(2000);

      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0300] obj is: ' + JSON.stringify(obj));

      let textPicker = obj.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[0];
      let disableTextStyleAnimationValue = textPicker.getElement('$attrs').getString('disableTextStyleAnimation');

      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0300] obj disableTextStyleAnimationValue is: ' + disableTextStyleAnimationValue);
      expect(disableTextStyleAnimationValue).assertEqual('false');

      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[SUB_ARKUI_TEXTPICKERDIALOG_DISABLETEXTSTYLEANIMATION_STATIC_0300] END');
      done();
    });
  })
}

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

export default function textPickerDialogAppearTextTest() {
  describe('textPickerDialogAppearTextTest', () => {
    beforeAll(() => {
      console.info("TextPickerDialogAppearText beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.textPickerDialog.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextPickerDialogAppearText beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/TextPickerDialogCallBack',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextPickerDialogAppearText state pages:" + JSON.stringify(pages));
        if (!("TextPickerDialogCallBack" == pages.name)) {
          console.info("get TextPickerDialogAppearText pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push TextPickerDialogAppearText page error:" + err);
      }
      console.info("TextPickerDialogAppearText beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("TextPickerDialogAppearText after each called");
    });

    /**
     * @tc.name   textPickerDialogAppearTextTest_001
     * @tc.number textPickerDialogAppearTextTest_001
     * @tc.desc   Test appear callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('textPickerDialogAppearTextTest_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[textPickerDialogAppearTextTest_001] START');
      await Utils.sleep(1000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('textPickerDialogAppearText'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      let cancelBtn = await (driver.findComponent(ON.text('确定')) as Promise<Component>);
      await cancelBtn.click();
      await Utils.sleep(1000);
      let text: string = inspector.getInspectorByKey('AppearText');
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('onWillAppear_onDidAppear_onWillDisappear_onDidDisappear');
      console.info('[textPickerDialogAppearTextTest_001] END');
      done();
    });
  })
}

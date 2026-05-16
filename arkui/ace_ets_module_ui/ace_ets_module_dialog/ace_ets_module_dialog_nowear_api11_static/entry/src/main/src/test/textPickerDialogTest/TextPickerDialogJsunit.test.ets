'use static';
/**
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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function TextPickerDialogJsunit() {
  describe('TextPickerDialogJsunit', () => {
    beforeAll(() => {
      console.info("TextPickerDialogJsunit beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api11.static", "EntryAbility")
    })

    beforeEach(async () => {
      console.info("TextPickerDialogJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/TextPickerDialogOptions',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextPickerDialogJsunit state pages: " + JSON.stringify(pages));
        if (!("TextPickerDialogOptions" == pages.name)) {
          console.info("get TextPickerDialogJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextPickerDialogJsunit page error: " + err);
        expect().assertFail();
      }
    });


    

    /**
     * @tc.number   TextPickerDialogJsunit_static_0100
     * @tc.name     TextPickerDialogJsunit_static_0100
     * @tc.desc     TextPickerDialogJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('TextPickerDialogJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('TextPickerDialogJsunit_0100 START');
	    let driver = Driver.create()
      let button = await driver.findComponent(ON.id('TextPickerDialog'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('TextPickerDialog');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextPickerDialogJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("TextPickerDialog");
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      console.info('[TextPickerDialogJsunit_0100] END');
      done();
    });
  })
}

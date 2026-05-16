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

export default function textPickerDialogSelectedAreaTest() {
  describe('textPickerDialogSelectedAreaTest', () => {
    beforeAll(() => {
      console.info("textPickerDialogSelectedAreaTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('textPickerDialogSelectedAreaTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/textPickerDialogSelectedArea',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get textPickerDialogSelectedAreaTest state pages:' + JSON.stringify(pages));
        if (!('textPickerDialogSelectedArea' == pages.name)) {
          console.info('get textPickerDialogSelectedAreaTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push textPickerDialogSelectedAreaTest page error:' + err);
      }
      console.info('textPickerDialogSelectedAreaTest beforeEach end');
    });
    
    
/**
     * @tc.number   textPickerDialogSelectedAreaTest_static_001
     * @tc.name     textPickerDialogSelectedAreaTest_static_001
     * @tc.desc     textPickerDialogSelectedAreaTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('textPickerDialogSelectedAreaTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textPickerDialogSelectedAreaTest_static_001 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('showTextPickerDialog')) as Component;
      await (btn?.click() as Promise<void>)
      await Utils.sleep(2000);

      let textPickerDialog = await driver.findComponent(ON.id('colComponent')) as Component;
      let rect = await textPickerDialog!.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      let middle = (top + bottom) / 2

      await driver.swipe(
        Math.round(left + (right - left) / 2) as int,
        Math.round(top + (bottom - top) / 2) as int,
        Math.round(left + (right - left) / 2) as int,
        Math.round(top) as int
      );
      await Utils.sleep(6000);

      let btn1 = await driver.findComponent(ON.text('确定')) as Component;
      await Utils.sleep(500);
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(500);

      let textStr = await driver.findComponent(ON.id('textFlag'));
      let eText = await textStr!.getText();
      console.info("[textPickerDialogSelectedAreaTest_static_001] text: " + JSON.stringify(eText));
      expect(eText).assertEqual('enter');
      console.info('[textPickerDialogSelectedAreaTest_static_001] END');
      done();
    });
  })
}
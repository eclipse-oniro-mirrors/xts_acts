'use static'

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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, Component } from '@kit.TestKit';


export default function SearchKeyboardAppearanceTest() {
  describe('SearchKeyboardAppearanceTest', () => {
    beforeAll(() => {
      console.info("SearchKeyboardAppearanceTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchKeyboardAppearanceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchKeyboardAppearance',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchKeyboardAppearanceTest state pages: " + JSON.stringify(pages));
        if (!("SearchKeyboardAppearance" == pages.name)) {
          console.info("get SearchKeyboardAppearanceTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchKeyboardAppearanceTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
     * @tc.number   SearchKeyboardAppearanceTest_static_0010
     * @tc.name     SearchKeyboardAppearanceTest_static_0010
     * @tc.desc     SearchKeyboardAppearanceTest_static_0010
     * @tc.level    Level.LEVEL0
     */
    it('SearchKeyboardAppearanceTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchKeyboardAppearanceTest_static_0010] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_keyboardAppearance')) as Component;

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SearchTest');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      let resultStr = obj.getElement('$attrs').getInteger('keyboardAppearance')
      expect(resultStr).assertEqual(1);

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('SearchTest');
      await CommonFunc.sleep(1000);
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getInteger('keyboardAppearance')
      expect(resultStr).assertEqual(0);

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('SearchTest');
      await CommonFunc.sleep(1000);
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getInteger('keyboardAppearance')
      expect(resultStr).assertEqual(3);

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('SearchTest');
      await CommonFunc.sleep(1000);
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getInteger('keyboardAppearance')
      expect(resultStr).assertEqual(0);

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('SearchTest');
      await CommonFunc.sleep(1000);
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getInteger('keyboardAppearance')
      expect(resultStr).assertEqual(2);
      console.info('[SearchKeyboardAppearanceTest_static_0010] END');
      done();
    });
  })
}
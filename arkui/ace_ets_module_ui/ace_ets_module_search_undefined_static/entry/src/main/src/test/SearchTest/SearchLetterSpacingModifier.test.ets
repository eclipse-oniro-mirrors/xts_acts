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


export default function SearchLetterSpacingModifierTest() {
  describe('SearchLetterSpacingModifierTest', () => {
    beforeAll(() => {
      console.info("SearchLetterSpacingModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchLetterSpacingModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchLetterSpacingModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchLetterSpacingModifierTest state pages: " + JSON.stringify(pages));
        if (!("SearchLetterSpacingModifier" == pages.name)) {
          console.info("get SearchLetterSpacingModifierTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchLetterSpacingModifierTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   SearchLetterSpacingModifierTest_static_0010
         * @tc.name     SearchLetterSpacingModifierTest_static_0010
         * @tc.desc     SearchLetterSpacingModifierTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('SearchLetterSpacingModifierTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchLetterSpacingModifierTest_static_0010] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('Search');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('letterSpacing')).assertEqual('0.00px');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_letterSpacing')) as Component;

      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Search');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('letterSpacing')).assertEqual('3.50vp');

      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Search');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('letterSpacing')).assertEqual('0.00px');
      await CommonFunc.sleep(1000);
      console.info('[SearchLetterSpacingModifierTest_static_0010] END');
      done();
    });
  })
}
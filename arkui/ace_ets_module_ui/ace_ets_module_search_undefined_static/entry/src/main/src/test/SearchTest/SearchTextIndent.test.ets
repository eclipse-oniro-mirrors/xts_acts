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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
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


export default function SearchTextIndent() {
  describe('SearchTextIndent', () => {
    beforeAll(() => {
      console.info("SearchTextIndent beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchTextIndent beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchTextIndent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchTextIndent state pages: " + JSON.stringify(pages));
        if (!("SearchTextIndent" == pages.name)) {
          console.info("get SearchTextIndent state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchTextIndent page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   SearchTextIndent_static_0010
         * @tc.name     SearchTextIndent_static_0010
         * @tc.desc     SearchTextIndent_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('SearchTextIndent_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTextIndent_static_0010] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('isTextIndent');
      console.info('jk,search undefined value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textIndent')));
      let searchValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('textIndent');
      expect(searchValue.asString()).assertEqual('0.00vp');

      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('isTextIndent1');
      console.info('jk,search true value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('textIndent')));
      let searchValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('textIndent');
      expect(searchValue1.asString()).assertEqual('5.00vp');

      let isTextIndent = await driver.findComponent(ON.id('isTextIndentButton0')) as Component;
      await isTextIndent.click();
      await CommonFunc.sleep(500);

      let strJson2 = inspector.getInspectorByKey('isTextIndent1');
      console.info('jk,search undefined value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('textIndent')));
      let searchValue2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('textIndent');
      expect(searchValue2.asString()).assertEqual('0.00vp');
      console.info('[SearchTextIndent_static_0010] END');
      done();
    });
  })
}
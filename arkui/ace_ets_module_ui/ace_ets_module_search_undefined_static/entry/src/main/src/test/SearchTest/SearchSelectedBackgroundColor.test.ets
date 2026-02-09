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


export default function SearchSelectedBackgroundColor() {
  describe('SearchSelectedBackgroundColor', () => {
    beforeAll(() => {
      console.info("SearchSelectedBackgroundColor beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchSelectedBackgroundColor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchSelectedBackgroundColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchSelectedBackgroundColor state pages: " + JSON.stringify(pages));
        if (!("SearchSelectedBackgroundColor" == pages.name)) {
          console.info("get SearchSelectedBackgroundColor state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchSelectedBackgroundColor page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   SearchSelectedBackgroundColor_static_0010
         * @tc.name     SearchSelectedBackgroundColor_static_0010
         * @tc.desc     SearchSelectedBackgroundColor_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('SearchSelectedBackgroundColor_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchSelectedBackgroundColor_static_0010] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      // let isSelectedBackgroundColor = await driver.findComponent(ON.id('isSelectedBackgroundColor')) as Component;
      let strJson = inspector.getInspectorByKey('isSelectedBackgroundColor');
      console.info('jk,search true value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedBackgroundColor')));
      let searchValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedBackgroundColor');
      expect(searchValue.asString()).assertEqual('#FF000000');

      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('isSelectedBackgroundColor1');
      console.info('jk,search true value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('selectedBackgroundColor')));
      let searchValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('selectedBackgroundColor');
      expect(searchValue1.asString()).assertEqual('#33808080');

      let isSelectedBackgroundColor1 = await driver.findComponent(ON.id('isSelectedBackgroundColorButton0')) as Component;
      await isSelectedBackgroundColor1.click();
      await CommonFunc.sleep(500);

      let strJson2 = inspector.getInspectorByKey('isSelectedBackgroundColor1');
      console.info('jk,search true value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('selectedBackgroundColor')));
      let searchValue2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('selectedBackgroundColor');
      expect(searchValue2.asString()).assertEqual('#FF000000');
      console.info('[SearchSelectedBackgroundColor_static_0010] END');
      done();
    });
  })
}
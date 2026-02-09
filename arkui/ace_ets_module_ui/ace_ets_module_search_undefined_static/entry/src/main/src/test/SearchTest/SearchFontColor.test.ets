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
  describe('SearchFontColor', () => {
    beforeAll(() => {
      console.info("SearchFontColor beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchFontColor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchFontColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchFontColor state pages: " + JSON.stringify(pages));
        if (!("SearchFontColor" == pages.name)) {
          console.info("get SearchFontColor state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchFontColor page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   SearchFontColor_static_0010
         * @tc.name     SearchFontColor_static_0010
         * @tc.desc     SearchFontColor_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('SearchFontColor_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchFontColor_static_0010] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('isFontColor');
      console.info('jk,search true value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontColor')));
      let searchValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fontColor');
      expect(searchValue.asString()).assertEqual('#FF182431');

      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('isFontColor1');
      console.info('jk,search true value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('fontColor')));
      let searchValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('fontColor');
      expect(searchValue1.asString()).assertEqual('#FFA76D8D');

      let isFontColor = await driver.findComponent(ON.id('isFontColorButton0')) as Component;
      await isFontColor.click();
      await CommonFunc.sleep(500);

      let strJson2 = inspector.getInspectorByKey('isFontColor1');
      console.info('jk,search undefined value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('fontColor')));
      let searchValue2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('fontColor');
      expect(searchValue2.asString()).assertEqual('#FF182431');
      console.info('[SearchFontColor_static_0010] END');
      done();
    });
  })
}
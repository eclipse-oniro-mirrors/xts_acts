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


export default function SearchTextFont() {
  describe('SearchTextFont', () => {
    beforeAll(() => {
      console.info("SearchTextFont beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchTextFont beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchTextFont',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchTextFont state pages: " + JSON.stringify(pages));
        if (!("SearchTextFont" == pages.name)) {
          console.info("get SearchTextFont state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchTextFont page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   SearchTextFont_static_0010
         * @tc.name     SearchTextFont_static_0010
         * @tc.desc     SearchTextFont_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('SearchTextFont_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchTextFont_static_0010] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();

      let strJson1 = inspector.getInspectorByKey('isTextFont');
      console.info('jk,search true value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1)
        .getElement('$attrs').getElement('textFont')));
      let searchValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('textFont');
      expect(searchValue1.asString()).assertEqual('{\"fontSize\":\"16.00fp\",\"fontStyle\":\"FontStyle.Normal\",\"fontWeight\":\"400\",\"fontFamily\":\"HarmonyOS Sans\"}');

      let isTextFontButton = await driver.findComponent(ON.id('isTextFontButton')) as Component;
      await isTextFontButton.click();
      await CommonFunc.sleep(500);

      let strJson2 = inspector.getInspectorByKey('isTextFont');
      console.info('jk,search undefined value: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('textFont')));
      let searchValue2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('textFont');
      expect(searchValue2.asString()).assertEqual('{\"fontSize\":\"10.00vp\",\"fontStyle\":\"FontStyle.Normal\",\"fontWeight\":\"800\",\"fontFamily\":\"HarmonyOS Sans\"}');
      console.info('[SearchTextFont_static_0010] END');
      done();
    });
  })
}
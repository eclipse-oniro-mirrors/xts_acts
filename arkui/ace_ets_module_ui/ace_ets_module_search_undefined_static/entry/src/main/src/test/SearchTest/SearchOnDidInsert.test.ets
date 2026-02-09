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


export default function SearchOnDidInsert() {
  describe('SearchOnDidInsert', () => {
    beforeAll(() => {
      console.info("SearchOnDidInsert beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchOnDidInsert beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchOnDidInsert',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchOnDidInsert state pages: " + JSON.stringify(pages));
        if (!("SearchOnDidInsert" == pages.name)) {
          console.info("get SearchOnDidInsert state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchOnDidInsert page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   SearchOnDidInsert_static_0010
         * @tc.name     SearchOnDidInsert_static_0010
         * @tc.desc     SearchOnDidInsert_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('SearchOnDidInsert_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchOnDidInsert_static_0010] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text1 = await driver.findComponent(ON.id('isOnDidInsert')) as Component;
      let button = await driver.findComponent(ON.id('changeOnDidInsertButton')) as Component;
      await text1.inputText('9');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('insertValueText')
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchOnDidInsert_static_0010] component obj is: " + String(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');
      await button.click();
      await CommonFunc.sleep(1000);
      await text1.inputText('6');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('insertValueText')
      await CommonFunc.sleep(200);
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('6');
      await button.click();
      await CommonFunc.sleep(1000);
      await text1.inputText('9');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('insertValueText')
      await CommonFunc.sleep(200);
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('6');
      console.info('[SearchOnDidInsert_static_0010] END');
      done();
    });
  })
}
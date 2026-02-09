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


export default function SearchOnDidDelete() {
  describe('SearchOnDidDelete', () => {
    beforeAll(() => {
      console.info("SearchOnDidDelete beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchOnDidDelete beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchOnDidDelete',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchOnDidDelete state pages: " + JSON.stringify(pages));
        if (!("SearchOnDidDelete" == pages.name)) {
          console.info("get SearchOnDidDelete state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchOnDidDelete page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   SearchOnDidDelete_static_0010
         * @tc.name     SearchOnDidDelete_static_0010
         * @tc.desc     SearchOnDidDelete_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('SearchOnDidDelete_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SearchOnDidDelete_static_0010] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('isOnDidDelete')) as Component;
      let button = await driver.findComponent(ON.id('changeOnDidDeleteButton')) as Component;
      await text.inputText('9');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2055);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('deleteValueText')
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchOnDidDelete_static_0010] component obj is: " + String(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');
      await button.click();
      await CommonFunc.sleep(1000);
      await text.inputText('6');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2055);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('deleteValueText')
      await CommonFunc.sleep(200);
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('6');
      await button.click();
      await CommonFunc.sleep(1000);
      await text.inputText('9');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2055);
      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('deleteValueText')
      await CommonFunc.sleep(200);
      let obj3 = JSON.parseJsonElement(strJson2);
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('6');
      console.info('[SearchOnDidDelete_static_0010] END');
      done();
    });
  })
}
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


export default function SearchOnSubmitTest() {
  describe('SearchOnSubmitTest', () => {
    beforeAll(() => {
      console.info("SearchOnSubmitTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("SearchOnSubmitTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchOnSubmit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchOnSubmitTest state pages: " + JSON.stringify(pages));
        if (!("SearchOnSubmit" == pages.name)) {
          console.info("get SearchOnSubmitTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SearchOnSubmitTest page error: " + err);
        expect().assertFail();
      }
    });


    /**
     * @tc.number   SearchOnSubmitTest_static_0010
     * @tc.name     SearchOnSubmitTest_static_0010
     * @tc.desc     SearchOnSubmitTest_static_0010
     * @tc.level    Level.LEVEL2
     */
    it('SearchOnSubmitTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SearchOnSubmitTest_0010 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let strJson1 = inspector.getInspectorByKey('enterKeyType');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("Search enterKeyType content: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('');
      let Search = await driver.findComponent(ON.id('SearchTest')) as Component;
      await Search.click();
      await CommonFunc.sleep(500);

      let button1 = await driver.findComponent(ON.id('changeIsOnSubmitValid')) as Component;
      await button1.click();
      await CommonFunc.sleep(500);
      await Search.inputText('HelloWorld');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2054)
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('enterKeyType');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("Search enterKeyType content: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('HelloWorld');

      await Search.doubleClick();
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('changeIsOnSubmitValid')) as Component;
      await button2.click();
      await CommonFunc.sleep(500);
      await driver.triggerKey(2054);
      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('enterKeyType');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("Search enterKeyType content: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('');
      console.info('[SearchOnSubmitTest_0010] END');
      done();
    });
  })
}
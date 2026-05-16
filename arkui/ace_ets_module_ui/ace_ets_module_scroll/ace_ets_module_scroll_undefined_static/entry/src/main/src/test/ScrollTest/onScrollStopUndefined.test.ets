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

import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function onScrollStopUndefinedTest() {
  describe('onScrollStopUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("onScrollStopUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/onScrollStopUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onScrollStopUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("onScrollStopUndefined" == pages.name)) {
          console.info("get onScrollStopUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onScrollStopUndefinedTest page error:" + err);
      }
      console.info("onScrollStopUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    onScrollStopUndefinedTest_static_0100
     * @tc.name      onScrollStopUndefinedTest_static_0100
     * @tc.desc      onScrollStopUndefinedTest_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('onScrollStopUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onScrollStopUndefinedTest_static_0100] START.');
      let driver = Driver.create();
      let scrollItem4 = await driver.findComponent(ON.id('scrollItem4')) as Component;
      await CommonFunc.sleep(500);
      let scrollItem1 = await driver.findComponent(ON.id('scrollItem1')) as Component;
      await CommonFunc.sleep(500);
      await (scrollItem4?.dragTo(scrollItem1) as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('common_onScrollStop');
      let onScrollStopValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      console.info('$onScrollStop: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content')));
      expect(onScrollStopValue1.asString()).assertEqual('Count2');

      let driver2 = Driver.create();
      let btn1 = await driver2.findComponent(ON.id('button_onScrollStop')) as Component;
      await btn1.click();
      await CommonFunc.sleep(500);
      await (scrollItem1?.dragTo(scrollItem4) as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson2 = inspector.getInspectorByKey('common_onScrollStop');
      let onScrollStopValue2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content');
      console.info('$onScrollStop: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content')));
      expect(onScrollStopValue2.asString()).assertEqual('Count2');

      console.info('[onScrollStopUndefinedTest_static_0100] END');
      done();
    });
  })
}
'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Component, Driver, ON, Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function bindTipsUndefinedTest() {
  describe('bindTipsUndefinedTest', () => {
    beforeAll(async ():Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("bindTipsUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Common/bindTipsUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get bindTipsUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("bindTipsUndefined" == pages.name)) {
          console.info("get bindTipsUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push bindTipsUndefinedTest page error:" + err);
      }
      console.info("bindTipsUndefinedTest beforeEach end");
    });


    /**
     * @tc.number    bindTipsUndefinedTest_static_0100
     * @tc.name      bindTipsUndefinedTest_static_0100
     * @tc.desc      bindTipsUndefinedTest_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('bindTipsUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[bindTipsUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('common_bindTips')) as Component;
      let center: Point = await btn.getBoundsCenter();
      console.info('[bindTipsUndefinedTest_static_0100] component obj is: ' + JSON.stringify(center));
      await driver.mouseMoveTo(center);
      await CommonFunc.sleep(2000);

      let tip = await driver.findComponent(ON.text('111111111111')) as Component ;
      expect(!!tip).assertTrue();
      await driver.mouseMoveTo({
        x: 0, y: 0
      });
      await CommonFunc.sleep(2000);
      let btn1 = await driver.findComponent(ON.id('common_bindTips2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);
      await driver.mouseMoveTo(center);
      await CommonFunc.sleep(2000);
      expect(!!tip).assertTrue();

      console.info('[bindTipsUndefinedTest_static_0100] END');
      done();
    });
  })
}
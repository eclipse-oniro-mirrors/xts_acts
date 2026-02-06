/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function GetAllAvailableItemsTest() {
  describe('GetAllAvailableItemsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetAllAvailableItemsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeNew/GetAllAvailableItemsTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetAllAvailableItemsTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get GetAllAvailableItemsTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push GetAllAvailableItemsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetAllAvailableItemsTest page error:" + err);
      }
      console.info("GetAllAvailableItemsTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GetAllAvailableItemsTest after each called");
    });

    /**
     * @tc.name   GetAllAvailableItemsTest_0100
     * @tc.number GetAllAvailableItemsTest_0100
     * @tc.desc   getAllAvailableItems return test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetAllAvailableItemsTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GetAllAvailableItemsTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_getAllAvailableItemsNull'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_getAllAvailableItemsNoNull'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('getAllAvailableItemsNull')).assertEqual(0);
      expect(AppStorage.get('getAllAvailableItemsNoNull')).assertEqual(100);
      AppStorage.delete('getAllAvailableItemsNull')
      AppStorage.delete('getAllAvailableItemsNoNull')
      console.info('[NodeAdapterGetAllAvailableItemsTest_0100] END');
      done();
    });
  })
}
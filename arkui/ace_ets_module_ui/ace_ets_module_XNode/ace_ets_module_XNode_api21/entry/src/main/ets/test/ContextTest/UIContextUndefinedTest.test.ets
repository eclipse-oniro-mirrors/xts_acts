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

export default function UIContextUndefinedTest() {
  describe('UIContextUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIContextUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Context/UIContextUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContextUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get UIContextUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UIContextUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextUndefinedTest page error:" + err);
      }
      console.info("UIContextUndefinedTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIContextUndefinedTest after each called");
    });

    /**
     * @tc.name   UIContextUndefinedTest_0100
     * @tc.number UIContextUndefinedTest_0100
     * @tc.desc   UIContext Undefined Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UIContextUndefinedTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('UIContextUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_contextUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('getHostContextUndefined')).assertEqual(undefined);
      expect(AppStorage.get('getWindowNameUndefined')).assertEqual(undefined);
      AppStorage.delete('getHostContextUndefined')
      AppStorage.delete('getWindowNameUndefined')
      console.info('[UIContextUndefinedTest_0100] END');
      done();
    });
  })
}
/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SetCrossLanguageOptionsNullTest() {
  describe('SetCrossLanguageOptionsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SetCrossLanguageOptionsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeMethod/SetCrossLanguageOptionsNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SetCrossLanguageOptionsNullTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get SetCrossLanguageOptionsNullTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push SetCrossLanguageOptionsNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetCrossLanguageOptionsNullTest page error:" + err);
      }
      console.info("SetCrossLanguageOptionsNullTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SetCrossLanguageOptionsNullTest after each called");
    });

    /**
     * @tc.number    SetCrossLanguageOptionsNullTest_0100
     * @tc.name      SetCrossLanguageOptionsNullTest_0100
     * @tc.desc      setCrossLanguageOptions null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('SetCrossLanguageOptionsNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('SetCrossLanguageOptionsNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_setCrossLanguageOptions_null_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('SetCrossLanguageOptionsNull')).assertEqual('null');
      AppStorage.delete('SetCrossLanguageOptionsNull')
      expect(AppStorage.get('SetCrossLanguageOptionsUndefined')).assertEqual('undefined');
      AppStorage.delete('SetCrossLanguageOptionsUndefined')
      console.info('[SetCrossLanguageOptionsNullTest_0100] END');
      done();
    });

  })
}
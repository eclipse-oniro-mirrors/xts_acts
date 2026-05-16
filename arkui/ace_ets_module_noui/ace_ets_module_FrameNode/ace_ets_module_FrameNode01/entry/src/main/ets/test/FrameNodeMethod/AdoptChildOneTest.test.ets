/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function AdoptChildOneTest() {
  describe('AdoptChildOneTest', () => {
    beforeEach(async (done: Function) => {
      console.info("AdoptChildOneTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeMethod/AdoptChildOneTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AdoptChildOneTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get AdoptChildOneTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push AdoptChildOneTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AdoptChildOneTest page error:" + err);
      }
      console.info("AdoptChildOneTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AdoptChildOneTest after each called");
    });

    /**
     * @tc.number    AdoptChildOneTest_0100
     * @tc.name      AdoptChildOneTest_0100
     * @tc.desc      AdoptChild test
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('AdoptChildOneTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('AdoptChildOneTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_adoptChild_100021'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_removeAdoptedChild_100021'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('AdoptChildErrorCode100021')).assertEqual(100021);
      AppStorage.delete('AdoptChildErrorCode100021')
      expect(AppStorage.get('RemoveAdoptedChildErrorCode100021')).assertEqual(100021);
      AppStorage.delete('RemoveAdoptedChildErrorCode100021')
      console.info('[AdoptChildOneTest_0100] END');
      done();
    });

  })
}
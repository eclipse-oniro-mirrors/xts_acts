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

export default function AdoptChildTest() {
  describe('AdoptChildTest', () => {
    beforeEach(async (done: Function) => {
      console.info("AdoptChildTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeMethod/AdoptChildTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AdoptChildTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get AdoptChildTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push AdoptChildTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AdoptChildTest page error:" + err);
      }
      console.info("AdoptChildTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AdoptChildTest after each called");
    });

    /**
     * @tc.number    AdoptChildTest_0100
     * @tc.name      AdoptChildTest_0100
     * @tc.desc      AdoptChild test
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('AdoptChildTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('AdoptChildTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_adoptChild'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_removeAdoptedChild'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('adoptChildSuccess')).assertEqual('adoptChildSuccess');
      AppStorage.delete('adoptChildSuccess')
      expect(AppStorage.get('removeAdoptedChildSuccess')).assertEqual('removeAdoptedChildSuccess');
      AppStorage.delete('removeAdoptedChildSuccess')
      console.info('[AdoptChildTest_0100] END');
      done();
    });

  })
}
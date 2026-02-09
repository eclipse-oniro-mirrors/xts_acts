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

export default function IsFollowingSystemFontScaleFalseTest() {
  describe('IsFollowingSystemFontScaleFalseTest', () => {
    beforeEach(async (done: Function) => {
      console.info("IsFollowingSystemFontScaleFalseTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Context/IsFollowingSystemFontScaleFalseTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IsFollowingSystemFontScaleFalseTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get IsFollowingSystemFontScaleFalseTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push IsFollowingSystemFontScaleFalseTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IsFollowingSystemFontScaleFalseTest page error:" + err);
      }
      console.info("IsFollowingSystemFontScaleFalseTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("IsFollowingSystemFontScaleFalseTest after each called");
    });

    /**
     * @tc.name   IsFollowingSystemFontScaleFalseTest_0100
     * @tc.number IsFollowingSystemFontScaleFalseTest_0100
     * @tc.desc   isFollowingSystemFontScale test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IsFollowingSystemFontScaleFalseTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('IsFollowingSystemFontScaleFalseTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_isFollowingSystemFontScale'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('isFollowingSystemFontScaleFalse')).assertEqual(false);
      AppStorage.delete('isFollowingSystemFontScaleFalse')
      console.info('[IsFollowingSystemFontScaleFalseTest_0100] END');
      done();
    });

  })
}
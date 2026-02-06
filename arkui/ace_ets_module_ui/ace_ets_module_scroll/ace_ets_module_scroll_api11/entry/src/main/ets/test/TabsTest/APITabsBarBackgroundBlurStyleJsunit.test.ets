/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function APITabsBarBackgroundBlurStyleJsunit() {
  describe('APITabsBarBackgroundBlurStyleJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("APITabsBarBackgroundBlurStyleJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/APITabsBarBackgroundBlurStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APITabsBarBackgroundBlurStyleJsunit state pages:" + JSON.stringify(pages));
        if (!("APITabsBarBackgroundBlurStyle" == pages.name)) {
          console.info("get APITabsBarBackgroundBlurStyleJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push APITabsBarBackgroundBlurStyleJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APITabsBarBackgroundBlurStyleJsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   APITabsBarBackgroundBlurStyleJsunit_0100
     * @tc.number APITabsBarBackgroundBlurStyleJsunit_0100
     * @tc.desc   APITabsBarBackgroundBlurStyleJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('APITabsBarBackgroundBlurStyleJsunit_0100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('APITabsBarBackgroundBlurStyleJsunit_0100 START');
      let strcontent = getInspectorByKey('APITabsBarBackgroundBlurStyle01');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('APITabsBarBackgroundBlurStyleJsunit_0100 component obj is: ' + obj);
      console.info('APITabsBarBackgroundBlurStyleJsunit_0100 component obj.$attrs.flingSpeedLimit is: ' + obj.$attrs.barBackgroundBlurStyle);
      expect(obj.$attrs.barBackgroundBlurStyle).assertEqual('BlurStyle.NONE');
      console.info('APITabsBarBackgroundBlurStyleJsunit_0100 END')
      done();
    });

  })
}
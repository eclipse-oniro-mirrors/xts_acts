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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function UIObserverDensityUpdateNullTest() {
  describe('UIObserverDensityUpdateNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIObserverDensityUpdateNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uIObserver/UIObserverDensityUpdateNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIObserverDensityUpdateNullTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get UIObserverDensityUpdateNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UIObserverDensityUpdateNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIObserverDensityUpdateNullTest page error:" + err);
      }
      console.info("UIObserverDensityUpdateNullTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIObserverDensityUpdateNullTest after each called");
    });

    /**
     * @tc.name   uIObserverDensityUpdateOnNull_0100
     * @tc.number SUB_ARKUI_UIOBSERVER_DENSITYUPDATE_ON_NULL_0100
     * @tc.desc   Test UIObserver.on with null type for densityUpdate event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uIObserverDensityUpdateOnNull_0100', Level.LEVEL2, async (done: Function) => {
      console.info('uIObserverDensityUpdateOnNull_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('densityUpdate_on_null_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('densityUpdate_on_null')).assertEqual('success');
      expect(AppStorage.get('densityUpdate_on_undefined')).assertEqual('success');
      AppStorage.delete('densityUpdate_on_null')
      AppStorage.delete('densityUpdate_on_undefined')
      console.info('[uIObserverDensityUpdateOnNull_0100] END');
      done();
    });

    /**
     * @tc.name   uIObserverDensityUpdateOffNull_0100
     * @tc.number SUB_ARKUI_UIOBSERVER_DENSITYUPDATE_OFF_NULL_0100
     * @tc.desc   Test UIObserver.off with null type for densityUpdate event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uIObserverDensityUpdateOffNull_0100', Level.LEVEL2, async (done: Function) => {
      console.info('uIObserverDensityUpdateOffNull_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('densityUpdate_off_null_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('densityUpdate_off_null')).assertEqual('success');
      expect(AppStorage.get('densityUpdate_off_undefined')).assertEqual('success');
      expect(AppStorage.get('densityUpdate_off_null_with_callback')).assertEqual('success');
      expect(AppStorage.get('densityUpdate_off_undefined_with_callback')).assertEqual('success');
      AppStorage.delete('densityUpdate_off_null')
      AppStorage.delete('densityUpdate_off_undefined')
      AppStorage.delete('densityUpdate_off_null_with_callback')
      AppStorage.delete('densityUpdate_off_undefined_with_callback')
      console.info('[uIObserverDensityUpdateOffNull_0100] END');
      done();
    });

  })
}
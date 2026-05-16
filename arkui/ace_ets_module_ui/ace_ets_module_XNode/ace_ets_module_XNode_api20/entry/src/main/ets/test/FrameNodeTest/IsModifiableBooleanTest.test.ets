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

export default function IsModifiableBooleanTest() {
  describe('IsModifiableBooleanTest', () => {
    beforeEach(async (done: Function) => {
      console.info("IsModifiableBooleanTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/IsModifiableBooleanTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IsModifiableBooleanTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get IsModifiableBooleanTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push IsModifiableBooleanTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IsModifiableBooleanTest page error:" + err);
      }
      console.info("IsModifiableBooleanTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("IsModifiableBooleanTest after each called");
    });

    /**
     * @tc.name   IsModifiableBooleanTest_0100
     * @tc.number IsModifiableBooleanTest_0100
     * @tc.desc   isModifiable boolean test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IsModifiableBooleanTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('IsModifiableBooleanTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_isModifiable'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('isModifiableFalse')).assertEqual(false);
      expect(AppStorage.get('isModifiableTrue')).assertEqual(true);
      AppStorage.delete('isModifiableFalse')
      AppStorage.delete('isModifiableTrue')
      console.info('[IsModifiableBooleanTest_0100] END');
      done();
    });

  })
}
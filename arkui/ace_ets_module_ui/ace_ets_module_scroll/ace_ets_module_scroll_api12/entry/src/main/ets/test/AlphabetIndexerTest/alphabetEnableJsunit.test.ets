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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function alphabetEnableJsunit() {
  describe('alphabetEnableJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("alphabetEnableJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/alphabetEnable",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get alphabetEnableJsunit state pages:" + JSON.stringify(pages));
        if (!("alphabetEnable" == pages.name)) {
          console.info("get alphabetEnableJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push alphabetEnableJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alphabetEnableJsunit page error:" + err);
      }
      console.info("alphabetEnableJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("alphabetEnableJsunit after each called");
    });

    /**
     * @tc.name   alphabetEnableJsunit_001
     * @tc.number alphabetEnableJsunit_001
     * @tc.desc   Support touch feedback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('alphabetEnableJsunit_001', Level.LEVEL1, async (done: Function) => {
      console.info('[alphabetEnableJsunit_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.text('B'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('alphabet_enable');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[alphabetEnableJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[alphabetEnableJsunit_001] END');
      done();
    });
  })
}

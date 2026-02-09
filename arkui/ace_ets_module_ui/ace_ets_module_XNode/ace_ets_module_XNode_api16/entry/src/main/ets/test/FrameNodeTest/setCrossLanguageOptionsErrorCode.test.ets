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

export default function setCrossLanguageOptionsErrorCodeTest() {
  describe('setCrossLanguageOptionsErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("setCrossLanguageOptionsErrorCodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/setCrossLanguageOptionsErrorCodeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setCrossLanguageOptionsErrorCodeTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get setCrossLanguageOptionsErrorCodeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push setCrossLanguageOptionsErrorCodeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setCrossLanguageOptionsErrorCodeTest page error:" + err);
      }
      console.info("setCrossLanguageOptionsErrorCodeTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("setCrossLanguageOptionsErrorCodeTest after each called");
    });

    /**
     * @tc.name   setCrossLanguageOptionsErrorCodeTest_0100
     * @tc.number setCrossLanguageOptionsErrorCodeTest_0100
     * @tc.desc   frameNode: setCrossLanguageOptions Error Code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setCrossLanguageOptionsErrorCodeTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('setCrossLanguageOptionsErrorCodeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('setCrossLanguageOptions_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('error_code_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[setCrossLanguageOptionsErrorCodeTest_0100] obj is:' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('100022');
      console.info('[setCrossLanguageOptionsErrorCodeTest_0100] END');
      done();
    });

  })
}
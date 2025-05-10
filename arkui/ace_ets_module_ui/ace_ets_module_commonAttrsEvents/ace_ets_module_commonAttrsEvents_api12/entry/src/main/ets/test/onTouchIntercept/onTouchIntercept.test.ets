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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function onTouchIntercept() {
  describe('onTouchIntercept', () => {
    beforeEach(async (done: Function) => {
      console.info("onTouchIntercept beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onTouchIntercept state pages:" + JSON.stringify(pages));
        if (!("onTouchIntercept" == pages.name)) {
          console.info("get  onTouchIntercept pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/onTouchIntercept/onTouchIntercept"
          })
          await CommonFunc.sleep(2000);
          console.info("push onTouchIntercept page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onTouchIntercept page error:" + err);
      }
      console.info("onTouchIntercept foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onTouchIntercept after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_Common_onTouchIntercept_001
     * @tc.desc onTouchIntercept test
     * @tc.level Level 3
     * @tc.type
     */

    it('onTouchIntercept_001', 0, async (done: Function) => {
      console.info('[onTouchIntercept_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('onTouchIntercept'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('onTouchInterceptText');
      await CommonFunc.sleep(200);
      console.info("[onTouchIntercept_001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);

      expect(JSON.parse(strJson).$attrs.content != '').assertTrue();
      console.info('[onTouchIntercept_001] END');
      done();
    });


  })
}

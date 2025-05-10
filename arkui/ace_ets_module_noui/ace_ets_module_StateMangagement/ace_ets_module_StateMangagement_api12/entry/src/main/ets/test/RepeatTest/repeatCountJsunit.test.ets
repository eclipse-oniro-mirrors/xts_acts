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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function repeatCountJsunit() {
  describe('repeatCountJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("repeatCountJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Repeat/repeatCount",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get repeatCountJsunit state pages:" + JSON.stringify(pages));
        if (!("repeatCount" == pages.name)) {
          console.info("get repeatCountJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push repeatCountJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push repeatCountJsunit page error:" + err);
      }
      console.info("repeatCountJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("repeatCountJsunit after each called");
    });

    /**
     * @tc.number    repeatCountJsunit_001
     * @tc.name      repeatCountJsunit_001
     * @tc.desc      Current total data count
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('repeatCountJsunit_001', 0, async (done: Function) => {
      console.info('[repeatCountJsunit_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('total_count'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('total_count');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[repeatCountJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('insert totalCount 11');
      console.info('[repeatCountJsunit_001] END');
      done();
    });
  })
}

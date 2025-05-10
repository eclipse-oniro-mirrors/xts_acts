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
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function WrapBuilder0020Test() {
  describe('WrapBuilder0020Test', () => {
    beforeEach(async (done: Function) => {
      console.info("WrapBuilder0020Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/wrap_builder/WrapBuilder0020",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WrapBuilder0020Test state pages:" + JSON.stringify(pages));
        if (!("WrapBuilder0020" == pages.name)) {
          console.info("get WrapBuilder0020Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push WrapBuilder0020Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WrapBuilder0020Test page error:" + err);
      }
      console.info("WrapBuilder0020Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("WrapBuilder0020Test after each called");
    });

    /**
     * @tc.number    SUB_ACE_STATUSMANAGER_WRAPI_0020
     * @tc.name      WrapBuilder0020Test_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('WrapBuilder0020Test_001', 0, async (done: Function) => {
      console.info('[WrapBuilder0020Test_001] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tvChildWrapBuilder0020');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[WrapBuilder0020Test_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HelloWorld');
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.fontColor).assertEqual('#FF008000');
      console.info('[WrapBuilder0020Test_001] END');
      done();
    });
  })
}

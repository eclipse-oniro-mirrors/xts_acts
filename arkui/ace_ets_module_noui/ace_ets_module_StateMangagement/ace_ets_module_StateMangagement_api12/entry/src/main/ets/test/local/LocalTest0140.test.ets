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

export default function LocalTest0140() {
  describe('LocalTest0140', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalTest0140 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/local/Local0140",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("Local0140" == pages.name)) {
          console.info("get LocalTest0140 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalTest0140 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalTest0140 page error:" + err);
      }
      console.info("LocalTest0140 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LocalTest0140 after each called");
    });

    /**
     * @tc.number    LocalTest0140_001
     * @tc.name      LocalTest0140_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('LocalTest0140_001', 0, async (done: Function) => {
      console.info('[LocalTest0140_001] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvChildLocal0140'));
      console.info("[LocalTest0140_001] component obj content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('HelloWorld');
      console.info('[LocalTest0140_001] END');
      done();
    });
  })
}

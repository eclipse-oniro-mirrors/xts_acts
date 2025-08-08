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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';

export default function ProviderTest0270() {
  describe('ProviderTest0270', () => {
    beforeEach(async (done: Function) => {
      console.info("ProviderTest0270 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Provider/Provider0270",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("Provider0270" == pages.name)) {
          console.info("get ProviderTest0270 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ProviderTest0270 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProviderTest0270 page error:" + err);
      }
      console.info("ProviderTest0270 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ProviderTest0270 after each called");
    });

    /**
     * @tc.number    SUB_ACE_STATUSMANAGER_PROVIDER_0270
     * @tc.name      ProviderTest0270_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('ProviderTest0270_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ProviderTest0270_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('btnChildProvider0270'));
      let rect = await btn.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.drag(rect.left,Math.round((rect.top+rect.bottom)/2),rect.left+Math.round((rect.right-rect.left)/5),
        Math.round((rect.top+rect.bottom)/2),10)
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvProvider0270'));
      console.info("[StateSet0010TestJsunit] component obj content is: " + JSON.stringify(obj.$attrs.content));
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvProvider0270'));
      console.info("[StateSet0010TestJsunit] component obj1 content is: " + JSON.stringify(obj1.$attrs.content));
      expect(obj.$attrs.content == obj1.$attrs.content).assertTrue()
      console.info('[ProviderTest0270_001] END');
      done();
    });
  })
}

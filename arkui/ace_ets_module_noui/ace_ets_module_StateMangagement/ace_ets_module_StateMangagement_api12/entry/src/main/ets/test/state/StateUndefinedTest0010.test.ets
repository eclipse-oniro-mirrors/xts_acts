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

export default function StateUndefinedTest0010() {
  describe('StateUndefinedTest0010', () => {
    beforeEach(async (done: Function) => {
      console.info("StateUndefinedTest0010 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/state/StateUndefined0010",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("StateUndefined0010" == pages.name)) {
          console.info("get StateUndefinedTest0010 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StateUndefinedTest0010 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateUndefinedTest0010 page error:" + err);
      }
      console.info("StateUndefinedTest0010 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StateUndefinedTest0010 after each called");
    });

    /**
     * @tc.number    SUB_ACE_STATUSMANAGER_V1STATUS_0010
     * @tc.name      StateUndefinedTest0010_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('StateUndefinedTest0010_001', 0, async (done: Function) => {
      console.info('[StateUndefinedTest0010_001] START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvProvideValue'));
      console.info("[StateSet0010TestJsunit] component obj content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('provideValue:undefined');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvStateValue'));
      console.info("[StateSet0010TestJsunit] component obj1 content is: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('stateValue:null');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(getInspectorByKey('tvPropValue'));
      console.info("[StateSet0010TestJsunit] component obj2 content is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('propValue:null');
      await CommonFunc.sleep(1000);
      let obj3: ESObject = JSON.parse(getInspectorByKey('tvLinkValue'));
      console.info("[StateSet0010TestJsunit] component obj3 content is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('linkValue:undefined');
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(getInspectorByKey('tvComsumeValue'));
      console.info("[StateSet0010TestJsunit] component obj4 content is: " + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual('comsumeValue:undefined');
      await CommonFunc.sleep(1000);
      let obj5: ESObject = JSON.parse(getInspectorByKey('tvStoragePropValue'));
      console.info("[StateSet0010TestJsunit] component obj5 content is: " + JSON.stringify(obj5.$attrs.content));
      expect(obj5.$attrs.content).assertEqual('storagePropValue:undefined');
      await CommonFunc.sleep(1000);
      let obj6: ESObject = JSON.parse(getInspectorByKey('tvStorageLinkValue'));
      console.info("[StateSet0010TestJsunit] component obj6 content is: " + JSON.stringify(obj6.$attrs.content));
      expect(obj6.$attrs.content).assertEqual('storageLinkValue:undefined');
      await CommonFunc.sleep(1000);
      let obj7: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageProp'));
      console.info("[StateSet0010TestJsunit] component obj7 content is: " + JSON.stringify(obj7.$attrs.content));
      expect(obj7.$attrs.content).assertEqual('localStorageProp:undefined');
      await CommonFunc.sleep(1000);
      let obj8: ESObject = JSON.parse(getInspectorByKey('tvLocalStorageLink'));
      console.info("[StateSet0010TestJsunit] component obj8 content is: " + JSON.stringify(obj8.$attrs.content));
      expect(obj8.$attrs.content).assertEqual('localStorageLink:undefined');
      console.info('[StateUndefinedTest0010_001] END');
      done();
    });
  })
}

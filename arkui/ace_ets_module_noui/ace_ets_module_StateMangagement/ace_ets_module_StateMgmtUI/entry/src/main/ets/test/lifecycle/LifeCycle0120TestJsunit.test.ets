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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode,
  PointerMatrix, UIElementInfo, UIEventObserver} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function LifeCycle0120TestJsunit() {
  describe('LifeCycle0120TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LifeCycle0120TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/lifecycle/LifeCycle0120",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LifeCycle0120TestJsunit state pages:" + JSON.stringify(pages));
        if (!("LifeCycle0120" == pages.name)) {
          console.info("get LifeCycle0120TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LifeCycle0120TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LifeCycle0120TestJsunit page error:" + err);
      }
      console.info("LifeCycle0120TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LifeCycle0120TestJsunit after each called");
    });

    /**
     * @tc.name   LifeCycle0120TestJsunit_001
     * @tc.number LifeCycle0120TestJsunit_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LifeCycle0120TestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LifeCycle0120TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tvLifeCycle0120Page');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LifeCycle0050TestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onPageShow');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnLifeCycle0120Back"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let observer1 = await driver.createUIEventObserver()
      let callback1 = (UiElementInfo : UIElementInfo) => {
        try {
          console.info('UIElementInfo bundleName:'+ UiElementInfo.bundleName)
          console.info('UIElementInfo text:'+ UiElementInfo.text)
          console.info('UIElementInfo type:'+ UiElementInfo.type)
          expect(UiElementInfo.bundleName == 'com.arkui.ace.StateMgmtUI').assertTrue()
          expect(UiElementInfo.text == 'onPageHide').assertTrue()
          expect(UiElementInfo.type == 'Toast').assertTrue()
        } catch (err) {
          console.info(err)
        }
      }
      observer1.once('toastShow', callback1)
      await CommonFunc.sleep(3000);
      console.info('[LifeCycle0120TestJsunit_001] END');
      done();
    });
  })
}

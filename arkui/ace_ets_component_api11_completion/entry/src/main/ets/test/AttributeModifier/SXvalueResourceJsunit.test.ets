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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';

export default function SXvalueResourceJsunit() {
  describe('SXvalueResourceJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("SXvalueResourceJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AttributeModifier/SXvalueResource',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SXvalueResourceJsunit state pages:" + JSON.stringify(pages));
        if (!("SXvalueResource" == pages.name)) {
          console.info("get SXvalueResourceJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push SXvalueResourceJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SXvalueResourceJsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    it('SXvalueResourceJsunit_0100', 0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('SXvalueResourceJsunit_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('SXvalueResourceButton'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strcontent = getInspectorByKey('SXvalueResourceText');
      await CommonFunc.sleep(1000);
      console.info('SXvalueResourceJsunit_0100 component obj is: ' + JSON.parse(strcontent));
      console.info('SXvalueResourceJsunit_0100 component obj.$attrs.content is: ' + JSON.parse(strcontent).$attrs.content);
      expect(JSON.parse(strcontent).$attrs.content).assertEqual('DTS');
      console.info('SXvalueResourceJsunit_0100 END')
      done();
    });
  })
}
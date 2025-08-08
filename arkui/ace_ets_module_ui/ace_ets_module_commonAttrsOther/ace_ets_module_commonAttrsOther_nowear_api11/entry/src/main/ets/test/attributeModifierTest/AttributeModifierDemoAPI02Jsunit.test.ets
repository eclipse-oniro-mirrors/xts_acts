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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function AttributeModifierDemoAPI02Jsunit() {
  describe('AttributeModifierDemoAPI02Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("AttributeModifierDemoAPI02Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/attributeModifier/AttributeModifierDemoAPI02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AttributeModifierDemoAPI02Jsunit state pages:" + JSON.stringify(pages));
        if (!("AttributeModifierDemoAPI02" == pages.name)) {
          console.info("get AttributeModifierDemoAPI02Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push AttributeModifierDemoAPI02Jsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AttributeModifierDemoAPI02Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    it('AttributeModifierDemoAPI02Jsunit_0100', 0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('AttributeModifierDemoAPI02Jsunit_0100 START');

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049)
      await CommonFunc.sleep(1000);

      let strcontent = getInspectorByKey('AttributeModifierDemoAPI02ButtonFocus');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('AttributeModifierDemoAPI02Jsunit_0100 component obj.backgroundColor is: ' + obj.$attrs.backgroundColor);
      expect(obj.$attrs.backgroundColor).assertEqual("#FF209B08");
      console.info('AttributeModifierDemoAPI02Jsunit_0100 END')
      done();
    });

  })
}
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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function AttributeModifierDemoAPI01Jsunit() {
  describe('AttributeModifierDemoAPI01Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("AttributeModifierDemoAPI01Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/attributeModifier/AttributeModifierDemoAPI01',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AttributeModifierDemoAPI01Jsunit state pages:" + JSON.stringify(pages));
        if (!("AttributeModifierDemoAPI01" == pages.name)) {
          console.info("get AttributeModifierDemoAPI01Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push AttributeModifierDemoAPI01Jsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AttributeModifierDemoAPI01Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    it('AttributeModifierDemoAPI01Jsunit_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('AttributeModifierDemoAPI01Jsunit_0100 START');

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('AttributeModifierDemoAPI01EnabledButton'));
      await btn1.click();

      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('AttributeModifierDemoAPI01isDark'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strcontent = getInspectorByKey('AttributeModifierDemoAPI01Button');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('AttributeModifierDemoAPI01Jsunit_0100 component obj is: ' + obj.$attrs);
      console.info('AttributeModifierDemoAPI01Jsunit_0100 component obj.backgroundColor is: ' + obj.$attrs.backgroundColor);
      console.info('AttributeModifierDemoAPI01Jsunit_0100 component obj.width is: ' + obj.$attrs.width);
      expect(obj.$attrs.width).assertEqual('300.00px');
      console.info('AttributeModifierDemoAPI01Jsunit_0100 END')
      done();
    });

  })
}
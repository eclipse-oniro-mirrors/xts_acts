/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY} from '@ohos.UiTest';

export default function TabsControllerNullUndefined() {
  describe('TabsControllerNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("TabsControllerNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabsNullUndefined/TabsControllerNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TabsControllerNullUndefined state pages:" + JSON.stringify(pages));
        if (!("TabsControllerNullUndefined" == pages.name)) {
          console.info("get TabsControllerNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TabsControllerNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabsControllerNullUndefined page error:" + err);
      }
      console.info("TabsControllerNullUndefined beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TabsControllerNullUndefined after each called");
    });

    /**
     * @tc.number    TabsControllerNullUndefined_0100
     * @tc.name      TabsControllerNullUndefined_0100
     * @tc.desc      test TabsControllerNullUndefined_0100
     * @tc.level     Level 1
     * @tc.type
     */
    it('TabsControllerNullUndefined_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[TabsControllerNullUndefined_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let value1:boolean | undefined = AppStorage.get('value1');
      let value2:boolean | undefined = AppStorage.get('value2');

      expect(value1).assertTrue();
      expect(value2).assertTrue();;
      AppStorage.delete('value2');
      AppStorage.delete('value1');
      console.info('[TabsControllerNullUndefined_0100] END');
      done();
    });

    /**
     * @tc.number    TabsControllerNullUndefined_0200
     * @tc.name      TabsControllerNullUndefined_0200
     * @tc.desc      test TabsControllerNullUndefined_0100
     * @tc.level     Level 1
     * @tc.type
     */
    it('TabsControllerNullUndefined_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[TabsControllerNullUndefined_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('tabsNullId'));
      await btn1.click();
      console.info('[TabsControllerNullUndefined_0200] btn1 click');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('textId');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SwiperFakeTest_0100] content: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('tabs:onWillShow1-');

      let btn2 = await driver.findComponent(ON.id('tabsUndefinedId'));
      await btn2.click();
      console.info('[TabsControllerNullUndefined_0200] btn2 click');
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('textId');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[TabsControllerNullUndefined_0200] content: ' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('tabs:onWillShow1-');
      console.info('[TabsControllerNullUndefined_0200] END');
      done();
    });

  })
}

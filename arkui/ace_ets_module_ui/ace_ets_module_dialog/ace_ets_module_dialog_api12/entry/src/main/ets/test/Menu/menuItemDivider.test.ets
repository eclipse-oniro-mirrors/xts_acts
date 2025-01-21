/*
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
import CommonFunc from '../../MainAbility/common/Common';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function menuItemDivider() {
  describe('menuItemDivider', () => {
    beforeEach(async (done: Function) => {
      console.log('menuItemDivider beforeEach start');
      try {
        router.clear();
        let myPages = router.getState();
        console.info(`get menuItemDivider state myPages:${JSON.stringify(myPages)}`);
        if ('menuItemDivider' !== myPages.name) {
          console.info(`get menuItemDivider state myPages:${JSON.stringify(myPages.name)}`);
          let result = await router.pushUrl({url:'MainAbility/pages/Menu/menuItemDivider'})
          await CommonFunc.sleep(2000);
          console.info(`push menuItemDivider myPage result:${JSON.stringify(result)}`);
        }
      } catch (err) {
        console.info(`push menuItemDivider myPage error:${err}`);
      }
      console.info('menuItemDivider forEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('menuItemDivider after each called');
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_menuItemDivider_0100
     * @tc.name      menuItemDivider_0100
     * @tc.desc      menuItemDivider test
     * @tc.level     Level 3
     * @tc.type
     */

    it('menuItemDivider_0100', 0, async (done: Function) => {
      console.info('[menuItemDivider_0100] START');

      await CommonFunc.sleep(1000);
      let myJson = getInspectorByKey('menuItemDividerText');
      console.info(`[menuItemDivider_0100] component obj1 is:${JSON.stringify(myJson)}`);
      await CommonFunc.sleep(200);
      let obj1: ESObject = JSON.parse(myJson);
      console.info(`[menuItemDivider_0100] component obj1 is:${JSON.stringify(obj1)}`);
      await CommonFunc.sleep(1000);

      expect(obj1.$attrs.itemDivider.strokeWidth).assertEqual('1.50vp');
      console.info('[menuItemDivider_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_menuItemDivider_0200
     * @tc.name      menuItemDivider_0200
     * @tc.desc      menuItemDivider test
     * @tc.level     Level 3
     * @tc.type
     */

    it('menuItemDivider_0200', 0, async (done: Function) => {
      console.info('[menuItemDivider_0200] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('menuItemDividerText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[menuItemDivider_0200] component obj is:${JSON.stringify(obj)}`);
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.itemDivider.color).assertEqual('#FFFFC0CB');
      console.info('[menuItemDivider_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_menuItemDivider_0300
     * @tc.name      menuItemDivider_0300
     * @tc.desc      menuItemDivider test
     * @tc.level     Level 3
     * @tc.type
     */

    it('menuItemDivider_0300', 0, async (done: Function) => {
      console.info('[menuItemDivider_0300] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('menuItemDividerText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[menuItemDivider_0300] component obj is:${JSON.stringify(obj)}`);
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.itemDivider.startMargin).assertEqual('2.00vp');
      console.info('[menuItemDivider_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_menuItemDivider_0400
     * @tc.name      menuItemDivider_0400
     * @tc.desc      menuItemDivider test
     * @tc.level     Level 3
     * @tc.type
     */

    it('menuItemDivider_0400', 0, async (done: Function) => {
      console.info('[menuItemDivider_0400] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('menuItemDividerText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[menuItemDivider_0400] component obj is:${JSON.stringify(obj)}`);
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.itemDivider.endMargin).assertEqual('2.00vp');
      console.info('[menuItemDivider_0400] END');
      done();
    });

  })
}
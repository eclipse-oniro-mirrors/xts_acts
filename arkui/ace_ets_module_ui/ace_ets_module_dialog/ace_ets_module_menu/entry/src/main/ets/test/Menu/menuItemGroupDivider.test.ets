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
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function menuItemGroupDivider() {
  describe('menuItemGroupDivider', () => {
    beforeEach(async (done: Function) => {
      console.info("menuItemGroupDivider beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get menuItemGroupDivider state pages:" + JSON.stringify(pages));
        if (!("menuItemGroupDivider" == pages.name)) {
          console.info("get  menuItemGroupDivider pages.name:" + JSON.stringify(pages.name));
          await router.pushUrl({url:"MainAbility/pages/Menu/menuItemGroupDivider"})
          await CommonFunc.sleep(2000);
          console.info("push menuItemGroupDivider page success");
        }
      } catch (err) {
        console.error("push menuItemGroupDivider page error:" + err);
      }
      console.info("menuItemGroupDivider foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("menuItemGroupDivider after each called");
    });


    /**
     * @tc.name   menuItemGroupDivider_001
     * @tc.number menuItemGroupDivider_001
     * @tc.desc   menuItemGroupDivider_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('menuItemGroupDivider_001', Level.LEVEL2, async (done: Function) => {
      console.info('[menuItemGroupDivider_001] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('menuItemGroupDividerText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[menuItemGroupDivider_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.itemGroupDivider.strokeWidth).assertEqual('50.00vp');
      console.info('[menuItemGroupDivider_001] END');
      done();
    });


    /**
     * @tc.name   menuItemGroupDivider_002
     * @tc.number menuItemGroupDivider_002
     * @tc.desc   menuItemGroupDivider_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('menuItemGroupDivider_002', Level.LEVEL2, async (done: Function) => {
      console.info('[menuItemGroupDivider_002] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('menuItemGroupDividerText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[menuItemGroupDivider_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.subMenuExpandingMode).assertEqual('SubMenuExpandingMode.SIDE');
      console.info('[menuItemGroupDivider_002] END');
      done();
    });




  })
}

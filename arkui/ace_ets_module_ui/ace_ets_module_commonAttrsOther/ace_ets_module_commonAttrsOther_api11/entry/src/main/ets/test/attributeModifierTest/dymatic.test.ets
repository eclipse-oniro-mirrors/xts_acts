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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function dymaticTest() {
  describe('dymaticTest', () => {
    beforeEach(async (done: Function) => {
      console.info("dymaticTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dymaticTest state pages:" + JSON.stringify(pages));
        if (!("attribute" == pages.name)) {
          console.info("get dymaticTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/attributeModifier/attribute"})
          await CommonFunc.sleep(2000);
          console.info("push dymaticTest  page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dymaticTest page error:" + err);
      }
      console.info("dymaticTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("dymaticTest after each called");
    });


    /**
     * @tc.name   dymaticTest_0100
     * @tc.number dymaticTest_0100
     * @tc.desc   dymaticTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dymaticTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[dymaticTest_0100] START');
      await CommonFunc.sleep(2000);
      let btTop = CommonFunc.getComponentRect('pressedBt');
      let top = btTop.top
      let btBottom = CommonFunc.getComponentRect('pressedBt');
      let bottom = btBottom.bottom
      let btRight = CommonFunc.getComponentRect('pressedBt');
      let right = btRight.right
      let btLeft = CommonFunc.getComponentRect('pressedBt');
      let left = btLeft.left
      let xmiddle = Math.round(left + (right -left)/2)
      let ymiddle = Math.round(top + (bottom - top)/2)

      let driver = await Driver.create()
      driver.longClick(xmiddle,ymiddle);
      await CommonFunc.sleep(2000);
      let json = getInspectorByKey('pressedBt');
      let Obj1: ESObject = JSON.parse(json);
      console.info("dymaticTest_0100 json info " + JSON.stringify(json));
      
      expect(Obj1.$attrs.backgroundColor).assertEqual('#FF000000');
      console.info('[dymaticTest_0100] END');
      done();
    });

  })
}

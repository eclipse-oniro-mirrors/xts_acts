/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import CommonFunc from '../../../MainAbility/common/Common';
import RectValue  from '../../../MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';
import { Driver, } from '@ohos.UiTest';

export default function SideBarContainer_AttributeTest() {
  describe('SideBarContainer_AttributeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SideBarContainer_Attribute beforeEach start");
        let driver: Driver = Driver.create();
  let size = await driver.getDisplaySize();
  if (size.x != 466 && size.y != 466) {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/SideBarContainer_attribute/SideBarContainer_Attribute',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SideBarContainer_Attribute state pages:" + JSON.stringify(pages));
        if (!("SideBarContainer_Attribute" == pages.name)) {
          console.info("get SideBarContainer_Attribute pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SideBarContainer_Attribute page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SideBarContainer_Attribute page error:" + err);
      }
      console.info("SideBarContainer_Attribute beforeEach end");
  }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SideBarContainer_AttributeTest after each called");
    });
    /**
     * @tc.name   SUB_ACE_SideBarContainer_Attribute_0100
     * @tc.number SUB_ACE_SideBarContainer_Attribute_0100
     * @tc.desc   sideBarWidth < minSideBarWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_SideBarContainer_Attribute_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainer_Attribute_0100] START');
      await CommonFunc.sleep(2000);

      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBar_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBarContainer_01');

      console.log("assert position")
      expect(Math.abs(SideBar_01.left - SideBarContainer_01.left) <= 1).assertTrue();
      console.log("SideBar_01.left" + SideBar_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(vp2px(200))) <= 1).assertTrue(); 
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      console.info('[SUB_ACE_SideBarContainer_Attribute_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SideBarContainer_Attribute_0200
     * @tc.number SUB_ACE_SideBarContainer_Attribute_0200
     * @tc.desc   sideBarWidth > maxSideBarWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_SideBarContainer_Attribute_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainer_Attribute_0200] START');
      globalThis.value.message.notify({
        name: 'sideBarWidth', value: 320
      })
      await CommonFunc.sleep(2000);

      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBar_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBarContainer_01');

      console.log("assert position")
      expect(Math.abs(SideBar_01.left - SideBarContainer_01.left) <= 1).assertTrue();
      console.log("SideBar_01.left" + SideBar_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(vp2px(300))) <= 1).assertTrue(); 
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      console.info('[SUB_ACE_SideBarContainer_Attribute_0200] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SideBarContainer_Attribute_0300
     * @tc.number SUB_ACE_SideBarContainer_Attribute_0300
     * @tc.desc   minSideBarWidth < sideBarWidth < maxSideBarWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_SideBarContainer_Attribute_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainer_Attribute_0300] START');
      globalThis.value.message.notify({
        name: 'sideBarWidth', value: 250
      })
      await CommonFunc.sleep(2000);

      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBar_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBarContainer_01');

      console.log("assert position")
      expect(Math.abs(SideBar_01.left - SideBarContainer_01.left) <= 1).assertTrue();
      console.log("SideBar_01.left" + SideBar_01.left)

      console.log("assert width");
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(vp2px(250))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      console.info('[SUB_ACE_SideBarContainer_Attribute_0300] END');
      done();
    });
    /**
     * @tc.name   SUB_ACE_SideBarContainer_Attribute_0400
     * @tc.number SUB_ACE_SideBarContainer_Attribute_0400
     * @tc.desc   maxSideBarWidth < minSideBarWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_SideBarContainer_Attribute_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainer_Attribute_0400] START');
      globalThis.value.message.notify({
        name: 'maxSideBarWidth', value: 150
      })
      await CommonFunc.sleep(2000);

      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBar_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBarContainer_01');

      console.log("assert position")
      expect(Math.abs(SideBar_01.left - SideBarContainer_01.left) <= 1).assertTrue();
      console.log("SideBar_01.left" + SideBar_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(vp2px(200))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      console.info('[SUB_ACE_SideBarContainer_Attribute_0400] END');
      done();
    });


  })

}
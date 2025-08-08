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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import RectValue from '../../../MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function SideBarContainerDivider() {
  describe('SideBarContainerDivider', () => {
    beforeEach(async (done: Function) => {
      console.info("SideBarContainerDivider beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/SideBarContainerDivider/SideBarContainerDivider',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SideBarContainerDivider state pages:" + JSON.stringify(pages));
        if (!("SideBarContainerDivider" == pages.name)) {
          console.info("get SideBarContainerDivider pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SideBarContainerDivider page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SideBarContainerDivider page error:" + err);
      }
      console.info("SideBarContainerDivider beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SideBarContainerDividerTest after each called");
    });

    /**
     * @tc.number SUB_ACE_SideBarContainerDivider_0100
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SideBarContainerType.AUTO， width > minSideBarWidth + minContentWidth
     */
    it('SUB_ACE_SideBarContainerDivider_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerDivider_0100] START');
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerDivider_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerDivider_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerDivider_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(vp2px(200))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(vp2px(490))) <= 1)
        .assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      // let strJson1 = getInspectorByKey('SideBarContainerDivider_SideBarContainer_01');
      //
      // await CommonFunc.sleep(1000);
      // expect(JSON.parse(strJson1).$attrs.type).assertEqual('SideBarContainerType.Embed');
      // console.log(JSON.parse(strJson1).$attrs.type)

      console.info('[SUB_ACE_SideBarContainerDivider_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_SideBarContainerDivider_0200
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SideBarContainerType.AUTO， width > minSideBarWidth + minContentWidth
     */
    it('SUB_ACE_SideBarContainerDivider_0200', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerDivider_0200] START');
      globalThis.value.message.notify({
        name: 'width1', value: 600
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerDivider_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerDivider_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerDivider_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(vp2px(200)));
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      expect(Math.round(sideBarContent_01.right - sideBarContent_01.left)).assertEqual(Math.round(vp2px(400)));
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      let strJson1 = getInspectorByKey('SideBarContainerDivider_SideBarContainer_01');
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson1).$attrs.type).assertEqual('SideBarContainerType.OVERLAY');
      console.log(JSON.parse(strJson1).$attrs.type)

      console.info('[SUB_ACE_SideBarContainerDivider_0100] END');
      done();
    });


  })

}

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
import RectValue from '../../../MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function SideBarContainerType_DefaultValue2() {
  describe('SideBarContainerType_DefaultValue2', () => {
    beforeEach(async (done: Function) => {
      console.info("SideBarContainerType_DefaultValue2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/SideBarContainerType/SideBarContainerType_DefaultValue2',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SideBarContainerType_DefaultValue2 state pages:" + JSON.stringify(pages));
        if (!("SideBarContainerType_DefaultValue2" == pages.name)) {
          console.info("get SideBarContainerType_DefaultValue2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SideBarContainerType_DefaultValue2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SideBarContainerType_DefaultValue2 page error:" + err);
      }
      console.info("SideBarContainerType_DefaultValue2 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SideBarContainerType_DefaultValue2Test after each called");
    });

    /**
     * @tc.name   SUB_ACE_SideBarContainerType_DefaultValue2_0100
     * @tc.number SUB_ACE_SideBarContainerType_DefaultValue2_0100
     * @tc.desc   SideBarContainerType.AUTO， width > minSideBarWidth + minContentWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_SideBarContainerType_DefaultValue2_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_DefaultValue2_0100] START');
      globalThis.value.message.notify({
        name: 'width1', value: 640
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_DefaultValue2_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_DefaultValue2_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_DefaultValue2_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(vp2px(489))) <= 1).assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))


      console.info('[SUB_ACE_SideBarContainerType_DefaultValue2_0100] END');
      done();
    });


    /**
     * @tc.name   SUB_ACE_SideBarContainerType_DefaultValue2_0200
     * @tc.number SUB_ACE_SideBarContainerType_DefaultValue2_0200
     * @tc.desc   SideBarContainerType.AUTO， width > minSideBarWidth + minContentWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_SideBarContainerType_DefaultValue2_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_DefaultValue2_0200] START');
      globalThis.value.message.notify({
        name: 'width1', value: 600
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_DefaultValue2_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_DefaultValue2_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_DefaultValue2_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(vp2px(600))) <= 1).assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))


      console.info('[SUB_ACE_SideBarContainerType_DefaultValue2_0200] END');
      done();
    });


  })

}

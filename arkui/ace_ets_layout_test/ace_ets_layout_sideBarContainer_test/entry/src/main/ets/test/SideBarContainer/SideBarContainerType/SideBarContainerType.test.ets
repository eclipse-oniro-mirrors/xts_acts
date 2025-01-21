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
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function SideBarContainerTypeTest() {
  describe('SideBarContainerTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SideBarContainerType beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/SideBarContainerType/SideBarContainerType',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SideBarContainerType state pages:" + JSON.stringify(pages));
        if (!("SideBarContainerType" == pages.name)) {
          console.info("get SideBarContainerType pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SideBarContainerType page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SideBarContainerType page error:" + err);
      }
      console.info("SideBarContainerType beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SideBarContainerTypeTest after each called");
    });

    /**
     * @tc.number SUB_ACE_SideBarContainerType_0100
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SideBarContainerType.Embed， width > minSideBarWidth + minContentWidth
     */
    it('SUB_ACE_SideBarContainerType_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_0100] START');
      await CommonFunc.sleep(2000);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left:" + (SideBar_01.right - SideBar_01.left))
      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(vp2px(549))) <= 1).assertTrue();
      console.log('sideBarContent_01.right - sideBarContent_01.left:' + (sideBarContent_01.right - sideBarContent_01.left))

      console.info('[SUB_ACE_SideBarContainerType_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_SideBarContainerType_0200
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SideBarContainerType.Embed， width < minSideBarWidth + minContentWidth
     */
    it('SUB_ACE_SideBarContainerType_0200', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_0200] START');
      globalThis.value.message.notify({
        name: 'width1', value: 400
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(sideBarContent_01.left).assertEqual(SideBarContainer_01.left);
      console.log("sideBarContent_01.left" + sideBarContent_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.round(sideBarContent_01.right - sideBarContent_01.left)).assertEqual(Math.round(vp2px(400)));
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))


      console.info('[SUB_ACE_SideBarContainerType_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_SideBarContainerType_0300
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SideBarContainerType.Overlay， width > minSideBarWidth + minContentWidth
     */
    it('SUB_ACE_SideBarContainerType_0300', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_0300] START');
      globalThis.value.message.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.Overlay
      })
      await CommonFunc.sleep(1000);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_011: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      expect(sideBarContent_011.left).assertEqual(SideBarContainer_01.left);
      console.log("sideBarContent_011.left" + sideBarContent_011.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      // expect(Math.round(sideBarContent_011.right - sideBarContent_011.left)).assertEqual(Math.round(vp2px(700)));
      // console.log("sideBarContent_011.right - sideBarContent_011.left" + (sideBarContent_011.right - sideBarContent_011.left))

      let strJson1 = getInspectorByKey('SideBarContainerType_SideBarContainer_01');

      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson1).$attrs.type).assertEqual('SideBarContainerType.OVERLAY');
      console.log(JSON.parse(strJson1).$attrs.type)

      console.info('[SUB_ACE_SideBarContainerType_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_SideBarContainerType_0400
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SideBarContainerType.Overlay， width < minSideBarWidth + minContentWidth
     */
    it('SUB_ACE_SideBarContainerType_0400', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_0400] START');
      globalThis.value.message.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.Overlay
      })
      globalThis.value.message.notify({
        name: 'width1', value: 400
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      expect(sideBarContent_01.left).assertEqual(SideBarContainer_01.left);
      console.log("sideBarContent_01.left" + sideBarContent_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(vp2px(150))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(vp2px(400))) <= 1).assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      let strJson1 = getInspectorByKey('SideBarContainerType_SideBarContainer_01');

      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson1).$attrs.type).assertEqual('SideBarContainerType.OVERLAY');
      console.log(JSON.parse(strJson1).$attrs.type)

      console.info('[SUB_ACE_SideBarContainerType_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_SideBarContainerType_0500
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SideBarContainerType.Overlay， width < minSideBarWidth + minContentWidth ,minContentWidth set 100,minSideBarWidth set 400
     */
    it('SUB_ACE_SideBarContainerType_0500', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_0500] START');
      globalThis.value.message.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.Overlay
      })
      globalThis.value.message.notify({
        name: 'width1', value: 400
      })
      globalThis.value.message.notify({
        name: 'minContentWidth', value: 100
      })
      globalThis.value.message.notify({
        name: 'minSideBarWidth', value: 400
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      expect(sideBarContent_01.left).assertEqual(SideBarContainer_01.left);
      console.log("sideBarContent_01.left" + sideBarContent_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)


      console.log("assert width")
      expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(vp2px(400)));
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      expect(Math.round(sideBarContent_01.right - sideBarContent_01.left)).assertEqual(Math.round(vp2px(400)));
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      let strJson1 = getInspectorByKey('SideBarContainerType_SideBarContainer_01');

      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson1).$attrs.type).assertEqual('SideBarContainerType.OVERLAY');
      console.log(JSON.parse(strJson1).$attrs.type)

      console.info('[SUB_ACE_SideBarContainerType_0500] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_SideBarContainerType_0600
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SideBarContainerType.AUTO， width >= minSideBarWidth + minContentWidth ,minContentWidth set 300,minSideBarWidth set 200
     */
    it('SUB_ACE_SideBarContainerType_0600', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_0600] START');
      globalThis.value.message.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.AUTO
      })
      globalThis.value.message.notify({
        name: 'width1', value: 500
      })
      globalThis.value.message.notify({
        name: 'minContentWidth', value: 300
      })
      globalThis.value.message.notify({
        name: 'minSideBarWidth', value: 200
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(vp2px(200)));
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      expect(Math.round(sideBarContent_01.right - sideBarContent_01.left)).assertEqual(Math.round(vp2px(300)));
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      console.info('[SUB_ACE_SideBarContainerType_0600] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_SideBarContainerType_0700
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SideBarContainerType.AUTO， width < minSideBarWidth + minContentWidth ,minContentWidth set 300,minSideBarWidth set 200
     */
    it('SUB_ACE_SideBarContainerType_0700', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_0700] START');
      globalThis.value.message.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.AUTO
      })
      globalThis.value.message.notify({
        name: 'width1', value: 400
      })
      globalThis.value.message.notify({
        name: 'minContentWidth', value: 300
      })
      globalThis.value.message.notify({
        name: 'minSideBarWidth', value: 200
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      expect(sideBarContent_01.left).assertEqual(SideBarContainer_01.left);
      console.log("sideBarContent_01.left" + sideBarContent_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(vp2px(200)));
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      expect(Math.round(sideBarContent_01.right - sideBarContent_01.left)).assertEqual(Math.round(vp2px(400)));
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      let strJson1 = getInspectorByKey('SideBarContainerType_SideBarContainer_01');

      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson1).$attrs.type).assertEqual('SideBarContainerType.OVERLAY');
      console.log(JSON.parse(strJson1).$attrs.type)

      console.info('[SUB_ACE_SideBarContainerType_0700] END');
      done();
    });

    // /**
    //  * @tc.number    SUB_ACE_SideBarContainerType_0800
    //  * @tc.name      testSideBarContainerAttribute
    //  * @tc.desc      SSet the property minContentWidth value to 100fp
    //  */
    // it('SUB_ACE_SideBarContainerType_0800', 0, async  (done: Function)=> {
    //   console.info('[SUB_ACE_SideBarContainerType_0800] START');
    //   globalThis.value.message.notify({name:'SideBarContainerType', value:SideBarContainerType.AUTO})
    //   globalThis.value.message.notify({name:'width1', value:200 + fp2vp(100)})
    //   globalThis.value.message.notify({name:'minContentWidth', value:'100fp'})
    //   globalThis.value.message.notify({name:'minSideBarWidth', value:200})
    //   globalThis.value.message.notify({name:'maxSideBarWidth', value:300})
    //   await CommonFunc.sleep(500);
    //   console.log("get Initial value")
    //   let SideBar_01 :RectValue= CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
    //   let sideBarContent_01 :RectValue= CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
    //   let SideBarContainer_01 :RectValue= CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');
    //
    //   console.log("assert position")
    //   expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
    //   console.log("SideBar_01.left" + SideBar_01.left)
    //   expect(sideBarContent_01.left).assertEqual(SideBarContainer_01.left);
    //   console.log("sideBarContent_01.left" + sideBarContent_01.left)
    //   console.log("SideBarContainer_01.left" + SideBarContainer_01.left)
    //
    //   console.log("assert width")
    //   expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(vp2px(200)));
    //   console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
    //   expect(Math.round(sideBarContent_01.right - sideBarContent_01.left)).assertEqual(Math.round(fp2px(100)));
    //   console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))
    //
    //   console.info('[SUB_ACE_SideBarContainerType_0800] END');
    //   done();
    // });
    //
    // /**
    //  * @tc.number    SUB_ACE_SideBarContainerType_0900
    //  * @tc.name      testSideBarContainerAttribute
    //  * @tc.desc      SSet the property minContentWidth value to 100lpx
    //  */
    // it('SUB_ACE_SideBarContainerType_0900', 0, async  (done: Function)=> {
    //   console.info('[SUB_ACE_SideBarContainerType_0900] START');
    //   globalThis.value.message.notify({name:'SideBarContainerType', value:SideBarContainerType.AUTO})
    //   globalThis.value.message.notify({name:'width1', value:200 + lpx2vp(100)})
    //   globalThis.value.message.notify({name:'minContentWidth', value:'100lpx'})
    //   globalThis.value.message.notify({name:'minSideBarWidth', value:200})
    //   globalThis.value.message.notify({name:'maxSideBarWidth', value:300})
    //   await CommonFunc.sleep(500);
    //   console.log("get Initial value")
    //   let SideBar_01 :RectValue= CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
    //   let sideBarContent_01 :RectValue= CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
    //   let SideBarContainer_01 :RectValue= CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');
    //
    //   console.log("assert position")
    //   expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
    //   console.log("SideBar_01.left" + SideBar_01.left)
    //   expect(sideBarContent_01.left).assertEqual(SideBarContainer_01.left);
    //   console.log("sideBarContent_01.left" + sideBarContent_01.left)
    //   console.log("SideBarContainer_01.left" + SideBarContainer_01.left)
    //
    //   console.log("assert width")
    //   expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(vp2px(200)));
    //   console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
    //   expect(Math.round(sideBarContent_01.right - sideBarContent_01.left)).assertEqual(Math.round(lpx2px(100)));
    //   console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))
    //
    //   console.info('[SUB_ACE_SideBarContainerType_0900] END');
    //   done();
    // });

    /**
     * @tc.number SUB_ACE_SideBarContainerType_1000
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SSet the property minContentWidth value to 100px
     */
    it('SUB_ACE_SideBarContainerType_1000', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_1000] START');
      globalThis.value.message.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.AUTO
      })
      globalThis.value.message.notify({
        name: 'width1', value: 200 + px2vp(100)
      })
      globalThis.value.message.notify({
        name: 'minContentWidth', value: '100px'
      })
      globalThis.value.message.notify({
        name: 'minSideBarWidth', value: 200
      })
      globalThis.value.message.notify({
        name: 'maxSideBarWidth', value: 300
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');


      console.log("assert width")
      expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(vp2px(200)));
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      expect(Math.round(sideBarContent_01.right - sideBarContent_01.left)).assertEqual(Math.round(100));
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      console.info('[SUB_ACE_SideBarContainerType_1000] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_SideBarContainerType_1100
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SSet the property minContentWidth value to 100vp
     */
    it('SUB_ACE_SideBarContainerType_1100', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_1100] START');
      globalThis.value.message.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.AUTO
      })
      globalThis.value.message.notify({
        name: 'width1', value: 300
      })
      globalThis.value.message.notify({
        name: 'minContentWidth', value: '100vp'
      })
      globalThis.value.message.notify({
        name: 'minSideBarWidth', value: 200
      })
      globalThis.value.message.notify({
        name: 'maxSideBarWidth', value: 300
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert width")
      expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(vp2px(200)));
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      expect(Math.round(sideBarContent_01.right - sideBarContent_01.left)).assertEqual(Math.round(vp2px(100)));
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      console.info('[SUB_ACE_SideBarContainerType_1100] END');
      done();
    });


    /**
     * @tc.number SUB_ACE_SideBarContainerType_1200
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SSet the property minContentWidth value to 0vp
     */
    it('SUB_ACE_SideBarContainerType_1200', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_1200] START');
      globalThis.value.message.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.AUTO
      })
      globalThis.value.message.notify({
        name: 'width1', value: 200
      })
      globalThis.value.message.notify({
        name: 'minContentWidth', value: '0vp'
      })
      globalThis.value.message.notify({
        name: 'minSideBarWidth', value: 200
      })
      globalThis.value.message.notify({
        name: 'maxSideBarWidth', value: 300
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert width")
      expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(vp2px(200)));
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      expect(Math.round(sideBarContent_01.right - sideBarContent_01.left)).assertEqual(Math.round(0));
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      console.info('[SUB_ACE_SideBarContainerType_1200] END');
      done();
    });


    /**
     * @tc.number SUB_ACE_SideBarContainerType_1300
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SSet the property minContentWidth value to 10%
     */
    it('SUB_ACE_SideBarContainerType_1300', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_1300] START');
      globalThis.value.message.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.AUTO
      })
      globalThis.value.message.notify({
        name: 'width1', value: 300
      })
      globalThis.value.message.notify({
        name: 'minContentWidth', value: '10%'
      })
      globalThis.value.message.notify({
        name: 'minSideBarWidth', value: 270
      })
      globalThis.value.message.notify({
        name: 'maxSideBarWidth', value: 300
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(vp2px(270))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(vp2px(30))) <= 1).assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      console.info('[SUB_ACE_SideBarContainerType_1300] END');
      done();
    });


    // /**
    //  * @tc.number    SUB_ACE_SideBarContainerType_1400
    //  * @tc.name      testSideBarContainerAttribute
    //  * @tc.desc      SSet the property minContentWidth value to 120%
    //  */
    // it('SUB_ACE_SideBarContainerType_1400', 0, async  (done: Function)=> {
    //   console.info('[SUB_ACE_SideBarContainerType_1400] START');
    //   globalThis.value.message.notify({name:'SideBarContainerType', value:SideBarContainerType.AUTO})
    //   globalThis.value.message.notify({name:'width1', value:300})
    //   globalThis.value.message.notify({name:'minContentWidth', value:'120%'})
    //   globalThis.value.message.notify({name:'minSideBarWidth', value:270})
    //   globalThis.value.message.notify({name:'maxSideBarWidth', value:300})
    //   await CommonFunc.sleep(500);
    //   console.log("get Initial value")
    //   let SideBar_01 :RectValue= CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
    //   let sideBarContent_01 :RectValue= CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
    //   let SideBarContainer_01 :RectValue= CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');
    //
    //
    //   console.log("assert width")
    //   expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(vp2px(270)));
    //   console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
    //   expect(Math.round(sideBarContent_01.right - sideBarContent_01.left)).assertEqual(Math.round(vp2px(360)));
    //   console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))
    //
    //   console.info('[SUB_ACE_SideBarContainerType_1400] END');
    //   done();
    // });

    /**
     * @tc.number SUB_ACE_SideBarContainerType_1500
     * @tc.name testSideBarContainerAttribute
     * @tc.desc SSet the property minContentWidth value to -10vp
     */
    it('SUB_ACE_SideBarContainerType_1500', 0, async (done: Function) => {
      console.info('[SUB_ACE_SideBarContainerType_1500] START');
      globalThis.value.message.notify({
        name: 'SideBarContainerType', value: SideBarContainerType.AUTO
      })
      globalThis.value.message.notify({
        name: 'width1', value: 560
      })
      globalThis.value.message.notify({
        name: 'minContentWidth', value: '-10vp'
      })
      globalThis.value.message.notify({
        name: 'minSideBarWidth', value: 200
      })
      globalThis.value.message.notify({
        name: 'maxSideBarWidth', value: 300
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_SideBarContainer_01');

      console.log("assert width")
      expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(vp2px(200)));
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      expect(Math.round(sideBarContent_01.right - sideBarContent_01.left)).assertEqual(Math.round(vp2px(360)));
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      console.info('[SUB_ACE_SideBarContainerType_1500] END');
      done();
    });


  })

}

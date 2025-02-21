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

export default function Stack_Position_Change() {
  describe('Stack_Position_ChangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Stack_Position_ChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Stack/StackItem_change/stack_position_change",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Stack_Position_Change state pages:" + JSON.stringify(pages));
        if (!("stack_position_change" == pages.name)) {
          console.info("get Stack_Position_Change pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Stack_Position_Change page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Stack_Position_Change page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Stack_Position_ChangeTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Stack_Position_Change after each called")
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0100
     * @tc.name testStackPositionChangeWithAlignmentTopStart
     * @tc.desc The stack component sets alignContent to Alignment.TopStart and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentTopStart', 0, async (done: Function) => {
      console.info('[testStackPositionChangeWithAlignmentTopStart] START');
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.left) - (Stack_Position_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Stack_Position_Change_012.top) - (Stack_Position_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentTopStart] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0200
     * @tc.name testStackPositionChangeWithAlignmentTop
     * @tc.desc The stack component sets alignContent to Alignment.Top and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentTop', 0, async (done: Function) => {
      console.info('[testStackPositionChangeWithAlignmentTop] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.top) - (Stack_Position_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.left - Stack_Position_Change_01.left)) - (Math.round(Stack_Position_Change_01.right - Stack_Position_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentTop] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0300
     * @tc.name testStackPositionChangeWithAlignmentTopEnd
     * @tc.desc The stack component sets alignContent to Alignment.TopEnd and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentTopEnd', 0, async (done: Function) => {
      console.info('[testStackPositionChangeWithAlignmentTopEnd] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.right) - (Stack_Position_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Stack_Position_Change_012.top) - (Stack_Position_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentTopEnd] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0400
     * @tc.name testStackPositionChangeWithAlignmentStart
     * @tc.desc The stack component sets alignContent to Alignment.Start and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentStart', 0, async (done: Function) => {
      console.info('[testStackPositionChangeWithAlignmentStart] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.left) - (Stack_Position_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.top - Stack_Position_Change_01.top)) - (Math.round(Stack_Position_Change_01.bottom - Stack_Position_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentStart] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0500
     * @tc.name testStackPositionChangeWithAlignmentCenter
     * @tc.desc The stack component sets alignContent to Alignment.Center and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentCenter', 0, async (done: Function) => {
      console.info('[testStackPositionChangeWithAlignmentCenter] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Math.round(Stack_Position_Change_012.left - Stack_Position_Change_01.left)) - (Math.round(Stack_Position_Change_01.right - Stack_Position_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.top - Stack_Position_Change_01.top)) - (Math.round(Stack_Position_Change_01.bottom - Stack_Position_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentCenter] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0600
     * @tc.name testStackPositionChangeWithAlignmentEnd
     * @tc.desc The stack component sets alignContent to Alignment.End and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentEnd', 0, async (done: Function) => {
      console.info('[testStackPositionChangeWithAlignmentEnd] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.End
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.right) - (Stack_Position_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.top - Stack_Position_Change_01.top)) - (Math.round(Stack_Position_Change_01.bottom - Stack_Position_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentEnd] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0700
     * @tc.name testStackPositionChangeWithAlignmentBottomStart
     * @tc.desc The stack component sets alignContent to Alignment.BottomStart and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentBottomStart', 0, async (done: Function) => {
      console.info('[testStackPositionChangeWithAlignmentBottomStart] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.left) - (Stack_Position_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Stack_Position_Change_012.bottom) - (Stack_Position_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentBottomStart] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0800
     * @tc.name testStackPositionChangeWithAlignmentBottom
     * @tc.desc The stack component sets alignContent to Alignment.Bottom and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentBottom', 0, async (done: Function) => {
      console.info('[testStackPositionChangeWithAlignmentBottom] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.bottom) - (Stack_Position_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.left - Stack_Position_Change_01.left)) - (Math.round(Stack_Position_Change_01.right - Stack_Position_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentBottom] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0900
     * @tc.name testStackPositionChangeWithAlignmentBottomEnd
     * @tc.desc The stack component sets alignContent to Alignment.BottomEnd and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentBottomEnd', 0, async (done: Function) => {
      console.info('[testStackPositionChangeWithAlignmentBottomEnd] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.bottom) - (Stack_Position_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Stack_Position_Change_012.right) - (Stack_Position_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentBottomEnd] END');
      done();
    });
  })
}

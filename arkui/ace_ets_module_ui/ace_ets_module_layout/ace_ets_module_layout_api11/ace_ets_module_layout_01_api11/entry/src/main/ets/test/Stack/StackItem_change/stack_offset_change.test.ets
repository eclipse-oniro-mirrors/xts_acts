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
import CommonFunc, { RectValue } from '../../../MainAbility/utils/Common';

export default function Stack_Offset_Change() {
  describe('Stack_Offset_ChangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Stack_Offset_ChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Stack/StackItem_change/stack_offset_change",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Stack_Offset_Change state pages:" + JSON.stringify(pages));
        if (!("stack_offset_change" == pages.name)) {
          console.info("get Stack_Offset_Change pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Stack_Offset_Change page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Stack_Offset_Change page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Stack_Offset_ChangeTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Stack_Offset_Change after each called")
    });
    /**
     * @tc.number SUB_ACE_STACK_OFFSET_CHANGE_TEST_0100
     * @tc.name testStackOffsetChangeWithAlignmentTopStart
     * @tc.desc The stack component sets alignContent to Alignment.TopStart and sets the offset of
     *               the first subcomponent
     */
    it('testStackOffsetChangeWithAlignmentTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackOffsetChangeWithAlignmentTopStart] START');
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.left) - (Stack_Offset_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Stack_Offset_Change_012.top) - (Stack_Offset_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.top - Stack_Offset_Change_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.left - Stack_Offset_Change_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentTopStart] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_OFFSET_CHANGE_TEST_0200
     * @tc.name testStackOffsetChangeWithAlignmentTop
     * @tc.desc The stack component sets alignContent to Alignment.Top and sets the offset of
     *               the first subcomponent
     */
    it('testStackOffsetChangeWithAlignmentTop',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackOffsetChangeWithAlignmentTop] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.top) - (Stack_Offset_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.left - Stack_Offset_Change_01.left)) - (Math.round(Stack_Offset_Change_01.right - Stack_Offset_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.top - Stack_Offset_Change_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.left - Stack_Offset_Change_01.left)) - (Math.round(vp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentTop] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_OFFSET_CHANGE_TEST_0300
     * @tc.name testStackOffsetChangeWithAlignmentTopEnd
     * @tc.desc The stack component sets alignContent to Alignment.TopEnd and sets the offset of
     *               the first subcomponent
     */
    it('testStackOffsetChangeWithAlignmentTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackOffsetChangeWithAlignmentTopEnd] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.right) - (Stack_Offset_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Stack_Offset_Change_012.top) - (Stack_Offset_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.top - Stack_Offset_Change_01.top)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_01.right)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentTopEnd] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_OFFSET_CHANGE_TEST_0400
     * @tc.name testStackOffsetChangeWithAlignmentStart
     * @tc.desc The stack component sets alignContent to Alignment.Start and sets the offset of
     *               the first subcomponent
     */
    it('testStackOffsetChangeWithAlignmentStart',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackOffsetChangeWithAlignmentStart] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.left) - (Stack_Offset_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.top - Stack_Offset_Change_01.top)) - (Math.round(Stack_Offset_Change_01.bottom - Stack_Offset_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.top - Stack_Offset_Change_01.top)) - (Math.round(vp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.left - Stack_Offset_Change_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentStart] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_OFFSET_CHANGE_TEST_0500
     * @tc.name testStackOffsetChangeWithAlignmentCenter
     * @tc.desc The stack component sets alignContent to Alignment.Center and sets the offset of
     *               the first subcomponent
     */
    it('testStackOffsetChangeWithAlignmentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackOffsetChangeWithAlignmentCenter] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Math.round(Stack_Offset_Change_012.left - Stack_Offset_Change_01.left)) - (Math.round(Stack_Offset_Change_01.right - Stack_Offset_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.top - Stack_Offset_Change_01.top)) - (Math.round(Stack_Offset_Change_01.bottom - Stack_Offset_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.top - Stack_Offset_Change_01.top)) - (Math.round(vp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.left - Stack_Offset_Change_01.left)) - (Math.round(vp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentCenter] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_OFFSET_CHANGE_TEST_0600
     * @tc.name testStackOffsetChangeWithAlignmentEnd
     * @tc.desc The stack component sets alignContent to Alignment.End and sets the offset of
     *               the first subcomponent
     */
    it('testStackOffsetChangeWithAlignmentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackOffsetChangeWithAlignmentEnd] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.End
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.right) - (Stack_Offset_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.top - Stack_Offset_Change_01.top)) - (Math.round(Stack_Offset_Change_01.bottom - Stack_Offset_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.top - Stack_Offset_Change_01.top)) - (Math.round(vp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_01.right)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentEnd] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_OFFSET_CHANGE_TEST_0700
     * @tc.name testStackOffsetChangeWithAlignmentBottomStart
     * @tc.desc The stack component sets alignContent to Alignment.BottomStart and sets the offset of
     *               the first subcomponent
     */
    it('testStackOffsetChangeWithAlignmentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackOffsetChangeWithAlignmentBottomStart] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.left) - (Stack_Offset_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Stack_Offset_Change_012.bottom) - (Stack_Offset_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_01.bottom)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.left - Stack_Offset_Change_01.left)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentBottomStart] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_OFFSET_CHANGE_TEST_0800
     * @tc.name testStackOffsetChangeWithAlignmentBottom
     * @tc.desc The stack component sets alignContent to Alignment.Bottom and sets the offset of
     *               the first subcomponent
     */
    it('testStackOffsetChangeWithAlignmentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackOffsetChangeWithAlignmentBottom] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.bottom) - (Stack_Offset_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.left - Stack_Offset_Change_01.left)) - (Math.round(Stack_Offset_Change_01.right - Stack_Offset_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_01.bottom)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.left - Stack_Offset_Change_01.left)) - (Math.round(vp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentBottom] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_OFFSET_CHANGE_TEST_0900
     * @tc.name testStackOffsetChangeWithAlignmentBottomEnd
     * @tc.desc The stack component sets alignContent to Alignment.BottomEnd and sets the offset of
     *               the first subcomponent
     */
    it('testStackOffsetChangeWithAlignmentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackOffsetChangeWithAlignmentBottomEnd] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_Offset_Change_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd');
      let Stack_Offset_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_011');
      let Stack_Offset_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_012');
      let Stack_Offset_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Offset_Change_01');
      expect(Math.abs((Stack_Offset_Change_012.bottom) - (Stack_Offset_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Stack_Offset_Change_012.right) - (Stack_Offset_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_01.bottom)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_01.right)) - (Math.round(vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.bottom - Stack_Offset_Change_011.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.bottom - Stack_Offset_Change_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_011.right - Stack_Offset_Change_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Offset_Change_012.right - Stack_Offset_Change_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackOffsetChangeWithAlignmentBottomEnd] END');
      done();
    });
  })
}

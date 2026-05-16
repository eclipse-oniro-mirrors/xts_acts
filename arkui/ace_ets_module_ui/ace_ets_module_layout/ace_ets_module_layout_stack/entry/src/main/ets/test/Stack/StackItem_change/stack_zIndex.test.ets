/**
 * Copyright (c) 2026 iSoftStone Information Technology (Group) Co.,Ltd.
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

export default function Stack_ZIndex() {
  describe('Stack_ZIndex_Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Stack_ZIndex beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Stack/StackItem_change/stack_zIndex",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Stack_ZIndex state pages:" + JSON.stringify(pages));
        if (!("stack_zIndex" == pages.name)) {
          console.info("get Stack_ZIndex pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Stack_ZIndex page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Stack_ZIndex page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Stack_ZIndex beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Stack_ZIndex after each called");
    });
    /**
     * @tc.number SUB_ACE_STACK_ZINDEX_TEST_0400
     * @tc.name testStackZIndexWithAlignmentStart
     * @tc.desc The stack component sets alignContent to Alignment.Start and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentStart',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackZIndexWithAlignmentStart] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let strJson_011 = getInspectorByKey('Stack_ZIndex_011');
      let strJson_012 = getInspectorByKey('Stack_ZIndex_012');
      let Stack_ZIndex_011_zIndex = JSON.stringify(JSON.parse(strJson_011).$attrs.zIndex);
      let Stack_ZIndex_012_zIndex = JSON.stringify(JSON.parse(strJson_012).$attrs.zIndex);
      console.log('[testStackZIndexWithAlignmentStart] Stack_ZIndex_011 zIndex is ', Stack_ZIndex_011_zIndex);
      console.log('[testStackZIndexWithAlignmentStart] Stack_ZIndex_012 zIndex is ', Stack_ZIndex_012_zIndex);
      
      console.log('Stack_ZIndex_01.left is', Stack_ZIndex_01.left);
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_011.left) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_012.left) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.top - Stack_ZIndex_01.top is', Stack_ZIndex_011.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_011.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.top - Stack_ZIndex_01.top is', Stack_ZIndex_012.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_012.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentStart] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_ZINDEX_TEST_0500
     * @tc.name testStackZIndexWithAlignmentCenter
     * @tc.desc The stack component sets alignContent to Alignment.Center and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackZIndexWithAlignmentCenter] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let strJson_011 = getInspectorByKey('Stack_ZIndex_011');
      let strJson_012 = getInspectorByKey('Stack_ZIndex_012');
      let Stack_ZIndex_011_zIndex = JSON.stringify(JSON.parse(strJson_011).$attrs.zIndex);
      let Stack_ZIndex_012_zIndex = JSON.stringify(JSON.parse(strJson_012).$attrs.zIndex);
      console.log('[testStackZIndexWithAlignmentCenter] Stack_ZIndex_011 zIndex is ', Stack_ZIndex_011_zIndex);
      console.log('[testStackZIndexWithAlignmentCenter] Stack_ZIndex_012 zIndex is ', Stack_ZIndex_012_zIndex);
      
      console.log('Stack_ZIndex_011.left - Stack_ZIndex_01.left is', Stack_ZIndex_011.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_011.left - Stack_ZIndex_01.left) -
      Math.round(Stack_ZIndex_01.right - Stack_ZIndex_011.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.left - Stack_ZIndex_01.left is', Stack_ZIndex_012.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_012.left - Stack_ZIndex_01.left) -
      Math.round(Stack_ZIndex_01.right - Stack_ZIndex_012.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.top - Stack_ZIndex_01.top is', Stack_ZIndex_011.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_011.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.top - Stack_ZIndex_01.top is', Stack_ZIndex_012.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_012.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentCenter] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_ZINDEX_TEST_0600
     * @tc.name testStackZIndexWithAlignmentEnd
     * @tc.desc The stack component sets alignContent to Alignment.End and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackZIndexWithAlignmentEnd] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let strJson_011 = getInspectorByKey('Stack_ZIndex_011');
      let strJson_012 = getInspectorByKey('Stack_ZIndex_012');
      let Stack_ZIndex_011_zIndex = JSON.stringify(JSON.parse(strJson_011).$attrs.zIndex);
      let Stack_ZIndex_012_zIndex = JSON.stringify(JSON.parse(strJson_012).$attrs.zIndex);
      console.log('[testStackZIndexWithAlignmentEnd] Stack_ZIndex_011 zIndex is ', Stack_ZIndex_011_zIndex);
      console.log('[testStackZIndexWithAlignmentEnd] Stack_ZIndex_012 zIndex is ', Stack_ZIndex_012_zIndex);
      
      console.log('Stack_ZIndex_01.right is', Stack_ZIndex_01.right);
      expect(Math.abs((Stack_ZIndex_01.right) - (Stack_ZIndex_011.right)) <= 1).assertTrue();
      expect(Math.abs((Stack_ZIndex_01.right) - (Stack_ZIndex_012.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.top - Stack_ZIndex_01.top is', Stack_ZIndex_011.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_011.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.top - Stack_ZIndex_01.top is', Stack_ZIndex_012.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_012.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentEnd] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_ZINDEX_TEST_0700
     * @tc.name testStackZIndexWithAlignmentBottomStart
     * @tc.desc The stack component sets alignContent to Alignment.BottomStart and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackZIndexWithAlignmentBottomStart] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let strJson_011 = getInspectorByKey('Stack_ZIndex_011');
      let strJson_012 = getInspectorByKey('Stack_ZIndex_012');
      let Stack_ZIndex_011_zIndex = JSON.stringify(JSON.parse(strJson_011).$attrs.zIndex);
      let Stack_ZIndex_012_zIndex = JSON.stringify(JSON.parse(strJson_012).$attrs.zIndex);
      console.log('[testStackZIndexWithAlignmentBottomStart] Stack_ZIndex_011 zIndex is ', Stack_ZIndex_011_zIndex);
      console.log('[testStackZIndexWithAlignmentBottomStart] Stack_ZIndex_012 zIndex is ', Stack_ZIndex_012_zIndex);
      
      console.log('Stack_ZIndex_01.left is', Stack_ZIndex_01.left);
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_011.left) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_012.left) <= 1).assertTrue();
      console.log('Stack_ZIndex_01.bottom is', Stack_ZIndex_01.bottom);
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentBottomStart] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_ZINDEX_TEST_0800
     * @tc.name testStackZIndexWithAlignmentBottom
     * @tc.desc The stack component sets alignContent to Alignment.Bottom and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackZIndexWithAlignmentBottom] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let strJson_011 = getInspectorByKey('Stack_ZIndex_011');
      let strJson_012 = getInspectorByKey('Stack_ZIndex_012');
      let Stack_ZIndex_011_zIndex = JSON.stringify(JSON.parse(strJson_011).$attrs.zIndex);
      let Stack_ZIndex_012_zIndex = JSON.stringify(JSON.parse(strJson_012).$attrs.zIndex);
      console.log('[testStackZIndexWithAlignmentBottom] Stack_ZIndex_011 zIndex is ', Stack_ZIndex_011_zIndex);
      console.log('[testStackZIndexWithAlignmentBottom] Stack_ZIndex_012 zIndex is ', Stack_ZIndex_012_zIndex);
      
      console.log('Stack_ZIndex_01.bottom is', Stack_ZIndex_01.bottom);
      expect(Math.abs((Stack_ZIndex_01.bottom) - (Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      expect(Math.abs((Stack_ZIndex_01.bottom) - (Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.left - Stack_ZIndex_01.left is', Stack_ZIndex_011.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_011.left - Stack_ZIndex_01.left) -
      Math.round(Stack_ZIndex_01.right - Stack_ZIndex_011.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.left - Stack_ZIndex_01.left is', Stack_ZIndex_012.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_012.left - Stack_ZIndex_01.left) -
      Math.round(Stack_ZIndex_01.right - Stack_ZIndex_012.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentBottom] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_ZINDEX_TEST_0900
     * @tc.name testStackZIndexWithAlignmentBottomEnd
     * @tc.desc The stack component sets alignContent to Alignment.BottomEnd and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('[testStackZIndexWithAlignmentBottomEnd] START');
      globalThis.value.message.notify({
        name: 'addAlignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let strJson_011 = getInspectorByKey('Stack_ZIndex_011');
      let strJson_012 = getInspectorByKey('Stack_ZIndex_012');
      let Stack_ZIndex_011_zIndex = JSON.stringify(JSON.parse(strJson_011).$attrs.zIndex);
      let Stack_ZIndex_012_zIndex = JSON.stringify(JSON.parse(strJson_012).$attrs.zIndex);
      console.log('[testStackZIndexWithAlignmentBottomEnd] Stack_ZIndex_011 zIndex is ', Stack_ZIndex_011_zIndex);
      console.log('[testStackZIndexWithAlignmentBottomEnd] Stack_ZIndex_012 zIndex is ', Stack_ZIndex_012_zIndex);
      
      console.log('Stack_ZIndex_01.bottom is', Stack_ZIndex_01.bottom);
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom) <= 1).assertTrue();
      console.log('Stack_ZIndex_01.right is', Stack_ZIndex_01.right);
      expect(Math.abs(Stack_ZIndex_01.right - Stack_ZIndex_011.right) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.right - Stack_ZIndex_012.right) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentBottomEnd] END');
      done();
    });
  })
}

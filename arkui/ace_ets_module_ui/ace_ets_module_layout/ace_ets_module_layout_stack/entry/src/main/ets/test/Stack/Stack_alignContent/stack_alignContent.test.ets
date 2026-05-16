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
import CommonFunc, {RectValue} from '../../../MainAbility/utils/Common';
export default function Stack_AlignContent() {
  describe('Stack_AlignContent_Test',  ()=> {
    beforeEach(async  (done: Function)=> {
      console.info("Stack_AlignContent_Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Stack/Stack_alignContent/stack_alignContent",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Stack_AlignContent state pages:" + JSON.stringify(pages));
        if (!("stack_alignContent" == pages.name)) {
          console.info("get stack_alignContent pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push stack_alignContent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stack_alignContent page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Stack_AlignContent_Test beforeEach end");
      done();
    });
    afterEach(async  () =>{
      await CommonFunc.sleep(2000);
      console.info("stack_alignContent after each called")
    });
    /**
     * @tc.name   testStackAlignContentDefault
     * @tc.number SUB_ACE_STACK_ALIGNCONTENT_TEST_0100
     * @tc.desc   The stack component does not set alignContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignContentDefault',  Level.LEVEL0, async  (done: Function)=> {
      console.info('[testStackAlignContentDefault] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Stack_AlignContent_01');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center');
      let stack_alignContent_011:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_011');
      let stack_alignContent_012:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_012');
      let stack_alignContent_013:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_013');
      let stack_alignContent_01:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_01');
      expect(Math.abs((stack_alignContent_011.left - stack_alignContent_01.left) - (stack_alignContent_01.right - stack_alignContent_011.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_012.left - stack_alignContent_01.left) - (stack_alignContent_01.right - stack_alignContent_012.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_013.left - stack_alignContent_01.left) - (stack_alignContent_01.right - stack_alignContent_013.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_011.top - stack_alignContent_01.top) - (stack_alignContent_01.bottom - stack_alignContent_011.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_012.top - stack_alignContent_01.top) - (stack_alignContent_01.bottom - stack_alignContent_012.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_013.top - stack_alignContent_01.top) - (stack_alignContent_01.bottom - stack_alignContent_013.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_011.bottom - stack_alignContent_011.top)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_012.bottom - stack_alignContent_012.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_013.bottom - stack_alignContent_013.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_011.right - stack_alignContent_011.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_012.right - stack_alignContent_012.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_013.right - stack_alignContent_013.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentDefault] END');
      done();
    });
    /**
     * @tc.name   testStackAlignContentTopStart
     * @tc.number SUB_ACE_stack_alignContent_TEST_0200
     * @tc.desc   The stack component sets alignContent to Alignment.TopStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignContentTopStart',  Level.LEVEL0, async  (done: Function)=> {
      console.info('[testStackAlignContentTopStart] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.TopStart });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentTopStart] END');
      done();
    });
    /**
     * @tc.name   testStackAlignContentTop
     * @tc.number SUB_ACE_stack_alignContent_TEST_0300
     * @tc.desc   The stack component sets alignContent to Alignment.Top
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignContentTop',  Level.LEVEL0, async  (done: Function)=> {
      console.info('[testStackAlignContentTop] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.Top });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_021.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_022.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_023.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentTop] END');
      done();
    });
    /**
     * @tc.name   testStackAlignContentTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNCONTENT_TEST_0400
     * @tc.desc   The stack component sets alignContent to Alignment.TopEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignContentTopEnd',  Level.LEVEL0, async  (done: Function)=> {
      console.info('[testStackAlignContentTopEnd] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.TopEnd });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentTopEnd] END');
      done();
    });
    /**
     * @tc.name   testStackAlignContentStart
     * @tc.number SUB_ACE_STACK_ALIGNCONTENT_TEST_0500
     * @tc.desc   The stack component sets alignContent to Alignment.Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignContentStart',  Level.LEVEL0, async  (done: Function)=> {
      console.info('[testStackAlignContentStart] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.Start });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_021.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_022.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_023.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentStart] END');
      done();
    });
    /**
     * @tc.name   testStackAlignContentCenter
     * @tc.number SUB_ACE_STACK_ALIGNCONTENT_TEST_0600
     * @tc.desc   The stack component sets alignContent to Alignment.Center
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignContentCenter',  Level.LEVEL0, async  (done: Function)=> {
      console.info('[testStackAlignContentCenter] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.Center });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_021.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_022.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_023.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_021.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_022.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_023.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentCenter] END');
      done();
    });
    /**
     * @tc.name   testStackAlignContentEnd
     * @tc.number SUB_ACE_STACK_ALIGNCONTENT_TEST_0700
     * @tc.desc   The stack component sets alignContent to Alignment.End
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignContentEnd',  Level.LEVEL0, async  (done: Function)=> {
      console.info('[testStackAlignContentEnd] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.End });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_021.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_022.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_023.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentEnd] END');
      done();
    });
    /**
     * @tc.name   testStackAlignContentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNCONTENT_TEST_0800
     * @tc.desc   The stack component sets alignContent to Alignment.BottomStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignContentBottomStart',  Level.LEVEL0, async  (done: Function)=> {
      console.info('[testStackAlignContentBottomStart] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.BottomStart });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentBottomStart] END');
      done();
    });
    /**
     * @tc.name   testStackAlignContentBottom
     * @tc.number SUB_ACE_STACK_ALIGNCONTENT_TEST_0900
     * @tc.desc   The stack component sets alignContent to Alignment.Bottom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignContentBottom',  Level.LEVEL0, async  (done: Function)=> {
      console.info('[testStackAlignContentBottom] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.Bottom });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_021.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_022.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_023.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentBottom] END');
      done();
    });
    /**
     * @tc.name   testStackAlignContentBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNCONTENT_TEST_1000
     * @tc.desc   The stack component sets alignContent to Alignment.BottomEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignContentBottomEnd',  Level.LEVEL0, async  (done: Function)=> {
      console.info('[testStackAlignContentBottomEnd] START');
      globalThis.value.message.notify({ name: 'addAlignContent', value: Alignment.BottomEnd });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parse(strJson).$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentBottomEnd] END');
      done();
    });
  })
}

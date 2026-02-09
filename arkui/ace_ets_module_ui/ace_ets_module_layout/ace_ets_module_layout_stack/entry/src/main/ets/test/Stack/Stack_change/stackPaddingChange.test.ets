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
import CommonFunc, { RectValue } from "../../../MainAbility/utils/Common";
import { MessageManager, Callback } from '../../../MainAbility/utils/MessageManager';

export default function stackPaddingChange() {
  describe('stackPaddingChangeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackPaddingChange',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get stackPaddingChange state success " + JSON.stringify(pages));
        if (!("stackPaddingChange" == pages.name)) {
          console.info("get stackPaddingChange state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push stackPaddingChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stackPaddingChange page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("stackPaddingChange after each called");
    });

    /**
     * @tc.name   testStackAlignPaddingAlignTopStart
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0100
     * @tc.desc   Set stack's  padding 10  and alignContent mode 'TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingAlignTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingAlignTopStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignPaddingAlignTopStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingAlignTop
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0200
     * @tc.desc   Set stack's  padding 10  and alignContent mode 'Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingAlignTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingAlignTop START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackAlignPaddingAlignTop END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingAlignTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0300
     * @tc.desc   Set stack's  padding 10  and alignContent mode 'TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingAlignTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingAlignTopEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignPaddingAlignTopEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingAlignStart
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0400
     * @tc.desc   Set stack's  padding 10  and alignContent mode 'START'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingAlignStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingAlignStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackAlignPaddingAlignStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingAlignCenter
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0500
     * @tc.desc   Set stack's  padding 10  and alignContent mode 'Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingAlignCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingAlignCenter START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1).assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackAlignPaddingAlignCenter END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingAlignEnd
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0600
     * @tc.desc   Set stack's  padding 10  and alignContent mode 'End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingAlignEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingAlignEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1).assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackAlignPaddingAlignEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingAlignBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0700
     * @tc.desc   Set stack's  padding 10  and alignContent mode 'BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingAlignBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingAlignBottomStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignPaddingAlignBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingAlignBottom
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0800
     * @tc.desc   Set stack's  padding 10  and alignContent mode 'Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingAlignBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingAlignBottom START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignPaddingAlignBottom END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingAlignBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0900
     * @tc.desc   Set stack's  padding 10  and alignContent mode 'BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingAlignBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingAlignBottomEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignPaddingAlignBottomEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingExceedAlignTopStart
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1000
     * @tc.desc   Set stack's  padding 30  and alignContent mode 'TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingExceedAlignTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingExceedAlignTopStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignPaddingExceedAlignTopStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingExceedAlignTop
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1100
     * @tc.desc   Set stack's  padding 30  and alignContent mode 'Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingExceedAlignTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingExceedAlignTop START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackAlignPaddingExceedAlignTop END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingExceedAlignTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1200
     * @tc.desc   Set stack's  padding 30  and alignContent mode 'TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingExceedAlignTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingExceedAlignTopEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignPaddingExceedAlignTopEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingExceedAlignStart
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1300
     * @tc.desc   Set stack's  padding 30  and alignContent mode 'START'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingExceedAlignStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingExceedAlignStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackAlignPaddingExceedAlignStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingExceedAlignCenter
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1400
     * @tc.desc   Set stack's  padding 30  and alignContent mode 'Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingExceedAlignCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingExceedAlignCenter START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackAlignPaddingExceedAlignCenter END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingExceedAlignEnd
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1500
     * @tc.desc   Set stack's  padding 30  and alignContent mode 'End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingExceedAlignEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingExceedAlignEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackAlignPaddingExceedAlignEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingExceedAlignBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1600
     * @tc.desc   Set stack's  padding 30  and alignContent mode 'BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingExceedAlignBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingExceedAlignBottomStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignPaddingExceedAlignBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingExceedAlignBottom
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1700
     * @tc.desc   Set stack's  padding 30  and alignContent mode 'Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingExceedAlignBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingExceedAlignBottom START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left)- vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignPaddingExceedAlignBottom END');
      done();
    });

    /**
     * @tc.name   testStackAlignPaddingExceedAlignBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1800
     * @tc.desc   Set stack's  padding 30  and alignContent mode 'BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignPaddingExceedAlignBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignPaddingExceedAlignBottomEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignPaddingExceedAlignBottomEnd END');
      done();
    });
  })
}
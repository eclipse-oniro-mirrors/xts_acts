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

export default function stackSizeChange() {
  describe('stackSizeChangeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackSizeChange',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get stackSizeChange state success " + JSON.stringify(pages));
        if (!("stackSizeChange" == pages.name)) {
          console.info("get stackSizeChange state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push stackSizeChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stackSizeChange page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("stackSizeChange after each called");
    });

    /**
     * @tc.name   testStackLargerAlignContentTopStart
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0100
     * @tc.desc   Set stack's  height and width 300*300 and alignContent mode 'TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLargerAlignContentTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLargerAlignContentTopStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'height', value: 300
      });
      globalThis.value.message.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackLargerAlignContentTopStart END');
      done();
    });

    /**
     * @tc.name   testStackLargerAlignContentTop
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0200
     * @tc.desc   Set stack's  height and width 300*300 and alignContent mode 'Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLargerAlignContentTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLargerAlignContentTop START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'height', value: 300
      });
      globalThis.value.message.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackLargerAlignContentTop END');
      done();
    });

    /**
     * @tc.name   testStackLargerAlignContentTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0300
     * @tc.desc   Set stack's  height and width 300*300 and alignContent mode 'TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLargerAlignContentTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLargerAlignContentTopEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'height', value: 300
      });
      globalThis.value.message.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackLargerAlignContentTopEnd END');
      done();
    });

    /**
     * @tc.name   testStackLargerAlignContentStart
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0400
     * @tc.desc   Set stack's  height and width 300*300 and alignContent mode 'START'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLargerAlignContentStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLargerAlignContentStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'height', value: 300
      });
      globalThis.value.message.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackLargerAlignContentStart END');
      done();
    });

    /**
     * @tc.name   testStackLargerAlignContentCenter
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0500
     * @tc.desc   Set stack's  height and width 300*300 and alignContent mode 'Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLargerAlignContentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLargerAlignContentCenter START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'height', value: 300
      });
      globalThis.value.message.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackLargerAlignContentCenter END');
      done();
    });

    /**
     * @tc.name   testStackLargerAlignContentEnd
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0600
     * @tc.desc   Set stack's  height and width 300*300 and alignContent mode 'End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLargerAlignContentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLargerAlignContentEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'height', value: 300
      });
      globalThis.value.message.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackLargerAlignContentEnd END');
      done();
    });

    /**
     * @tc.name   testStackLargerAlignContentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0700
     * @tc.desc   Set stack's  height and width 300*300 and alignContent mode 'BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLargerAlignContentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLargerAlignContentBottomStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'height', value: 300
      });
      globalThis.value.message.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackLargerAlignContentBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackLargerAlignContentBottom
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0800
     * @tc.desc   Set stack's  height and width 300*300 and alignContent mode 'Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLargerAlignContentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLargerAlignContentBottom START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'height', value: 300
      });
      globalThis.value.message.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackLargerAlignContentBottom END');
      done();
    });

    /**
     * @tc.name   testStackLargerAlignContentBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0900
     * @tc.desc   Set stack's  height and width 300*300 and alignContent mode 'BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLargerAlignContentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLargerAlignContentBottomEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'height', value: 300
      });
      globalThis.value.message.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackLargerAlignContentBottomEnd END');
      done();
    });

    /**
     * @tc.name   testStackEqualAlignContentBottomTopStart
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1000
     * @tc.desc   Set stack's  height and width 200*200 and alignContent mode 'TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackEqualAlignContentBottomTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackEqualAlignContentBottomTopStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'height', value: 200
      });
      globalThis.value.message.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackEqualAlignContentBottomTopStart END');
      done();
    });

    /**
     * @tc.name   testStackEqualAlignContentBottomTop
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1100
     * @tc.desc   Set stack's  height and width 200*200 and alignContent mode 'Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackEqualAlignContentBottomTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackEqualAlignContentBottomTop START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'height', value: 200
      });
      globalThis.value.message.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackEqualAlignContentBottomTop END');
      done();
    });

    /**
     * @tc.name   testStackEqualAlignContentBottomTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1200
     * @tc.desc   Set stack's  height and width 200*200 and alignContent mode 'TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackEqualAlignContentBottomTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackEqualAlignContentBottomTopEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'height', value: 200
      });
      globalThis.value.message.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackEqualAlignContentBottomTopEnd END');
      done();
    });

    /**
     * @tc.name   testStackEqualAlignContentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1300
     * @tc.desc   Set stack's  height and width 200*200 and alignContent mode 'START'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackEqualAlignContentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackEqualAlignContentBottomStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'height', value: 200
      });
      globalThis.value.message.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackEqualAlignContentBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackEqualAlignContentCenter
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1400
     * @tc.desc   Set stack's  height and width 200*200 and alignContent mode 'Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackEqualAlignContentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackEqualAlignContentCenter START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'height', value: 200
      });
      globalThis.value.message.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackEqualAlignContentCenter END');
      done();
    });

    /**
     * @tc.name   testStackEqualAlignContentEnd
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1500
     * @tc.desc   Set stack's  height and width 200*200 and alignContent mode 'End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackEqualAlignContentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackEqualAlignContentEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'height', value: 200
      });
      globalThis.value.message.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackEqualAlignContentEnd END');
      done();
    });

    /**
     * @tc.name   testStackEqualAlignContentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1600
     * @tc.desc   Set stack's  height and width 200*200 and alignContent mode 'BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackEqualAlignContentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackEqualAlignContentBottomStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'height', value: 200
      });
      globalThis.value.message.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackEqualAlignContentBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackEqualAlignContentBottom
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1700
     * @tc.desc   Set stack's  height and width 200*200 and alignContent mode 'Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackEqualAlignContentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackEqualAlignContentBottom START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'height', value: 200
      });
      globalThis.value.message.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackEqualAlignContentBottom END');
      done();
    });

    /**
     * @tc.name   testStackEqualAlignContentBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1800
     * @tc.desc   Set stack's  height and width 200*200 and alignContent mode 'BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackEqualAlignContentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackEqualAlignContentBottomEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'height', value: 200
      });
      globalThis.value.message.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackEqualAlignContentBottomEnd END');
      done();
    });

    /**
     * @tc.name   testStackLessAlignContentTopStart
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1900
     * @tc.desc   Set stack's  height and width 100*100 and alignContent mode 'TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLessAlignContentTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLessAlignContentTopStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'height', value: 100
      });
      globalThis.value.message.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackLessAlignContentTopStart END');
      done();
    });

    /**
     * @tc.name   testStackLessAlignContentTop
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2000
     * @tc.desc   Set stack's  height and width 100*100 and alignContent mode 'Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLessAlignContentTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLessAlignContentTop START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'height', value: 100
      });
      globalThis.value.message.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackLessAlignContentTop END');
      done();
    });

    /**
     * @tc.name   testStackLessAlignContentTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2100
     * @tc.desc   Set stack's  height and width 100*100 and alignContent mode 'TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLessAlignContentTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLessAlignContentTopEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'height', value: 100
      });
      globalThis.value.message.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackLessAlignContentTopEnd END');
      done();
    });

    /**
     * @tc.name   testStackLessAlignContentStart
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2200
     * @tc.desc   Set stack's  height and width 100*100 and alignContent mode 'START'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLessAlignContentStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLessAlignContentStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'height', value: 100
      });
      globalThis.value.message.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackLessAlignContentStart END');
      done();
    });

    /**
     * @tc.name   testStackLessAlignContentCenter
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2300
     * @tc.desc   Set stack's  height and width 100*100 and alignContent mode 'Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLessAlignContentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLessAlignContentCenter START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'height', value: 100
      });
      globalThis.value.message.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackLessAlignContentCenter END');
      done();
    });

    /**
     * @tc.name   testStackLessAlignContentEnd
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2400
     * @tc.desc   Set stack's  height and width 100*100 and alignContent mode 'End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLessAlignContentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLessAlignContentEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'height', value: 100
      });
      globalThis.value.message.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackLessAlignContentEnd END');
      done();
    });

    /**
     * @tc.name   testStackLessAlignContentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2500
     * @tc.desc   Set stack's  height and width 100*100 and alignContent mode 'BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLessAlignContentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLessAlignContentBottomStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'height', value: 100
      });
      globalThis.value.message.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackLessAlignContentBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackLessAlignContentBottom
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2600
     * @tc.desc   Set stack's  height and width 100*100 and alignContent mode 'Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLessAlignContentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLessAlignContentBottom START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'height', value: 100
      });
      globalThis.value.message.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackLessAlignContentBottom END');
      done();
    });

    /**
     * @tc.name   testStackLessAlignContentBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2700
     * @tc.desc   Set stack's  height and width 100*100 and alignContent mode 'BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackLessAlignContentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackLessAlignContentBottomEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'height', value: 100
      });
      globalThis.value.message.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackLessAlignContentBottomEnd END');
      done();
    });
  })
}
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

export default function stackAlignChange() {
  describe('stackAlignChangeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackAlignChange',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get stackAlignChange state success " + JSON.stringify(pages));
        if (!("stackAlignChange" == pages.name)) {
          console.info("get stackAlignChange state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push stackAlignChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stackAlignChange page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("stackAlignChangeTop after each called");
    });


    /**
     * @tc.name   testStackAlignTopStartAlignmentTopStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0100
     * @tc.desc   Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopStartAlignmentTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopStartAlignmentTopStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentTopStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopStartAlignmentTop
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0200
     * @tc.desc   Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopStartAlignmentTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopStartAlignmentTop START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentTop END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopStartAlignmentEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0300
     * @tc.desc   Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopStartAlignmentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopStartAlignmentEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopStartAlignmentStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0400
     * @tc.desc   Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.Start'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopStartAlignmentStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopStartAlignmentStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopStartAlignmentCenter
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0500
     * @tc.desc   Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopStartAlignmentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopStartAlignmentCenter START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart")
      console.info('new testStackAlignTopStartAlignmentCenter END');
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      done();
    });

    /**
     * @tc.name   testStackAlignTopStartAlignmentEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0600
     * @tc.desc   Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopStartAlignmentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopStartAlignmentEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopStartAlignmentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0700
     * @tc.desc   Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopStartAlignmentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopStartAlignmentBottomStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopStartAlignmentBottom
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0800
     * @tc.desc   Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopStartAlignmentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopStartAlignmentBottom START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentBottom END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopStartAlignmentBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0900
     * @tc.desc   Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopStartAlignmentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopStartAlignmentBottomEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopAlignmentTopStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1000
     * @tc.desc   Parent component set align 'Alignment.Top' and alignContent 'Alignment.TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopAlignmentTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopAlignmentTopStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Top")
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentTopStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopAlignmentTop
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1100
     * @tc.desc   Parent component set align 'Alignment.Top' and alignContent 'Alignment.Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopAlignmentTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopAlignmentTop START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Top")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentTop END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopAlignmentTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1200
     * @tc.desc   Parent component set align 'Alignment.Top' and alignContent 'Alignment.TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopAlignmentTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopAlignmentTopEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Top")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopAlignmentStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1300
     * @tc.desc   Parent component set align 'Alignment.Top' and alignContent 'Alignment.Start'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopAlignmentStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopAlignmentStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Top")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopAlignmentCenter
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1400
     * @tc.desc   Parent component set align 'Alignment.Top' and alignContent 'Alignment.Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopAlignmentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopAlignmentCenter START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Top")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentCenter END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopAlignmentEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1500
     * @tc.desc   Parent component set align 'Alignment.Top' and alignContent 'Alignment.End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopAlignmentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopAlignmentEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Top")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopAlignmentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1600
     * @tc.desc   Parent component set align 'Alignment.Top' and alignContent 'Alignment.BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopAlignmentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopAlignmentBottomStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Top")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopAlignmentBottom
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1700
     * @tc.desc   Parent component set align 'Alignment.Top' and alignContent 'Alignment.Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopAlignmentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopAlignmentBottom START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Top")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentBottom END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopAlignmentBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1800
     * @tc.desc   Parent component set align 'Alignment.Top' and alignContent 'Alignment.BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopAlignmentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopAlignmentBottomEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Top
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Top")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopEndAlignmentTopStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1900
     * @tc.desc   Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopEndAlignmentTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopEndAlignmentTopStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentTopStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopEndAlignmentTop
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2000
     * @tc.desc   Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopEndAlignmentTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopEndAlignmentTop START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentTop END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopEndAlignmentTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2100
     * @tc.desc   Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopEndAlignmentTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopEndAlignmentTopEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopEndAlignmentStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2200
     * @tc.desc   Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.Start'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopEndAlignmentStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopEndAlignmentStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopEndAlignmentCenter
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2300
     * @tc.desc   Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopEndAlignmentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopEndAlignmentCenter START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentCenter END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopEndAlignmentEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2400
     * @tc.desc   Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopEndAlignmentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopEndAlignmentEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopEndAlignmentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2500
     * @tc.desc   Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopEndAlignmentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopEndAlignmentBottomStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopEndAlignmentBottom
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2600
     * @tc.desc   Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopEndAlignmentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopEndAlignmentBottom START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentBottom END');
      done();
    });

    /**
     * @tc.name   testStackAlignTopEndAlignmentBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2700
     * @tc.desc   Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignTopEndAlignmentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignTopEndAlignmentBottomEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.TopEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignStartAlignmentTopStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2800
     * @tc.desc   Parent component set align 'Alignment.Start' and alignContent 'Alignment.TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignStartAlignmentTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignStartAlignmentTopStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Start")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentTopStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignStartAlignmentTop
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2900
     * @tc.desc   Parent component set align 'Alignment.Start' and alignContent 'Alignment.Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignStartAlignmentTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignStartAlignmentTop START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Start")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentTop END');
      done();
    });

    /**
     * @tc.name   testStackAlignStartAlignmentTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3000
     * @tc.desc   Parent component set align 'Alignment.Start' and alignContent 'Alignment.TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignStartAlignmentTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignStartAlignmentTopEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Start")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignStartAlignmentStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3100
     * @tc.desc   Parent component set align 'Alignment.Start' and alignContent 'Alignment.Start'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignStartAlignmentStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignStartAlignmentStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Start")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignStartAlignmentCenter
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3200
     * @tc.desc   Parent component set align 'Alignment.Start' and alignContent 'Alignment.Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignStartAlignmentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignStartAlignmentCenter START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Start")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentCenter END');
      done();
    });

    /**
     * @tc.name   testStackAlignStartAlignmentEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3300
     * @tc.desc   Parent component set align 'Alignment.Start' and alignContent 'Alignment.End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignStartAlignmentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignStartAlignmentEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Start")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignStartAlignmentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3400
     * @tc.desc   Parent component set align 'Alignment.Start' and alignContent 'Alignment.BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignStartAlignmentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignStartAlignmentBottomStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Start")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignStartAlignmentBottom
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3500
     * @tc.desc   Parent component set align 'Alignment.Start' and alignContent 'Alignment.Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignStartAlignmentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignStartAlignmentBottom START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Start")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentBottom END');
      done();
    });

    /**
     * @tc.name   testStackAlignStartAlignmentBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3600
     * @tc.desc   Parent component set align 'Alignment.Start' and alignContent 'Alignment.BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignStartAlignmentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignStartAlignmentBottomEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Start
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Start")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignCenterAlignmentTopStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3700
     * @tc.desc   Parent component set align 'Alignment.Center' and alignContent 'Alignment.TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignCenterAlignmentTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignCenterAlignmentTopStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentTopStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignCenterAlignmentTop
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3800
     * @tc.desc   Parent component set align 'Alignment.Center' and alignContent 'Alignment.Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignCenterAlignmentTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignCenterAlignmentTop START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentTop END');
      done();
    });

    /**
     * @tc.name   testStackAlignCenterAlignmentTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3900
     * @tc.desc   Parent component set align 'Alignment.Center' and alignContent 'Alignment.TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignCenterAlignmentTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignCenterAlignmentTopEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignCenterAlignmentStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4000
     * @tc.desc   Parent component set align 'Alignment.Center' and alignContent 'Alignment.Start'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignCenterAlignmentStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignCenterAlignmentStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignCenterAlignmentCenter
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4100
     * @tc.desc   Parent component set align 'Alignment.Center' and alignContent 'Alignment.Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignCenterAlignmentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignCenterAlignmentCenter START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentCenter END');
      done();
    });

    /**
     * @tc.name   testStackAlignCenterAlignmentEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4200
     * @tc.desc   Parent component set align 'Alignment.Center' and alignContent 'Alignment.End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignCenterAlignmentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignCenterAlignmentEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignCenterAlignmentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4300
     * @tc.desc   Parent component set align 'Alignment.Center' and alignContent 'Alignment.BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignCenterAlignmentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignCenterAlignmentBottomStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignCenterAlignmentBottom
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4400
     * @tc.desc   Parent component set align 'Alignment.Center' and alignContent 'Alignment.Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignCenterAlignmentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignCenterAlignmentBottom START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentBottom END');
      done();
    });

    /**
     * @tc.name   testStackAlignCenterAlignmentBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4500
     * @tc.desc   Parent component set align 'Alignment.Center' and alignContent 'Alignment.BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignCenterAlignmentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignCenterAlignmentBottomEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Center
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignEndAlignmentTopStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4600
     * @tc.desc   Parent component set align 'Alignment.End' and alignContent 'Alignment.TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignEndAlignmentTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignEndAlignmentTopStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.End")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentTopStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignEndAlignmentTop
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4700
     * @tc.desc   Parent component set align 'Alignment.End' and alignContent 'Alignment.Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignEndAlignmentTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignEndAlignmentTop START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.End")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentTop END');
      done();
    });

    /**
     * @tc.name   testStackAlignEndAlignmentTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4800
     * @tc.desc   Parent component set align 'Alignment.End' and alignContent 'Alignment.TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignEndAlignmentTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignEndAlignmentTopEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.End")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignEndAlignmentStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4900
     * @tc.desc   Parent component set align 'Alignment.End' and alignContent 'Alignment.Start'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignEndAlignmentStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignEndAlignmentStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.End")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignEndAlignmentCenter
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5000
     * @tc.desc   Parent component set align 'Alignment.End' and alignContent 'Alignment.Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignEndAlignmentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignEndAlignmentCenter START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.End")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentCenter END');
      done();
    });

    /**
     * @tc.name   testStackAlignEndAlignmentEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5100
     * @tc.desc   Parent component set align 'Alignment.End' and alignContent 'Alignment.End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignEndAlignmentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignEndAlignmentEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.End")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignEndAlignmentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5200
     * @tc.desc   Parent component set align 'Alignment.End' and alignContent 'Alignment.BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignEndAlignmentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignEndAlignmentBottomStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.End")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignEndAlignmentBottom
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5300
     * @tc.desc   Parent component set align 'Alignment.End' and alignContent 'Alignment.Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignEndAlignmentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignEndAlignmentBottom START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.End")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentBottom END');
      done();
    });

    /**
     * @tc.name   testStackAlignEndAlignmentBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5400
     * @tc.desc   Parent component set align 'Alignment.End' and alignContent 'Alignment.BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignEndAlignmentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignEndAlignmentBottomEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.End
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.End")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomStartAlignmentTopStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5500
     * @tc.desc   Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomStartAlignmentTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomStartAlignmentTopStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue()

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentTopStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomStartAlignmentTop
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5600
     * @tc.desc   Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomStartAlignmentTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomStartAlignmentTop START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentTop END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomStartAlignmentTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5700
     * @tc.desc   Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomStartAlignmentTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomStartAlignmentTopEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomStartAlignmentStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5800
     * @tc.desc   Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.Start'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomStartAlignmentStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomStartAlignmentStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomStartAlignmentCenter
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5900
     * @tc.desc   Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomStartAlignmentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomStartAlignmentCenter START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentCenter END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomStartAlignmentEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6000
     * @tc.desc   Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomStartAlignmentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomStartAlignmentEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomStartAlignmentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6100
     * @tc.desc   Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomStartAlignmentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomStartAlignmentBottomStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomStartAlignmentBottom
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6200
     * @tc.desc   Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomStartAlignmentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomStartAlignmentBottom START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentBottom END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomStartAlignmentBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6300
     * @tc.desc   Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomStartAlignmentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomStartAlignmentBottomEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomStart
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomStart")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomAlignmentTopStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6400
     * @tc.desc   Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomAlignmentTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomAlignmentTopStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue()

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Bottom")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentTopStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomAlignmentTop
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6500
     * @tc.desc   Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomAlignmentTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomAlignmentTop START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Bottom")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentTop END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomAlignmentTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6600
     * @tc.desc   Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomAlignmentTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomAlignmentTopEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Bottom")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomAlignmentStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6700
     * @tc.desc   Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.Start'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomAlignmentStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomAlignmentStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Bottom")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomAlignmentCenter
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6800
     * @tc.desc   Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomAlignmentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomAlignmentCenter START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Bottom")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentCenter END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomAlignmentEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6900
     * @tc.desc   Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomAlignmentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomAlignmentEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Bottom")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomAlignmentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7000
     * @tc.desc   Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomAlignmentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomAlignmentBottomStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Bottom")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomAlignmentBottom
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7100
     * @tc.desc   Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomAlignmentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomAlignmentBottom START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Bottom")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentBottom END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomAlignmentBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7200
     * @tc.desc   Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomAlignmentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomAlignmentBottomEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.Bottom
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Bottom")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomEndAlignmentTopStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7300
     * @tc.desc   Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.TopStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomEndAlignmentTopStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomEndAlignmentTopStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue()

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentTopStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomEndAlignmentTop
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7400
     * @tc.desc   Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.Top'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomEndAlignmentTop',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomEndAlignmentTop START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentTop END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomEndAlignmentTopEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7500
     * @tc.desc   Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.TopEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomEndAlignmentTopEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomEndAlignmentTopEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomEndAlignmentStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7600
     * @tc.desc   Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.Start'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomEndAlignmentStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomEndAlignmentStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomEndAlignmentCenter
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7700
     * @tc.desc   Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.Center'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomEndAlignmentCenter',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomEndAlignmentCenter START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentCenter END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomEndAlignmentEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7800
     * @tc.desc   Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.End'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomEndAlignmentEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomEndAlignmentEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentEnd END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomEndAlignmentBottomStart
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7900
     * @tc.desc   Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.BottomStart'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomEndAlignmentBottomStart',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomEndAlignmentBottomStart START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomEndAlignmentBottom
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_8000
     * @tc.desc   Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.Bottom'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomEndAlignmentBottom',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomEndAlignmentBottom START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentBottom END');
      done();
    });

    /**
     * @tc.name   testStackAlignBottomEndAlignmentBottomEnd
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_8100
     * @tc.desc   Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.BottomEnd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackAlignBottomEndAlignmentBottomEnd',  Level.LEVEL0, async (done: Function) => {
      console.info('new testStackAlignBottomEndAlignmentBottomEnd START');
      globalThis.value.message.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');

      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.BottomEnd")
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentBottomEnd END');
      done();
    });
  })
}
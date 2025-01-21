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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from "../../../MainAbility/common/Common";
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0100
     * @tc.name testStackAlignTopStartAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignTopStartAlignmentTopStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0200
     * @tc.name testStackAlignTopStartAlignmentTop
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignTopStartAlignmentTop', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0300
     * @tc.name testStackAlignTopStartAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignTopStartAlignmentEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0400
     * @tc.name testStackAlignTopStartAlignmentStart
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignTopStartAlignmentStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0500
     * @tc.name testStackAlignTopStartAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignTopStartAlignmentCenter', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0600
     * @tc.name testStackAlignTopStartAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.End'.
     */
    it('testStackAlignTopStartAlignmentEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0700
     * @tc.name testStackAlignTopStartAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignTopStartAlignmentBottomStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0800
     * @tc.name testStackAlignTopStartAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignTopStartAlignmentBottom', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0900
     * @tc.name testStackAlignTopStartAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignTopStartAlignmentBottomEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1000
     * @tc.name testStackAlignTopAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignTopAlignmentTopStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1100
     * @tc.name testStackAlignTopAlignmentTop
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignTopAlignmentTop', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1200
     * @tc.name testStackAlignTopAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignTopAlignmentTopEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1300
     * @tc.name testStackAlignTopAlignmentStart
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignTopAlignmentStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1400
     * @tc.name testStackAlignTopAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignTopAlignmentCenter', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1500
     * @tc.name testStackAlignTopAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.End'.
     */
    it('testStackAlignTopAlignmentEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1600
     * @tc.name testStackAlignTopAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignTopAlignmentBottomStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1700
     * @tc.name testStackAlignTopAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignTopAlignmentBottom', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1800
     * @tc.name testStackAlignTopAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignTopAlignmentBottomEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1900
     * @tc.name testStackAlignTopEndAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignTopEndAlignmentTopStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2000
     * @tc.name testStackAlignTopEndAlignmentTop
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignTopEndAlignmentTop', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2100
     * @tc.name testStackAlignTopEndAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignTopEndAlignmentTopEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2200
     * @tc.name testStackAlignTopEndAlignmentStart
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignTopEndAlignmentStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2300
     * @tc.name testStackAlignTopEndAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignTopEndAlignmentCenter', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2400
     * @tc.name testStackAlignTopEndAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.End'.
     */
    it('testStackAlignTopEndAlignmentEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2500
     * @tc.name testStackAlignTopEndAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignTopEndAlignmentBottomStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2600
     * @tc.name testStackAlignTopEndAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignTopEndAlignmentBottom', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2700
     * @tc.name testStackAlignTopEndAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignTopEndAlignmentBottomEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2800
     * @tc.name testStackAlignStartAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignStartAlignmentTopStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2900
     * @tc.name testStackAlignStartAlignmentTop
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignStartAlignmentTop', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3000
     * @tc.name testStackAlignStartAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignStartAlignmentTopEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3100
     * @tc.name testStackAlignStartAlignmentStart
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignStartAlignmentStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3200
     * @tc.name testStackAlignStartAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignStartAlignmentCenter', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3300
     * @tc.name testStackAlignStartAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.End'.
     */
    it('testStackAlignStartAlignmentEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3400
     * @tc.name testStackAlignStartAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignStartAlignmentBottomStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3500
     * @tc.name testStackAlignStartAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignStartAlignmentBottom', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3600
     * @tc.name testStackAlignStartAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignStartAlignmentBottomEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3700
     * @tc.name testStackAlignCenterAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignCenterAlignmentTopStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3800
     * @tc.name testStackAlignCenterAlignmentTop
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignCenterAlignmentTop', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3900
     * @tc.name testStackAlignCenterAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignCenterAlignmentTopEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4000
     * @tc.name testStackAlignCenterAlignmentStart
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignCenterAlignmentStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4100
     * @tc.name testStackAlignCenterAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignCenterAlignmentCenter', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4200
     * @tc.name testStackAlignCenterAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.End'.
     */
    it('testStackAlignCenterAlignmentEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4300
     * @tc.name testStackAlignCenterAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignCenterAlignmentBottomStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4400
     * @tc.name testStackAlignCenterAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignCenterAlignmentBottom', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4500
     * @tc.name testStackAlignCenterAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignCenterAlignmentBottomEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4600
     * @tc.name testStackAlignEndAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignEndAlignmentTopStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4700
     * @tc.name testStackAlignEndAlignmentTop
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignEndAlignmentTop', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4800
     * @tc.name testStackAlignEndAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignEndAlignmentTopEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4900
     * @tc.name testStackAlignEndAlignmentStart
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignEndAlignmentStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5000
     * @tc.name testStackAlignEndAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignEndAlignmentCenter', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5100
     * @tc.name testStackAlignEndAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.End'.
     */
    it('testStackAlignEndAlignmentEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5200
     * @tc.name testStackAlignEndAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignEndAlignmentBottomStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5300
     * @tc.name testStackAlignEndAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignEndAlignmentBottom', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5400
     * @tc.name testStackAlignEndAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignEndAlignmentBottomEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5500
     * @tc.name testStackAlignBottomStartAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignBottomStartAlignmentTopStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5600
     * @tc.name testStackAlignBottomStartAlignmentTop
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignBottomStartAlignmentTop', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5700
     * @tc.name testStackAlignBottomStartAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignBottomStartAlignmentTopEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5800
     * @tc.name testStackAlignBottomStartAlignmentStart
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignBottomStartAlignmentStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5900
     * @tc.name testStackAlignBottomStartAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignBottomStartAlignmentCenter', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6000
     * @tc.name testStackAlignBottomStartAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.End'.
     */
    it('testStackAlignBottomStartAlignmentEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6100
     * @tc.name testStackAlignBottomStartAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignBottomStartAlignmentBottomStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6200
     * @tc.name testStackAlignBottomStartAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignBottomStartAlignmentBottom', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6300
     * @tc.name testStackAlignBottomStartAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignBottomStartAlignmentBottomEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6400
     * @tc.name testStackAlignBottomAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignBottomAlignmentTopStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6500
     * @tc.name testStackAlignBottomAlignmentTop
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignBottomAlignmentTop', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6600
     * @tc.name testStackAlignBottomAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignBottomAlignmentTopEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6700
     * @tc.name testStackAlignBottomAlignmentStart
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignBottomAlignmentStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6800
     * @tc.name testStackAlignBottomAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignBottomAlignmentCenter', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6900
     * @tc.name testStackAlignBottomAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.End'.
     */
    it('testStackAlignBottomAlignmentEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7000
     * @tc.name testStackAlignBottomAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignBottomAlignmentBottomStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7100
     * @tc.name testStackAlignBottomAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignBottomAlignmentBottom', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7200
     * @tc.name testStackAlignBottomAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignBottomAlignmentBottomEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7300
     * @tc.name testStackAlignBottomEndAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignBottomEndAlignmentTopStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7400
     * @tc.name testStackAlignBottomEndAlignmentTop
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignBottomEndAlignmentTop', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7500
     * @tc.name testStackAlignBottomEndAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignBottomEndAlignmentTopEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7600
     * @tc.name testStackAlignBottomEndAlignmentStart
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignBottomEndAlignmentStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7700
     * @tc.name testStackAlignBottomEndAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignBottomEndAlignmentCenter', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7800
     * @tc.name testStackAlignBottomEndAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.End'.
     */
    it('testStackAlignBottomEndAlignmentEnd', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7900
     * @tc.name testStackAlignBottomEndAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignBottomEndAlignmentBottomStart', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_8000
     * @tc.name testStackAlignBottomEndAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignBottomEndAlignmentBottom', 0, async (done: Function) => {
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
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_8100
     * @tc.name testStackAlignBottomEndAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignBottomEndAlignmentBottomEnd', 0, async (done: Function) => {
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
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

export default function stackNoneSettingWidthHeight() {
  describe('stackNoneSettingWidthHeightTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackNoneSettingWidthHeight',
      };
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get stackNoneSettingWidthHeight state success " + JSON.stringify(pages));
        if (!("stackNoneSettingWidthHeight" == pages.name)) {
          console.info("get stackNoneSettingWidthHeight state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push stackNoneSettingWidthHeight page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stackNoneSettingWidthHeight page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("stackNoneSettingWidthHeight after each called");
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0100
     * @tc.name testStackDefaultSizeAlignContentTopStart
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'TopStart'.
     */
    it('testStackDefaultSizeAlignContentTopStart', 0, async (done: Function) => {
      console.info('new testStackDefaultSizeAlignContentTopStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeDefaultKey01.right - stackSizeDefaultKey01.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackDefaultSizeAlignContentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0200
     * @tc.name testStackDefaultSizeAlignContentTop
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'Top'.
     */
    it('testStackDefaultSizeAlignContentTop', 0, async (done: Function) => {
      console.info('new testStackDefaultSizeAlignContentTop START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackDefaultSizeAlignContentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0300
     * @tc.name testStackDefaultSizeAlignContentTopEnd
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'TopEnd'.
     */
    it('testStackDefaultSizeAlignContentTopEnd', 0, async (done: Function) => {
      console.info('new testStackDefaultSizeAlignContentTopEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackDefaultSizeAlignContentTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0400
     * @tc.name testStackDefaultSizeAlignContentStart
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'START'.
     */
    it('testStackDefaultSizeAlignContentStart', 0, async (done: Function) => {
      console.info('new testStackDefaultSizeAlignContentStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackDefaultSizeAlignContentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0500
     * @tc.name testStackDefaultSizeAlignContentCenter
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'Center'.
     */
    it('testStackDefaultSizeAlignContentCenter', 0, async (done: Function) => {
      console.info('new testStackDefaultSizeAlignContentCenter START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackDefaultSizeAlignContentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0600
     * @tc.name testStackDefaultSizeAlignContentEnd
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'End'.
     */
    it('testStackDefaultSizeAlignContentEnd', 0, async (done: Function) => {
      console.info('new testStackDefaultSizeAlignContentEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackDefaultSizeAlignContentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0700
     * @tc.name testStackDefaultSizeAlignContentBottomStart
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'BottomStart'.
     */
    it('testStackDefaultSizeAlignContentBottomStart', 0, async (done: Function) => {
      console.info('new testStackDefaultSizeAlignContentBottomStart START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackDefaultSizeAlignContentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0800
     * @tc.name testStackDefaultSizeAlignContentBottom
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'Bottom'.
     */
    it('testStackDefaultSizeAlignContentBottom', 0, async (done: Function) => {
      console.info('new testStackDefaultSizeAlignContentBottom START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackDefaultSizeAlignContentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0900
     * @tc.name testStackDefaultSizeAlignContentBottomEnd
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'BottomEnd'.
     */
    it('testStackDefaultSizeAlignContentBottomEnd', 0, async (done: Function) => {
      console.info('new testStackDefaultSizeAlignContentBottomEnd START');
      globalThis.value.message.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parse(strJson).$type).assertEqual('Stack')
      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackDefaultSizeAlignContentBottomEnd END');
      done();
    });
  })
}
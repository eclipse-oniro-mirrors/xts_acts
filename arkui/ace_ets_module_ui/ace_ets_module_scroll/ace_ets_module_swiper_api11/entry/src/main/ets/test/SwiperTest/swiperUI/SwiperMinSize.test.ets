/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../../MainAbility/utils/MessageManager';


export default function SwiperMinSize() {
  describe('SwiperMinSize', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperMinSize beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/swiperUI/SwiperMinSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperMinSize state pages: " + JSON.stringify(pages));
        if (!("SwiperMinSize" == pages.name)) {
          console.info("get SwiperMinSize state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SwiperMinSize page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperMinSize page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_061
      * @tc.name  : SwiperMinSize_001
      * @tc.desc  : Don't set minSize
      * @tc.level : Level 3
      */
    it('SwiperMinSize_001', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_001] START');
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(vp2px(160)));

      console.info('[SwiperMinSize_001] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_064
      * @tc.name  : SwiperMinSize_101
      * @tc.desc  : Don't set minSize
      * @tc.level : Level 3
      */
    it('SwiperMinSize_101', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_101] START');
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(vp2px(160)));

      console.info('[SwiperMinSize_101] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_063
      * @tc.name  : SwiperMinSize_002
      * @tc.desc  : set minSize to 20
      * @tc.level : Level 3
      */
    it('SwiperMinSize_002', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_002] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'itemSpace', value: 0 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(vp2px(40)));

      console.info('[SwiperMinSize_002] END');
      done();
    });

    /* *
     * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_062
     * @tc.name  : SwiperMinSize_102
     * @tc.desc  : set minSize to 20
     * @tc.level : Level 3
     */
    it('SwiperMinSize_102', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_102] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'itemSpace', value: 0 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(vp2px(40)));

      console.info('[SwiperMinSize_102] END');
      done();
    });

    /* *
     * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_071
     * @tc.name  : SwiperMinSize_202
     * @tc.desc  : set minSize to 20
     * @tc.level : Level 3
     */
    it('SwiperMinSize_202', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_202] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'itemSpace', value: 0 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(vp2px(40)));

      console.info('[SwiperMinSize_202] END');
      done();
    });

    /* *
     * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_069
     * @tc.name  : SwiperMinSize_302
     * @tc.desc  : set minSize to 20
     * @tc.level : Level 3
     */
    it('SwiperMinSize_302', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_302] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'itemSpace', value: 0 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(vp2px(40)));

      console.info('[SwiperMinSize_302] END');
      done();
    });

    /* *
     * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_072
     * @tc.name  : SwiperMinSize_402
     * @tc.desc  : set minSize to 20
     * @tc.level : Level 3
     */
    it('SwiperMinSize_402', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_402] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'itemSpace', value: 0 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(vp2px(40)));

      console.info('[SwiperMinSize_402] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_068
      * @tc.name  : SwiperMinSize_003
      * @tc.desc  : set minSize to 20 and change component dimensions
      * @tc.level : Level 3
      */
    it('SwiperMinSize_003', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_003] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'swiperTextWidth', value: 300 });
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'itemSpace', value: 0 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(vp2px(40)));

      console.info('[SwiperMinSize_003] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_067
      * @tc.name  : SwiperMinSize_004
      * @tc.desc  : set minSize to 20 and change component dimensions
      * @tc.level : Level 3
      */
    it('SwiperMinSize_004', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_004] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'swiperWidth', value: 200 });
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'itemSpace', value: 0 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      expect(Math.round(swiperText1.right - swiperText1.left)).assertEqual(Math.round(vp2px(40)));

      console.info('[SwiperMinSize_004] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_066
      * @tc.name  : SwiperMinSize_005
      * @tc.desc  : set minSize to 20 and paddingTop marginTop to 10
      * @tc.level : Level 3
      */
    it('SwiperMinSize_005', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_005] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'swiperPadding', value: 10 });
      globalThis.value.message.notify({ name:'swiperMargin', value: 10 });
      await CommonFunc.sleep(200);

      let swiper = CommonFunc.getComponentRect('swiperMinSize2');
      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(swiperText1.top - swiper.top) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('[SwiperMinSize_005] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_073
      * @tc.name  : SwiperMinSize_006
      * @tc.desc  : set minSize to 20 and itemSpace to 10
      * @tc.level : Level 3
      */
    it('SwiperMinSize_006', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_006] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'swiperPadding', value: 0 });
      globalThis.value.message.notify({ name:'swiperMargin', value: 0 });
      globalThis.value.message.notify({ name:'itemSpace', value: 10 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      let swiperText2 = CommonFunc.getComponentRect('swiperText2');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(swiperText2.left - swiperText1.right) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('[SwiperMinSize_006] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_070
      * @tc.name  : SwiperMinSize_007
      * @tc.desc  : set minSize to 20 and itemSpace to 10
      * @tc.level : Level 3
      */
    it('SwiperMinSize_007', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_007] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'itemSpace', value: 10 });
      globalThis.value.message.notify({ name:'nextMargin', value: 10 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      let swiperText2 = CommonFunc.getComponentRect('swiperText2');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(swiperText2.left - swiperText1.right) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('[SwiperMinSize_007] END');
      done();
    });



  })
}

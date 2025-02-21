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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import GlobalContext from '../../MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function GridLayoutDirection() {
  describe('GridLayoutDirection', () => {
    beforeEach(async (done: Function) => {
      console.info("GridLayoutDirection beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridLayoutDirection',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridLayoutDirection state pages: " + JSON.stringify(pages));
        if (!("GridLayoutDirection" == pages.name)) {
          console.info("get GridLayoutDirection state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GridLayoutDirection page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridLayoutDirection page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_008
      * @tc.name  : GridLayoutDirection_001
      * @tc.desc  : Set layoutDirection to GridDirection.ColumnReverse
      * @tc.level : Level 2
      */
    it('GridLayoutDirection_001', 0, async (done: Function) => {

      console.info('[GridLayoutDirection_001] START');
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<GridDirection>('value').message.notify({name:'layoutDirection', value: GridDirection.ColumnReverse });
      await CommonFunc.sleep(1000);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      await CommonFunc.sleep(1000);
	  expect(Math.abs(Math.round(GridItem00.top - GridItem01.bottom) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_001] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_006
      * @tc.name  : GridLayoutDirection_002
      * @tc.desc  : Set layoutDirection to GridDirection.Column
      * @tc.level : Level 2
      */
    it('GridLayoutDirection_002', 0, async (done: Function) => {

      console.info('[GridLayoutDirection_002] START');
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<GridDirection>('value').message.notify({name:'layoutDirection', value: GridDirection.Column });
      await CommonFunc.sleep(200);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      await CommonFunc.sleep(1000);
	  expect(Math.abs(Math.round(GridItem01.top - GridItem00.bottom) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_002] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_007
      * @tc.name  : GridLayoutDirection_003
      * @tc.desc  : Set layoutDirection to GridDirection.RowReverse
      * @tc.level : Level 2
      */
    it('GridLayoutDirection_003', 0, async (done: Function) => {

      console.info('[GridLayoutDirection_003] START');
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<GridDirection>('value').message.notify({name:'layoutDirection', value: GridDirection.RowReverse });
      await CommonFunc.sleep(200);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      await CommonFunc.sleep(1000);
	  expect(Math.abs(Math.round(GridItem00.left - GridItem01.right) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_003] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_005
      * @tc.name  : GridLayoutDirection_004
      * @tc.desc  : Set layoutDirection to GridDirection.Row
      * @tc.level : Level 2
      */
    it('GridLayoutDirection_004', 0, async (done: Function) => {

      console.info('[GridLayoutDirection_004] START');
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<GridDirection>('value').message.notify({name:'layoutDirection', value: GridDirection.Row });
      await CommonFunc.sleep(200);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      await CommonFunc.sleep(1000);
	  expect(Math.abs(Math.round(GridItem01.left - GridItem00.right) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_004] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_009
      * @tc.name  : GridLayoutDirection_005
      * @tc.desc  : Set layoutDirection to GridDirection.ColumnReverse
      * @tc.level : Level 2
      */
    it('GridLayoutDirection_005', 0, async (done: Function) => {

      console.info('[GridLayoutDirection_005] START');
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({name:'gridPadding', value: 50 });
      await CommonFunc.sleep(200);
      let GridLayoutDirKey = CommonFunc.getComponentRect('GridLayoutDirKey');
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(GridItem00.top - GridLayoutDirKey.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_005] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_010
      * @tc.name  : GridLayoutDirection_006
      * @tc.desc  : Set layoutDirection to GridDirection.ColumnReverse
      * @tc.level : Level 2
      */
    it('GridLayoutDirection_006', 0, async (done: Function) => {

      console.info('[GridLayoutDirection_006] START');
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({name:'gridMargin', value: 50 });
      await CommonFunc.sleep(200);
      let GridLayoutDirKey = CommonFunc.getComponentRect('GridLayoutDirKey');
      let ColumnKey = CommonFunc.getComponentRect('ColumnKey');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(GridLayoutDirKey.top - ColumnKey.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_006] END');
      done();
    });


  })
}

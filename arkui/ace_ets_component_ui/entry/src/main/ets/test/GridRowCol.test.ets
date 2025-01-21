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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function GridRowCol() {
  describe('GridRowCol', function () {
    beforeEach(async function (done) {
      console.info("GridRowCol beforeEach start");
      let options = {
        uri: 'MainAbility/pages/GridRowCol',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridRowCol state pages: " + JSON.stringify(pages));
        if (!("GridRowCol" == pages.name)) {
          console.info("get GridRowCol state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GridRowCol page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridRowCol page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
       * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_059
       * @tc.name  : GridRowCol_001
       * @tc.desc  : set columnsTemplate and rowsTemplate
       * @tc.level : Level 3
       */
    it('GridRowCol_001', 0, async function (done) {

      console.info('[GridRowCol_001] START');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('GridRowCol');
      let obj1 = JSON.parse(strJson1);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      let GridItem02 = CommonFunc.getComponentRect('GridItem02');
      let GridItem03 = CommonFunc.getComponentRect('GridItem03');
      let GridItem11 = CommonFunc.getComponentRect('GridItem11');
      console.info("[GridRowCol_001] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(Math.round(GridItem01.left - GridItem00.right)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(GridItem02.left - GridItem01.right)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(GridItem03.top - GridItem00.bottom)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(GridItem11.top - GridItem03.bottom)).assertEqual(Math.round(vp2px(10)));

      console.info('[GridRowCol_001] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_002
       * @tc.name  : GridRowCol_002
       * @tc.desc  : set columnsTemplate to 'repeat(auto-fit,10%)'
       * @tc.level : Level 3
       */
    it('GridRowCol_002', 0, async function (done) {

      console.info('[GridRowCol_002] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'columnsTemplate', value: 'repeat(auto-fit,10%)' });
      await CommonFunc.sleep(200);
      let strJson1 = getInspectorByKey('GridRowCol');
      let obj1 = JSON.parse(strJson1);
      console.info("[GridRowCol_002] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.columnsTemplate).assertEqual('repeat(auto-fit,10%)');

      console.info('[GridRowCol_002] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_012
       * @tc.name  : GridRowCol_003
       * @tc.desc  : set columnsTemplate to 'repeat(auto-fit,10%)'
       * @tc.level : Level 3
       */
    it('GridRowCol_003', 0, async function (done) {

      console.info('[GridRowCol_002] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'columnsTemplate', value: 'repeat(auto-fit,90)' });
      await CommonFunc.sleep(200);
      let strJson1 = getInspectorByKey('GridRowCol');
      let obj1 = JSON.parse(strJson1);
      console.info("[GridRowCol_002] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.columnsTemplate).assertEqual('repeat(auto-fit,90)');

      console.info('[GridRowCol_002] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_011
       * @tc.name  : GridRowCol_004
       * @tc.desc  : set columnsTemplate to 'repeat(auto-fit,-1)'
       * @tc.level : Level 3
       */
    it('GridRowCol_004', 0, async function (done) {

      console.info('[GridRowCol_004] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'columnsTemplate', value: 'repeat(auto-fit,-1)' });
      await CommonFunc.sleep(200);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      await CommonFunc.sleep(1000);
      expect(Math.round(GridItem01.top - GridItem00.bottom)).assertEqual(Math.round(vp2px(10)));

      console.info('[GridRowCol_004] END');
      done();
    });

   /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_011
      * @tc.name  : GridRowCol_005
      * @tc.desc  : set columnsTemplate to '1fr 1fr 1fr'
      * @tc.level : Level 3
      */
    it('GridRowCol_005', 0, async function (done) {

      console.info('[GridRowCol_005] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({name:'columnsTemplate', value: '1fr 1fr 1fr' });
      await CommonFunc.sleep(200);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      await CommonFunc.sleep(1000);
      expect(Math.round(GridItem01.left - GridItem00.right)).assertEqual(Math.round(vp2px(10)));

      console.info('[GridRowCol_005] END');
      done();
    });




  })
}

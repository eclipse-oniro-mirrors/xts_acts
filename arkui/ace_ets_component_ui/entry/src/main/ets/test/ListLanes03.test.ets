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
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function ListLanes03() {
  describe('ListLanes03', () => {
    beforeEach(async (done: Function) => {
      console.info("ListLanes03 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ListLanes03',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListLanes03 state pages: " + JSON.stringify(pages));
        if (!("ListLanes03" == pages.name)) {
          console.info("get ListLanes03 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ListLanes03 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListLanes03 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
       * @tc.number: SUB_ACE_TS_COMPONENT_SR000I46QG_034 033
       * @tc.name  : ListLanes03_001
       * @tc.desc  : set gutter to 10vp and listDirection to Axis.Vertical
       * @tc.level : Level 3
       */
    it('ListLanes03_001', 0, async (done: Function) => {

      console.info('[ListLanes03_001] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'listGutter', value: '10vp' });
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListLanes31_0');
      let ListItem1 = CommonFunc.getComponentRect('ListLanes31_1');
      await CommonFunc.sleep(1000);
      expect(Math.round(ListItem1.left - ListItem0.right)).assertEqual(Math.round(vp2px(10)));

      console.info('[ListLanes03_001] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_TS_COMPONENT_SR000I46QG_045
       * @tc.name  : ListLanes03_002
       * @tc.desc  : set gutter to 10fp and listDirection to Axis.Vertical
       * @tc.level : Level 3
       */
    it('ListLanes03_002', 0, async (done: Function) => {

      console.info('[ListLanes03_002] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'listGutter', value: '10fp' });
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListLanes32_0');
      let ListItem1 = CommonFunc.getComponentRect('ListLanes32_1');
      await CommonFunc.sleep(1000);
      expect(Math.round(ListItem1.left - ListItem0.right)).assertEqual(Math.round(fp2px(10)));

      console.info('[ListLanes03_002] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_TS_COMPONENT_SR000I46QG_036
       * @tc.name  : ListLanes03_003
       * @tc.desc  : set gutter to 10lpx and listDirection to Axis.Vertical
       * @tc.level : Level 3
       */
    it('ListLanes03_003', 0, async (done: Function) => {

      console.info('[ListLanes03_003] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'listGutter', value: '10lpx' });
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListLanes33_0');
      let ListItem1 = CommonFunc.getComponentRect('ListLanes33_1');
      await CommonFunc.sleep(1000);
      expect(Math.round(ListItem1.left - ListItem0.right)).assertEqual(Math.round(lpx2px(10)));

      console.info('[ListLanes03_003] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_TS_COMPONENT_SR000I46QG_054
       * @tc.name  : ListLanes03_004
       * @tc.desc  : set gutter to 10px and listDirection to Axis.Vertical
       * @tc.level : Level 3
       */
    it('ListLanes03_004', 0, async (done: Function) => {

      console.info('[ListLanes03_004] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'listGutter', value: '10px' });
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListLanes34_0');
      let ListItem1 = CommonFunc.getComponentRect('ListLanes34_1');
      await CommonFunc.sleep(1000);
      expect(Math.round(ListItem1.left - ListItem0.right)).assertEqual(Math.round(10));

      console.info('[ListLanes03_004] END');
      done();
    });



  })
}

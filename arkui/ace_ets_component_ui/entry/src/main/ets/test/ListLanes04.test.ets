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


export default function ListLanes04() {
  describe('ListLanes04', () => {
    beforeEach(async (done: Function) => {
      console.info("ListLanes04 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ListLanes04',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListLanes04 state pages: " + JSON.stringify(pages));
        if (!("ListLanes04" == pages.name)) {
          console.info("get ListLanes04 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ListLanes04 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListLanes04 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_041
      * @tc.name  : ListLanes04_001
      * @tc.desc  : set gutter to 0 and listDirection to Axis.Horizontal
      * @tc.level : Level 3
      */
    it('ListLanes04_001', 0, async (done: Function) => {

      console.info('[ListLanes04_001] START');
      await CommonFunc.sleep(1000);

      let ListItem01_0 = CommonFunc.getComponentRect('ListItem01_0');
      let ListItem01_1 = CommonFunc.getComponentRect('ListItem01_1');
      await CommonFunc.sleep(1000);
      expect(Math.round(ListItem01_1.top - ListItem01_0.bottom)).assertEqual(Math.round(vp2px(0)));

      console.info('[ListLanes04_001] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_049
      * @tc.name  : ListLanes04_002
      * @tc.desc  : set gutter to -1 and listDirection to Axis.Horizontal
      * @tc.level : Level 3
      */
    it('ListLanes04_002', 0, async (done: Function) => {

      console.info('[ListLanes04_002] START');
      await CommonFunc.sleep(1000);

      let ListItem0 = CommonFunc.getComponentRect('ListItem02_0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem02_1');
      await CommonFunc.sleep(1000);
      expect(Math.round(ListItem1.top - ListItem0.bottom)).assertEqual(Math.round(vp2px(0)));

      console.info('[ListLanes04_002] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_047
      * @tc.name  : ListLanes04_003
      * @tc.desc  : set gutter to 10% and listDirection to Axis.Horizontal
      * @tc.level : Level 3
      */
    it('ListLanes04_003', 0, async (done: Function) => {

      console.info('[ListLanes04_003] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ListLanesKey04_3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ListLanes04_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.laneGutter).assertEqual('10.00%');
      console.info('[ListLanes04_003] END');

      done();
    });






  })
}

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
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function ListLanes02() {
  describe('ListLanes02', () => {
    beforeEach(async (done: Function) => {
      console.info("ListLanes02 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListLanes02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListLanes02 state pages: " + JSON.stringify(pages));
        if (!("ListLanes02" == pages.name)) {
          console.info("get ListLanes02 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ListLanes02 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListLanes02 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
       * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_038
       * @tc.name  : ListLanes02_001
       * @tc.desc  : set gutter to 10 and listDirection to Axis.Vertical
       * @tc.level : Level 2
       */
    it('ListLanes02_001', 0, async (done: Function) => {

      console.info('[ListLanes02_001] START');
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListItem02_0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem02_1');
      await CommonFunc.sleep(1000);
	  expect(Math.abs((Math.round(ListItem1.left - ListItem0.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();

      console.info('[ListLanes02_001] END');
      done();
    });

    /* *
       * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_043
       * @tc.name  : ListLanes02_001
       * @tc.desc  : set gutter to 10 and listDirection to Axis.Horizontal
       * @tc.level : Level 2
       */
    // it('ListLanes02_002', 0, async (done: Function) => {
    //
    //   console.info('[ListLanes02_002] START');
    //   await CommonFunc.sleep(200);
    //   globalThis.value.message.notify({ name:'listDirection', value: Axis.Horizontal });
    //   await CommonFunc.sleep(200);
    //
    //   let ListItem0 = CommonFunc.getComponentRect('ListItem02_0');
    //   let ListItem1 = CommonFunc.getComponentRect('ListItem02_1');
    //   await CommonFunc.sleep(1000);
    //   expect(Math.round(ListItem1.left - ListItem0.right)).assertEqual(Math.round(vp2px(10)));
    //
    //   console.info('[ListLanes02_002] END');
    //   done();
    // });




    
  })
}

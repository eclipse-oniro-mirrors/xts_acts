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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

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

    /**
     * @tc.name   ListLanes02_001
     * @tc.number ListLanes02_001
     * @tc.desc   set gutter to 10 and listDirection to Axis.Vertical
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ListLanes02_001',  Level.LEVEL3, async (done: Function) => {

      console.info('[ListLanes02_001] START');
      await CommonFunc.sleep(200);

      let ListItem0 = CommonFunc.getComponentRect('ListItem02_0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem02_1');
      await CommonFunc.sleep(1000);
	  expect(Math.abs((Math.round(ListItem1.left - ListItem0.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();

      console.info('[ListLanes02_001] END');
      done();
    });
  })
}

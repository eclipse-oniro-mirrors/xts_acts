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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';

export default function StartAndStop() {
  describe('StartAndStop', () => {
    beforeEach(async (done: Function) => {
      console.info("StartAndStop beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/StartAndStop",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StartAndStop state pages:" + JSON.stringify(pages));
        if (!("StartAndStop" == pages.name)) {
          console.info("get StartAndStop pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StartAndStop page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StartAndStop page error:" + err);
      }
      console.info("StartAndStop beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back({
        url: 'MainAbility/pages/index/index'
      })
      console.info("StartAndStop after each called");
    });


    /* *
* @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
* @tc.name  : Component sliding triggers onScrollStop and onScrollStart
* @tc.desc  : Set the scroll direction to portrait
* @tc.level : Level 2
*/


    it('StartAndStop_0300', 0, async (done: Function) => {

      console.info('[StartAndStop_0300] START');
      let gridRect: RectValue = CommonFunc.getComponentRect('StartandStop')
      let driver = Driver.create()
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.9 + gridRect.top}`),
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`),
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`),
        1000);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('StartAndStop_start')

      console.info("[StartAndStop_0300] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)))
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onScrollStart');

      let strJson2 = getInspectorByKey('StartAndStop_end')

      console.info("[StartAndStop_0300] component obj2 is: " + JSON.stringify(JSON.parse(strJson2)))
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onScrollStop');

      console.info('[StartAndStop_0300] END');
      done();
    });
  })
}

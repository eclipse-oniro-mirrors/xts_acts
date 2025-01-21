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
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../../MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';

export default function StartAndEnd() {
  describe('StartAndEnd', function () {
    beforeEach(async function (done) {
      console.info("StartAndEnd beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/Grid_iiregular/StartAndEnd",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StartAndEnd state pages:" + JSON.stringify(pages));
        if (!("StartAndEnd" == pages.name)) {
          console.info("get StartAndEnd pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push StartAndEnd page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StartAndEnd page error:" + err);
      }
      console.info("StartAndEnd beforeEach end");
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
    * @tc.name  : StartAndEnd_0001
    * @tc.desc  : Component sliding triggers onReachEnd and onReachStart
    * @tc.level : Level 2
    */
    it('StartAndEnd_0001', 0, async function (done) {
      console.info('[StartAndEnd_0001] START');
	    let gridRect = CommonFunc.getComponentRect('StartAndEnd')
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.9+gridRect.top),
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.1+gridRect.top),
        1000);     
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('StartAndEnd_end')
      let obj1 = JSON.parse(strJson1)
      console.info("[StartAndEnd_0001] component obj1 is: " + JSON.stringify(obj1))
      expect(obj1.$attrs.content).assertEqual('onReachEnd');

      await driver.swipe(
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.1+gridRect.top),
        parseInt((gridRect.right-gridRect.left)*0.5+gridRect.left),
        parseInt((gridRect.bottom-gridRect.top)*0.9+gridRect.top),
        1000);   
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('StartAndEnd_start')
      let obj2 = JSON.parse(strJson2)
      console.info("[StartAndEnd_0001] component obj2 is: " + JSON.stringify(obj2))
      expect(obj2.$attrs.content).assertEqual('onReachStart2');

      console.info('[StartAndEnd_0001] END');
      done();
    });
  })
}

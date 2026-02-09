/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function makeObserved0150Test() {
  describe('makeObserved0150Test', () => {
    beforeEach(async (done: Function) => {
      console.info("makeObserved0150Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/makeObserved/makeObserved0150',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get makeObserved0150Test state pages: " + JSON.stringify(pages));
        if (!("makeObserved0150" == pages.name)) {
          console.info("get makeObserved0150Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push makeObserved0150Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push makeObserved0150Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   makeObserved0150Test_01
     * @tc.number makeObserved0150Test_01
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('makeObserved0150Test_01', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      console.info('makeObserved0150Test_01 START');
      let driver = await Driver.create()
      
      let text = await driver.findComponent(ON.id('makeObserved150Text1'));
      await text.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('makeObserved150Text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[makeObservedTest_0150] Text1 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Trace: 2');

      text = await driver.findComponent(ON.id('makeObserved150Text2'));
      await text.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('makeObserved150Text2');
      obj = JSON.parse(strJson);
      console.info("[makeObservedTest_0150] Text2 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('makeObserved: 2');

      console.info('makeObserved0150Test_01 END');
      done()
    })
  })
}


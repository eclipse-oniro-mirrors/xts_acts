/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
  UiDriver,
  Component,
  Driver,
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


export default function CombinationState6Jsunit() {
  describe('CombinationState6Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("CombinationState6Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/CombinationState6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CombinationState6Jsunit state pages: " + JSON.stringify(pages));
        if (!("CombinationState6" == pages.name)) {
          console.info("get CombinationState6Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CombinationState6Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CombinationState6Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('CombinationState6Jsunit_0100', Level.LEVEL0, async (done: Function) => {
      // Get the information of the State component
      console.info('[CombinationState6Jsunit_0100] START');
      let strJson = getInspectorByKey('PropObjectLink1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CombinationState6Jsunit_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('PropObjectLink:1');
      console.info('[CombinationState6Jsunit_0100] END');
      done();
    });

    it('CombinationState6Jsunit_0200', Level.LEVEL0, async (done: Function) => {
      // Get the information of the State component
      console.info('[CombinationState6Jsunit_0200] START');
      let strJson1 = getInspectorByKey('PropObjectLink2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[CombinationState6Jsunit_0200] component obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('PropObjectLink:2');
      console.info('[CombinationState6Jsunit_0200] END');
      done();
    });

    it('CombinationState6Jsunit_0300', Level.LEVEL0, async (done: Function) => {
      // Get the information of the State component
      console.info('[CombinationState6Jsunit_0300] START');
      let strJson2 = getInspectorByKey('PropObjectLink3');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[CombinationState6Jsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj2.$attrs.content).assertEqual('PropObjectLink:3');
      console.info('[CombinationState6Jsunit_0300] END');
      done();
    });

    it('CombinationState6Jsunit_0500', Level.LEVEL0, async (done: Function) => {
      // Get the information of the State component
      console.info('[CombinationState6Jsunit_0500] START');
      let strJson4 = getInspectorByKey('PropObjectLink5');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("[CombinationState6Jsunit_0500] component obj4 is: " + JSON.stringify(obj4));
      await CommonFunc.sleep(1000);
      expect(obj4.$attrs.content).assertEqual('PropObjectLink:5');
      console.info('[CombinationState6Jsunit_0500] END');
      done();
    });
  })
}

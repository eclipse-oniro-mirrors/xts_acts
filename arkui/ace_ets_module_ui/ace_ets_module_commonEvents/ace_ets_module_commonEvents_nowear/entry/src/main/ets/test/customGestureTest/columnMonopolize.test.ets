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
import CommonFunc from '../../MainAbility/common/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function columnMonopolize() {
  describe('columnMonopolize', () => {
    beforeEach(async (done: Function) => {
      console.log("columnMonopolize beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.log("get columnMonopolize state pages:" + JSON.stringify(pages));
        if (!("columnMonopolize" == pages.name)) {
          console.log("get  columnMonopolize pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/customGestureTest/columnMonopolize"
          })
          await CommonFunc.sleep(2000);
          console.log("push columnMonopolize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnMonopolize page error:" + err);
      }
      console.log("columnMonopolize foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.log("columnMonopolize after each called");
    });


    /**
     * @tc.name   columnMonopolize_001
     * @tc.number columnMonopolize_001
     * @tc.desc   columnMonopolize_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('columnMonopolize_001', Level.LEVEL0, async (done: Function) => {
      console.log('[columnMonopolize_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let innerColnum = await scrollBar.scrollSearch(ON.id('innerColnum'));
      await CommonFunc.sleep(200);
      await innerColnum.click();
      await CommonFunc.sleep(500);

      let strJson1 = getInspectorByKey('outer');
      console.log("[columnMonopolize_001] component outer obj is: " , JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('outside column touch down');
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('inner');
      console.log("[columnMonopolize_001] component inner obj is: " , JSON.stringify(JSON.parse(strJson2)));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('inner column touch down');

      let button = await scrollBar.scrollSearch(ON.id('change'));
      let button_clean = await scrollBar.scrollSearch(ON.id('clean'));

      await button_clean.click();
      await CommonFunc.sleep(500);

      await button.click();
      await CommonFunc.sleep(1000);
      await innerColnum.click();
      await CommonFunc.sleep(500);
      let strJson3 = getInspectorByKey('outer');
      console.log("[columnMonopolize_001] component outer obj2 is: " , JSON.stringify(JSON.parse(strJson3)));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual(' ');
      let strJson4 = getInspectorByKey('inner');
      console.log("[columnMonopolize_001] component inner obj2 is: " , JSON.stringify(JSON.parse(strJson4)));
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('inner column touch down');
      await CommonFunc.sleep(500);
      await button_clean.click();
      console.log('[columnMonopolize_001] END');
      done();
    });
  })
}
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

export default function columnMonopolizeFalse() {
  describe('columnMonopolizeFalse', () => {
    beforeEach(async (done: Function) => {
      console.log("columnMonopolizeFalse beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.log("get columnMonopolizeFalse state pages:" + JSON.stringify(pages));
        if (!("columnMonopolizeFalse" == pages.name)) {
          console.log("get  columnMonopolizeFalse pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/customGestureTest/columnMonopolizeFalse"
          })
          await CommonFunc.sleep(2000);
          console.log("push columnMonopolizeFalse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnMonopolizeFalse page error:" + err);
      }
      console.log("columnMonopolizeFalse foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.log("columnMonopolizeFalse after each called");
    });


    /**
     * @tc.name   columnMonopolizeFalse_001
     * @tc.number columnMonopolizeFalse_001
     * @tc.desc   columnMonopolizeFalse_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('columnMonopolizeFalse_001', Level.LEVEL0, async (done: Function) => {
      console.log('[columnMonopolizeFalse_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let column1 = await driver.findComponent(ON.id('column1'));
      await CommonFunc.sleep(200);
      await column1.click();
      await CommonFunc.sleep(500);
      let strJson1 = getInspectorByKey('text1');
      console.log("[columnMonopolizeFalse_001] component obj1 is: " , JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('inner column touch down');
      let strJson2 = getInspectorByKey('text2');
      console.log("[columnMonopolizeFalse_001] component obj2 is: " , JSON.stringify(JSON.parse(strJson2)));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('inner column touch down');
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('button1'));
      let button2 = await driver.findComponent(ON.id('button2'));
      await button1.click();
      await CommonFunc.sleep(1000);
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson3 = getInspectorByKey('text');
      console.log("[columnMonopolizeFalse_001] component obj3 is: " , JSON.stringify(JSON.parse(strJson3)));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('set monopolizeEvents true');
      await CommonFunc.sleep(1000);

      await column1.click();
      await CommonFunc.sleep(500);
      let strJson4 = getInspectorByKey('text1');
      console.log("[columnMonopolizeFalse_001] component obj4 is: " , JSON.stringify(JSON.parse(strJson4)));
      expect(JSON.parse(strJson4).$attrs.content).assertEqual(' ');
      let strJson5 = getInspectorByKey('text2');
      console.log("[columnMonopolizeFalse_001] component obj5 is: " , JSON.stringify(JSON.parse(strJson5)));
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('inner column touch down');
      console.log('[columnMonopolizeFalse_001] END');
      done();
    });
  })
}
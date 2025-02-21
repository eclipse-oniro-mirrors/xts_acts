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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';
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

export default function counterApi() {
  describe('counterApi', () => {
    beforeEach(async (done: Function) => {
      console.info("counterApi beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get counterApi state pages:" + JSON.stringify(pages));
        if (!("counterApi" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/Counter/counterApi"
          })
          await CommonFunc.sleep(2000);
          console.info("push counterApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push counterApi page error:" + err);
      }
      console.info("counterApi foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("counterApi after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_CounterComponent_001
     * @tc.desc onFocusIncrease test of CounterComponent
     * @tc.level Level 3
     * @tc.type
     */

    it('counterApi_001', 0, async (done: Function) => {
      console.info('[counterApi_001] START');

      await CommonFunc.sleep(1000);
      // press tab
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('counterApiText2');
      await CommonFunc.sleep(200);
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[counterApi_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('onFocusDecrease');
      console.info('[counterApi_001] END');
      done();

    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_CounterComponent_002
     * @tc.desc onBlurIncrease and onFocusDecrease test of CounterComponent
     * @tc.level Level 3
     * @tc.type
     */

    it('counterApi_002', 0, async (done: Function) => {
      console.info('[counterApi_002] START');

      await CommonFunc.sleep(1000);
      // press tab
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('counterApiText1');
      let strJson2 = getInspectorByKey('counterApiText2');
      await CommonFunc.sleep(200);
      console.info("[counterApi_002] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[counterApi_002] component obj is: " + JSON.stringify(JSON.parse(strJson2)));
      await CommonFunc.sleep(1000);

      expect(JSON.parse(strJson).$attrs.content).assertEqual('onFocusIncrease');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onBlurDecrease');
      console.info('[counterApi_002] END');
      done();

    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_CounterComponent_003
     * @tc.desc onBlurDecrease test of CounterComponent
     * @tc.level Level 3
     * @tc.type
     */

    it('counterApi_003', 0, async (done: Function) => {
      console.info('[counterApi_003] START');

      await CommonFunc.sleep(1000);
      // press tab
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      await await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('counterApiText1');
      await CommonFunc.sleep(200);
      console.info("[counterApi_003] component obj is: " + JSON.stringify(JSON.parse(strJson2)));
      await CommonFunc.sleep(1000);

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onBlurIncrease');
      console.info('[counterApi_003] END');
      done();

    });
  })
}

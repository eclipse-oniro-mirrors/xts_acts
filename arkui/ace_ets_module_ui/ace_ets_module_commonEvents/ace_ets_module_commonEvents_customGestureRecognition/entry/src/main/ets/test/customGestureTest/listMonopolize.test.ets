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

export default function ListMonopolize() {
  describe('ListMonopolize', () => {
    beforeEach(async (done: Function) => {
      console.info("ListMonopolize beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListMonopolize state pages:" + JSON.stringify(pages));
        if (!("listMonopolize" == pages.name)) {
          console.info("get  ListMonopolize pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/customGestureTest/listMonopolize"
          })
          await CommonFunc.sleep(2000);
          console.info("push ListMonopolize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListMonopolize page error:" + err);
      }
      console.info("ListMonopolize foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ListMonopolize after each called");
    });


    /**
     * @tc.name   ListMonopolize_001
     * @tc.number ListMonopolize_001
     * @tc.desc   ListMonopolize_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListMonopolize_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ListMonopolize_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let column = await driver.findComponent(ON.id('column'));
      await column.click();
      await driver.mouseScroll({x: Math.round(globalThis.winLeft + vp2px(200)), y: Math.round(globalThis.winTop  + vp2px(200))}, true, 30, 2072, 20);
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('listText');
      console.info("[ListMonopolize_001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content == 'TapGesture onActionEnd success').assertTrue();
      await CommonFunc.sleep(1000);
      console.info('[ListMonopolize_001] END');
      done();
    });
  })
}

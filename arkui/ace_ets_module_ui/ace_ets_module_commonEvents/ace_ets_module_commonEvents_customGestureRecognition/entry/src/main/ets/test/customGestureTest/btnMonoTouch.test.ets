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

export default function btnMonoTouch() {
  describe('btnMonoTouch', () => {
    beforeEach(async (done: Function) => {
      console.info("btnMonoTouch beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get btnMonoTouch state pages:" + JSON.stringify(pages));
        if (!("btnMonoTouch" == pages.name)) {
          console.info("get  btnMonoTouch pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/customGestureTest/btnMonoTouch"
          })
          await CommonFunc.sleep(2000);
          console.info("push btnMonoTouch page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push btnMonoTouch page error:" + err);
      }
      console.info("btnMonoTouch foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("btnMonoTouch after each called");
    });


    /**
     * @tc.name   btnMonoTouch_001
     * @tc.number btnMonoTouch_001
     * @tc.desc   btnMonoTouch_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('btnMonoTouch_001', Level.LEVEL0, async (done: Function) => {
      console.info('[btnMonoTouch_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button2 = await driver.findComponent(ON.id("button2"));
      let button1 = await driver.findComponent(ON.id("button1"));
      await button2.click();
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey("buttonText");
      await CommonFunc.sleep(200);
      console.info("[btnMonoTouch_001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content == 'onTouch2 success;onTouch1 success').assertTrue();
      await CommonFunc.sleep(1000);
      console.info('[btnMonoTouch_001] END');
      done();
    });
  })
}

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

export default function btnMonoLongPress() {
  describe('btnMonoLongPress', () => {
    beforeEach(async (done: Function) => {
      console.info("btnMonoLongPress beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get btnMonoLongPress state pages:" + JSON.stringify(pages));
        if (!("btnMonoLongPress" == pages.name)) {
          console.info("get  btnMonoLongPress pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/customGestureTest/btnMonoLongPress"
          })
          await CommonFunc.sleep(2000);
          console.info("push btnMonoLongPress page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push btnMonoLongPress page error:" + err);
      }
      console.info("btnMonoLongPress foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("btnMonoLongPress after each called");
    });

    /**
     * @tc.number SUB_ACE_ACTION_GESTURE_MONOPOLIZE_0040_btnMonoLongPress_001
     * @tc.desc  button monopolize LongPress and button tap test
     * @tc.level Level 0
     * @tc.type
     */

    it('btnMonoLongPress_001', Level.LEVEL0, async (done: Function) => {
      console.info('[btnMonoLongPress_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button2 = await driver.findComponent(ON.id('button2'));
      let button1 = await driver.findComponent(ON.id('button1'));
      await button2.click();
      await button1.longClick();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('button1Text');
      await CommonFunc.sleep(200);
      console.info("[btnMonoLongPress_001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content == 'LongPressGesture start').assertTrue();
      await CommonFunc.sleep(1000);
      console.info('[btnMonoLongPress_001] END');
      done();
    });
  })
}

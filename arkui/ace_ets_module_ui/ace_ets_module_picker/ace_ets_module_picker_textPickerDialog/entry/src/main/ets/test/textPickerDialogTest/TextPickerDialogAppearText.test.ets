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
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function TextPickerDialogAppearTextTest() {
  describe('TextPickerDialogAppearTextTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextPickerDialogAppearTextTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/textPickerDialog/TextPickerDialogAppearText",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextPickerDialogAppearTextTest state pages:" + JSON.stringify(pages));
        if (!("TextPickerDialogAppearText" == pages.name)) {
          console.info("get TextPickerDialogAppearTextTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextPickerDialogAppearTextTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextPickerDialogAppearTextTest page error:" + err);
      }
      console.info("TextPickerDialogAppearTextTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextPickerDialogAppearTextTest after each called");
    });

    /**
     * @tc.name   TextPickerDialogAppearTextTest_001
     * @tc.number TextPickerDialogAppearTextTest_001
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextPickerDialogAppearTextTest_001', Level.LEVEL3, async (done: Function) => {
      console.info('[TextPickerDialogAppearTextTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('textPickerDialogAppearText'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let row: Component = await driver.findComponent(ON.id('row'));
      let point = await row.getBoundsCenter();
      await CommonFunc.sleep(1000);
      await driver.click(point.x, point.y)
      await CommonFunc.sleep(2000);
      let text = getInspectorByKey('AppearText');
      expect(JSON.parse(text).$attrs.content).assertEqual('onWillAppear_onDidAppear_onWillDisappear_onDidDisappear');
      console.info('[TextPickerDialogAppearTextTest_001] END');
      done();
    });
  })
}

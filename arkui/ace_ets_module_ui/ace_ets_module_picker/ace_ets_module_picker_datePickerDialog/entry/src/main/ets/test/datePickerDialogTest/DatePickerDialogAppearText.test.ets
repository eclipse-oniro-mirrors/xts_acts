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
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';

export default function DatePickerDialogAppearTextTest() {
  describe('DatePickerDialogAppearTextTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerDialogAppearTextTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/datePickerDialog/DatePickerDialogAppearText",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerDialogAppearTextTest state pages:" + JSON.stringify(pages));
        if (!("DatePickerDialogAppearText" == pages.name)) {
          console.info("get DatePickerDialogAppearTextTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerDialogAppearTextTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerDialogAppearTextTest page error:" + err);
      }
      console.info("DatePickerDialogAppearTextTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DatePickerDialogAppearTextTest after each called");
    });

    /**
     * @tc.name   DatePickerDialogAppearTextTest001
     * @tc.number DatePickerDialogAppearTextTest001
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DatePickerDialogAppearTextTest001', Level.LEVEL3, async (done: Function) => {
      console.info('[DatePickerDialogAppearTextTest001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('DatePickerDialogAppearText'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let row: Component = await driver.findComponent(ON.id('row'));
      let point = await row.getBoundsCenter();
      await CommonFunc.sleep(1000);
      await driver.click(point.x + globalThis.winLeft, Math.round(point.y / 2) + globalThis.winTop)
      await CommonFunc.sleep(2000);
      let text = getInspectorByKey('AppearText');
      expect(JSON.parse(text).$attrs.content).assertEqual('onWillAppear_onDidAppear_onWillDisappear_onDidDisappear');
      console.info('[DatePickerDialogAppearTextTest001] END');
      done();
    });
  })
}

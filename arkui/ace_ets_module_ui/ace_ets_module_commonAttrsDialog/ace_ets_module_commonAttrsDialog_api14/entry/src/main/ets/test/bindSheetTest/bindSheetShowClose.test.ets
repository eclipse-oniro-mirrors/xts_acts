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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function bindSheetShowClose() {
  describe('bindSheetShowClose', () => {
    beforeEach(async (done: Function) => {
      console.info("bindSheetShowClose beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheetTest/bindSheetShowClose',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindSheetShowClose state pages: " + JSON.stringify(pages));
        if (!("bindSheetShowClose" == pages.name)) {
          console.info("get bindSheetShowClose state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push bindSheetShowClose success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindSheetShowClose page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: bindSheetShowClose_0100
    * @tc.name  : bindSheetShowClose_0100
    * @tc.desc  : To test the release of the placeholder area when the showClose property is set to false
    * @tc.level : Level 2
    */
    it('bindSheetShowClose_0100', 0, async (done: Function) => {
      console.info('bindSheetShowClose_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn'));
      await button.click();
      console.info('[bindSheetShowClose_0100] click btn');
      await CommonFunc.sleep(1000);
      let title = await driver.findComponent(ON.id('row'));
      let rect = await title.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      let titleWidth = rect.right - rect.left
      console.info('[bindSheetShowClose_0100] titleWidth'+ titleWidth);
      let button1 = await driver.findComponent(ON.id('showClose'));
      await button1.click();
      console.info('[bindSheetShowClose_0100] showClose');
      await CommonFunc.sleep(1000);
      let title2 = await driver.findComponent(ON.id('row'));
      let rect2 = await title2.getBounds();
      console.info(`rect2 is: ` + JSON.stringify(rect2))
      let titleWidth2 = rect2.right - rect2.left
      console.info('[bindSheetShowClose_0100] titleWidth2 '+ titleWidth2);
      expect(titleWidth2 - titleWidth > 0).assertTrue()
      let button2 = await driver.findComponent(ON.id('close'));
      await button2.click();
      await CommonFunc.sleep(1000);
      console.info('[bindSheetShowClose_0100] END');
      done();
    });
  })
}


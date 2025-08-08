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
import {
  UiComponent,
  Driver,
  Component,
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
import display from '@ohos.display';

export default function bindSheetType() {
  describe('bindSheetType', () => {
    beforeEach(async (done: Function) => {
      console.info("bindSheetType beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheetTest/bindSheetType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindSheetType state pages: " + JSON.stringify(pages));
        if (!("bindSheetType" == pages.name)) {
          console.info("get bindSheetType state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push bindSheetType success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindSheetType page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: bindSheetType_0100
    * @tc.name  : bindSheetType_0100
    * @tc.desc  : Test the bindSheet component and set the preferType property to SheetType.POPUP
    * @tc.level : Level 2
    */
    it('bindSheetType_0100', Level.LEVEL0, async (done: Function) => {
      console.info('bindSheetType_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn'));
      await button.click();
      await CommonFunc.sleep(1000);
      let col = await driver.findComponent(ON.id('col'));
      let rect = await col.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      let colWidth = rect.right - rect.left
      let button1 = await driver.findComponent(ON.id('changeType'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sheetTypeValue');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[bindSheetType_0100] component obj is: " + JSON.stringify(obj));
      console.info("[bindSheetType_0100] title: " + JSON.stringify(obj.$attrs.content));
      if (px2vp(colWidth) - 840 >= 0) {
        expect(obj.$attrs.content).assertEqual("value SheetType:2");
        let button2 = await driver.findComponent(ON.id('close'));
        await button2.click();
        await CommonFunc.sleep(1000);
        console.info('[bindSheetType_0100] END');
        done();
      } else if (px2vp(colWidth) - 840 < 0 && px2vp(colWidth) - 600 >= 0 && display.isFoldable() &&
        (display.getFoldStatus() == 3 || display.getFoldStatus() == 1)) {
        expect(obj.$attrs.content).assertEqual("value SheetType:2");
        let button2 = await driver.findComponent(ON.id('close'));
        await button2.click();
        await CommonFunc.sleep(1000);
        console.info('[bindSheetType_0100] END');
        done();
      } else {
        expect(obj.$attrs.content).assertEqual("value SheetType:0");
        let button2 = await driver.findComponent(ON.id('close'));
        await button2.click();
        await CommonFunc.sleep(1000);
        console.info('[bindSheetType_0100] END');
        done();
      }
    });
  })
}
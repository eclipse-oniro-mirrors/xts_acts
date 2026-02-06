/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium"
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


export default function closeDialogTest() {
  describe('closeDialogTest', () => {
    beforeEach(async (done: Function) => {
      console.info("closeDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Dialog/closeDialogTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get closeDialogTest state pages: " + JSON.stringify(pages));
        if (!("closeDialogTest" == pages.name)) {
          console.info("get closeDialogTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push closeDialogTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push closeDialogTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("closeDialogTest after each called");
    });

    /**
     * @tc.number SUB_ACE_closeDialogTest_0100
     * @tc.name closeDialogTest_0100
     * @tc.desc To test that the promptAction.closeDialog parameter is an abnormal value(0,undefined,null).
     * @tc.level: Level 1
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
     */
    it('closeDialogTest_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('closeDialogTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('customDialog'));
      await button.click();
      await CommonFunc.sleep(2000);
      let toast = await driver.findComponent(ON.text('确认'));
      expect(toast != null).assertTrue()
      console.info('closeDialogTest_0100 0  ok');
      await CommonFunc.sleep(1500);
      toast = await driver.findComponent(ON.text('确认'));
      expect(toast != null).assertTrue()
      console.info('closeDialogTest_0100 null  ok');
      await CommonFunc.sleep(1500);
      toast = await driver.findComponent(ON.text('确认'));
      expect(toast != null).assertTrue()
      console.info('closeDialogTest_0100 undefined  ok');
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('ok'));
      await button1.click();
      await CommonFunc.sleep(500);
      console.info('closeDialogTest_0100 END');
      done();
    });
  })
}
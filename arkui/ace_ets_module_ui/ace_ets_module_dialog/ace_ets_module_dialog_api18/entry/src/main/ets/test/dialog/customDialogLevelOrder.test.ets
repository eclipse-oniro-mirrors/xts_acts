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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
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


export default function customDialogLevelOrder() {
  describe('customDialogLevelOrder', () => {
    beforeEach(async (done: Function) => {
      console.info("customDialogLevelOrder beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/customDialogLevelOrder',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get customDialogLevelOrder state pages: " + JSON.stringify(pages));
        if (!("customDialogLevelOrder" == pages.name)) {
          console.info("get customDialogLevelOrder state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push customDialogLevelOrder success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push customDialogLevelOrder page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      if (AppStorage.get('customLevel') != undefined) {
        AppStorage.delete('customLevel')
      }
      await CommonFunc.sleep(1000);
      console.info("customDialogLevelOrder after each called");
    });

    /**
     * @tc.name   customDialogLevelOrder_0100
     * @tc.number SUB_ACE_customDialogLevelOrder_0100
     * @tc.desc   To test the LevelOrder attribute of customDialog,LevelOrder.clamp(100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customDialogLevelOrder_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('customDialogLevelOrder_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('100'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('myOrder'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let top = AppStorage.get('customLevel') as number
      expect(top).assertEqual(100)
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('close'));
      await button2.click();
      await CommonFunc.sleep(1000);
      console.info('customDialogLevelOrder_0100 END');
      done();
    });

    /**
     * @tc.name   customDialogLevelOrder_0200
     * @tc.number SUB_ACE_customDialogLevelOrder_0200
     * @tc.desc   To test the LevelOrder attribute of customDialog,LevelOrder.clamp(100001)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customDialogLevelOrder_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('customDialogLevelOrder_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('100001'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('myOrder'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let top = AppStorage.get('customLevel') as number
      expect(top).assertEqual(100000)
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('close'));
      await button2.click();
      await CommonFunc.sleep(1000);
      console.info('customDialogLevelOrder_0200 END');
      done();
    });

    /**
     * @tc.name   customDialogLevelOrder_0300
     * @tc.number SUB_ACE_customDialogLevelOrder_0300
     * @tc.desc   To test the LevelOrder attribute of customDialog,LevelOrder.clamp(-100001)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customDialogLevelOrder_0300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('customDialogLevelOrder_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('-100001'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('myOrder'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let top = AppStorage.get('customLevel') as number
      expect(top).assertEqual(-100000)
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('close'));
      await button2.click();
      await CommonFunc.sleep(1000);
      console.info('customDialogLevelOrder_0300 END');
      done();
    });
    /**
     * @tc.name   customDialogLevelOrder_0400
     * @tc.number SUB_ACE_customDialogLevelOrder_0400
     * @tc.desc   To test the LevelOrder attribute of customDialog,LevelOrder.clamp(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customDialogLevelOrder_0400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('customDialogLevelOrder_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('undefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('myOrder'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let top = AppStorage.get('customLevel') as number
      expect(top).assertEqual(0)
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('close'));
      await button2.click();
      await CommonFunc.sleep(1000);
      console.info('customDialogLevelOrder_0400 END');
      done();
    });
  })
}
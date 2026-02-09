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


export default function overlayManagerTest() {
  describe('overlayManagerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("overlayManagerTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/overlayManager/overlayManagerTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get overlayManagerTest state pages: " + JSON.stringify(pages));
        if (!("overlayManagerTest" == pages.name)) {
          console.info("get overlayManagerTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push overlayManagerTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push overlayManagerTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      if (AppStorage.get('myTop') != undefined || AppStorage.get('myBottom') != undefined) {
        AppStorage.delete('myTop')
        AppStorage.delete('myBottom')
      }
      await CommonFunc.sleep(1000);
      console.info("customDialogLevelOrder after each called");
    });

    /**
     * @tc.name   overlayManagerTest_0100
     * @tc.number SUB_ACE_overlayManagerTest_0100
     * @tc.desc   To test LevelOrder.clamp,addComponentContentWithOrder,getBottomOrder,getTopOrder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('overlayManagerTest_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('overlayManagerTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('-100001'));
      await button.click();
      await CommonFunc.sleep(500);
      let button4 = await driver.findComponent(ON.id('myTop'));
      await button4.click();
      await CommonFunc.sleep(500);
      let button5 = await driver.findComponent(ON.id('myBottom'));
      await button5.click();
      await CommonFunc.sleep(500);
      let top = AppStorage.get('myTop') as number
      let bottom = AppStorage.get('myBottom') as number

      expect(top).assertEqual(-100000)
      expect(bottom).assertEqual(-100000)
      await CommonFunc.sleep(500);


      let button2 = await driver.findComponent(ON.id('undefined'));
      await button2.click();
      await CommonFunc.sleep(500);
      await button4.click();
      await CommonFunc.sleep(500);
      await button5.click();
      await CommonFunc.sleep(500);
      top = AppStorage.get('myTop') as number
      bottom = AppStorage.get('myBottom') as number

      expect(top).assertEqual(0)
      expect(bottom).assertEqual(-100000)
      await CommonFunc.sleep(500);


      let button3 = await driver.findComponent(ON.id('0.111'));
      await button3.click();
      await CommonFunc.sleep(500);

      await button4.click();
      await CommonFunc.sleep(500);
      await button5.click();
      await CommonFunc.sleep(500);
      top = AppStorage.get('myTop') as number
      bottom = AppStorage.get('myBottom') as number

      expect(top).assertEqual(0.111)
      expect(bottom).assertEqual(-100000)
      await CommonFunc.sleep(500);


      let button1 = await driver.findComponent(ON.id('100001'));
      await button1.click();
      await CommonFunc.sleep(500);
      await button4.click();
      await CommonFunc.sleep(500);
      await button5.click();
      await CommonFunc.sleep(500);
      top = AppStorage.get('myTop') as number
      bottom = AppStorage.get('myBottom') as number

      expect(top).assertEqual(100000)
      expect(bottom).assertEqual(-100000)
      await CommonFunc.sleep(500);

      let button6 = await driver.findComponent(ON.id('remove'));
      await button6.click();
      await CommonFunc.sleep(500);
      await button6.click();
      await CommonFunc.sleep(500);
      await button6.click();
      await CommonFunc.sleep(500);
      await button6.click();
      await CommonFunc.sleep(500);
      console.info('overlayManagerTest_0100 END');
      done();
    });

  })
}

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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
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
import CommonFunc from '../../MainAbility/common/Common';


export default function responseRegionListTest() {
  describe('responseRegionListTest', () => {
    beforeEach(async (done: Function) => {
      console.info("responseRegionListTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/responseRegion/responseRegionList",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get responseRegionListTest state pages: " + JSON.stringify(pages));
        if (!("Gesture" == pages.name)) {
          console.info("get responseRegionListTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push responseRegionListTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push responseRegionListTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    responseRegionListTest_0100
     * @tc.name      responseRegionListTest_0100
     * @tc.desc      responseRegionListTest default []
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('responseRegionListTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('responseRegionListTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button1'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('click1')).assertEqual('button1 clicked');
      console.info('[responseRegionListTest_0100] END');
      done();
    });

    /**
     * @tc.number    responseRegionListTest_0200
     * @tc.name      responseRegionListTest_0200
     * @tc.desc      responseRegionListTest change responseRegion
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('responseRegionListTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('responseRegionListTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button2'));
      let rect = await button.getBounds();
      await driver.click(Math.round(rect.right + (rect.right - rect.left) / 2),
        Math.round(rect.top + (rect.bottom - rect.top) / 2))
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('click2')).assertEqual('button2 clicked');
      expect(ResponseRegionSupportedTool.FINGER).assertEqual(1);
      console.info('[responseRegionListTest_0200] END');
      done();
    });

    /**
     * @tc.number    responseRegionListTest_0300
     * @tc.name      responseRegionListTest_0300
     * @tc.desc      responseRegionListTest change responseRegion
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('responseRegionListTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('responseRegionListTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button3'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('click3')).assertEqual('button3 clicked');
      expect(ResponseRegionSupportedTool.ALL).assertEqual(0);
      console.info('[responseRegionListTest_0300] END');
      done();
    });

    /**
     * @tc.number    responseRegionListTest_0400
     * @tc.name      responseRegionListTest_0400
     * @tc.desc      responseRegionListTest change responseRegion
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('responseRegionListTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('responseRegionListTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button4'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('click4')).assertEqual('button4 clicked');
      expect(ResponseRegionSupportedTool.PEN).assertEqual(2);
      console.info('[responseRegionListTest_0400] END');
      done();
    });

    /**
     * @tc.number    responseRegionListTest_0500
     * @tc.name      responseRegionListTest_0500
     * @tc.desc      responseRegionListTest change responseRegion
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('responseRegionListTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('responseRegionListTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button5'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('click5')).assertEqual('button5 clicked');
      expect(ResponseRegionSupportedTool.MOUSE).assertEqual(3);
      console.info('[responseRegionListTest_0500] END');
      done();
    });
  })
}
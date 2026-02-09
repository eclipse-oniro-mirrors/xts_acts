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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.layout.split04/EntryAbility';

export default function GridRows2() {
  describe('GridRows2', () => {
    beforeEach(async (done: Function) => {
      console.info("GridRows2 beforeEach start");

      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info('[GridRows2] enable success');
      }).catch((err: object) => {
        console.error(`[GridRows2] failed to enable, ${err}`)
      })

      console.info("GridRows2 beforeEach start 222")
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridRows2 state pages:" + JSON.stringify(pages));
        if (!("GridRows2" == pages.name)) {
          console.info("get  GridRows2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/GridRow/GridRows2"})
          await CommonFunc.sleep(2000);
          console.info("push GridRows2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridRows2 page error:" + err);
      }
      console.info("GridRows2 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GridRows2 after each called");
    });


    /**
     * @tc.name   GridRows2_001
     * @tc.number GridRows2_001
     * @tc.desc   GridRows2_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridRows2_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[GridRows2_001] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('GridRows2Bt1'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);

      let grid = CommonFunc.getComponentRect('GridRows2');
      let row1 = CommonFunc.getComponentRect('GridRows2_1');
      let row2 = CommonFunc.getComponentRect('GridRows2_2');
      await CommonFunc.sleep(2000);

      console.info("[GridRows2_001] GridRows2_1 is: " + JSON.stringify(row1) + 'GridRows2_5:' + JSON.stringify(row2) );
      expect(Math.abs(Math.round(row2.left - row1.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(grid.bottom - row1.bottom)) <= 1).assertTrue();

      console.info('[GridRows2_001] END');
      done();
    });


    /**
     * @tc.name   GridRows2_002
     * @tc.number GridRows2_002
     * @tc.desc   GridRows2_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridRows2_002',  Level.LEVEL0, async (done: Function) => {
      console.info('[GridRows2_001] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('GridRows2Bt2'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);

      let rel = CommonFunc.getComponentRect('GridRows2');
      await driver.mouseClick({x: Math.round(rel.left + vp2px(50)), y: Math.round(rel.top + vp2px(50))}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('GridRows2Text');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridRows2_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('');

      console.info('[GridRows2_001] END');
      done();
    });






  })
}

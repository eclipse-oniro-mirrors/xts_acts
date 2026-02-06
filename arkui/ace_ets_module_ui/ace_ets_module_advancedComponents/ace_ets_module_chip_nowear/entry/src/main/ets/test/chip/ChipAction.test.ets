/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
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
  MouseButton,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function ChipAction() {
  describe('ChipAction', () => {
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/chip/ChipAction',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChipAction state pages: " + JSON.stringify(pages));
        if (!("ChipAction" == pages.name)) {
          console.info("get ChipAction state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipAction page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipAction page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ChipAction_001
     * @tc.number ChipAction_001
     * @tc.desc   action event test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ChipAction_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      console.info('ChipAction_001 START');
      let ChipActionCol = CommonFunc.getComponentRect('ChipActionCol');
      await CommonFunc.sleep(200);
      let right: number = ChipActionCol.right - vp2px(22);
      let top: number = ChipActionCol.top + vp2px(18);
      await CommonFunc.sleep(200);
      console.info('ChipAction_001 right：' + right + 'top:' + top);
      let driver = Driver.create();
      await driver.mouseClick({
        x: Math.round(right), y: Math.round(top)
      }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      console.info('ChipAction_001 click success');

      let strJson1 = getInspectorByKey('ChipAction');
      await CommonFunc.sleep(1000);
      console.info("[ChipAction_001] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('action');
      console.info('[ChipAction_001] END');

      done();
    });


  })
}

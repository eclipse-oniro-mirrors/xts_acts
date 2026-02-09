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


export default function dialogButtonStyle() {
  describe('dialogButtonStyle', () => {
    beforeEach(async (done: Function) => {
      console.info("dialogButtonStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Dialog/dialogButtonStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dialogButtonStyle state pages: " + JSON.stringify(pages));
        if (!("dialogButtonStyle" == pages.name)) {
          console.info("get dialogButtonStyle state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push dialogButtonStyle success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dialogButtonStyle page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("dialogButtonStyle after each called");
    });

    /**
     * @tc.number SUB_ACE_dialogButtonStyle_0100
     * @tc.name dialogButtonStyle_0100
     * @tc.desc To test the dialogButtonStyle: DialogButtonStyle.DEFAULT
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('dialogButtonStyle_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('dialogButtonStyle_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('alertDialog'));
      await button.click();
      await CommonFunc.sleep(1000);

      let btn2: Component = await driver.findComponent(ON.text('ok'));
      expect(btn2 != null ).assertTrue();
      await btn2.click();
      console.info('dialogButtonStyle_0100 END');
      done();
    });
  })
}
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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function focusWrapDefault() {
  describe('focusWrapDefault', () => {
    beforeEach(async (done: Function) => {
      console.info("focusWrapDefault beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/focusWrapDefault",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get focusWrapDefault state pages:" + JSON.stringify(pages));
        if (!("focusWrapDefault" == pages.name)) {
          console.info("get focusWrapDefault pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push focusWrapDefault page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push focusWrapDefault page error:" + err);
      }
      console.info("focusWrapDefault beforeEach end");
      done();
    });

    /**
     * @tc.name   focusWrapDefault_0100
     * @tc.number focusWrapDefault_001
     * @tc.desc   The cross axis directional keys cannot wrap lines.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusWrapDefault_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[focusWrapDefault_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('focusWrapMode_default');
      console.info("[focusWrapDefault_0100] $type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[focusWrapDefault_0100] $attrs: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[focusWrapDefault_0100] focusWrapMode: " + JSON.stringify(JSON.parse(strJson).$attrs.focusWrapMode));
      expect(JSON.parse(strJson).$type).assertEqual("Grid");
      expect(JSON.parse(strJson).$attrs.focusWrapMode).assertEqual("FocusWrapMode.DEFAULT");

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      //await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.triggerKey(2015);
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2015);
      await CommonFunc.sleep(1000);

      let btn: Component = await driver.findComponent(ON.id('default_focused_c'));
      let btn_isFocusedValue = await btn.isFocused()
      expect(btn_isFocusedValue).assertEqual(false);
      console.info('[focusWrapDefault_0100] GridItem isFocused');
      console.info('[focusWrapDefault_0100] END');
      done();
    });
  })
}

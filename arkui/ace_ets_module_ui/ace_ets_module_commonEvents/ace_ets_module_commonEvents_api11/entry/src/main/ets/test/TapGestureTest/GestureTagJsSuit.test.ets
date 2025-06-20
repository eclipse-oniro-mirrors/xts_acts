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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';
export default function GestureTagJsSuit() {
  describe('GestureTagJsSuit', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      console.info("GestureTagJsSuit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TapGesture/GestureTag',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GestureTagJsSuit state pages: " + JSON.stringify(pages));
        if (!("overlay" == pages.name)) {
          console.info("get GestureTagJsSuit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GestureTagJsSuit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GestureTagJsSuit page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });

    /**
     * @tc.number	 SUB_ACE_TS_COMPONENTGestureTag_01
     * @tc.name 	 GestureTagJsSuit_0100
     * @tc.desc 	 Confirm if there is a callback
	 * @tc.level     Level 2
     */

    it('GestureTagJsSuit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[GestureTagJsSuit_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('TapGestureclick'));
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TapGestureclick');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GestureTagJsSuit_0100] obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content=='Click twice').assertTrue();
      console.info('[GestureTagJsSuit_0100] END');
      done();
    });
  })
}
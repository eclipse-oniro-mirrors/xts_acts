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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import config from '@ohos.accessibility.config'
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api12/EntryAbility';

export default function onKeyPreImeTest() {
  describe('onKeyPreImeTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info('enable success');
      }).catch((err: object) => {
        console.error('failed to enable, ${err}');
      })
      console.info("onKeyPreImeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/onKeyEvent/OnKeyPreIme",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onKeyPreImeTest state pages: " + JSON.stringify(pages));
        if (!("OnKeyPreIme" == pages.name)) {
          console.info("get onKeyPreImeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onKeyPreImeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onKeyPreImeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    onKeyPreImeTest_0010
     * @tc.name      onKeyPreImeTest_0010
     * @tc.desc      frameNode: onKeyPreIme
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onKeyPreImeTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('onKeyPreImeTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('onKeyPreIme_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('onKeyPreIme_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onKeyPreImeTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.height).assertEqual('40.00vp');
      console.info('[onKeyPreImeTest_0010] END');
      done();
    });

    /**
     * @tc.number    onKeyPreImeTest_0020
     * @tc.name      onKeyPreImeTest_0020
     * @tc.desc      KeyEvent: getModifierKeyState
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onKeyPreImeTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('onKeyPreImeTest_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('onKeyPreIme_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state_button');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onKeyPreImeTest_0020] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('true');
      console.info('[onKeyPreImeTest_0020] END');
      done();
    });
  })
}


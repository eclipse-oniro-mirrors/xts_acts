/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function gestureEnabledJsunit() {
  describe('gestureEnabledJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("gestureEnabledJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gestureEnabled',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gestureEnabledJsunit state pages: " + JSON.stringify(pages));
        if (!("gestureEnabled" == pages.name)) {
          console.info("get gestureEnabledJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push gestureEnabledJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gestureEnabledJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('value'));
      await button.click();
    });
	
	  /**
     * @tc.number: SUB_ACE_TS_COMPONENT_TAPGESTURE_01
     * @tc.name : gestureEnabledJsunit_0100
     * @tc.desc : Does the TapGesture click trigger
     */

    it('gestureEnabledJsunit_0100', 0, async (done: Function) => {

      console.info('gestureEnabledJsunit_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('gestureOnce'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('gestureText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[gestureEnabledJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[gestureEnabledJsunit_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("TapGesture单击 已触发");
      console.info('[gestureEnabledJsunit_0100] END');
      done();
    });
	
	/**
     * @tc.number: SUB_ACE_TS_COMPONENT_TAPGESTURE_02
     * @tc.name : gestureEnabledJsunit_0200
     * @tc.desc : Does the TapGesture click trigger
     */

    it('gestureEnabledJsunit_0200', 0, async (done: Function) => {

      console.info('gestureEnabledJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('gesture1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('gestureText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[gestureEnabledJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[gestureEnabledJsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("Gesture enabled false");
      console.info('[gestureEnabledJsunit_0200] END');
      done();
    });
	
	/**
     * @tc.number: SUB_ACE_TS_COMPONENT_TAPGESTURE_03
     * @tc.name : gestureEnabledJsunit_0300
     * @tc.desc : Does the TapGesture doubleClick trigger
     */

    it('gestureEnabledJsunit_0300', 0, async (done: Function) => {

      console.info('gestureEnabledJsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('gesture2'));
      await button.doubleClick();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('gestureText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[gestureEnabledJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[gestureEnabledJsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("Gesture enabled false");
      console.info('[gestureEnabledJsunit_0300] END');
      done();
    });
	
	/**
     * @tc.number: SUB_ACE_TS_COMPONENT_TAPGESTURE_04
     * @tc.name : gestureEnabledJsunit_0400
     * @tc.desc : Does the TapGesture longClick trigger
     */

    it('gestureEnabledJsunit_0400', 0, async (done: Function) => {

      console.info('gestureEnabledJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('gesture3'));
      await button.longClick();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('gestureText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[gestureEnabledJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[gestureEnabledJsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("Gesture enabled false");
      console.info('[gestureEnabledJsunit_0400] END');
      done();
    });

  })
}


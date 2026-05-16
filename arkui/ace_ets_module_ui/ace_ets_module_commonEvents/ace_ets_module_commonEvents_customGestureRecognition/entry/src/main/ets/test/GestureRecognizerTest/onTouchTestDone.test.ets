/*
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

async function clickAt(tap1: string, tap2?: string) {
  let driver : Driver = await Driver.create()
  await CommonFunc.sleep(1000);
  let tap = await driver.findComponent(ON.id(tap1));
  let tapRect = await tap.getBounds();
  if (tap2) {
    let tap2Object = await driver.findComponent(ON.id(tap2));
    let tapRect2 = await tap2Object.getBounds();
    console.info('tap1 click at: ' + Math.round(tapRect.left + (tapRect.right - tapRect.left)/2), Math.round(tapRect2.bottom + (tapRect.bottom - tapRect2.bottom)/2));
    await driver.click(Math.round(tapRect.left + (tapRect.right - tapRect.left)/2), Math.round(tapRect2.bottom + (tapRect.bottom - tapRect2.bottom)/2));
  } else {
    console.info('tap1 click at: ' + Math.round(tapRect.left + (tapRect.right - tapRect.left)/2), Math.round(tapRect.top + (tapRect.bottom - tapRect.top)/2));
    await driver.click(Math.round(tapRect.left + (tapRect.right - tapRect.left)/2), Math.round(tapRect.top + (tapRect.bottom - tapRect.top)/2));
  }
  await CommonFunc.sleep(500);
}

export default function onTouchTestDoneTest() {
  describe('onTouchTestDoneTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/onTouchTestDone',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get onTouchTestDoneTest state pages: ' + JSON.stringify(pages));
        if (!('NormalEts' == pages.name)) {
          console.info('get onTouchTestDoneTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push onTouchTestDoneTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push onTouchTestDoneTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('onTouchTestDone after each called');
    });

    /**
     * @tc.name   onTouchTestDoneTest_0010
     * @tc.number onTouchTestDoneTest_0010
     * @tc.desc   onTouchTestDone prevent gesture tag: Null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onTouchTestDoneTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('onTouchTestDoneTest_0010 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let currentTag = await driver.findComponent(ON.id('currentTag'));
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('currentTag');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Current prevent gesture tag: Null');

      await clickAt('tap1','tap2');
      strJson = getInspectorByKey('text');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Current Gesture: Tap1');

      await clickAt('tap2','tap3');
      strJson = getInspectorByKey('text');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Current Gesture: Tap2');

      await clickAt('tap3','tap4');
      strJson = getInspectorByKey('text');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Current Gesture: Tap3');

      await clickAt('tap4');
      strJson = getInspectorByKey('text');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Current Gesture: Tap4');

      console.info('[onTouchTestDoneTest_0010] END');
      done();
    });

    /**
     * @tc.name   onTouchTestDoneTest_0020
     * @tc.number onTouchTestDoneTest_0020
     * @tc.desc   onTouchTestDone prevent gesture tag: Tap2 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onTouchTestDoneTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('onTouchTestDoneTest_0020 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('button'));
      await button.click();
      await CommonFunc.sleep(500);
      await button.click();
      let currentTag = await driver.findComponent(ON.id('currentTag'));
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('currentTag');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0020] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Current prevent gesture tag: Tap2');

      await clickAt('tap1','tap2');
      strJson = getInspectorByKey('text');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0020] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Current Gesture: Tap1');

      await clickAt('tap2','tap3');
      strJson = getInspectorByKey('text');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0020] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Current Gesture: Tap1');

      await clickAt('tap3','tap4');
      strJson = getInspectorByKey('text');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0020] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Current Gesture: Tap3');

      await clickAt('tap4');
      strJson = getInspectorByKey('text');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_0020] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Current Gesture: Tap4');
      console.info('[onTouchTestDoneTest_0020] END');
      done();
    });
  })
}
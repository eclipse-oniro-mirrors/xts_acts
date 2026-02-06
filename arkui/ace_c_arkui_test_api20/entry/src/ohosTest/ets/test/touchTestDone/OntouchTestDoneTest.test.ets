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

import { expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

async function clickAt(tap1: string, tap2?: string) {
  let driver : Driver = await Driver.create()
  await Utils.sleep(1000);
  let tap = await driver.findComponent(ON.id(tap1));
  let tapRect = await tap.getBounds();
  if (tap2) {
    let tap2Object = await driver.findComponent(ON.id(tap2));
    let tapRect2 = await tap2Object.getBounds();
    console.info('click at: ' + Math.round(tapRect.left + (tapRect.right - tapRect.left)/2), Math.round(tapRect2.bottom + (tapRect.bottom - tapRect2.bottom)/2));
    await driver.click(Math.round(tapRect.left + (tapRect.right - tapRect.left)/2), Math.round(tapRect2.bottom + (tapRect.bottom - tapRect2.bottom)/2));
  } else {
    //longpress
    console.info('click at: ' + Math.round(tapRect.left + (tapRect.right - tapRect.left)/2), Math.round(tapRect.top + (tapRect.bottom - tapRect.top)/2));
    await driver.longClickAt({ x: Math.round(tapRect.left + (tapRect.right - tapRect.left)/2), y: Math.round(tapRect.top + (tapRect.bottom - tapRect.top)/2), displayId: 0 }, 3000);
  }
  await Utils.sleep(500);
}

export default function OntouchTestDoneTest(){

  describe('OntouchTestDoneTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_OntouchTestDone_0100
     * @tc.name       : OntouchTestDoneTest001
     * @tc.desc       : onTouchTestDone prevent gesture tap , response click and longpress
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('OntouchTestDoneTest001', Level.LEVEL0, async (done: Function) => {
      let PAGE_TAG = 'OntouchTestDoneTest';
      await Utils.pushPage(`touchTestDone/${PAGE_TAG}`);

      console.info('onTouchTestDoneTest_001 START');
      let driver : Driver = await Driver.create()
      await Utils.sleep(1000);

      let textId = await driver.findComponent(ON.id('textId'));
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textId');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_001] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('default');

      await clickAt('tap1','tap2');
      strJson = getInspectorByKey('textId');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_001] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('stack click tap is called');

      await clickAt('tap2','tap3');
      strJson = getInspectorByKey('textId');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_001] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('stack click tap is called');

      await clickAt('tap3','tap4');
      strJson = getInspectorByKey('textId');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_001] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('stack click tap is called');

      await clickAt('tap4');
      strJson = getInspectorByKey('textId');
      obj = JSON.parse(strJson);
      console.info('[onTouchTestDoneTest_001] Obj: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('column3 LongPress is called');

      console.info('[onTouchTestDoneTest_001] END');
      done();
    });

  })
}
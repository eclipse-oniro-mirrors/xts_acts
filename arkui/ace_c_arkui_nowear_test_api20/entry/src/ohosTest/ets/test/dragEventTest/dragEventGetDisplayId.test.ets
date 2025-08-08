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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import { UiComponent, UiDriver, Component, Driver, ON, BY, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';

export default function dragEventGetDisplayIdTest() {

  describe('dragEventGetDisplayIdTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

   /*
   * @tc.number     : SUB_ARKUI_CAPI_OH_ARKUI_DRAGEVENT_GETDISPLAYID_0100
   * @tc.name       : dragEventGetDisplayId0001
   * @tc.desc       : testing dragEvent getDisplayId
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */

  it('dragEventGetDisplayId0001', Level.LEVEL1, async (done: Function) => {
    console.info('dragEventGetDisplayId0001 START');
    let PAGE_TAG = 'dragEventGetDisplayId';
    await Utils.pushPage(`dragEvent/dragEventGetDisplayId`)
    await Utils.sleep(2000)
    let driver = await Driver.create();
    let grid = await driver.findComponent(ON.id('image'));
    let button = await driver.findComponent(ON.id('dragArea'));
    await grid.dragTo(button);
    await Utils.sleep(1000);
    let strJson = getInspectorByKey('image');
    let obj: ESObject = JSON.parse(strJson);
    console.info("[dragEventGetDisplayId_0001]:" + JSON.stringify(obj.$attrs.backgroundColor));
    expect(obj.$attrs.backgroundColor).assertEqual('#FF00FF00');
    await Utils.sleep(1000)
    console.info('dragEventGetDisplayId_0001 END');
    done();
  });

   /*
   * @tc.number     : SUB_ARKUI_CAPI_OH_ARKUI_DRAGEVENT_GETTOUCHPOINTGLOBALDISPLAY_0100
   * @tc.name       : dragEventTouchPointDisplayXY0001
   * @tc.desc       : testing dragEvent getGlobalDisplay
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */

  it('dragEventTouchPointDisplayXY0001', Level.LEVEL1, async (done: Function) => {
  console.info('dragEventGetDisplayId0001 START');
  let PAGE_TAG = 'dragEventGetGlobalDisplay';
  await Utils.pushPage(`dragEvent/dragEventGetGlobalDisplay`)
  await Utils.sleep(2000)
  let driver = await Driver.create();
  let grid = await driver.findComponent(ON.id('image'));
  let button = await driver.findComponent(ON.id('dragArea'));
  await grid.dragTo(button);
  await Utils.sleep(1000);
  let strJson = getInspectorByKey('image');
  let obj: ESObject = JSON.parse(strJson);
  console.info("[dragEventGetDisplayId_0001]:" + JSON.stringify(obj.$attrs.backgroundColor));
  expect(obj.$attrs.backgroundColor).assertEqual('#FF00FF00');
  await Utils.sleep(1000)
  console.info('dragEventGetDisplayId_0001 END');
  done();
});
  })
}
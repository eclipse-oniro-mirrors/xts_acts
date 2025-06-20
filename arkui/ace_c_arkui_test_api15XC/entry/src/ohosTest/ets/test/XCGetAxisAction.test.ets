/*
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

import { describe, it, expect, beforeEach, Level } from '@ohos/hypium';
import Utils from './common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';

export default function XCGetAxisAction() {

  describe('XCGetAxisAction', () => {

    let PAGE_TAG = 'xc';

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });
    /*
     * @tc.number     : SUB_ACE_TOOLCHAIN_ARKUI_XCOMPONENT_AXISACTION_CAPI_0001
     * @tc.name       : XCGetAxisAction001
     * @tc.desc       : XComponent获取鼠标轴事件
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('XCGetAxisAction001', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[XCGetAxisAction001] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let drawStarButton = await driver.findComponent(ON.id('DrawStarButton'));
      await Utils.sleep(1000);
      console.info("[XCGetAxisAction001] start succ 1");
      await drawStarButton.click();
      await Utils.sleep(1000);
      console.info("[XCGetAxisAction001] start succ 2");
      await driver.mouseScroll({x:600, y:600}, true, 30, 2072,20)
      await Utils.sleep(2000);
      console.info("[XCGetAxisAction001] start succ 3");
      let getActionValueButton = await driver.findComponent(ON.id('GetActionValueButton'));
      await Utils.sleep(1000);
      await getActionValueButton.click();
      console.info("[XCGetAxisAction001] start succ 4");
      let callbackJson = getInspectorByKey('actionText');
      await Utils.sleep(200);
      let obj: ESObject = JSON.parse(callbackJson);
      console.info("[XCGetAxisAction001] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.content).assertEqual('10');
      done()
    });
  })
}

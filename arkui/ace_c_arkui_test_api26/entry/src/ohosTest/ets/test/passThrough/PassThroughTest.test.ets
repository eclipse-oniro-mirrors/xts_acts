/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';

export default function passThroughTest() {

  describe('passThroughTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_PASSTHROUGH_0100
     * @tc.name      SUB_ACE_ARKUI_PASSTHROUGH_0100
     * @tc.desc      test passThrough true
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_PASSTHROUGH_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_PASSTHROUGH_0100] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'PassThroughTest';
      await Utils.pushPage(`passThrough/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('true'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ACE_ARKUI_PASSTHROUGH_0100] passThrough: ' + obj.$attrs.label);
      expect(obj.$attrs.label).assertEqual('1');
      console.info('[SUB_ACE_ARKUI_PASSTHROUGH_0100] END');
      done();
    })
    /**
     * @tc.number    SUB_ACE_ARKUI_PASSTHROUGH_0200
     * @tc.name      SUB_ACE_ARKUI_PASSTHROUGH_0200
     * @tc.desc      test passThrough false
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_PASSTHROUGH_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_PASSTHROUGH_0200] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'PassThroughTest';
      await Utils.pushPage(`passThrough/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('false'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ACE_ARKUI_PASSTHROUGH_0200] passThrough: ' + obj.$attrs.label);
      expect(obj.$attrs.label).assertEqual('1');
      console.info('[SUB_ACE_ARKUI_PASSTHROUGH_0200] END');
      done();
    })
    /**
     * @tc.number    SUB_ACE_ARKUI_PASSTHROUGH_0300
     * @tc.name      SUB_ACE_ARKUI_PASSTHROUGH_0300
     * @tc.desc      test passThrough nullptr
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_PASSTHROUGH_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_PASSTHROUGH_0300] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'PassThroughTest';
      await Utils.pushPage(`passThrough/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('nullptr'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('nullptr');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ACE_ARKUI_PASSTHROUGH_0300] passThrough: ' + obj.$attrs.label);
      expect(obj.$attrs.label).assertEqual('1');
      console.info('[SUB_ACE_ARKUI_PASSTHROUGH_0300] END');
      done();
    })
  })
}
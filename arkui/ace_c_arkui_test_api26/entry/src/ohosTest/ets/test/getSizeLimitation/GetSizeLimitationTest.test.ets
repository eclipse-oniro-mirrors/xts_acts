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

export default function GetSizeLimitationTest() {

  describe('GetSizeLimitationTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_GETSIZELIMITATION_0100
     * @tc.name      SUB_ACE_ARKUI_GETSIZELIMITATION_0100
     * @tc.desc      test getSizeLimitation
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GETSIZELIMITATION_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GETSIZELIMITATION_0100] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'GetSizeLimitationTest';
      await Utils.pushPage(`getSizeLimitation/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('buttonSnapshotSizeLimitation'));
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('buttonSnapshotSizeLimitation');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ACE_ARKUI_GETSIZELIMITATION_0100] getSizeLimitation: ' + obj.$attrs.label);
      expect(obj.$attrs.label).assertEqual('SUCCESS');
      console.info('[SUB_ACE_ARKUI_GETSIZELIMITATION_0100] END');
      done();
    })
  })
}
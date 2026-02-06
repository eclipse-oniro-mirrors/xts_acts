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

import { beforeEach, describe, expect, it, Level} from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'
import { Component, Driver, ON } from '@ohos.UiTest';

export default function KeyEventGetTypeTest() {

  describe('KeyEventGetTypeTest', () => {

    let PAGE_TAG = 'KeyEventGetTypeTest';

    beforeEach(async (done: Function) => {
      await Utils.pushPage(`keyEvent/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   KeyEventGetTypeTest_001
     * @tc.number SUB_ARKUI_CAPI_KeyEvent_GetType_0100
     * @tc.desc   testing KeyEvent GetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyEventGetTypeTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('KeyEventGetTypeTest_001 START');
      await Utils.sleep(500);
      let driver = await Driver.create()
      await Utils.sleep(500);
      await driver.triggerKey(2049);
      await Utils.sleep(500);
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00');
      console.info('KeyEventGetTypeTest_001 END');
      done();
    })
  })
}

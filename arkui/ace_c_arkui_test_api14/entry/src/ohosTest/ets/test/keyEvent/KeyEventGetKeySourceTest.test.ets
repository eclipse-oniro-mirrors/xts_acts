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

export default function KeyEventGetKeySourceTest() {

  describe('KeyEventGetKeySourceTest', () => {

    let PAGE_TAG = 'KeyEventGetKeySourceTest';

    beforeEach(async (done: Function) => {
      await Utils.pushPage(`keyEvent/${PAGE_TAG}`, done);
    });

   
    /*
      * @tc.number     : SUB_ARKUI_CAPI_KeyEvent_GetKeySource_0100
      * @tc.name       : KeyEventGetKeySourceTest_001
      * @tc.desc       : testing KeyEvent GetType
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
     it('KeyEventGetKeySourceTest_001', Level.LEVEL1, async (done: Function) => {
       console.info('KeyEventGetKeySourceTest_001 START');
        let driver = await Driver.create()
        await Utils.sleep(500);
        await driver.triggerKey(2049);
        await Utils.sleep(500);
        expect(Utils.getComponentInfoByKey('KeyEventGetKeySource').$attrs.backgroundColor).assertEqual('#FF00FF00');
        done();
     })
  })
}

'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { expect, describe, it, afterEach, Level,describe,beforeAll,beforeEach } from '../../../../hypium';
import { Component, Driver, ON,  PointerMatrix, Rect  } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import inspector from '@ohos.arkui.inspector'
import { LibUtil } from '../../../ets/pages/LibUtil'
let libUtil:LibUtil = new LibUtil()
export default function tabStop(){

  describe('tabStop', (): void  => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api14.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);

    });

    

    /**
     * @tc.number   tabStop_001
     * @tc.name     tabStop_001
     * @tc.desc     tabStop_001
     * @tc.level    Level.LEVEL1
     */
    it('tabStop_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.tabStop_001()).assertEqual(0)
      done()
    })
  })
}
'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, expect, it, afterEach, Level,beforeAll,beforeEach } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON, MouseButton,Component,Point } from '@kit.TestKit';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';
import {LibUtil} from '../../../ets/pages/LibUtil'
let libUtil:LibUtil = new LibUtil();

export default function customComponentSecondaryLayoutTest() {

  describe('CustomComponentSecondaryLayoutTest', () => {

    let PAGE_TAG = 'CustomComponentSecondaryLayoutTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`commonevent/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testCustomComponentSecondaryLayout001
     * @tc.name     testCustomComponentSecondaryLayout001
     * @tc.desc     testCustomComponentSecondaryLayout001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentSecondaryLayout001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let dataArray: number[][] = libUtil.getSecondaryLayoutData();
      console.log('testCustomComponentSecondaryLayout001', JSON.stringify(dataArray))
      let secondaryLayoutData: number[] = dataArray[0];
      expect(secondaryLayoutData[0] == 120 && secondaryLayoutData[1] == 150).assertEqual(true)
      done()
    })
  })
}

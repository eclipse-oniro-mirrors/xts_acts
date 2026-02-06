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

import { beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function customDialogCustomStyleTest() {

  describe('CustomDialogCustomStyleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomDialogCustomStyle001
     * @tc.name     testCustomDialogCustomStyle001
     * @tc.desc     testCustomDialogCustomStyle001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogCustomStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogCustomStyle001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogCustomStyle002
     * @tc.name     testCustomDialogCustomStyle002
     * @tc.desc     testCustomDialogCustomStyle002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogCustomStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogCustomStyle002()).assertEqual(0)
      done()
    })
  })
}

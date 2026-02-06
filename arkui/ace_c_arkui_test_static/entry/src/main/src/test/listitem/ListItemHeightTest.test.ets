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

import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function listItemHeightTest() {

  describe('ListItemHeightTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListItemHeight001
     * @tc.name     testListItemHeight001
     * @tc.desc     testListItemHeight001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemHeight001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemHeight001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemHeight002
     * @tc.name     testListItemHeight002
     * @tc.desc     testListItemHeight002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemHeight002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemHeight002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemHeight003
     * @tc.name     testListItemHeight003
     * @tc.desc     testListItemHeight003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemHeight003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemHeight003()).assertEqual(0)
      done()
    })
  })
}

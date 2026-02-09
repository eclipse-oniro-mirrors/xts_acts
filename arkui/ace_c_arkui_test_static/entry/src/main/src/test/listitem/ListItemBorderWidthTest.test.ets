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

export default function listItemBorderWidthTest() {

  describe('ListItemBorderWidthTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListItemBorderWidth001
     * @tc.name     testListItemBorderWidth001
     * @tc.desc     testListItemBorderWidth001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemBorderWidth001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemBorderWidth001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemBorderWidth002
     * @tc.name     testListItemBorderWidth002
     * @tc.desc     testListItemBorderWidth002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemBorderWidth002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemBorderWidth002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemBorderWidth003
     * @tc.name     testListItemBorderWidth003
     * @tc.desc     testListItemBorderWidth003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemBorderWidth003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemBorderWidth003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemBorderWidth004
     * @tc.name     testListItemBorderWidth004
     * @tc.desc     testListItemBorderWidth004
     * @tc.level    Level.LEVEL1
     */
    it('testListItemBorderWidth004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemBorderWidth004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemBorderWidth005
     * @tc.name     testListItemBorderWidth005
     * @tc.desc     testListItemBorderWidth005
     * @tc.level    Level.LEVEL1
     */
    it('testListItemBorderWidth005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemBorderWidth005()).assertEqual(0)
      done()
    })
  })
}

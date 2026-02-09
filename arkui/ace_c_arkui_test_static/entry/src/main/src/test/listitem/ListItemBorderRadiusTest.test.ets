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

export default function listItemBorderRadiusTest() {

  describe('ListItemBorderRadiusTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListItemBorderRadius001
     * @tc.name     testListItemBorderRadius001
     * @tc.desc     testListItemBorderRadius001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemBorderRadius001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemBorderRadius001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemBorderRadius002
     * @tc.name     testListItemBorderRadius002
     * @tc.desc     testListItemBorderRadius002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemBorderRadius002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemBorderRadius002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemBorderRadius003
     * @tc.name     testListItemBorderRadius003
     * @tc.desc     testListItemBorderRadius003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemBorderRadius003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemBorderRadius003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemBorderRadius004
     * @tc.name     testListItemBorderRadius004
     * @tc.desc     testListItemBorderRadius004
     * @tc.level    Level.LEVEL1
     */
    it('testListItemBorderRadius004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemBorderRadius004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemBorderRadius005
     * @tc.name     testListItemBorderRadius005
     * @tc.desc     testListItemBorderRadius005
     * @tc.level    Level.LEVEL1
     */
    it('testListItemBorderRadius005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemBorderRadius005()).assertEqual(0)
      done()
    })
  })
}

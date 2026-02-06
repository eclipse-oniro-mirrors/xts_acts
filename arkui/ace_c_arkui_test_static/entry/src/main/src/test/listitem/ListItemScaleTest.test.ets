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

export default function listItemScaleTest() {

  describe('ListItemScaleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListItemScale001
     * @tc.name     testListItemScale001
     * @tc.desc     testListItemScale001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemScale001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemScale001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemScale002
     * @tc.name     testListItemScale002
     * @tc.desc     testListItemScale002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemScale002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemScale002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemScale003
     * @tc.name     testListItemScale003
     * @tc.desc     testListItemScale003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemScale003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemScale003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemScale004
     * @tc.name     testListItemScale004
     * @tc.desc     testListItemScale004
     * @tc.level    Level.LEVEL1
     */
    it('testListItemScale004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemScale004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemScale005
     * @tc.name     testListItemScale005
     * @tc.desc     testListItemScale005
     * @tc.level    Level.LEVEL1
     */
    it('testListItemScale005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemScale005()).assertEqual(0)
      done()
    })
  })
}

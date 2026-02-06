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

export default function listAlignListItemTest() {

  describe('ListAlignListItemTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });
    
    
/**
     * @tc.number   testListAlignListItem001
     * @tc.name     testListAlignListItem001
     * @tc.desc     testListAlignListItem001
     * @tc.level    Level.LEVEL1
     */
    it('testListAlignListItem001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListAlignListItem001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListAlignListItem002
     * @tc.name     testListAlignListItem002
     * @tc.desc     testListAlignListItem002
     * @tc.level    Level.LEVEL1
     */
    it('testListAlignListItem002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListAlignListItem002()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListAlignListItem003
     * @tc.name     testListAlignListItem003
     * @tc.desc     testListAlignListItem003
     * @tc.level    Level.LEVEL1
     */
    it('testListAlignListItem003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListAlignListItem003()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListAlignListItem004
     * @tc.name     testListAlignListItem004
     * @tc.desc     testListAlignListItem004
     * @tc.level    Level.LEVEL1
     */
    it('testListAlignListItem004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListAlignListItem004()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListAlignListItem005
     * @tc.name     testListAlignListItem005
     * @tc.desc     testListAlignListItem005
     * @tc.level    Level.LEVEL1
     */
    it('testListAlignListItem005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListAlignListItem005()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListAlignListItem006
     * @tc.name     testListAlignListItem006
     * @tc.desc     testListAlignListItem006
     * @tc.level    Level.LEVEL1
     */
    it('testListAlignListItem006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListAlignListItem006()).assertEqual(0)
      done()
    })
  })
}

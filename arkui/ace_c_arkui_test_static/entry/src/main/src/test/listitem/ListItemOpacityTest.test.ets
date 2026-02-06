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

export default function listItemOpacityTest() {

  describe('ListItemOpacityTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListItemOpacity001
     * @tc.name     testListItemOpacity001
     * @tc.desc     testListItemOpacity001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemOpacity001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemOpacity001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemOpacity002
     * @tc.name     testListItemOpacity002
     * @tc.desc     testListItemOpacity002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemOpacity002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemOpacity002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemOpacity003
     * @tc.name     testListItemOpacity003
     * @tc.desc     testListItemOpacity003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemOpacity003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemOpacity003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemOpacity004
     * @tc.name     testListItemOpacity004
     * @tc.desc     testListItemOpacity004
     * @tc.level    Level.LEVEL1
     */
    it('testListItemOpacity004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemOpacity004()).assertEqual(0)
      done()
    })
  })
}

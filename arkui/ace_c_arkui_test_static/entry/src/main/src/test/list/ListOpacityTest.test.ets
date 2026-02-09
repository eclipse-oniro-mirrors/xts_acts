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

export default function listOpacityTest() {

  describe('ListOpacityTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListOpacity001
     * @tc.name     testListOpacity001
     * @tc.desc     testListOpacity001
     * @tc.level    Level.LEVEL1
     */
    it('testListOpacity001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListOpacity001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListOpacity002
     * @tc.name     testListOpacity002
     * @tc.desc     testListOpacity002
     * @tc.level    Level.LEVEL1
     */
    it('testListOpacity002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListOpacity002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListOpacity003
     * @tc.name     testListOpacity003
     * @tc.desc     testListOpacity003
     * @tc.level    Level.LEVEL1
     */
    it('testListOpacity003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListOpacity003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListOpacity004
     * @tc.name     testListOpacity004
     * @tc.desc     testListOpacity004
     * @tc.level    Level.LEVEL1
     */
    it('testListOpacity004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListOpacity004()).assertEqual(0)
      done()
    })
  })
}

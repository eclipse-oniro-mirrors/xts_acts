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

export default function listBorderRadiusTest() {

  describe('ListBorderRadiusTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListBorderRadius001
     * @tc.name     testListBorderRadius001
     * @tc.desc     testListBorderRadius001
     * @tc.level    Level.LEVEL1
     */
    it('testListBorderRadius001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListBorderRadius001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListBorderRadius002
     * @tc.name     testListBorderRadius002
     * @tc.desc     testListBorderRadius002
     * @tc.level    Level.LEVEL1
     */
    it('testListBorderRadius002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListBorderRadius002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListBorderRadius003
     * @tc.name     testListBorderRadius003
     * @tc.desc     testListBorderRadius003
     * @tc.level    Level.LEVEL1
     */
    it('testListBorderRadius003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListBorderRadius003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListBorderRadius004
     * @tc.name     testListBorderRadius004
     * @tc.desc     testListBorderRadius004
     * @tc.level    Level.LEVEL1
     */
    it('testListBorderRadius004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListBorderRadius004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListBorderRadius005
     * @tc.name     testListBorderRadius005
     * @tc.desc     testListBorderRadius005
     * @tc.level    Level.LEVEL1
     */
    it('testListBorderRadius005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListBorderRadius005()).assertEqual(0)
      done()
    })
  })
}

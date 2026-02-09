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

export default function customDialogAlignmentTest() {

  describe('CustomDialogAlignmentTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomDialogAlignment001
     * @tc.name     testCustomDialogAlignment001
     * @tc.desc     testCustomDialogAlignment001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogAlignment001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogAlignment001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogAlignment002
     * @tc.name     testCustomDialogAlignment002
     * @tc.desc     testCustomDialogAlignment002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogAlignment002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogAlignment002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogAlignment003
     * @tc.name     testCustomDialogAlignment003
     * @tc.desc     testCustomDialogAlignment003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogAlignment003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogAlignment003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogAlignment004
     * @tc.name     testCustomDialogAlignment004
     * @tc.desc     testCustomDialogAlignment004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogAlignment004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogAlignment004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogAlignment005
     * @tc.name     testCustomDialogAlignment005
     * @tc.desc     testCustomDialogAlignment005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogAlignment005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogAlignment005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogAlignment006
     * @tc.name     testCustomDialogAlignment006
     * @tc.desc     testCustomDialogAlignment006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogAlignment006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogAlignment006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogAlignment007
     * @tc.name     testCustomDialogAlignment007
     * @tc.desc     testCustomDialogAlignment007
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogAlignment007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogAlignment007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogAlignment008
     * @tc.name     testCustomDialogAlignment008
     * @tc.desc     testCustomDialogAlignment008
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogAlignment008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogAlignment008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogAlignment009
     * @tc.name     testCustomDialogAlignment009
     * @tc.desc     testCustomDialogAlignment009
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogAlignment009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogAlignment009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogAlignment010
     * @tc.name     testCustomDialogAlignment010
     * @tc.desc     testCustomDialogAlignment010
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogAlignment010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogAlignment010()).assertEqual(0)
      done()
    })
  })
}

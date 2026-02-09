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

export default function scrollOverlayTest() {

  describe('ScrollOverlayTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testScrollOverlay001
     * @tc.name     testScrollOverlay001
     * @tc.desc     testScrollOverlay001
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOverlay001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollOverlay001()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollOverlay002
     * @tc.name     testScrollOverlay002
     * @tc.desc     testScrollOverlay002
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOverlay002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollOverlay002()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollOverlay003
     * @tc.name     testScrollOverlay003
     * @tc.desc     testScrollOverlay003
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOverlay003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollOverlay003()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollOverlay004
     * @tc.name     testScrollOverlay004
     * @tc.desc     testScrollOverlay004
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOverlay004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollOverlay004()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollOverlay005
     * @tc.name     testScrollOverlay005
     * @tc.desc     testScrollOverlay005
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOverlay005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollOverlay005()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollOverlay006
     * @tc.name     testScrollOverlay006
     * @tc.desc     testScrollOverlay006
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOverlay006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollOverlay006()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollOverlay007
     * @tc.name     testScrollOverlay007
     * @tc.desc     testScrollOverlay007
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOverlay007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollOverlay007()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollOverlay008
     * @tc.name     testScrollOverlay008
     * @tc.desc     testScrollOverlay008
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOverlay008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollOverlay008()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollOverlay009
     * @tc.name     testScrollOverlay009
     * @tc.desc     testScrollOverlay009
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOverlay009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollOverlay009()).assertEqual(0)
      done();
    });
  })
}

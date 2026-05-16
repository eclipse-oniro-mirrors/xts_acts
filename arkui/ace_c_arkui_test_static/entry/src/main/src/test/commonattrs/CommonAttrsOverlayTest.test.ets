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

export default function commonAttrsOverlayTest() {

  describe('CommonAttrsOverlayTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsOverlay001
     * @tc.name     testCommonAttrsOverlay001
     * @tc.desc     testCommonAttrsOverlay001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOverlay001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOverlay001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOverlay002
     * @tc.name     testCommonAttrsOverlay002
     * @tc.desc     testCommonAttrsOverlay002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOverlay002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOverlay002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOverlay003
     * @tc.name     testCommonAttrsOverlay003
     * @tc.desc     testCommonAttrsOverlay003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOverlay003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOverlay003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOverlay004
     * @tc.name     testCommonAttrsOverlay004
     * @tc.desc     testCommonAttrsOverlay004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOverlay004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOverlay004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOverlay005
     * @tc.name     testCommonAttrsOverlay005
     * @tc.desc     testCommonAttrsOverlay005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOverlay005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOverlay005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOverlay006
     * @tc.name     testCommonAttrsOverlay006
     * @tc.desc     testCommonAttrsOverlay006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOverlay006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOverlay006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOverlay007
     * @tc.name     testCommonAttrsOverlay007
     * @tc.desc     testCommonAttrsOverlay007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOverlay007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOverlay007()).assertEqual(0)
      done()
    })
  })
}


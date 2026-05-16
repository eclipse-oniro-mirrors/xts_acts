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

export default function commonAttrsScaleTest() {

  describe('CommonAttrsScaleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsScale001
     * @tc.name     testCommonAttrsScale001
     * @tc.desc     testCommonAttrsScale001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsScale001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsScale001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsScale002
     * @tc.name     testCommonAttrsScale002
     * @tc.desc     testCommonAttrsScale002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsScale002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsScale002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsScale003
     * @tc.name     testCommonAttrsScale003
     * @tc.desc     testCommonAttrsScale003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsScale003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsScale003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsScale004
     * @tc.name     testCommonAttrsScale004
     * @tc.desc     testCommonAttrsScale004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsScale004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsScale004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsScale005
     * @tc.name     testCommonAttrsScale005
     * @tc.desc     testCommonAttrsScale005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsScale005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsScale005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsScale006
     * @tc.name     testCommonAttrsScale006
     * @tc.desc     testCommonAttrsScale006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsScale006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsScale006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsScale007
     * @tc.name     testCommonAttrsScale007
     * @tc.desc     testCommonAttrsScale007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsScale007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsScale007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsScale008
     * @tc.name     testCommonAttrsScale008
     * @tc.desc     testCommonAttrsScale008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsScale008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsScale008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsScale009
     * @tc.name     testCommonAttrsScale009
     * @tc.desc     testCommonAttrsScale009
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsScale009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsScale009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsScale010
     * @tc.name     testCommonAttrsScale010
     * @tc.desc     testCommonAttrsScale010
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsScale010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsScale010()).assertEqual(0)
      done()
    })
  })
}
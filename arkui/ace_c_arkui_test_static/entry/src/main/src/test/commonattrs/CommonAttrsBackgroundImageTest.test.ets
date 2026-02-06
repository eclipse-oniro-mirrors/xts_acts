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

export default function commonAttrsBackgroundImageTest() {

  describe('CommonAttrsBackgroundImageTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImage001
     * @tc.name     testCommonAttrsBackgroundImage001
     * @tc.desc     testCommonAttrsBackgroundImage001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImage001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImage001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImage002
     * @tc.name     testCommonAttrsBackgroundImage002
     * @tc.desc     testCommonAttrsBackgroundImage002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImage002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImage002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImage003
     * @tc.name     testCommonAttrsBackgroundImage003
     * @tc.desc     testCommonAttrsBackgroundImage003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImage003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImage003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImage004
     * @tc.name     testCommonAttrsBackgroundImage004
     * @tc.desc     testCommonAttrsBackgroundImage004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImage004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImage004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImage005
     * @tc.name     testCommonAttrsBackgroundImage005
     * @tc.desc     testCommonAttrsBackgroundImage005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImage005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImage005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImage006
     * @tc.name     testCommonAttrsBackgroundImage006
     * @tc.desc     testCommonAttrsBackgroundImage006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImage006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImage006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImage007
     * @tc.name     testCommonAttrsBackgroundImage007
     * @tc.desc     testCommonAttrsBackgroundImage007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImage007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImage007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImage008
     * @tc.name     testCommonAttrsBackgroundImage008
     * @tc.desc     testCommonAttrsBackgroundImage008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImage008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImage008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImage009
     * @tc.name     testCommonAttrsBackgroundImage009
     * @tc.desc     testCommonAttrsBackgroundImage009
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImage009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImage009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImage010
     * @tc.name     testCommonAttrsBackgroundImage010
     * @tc.desc     testCommonAttrsBackgroundImage010
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImage010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImage010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImage011
     * @tc.name     testCommonAttrsBackgroundImage011
     * @tc.desc     testCommonAttrsBackgroundImage011
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImage011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImage011()).assertEqual(0)
      done()
    })
  })
}

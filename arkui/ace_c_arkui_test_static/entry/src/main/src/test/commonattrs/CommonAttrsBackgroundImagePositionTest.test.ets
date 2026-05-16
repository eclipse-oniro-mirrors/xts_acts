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

export default function commonAttrsBackgroundImagePositionTest() {
    
  describe('CommonAttrsBackgroundImagePositionTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePosition001
     * @tc.name     testCommonAttrsBackgroundImagePosition001
     * @tc.desc     testCommonAttrsBackgroundImagePosition001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePosition001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePosition001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePosition002
     * @tc.name     testCommonAttrsBackgroundImagePosition002
     * @tc.desc     testCommonAttrsBackgroundImagePosition002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePosition002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePosition002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePosition003
     * @tc.name     testCommonAttrsBackgroundImagePosition003
     * @tc.desc     testCommonAttrsBackgroundImagePosition003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePosition003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePosition003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePosition004
     * @tc.name     testCommonAttrsBackgroundImagePosition004
     * @tc.desc     testCommonAttrsBackgroundImagePosition004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePosition004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePosition004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePosition005
     * @tc.name     testCommonAttrsBackgroundImagePosition005
     * @tc.desc     testCommonAttrsBackgroundImagePosition005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePosition005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePosition005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePosition006
     * @tc.name     testCommonAttrsBackgroundImagePosition006
     * @tc.desc     testCommonAttrsBackgroundImagePosition006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePosition006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePosition006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePosition007
     * @tc.name     testCommonAttrsBackgroundImagePosition007
     * @tc.desc     testCommonAttrsBackgroundImagePosition007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePosition007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePosition007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePosition008
     * @tc.name     testCommonAttrsBackgroundImagePosition008
     * @tc.desc     testCommonAttrsBackgroundImagePosition008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePosition008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePosition008()).assertEqual(0)
      done()
    })
  })
}
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

export default function commonAttrsBackgroundImagePixelMapTest() {

  describe('CommonAttrsBackgroundImagePixelMapTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePixelMap001
     * @tc.name     testCommonAttrsBackgroundImagePixelMap001
     * @tc.desc     testCommonAttrsBackgroundImagePixelMap001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePixelMap001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePixelMap002
     * @tc.name     testCommonAttrsBackgroundImagePixelMap002
     * @tc.desc     testCommonAttrsBackgroundImagePixelMap002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePixelMap002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePixelMap003
     * @tc.name     testCommonAttrsBackgroundImagePixelMap003
     * @tc.desc     testCommonAttrsBackgroundImagePixelMap003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePixelMap003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePixelMap004
     * @tc.name     testCommonAttrsBackgroundImagePixelMap004
     * @tc.desc     testCommonAttrsBackgroundImagePixelMap004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePixelMap004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePixelMap005
     * @tc.name     testCommonAttrsBackgroundImagePixelMap005
     * @tc.desc     testCommonAttrsBackgroundImagePixelMap005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePixelMap005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePixelMap006
     * @tc.name     testCommonAttrsBackgroundImagePixelMap006
     * @tc.desc     testCommonAttrsBackgroundImagePixelMap006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePixelMap006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundImagePixelMap007
     * @tc.name     testCommonAttrsBackgroundImagePixelMap007
     * @tc.desc     testCommonAttrsBackgroundImagePixelMap007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundImagePixelMap007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundImagePixelMap007()).assertEqual(0)
      done()
    })
  })
}

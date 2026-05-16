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

export default function commonAttrsBrightnessTest() {
    
  describe('CommonAttrsBrightnessTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsBrightness001
     * @tc.name     testCommonAttrsBrightness001
     * @tc.desc     testCommonAttrsBrightness001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBrightness001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBrightness001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBrightness002
     * @tc.name     testCommonAttrsBrightness002
     * @tc.desc     testCommonAttrsBrightness002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBrightness002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBrightness002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBrightness003
     * @tc.name     testCommonAttrsBrightness003
     * @tc.desc     testCommonAttrsBrightness003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBrightness003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBrightness003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBrightness004
     * @tc.name     testCommonAttrsBrightness004
     * @tc.desc     testCommonAttrsBrightness004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBrightness004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBrightness004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBrightness005
     * @tc.name     testCommonAttrsBrightness005
     * @tc.desc     testCommonAttrsBrightness005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBrightness005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBrightness005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBrightness006
     * @tc.name     testCommonAttrsBrightness006
     * @tc.desc     testCommonAttrsBrightness006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBrightness006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBrightness006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBrightness007
     * @tc.name     testCommonAttrsBrightness007
     * @tc.desc     testCommonAttrsBrightness007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBrightness007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBrightness007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBrightness008
     * @tc.name     testCommonAttrsBrightness008
     * @tc.desc     testCommonAttrsBrightness008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBrightness008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBrightness008()).assertEqual(0)
      done()
    })
  })
}

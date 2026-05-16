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

export default function commonAttrsCustomShadowTest() {
    
  describe('CommonAttrsCustomShadowTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsCustomShadow001
     * @tc.name     testCommonAttrsCustomShadow001
     * @tc.desc     testCommonAttrsCustomShadow001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsCustomShadow001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsCustomShadow001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsCustomShadow002
     * @tc.name     testCommonAttrsCustomShadow002
     * @tc.desc     testCommonAttrsCustomShadow002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsCustomShadow002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsCustomShadow002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsCustomShadow003
     * @tc.name     testCommonAttrsCustomShadow003
     * @tc.desc     testCommonAttrsCustomShadow003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsCustomShadow003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsCustomShadow003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsCustomShadow004
     * @tc.name     testCommonAttrsCustomShadow004
     * @tc.desc     testCommonAttrsCustomShadow004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsCustomShadow004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsCustomShadow004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsCustomShadow005
     * @tc.name     testCommonAttrsCustomShadow005
     * @tc.desc     testCommonAttrsCustomShadow005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsCustomShadow005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsCustomShadow005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsCustomShadow006
     * @tc.name     testCommonAttrsCustomShadow006
     * @tc.desc     testCommonAttrsCustomShadow006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsCustomShadow006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsCustomShadow006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsCustomShadow007
     * @tc.name     testCommonAttrsCustomShadow007
     * @tc.desc     testCommonAttrsCustomShadow007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsCustomShadow007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsCustomShadow007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsCustomShadow008
     * @tc.name     testCommonAttrsCustomShadow008
     * @tc.desc     testCommonAttrsCustomShadow008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsCustomShadow008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsCustomShadow008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsCustomShadow009
     * @tc.name     testCommonAttrsCustomShadow009
     * @tc.desc     testCommonAttrsCustomShadow009
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsCustomShadow009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsCustomShadow009()).assertEqual(0)
      done()
    })
  })
}

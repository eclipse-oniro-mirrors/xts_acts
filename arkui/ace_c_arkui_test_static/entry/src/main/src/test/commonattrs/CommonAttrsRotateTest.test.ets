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

export default function commonAttrsRotateTest() {

  describe('CommonAttrsRotateTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsRotate001
     * @tc.name     testCommonAttrsRotate001
     * @tc.desc     testCommonAttrsRotate001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRotate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRotate001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRotate002
     * @tc.name     testCommonAttrsRotate002
     * @tc.desc     testCommonAttrsRotate002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRotate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRotate002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRotate003
     * @tc.name     testCommonAttrsRotate003
     * @tc.desc     testCommonAttrsRotate003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRotate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRotate003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRotate004
     * @tc.name     testCommonAttrsRotate004
     * @tc.desc     testCommonAttrsRotate004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRotate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRotate004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRotate005
     * @tc.name     testCommonAttrsRotate005
     * @tc.desc     testCommonAttrsRotate005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRotate005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRotate005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRotate006
     * @tc.name     testCommonAttrsRotate006
     * @tc.desc     testCommonAttrsRotate006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRotate006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRotate006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRotate007
     * @tc.name     testCommonAttrsRotate007
     * @tc.desc     testCommonAttrsRotate007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRotate007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRotate007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRotate008
     * @tc.name     testCommonAttrsRotate008
     * @tc.desc     testCommonAttrsRotate008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRotate008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRotate008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRotate009
     * @tc.name     testCommonAttrsRotate009
     * @tc.desc     testCommonAttrsRotate009
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRotate009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRotate009()).assertEqual(0)
      done()
    })
  })
}
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

export default function commonAttrsSaturateTest() {

  describe('CommonAttrsSaturateTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsSaturate001
     * @tc.name     testCommonAttrsSaturate001
     * @tc.desc     testCommonAttrsSaturate001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSaturate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSaturate001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSaturate002
     * @tc.name     testCommonAttrsSaturate002
     * @tc.desc     testCommonAttrsSaturate002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSaturate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSaturate002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSaturate003
     * @tc.name     testCommonAttrsSaturate003
     * @tc.desc     testCommonAttrsSaturate003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSaturate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSaturate003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSaturate004
     * @tc.name     testCommonAttrsSaturate004
     * @tc.desc     testCommonAttrsSaturate004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSaturate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSaturate004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSaturate005
     * @tc.name     testCommonAttrsSaturate005
     * @tc.desc     testCommonAttrsSaturate005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSaturate005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSaturate005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSaturate006
     * @tc.name     testCommonAttrsSaturate006
     * @tc.desc     testCommonAttrsSaturate006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSaturate006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSaturate006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSaturate007
     * @tc.name     testCommonAttrsSaturate007
     * @tc.desc     testCommonAttrsSaturate007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSaturate007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSaturate007()).assertEqual(0)
      done()
    })
  })
}
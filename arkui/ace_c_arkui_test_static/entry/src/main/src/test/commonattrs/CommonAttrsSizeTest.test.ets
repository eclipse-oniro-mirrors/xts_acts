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

export default function commonAttrsSizeTest() {

  describe('CommonAttrsSizeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsSize001
     * @tc.name     testCommonAttrsSize001
     * @tc.desc     testCommonAttrsSize001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSize001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSize001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSize002
     * @tc.name     testCommonAttrsSize002
     * @tc.desc     testCommonAttrsSize002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSize002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSize002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSize003
     * @tc.name     testCommonAttrsSize003
     * @tc.desc     testCommonAttrsSize003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSize003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSize003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSize004
     * @tc.name     testCommonAttrsSize004
     * @tc.desc     testCommonAttrsSize004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSize004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSize004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSize005
     * @tc.name     testCommonAttrsSize005
     * @tc.desc     testCommonAttrsSize005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSize005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSize005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSize006
     * @tc.name     testCommonAttrsSize006
     * @tc.desc     testCommonAttrsSize006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSize006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSize006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSize007
     * @tc.name     testCommonAttrsSize007
     * @tc.desc     testCommonAttrsSize007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSize007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSize007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSize008
     * @tc.name     testCommonAttrsSize008
     * @tc.desc     testCommonAttrsSize008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSize008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSize008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSize009
     * @tc.name     testCommonAttrsSize009
     * @tc.desc     testCommonAttrsSize009
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSize009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSize009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSize010
     * @tc.name     testCommonAttrsSize010
     * @tc.desc     testCommonAttrsSize010
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSize010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSize010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSize011
     * @tc.name     testCommonAttrsSize011
     * @tc.desc     testCommonAttrsSize011
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSize011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSize011()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSize012
     * @tc.name     testCommonAttrsSize012
     * @tc.desc     testCommonAttrsSize012
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSize012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSize012()).assertEqual(0)
      done()
    })
  })
}
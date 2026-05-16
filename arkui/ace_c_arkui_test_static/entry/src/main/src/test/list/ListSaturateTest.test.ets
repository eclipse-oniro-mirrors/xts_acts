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

import { beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function listSaturateTest() {

  describe('ListSaturateTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListSaturate001
     * @tc.name     testListSaturate001
     * @tc.desc     testListSaturate001
     * @tc.level    Level.LEVEL1
     */
    it('testListSaturate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSaturate001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListSaturate002
     * @tc.name     testListSaturate002
     * @tc.desc     testListSaturate002
     * @tc.level    Level.LEVEL1
     */
    it('testListSaturate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSaturate002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListSaturate003
     * @tc.name     testListSaturate003
     * @tc.desc     testListSaturate003
     * @tc.level    Level.LEVEL1
     */
    it('testListSaturate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSaturate003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListSaturate004
     * @tc.name     testListSaturate004
     * @tc.desc     testListSaturate004
     * @tc.level    Level.LEVEL1
     */
    it('testListSaturate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSaturate004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListSaturate005
     * @tc.name     testListSaturate005
     * @tc.desc     testListSaturate005
     * @tc.level    Level.LEVEL1
     */
    it('testListSaturate005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSaturate005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListSaturate006
     * @tc.name     testListSaturate006
     * @tc.desc     testListSaturate006
     * @tc.level    Level.LEVEL1
     */
    it('testListSaturate006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSaturate006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListSaturate007
     * @tc.name     testListSaturate007
     * @tc.desc     testListSaturate007
     * @tc.level    Level.LEVEL1
     */
    it('testListSaturate007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSaturate007()).assertEqual(0)
      done()
    })
  })
}

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

export default function listShadowTest() {

  describe('ListShadowTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListShadow001
     * @tc.name     testListShadow001
     * @tc.desc     testListShadow001
     * @tc.level    Level.LEVEL1
     */
    it('testListShadow001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListShadow001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListShadow002
     * @tc.name     testListShadow002
     * @tc.desc     testListShadow002
     * @tc.level    Level.LEVEL1
     */
    it('testListShadow002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListShadow002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListShadow003
     * @tc.name     testListShadow003
     * @tc.desc     testListShadow003
     * @tc.level    Level.LEVEL1
     */
    it('testListShadow003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListShadow003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListShadow004
     * @tc.name     testListShadow004
     * @tc.desc     testListShadow004
     * @tc.level    Level.LEVEL1
     */
    it('testListShadow004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListShadow004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListShadow005
     * @tc.name     testListShadow005
     * @tc.desc     testListShadow005
     * @tc.level    Level.LEVEL1
     */
    it('testListShadow005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListShadow005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListShadow006
     * @tc.name     testListShadow006
     * @tc.desc     testListShadow006
     * @tc.level    Level.LEVEL1
     */
    it('testListShadow006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListShadow006()).assertEqual(0)
      done()
    })
  })
}

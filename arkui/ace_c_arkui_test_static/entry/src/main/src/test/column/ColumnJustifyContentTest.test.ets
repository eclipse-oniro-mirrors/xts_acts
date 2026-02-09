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

export default function columnJustifyContentTest() {

  describe('ColumnJustifyContentTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testColumnJustifyContent001
     * @tc.name     testColumnJustifyContent001
     * @tc.desc     testColumnJustifyContent001
     * @tc.level    Level.LEVEL1
     */
    it('testColumnJustifyContent001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testColumnJustifyContent001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testColumnJustifyContent002
     * @tc.name     testColumnJustifyContent002
     * @tc.desc     testColumnJustifyContent002
     * @tc.level    Level.LEVEL1
     */
    it('testColumnJustifyContent002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testColumnJustifyContent002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testColumnJustifyContent003
     * @tc.name     testColumnJustifyContent003
     * @tc.desc     testColumnJustifyContent003
     * @tc.level    Level.LEVEL1
     */
    it('testColumnJustifyContent003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testColumnJustifyContent003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testColumnJustifyContent004
     * @tc.name     testColumnJustifyContent004
     * @tc.desc     testColumnJustifyContent004
     * @tc.level    Level.LEVEL1
     */
    it('testColumnJustifyContent004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testColumnJustifyContent004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testColumnJustifyContent005
     * @tc.name     testColumnJustifyContent005
     * @tc.desc     testColumnJustifyContent005
     * @tc.level    Level.LEVEL1
     */
    it('testColumnJustifyContent005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testColumnJustifyContent005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testColumnJustifyContent006
     * @tc.name     testColumnJustifyContent006
     * @tc.desc     testColumnJustifyContent006
     * @tc.level    Level.LEVEL1
     */
    it('testColumnJustifyContent006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testColumnJustifyContent006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testColumnJustifyContent007
     * @tc.name     testColumnJustifyContent007
     * @tc.desc     testColumnJustifyContent007
     * @tc.level    Level.LEVEL1
     */
    it('testColumnJustifyContent007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testColumnJustifyContent007()).assertEqual(0)
      done()
    })
  })
}

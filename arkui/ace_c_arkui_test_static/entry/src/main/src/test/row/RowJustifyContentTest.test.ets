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

export default function rowJustifyContentTest() {

  describe('RowJustifyContentTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testRowJustifyContent001
     * @tc.name     testRowJustifyContent001
     * @tc.desc     testRowJustifyContent001
     * @tc.level    Level.LEVEL1
     */
    it('testRowJustifyContent001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRowJustifyContent001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRowJustifyContent002
     * @tc.name     testRowJustifyContent002
     * @tc.desc     testRowJustifyContent002
     * @tc.level    Level.LEVEL1
     */
    it('testRowJustifyContent002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRowJustifyContent002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRowJustifyContent003
     * @tc.name     testRowJustifyContent003
     * @tc.desc     testRowJustifyContent003
     * @tc.level    Level.LEVEL1
     */
    it('testRowJustifyContent003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRowJustifyContent003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRowJustifyContent004
     * @tc.name     testRowJustifyContent004
     * @tc.desc     testRowJustifyContent004
     * @tc.level    Level.LEVEL1
     */
    it('testRowJustifyContent004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRowJustifyContent004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRowJustifyContent005
     * @tc.name     testRowJustifyContent005
     * @tc.desc     testRowJustifyContent005
     * @tc.level    Level.LEVEL1
     */
    it('testRowJustifyContent005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRowJustifyContent005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRowJustifyContent006
     * @tc.name     testRowJustifyContent006
     * @tc.desc     testRowJustifyContent006
     * @tc.level    Level.LEVEL1
     */
    it('testRowJustifyContent006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRowJustifyContent006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRowJustifyContent007
     * @tc.name     testRowJustifyContent007
     * @tc.desc     testRowJustifyContent007
     * @tc.level    Level.LEVEL1
     */
    it('testRowJustifyContent007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRowJustifyContent007()).assertEqual(0)
      done()
    })
  })
}

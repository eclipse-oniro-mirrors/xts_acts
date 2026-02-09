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

export default function commonAttrsZIndexTest() {

  describe('CommonAttrsZIndexTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsZIndex001
     * @tc.name     testCommonAttrsZIndex001
     * @tc.desc     testCommonAttrsZIndex001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsZIndex001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsZIndex001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsZIndex002
     * @tc.name     testCommonAttrsZIndex002
     * @tc.desc     testCommonAttrsZIndex002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsZIndex002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsZIndex002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsZIndex003
     * @tc.name     testCommonAttrsZIndex003
     * @tc.desc     testCommonAttrsZIndex003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsZIndex003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsZIndex003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsZIndex004
     * @tc.name     testCommonAttrsZIndex004
     * @tc.desc     testCommonAttrsZIndex004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsZIndex004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsZIndex004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsZIndex005
     * @tc.name     testCommonAttrsZIndex005
     * @tc.desc     testCommonAttrsZIndex005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsZIndex005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsZIndex005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsZIndex006
     * @tc.name     testCommonAttrsZIndex006
     * @tc.desc     testCommonAttrsZIndex006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsZIndex006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsZIndex006()).assertEqual(0)
      done()
    })
  })
}
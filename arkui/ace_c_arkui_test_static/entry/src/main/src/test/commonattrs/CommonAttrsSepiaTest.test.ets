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

export default function commonAttrsSepiaTest() {

  describe('CommonAttrsSepiaTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsSepia001
     * @tc.name     testCommonAttrsSepia001
     * @tc.desc     testCommonAttrsSepia001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSepia001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSepia001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSepia002
     * @tc.name     testCommonAttrsSepia002
     * @tc.desc     testCommonAttrsSepia002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSepia002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSepia002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSepia003
     * @tc.name     testCommonAttrsSepia003
     * @tc.desc     testCommonAttrsSepia003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSepia003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSepia003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSepia004
     * @tc.name     testCommonAttrsSepia004
     * @tc.desc     testCommonAttrsSepia004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSepia004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSepia004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSepia005
     * @tc.name     testCommonAttrsSepia005
     * @tc.desc     testCommonAttrsSepia005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSepia005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSepia005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSepia006
     * @tc.name     testCommonAttrsSepia006
     * @tc.desc     testCommonAttrsSepia006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSepia006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSepia006()).assertEqual(0)
      done()
    })

  })
}

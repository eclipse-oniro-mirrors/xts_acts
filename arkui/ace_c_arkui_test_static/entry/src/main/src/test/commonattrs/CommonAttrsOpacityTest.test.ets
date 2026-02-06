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

export default function commonAttrsOpacityTest() {

  describe('CommonAttrsOpacityTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsOpacity001
     * @tc.name     testCommonAttrsOpacity001
     * @tc.desc     testCommonAttrsOpacity001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOpacity001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOpacity001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOpacity002
     * @tc.name     testCommonAttrsOpacity002
     * @tc.desc     testCommonAttrsOpacity002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOpacity002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOpacity002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOpacity003
     * @tc.name     testCommonAttrsOpacity003
     * @tc.desc     testCommonAttrsOpacity003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOpacity003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOpacity003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOpacity004
     * @tc.name     testCommonAttrsOpacity004
     * @tc.desc     testCommonAttrsOpacity004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOpacity004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOpacity004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOpacity005
     * @tc.name     testCommonAttrsOpacity005
     * @tc.desc     testCommonAttrsOpacity005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOpacity005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOpacity005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOpacity006
     * @tc.name     testCommonAttrsOpacity006
     * @tc.desc     testCommonAttrsOpacity006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOpacity006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOpacity006()).assertEqual(0)
      done()
    })

  })
}

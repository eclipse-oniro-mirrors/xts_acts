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

export default function commonAttrsOffsetTest() {

  describe('CommonAttrsOffsetTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsOffset001
     * @tc.name     testCommonAttrsOffset001
     * @tc.desc     testCommonAttrsOffset001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOffset001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsOffset001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOffset002
     * @tc.name     testCommonAttrsOffset002
     * @tc.desc     testCommonAttrsOffset002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOffset002', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsOffset002()).assertEqual(0)
        done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOffset003
     * @tc.name     testCommonAttrsOffset003
     * @tc.desc     testCommonAttrsOffset003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOffset003', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsOffset003()).assertEqual(0)
        done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOffset004
     * @tc.name     testCommonAttrsOffset004
     * @tc.desc     testCommonAttrsOffset004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOffset004', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsOffset004()).assertEqual(0)
        done()
    })

    
    
/**
     * @tc.number   testCommonAttrsOffset005
     * @tc.name     testCommonAttrsOffset005
     * @tc.desc     testCommonAttrsOffset005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOffset005', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsOffset005()).assertEqual(0)
        done()
    })   

    
    
/**
     * @tc.number   testCommonAttrsOffset006
     * @tc.name     testCommonAttrsOffset006
     * @tc.desc     testCommonAttrsOffset006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsOffset006', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsOffset006()).assertEqual(0)
        done()
    })
  })
}
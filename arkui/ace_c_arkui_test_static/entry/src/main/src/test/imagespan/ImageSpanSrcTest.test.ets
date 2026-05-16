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

export default function imageSpanSrcTest() {

  describe('ImageSpanSrcTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageSpanSrc001
     * @tc.name     testImageSpanSrc001
     * @tc.desc     testImageSpanSrc001
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanSrc001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanSrc001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanSrc002
     * @tc.name     testImageSpanSrc002
     * @tc.desc     testImageSpanSrc002
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanSrc002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanSrc002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanSrc003
     * @tc.name     testImageSpanSrc003
     * @tc.desc     testImageSpanSrc003
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanSrc003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanSrc003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanSrc004
     * @tc.name     testImageSpanSrc004
     * @tc.desc     testImageSpanSrc004
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanSrc004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanSrc004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanSrc005
     * @tc.name     testImageSpanSrc005
     * @tc.desc     testImageSpanSrc005
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanSrc005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanSrc005()).assertEqual(0)
      done()
    })

  })
}

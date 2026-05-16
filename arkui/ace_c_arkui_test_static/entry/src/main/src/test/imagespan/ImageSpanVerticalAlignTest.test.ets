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

export default function imageSpanVerticalAlignTest() {

  describe('ImageSpanVerticalAlignTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageSpanVerticalAlign001
     * @tc.name     testImageSpanVerticalAlign001
     * @tc.desc     testImageSpanVerticalAlign001
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanVerticalAlign001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanVerticalAlign001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanVerticalAlign002
     * @tc.name     testImageSpanVerticalAlign002
     * @tc.desc     testImageSpanVerticalAlign002
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanVerticalAlign002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanVerticalAlign002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanVerticalAlign003
     * @tc.name     testImageSpanVerticalAlign003
     * @tc.desc     testImageSpanVerticalAlign003
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanVerticalAlign003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanVerticalAlign003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanVerticalAlign004
     * @tc.name     testImageSpanVerticalAlign004
     * @tc.desc     testImageSpanVerticalAlign004
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanVerticalAlign004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanVerticalAlign004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanVerticalAlign005
     * @tc.name     testImageSpanVerticalAlign005
     * @tc.desc     testImageSpanVerticalAlign005
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanVerticalAlign005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanVerticalAlign005()).assertEqual(0)
      done()
    })

  })
}

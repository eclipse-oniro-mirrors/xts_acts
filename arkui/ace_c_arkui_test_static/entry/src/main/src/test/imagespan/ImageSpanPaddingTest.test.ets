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

export default function imageSpanPaddingTest() {

  describe('ImageSpanPaddingTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageSpanPadding001
     * @tc.name     testImageSpanPadding001
     * @tc.desc     testImageSpanPadding001
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanPadding001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanPadding001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanPadding002
     * @tc.name     testImageSpanPadding002
     * @tc.desc     testImageSpanPadding002
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanPadding002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanPadding002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanPadding003
     * @tc.name     testImageSpanPadding003
     * @tc.desc     testImageSpanPadding003
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanPadding003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanPadding003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanPadding004
     * @tc.name     testImageSpanPadding004
     * @tc.desc     testImageSpanPadding004
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanPadding004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanPadding004()).assertEqual(0)
      done()
    })

  })
}

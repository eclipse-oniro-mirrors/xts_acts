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

export default function imageSpanAltTest() {

  describe('ImageSpanAltTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageSpanAlt001
     * @tc.name     testImageSpanAlt001
     * @tc.desc     testImageSpanAlt001
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanAlt001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanAlt001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanAlt002
     * @tc.name     testImageSpanAlt002
     * @tc.desc     testImageSpanAlt002
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanAlt002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanAlt002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanAlt003
     * @tc.name     testImageSpanAlt003
     * @tc.desc     testImageSpanAlt003
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanAlt003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanAlt003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanAlt004
     * @tc.name     testImageSpanAlt004
     * @tc.desc     testImageSpanAlt004
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanAlt004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanAlt004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanAlt005
     * @tc.name     testImageSpanAlt005
     * @tc.desc     testImageSpanAlt005
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanAlt005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanAlt005()).assertEqual(0)
      done()
    })

  })
}

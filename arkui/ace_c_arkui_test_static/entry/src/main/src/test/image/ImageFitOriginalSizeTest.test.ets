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

export default function imageFitOriginalSizeTest() {

  describe('ImageFitOriginalSizeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageFitOriginalSize001
     * @tc.name     testImageFitOriginalSize001
     * @tc.desc     testImageFitOriginalSize001
     * @tc.level    Level.LEVEL1
     */
    it('testImageFitOriginalSize001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageFitOriginalSize001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageFitOriginalSize002
     * @tc.name     testImageFitOriginalSize002
     * @tc.desc     testImageFitOriginalSize002
     * @tc.level    Level.LEVEL1
     */
    it('testImageFitOriginalSize002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageFitOriginalSize002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageFitOriginalSize003
     * @tc.name     testImageFitOriginalSize003
     * @tc.desc     testImageFitOriginalSize003
     * @tc.level    Level.LEVEL1
     */
    it('testImageFitOriginalSize003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageFitOriginalSize003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageFitOriginalSize004
     * @tc.name     testImageFitOriginalSize004
     * @tc.desc     testImageFitOriginalSize004
     * @tc.level    Level.LEVEL1
     */
    it('testImageFitOriginalSize004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageFitOriginalSize004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageFitOriginalSize005
     * @tc.name     testImageFitOriginalSize005
     * @tc.desc     testImageFitOriginalSize005
     * @tc.level    Level.LEVEL1
     */
    it('testImageFitOriginalSize005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageFitOriginalSize005()).assertEqual(0)
      done()
    })

  })
}

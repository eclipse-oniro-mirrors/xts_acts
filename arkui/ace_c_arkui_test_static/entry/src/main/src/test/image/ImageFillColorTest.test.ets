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

export default function imageFillColorTest() {

  describe('ImageFillColorTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageFillColor001
     * @tc.name     testImageFillColor001
     * @tc.desc     testImageFillColor001
     * @tc.level    Level.LEVEL1
     */
    it('testImageFillColor001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageFillColor001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageFillColor002
     * @tc.name     testImageFillColor002
     * @tc.desc     testImageFillColor002
     * @tc.level    Level.LEVEL1
     */
    it('testImageFillColor002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageFillColor002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageFillColor003
     * @tc.name     testImageFillColor003
     * @tc.desc     testImageFillColor003
     * @tc.level    Level.LEVEL1
     */
    it('testImageFillColor003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageFillColor003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageFillColor004
     * @tc.name     testImageFillColor004
     * @tc.desc     testImageFillColor004
     * @tc.level    Level.LEVEL1
     */
    it('testImageFillColor004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageFillColor004()).assertEqual(0)
      done()
    })

  })
}

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

export default function imageSaturateTest() {

  describe('ImageSaturateTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageSaturate001
     * @tc.name     testImageSaturate001
     * @tc.desc     testImageSaturate001
     * @tc.level    Level.LEVEL1
     */
    it('testImageSaturate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSaturate001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSaturate002
     * @tc.name     testImageSaturate002
     * @tc.desc     testImageSaturate002
     * @tc.level    Level.LEVEL1
     */
    it('testImageSaturate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSaturate002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSaturate003
     * @tc.name     testImageSaturate003
     * @tc.desc     testImageSaturate003
     * @tc.level    Level.LEVEL1
     */
    it('testImageSaturate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSaturate003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSaturate004
     * @tc.name     testImageSaturate004
     * @tc.desc     testImageSaturate004
     * @tc.level    Level.LEVEL1
     */
    it('testImageSaturate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSaturate004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSaturate005
     * @tc.name     testImageSaturate005
     * @tc.desc     testImageSaturate005
     * @tc.level    Level.LEVEL1
     */
    it('testImageSaturate005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSaturate005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSaturate006
     * @tc.name     testImageSaturate006
     * @tc.desc     testImageSaturate006
     * @tc.level    Level.LEVEL1
     */
    it('testImageSaturate006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSaturate006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSaturate007
     * @tc.name     testImageSaturate007
     * @tc.desc     testImageSaturate007
     * @tc.level    Level.LEVEL1
     */
    it('testImageSaturate007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSaturate007()).assertEqual(0)
      done()
    })

  })
}

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

export default function imageShadowTest() {

  describe('ImageShadowTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageShadow001
     * @tc.name     testImageShadow001
     * @tc.desc     testImageShadow001
     * @tc.level    Level.LEVEL1
     */
    it('testImageShadow001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageShadow001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageShadow002
     * @tc.name     testImageShadow002
     * @tc.desc     testImageShadow002
     * @tc.level    Level.LEVEL1
     */
    it('testImageShadow002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageShadow002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageShadow003
     * @tc.name     testImageShadow003
     * @tc.desc     testImageShadow003
     * @tc.level    Level.LEVEL1
     */
    it('testImageShadow003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageShadow003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageShadow004
     * @tc.name     testImageShadow004
     * @tc.desc     testImageShadow004
     * @tc.level    Level.LEVEL1
     */
    it('testImageShadow004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageShadow004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageShadow005
     * @tc.name     testImageShadow005
     * @tc.desc     testImageShadow005
     * @tc.level    Level.LEVEL1
     */
    it('testImageShadow005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageShadow005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageShadow006
     * @tc.name     testImageShadow006
     * @tc.desc     testImageShadow006
     * @tc.level    Level.LEVEL1
     */
    it('testImageShadow006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageShadow006()).assertEqual(0)
      done()
    })

  })
}

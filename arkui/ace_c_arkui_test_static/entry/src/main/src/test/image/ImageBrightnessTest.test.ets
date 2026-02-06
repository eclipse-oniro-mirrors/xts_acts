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

export default function imageBrightnessTest() {

  describe('ImageBrightnessTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageBrightness001
     * @tc.name     testImageBrightness001
     * @tc.desc     testImageBrightness001
     * @tc.level    Level.LEVEL1
     */
    it('testImageBrightness001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBrightness001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBrightness002
     * @tc.name     testImageBrightness002
     * @tc.desc     testImageBrightness002
     * @tc.level    Level.LEVEL1
     */
    it('testImageBrightness002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBrightness002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBrightness003
     * @tc.name     testImageBrightness003
     * @tc.desc     testImageBrightness003
     * @tc.level    Level.LEVEL1
     */
    it('testImageBrightness003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBrightness003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBrightness004
     * @tc.name     testImageBrightness004
     * @tc.desc     testImageBrightness004
     * @tc.level    Level.LEVEL1
     */
    it('testImageBrightness004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBrightness004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBrightness005
     * @tc.name     testImageBrightness005
     * @tc.desc     testImageBrightness005
     * @tc.level    Level.LEVEL1
     */
    it('testImageBrightness005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBrightness005()).assertEqual(0)
      done()
    })

  })
}

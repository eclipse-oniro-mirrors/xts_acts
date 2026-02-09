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

export default function imageBorderStyleTest() {

  describe('ImageBorderStyleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageBorderStyle001
     * @tc.name     testImageBorderStyle001
     * @tc.desc     testImageBorderStyle001
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderStyle001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderStyle002
     * @tc.name     testImageBorderStyle002
     * @tc.desc     testImageBorderStyle002
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderStyle002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderStyle003
     * @tc.name     testImageBorderStyle003
     * @tc.desc     testImageBorderStyle003
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderStyle003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderStyle003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderStyle004
     * @tc.name     testImageBorderStyle004
     * @tc.desc     testImageBorderStyle004
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderStyle004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderStyle004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderStyle005
     * @tc.name     testImageBorderStyle005
     * @tc.desc     testImageBorderStyle005
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderStyle005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderStyle005()).assertEqual(0)
      done()
    })

  })
}

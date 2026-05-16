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

export default function imageBorderWidthTest() {

  describe('ImageBorderWidthTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageBorderWidth001
     * @tc.name     testImageBorderWidth001
     * @tc.desc     testImageBorderWidth001
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderWidth001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderWidth001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderWidth002
     * @tc.name     testImageBorderWidth002
     * @tc.desc     testImageBorderWidth002
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderWidth002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderWidth002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderWidth003
     * @tc.name     testImageBorderWidth003
     * @tc.desc     testImageBorderWidth003
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderWidth003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderWidth003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderWidth004
     * @tc.name     testImageBorderWidth004
     * @tc.desc     testImageBorderWidth004
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderWidth004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderWidth004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderWidth005
     * @tc.name     testImageBorderWidth005
     * @tc.desc     testImageBorderWidth005
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderWidth005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderWidth005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderWidth006
     * @tc.name     testImageBorderWidth006
     * @tc.desc     testImageBorderWidth006
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderWidth006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderWidth006()).assertEqual(0)
      done()
    })

  })
}

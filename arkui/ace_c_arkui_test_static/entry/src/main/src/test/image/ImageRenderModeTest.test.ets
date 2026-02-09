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

export default function imageRenderModeTest() {

  describe('ImageRenderModeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageRenderMode001
     * @tc.name     testImageRenderMode001
     * @tc.desc     testImageRenderMode001
     * @tc.level    Level.LEVEL1
     */
    it('testImageRenderMode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageRenderMode001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageRenderMode002
     * @tc.name     testImageRenderMode002
     * @tc.desc     testImageRenderMode002
     * @tc.level    Level.LEVEL1
     */
    it('testImageRenderMode002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageRenderMode002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageRenderMode003
     * @tc.name     testImageRenderMode003
     * @tc.desc     testImageRenderMode003
     * @tc.level    Level.LEVEL1
     */
    it('testImageRenderMode003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageRenderMode003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageRenderMode004
     * @tc.name     testImageRenderMode004
     * @tc.desc     testImageRenderMode004
     * @tc.level    Level.LEVEL1
     */
    it('testImageRenderMode004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageRenderMode004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageRenderMode005
     * @tc.name     testImageRenderMode005
     * @tc.desc     testImageRenderMode005
     * @tc.level    Level.LEVEL1
     */
    it('testImageRenderMode005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageRenderMode005()).assertEqual(0)
      done()
    })

  })
}

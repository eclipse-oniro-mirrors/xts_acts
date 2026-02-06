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

export default function imageResizableTest() {

  describe('ImageResizableTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageResizable001
     * @tc.name     testImageResizable001
     * @tc.desc     testImageResizable001
     * @tc.level    Level.LEVEL1
     */
    it('testImageResizable001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageResizable001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageResizable002
     * @tc.name     testImageResizable002
     * @tc.desc     testImageResizable002
     * @tc.level    Level.LEVEL1
     */
    it('testImageResizable002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageResizable002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageResizable003
     * @tc.name     testImageResizable003
     * @tc.desc     testImageResizable003
     * @tc.level    Level.LEVEL1
     */
    it('testImageResizable003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageResizable003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageResizable004
     * @tc.name     testImageResizable004
     * @tc.desc     testImageResizable004
     * @tc.level    Level.LEVEL1
     */
    it('testImageResizable004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageResizable004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageResizable005
     * @tc.name     testImageResizable005
     * @tc.desc     testImageResizable005
     * @tc.level    Level.LEVEL1
     */
    it('testImageResizable005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageResizable005()).assertEqual(0)
      done()
    })

  })
}

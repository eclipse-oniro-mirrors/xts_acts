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

export default function imageDraggableTest() {

  describe('ImageDraggableTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageDraggable001
     * @tc.name     testImageDraggable001
     * @tc.desc     testImageDraggable001
     * @tc.level    Level.LEVEL1
     */
    it('testImageDraggable001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageDraggable001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageDraggable002
     * @tc.name     testImageDraggable002
     * @tc.desc     testImageDraggable002
     * @tc.level    Level.LEVEL1
     */
    it('testImageDraggable002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageDraggable002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageDraggable003
     * @tc.name     testImageDraggable003
     * @tc.desc     testImageDraggable003
     * @tc.level    Level.LEVEL1
     */
    it('testImageDraggable003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageDraggable003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageDraggable004
     * @tc.name     testImageDraggable004
     * @tc.desc     testImageDraggable004
     * @tc.level    Level.LEVEL1
     */
    it('testImageDraggable004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageDraggable004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageDraggable005
     * @tc.name     testImageDraggable005
     * @tc.desc     testImageDraggable005
     * @tc.level    Level.LEVEL1
     */
    it('testImageDraggable005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageDraggable005()).assertEqual(0)
      done()
    })

  })
}

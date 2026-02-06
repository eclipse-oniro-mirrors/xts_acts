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

export default function imageScaleTest() {

  describe('ImageScaleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageScale001
     * @tc.name     testImageScale001
     * @tc.desc     testImageScale001
     * @tc.level    Level.LEVEL1
     */
    it('testImageScale001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageScale001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageScale002
     * @tc.name     testImageScale002
     * @tc.desc     testImageScale002
     * @tc.level    Level.LEVEL1
     */
    it('testImageScale002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageScale002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageScale003
     * @tc.name     testImageScale003
     * @tc.desc     testImageScale003
     * @tc.level    Level.LEVEL1
     */
    it('testImageScale003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageScale003()).assertEqual(0)
      done()
    })

  })
}

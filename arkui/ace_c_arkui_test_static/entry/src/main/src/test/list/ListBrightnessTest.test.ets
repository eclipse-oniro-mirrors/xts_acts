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

export default function listBrightnessTest() {

  describe('ListBrightnessTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListBrightness001
     * @tc.name     testListBrightness001
     * @tc.desc     testListBrightness001
     * @tc.level    Level.LEVEL1
     */
    it('testListBrightness001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListBrightness001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListBrightness002
     * @tc.name     testListBrightness002
     * @tc.desc     testListBrightness002
     * @tc.level    Level.LEVEL1
     */
    it('testListBrightness002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListBrightness002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListBrightness003
     * @tc.name     testListBrightness003
     * @tc.desc     testListBrightness003
     * @tc.level    Level.LEVEL1
     */
    it('testListBrightness003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListBrightness003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListBrightness004
     * @tc.name     testListBrightness004
     * @tc.desc     testListBrightness004
     * @tc.level    Level.LEVEL1
     */
    it('testListBrightness004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListBrightness004()).assertEqual(0)
      done()
    })
  })
}

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

import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function commonAttrsMarkAnchorTest() {

  describe('CommonAttrsMarkAnchorTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsMarkAnchorTest001
     * @tc.name     testCommonAttrsMarkAnchorTest001
     * @tc.desc     testCommonAttrsMarkAnchorTest001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsMarkAnchorTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsMarkAnchorTest001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsMarkAnchorTest002
     * @tc.name     testCommonAttrsMarkAnchorTest002
     * @tc.desc     testCommonAttrsMarkAnchorTest002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsMarkAnchorTest002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsMarkAnchorTest002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsMarkAnchorTest003
     * @tc.name     testCommonAttrsMarkAnchorTest003
     * @tc.desc     testCommonAttrsMarkAnchorTest003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsMarkAnchorTest003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsMarkAnchorTest003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsMarkAnchorTest004
     * @tc.name     testCommonAttrsMarkAnchorTest004
     * @tc.desc     testCommonAttrsMarkAnchorTest004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsMarkAnchorTest004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsMarkAnchorTest004()).assertEqual(0)
      done()
    })
  })
}

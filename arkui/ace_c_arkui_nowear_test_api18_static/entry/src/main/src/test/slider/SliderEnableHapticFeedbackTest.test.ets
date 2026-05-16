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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import Utils from '../common/Utils';
import { LibUtil } from '../../../ets/pages/LibUtil';
import { UtilsTest } from '../Util.test'

const libUtil: LibUtil = new LibUtil();

export default function SliderTest() {

  describe('SliderTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api18_static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);
    });

    
    /**
     * @tc.number   testSliderEnableHpaticFeedback001
     * @tc.name     testSliderEnableHpaticFeedback001
     * @tc.desc     testSliderEnableHpaticFeedback001
     * @tc.level    Level.LEVEL0
     */
    it('testSliderEnableHpaticFeedback001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderEnableHpaticFeedback001()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSliderEnableHpaticFeedback002
     * @tc.name     testSliderEnableHpaticFeedback002
     * @tc.desc     testSliderEnableHpaticFeedback002
     * @tc.level    Level.LEVEL0
     */
    it('testSliderEnableHpaticFeedback002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderEnableHpaticFeedback002()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSliderEnableHpaticFeedback003
     * @tc.name     testSliderEnableHpaticFeedback003
     * @tc.desc     testSliderEnableHpaticFeedback003
     * @tc.level    Level.LEVEL0
     */
    it('testSliderEnableHpaticFeedback003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderEnableHpaticFeedback003()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSliderEnableHpaticFeedback004
     * @tc.name     testSliderEnableHpaticFeedback004
     * @tc.desc     testSliderEnableHpaticFeedback004
     * @tc.level    Level.LEVEL0
     */
    it('testSliderEnableHpaticFeedback004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderEnableHpaticFeedback004()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSliderEnableHpaticFeedback005
     * @tc.name     testSliderEnableHpaticFeedback005
     * @tc.desc     testSliderEnableHpaticFeedback005
     * @tc.level    Level.LEVEL0
     */
    it('testSliderEnableHpaticFeedback005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSliderEnableHpaticFeedback005()).assertEqual(0)
      done()
    })
  })
}

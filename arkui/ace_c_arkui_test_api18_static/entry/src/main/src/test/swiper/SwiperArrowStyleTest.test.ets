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
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import { LibUtil } from '../../../ets/pages/LibUtil';

const libUtil: LibUtil = new LibUtil();

export default function swiperArrowStyleTest() {

  describe('swiperArrowStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api18.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);
    });

    
    /**
     * @tc.number   testSwiperArrowStyle001
     * @tc.name     testSwiperArrowStyle001
     * @tc.desc     testSwiperArrowStyle001
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperArrowStyle001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperArrowStyle001()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSwiperArrowStyle002
     * @tc.name     testSwiperArrowStyle002
     * @tc.desc     testSwiperArrowStyle002
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperArrowStyle002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperArrowStyle002()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSwiperArrowStyle003
     * @tc.name     testSwiperArrowStyle003
     * @tc.desc     testSwiperArrowStyle003
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperArrowStyle003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperArrowStyle003()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSwiperArrowStyle004
     * @tc.name     testSwiperArrowStyle004
     * @tc.desc     testSwiperArrowStyle004
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperArrowStyle004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperArrowStyle004()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSwiperArrowStyle005
     * @tc.name     testSwiperArrowStyle005
     * @tc.desc     testSwiperArrowStyle005
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperArrowStyle005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperArrowStyle005()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSwiperArrowStyle006
     * @tc.name     testSwiperArrowStyle006
     * @tc.desc     testSwiperArrowStyle006
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperArrowStyle006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperArrowStyle006()).assertEqual(0)
      done()
    })

  })
}

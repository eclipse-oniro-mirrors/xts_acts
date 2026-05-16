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


export default function VisibleAreaEventOptionsTest(){
  describe('VisibleAreaEventOptionsTest',  () =>{
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api18.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    

    /**
     * @tc.number   VisibleAreaEventOptionsTest
     * @tc.name     VisibleAreaEventOptionsTest
     * @tc.desc     VisibleAreaEventOptionsTest
     * @tc.level    Level.LEVEL1
     */
    it('VisibleAreaEventOptionsTest', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("push VisibleAreaEventOptionsTest page success: ")
      try {
        let ret = libUtil.DragEndPendingTest_001()
        console.log('VisibleAreaEventOptionsTest will drag and check:: ', ret)
      }catch(error) {
        expect().assertFail();
      }
      done()
    })
    
    /**
     * @tc.number   VisibleAreaEventOptionsTest_a
     * @tc.name     VisibleAreaEventOptionsTest_a
     * @tc.desc     VisibleAreaEventOptionsTest_a
     * @tc.level    Level.LEVEL1
     */
    it('VisibleAreaEventOptionsTest_a', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.VisibleAreaEventOptionsTest_a()).assertEqual(0)
      await Utils.sleep(100)
      done()
    })

    
    /**
     * @tc.number   VisibleAreaEventOptionsTest_b
     * @tc.name     VisibleAreaEventOptionsTest_b
     * @tc.desc     VisibleAreaEventOptionsTest_b
     * @tc.level    Level.LEVEL1
     */
    it('VisibleAreaEventOptionsTest_b', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.VisibleAreaEventOptionsTest_b()).assertEqual(0)
      await Utils.sleep(100)
      done()
    })
    
    /**
     * @tc.number   VisibleAreaEventOptionsTest_c
     * @tc.name     VisibleAreaEventOptionsTest_c
     * @tc.desc     VisibleAreaEventOptionsTest_c
     * @tc.level    Level.LEVEL1
     */
    it('VisibleAreaEventOptionsTest_c', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.VisibleAreaEventOptionsTest_c()).assertEqual(0)
      await Utils.sleep(100)
      done()
    })
    
    /**
     * @tc.number   VisibleAreaEventOptionsTest_d
     * @tc.name     VisibleAreaEventOptionsTest_d
     * @tc.desc     VisibleAreaEventOptionsTest_d
     * @tc.level    Level.LEVEL1
     */
    it('VisibleAreaEventOptionsTest_d', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.VisibleAreaEventOptionsTest_d()).assertEqual(0)
      await Utils.sleep(100)
      done()
    })
  })
}
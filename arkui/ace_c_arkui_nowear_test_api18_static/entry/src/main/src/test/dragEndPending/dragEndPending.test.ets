'use static';
/**
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



export default function DragEndPendingTest(){
  describe('DragEndPendingTest',  () =>{
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api18_static", "EntryAbility")
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    /**
     * @tc.number   DragEndPendingTest_a
     * @tc.name     DragEndPendingTest_a
     * @tc.desc     DragEndPendingTest_a
     * @tc.level    Level.LEVEL0
     */
    it('DragEndPendingTest_a', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.DragEndPendingTest_a()).assertEqual(0)
      console.log('DragEndPendingTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   DragEndPendingTest_a1
     * @tc.name     DragEndPendingTest_a1
     * @tc.desc     DragEndPendingTest_a1
     * @tc.level    Level.LEVEL0
     */
    it('DragEndPendingTest_a1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.DragEndPendingTest_a1()).assertEqual(0)
      console.log('DragEndPendingTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   DragEndPendingTest_b
     * @tc.name     DragEndPendingTest_b
     * @tc.desc     DragEndPendingTest_b
     * @tc.level    Level.LEVEL0
     */
    it('DragEndPendingTest_b', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.DragEndPendingTest_b()).assertEqual(0)
      console.log('DragEndPendingTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   DragEndPendingTest_c
     * @tc.name     DragEndPendingTest_c
     * @tc.desc     DragEndPendingTest_c
     * @tc.level    Level.LEVEL0
     */
    it('DragEndPendingTest_c', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.DragEndPendingTest_c()).assertEqual(0)
      console.log('DragEndPendingTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


  })
}
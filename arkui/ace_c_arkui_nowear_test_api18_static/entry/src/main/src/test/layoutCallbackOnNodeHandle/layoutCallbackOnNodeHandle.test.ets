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



export default function LayoutCallbackOnNodeHandleTest(){
  describe('LayoutCallbackOnNodeHandleTest',  () =>{
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api18_static", "EntryAbility")
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    /**
     * @tc.number   LayoutCallbackOnNodeHandleTest_a
     * @tc.name     LayoutCallbackOnNodeHandleTest_a
     * @tc.desc     LayoutCallbackOnNodeHandleTest_a
     * @tc.level    Level.LEVEL0
     */
    it('LayoutCallbackOnNodeHandleTest_a', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.LayoutCallbackOnNodeHandleTest_a()).assertEqual(0)
      console.log('LayoutCallbackOnNodeHandleTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   LayoutCallbackOnNodeHandleTest_a1
     * @tc.name     LayoutCallbackOnNodeHandleTest_a1
     * @tc.desc     LayoutCallbackOnNodeHandleTest_a1
     * @tc.level    Level.LEVEL0
     */
    it('LayoutCallbackOnNodeHandleTest_a1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.LayoutCallbackOnNodeHandleTest_a1()).assertEqual(0)
      console.log('LayoutCallbackOnNodeHandleTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   LayoutCallbackOnNodeHandleTest_b
     * @tc.name     LayoutCallbackOnNodeHandleTest_b
     * @tc.desc     LayoutCallbackOnNodeHandleTest_b
     * @tc.level    Level.LEVEL0
     */
    it('LayoutCallbackOnNodeHandleTest_b', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.LayoutCallbackOnNodeHandleTest_b()).assertEqual(0)
      console.log('LayoutCallbackOnNodeHandleTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   LayoutCallbackOnNodeHandleTest_b1
     * @tc.name     LayoutCallbackOnNodeHandleTest_b1
     * @tc.desc     LayoutCallbackOnNodeHandleTest_b1
     * @tc.level    Level.LEVEL0
     */
    it('LayoutCallbackOnNodeHandleTest_b1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.LayoutCallbackOnNodeHandleTest_b1()).assertEqual(0)
      console.log('LayoutCallbackOnNodeHandleTest_b1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   LayoutCallbackOnNodeHandleTest_c
     * @tc.name     LayoutCallbackOnNodeHandleTest_c
     * @tc.desc     LayoutCallbackOnNodeHandleTest_c
     * @tc.level    Level.LEVEL0
     */
    it('LayoutCallbackOnNodeHandleTest_c', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.LayoutCallbackOnNodeHandleTest_c()).assertEqual(0)
      console.log('LayoutCallbackOnNodeHandleTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   LayoutCallbackOnNodeHandleTest_c1
     * @tc.name     LayoutCallbackOnNodeHandleTest_c1
     * @tc.desc     LayoutCallbackOnNodeHandleTest_c1
     * @tc.level    Level.LEVEL0
     */
    it('LayoutCallbackOnNodeHandleTest_c1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.LayoutCallbackOnNodeHandleTest_c1()).assertEqual(0)
      console.log('LayoutCallbackOnNodeHandleTest_c1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   LayoutCallbackOnNodeHandleTest_d
     * @tc.name     LayoutCallbackOnNodeHandleTest_d
     * @tc.desc     LayoutCallbackOnNodeHandleTest_d
     * @tc.level    Level.LEVEL0
     */
    it('LayoutCallbackOnNodeHandleTest_d', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.LayoutCallbackOnNodeHandleTest_d()).assertEqual(0)
      console.log('LayoutCallbackOnNodeHandleTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   LayoutCallbackOnNodeHandleTest_d1
     * @tc.name     LayoutCallbackOnNodeHandleTest_d1
     * @tc.desc     LayoutCallbackOnNodeHandleTest_d1
     * @tc.level    Level.LEVEL0
     */
    it('LayoutCallbackOnNodeHandleTest_d1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.LayoutCallbackOnNodeHandleTest_d1()).assertEqual(0)
      console.log('LayoutCallbackOnNodeHandleTest_d1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

  })
}
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



export default function GetGestureParamTest(){
  describe('GetGestureParamTest',  () =>{
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api18_static", "EntryAbility")
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    /**
     * @tc.number   GetGestureParamTest_a
     * @tc.name     GetGestureParamTest_a
     * @tc.desc     GetGestureParamTest_a
     * @tc.level    Level.LEVEL0
     */
    it('GetGestureParamTest_a', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.GetGestureParamTest_a()).assertEqual(0)
      console.log('GetGestureParamTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   GetGestureParamTest_a1
     * @tc.name     GetGestureParamTest_a1
     * @tc.desc     GetGestureParamTest_a1
     * @tc.level    Level.LEVEL0
     */
    it('GetGestureParamTest_a1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.GetGestureParamTest_a1()).assertEqual(0)
      console.log('GetGestureParamTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   GetGestureParamTest_b
     * @tc.name     GetGestureParamTest_b
     * @tc.desc     GetGestureParamTest_b
     * @tc.level    Level.LEVEL0
     */
    it('GetGestureParamTest_b', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.GetGestureParamTest_b()).assertEqual(0)
      console.log('GetGestureParamTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   GetGestureParamTest_c
     * @tc.name     GetGestureParamTest_c
     * @tc.desc     GetGestureParamTest_c
     * @tc.level    Level.LEVEL0
     */
    it('GetGestureParamTest_c', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.GetGestureParamTest_c()).assertEqual(0)
      console.log('GetGestureParamTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   GetGestureParamTest_d
     * @tc.name     GetGestureParamTest_d
     * @tc.desc     GetGestureParamTest_d
     * @tc.level    Level.LEVEL0
     */
    it('GetGestureParamTest_d', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.GetGestureParamTest_d()).assertEqual(0)
      console.log('GetGestureParamTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   GetGestureParamTest_e
     * @tc.name     GetGestureParamTest_e
     * @tc.desc     GetGestureParamTest_e
     * @tc.level    Level.LEVEL0
     */
    it('GetGestureParamTest_e', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.GetGestureParamTest_e()).assertEqual(0)
      console.log('GetGestureParamTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   GetGestureParamTest_f
     * @tc.name     GetGestureParamTest_f
     * @tc.desc     GetGestureParamTest_f
     * @tc.level    Level.LEVEL0
     */
    it('GetGestureParamTest_f', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.GetGestureParamTest_f()).assertEqual(0)
      console.log('GetGestureParamTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   GetGestureParamTest_g
     * @tc.name     GetGestureParamTest_g
     * @tc.desc     GetGestureParamTest_g
     * @tc.level    Level.LEVEL0
     */
    it('GetGestureParamTest_g', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.GetGestureParamTest_g()).assertEqual(0)
      console.log('GetGestureParamTest_g will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   GetGestureParamTest_h
     * @tc.name     GetGestureParamTest_h
     * @tc.desc     GetGestureParamTest_h
     * @tc.level    Level.LEVEL0
     */
    it('GetGestureParamTest_h', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.GetGestureParamTest_h()).assertEqual(0)
      console.log('GetGestureParamTest_h will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   GetGestureParamTest_i
     * @tc.name     GetGestureParamTest_i
     * @tc.desc     GetGestureParamTest_i
     * @tc.level    Level.LEVEL0
     */
    it('GetGestureParamTest_i', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.GetGestureParamTest_i()).assertEqual(0)
      console.log('GetGestureParamTest_i will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   GetGestureParamTest_j
     * @tc.name     GetGestureParamTest_j
     * @tc.desc     GetGestureParamTest_j
     * @tc.level    Level.LEVEL0
     */
    it('GetGestureParamTest_j', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.GetGestureParamTest_j()).assertEqual(0)
      console.log('GetGestureParamTest_j will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   GetGestureParamTest_j1
     * @tc.name     GetGestureParamTest_j1
     * @tc.desc     GetGestureParamTest_j1
     * @tc.level    Level.LEVEL0
     */
    it('GetGestureParamTest_j1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.GetGestureParamTest_j1()).assertEqual(0)
      console.log('GetGestureParamTest_j1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


  })
}

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



export default function SwiperArrowStyleTest(){
  describe('SwiperArrowStyleTest',  () =>{
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api18_static", "EntryAbility")
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    /**
     * @tc.number   SwiperArrowStyleTest_a
     * @tc.name     SwiperArrowStyleTest_a
     * @tc.desc     SwiperArrowStyleTest_a
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_a', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_a()).assertEqual(0)
      console.log('SwiperArrowStyleTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_b
     * @tc.name     SwiperArrowStyleTest_b
     * @tc.desc     SwiperArrowStyleTest_b
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_b', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_b()).assertEqual(0)
      console.log('SwiperArrowStyleTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_c
     * @tc.name     SwiperArrowStyleTest_c
     * @tc.desc     SwiperArrowStyleTest_c
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_c', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_c()).assertEqual(0)
      console.log('SwiperArrowStyleTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_c1
     * @tc.name     SwiperArrowStyleTest_c1
     * @tc.desc     SwiperArrowStyleTest_c1
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_c1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_c1()).assertEqual(0)
      console.log('SwiperArrowStyleTest_c1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_c2
     * @tc.name     SwiperArrowStyleTest_c2
     * @tc.desc     SwiperArrowStyleTest_c2
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_c2', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_c2()).assertEqual(0)
      console.log('SwiperArrowStyleTest_c2 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_d
     * @tc.name     SwiperArrowStyleTest_d
     * @tc.desc     SwiperArrowStyleTest_d
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_d', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_d()).assertEqual(0)
      console.log('SwiperArrowStyleTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_d1
     * @tc.name     SwiperArrowStyleTest_d1
     * @tc.desc     SwiperArrowStyleTest_d1
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_d1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_d1()).assertEqual(0)
      console.log('SwiperArrowStyleTest_d1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_d2
     * @tc.name     SwiperArrowStyleTest_d2
     * @tc.desc     SwiperArrowStyleTest_d2
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_d2', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_d2()).assertEqual(0)
      console.log('SwiperArrowStyleTest_d2 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_e
     * @tc.name     SwiperArrowStyleTest_e
     * @tc.desc     SwiperArrowStyleTest_e
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_e', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_e()).assertEqual(0)
      console.log('SwiperArrowStyleTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_e1
     * @tc.name     SwiperArrowStyleTest_e1
     * @tc.desc     SwiperArrowStyleTest_e1
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_e1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_e1()).assertEqual(0)
      console.log('SwiperArrowStyleTest_e1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_f
     * @tc.name     SwiperArrowStyleTest_f
     * @tc.desc     SwiperArrowStyleTest_f
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_f', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_f()).assertEqual(0)
      console.log('SwiperArrowStyleTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_f1
     * @tc.name     SwiperArrowStyleTest_f1
     * @tc.desc     SwiperArrowStyleTest_f1
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_f1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_f1()).assertEqual(0)
      console.log('SwiperArrowStyleTest_f1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_g
     * @tc.name     SwiperArrowStyleTest_g
     * @tc.desc     SwiperArrowStyleTest_g
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_g', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_g()).assertEqual(0)
      console.log('SwiperArrowStyleTest_g will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_g1
     * @tc.name     SwiperArrowStyleTest_g1
     * @tc.desc     SwiperArrowStyleTest_g1
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_g1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_g1()).assertEqual(0)
      console.log('SwiperArrowStyleTest_g1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_h
     * @tc.name     SwiperArrowStyleTest_h
     * @tc.desc     SwiperArrowStyleTest_h
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_h', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_h()).assertEqual(0)
      console.log('SwiperArrowStyleTest_h will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperArrowStyleTest_h1
     * @tc.name     SwiperArrowStyleTest_h1
     * @tc.desc     SwiperArrowStyleTest_h1
     * @tc.level    Level.LEVEL0
     */
    it('SwiperArrowStyleTest_h1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperArrowStyleTest_h1()).assertEqual(0)
      console.log('SwiperArrowStyleTest_h1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


  })
}
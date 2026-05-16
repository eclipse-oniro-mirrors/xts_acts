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


export default function AccessibilityValueTest(){
  describe('AccessibilityValueTest',  () =>{
    beforeAll((): void => {
      console.info("[ui] beforeAll start");
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api18_static", "EntryAbility")
      console.info("[ui] beforeAll end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    /**
     * @tc.number   AccessibilityValueTest_a
     * @tc.name     AccessibilityValueTest_a
     * @tc.desc     AccessibilityValueTest_a
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_a', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_a()).assertEqual(0)
      console.log('AccessibilityValueTest_a will drag and check:: ')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_a1
     * @tc.name     AccessibilityValueTest_a1
     * @tc.desc     AccessibilityValueTest_a1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_a1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_a1()).assertEqual(0)
      console.log('AccessibilityValueTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_b
     * @tc.name     AccessibilityValueTest_b
     * @tc.desc     AccessibilityValueTest_b
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_b', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_b()).assertEqual(0)
      console.log('AccessibilityValueTest_b will drag and check:: ')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_b1
     * @tc.name     AccessibilityValueTest_b1
     * @tc.desc     AccessibilityValueTest_b1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_b1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_b1()).assertEqual(0)
      console.log('AccessibilityValueTest_b1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_c
     * @tc.name     AccessibilityValueTest_c
     * @tc.desc     AccessibilityValueTest_c
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_c', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_c()).assertEqual(0)
      console.log('AccessibilityValueTest_c will drag and check:: ')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_c1
     * @tc.name     AccessibilityValueTest_c1
     * @tc.desc     AccessibilityValueTest_c1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_c1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_c1()).assertEqual(0)
      console.log('AccessibilityValueTest_c1 will drag and check:: ')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_d
     * @tc.name     AccessibilityValueTest_d
     * @tc.desc     AccessibilityValueTest_d
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_d', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_d()).assertEqual(0)
      console.log('AccessibilityValueTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_d1
     * @tc.name     AccessibilityValueTest_d1
     * @tc.desc     AccessibilityValueTest_d1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_d1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_d1()).assertEqual(0)
      console.log('AccessibilityValueTest_d1 will drag and check:: ')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_e
     * @tc.name     AccessibilityValueTest_e
     * @tc.desc     AccessibilityValueTest_e
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_e', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_e()).assertEqual(0)
      console.log('AccessibilityValueTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_e1
     * @tc.name     AccessibilityValueTest_e1
     * @tc.desc     AccessibilityValueTest_e1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_e1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_e1()).assertEqual(0)
      console.log('AccessibilityValueTest_e1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_f
     * @tc.name     AccessibilityValueTest_f
     * @tc.desc     AccessibilityValueTest_f
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_f', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_f()).assertEqual(0)
      console.log('AccessibilityValueTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_f1
     * @tc.name     AccessibilityValueTest_f1
     * @tc.desc     AccessibilityValueTest_f1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_f1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_f1()).assertEqual(0)
      console.log('AccessibilityValueTest_f1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_g
     * @tc.name     AccessibilityValueTest_g
     * @tc.desc     AccessibilityValueTest_g
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_g', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_g()).assertEqual(0)
      console.log('AccessibilityValueTest_g will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_g1
     * @tc.name     AccessibilityValueTest_g1
     * @tc.desc     AccessibilityValueTest_g1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_g1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_g1()).assertEqual(0)
      console.log('AccessibilityValueTest_g1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_h
     * @tc.name     AccessibilityValueTest_h
     * @tc.desc     AccessibilityValueTest_h
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_h', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_h()).assertEqual(0)
      console.log('AccessibilityValueTest_h will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_h1
     * @tc.name     AccessibilityValueTest_h1
     * @tc.desc     AccessibilityValueTest_h1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_h1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_h1()).assertEqual(0)
      console.log('AccessibilityValueTest_h1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_i
     * @tc.name     AccessibilityValueTest_i
     * @tc.desc     AccessibilityValueTest_i
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_i', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_i()).assertEqual(0)
      console.log('AccessibilityValueTest_i will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_i1
     * @tc.name     AccessibilityValueTest_i1
     * @tc.desc     AccessibilityValueTest_i1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_i1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_i1()).assertEqual(0)
      console.log('AccessibilityValueTest_i1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_j
     * @tc.name     AccessibilityValueTest_j
     * @tc.desc     AccessibilityValueTest_j
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_j', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_j()).assertEqual(0)
      console.log('AccessibilityValueTest_j will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_j1
     * @tc.name     AccessibilityValueTest_j1
     * @tc.desc     AccessibilityValueTest_j1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_j1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_j1()).assertEqual(0)
      console.log('AccessibilityValueTest_j1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_k1
     * @tc.name     AccessibilityValueTest_k1
     * @tc.desc     AccessibilityValueTest_k1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_k1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_k1()).assertEqual(0)
      console.log('AccessibilityValueTest_k1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_l
     * @tc.name     AccessibilityValueTest_l
     * @tc.desc     AccessibilityValueTest_l
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_l', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_l()).assertEqual(0)
      console.log('AccessibilityValueTest_l will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_l1
     * @tc.name     AccessibilityValueTest_l1
     * @tc.desc     AccessibilityValueTest_l1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_l1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_l1()).assertEqual(0)
      console.log('AccessibilityValueTest_l1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_m
     * @tc.name     AccessibilityValueTest_m
     * @tc.desc     AccessibilityValueTest_m
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_m', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_m()).assertEqual(0)
      console.log('AccessibilityValueTest_m will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_m1
     * @tc.name     AccessibilityValueTest_m1
     * @tc.desc     AccessibilityValueTest_m1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_m1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_m1()).assertEqual(0)
      console.log('AccessibilityValueTest_m1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_n
     * @tc.name     AccessibilityValueTest_n
     * @tc.desc     AccessibilityValueTest_n
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_n', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_n()).assertEqual(0)
      console.log('AccessibilityValueTest_n will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_n1
     * @tc.name     AccessibilityValueTest_n1
     * @tc.desc     AccessibilityValueTest_n1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_n1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_n1()).assertEqual(0)
      console.log('AccessibilityValueTest_n1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


    /**
     * @tc.number   AccessibilityValueTest_o1
     * @tc.name     AccessibilityValueTest_o1
     * @tc.desc     AccessibilityValueTest_o1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_o1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_o1()).assertEqual(0)
      console.log('AccessibilityValueTest_o1 will drag and check:: ')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_p
     * @tc.name     AccessibilityValueTest_p
     * @tc.desc     AccessibilityValueTest_p
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_p', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_p()).assertEqual(0)
      console.log('AccessibilityValueTest_p will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

    /**
     * @tc.number   AccessibilityValueTest_p1
     * @tc.name     AccessibilityValueTest_p1
     * @tc.desc     AccessibilityValueTest_p1
     * @tc.level    Level.LEVEL0
     */
    it('AccessibilityValueTest_p1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.AccessibilityValueTest_p1()).assertEqual(0)
      console.log('AccessibilityValueTest_p1 will drag and check:: ')
      await Utils.sleep(200)

      done()
    })


  })
}
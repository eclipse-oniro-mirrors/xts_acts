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

let libUtil: LibUtil = new LibUtil();

export default function ArkuiXComponentTest(){
  describe('ArkuiXComponentTest',  () =>{
    beforeAll((): void => {
      console.info("[ui] beforeAll start");
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api18_static", "EntryAbility")
      console.info("[ui] beforeAll start");
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    /**
     * @tc.number   ArkuiXComponentTest_a
     * @tc.name     ArkuiXComponentTest_a
     * @tc.desc     ArkuiXComponentTest_a
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_a', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.DragEndPendingTest_a()).assertEqual(0)
      console.log('DragEndPendingTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   ArkuiXComponentTest_b
     * @tc.name     ArkuiXComponentTest_b
     * @tc.desc     ArkuiXComponentTest_b
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_b', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.ArkuiXComponentTest_b()).assertEqual(0)
      console.log('ArkuiXComponentTest_b will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

    /**
     * @tc.number   ArkuiXComponentTest_c
     * @tc.name     ArkuiXComponentTest_c
     * @tc.desc     ArkuiXComponentTest_c
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_c', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.ArkuiXComponentTest_c()).assertEqual(0)
      console.log('ArkuiXComponentTest_c will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

    /**
     * @tc.number   ArkuiXComponentTest_d
     * @tc.name     ArkuiXComponentTest_d
     * @tc.desc     ArkuiXComponentTest_d
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_d', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.ArkuiXComponentTest_d()).assertEqual(0)
      console.log('ArkuiXComponentTest_d will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

    /**
     * @tc.number   ArkuiXComponentTest_e
     * @tc.name     ArkuiXComponentTest_e
     * @tc.desc     ArkuiXComponentTest_e
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_e', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.ArkuiXComponentTest_e()).assertEqual(0)
      console.log('ArkuiXComponentTest_e will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

    /**
     * @tc.number   ArkuiXComponentTest_f
     * @tc.name     ArkuiXComponentTest_f
     * @tc.desc     ArkuiXComponentTest_f
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_f', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.ArkuiXComponentTest_f()).assertEqual(0)
      console.log('ArkuiXComponentTest_f will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

    /**
     * @tc.number   ArkuiXComponentTest_g
     * @tc.name     ArkuiXComponentTest_g
     * @tc.desc     ArkuiXComponentTest_g
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_g', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.ArkuiXComponentTest_g()).assertEqual(0)
      console.log('ArkuiXComponentTest_g will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

    /**
     * @tc.number   ArkuiXComponentTest_g1
     * @tc.name     ArkuiXComponentTest_g1
     * @tc.desc     ArkuiXComponentTest_g1
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_g1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.ArkuiXComponentTest_g1()).assertEqual(0)
      console.log('ArkuiXComponentTest_g1 will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

    /**
     * @tc.number   ArkuiXComponentTest_h
     * @tc.name     ArkuiXComponentTest_h
     * @tc.desc     ArkuiXComponentTest_h
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_h', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.ArkuiXComponentTest_h()).assertEqual(0)
      console.log('ArkuiXComponentTest_h will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

    /**
     * @tc.number   ArkuiXComponentTest_h1
     * @tc.name     ArkuiXComponentTest_h1
     * @tc.desc     ArkuiXComponentTest_h1
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_h1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.ArkuiXComponentTest_h1()).assertEqual(0)
      console.log('ArkuiXComponentTest_h1 will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

    /**
     * @tc.number   ArkuiXComponentTest_i
     * @tc.name     ArkuiXComponentTest_i
     * @tc.desc     ArkuiXComponentTest_i
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_i', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.ArkuiXComponentTest_i()).assertEqual(0)
      console.log('ArkuiXComponentTest_i will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

    /**
     * @tc.number   ArkuiXComponentTest_i1
     * @tc.name     ArkuiXComponentTest_i1
     * @tc.desc     ArkuiXComponentTest_i1
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_i1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.ArkuiXComponentTest_i1()).assertEqual(0)
      console.log('ArkuiXComponentTest_i1 will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

    /**
     * @tc.number   ArkuiXComponentTest_j
     * @tc.name     ArkuiXComponentTest_j
     * @tc.desc     ArkuiXComponentTest_j
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_j', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.ArkuiXComponentTest_j()).assertEqual(0)
      console.log('ArkuiXComponentTest_j will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

    /**
     * @tc.number   ArkuiXComponentTest_j1
     * @tc.name     ArkuiXComponentTest_j1
     * @tc.desc     ArkuiXComponentTest_j1
     * @tc.level    Level.LEVEL0
     */
    it('ArkuiXComponentTest_j1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.ArkuiXComponentTest_j1()).assertEqual(0)
      console.log('ArkuiXComponentTest_j1 will drag and check:: ')
      await Utils.sleep(200)

      done()
    })

  })
}
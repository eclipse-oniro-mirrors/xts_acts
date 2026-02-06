/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, beforeEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import nativeRender from 'libnativerender.so'
import Utils from '../common/Utils';


export default function ArkuiXComponentTest(){
  describe('ArkuiXComponentTest',  () =>{

    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    it('ArkuiXComponentTest_a',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.DragEndPendingTest_a()).assertEqual(0)
      console.log('DragEndPendingTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('ArkuiXComponentTest_b',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.ArkuiXComponentTest_b()).assertEqual(0)
      console.log('ArkuiXComponentTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('ArkuiXComponentTest_c',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.ArkuiXComponentTest_c()).assertEqual(0)
      console.log('ArkuiXComponentTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('ArkuiXComponentTest_d',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.ArkuiXComponentTest_d()).assertEqual(0)
      console.log('ArkuiXComponentTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('ArkuiXComponentTest_e',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.ArkuiXComponentTest_e()).assertEqual(0)
      console.log('ArkuiXComponentTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('ArkuiXComponentTest_f',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.ArkuiXComponentTest_f()).assertEqual(0)
      console.log('ArkuiXComponentTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('ArkuiXComponentTest_g',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.ArkuiXComponentTest_g()).assertEqual(0)
      console.log('ArkuiXComponentTest_g will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('ArkuiXComponentTest_g1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.ArkuiXComponentTest_g1()).assertEqual(0)
      console.log('ArkuiXComponentTest_g1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('ArkuiXComponentTest_h',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.ArkuiXComponentTest_h()).assertEqual(0)
      console.log('ArkuiXComponentTest_h will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('ArkuiXComponentTest_h1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.ArkuiXComponentTest_h1()).assertEqual(0)
      console.log('ArkuiXComponentTest_h1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('ArkuiXComponentTest_i',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.ArkuiXComponentTest_i()).assertEqual(0)
      console.log('ArkuiXComponentTest_i will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('ArkuiXComponentTest_i1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.ArkuiXComponentTest_i1()).assertEqual(0)
      console.log('ArkuiXComponentTest_i1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('ArkuiXComponentTest_j',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.ArkuiXComponentTest_j()).assertEqual(0)
      console.log('ArkuiXComponentTest_j will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('ArkuiXComponentTest_j1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.ArkuiXComponentTest_j1()).assertEqual(0)
      console.log('ArkuiXComponentTest_j1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

  })
}
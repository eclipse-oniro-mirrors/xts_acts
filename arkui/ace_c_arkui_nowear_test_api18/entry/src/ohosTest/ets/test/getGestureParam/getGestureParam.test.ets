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


export default function GetGestureParamTest(){
  describe('GetGestureParamTest',  () =>{

    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    it('GetGestureParamTest_a',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_a()).assertEqual(0)
      console.log('GetGestureParamTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('GetGestureParamTest_a1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_a1()).assertEqual(0)
      console.log('GetGestureParamTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('GetGestureParamTest_b',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_b()).assertEqual(0)
      console.log('GetGestureParamTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('GetGestureParamTest_c',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_c()).assertEqual(0)
      console.log('GetGestureParamTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('GetGestureParamTest_d',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_d()).assertEqual(0)
      console.log('GetGestureParamTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('GetGestureParamTest_e',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_e()).assertEqual(0)
      console.log('GetGestureParamTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('GetGestureParamTest_f',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_f()).assertEqual(0)
      console.log('GetGestureParamTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('GetGestureParamTest_g',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_g()).assertEqual(0)
      console.log('GetGestureParamTest_g will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('GetGestureParamTest_h',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_h()).assertEqual(0)
      console.log('GetGestureParamTest_h will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('GetGestureParamTest_i',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_i()).assertEqual(0)
      console.log('GetGestureParamTest_i will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('GetGestureParamTest_j',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_j()).assertEqual(0)
      console.log('GetGestureParamTest_j will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('GetGestureParamTest_j1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_j1()).assertEqual(0)
      console.log('GetGestureParamTest_j1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


  })
}

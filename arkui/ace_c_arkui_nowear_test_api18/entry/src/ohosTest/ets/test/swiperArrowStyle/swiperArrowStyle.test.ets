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


export default function SwiperArrowStyleTest(){
  describe('SwiperArrowStyleTest',  () =>{

    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    it('SwiperArrowStyleTest_a',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_a()).assertEqual(0)
      console.log('SwiperArrowStyleTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_b',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_b()).assertEqual(0)
      console.log('SwiperArrowStyleTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_c',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_c()).assertEqual(0)
      console.log('SwiperArrowStyleTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_c1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_c1()).assertEqual(0)
      console.log('SwiperArrowStyleTest_c1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_c2',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_c2()).assertEqual(0)
      console.log('SwiperArrowStyleTest_c2 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_d',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_d()).assertEqual(0)
      console.log('SwiperArrowStyleTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_d1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_d1()).assertEqual(0)
      console.log('SwiperArrowStyleTest_d1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_d2',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_d2()).assertEqual(0)
      console.log('SwiperArrowStyleTest_d2 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_e',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_e()).assertEqual(0)
      console.log('SwiperArrowStyleTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_e1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_e1()).assertEqual(0)
      console.log('SwiperArrowStyleTest_e1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_f',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_f()).assertEqual(0)
      console.log('SwiperArrowStyleTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_f1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_f1()).assertEqual(0)
      console.log('SwiperArrowStyleTest_f1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_g',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_g()).assertEqual(0)
      console.log('SwiperArrowStyleTest_g will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_g1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_g1()).assertEqual(0)
      console.log('SwiperArrowStyleTest_g1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_h',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_h()).assertEqual(0)
      console.log('SwiperArrowStyleTest_h will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SwiperArrowStyleTest_h1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperArrowStyleTest_h1()).assertEqual(0)
      console.log('SwiperArrowStyleTest_h1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


  })
}
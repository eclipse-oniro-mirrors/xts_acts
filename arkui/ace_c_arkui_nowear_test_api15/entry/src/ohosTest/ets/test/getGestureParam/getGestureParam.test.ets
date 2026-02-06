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

import { expect, describe, it, afterEach, beforeEach,  Level } from '@ohos/hypium';
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

    /**
     * @tc.name   GetGestureParamTest_a
     * @tc.number GetGestureParamTest_a
     * @tc.desc   GetGestureParamTest_a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetGestureParamTest_a',  Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_a()).assertEqual(0)
      console.log('GetGestureParamTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   GetGestureParamTest_a1
     * @tc.number GetGestureParamTest_a1
     * @tc.desc   GetGestureParamTest_a1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetGestureParamTest_a1',  Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_a1()).assertEqual(0)
      console.log('GetGestureParamTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   GetGestureParamTest_b
     * @tc.number GetGestureParamTest_b
     * @tc.desc   GetGestureParamTest_b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetGestureParamTest_b',  Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_b()).assertEqual(0)
      console.log('GetGestureParamTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   GetGestureParamTest_c
     * @tc.number GetGestureParamTest_c
     * @tc.desc   GetGestureParamTest_c
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetGestureParamTest_c',  Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_c()).assertEqual(0)
      console.log('GetGestureParamTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   GetGestureParamTest_d
     * @tc.number GetGestureParamTest_d
     * @tc.desc   GetGestureParamTest_d
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetGestureParamTest_d',  Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_d()).assertEqual(0)
      console.log('GetGestureParamTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   GetGestureParamTest_e
     * @tc.number GetGestureParamTest_e
     * @tc.desc   GetGestureParamTest_e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetGestureParamTest_e',  Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_e()).assertEqual(0)
      console.log('GetGestureParamTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   GetGestureParamTest_f
     * @tc.number GetGestureParamTest_f
     * @tc.desc   GetGestureParamTest_f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetGestureParamTest_f',  Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_f()).assertEqual(0)
      console.log('GetGestureParamTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   GetGestureParamTest_g
     * @tc.number GetGestureParamTest_g
     * @tc.desc   GetGestureParamTest_g
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetGestureParamTest_g',  Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_g()).assertEqual(0)
      console.log('GetGestureParamTest_g will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   GetGestureParamTest_h
     * @tc.number GetGestureParamTest_h
     * @tc.desc   GetGestureParamTest_h
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetGestureParamTest_h',  Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_h()).assertEqual(0)
      console.log('GetGestureParamTest_h will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   GetGestureParamTest_i
     * @tc.number GetGestureParamTest_i
     * @tc.desc   GetGestureParamTest_i
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetGestureParamTest_i',  Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_i()).assertEqual(0)
      console.log('GetGestureParamTest_i will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   GetGestureParamTest_j
     * @tc.number GetGestureParamTest_j
     * @tc.desc   GetGestureParamTest_j
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetGestureParamTest_j',  Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_j()).assertEqual(0)
      console.log('GetGestureParamTest_j will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   GetGestureParamTest_j1
     * @tc.number GetGestureParamTest_j1
     * @tc.desc   GetGestureParamTest_j1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetGestureParamTest_j1',  Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.GetGestureParamTest_j1()).assertEqual(0)
      console.log('GetGestureParamTest_j1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


  })
}
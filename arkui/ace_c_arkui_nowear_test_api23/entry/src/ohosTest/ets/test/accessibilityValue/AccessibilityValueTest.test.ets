/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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


export default function AccessibilityValueTest(){
  describe('AccessibilityValueTest',  () =>{

    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d10
     * @tc.number AccessibilityValueTest_d10
     * @tc.desc   Test absRxValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessibilityValueTest_d10',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d10()).assertEqual(0)
      console.log('AccessibilityValueTest_d10 will perform dragging and checking:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d101
     * @tc.number AccessibilityValueTest_d101
     * @tc.desc   Test absRxValue nullptr case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AccessibilityValueTest_d101',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d101()).assertEqual(0)
      console.log('AccessibilityValueTest_d101 test absRxValue nullptr:: ')
      await Utils.sleep(200)
      
      done()
    })

   /**
     * @tc.name   AccessibilityValueTest_d11
     * @tc.number AccessibilityValueTest_d11
     * @tc.desc   Test absRyValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessibilityValueTest_d11',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d11()).assertEqual(0)
      console.log('AccessibilityValueTest_d11 will perform dragging and checking:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d111
     * @tc.number AccessibilityValueTest_d111
     * @tc.desc   Test absRyValue nullptr case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AccessibilityValueTest_d111',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d111()).assertEqual(0)
      console.log('AccessibilityValueTest_d111 test absRyValue nullptr:: ')
      await Utils.sleep(200)
      
      done()
    })
    
  /**
     * @tc.name   AccessibilityValueTest_d12
     * @tc.number AccessibilityValueTest_d12
     * @tc.desc   Test absThrottleValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessibilityValueTest_d12',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d12()).assertEqual(0)
      console.log('AccessibilityValueTest_d12 will perform dragging and checking:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d121
     * @tc.number AccessibilityValueTest_d121
     * @tc.desc   Test absThrottleValue nullptr case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AccessibilityValueTest_d121',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d121()).assertEqual(0)
      console.log('AccessibilityValueTest_d121 test absThrottleValue nullptr:: ')
      await Utils.sleep(200)
      
      done()
    })
    
     /**
     * @tc.name   AccessibilityValueTest_d13
     * @tc.number AccessibilityValueTest_d13
     * @tc.desc   Test absRudderValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessibilityValueTest_d13',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d13()).assertEqual(0)
      console.log('AccessibilityValueTest_d13 will perform dragging and checking:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d131
     * @tc.number AccessibilityValueTest_d131
     * @tc.desc   Test absRudderValue nullptr case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AccessibilityValueTest_d131',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d131()).assertEqual(0)
      console.log('AccessibilityValueTest_d131 test absRudderValue nullptr:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d14
     * @tc.number AccessibilityValueTest_d14
     * @tc.desc   Test absWheelValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessibilityValueTest_d14',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d14()).assertEqual(0)
      console.log('AccessibilityValueTest_d14 will perform dragging and checking:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d141
     * @tc.number AccessibilityValueTest_d141
     * @tc.desc   Test absWheelValue nullptr case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AccessibilityValueTest_d141',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d141()).assertEqual(0)
      console.log('AccessibilityValueTest_d141 test absWheelValue nullptr:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d15
     * @tc.number AccessibilityValueTest_d15
     * @tc.desc   Test absHat1XValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessibilityValueTest_d15',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d15()).assertEqual(0)
      console.log('AccessibilityValueTest_d15 will perform dragging and checking:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d151
     * @tc.number AccessibilityValueTest_d151
     * @tc.desc   Test absHat1XValue nullptr case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AccessibilityValueTest_d151',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d151()).assertEqual(0)
      console.log('AccessibilityValueTest_d151 test absHat1XValue nullptr:: ')
      await Utils.sleep(200)
      
      done()
    })

     /**
     * @tc.name   AccessibilityValueTest_d16
     * @tc.number AccessibilityValueTest_d16
     * @tc.desc   Test absHat1YValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessibilityValueTest_d16',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d16()).assertEqual(0)
      console.log('AccessibilityValueTest_d16 will perform dragging and checking:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d161
     * @tc.number AccessibilityValueTest_d161
     * @tc.desc   Test absHat1YValue nullptr case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AccessibilityValueTest_d161',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d161()).assertEqual(0)
      console.log('AccessibilityValueTest_d161 test absHat1YValue nullptr:: ')
      await Utils.sleep(200)
      
      done()
    })

     /**
     * @tc.name   AccessibilityValueTest_d17
     * @tc.number AccessibilityValueTest_d17
     * @tc.desc   Test absHat2XValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessibilityValueTest_d17',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d17()).assertEqual(0)
      console.log('AccessibilityValueTest_d17 will perform dragging and checking:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d171
     * @tc.number AccessibilityValueTest_d171
     * @tc.desc   Test absHat2XValue nullptr case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AccessibilityValueTest_d171',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d171()).assertEqual(0)
      console.log('AccessibilityValueTest_d171 test absHat2XValue nullptr:: ')
      await Utils.sleep(200)
      
      done()
    })

     /**
     * @tc.name   AccessibilityValueTest_d18
     * @tc.number AccessibilityValueTest_d18
     * @tc.desc   Test absHat2YValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessibilityValueTest_d18',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d18()).assertEqual(0)
      console.log('AccessibilityValueTest_d18 will perform dragging and checking:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d181
     * @tc.number AccessibilityValueTest_d181
     * @tc.desc   Test absHat2YValue nullptr case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AccessibilityValueTest_d181',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d181()).assertEqual(0)
      console.log('AccessibilityValueTest_d181 test absHat2YValue nullptr:: ')
      await Utils.sleep(200)
      
      done()
    })

     /**
     * @tc.name   AccessibilityValueTest_d19
     * @tc.number AccessibilityValueTest_d19
     * @tc.desc   Test absHat3XValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessibilityValueTest_d19',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d19()).assertEqual(0)
      console.log('AccessibilityValueTest_d19 will perform dragging and checking:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d191
     * @tc.number AccessibilityValueTest_d191
     * @tc.desc   Test absHat3XValue nullptr case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AccessibilityValueTest_d191',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d191()).assertEqual(0)
      console.log('AccessibilityValueTest_d191 test absHat3XValue nullptr:: ')
      await Utils.sleep(200)
      
      done()
    })

     /**
     * @tc.name   AccessibilityValueTest_d20
     * @tc.number AccessibilityValueTest_d20
     * @tc.desc   Test absHat3YValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AccessibilityValueTest_d20',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d20()).assertEqual(0)
      console.log('AccessibilityValueTest_d20 will perform dragging and checking:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   AccessibilityValueTest_d201
     * @tc.number AccessibilityValueTest_d201
     * @tc.desc   Test absHat3YValue nullptr case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AccessibilityValueTest_d201',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d201()).assertEqual(0)
      console.log('AccessibilityValueTest_d201 test absHat3YValue nullptr:: ')
      await Utils.sleep(200)
      
      done()
    })
  })
}
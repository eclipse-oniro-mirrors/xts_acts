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
import native from 'libnativefunc.so'
import Utils from '../common/Utils';


export default function longPressGusture(){
  describe('longPressGusture',  () =>{

    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })
    /**
     * @tc.number   SetAllowableMovement
     * @tc.name     SetAllowableMovement
     * @tc.desc     testing interface
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SetAllowableMovement',  Level.LEVEL0, async (done: Function) => {
      expect(native.SetAllowableMovement()).assertEqual(0)
      console.log('SetAllowableMovement End')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   SetAllowableMovement_Invalid
     * @tc.name     SetAllowableMovement_Invalid
     * @tc.desc     testing interface
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SetAllowableMovement_Invalid',  Level.LEVEL0, async (done: Function) => {
      expect(native.SetAllowableMovement_Invalid()).assertEqual(0)
      console.log('SetAllowableMovement_Invalid End')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   SetAllowableMovement_notSup
     * @tc.name     SetAllowableMovement_notSup
     * @tc.desc     testing interface
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SetAllowableMovement_notSup',  Level.LEVEL0, async (done: Function) => {
      expect(native.SetAllowableMovement_notSup()).assertEqual(0)
      console.log('SetAllowableMovement_notSup End')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   GetAllowableMovement_Invalid
     * @tc.name     GetAllowableMovement_Invalid
     * @tc.desc     testing interface
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('GetAllowableMovement_Invalid',  Level.LEVEL0, async (done: Function) => {
      expect(native.GetAllowableMovement_Invalid()).assertEqual(0)
      console.log('GetAllowableMovement_Invalid End')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   GetAllowableMovement
     * @tc.name     GetAllowableMovement
     * @tc.desc     testing interface
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('GetAllowableMovement',  Level.LEVEL0, async (done: Function) => {
      expect(native.GetAllowableMovement()).assertEqual(0)
      console.log('GetAllowableMovement End')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   GetAllowableMovement_SUPPORTED
     * @tc.name     GetAllowableMovement_SUPPORTED
     * @tc.desc     testing interface
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('GetAllowableMovement_SUPPORTED',  Level.LEVEL0, async (done: Function) => {
      expect(native.GetAllowableMovement_SUPPORTED()).assertEqual(0)
      console.log('GetAllowableMovement End')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   SetMeasureFromViewport
     * @tc.name     SetMeasureFromViewport
     * @tc.desc     testing interface
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SetMeasureFromViewport',  Level.LEVEL0, async (done: Function) => {
      expect(native.SetMeasureFromViewport()).assertEqual(0)
      console.log('SetMeasureFromViewport End')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   SetMeasureFromViewport_Invalid
     * @tc.name     SetMeasureFromViewport_Invalid
     * @tc.desc     testing interface
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SetMeasureFromViewport_Invalid',  Level.LEVEL0, async (done: Function) => {
      expect(native.SetMeasureFromViewport_Invalid()).assertEqual(0)
      console.log('SetMeasureFromViewport_Invalid End')
      await Utils.sleep(200)
      done()
    })

  })
}
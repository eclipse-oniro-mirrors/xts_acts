/*
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

import { expect, describe, it, afterEach,Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function customDialogTest(){

  describe('CustomDialogTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0100
    * @tc.name       : testCustomDialog001
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomDialog001', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogWidth()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0101
    * @tc.name       : testCustomDialog002
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomDialog002', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogHeight()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0102
    * @tc.name       : testCustomDialog003
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomDialog003', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogBorderWidth()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0103
    * @tc.name       : testCustomDialog004
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomDialog004', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogBorderColor()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0104
    * @tc.name       : testCustomDialog005
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomDialog005', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogBorderStyle()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0105
    * @tc.name       : testCustomDialog006
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomDialog006', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogShadow()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0106
    * @tc.name       : testCustomDialog007
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomDialog007', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogCustomShadow()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0107
    * @tc.name       : testCustomDialog008
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomDialog008', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogBackgroundBlurStyle()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0108
    * @tc.name       : testCustomDialog009
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomDialog009', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogKeyboardAvoidMode()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0109
    * @tc.name       : testCustomDialog010
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomDialog010', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogEnableHoverMode()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0110
    * @tc.name       : testCustomDialog011
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomDialog011', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testCustomDialogHoverModeArea()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0110
    * @tc.name       : testCustomDialog012
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testCustomDialog012', Level.LEVEL0 , async (done: Function) => {
      expect(nativeFunc.testCustomDialogLevelMode()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0110
    * @tc.name       : testCustomDialog013
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testCustomDialog013', Level.LEVEL0 , async (done: Function) => {
      expect(nativeFunc.testCustomDialogLevelUniqueId()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0110
    * @tc.name       : testCustomDialog014
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testCustomDialog014', Level.LEVEL0 , async (done: Function) => {
      expect(nativeFunc.testCustomDialogImmersiveMode()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0110
    * @tc.name       : testCustomDialog015
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testCustomDialog015', Level.LEVEL0 , async (done: Function) => {
      expect(nativeFunc.testCustomDialogBackgroundColor()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0110
    * @tc.name       : testCustomDialog016
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testCustomDialog016', Level.LEVEL0 , async (done: Function) => {
      expect(nativeFunc.testCustomDialogCornerRadius()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0110
    * @tc.name       : testCustomDialog018
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testCustomDialog017', Level.LEVEL0 , async (done: Function) => {
      expect(nativeFunc.testCustomModalMode()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0110
    * @tc.name       : testCustomDialog019
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testCustomDialog018', Level.LEVEL0 , async (done: Function) => {
      expect(nativeFunc.testCustomAutoCancel()).assertEqual(0)
      done()
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0110
    * @tc.name       : testCustomDialog021
    * @tc.desc       : testing CustomDialog
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testCustomDialog019', Level.LEVEL0 , async (done: Function) => {
      expect(nativeFunc.testCustomMask()).assertEqual(0)
      done()
    });
  })
}
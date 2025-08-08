/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function customDialogSetCornerRadiusTest() {

  describe('CustomDialogSetCornerRadiusTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCORNERRADIUS_0100
     * @tc.name       : testCustomDialogSetCornerRadius001
     * @tc.desc       : testing setCornerRadius for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetCornerRadius001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetCornerRadius001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCORNERRADIUS_0200
     * @tc.name       : testCustomDialogSetCornerRadius002
     * @tc.desc       : testing setCornerRadius for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetCornerRadius002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetCornerRadius002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCORNERRADIUS_0300
     * @tc.name       : testCustomDialogSetCornerRadius003
     * @tc.desc       : testing setCornerRadius for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetCornerRadius003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetCornerRadius003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCORNERRADIUS_0400
     * @tc.name       : testCustomDialogSetCornerRadius004
     * @tc.desc       : testing setCornerRadius for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetCornerRadius004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetCornerRadius004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCORNERRADIUS_0500
     * @tc.name       : testCustomDialogSetCornerRadius005
     * @tc.desc       : testing setCornerRadius for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetCornerRadius005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetCornerRadius005()).assertEqual(0)
      done()
    })

        /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMDIALOG_SETCORNERRADIUS_0600
     * @tc.name       : testCustomDialogSetCornerRadius006
     * @tc.desc       : testing setCornerRadius for customDialog with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomDialogSetCornerRadius006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetCornerRadius006()).assertEqual(0)
      done()
    })
 
  })
}

    

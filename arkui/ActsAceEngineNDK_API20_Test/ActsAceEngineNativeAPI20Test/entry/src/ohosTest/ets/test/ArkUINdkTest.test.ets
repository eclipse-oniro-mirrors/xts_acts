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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import osAccountNdk from 'libosaccountndk.so'
const OS_ACCOUNT_ERR_OK = 0;
const ARKUI_ERROR_CODE_NO_ERROR = 0
export default function ActsOsAccountNdkTest() {
  describe('ActsOsAccountNdkTest', () => {
    /**
     * @tc.number  :  SUB_ARKUI_DIALOGDISMISS_BACKPRESS_0100
     * @tc.name    : ArkUiDialogDismissBackPress001
     * @tc.desc    : testing ArkUI_DIALOG_DISMISS_BACK_PRESS
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('ArkUiDialogDismissBackPress001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DialogDismissBackPress start====')
          let result = osAccountNdk.DialogDismissBackPress();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DialogDismissBackPress catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_DIALOGDISMISSCLOSEBUTTON_0100
     * @tc.name    : ArkUiDialogDismissCloseButton001
     * @tc.desc    : testing ArkUI_DIALOG_DISMISS_CLOSE_BUTTON
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('ArkUiDialogDismissCloseButton001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DialogDismissCloseButton start====')
          let result = osAccountNdk.DialogDismissCloseButton();
          expect(2).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DialogDismissCloseButton catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_DIALOGDISMISSSLIDEDOWN_0100
     * @tc.name    : ArkUiDialogDismissSlideDown001
     * @tc.desc    : testing ArkUI_DIALOG_DISMISS_SLIDE_DOWN
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('ArkUiDialogDismissSlideDown001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DialogDismissSlideDown start====')
          let result = osAccountNdk.DialogDismissSlideDown();
          expect(3).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DialogDismissSlideDown catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_DIALOGDISMISSEVENTSETSHOUIDBLOCKDISMISS_0100
     * @tc.name    : ArkUiDialogDismissEventSetShouldBlockDismiss001
     * @tc.desc    : testing ArkUI_DIALOGDISMISSEVENT_SETSHOUIDBLOCKDISMISS
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('ArkUiDialogDismissEventSetShouldBlockDismiss001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DialogModelTest_001 start====')
          let result = osAccountNdk.DialogModelTest_001();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DialogModelTest_001 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_DIALOGDISMISSEVENTGETUSERDATA_0100
     * @tc.name    : ArkUiDialogDismissEventGetUserData001
     * @tc.desc    : testing ArkUI_DIALOGDISMISSEVENT_GETUSERDATA
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('ArkUiDialogDismissEventGetUserData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DialogModelTest_002 start====')
          let result = osAccountNdk.DialogModelTest_002();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DialogModelTest_002 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_DIALOGDISMISSEVENTGETDISMISSREASON_0100
     * @tc.name    : ArkUiDialogDismissEventGetDismissReason001
     * @tc.desc    : testing ArkUI_DIALOGDISMISSEVENT_GETDISMISSREASON
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('ArkUiDialogDismissEventGetDismissReason001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DialogDismissBackPress start====')
          let result = osAccountNdk.DialogDismissBackPress();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DialogDismissBackPress catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_DIALOGDISMISSEVENTGETDISMISSREASON_0200
     * @tc.name    : ArkUiDialogDismissEventGetDismissReason002
     * @tc.desc    : testing ArkUI_DIALOGDISMISSEVENT_GETDISMISSREASON
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('ArkUiDialogDismissEventGetDismissReason002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DialogDismissTouchOutside start====')
          let result = osAccountNdk.DialogDismissTouchOutside();
          expect(1).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DialogDismissTouchOutside catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_DIALOGDISMISSEVENTGETDISMISSREASON_0300
     * @tc.name    : ArkUiDialogDismissEventGetDismissReason003
     * @tc.desc    : testing ArkUI_DIALOGDISMISSEVENT_GETDISMISSREASON
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('ArkUiDialogDismissEventGetDismissReason003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DialogDismissCloseButton start====')
          let result = osAccountNdk.DialogDismissCloseButton();
          expect(2).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DialogDismissCloseButton catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_DIALOGDISMISSEVENTGETDISMISSREASON_0400
     * @tc.name    : ArkUiDialogDismissEventGetDismissReason004
     * @tc.desc    : testing ArkUI_DIALOGDISMISSEVENT_GETDISMISSREASON
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('ArkUiDialogDismissEventGetDismissReason004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DialogDismissSlideDown start====')
          let result = osAccountNdk.DialogDismissSlideDown();
          expect(3).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DialogDismissSlideDown catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  :  : SUB_ArkUI_NATIVEDISPLAYMANAGERROTATION_0100
     * @tc.name    :  : NativeDisplayManagerRotation001
     * @tc.desc    :  : testing ArkUI_NATIVEDISPLAYMANAGER_ROTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerRotation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>GetDefaultDisplayRotation0 start====')
          let result = osAccountNdk.GetDefaultDisplayRotation0();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>GetDefaultDisplayRotation0 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_NATIVEDISPLAYMANAGERROTATION_0200
     * @tc.name    : NativeDisplayManagerRotation002
     * @tc.desc    : testing ArkUI_NATIVEDISPLAYMANAGER_ROTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerRotation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>GetDefaultDisplayRotation1 start====')
          let result = osAccountNdk.GetDefaultDisplayRotation1();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>GetDefaultDisplayRotation1 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_NATIVEDISPLAYMANAGERROTATION_0300
     * @tc.name    : NativeDisplayManagerRotation003
     * @tc.desc    : testing ArkUI_NATIVEDISPLAYMANAGER_ROTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerRotation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>GetDefaultDisplayRotation2 start====')
          let result = osAccountNdk.GetDefaultDisplayRotation2();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>GetDefaultDisplayRotation2 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  :  SUB_ArkUI_NATIVEDISPLAYMANAGERROTATION_0400
     * @tc.name    :  NativeDisplayManagerRotation004
     * @tc.desc    :  testing ArkUI_NATIVEDISPLAYMANAGER_ROTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerRotation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>GetDefaultDisplayRotation3 start====')
          let result = osAccountNdk.GetDefaultDisplayRotation0();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>GetDefaultDisplayRotation3 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  :  SUB_ArkUI_NATIVEDISPLAYMANAGERORIENTATION_0100
     * @tc.name    :  NativeDisplayManagerOrientation001
     * @tc.desc    :  testing ArkUI_NATIVEDISPLAYMANAGERORIENTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerOrientation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DisplayManagerPortrait0 start====')
          let result = osAccountNdk.DisplayManagerPortrait0();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DisplayManagerPortrait0 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_NATIVEDISPLAYMANAGERORIENTATION_0200
     * @tc.name    : NativeDisplayManagerOrientation002
     * @tc.desc    : testing ArkUI_NATIVEDISPLAYMANAGERORIENTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerOrientation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DisplayManagerPortrait1 start====')
          let result = osAccountNdk.DisplayManagerPortrait1();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DisplayManagerPortrait1 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_NATIVEDISPLAYMANAGERORIENTATION_0300
     * @tc.name    : NativeDisplayManagerOrientation003
     * @tc.desc    : testing ArkUI_NATIVEDISPLAYMANAGERORIENTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerOrientation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DisplayManagerPortrait2 start====')
          let result = osAccountNdk.DisplayManagerPortrait2();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DisplayManagerPortrait2 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_NATIVEDISPLAYMANAGERORIENTATION_0400
     * @tc.name    : NativeDisplayManagerOrientation004
     * @tc.desc    : testing ArkUI_NATIVEDISPLAYMANAGERORIENTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerOrientation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DisplayManagerPortrait3 start====')
          let result = osAccountNdk.DisplayManagerPortrait3();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DisplayManagerPortrait3 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_NATIVEDISPLAYMANAGERORIENTATION_0500
     * @tc.name    : NativeDisplayManagerOrientation005
     * @tc.desc    : testing ArkUI_NATIVEDISPLAYMANAGERORIENTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerOrientation005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DisplayManagerPortrait4 start====')
          let result = osAccountNdk.DisplayManagerPortrait4();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DisplayManagerPortrait4 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
          done()
        }
      })

    /*
  * @tc.number     : SUB_ARKUI_SETNODEDRAGGABLE_0100
  * @tc.name       : ArkUiSetNodeDraggable001
  * @tc.desc       : test ArkUI_SETNODEDRAGGABLE
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('ArkUiSetNodeDraggable001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest01()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : SUB_ARKUI_SETNODEDRAGGABLE_0200
* @tc.name       : ArkUiSetNodeDraggable002
* @tc.desc       : test ArkUI_SETNODEDRAGGABLE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiSetNodeDraggable002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest02()
      console.error("====>DragAndDropTest02 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_SETNODEDRAGPREVIEW_0100
* @tc.name       : ArkUiSetNodeDragPreview001
* @tc.desc       :testing ArkUI_SETNODEDRAGPREVIEW
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiSetNodeDragPreview001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest101()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : SUB_ArkUI_SETNODEDRAGPREVIEW_0200
* @tc.name       : ArkUiSetNodeDragPreview002
* @tc.desc       : testing ArkUI_SETNODEDRAGPREVIEW
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiSetNodeDragPreview002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest102()
      console.error("====>DragAndDropTest102 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : testing ArkUI_DRAGPREVIEWOPTIONSETSCALEMODE_0100
* @tc.name       : ArkUiDragPreviewOptionSetScaleMode001
* @tc.desc       : testing ArkUI_DRAGPREVIEWOPTION_SETSCALEMODE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragPreviewOptionSetScaleMode001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest201()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : testing ArkUI_DRAGPREVIEWOPTIONSETSCALEMODE_0200
* @tc.name       : ArkUiDragPreviewOptionSetScaleMode002
* @tc.desc       : testing ArkUI_DRAGPREVIEWOPTION_SETSCALEMODE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragPreviewOptionSetScaleMode002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest202()
      console.error("====>DragAndDropTest202 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ARKUI_DRAGPREVIEWOPTION_SETDEFAULTSHADOWENABLED_0100
* @tc.name       : ArkUiDragPreviewOptionSetDefaultShadowEnabled001
* @tc.desc       : testing ArkUI_DRAGPREVIEWOPTION_SETDEFAULTSHADOWENABLED
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragPreviewOptionSetDefaultShadowEnabled001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest203()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : SUB_ARKUI_DRAGPREVIEWOPTION_SETDEFAULTSHADOWENABLED_0200
* @tc.name       : ArkUiDragPreviewOptionSetDefaultShadowEnabled002
* @tc.desc       : testing ArkUI_DRAGPREVIEWOPTION_SETDEFAULTSHADOWENABLED
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragPreviewOptionSetDefaultShadowEnabled002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest204()
      console.error("====>DragAndDropTest204 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ARKUI_DRAGPREVIEWOPTION_SETDEFAULTRADIUSENABLED_0100
* @tc.name       : ArkUiDragPreviewOptionSetDefaultRadiusEnabled001
* @tc.desc       : testing ArkUI_DRAGPREVIEWOPTION_SETDEFAULTRADIUSENABLED
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragPreviewOptionSetDefaultRadiusEnabled001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest205()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : SUB_ARKUI_DRAGPREVIEWOPTION_SETDEFAULTRADIUSENABLED_0200
* @tc.name       : ArkUiDragPreviewOptionSetDefaultRadiusEnabled002
* @tc.desc       : testing ArkUI_DRAGPREVIEWOPTION_SETDEFAULTRADIUSENABLED
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragPreviewOptionSetDefaultRadiusEnabled002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest206()
      console.error("====>DragAndDropTest206 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ARKUI_DRAGPREVIEWOPTIONSETNUMBERBADGENABLED0100
* @tc.name       : ArkUiDragPreviewOptionSetNumberBadgeEnabled001
* @tc.desc       : testing ArkUI_DRAGPREVIEWOPTION_SETNUMBERBADGENABLED
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragPreviewOptionSetNumberBadgeEnabled001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest207()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : SUB_ARKUI_DRAGPREVIEWOPTIONSETNUMBERBADGENABLED0200
* @tc.name       : ArkUiDragPreviewOptionSetNumberBadgeEnabled002
* @tc.desc       : testing ArkUI_DRAGPREVIEWOPTION_SETNUMBERBADGENABLED
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragPreviewOptionSetNumberBadgeEnabled002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest208()
      console.error("====>DragAndDropTest208 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DRAGPREVIEWOPTIONSETBADGENUMBER_0100
* @tc.name       : ArkUiDragPreviewOptionSetBadgeNumber001
* @tc.desc       : testing ArkUI_DRAGPREVIEWOPTION_SETBADGENUMBER
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragPreviewOptionSetBadgeNumber001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest209()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : SUB_ArkUI_DRAGPREVIEWOPTIONSETBADGENUMBER_0200
* @tc.name       : ArkUiDragPreviewOptionSetBadgeNumber002
* @tc.desc       : testing ArkUI_DRAGPREVIEWOPTION_SETBADGENUMBER
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragPreviewOptionSetBadgeNumber002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest210()
      console.error("====>DragAndDropTest210 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DRAGPREVIEWOPTIONSETDEFAULTANIMATIONBEFORELIFTINGENABLED_0100
* @tc.name       : ArkUiDragPreviewOptionSetDefaultAnimationBeforeLiftingEnabled001
* @tc.desc       : test ArkUI_DRAGPREVIEWOPTION_EnabledSETDEFAULTANIMATIONBEFORELIFTING
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragPreviewOptionSetDefaultAnimationBeforeLiftingEnabled001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest211()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : SUB_ArkUI_DRAGPREVIEWOPTIONSETDEFAULTANIMATIONBEFORELIFTINGENABLED_0200
* @tc.name       : ArkUiDragPreviewOptionSetDefaultAnimationBeforeLiftingEnabled002
* @tc.desc       : test ArkUI_DRAGPREVIEWOPTION_SETDEFAULTANIMATIONBEFORELIFTINGENABLED
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragPreviewOptionSetDefaultAnimationBeforeLiftingEnabled002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest212()
      console.error("====>DragAndDropTest212 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_SETNODEDRAGPREVIEWOPTION_0100
* @tc.name       : ArkUiSetNodeDragPreviewOption001
* @tc.desc       : test ArkUI_SETNODEDRAGPREVIEWOPTION
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiSetNodeDragPreviewOption001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest213()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : SUB_ArkUI_SETNODEDRAGPREVIEWOPTION_0200
* @tc.name       : ArkUiSetNodeDragPreviewOption002
* @tc.desc       : test ArkUI_SETNODEDRAGPREVIEWOPTION
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiSetNodeDragPreviewOption002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest214()
      console.error("====>DragAndDropTest214 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONSETPOINTERID_0100
* @tc.name       : ArkUiDragActionSetPointerId001
* @tc.desc       : test ArkUI_DRAGACTION_SETPOINTERID
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionSetPointerId001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest215()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONSETPOINTERID_0200
* @tc.name       : ArkUiDragActionSetPointerId002
* @tc.desc       : test ArkUI_DRAGACTION_SETPOINTERID
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionSetPointerId002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest216()
      console.error("====>DragAndDropTest216 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONSETPIXELMAPS_0100
* @tc.name       : ArkUiDragActionSetPixelMaps001
* @tc.desc       : test ArkUI_DRAGACTION_SETPIXELMAPS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionSetPixelMaps001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest217()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONSETPIXELMAPS_0200
* @tc.name       : ArkUiDragActionSetPixelMaps002
* @tc.desc       : test ArkUI_DRAGACTION_SETPIXELMAPS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionSetPixelMaps002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest218()
      console.error("====>DragAndDropTest218 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONSETOUCHPOINTX_0100
* @tc.name       : ArkUiDragActionSetTouchPointX001
* @tc.desc       : test ArkUI_DRAGACTION_SETOUCHPOINTX
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionSetTouchPointX001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest219()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONSETOUCHPOINTX_0200
* @tc.name       : ArkUiDragActionSetTouchPointX002
* @tc.desc       : test ArkUI_DRAGACTION_SETOUCHPOINTX
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionSetTouchPointX002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest220()
      console.error("====>DragAndDropTest220 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONSETOUCHPOINTY_0100
* @tc.name       : ArkUiDragActionSetTouchPointY001
* @tc.desc       : test ArkUI_DRAGACTION_SETOUCHPOINTY
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionSetTouchPointY001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest221()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONSETOUCHPOINTY_0200
* @tc.name       : ArkUiDragActionSetTouchPointY002
* @tc.desc       : test ArkUI_DRAGACTION_SETOUCHPOINTY
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionSetTouchPointY002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest222()
      console.error("====>DragAndDropTest222 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONSETDATA_0100
* @tc.name       : ArkUiDragActionSetData001
* @tc.desc       : test ArkUI_DRAGACTION_SETDATA
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionSetData001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest223()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })

    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONSETDATA_0200
* @tc.name       : ArkUiDragActionSetData002
* @tc.desc       : test ArkUI_DRAGACTION_SETDATA
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionSetData002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest224()
      console.error("====>DragAndDropTest224 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONSETDRAGPREVIEWOPTION_0100
* @tc.name       : ArkUiDragActionSetDragPreviewOption001
* @tc.desc       : test ArkUI_DRAGACTION_SETDRAGPREVIEWOPTION
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionSetDragPreviewOption001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest225()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONSETDRAGPREVIEWOPTION_0200
* @tc.name       : ArkUiDragActionSetDragPreviewOption002
* @tc.desc       : test ArkUI_DRAGACTION_SETDRAGPREVIEWOPTION
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionSetDragPreviewOption002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest226()
      console.error("====>DragAndDropTest226 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONREGISTERSTATUSLISTENER_0100
* @tc.name       : ArkUiDragActionRegisterStatusListener001
* @tc.desc       : test ArkUI_DRAGACTION_REGISTERSTATUSLISTENER
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionRegisterStatusListener001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest227()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DRAGACTIONREGISTERSTATUSLISTENER_0200
* @tc.name       : ArkUiDragActionRegisterStatusListener002
* @tc.desc       : test ArkUI_DRAGACTION_REGISTERSTATUSLISTENER
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragActionRegisterStatusListener002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest228()
      console.error("====>DragAndDropTest228 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_STARTDRAG_0100
* @tc.name       : ArkUiStartDrag001
* @tc.desc       : test ArkUI_STARTDRAG
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiStartDrag001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest229()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_STARTDRAG_0200
* @tc.name       : ArkUiStartDrag002
* @tc.desc       : test ArkUI_STARTDRAG
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiStartDrag002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest230()
      console.error("====>DragAndDropTest230 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_SETDRAGEVENTSTRICTREPORTWITHNODE_0100
* @tc.name       : ArkUiSetDragEventStrictReportWithNode001
* @tc.desc       : test ArkUI_SETDRAGEVENTSTRICTREPORTWITHNODE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiSetDragEventStrictReportWithNode001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest231()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_SETDRAGEVENTSTRICTREPORTWITHNODE_0200
* @tc.name       : ArkUiSetDragEventStrictReportWithNode002
* @tc.desc       : test ArkUI_SETDRAGEVENTSTRICTREPORTWITHNODE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiSetDragEventStrictReportWithNode002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest232()
      console.error("====>DragAndDropTest232 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_SETDRAGEVENTSTRICTREPORTWITHCONTEXT_0100
* @tc.name       : ArkUiSetDragEventStrictReportWithContext001
* @tc.desc       : test ArkUI_SETDRAGEVENTSTRICTREPORTWITHCONTEXT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiSetDragEventStrictReportWithContext001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest233()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_SETDRAGEVENTSTRICTREPORTWITHCONTEXT_0200
* @tc.name       : ArkUiSetDragEventStrictReportWithContext002
* @tc.desc       : test ArkUI_SETDRAGEVENTSTRICTREPORTWITHCONTEXT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiSetDragEventStrictReportWithContext002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest234()
      console.error("====>DragAndDropTest234 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_SETNODEALLOWEDDROPDATATYPES_0100
* @tc.name       : ArkUiSetNodeAllowedDropDataTypes001
* @tc.desc       : test ArkUI_SETNODEALLOWEDDROPDATATYPES
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiSetNodeAllowedDropDataTypes001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest235()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_SETNODEALLOWEDDROPDATATYPES_0200
* @tc.name       : ArkUiSetNodeAllowedDropDataTypes002
* @tc.desc       : test ArkUI_SETNODEALLOWEDDROPDATATYPES
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiSetNodeAllowedDropDataTypes002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest236()
      console.error("====>DragAndDropTest236 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DISALLOWNODEANYDROPDATATYPES_0100
* @tc.name       : ArkUiDisallowNodeAnyDropDataTypes001
* @tc.desc       : test ArkUI_DISALLOWNODEANYDROPDATATYPES
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDisallowNodeAnyDropDataTypes001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest237()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DISALLOWNODEANYDROPDATATYPES_0200
* @tc.name       : ArkUiDisallowNodeAnyDropDataTypes002
* @tc.desc       : test ArkUI_DISALLOWNODEANYDROPDATATYPES
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDisallowNodeAnyDropDataTypes002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest238()
      console.error("====>DragAndDropTest238 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_ALLOWNODEALLDROPDATATYPES_0100
* @tc.name       : ArkUiAllowNodeAllDropDataTypes001
* @tc.desc       : test ArkUI_ALLOWNODEALLDROPDATATYPES
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiAllowNodeAllDropDataTypes001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest239()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_ALLOWNODEALLDROPDATATYPES_0200
* @tc.name       : ArkUiAllowNodeAllDropDataTypes002
* @tc.desc       : test ArkUI_ALLOWNODEALLDROPDATATYPES
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiAllowNodeAllDropDataTypes002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest240()
      console.error("====>DragAndDropTest240 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_CUSTOMDIALOGSETBACKGROUNGBLURSTYLEOPTIONS_0100
* @tc.name       : ArkUiCustomDialogSetBackgroundBlurStyleOptions001
* @tc.desc       : test ArkUI_CUSTOMDIALOG_SETBACKGROUNGBLURSTYLEOPTIONS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiCustomDialogSetBackgroundBlurStyleOptions001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest241()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_CUSTOMDIALOGSETBACKGROUNGBLURSTYLEOPTIONS_0200
* @tc.name       : ArkUiCustomDialogSetBackgroundBlurStyleOptions002
* @tc.desc       : test ArkUI_CUSTOMDIALOG_SETBACKGROUNGBLURSTYLEOPTIONS
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiCustomDialogSetBackgroundBlurStyleOptions002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest242()
      console.error("====>DragAndDropTest242 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_CUSTOMDIALOGSETBACKGROUNGSETBACKGROUNGEFFECT_0100
* @tc.name       : ArkUiCustomDialogSetBackgroundEffect001
* @tc.desc       : test ArkUI_CUSTOMDIALOG_SETBACKGROUNGEFFECT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiCustomDialogSetBackgroundEffect001', Level.LEVEL1, async (done: Function) => {
      expect(osAccountNdk.DragAndDropTest243()).assertEqual(ARKUI_ERROR_CODE_NO_ERROR)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_CUSTOMDIALOGSETBACKGROUNGEFFECT_0200
* @tc.name       : ArkUiCustomDialogSetBackgroundEffect002
* @tc.desc       : test ArkUI_CUSTOMDIALOG_SETBACKGROUNGEFFECT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiCustomDialogSetBackgroundEffect002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest244()
      console.error("====>DragAndDropTest244 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_ArkUI_DRAGEVENTGETDATATYPES_0200
* @tc.name       : ArkUiDragEventGetDataTypes002
* @tc.desc       : test ArkUI_DRAGEVENT_GETDATATYPES
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('ArkUiDragEventGetDataTypes002', Level.LEVEL1, async (done: Function) => {
      let ret = osAccountNdk.DragAndDropTest245()
      console.error("====>DragAndDropTest245 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
  })
}

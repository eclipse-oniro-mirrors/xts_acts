/**
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

import PopupAJsunit from './Dialog/PopupJsunit.test.ets';
import bindPopupJsunit from './MenuTest/BindPopupJsunit.test.ets';
import bindPopupOffsetTest from './promptActionTest/bindPopupOffset.test'
import arrowOffset from './popup/arrowOffset.test';
import isVisible from './popup/isVisible.test';
import bindTips1Test from './bindTipsTest/bindTipsTest1.test';
import bindTips2Test from './bindTipsTest/bindTipsTest2.test';
import bindPopupNullUndefined from './bindTipsTest/bindPopupNullUndefined.test';
import openPopupNullUndefinedTest from './popupNullUndefined/openPopup.test';
import bindMenuNullUndefined from './MenuTest/bindMenuNullUndefined.test';
import bindContextMenuNull from './MenuTest/bindContextMenuNull.test';
import bindContextResponseNull from './MenuTest/bindContextResponseNull.test';
import isShownContextMenuNull from './MenuTest/isShownContextMenuNull.test';
import bindContentCoverNullUndefined from './MenuTest/bindContentCoverNullUndefined.test';
import showActionMenuNullAndUndefinedTest from './PromptActionNullAndUndefined/showActionMenuNullAndUndefinedTest.test';
import showActionMenuCallbackNullAndUndefinedTest from './PromptActionNullAndUndefined/showActionMenuCallbackNullAndUndefinedTest.test';
import showActionMenuAsyncCallbackNullAndUndefinedTest from './PromptActionNullAndUndefined/showActionMenuAsyncCallbackNullAndUndefinedTest.test';
import openCustomDialogNullAndUndefinedTest from './PromptActionNullAndUndefined/openCustomDialogNullAndUndefinedTest.test';
import openCustomDialogWithControllerNullAndUndefinedTest from './PromptActionNullAndUndefined/openCustomDialogWithControllerNullAndUndefinedTest.test';
import updateCustomDialogNullAndUndefinedTest from './PromptActionNullAndUndefined/updateCustomDialogNullAndUndefinedTest.test';
import closeCustomDialogByContentNullAndUndefinedTest from './PromptActionNullAndUndefined/closeCustomDialogByContentNullAndUndefinedTest.test';
import closeCustomDialogByIdNullAndUndefinedTest from './PromptActionNullAndUndefined/closeCustomDialogByIdNullAndUndefinedTest.test';
import presentCustomDialogNullAndUndefinedTest from './PromptActionNullAndUndefined/presentCustomDialogNullAndUndefinedTest.test';
import updatePopupNullAndUndefinedTest from './PromptActionNullAndUndefined/updatePopupNullAndUndefinedTest.test';
import closePopupNullAndUndefinedTest from './PromptActionNullAndUndefined/closePopupNullAndUndefinedTest.test';
import ImmersiveStyleTest from './uimaterial/ImmersiveStyleTest.test';
import ImmersiveOptionsMaterialColorTest from './uimaterial/ImmersiveOptionsMaterialColor.test';
import ImmersiveOptionsColorInvertTest from './uimaterial/ImmersiveOptionsColorInvert.test';
import ImmersiveOptionsApplyShadowTest from './uimaterial/ImmersiveOptionsApplyShadow.test';
import UIMaterialTest from './uimaterial/UIMaterial.test';
import CustomPopupOptionsSystemMaterial from './popupSystemMaterial/CustomPopupOptionsSystemMaterial.test';
import SheetOptionsSystemMaterial from './popupSystemMaterial/SheetOptionsSystemMaterial.test';
import PopupCommonOptionsSystemMaterial from './popupSystemMaterial/PopupCommonOptionsSystemMaterial.test';
import PopupOptionsSystemMaterial from './popupSystemMaterial/PopupOptionsSystemMaterial.test';
import TipsOptionsSystemMaterial from './popupSystemMaterial/TipsOptionsSystemMaterial.test';

export default function testsuite() {
  showActionMenuNullAndUndefinedTest();
  showActionMenuCallbackNullAndUndefinedTest();
  showActionMenuAsyncCallbackNullAndUndefinedTest();
  openCustomDialogNullAndUndefinedTest();
  updateCustomDialogNullAndUndefinedTest();
  closeCustomDialogByContentNullAndUndefinedTest();
  closeCustomDialogByIdNullAndUndefinedTest();
  updatePopupNullAndUndefinedTest();
  closePopupNullAndUndefinedTest();
  PopupAJsunit();
  bindPopupJsunit();
  bindPopupOffsetTest();
  arrowOffset();
  isVisible();
  bindTips1Test();
  bindTips2Test();
  bindPopupNullUndefined();
  openPopupNullUndefinedTest();
  bindMenuNullUndefined();
  bindContextMenuNull();
  bindContextResponseNull();
  isShownContextMenuNull();
  bindContentCoverNullUndefined();
  ImmersiveStyleTest();
  ImmersiveOptionsMaterialColorTest();
  ImmersiveOptionsColorInvertTest();
  ImmersiveOptionsApplyShadowTest();
  UIMaterialTest();
  SheetOptionsSystemMaterial();
  PopupCommonOptionsSystemMaterial();
  PopupOptionsSystemMaterial();
  CustomPopupOptionsSystemMaterial();
  // TipsOptionsSystemMaterial();
}
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
import alertDialogBackgroundEffectTest from './alertDialogTest/alertDialogBackgroundEffect.test'
import alertDialogBlurStyleOptionsTest from './alertDialogTest/alertDialogBlurStyleOptions.test'
import buttonType from './buttonType/buttonTypeApi.test';
import customDialogBackgroundEffectTest from './customDialogTest/customDialogBackgroundEffect.test'
import customDialogBlurStyleOptionsTest from './customDialogTest/customDialogBlurStyleOptions.test'
import openCustomDialogBackgroundEffectTest from './promptActionTest/openCustomDialogBackgroundEffect.test'
import openCustomDialogBlurStyleOptionsTest from './promptActionTest/openCustomDialogBlurStyleOptions.test'
import overlayManagerTest from './overlayManager/overlayManagerTest.test'
import customDialogLevelOrder from './dialog/customDialogLevelOrder.test'
import showAlertDialogBackgroundEffectTest from './UIContextTest/showAlertDialogBackgroundEffect.test'
import showAlertDialogBlurStyleOptionsTest from './UIContextTest/showAlertDialogBlurStyleOptions.test'
import showDialogBackgroundEffectTest from './promptActionTest/showDialogBackgroundEffect1.test'
import showDialogBlurStyleOptionsTest from './promptActionTest/showDialogBlurStyleOptions1.test'
import showDialogCallbackBackgroundEffectTest from './promptActionTest/showDialogBackgroundEffect2.test'
import showDialogCallbackBlurStyleOptionsTest from './promptActionTest/showDialogBlurStyleOptions2.test'
import closeToastTest from './promptActionTest/closeToastTest.test'
import closeDialogTest from './dialog/closeDialogTest.test'
import showDialogLevelOrder from './dialog/showDialogLevelOrder.test'
import openCustomDialogLevelOrder from './dialog/openCustomDialogLevelOrder.test'
import openCustomDialogWithConOrder from './dialog/openCustomDialogWithConOrder.test'
import presentCustomDialogOrder from './dialog/presentCustomDialogOrder.test'
import alertDialogLevelOrder from './dialog/alertDialogLevelOrder.test'
import UIOpenCustomDialogBackgroundEffectTest from './UIContextTest/openCustomDialogBackgroundEffect.test'
import UIOpenCustomDialogBlurStyleOptionsTest from './UIContextTest/openCustomDialogBlurStyleOptions.test'
import UIPresentCustomDialogBackgroundEffectTest from './UIContextTest/presentCustomDialogBackgroundEffect.test'
import UIPresentCustomDialogBlurStyleOptionsTest from './UIContextTest/presentCustomDialogBlurStyleOptions.test'
import UIShowDialogBackgroundEffectTest from './UIContextTest/showDialogBackgroundEffect1.test'
import UIShowDialogBlurStyleOptionsTest from './UIContextTest/showDialogBlurStyleOptions1.test'
import UIShowDialogCallbackBackgroundEffectTest from './UIContextTest/showDialogBackgroundEffect2.test'
import UIShowDialogCallbackBlurStyleOptionsTest from './UIContextTest/showDialogBlurStyleOptions2.test'
import bindMenuHapticFeedbackMode from './bindMenuTest/bindMenuHapticFeedbackMode.test';
import bindTips1Test from './bindTipsTest/bindTipsTest1.test';
import bindTips2Test from './bindTipsTest/bindTipsTest2.test';
import bindContextMenuHapticFeedbackMode from './bindContextMenuTest/bindContextMenuHapticFeedback.test'
import previewBorderRadius from './bindContextMenuTest/previewBorderRadius.test'
import isVisible from './popup/isVisible.test';
import getDialogControllerTest from './dialog/getDialogControllerTest.test';
import DialogOptions from './promptActionTest/DialogOptions.test';

export default function testsuite() {
    isVisible()
    getDialogControllerTest()
    DialogOptions()
    alertDialogBackgroundEffectTest()
    alertDialogBlurStyleOptionsTest()
    buttonType()
    customDialogBackgroundEffectTest()
    customDialogBlurStyleOptionsTest()
    openCustomDialogBackgroundEffectTest()
    openCustomDialogBlurStyleOptionsTest()
    overlayManagerTest()
    customDialogLevelOrder()
    showAlertDialogBackgroundEffectTest()
    showAlertDialogBlurStyleOptionsTest()
    showDialogBackgroundEffectTest()
    showDialogBlurStyleOptionsTest()
    showDialogCallbackBackgroundEffectTest()
    showDialogCallbackBlurStyleOptionsTest()
    closeToastTest()
    closeDialogTest()
    showDialogLevelOrder()
    openCustomDialogLevelOrder()
    openCustomDialogWithConOrder()
    presentCustomDialogOrder()
    alertDialogLevelOrder()
    UIOpenCustomDialogBackgroundEffectTest()
    UIOpenCustomDialogBlurStyleOptionsTest()
    UIPresentCustomDialogBackgroundEffectTest()
    UIPresentCustomDialogBlurStyleOptionsTest()
    UIShowDialogBackgroundEffectTest()
    UIShowDialogBlurStyleOptionsTest()
    UIShowDialogCallbackBackgroundEffectTest()
    UIShowDialogCallbackBlurStyleOptionsTest()
    bindMenuHapticFeedbackMode()
    bindTips1Test()
    bindTips2Test()
    bindContextMenuHapticFeedbackMode()
    previewBorderRadius()
}
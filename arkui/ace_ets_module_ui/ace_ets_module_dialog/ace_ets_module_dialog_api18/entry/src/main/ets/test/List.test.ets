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
import buttonType from './buttonType/buttonTypeApi.test';
import overlayManagerTest from './overlayManager/overlayManagerTest.test'
import customDialogLevelOrder from './dialog/customDialogLevelOrder.test'
import closeToastTest from './promptActionTest/closeToastTest.test'
import closeDialogTest from './dialog/closeDialogTest.test'
import showDialogLevelOrder from './dialog/showDialogLevelOrder.test'
import openCustomDialogLevelOrder from './dialog/openCustomDialogLevelOrder.test'
import openCustomDialogWithConOrder from './dialog/openCustomDialogWithConOrder.test'
import presentCustomDialogOrder from './dialog/presentCustomDialogOrder.test'
import alertDialogLevelOrder from './dialog/alertDialogLevelOrder.test'
import bindMenuHapticFeedbackMode from './bindMenuTest/bindMenuHapticFeedbackMode.test';
import bindTips1Test from './bindTipsTest/bindTipsTest1.test';
import bindTips2Test from './bindTipsTest/bindTipsTest2.test';
import bindContextMenuHapticFeedbackMode from './bindContextMenuTest/bindContextMenuHapticFeedback.test'
import previewBorderRadius from './bindContextMenuTest/previewBorderRadius.test'
import isVisible from './popup/isVisible.test';
import getDialogControllerTest from './dialog/getDialogControllerTest.test';
import DialogOptions from './promptActionTest/DialogOptions.test';
import buttonMinFontScaleTest from './buttonType/minFontScale.test'
import buttonMaxFontScaleTest from './buttonType/maxFontScale.test'
import ToastExample from './promptActionTest/ToastExample.test'
import openToastTest from './promptActionTest/openToastTest.test'
import PromptActionToastErrorCodeTest from './promptActionTest/PromptActionToastErrorCodeTest'
import getDialogControllerReturnTest from './dialog/getDialogControllerReturnTest';

export default function testsuite() {
    isVisible()
    getDialogControllerTest()
    DialogOptions()
    buttonType()
    overlayManagerTest()
    customDialogLevelOrder()
    closeToastTest()
    closeDialogTest()
    showDialogLevelOrder()
    openCustomDialogLevelOrder()
    openCustomDialogWithConOrder()
    presentCustomDialogOrder()
    alertDialogLevelOrder()
    bindMenuHapticFeedbackMode()
    bindTips1Test()
    bindTips2Test()
    bindContextMenuHapticFeedbackMode()
    previewBorderRadius()
    buttonMinFontScaleTest()
    buttonMaxFontScaleTest()
    ToastExample()
    openToastTest()
    PromptActionToastErrorCodeTest()
    getDialogControllerReturnTest()
}
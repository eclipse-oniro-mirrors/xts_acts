'use static';
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
import maxWidth from './PopupTest/Maxwidth.test'
import openPopup from './promptActionTest/openPopup.test'
import updatePopup from './promptActionTest/updatePopup.test'
import closePopup from './promptActionTest/closePopup.test'
import subwindowDialog from './promptActionTest/subwindowDialog.test'
import menuitemOnChangeModifierTest from './MenuTest/menuitemOnChangeModifierTest.test'
import menuFontsizeModifierTest from './MenuTest/menuFontsizeModifierTest.test'
import menuBindMenuModifierTest from './MenuTest/menuBindMenuModifierTest.test'
import blurStyleOptions from './MenuTest/blurStyleOptions.test'
import effectOptions from './MenuTest/effectOptions.test'
import openDialogTransitionTest from './promptActionTest/openDialogTransition.test'
import ActionSheetLifeTest from './dialogLifeTest/ActionSheetLife.test'
import AlertDialogLifeTest from './dialogLifeTest/AlertDialogLife.test'
import CustomDialogLifeTest from './dialogLifeTest/CustomDialogLife.test'
import showInSubWindowBindSheet from './bindSheet/showInSubWindowBindSheet.test'
import showToastOptions from './promptActionTest/showToastOptions.test'
export default function testsuite() {
    blurStyleOptions();
    effectOptions();
    openPopup();
    updatePopup();
    closePopup();
    subwindowDialog();
    menuitemOnChangeModifierTest();
    menuFontsizeModifierTest();
    openDialogTransitionTest();
    ActionSheetLifeTest();
    AlertDialogLifeTest();
    CustomDialogLifeTest();
    showInSubWindowBindSheet()
    menuBindMenuModifierTest();
    showToastOptions()
    maxWidth();
}
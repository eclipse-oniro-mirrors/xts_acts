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
 
import primary from './AlertDialogTest/primary.test';
import PopupOptionsTest from './PopupTest/PopupApiTest/PopupApiTest.test';
import DismissReasonTest from './PopupTest/DismissReason.test';
import popupKeyboardAvoidMode from './popup/popupKeyboardAvoidMode.test'
import showActionSheetOrder from './dialog/showActionSheetOrder.test'
import MaxwidthTest from './PopupTest/Maxwidth.test'
import showActionSheetBackgroundEffectTest from './UIContextTest/showActionSheetBackgroundEffect.test'
import showActionSheetBlurStyleOptionsTest from './UIContextTest/showActionSheetBlurStyleOptions.test'
import actionSheetBackgroundEffectTest from './actionSheetTest/actionSheetBackgroundEffect.test'
import actionSheetBlurStyleOptionsTest from './actionSheetTest/actionSheetBlurStyleOptions.test'
import openMenuAnchorPositionTest from './promptActionTest/openMenuAnchorPosition.test'
import updateMenuAnchorPositionTest from './promptActionTest/updateMenuAnchorPosition.test'
import subwindowDialog from './promptActionTest/subwindowDialog.test'
import showAtAnchorTest from './hoverTipsTest/showAtAnchor.test';
import showDefaultSelectedIconTest from './selectTest/showDefaultSelectedIcon.test';
import showInSubWindowValueTest from './selectTest/showInSubWindow.test';
import SelectJsunit from './selectTest/SelectJsunit.test';
import SelectJsunit01 from './selectTest/SelectJsunit01.test';
import SelectJsunit02 from './selectTest/SelectJsunit02.test';

import SelectAttr from './selectTest/SelectAttr.test'
import selectoptionwithJsSuit from './selectTest/selectoptionwithJsSuit.test';
import SelectTest from './selectTest/Select.test';
import SelectJsunit1 from './selectTest/SelectJsunit1.test';
import menuBackgroundBlurStyle from './selectTest/menuBackgroundBlurStyle.test'
import menuBackgroundColor from './selectTest/menuBackgroundColor.test'
import selectNodeTest from './select/selectNode.test';
import SliderEnableHapticFeedbackTest from './slider/SliderEnableHapticFeedbackTest.test'
import ActsgetcomponentaddTest from './buttonTest/getcomponentadd.test';

import selectApi1 from './select/selectApi1.test'
import selectApiTest1 from './selectTest/selectApi1.test'
import triggerSelect from './select/triggerSelect.test'
import triggerSelectTest from './selectTest/triggerSelect.test'
import selectJsunit2 from './select/SelectJsunit.test'

export default function testsuite() {
	SelectJsunit01();
    selectApi1();
    triggerSelect();
    selectJsunit2();
    primary();
	PopupOptionsTest();
	DismissReasonTest();
	popupKeyboardAvoidMode();
    showActionSheetOrder();
    MaxwidthTest();
    showActionSheetBackgroundEffectTest();
    showActionSheetBlurStyleOptionsTest();
    actionSheetBackgroundEffectTest();
    actionSheetBlurStyleOptionsTest();
    openMenuAnchorPositionTest();
    updateMenuAnchorPositionTest(); 
    subwindowDialog();
    showAtAnchorTest();
    showDefaultSelectedIconTest();
    showInSubWindowValueTest();
    SelectJsunit();
	SelectJsunit02();
	SelectAttr();
	selectoptionwithJsSuit();
	SelectTest();;
	SelectJsunit1();
	menuBackgroundBlurStyle();
	menuBackgroundColor();
	selectApiTest1();
	triggerSelectTest();
    selectNodeTest();
	SliderEnableHapticFeedbackTest();
	ActsgetcomponentaddTest();
}
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

import keyDispatchTest from "./keydispatchTest/KeyDispatchTest.test"
import ProgressLinearStyleTest from "./progress/progressLinearStyleTest.test"
import checkboxGroupTest from "./checkbox/CheckboxGroupTest.test"
import checkboxGroupGroupTest from "./checkboxgroup/CheckboxGroupGroupTest.test"
import checkboxGroupSelectAllTest from "./checkboxgroup/CheckboxGroupSelectAllTest.test"

import FocusControlTest from "./foucscontrolTest/FocusControlTest.test"
import FocusControlTest2 from "./foucscontrolTest/FocusControlTest2.test"
import FocusControlTest3 from "./foucscontrolTest/FocusControlTest3.test"
import FocusControlTest4 from "./foucscontrolTest/FocusControlTest4.test"
import listCaseTest from "./list/ListCaseTest.test"
import listScrollToIndexTest from "./listScrollTo/ListScrollToTest.test"
import listItemGroupNodeAdapterTest from "./listItemGroup/ListItemGroupTest.test"
import textImmutablfFontWeight from "./text/textImmutablfFontWeight.test"
import TextAreaLetterSpacing from "./textArea/TextAreaLetterSpacing.test"
import TextInputLetterSpacing from "./textInput/TextInputLetterSpacing.test"

import columnBackDropBlurTest from "./visual/columnBackDropBlurTest.test"
import nodeHandleByIdTest from "./node/NodeHandleByIdTest.test"
import getWindowInfoTest from "./window/GetWindowInfoTest.test"
import testLazyForEachExpandMode from "./lazyForEach/testLazyForEachExpandMode.test"
import gesturecancelTest from "./gesturecancelTest/gesturecancelTest.test"
import snapShotTest from './snapShot/snapShotTest.test'
import scrollBackToTopTest from './scroll/ScrollBackToTopTest.test'
import gestureRecognizerTest from './gestureRecognizer/GestureRecognizerTest.test'
import EventInfoTest from "./eventInfo/EventInfoTest.test"


export default function testsuite() {
   ProgressLinearStyleTest();
   keyDispatchTest();
   FocusControlTest();
   FocusControlTest2();
   FocusControlTest3();
   FocusControlTest4();
   checkboxGroupTest();
   checkboxGroupGroupTest();
   checkboxGroupSelectAllTest();
   listCaseTest();
   listScrollToIndexTest();
   listItemGroupNodeAdapterTest();
   textImmutablfFontWeight();
   TextAreaLetterSpacing();
   TextInputLetterSpacing();
   columnBackDropBlurTest();
   nodeHandleByIdTest();
   getWindowInfoTest();
   testLazyForEachExpandMode();
   gesturecancelTest();
   snapShotTest();
   scrollBackToTopTest();
   gestureRecognizerTest();
   EventInfoTest();
}

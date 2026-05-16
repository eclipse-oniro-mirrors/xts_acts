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


import nodeHandleByIdTest from "./node/NodeHandleByIdTest.test"
import getWindowInfoTest from "./window/GetWindowInfoTest.test"
import checkboxGroupTest from "./checkbox/CheckboxGroupTest.test"
import checkboxGroupGroupTest from "./checkboxgroup/CheckboxGroupGroupTest.test"
import checkboxGroupSelectAllTest from "./checkboxgroup/CheckboxGroupSelectAllTest.test"
import columnBackDropBlurTest from "./visual/columnBackDropBlurTest.test"
import ProgressLinearStyleTest from "./progress/progressLinearStyleTest.test"
import testLazyForEachExpandMode from "./lazyForEach/testLazyForEachExpandMode.test"
import FocusControlTest from "./foucscontrolTest/FocusControlTest.test"
import FocusControlTest2 from "./foucscontrolTest/FocusControlTest2.test"
import listCaseTest from "./list/ListCaseTest.test"
import listScrollToIndexTest from "./listScrollTo/ListScrollToTest.test"
import listItemGroupNodeAdapterTest from "./listItemGroup/ListItemGroupTest.test"
import gesturecancelTest from "./gesturecancelTest/gesturecancelTest.test"
import gestureRecognizerTest from './gestureRecognizer/GestureRecognizerTest.test'
import EventInfoTest from "./eventInfo/EventInfoTest.test"
import snapShotTest from './snapShot/snapShotTest.test'
import ProgressLinearStyleOptionTest from "./progress/ProgressLinearStyleOption.test"
import SwiperChangeIndexTest from "./swiper/SwiperChangeIndex.test"

export default function testsuite() {

   
   nodeHandleByIdTest();
   getWindowInfoTest();
   checkboxGroupTest();
   checkboxGroupGroupTest();
   checkboxGroupSelectAllTest();
   columnBackDropBlurTest();
   ProgressLinearStyleTest();
   testLazyForEachExpandMode();
   FocusControlTest();
   FocusControlTest2();
   listCaseTest();
   listScrollToIndexTest();
   listItemGroupNodeAdapterTest();
   gesturecancelTest();
   gestureRecognizerTest();
   EventInfoTest();
   snapShotTest();
   ProgressLinearStyleOptionTest();
   SwiperChangeIndexTest();
}

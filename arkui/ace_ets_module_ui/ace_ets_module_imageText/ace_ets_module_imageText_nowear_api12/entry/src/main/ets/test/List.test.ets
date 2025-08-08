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
import textAreaInputTest from './TextArea/textAreaInputTest.test';
import RichEditorApi5 from './RichEditor/RichEditorApi5.test'
import searchTest from './Search/searchTest.test'
import styledStringChange from './Text/styledStringChange.test'
import onSelectionChange1 from './RichEditorTest/onSelectionChange1.test'
import onSelectionChange4 from './RichEditorTest/onSelectionChange4.test'
import onSelectionChange5 from './RichEditorTest/onSelectionChange5.test'
import onSelectionChange6 from './RichEditorTest/onSelectionChange6.test'
import onSelectionChange7 from './RichEditorTest/onSelectionChange7.test'
import onSelectionChange8 from './RichEditorTest/onSelectionChange8.test'
import onSelectionChange10 from './RichEditorTest/onSelectionChange10.test'
import onSelectionChange15 from './RichEditorTest/onSelectionChange15.test'
import onSelectionChange18 from './RichEditorTest/onSelectionChange18.test'
import onSelectionChange19 from './RichEditorTest/onSelectionChange19.test'
import RichEditorMenuPolicyJsunit from './RichEditorEnhance01/RichEditorMenuPolicyJsunit.test'
import RichEditor1 from './RichEditorEnhance/RichEditor1.test'
import RichEditor3 from './RichEditorEnhance/RichEditor3.test'
import RichEditor4 from './RichEditorEnhance/RichEditor4.test'
import RichEditor5 from './RichEditorEnhance/RichEditor5.test'
import RichEditor6 from './RichEditorEnhance/RichEditor6.test'
import RichEditor7 from './RichEditorEnhance/RichEditor7.test'
import RichEditor11 from './RichEditorEnhance/RichEditor11.test'
import onDidIMEInputTest from './RichEditor/onDidIMEInput.test';
import editMeunOptionsTest from './Text/editMeunOptions.test'
import RichEditorApi1 from './RichEditor/RichEditorApi1.test'
import TextDeleteDirectionTest from "./TextArea/TextDeleteDirectionTest.test";

export default function testsuite() {
  textAreaInputTest();
  RichEditorApi5();
  searchTest();
  styledStringChange();
  onSelectionChange1();
  onSelectionChange4();
  onSelectionChange5();
  onSelectionChange6();
  onSelectionChange7();
  onSelectionChange8();
  onSelectionChange10();
  onSelectionChange15();
  onSelectionChange18();
  onSelectionChange19();
  RichEditorMenuPolicyJsunit();
  RichEditor1();
  RichEditor3();
  RichEditor4();
  RichEditor5();
  RichEditor6();
  RichEditor7();
  RichEditor11();
  onDidIMEInputTest();
  editMeunOptionsTest();
  RichEditorApi1();
  TextDeleteDirectionTest();
}
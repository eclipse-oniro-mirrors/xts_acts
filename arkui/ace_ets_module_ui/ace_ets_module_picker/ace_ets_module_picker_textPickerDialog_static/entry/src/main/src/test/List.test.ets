'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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


import textPickerDialogAppearTextTest from './textPickerDialogTest/TextPickerDialogCallBack.test'
import textPickerOnChange from './textPickerDialogTest/TextPickerOnChange.test'
import textPickerOnScrollStop from './textPickerDialogTest/TextPickerOnScrollStop.test'
import textPickerOnEnterSelectedArea from './textPickerDialogTest/TextPickerOnEnterSelectedArea.test'
import textPickerOnAccept from './textPickerDialogTest/TextPickerOnAccept.test'
import textPickerOnCancel from './textPickerDialogTest/TextPickerOnCancel.test'
export default function testsuite() {
  textPickerDialogAppearTextTest();
  textPickerOnChange();
  textPickerOnScrollStop();
  textPickerOnEnterSelectedArea();
  textPickerOnAccept();
  textPickerOnCancel();
}
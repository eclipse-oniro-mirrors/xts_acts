/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import Stack_Text from './Stack/Stack_Text/Stack_Text.test';
import richEditorApi1 from './richEditor/richEditorApi/richEditorApi1.test';
import richEditorApi2 from './richEditor/richEditorApi/richEditorApi2.test';
import richEditorApi3 from './richEditor/richEditorApi/richEditorApi3.test';
import richEditorApi4 from './richEditor/richEditorApi/richEditorApi4.test';
import richEditorApi5 from './richEditor/richEditorApi/richEditorApi5.test';

export default function testsuite() {
  richEditorApi1();
  richEditorApi2();
  richEditorApi3();
  richEditorApi4();
  richEditorApi5();
  Stack_Text();
}
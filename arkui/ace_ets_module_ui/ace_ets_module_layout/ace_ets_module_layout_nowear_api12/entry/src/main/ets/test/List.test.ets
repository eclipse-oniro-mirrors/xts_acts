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
import ChipApi1 from './Chip/ChipApi1.test'
import ChipGroupApi1 from './ChipGroup/ChipGroupApi1.test'
import FolderStackTest1 from './FolderStack/FolderStackTest1.test.ets';
import FolderStackTest2 from './FolderStack/FolderStackTest2.test.ets';

export default function testsuite() {
  ChipApi1();
  FolderStackTest1();
  FolderStackTest2();
}
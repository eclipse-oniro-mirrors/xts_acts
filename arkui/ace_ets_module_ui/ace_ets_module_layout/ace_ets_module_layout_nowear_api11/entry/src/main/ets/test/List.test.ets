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
import FolderStack3ApiJsunit from './FolderStackTest/FolderStack3ApiJsunit.test';
import enumFolderTest from "./FolderStackTest/enumflodstack.test"
import columnSplitJsunit from './ColumnTest/ColumnSplitJsunit.test';
import rowSplitJsunit from './RowTest/RowSplitJsunit.test';
import waterFlowDemoJsunit from './waterflow/waterFlowDemo.test';
import ColumnSplitJsunit from './Column/ColumnSplitJsunit.test.ets';


export default function testsuite() {
  FolderStack3ApiJsunit()
  enumFolderTest()
  columnSplitJsunit()
  rowSplitJsunit()
  waterFlowDemoJsunit();
  ColumnSplitJsunit();
}
/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import toolBarV2PageTest from './toolBarV2/toolBarV2Page.test';
import toolBarV2ItemStateTest from './toolBarV2/toolBarV2ItemState.test';
import toolBarV2AccessibilityTest from './toolBarV2/ToolBarV2AccessibilityPage.test';

export default function testsuite() {
  toolBarV2PageTest();
  toolBarV2ItemStateTest();
  toolBarV2AccessibilityTest();
}
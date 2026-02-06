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

import composeListItemPageTest from './composeListItem/composeListItemPageTest.test';
import composeListItemOperateItemSymbolStyle from './composeListItem/composeListItemOperateItemSymbolStyle.test';
import toolBarAccessibilityTest from './toolBar/toolBarAccessibilityPage.test';
import progressButtonPageTest from './progressButton/progressButtonPage.test';
import progressButtonV2PageTest from './progressButtonV2/progressButtonV2Page.test';
import subHeaderV2PageTest from './subHeaderV2/subHeaderV2Page.test';
import subHeaderV2AccessibilityPageTest from './subHeaderV2/subHeaderV2AccessibilityPage.test';
import toolBarV2PageTest from './toolBarV2/toolBarV2Page.test';
import toolBarV2ItemStateTest from './toolBarV2/toolBarV2ItemState.test';
import editableTitleBarAccessibilityTest from './editableTitleBar/editableTitleBarAccessibilityPage.test';
import editableTitleBarSymbolTest from './editableTitleBar/editableTitleBarSymbolPage.test';
import subHeaderAccessibilityTest from './subHeader/subHeaderAccessibilityPage.test';
import composeTitleBarSymbolTest from './composeTitleBar/composeTitleBarSymbolPage.test';
import composeTitleBarAccessibilityTest from './composeTitleBar/composeTitleBarAccessibilityPage.test';
import selectTitleBarSymbolTest from './selectTitleBar/selectTitleBarSymbolPage.test';
import selectTitleBarAccessibilityTest from './selectTitleBar/selectTitleBarAccessibilityPage.test';
import tabTitleBarSymbolTest from './tabTitleBar/tabTitleBarSymbolPage.test';
import tabTitleBarAccessibilityTest from './tabTitleBar/tabTitleBarAccessibilityPage.test';
import toolBarV2AccessibilityTest from './toolBarV2/ToolBarV2AccessibilityPage.test';
import tipsDialogTest from './dialogV2/tipsDialogTest.test';
import selectDialogTest from './dialogV2/selectDialogTest.test';
import confirmDialogTest from './dialogV2/confirmDialogTest.test';
import composeListItemAccessibilityPageTest from './composeListItem/composeListItemAccessibilityPage.test';
import exceptionPromptSymbolStyleTest from './exceptionPrompt/exceptionPromptSymbolStyle.test';
import alertDialogTest from  './dialogV2/alertDialogTest.test';
import loadingDialogTest from './dialogV2/loadingDialogTest.test';
import popoverDialogTest from './dialogV2/popoverDialogTest.test';
import customContentDialogTest from './dialogV2/customContentDialogTest.test';

export default function testsuite() {
  composeListItemPageTest();
  composeListItemOperateItemSymbolStyle();
  toolBarAccessibilityTest();
  progressButtonPageTest();
  progressButtonV2PageTest();
  subHeaderV2PageTest();
  subHeaderV2AccessibilityPageTest();
  toolBarV2PageTest();
  toolBarV2ItemStateTest();
  editableTitleBarAccessibilityTest();
  editableTitleBarSymbolTest();
  subHeaderAccessibilityTest();
  composeTitleBarAccessibilityTest();
  composeTitleBarSymbolTest();
  selectTitleBarAccessibilityTest();
  selectTitleBarSymbolTest();
  tabTitleBarAccessibilityTest();
  tabTitleBarSymbolTest();
  toolBarV2AccessibilityTest();
  tipsDialogTest();
  selectDialogTest();
  confirmDialogTest();
  composeListItemAccessibilityPageTest();
  exceptionPromptSymbolStyleTest();
  alertDialogTest();
  loadingDialogTest();
  popoverDialogTest();
  customContentDialogTest();
}
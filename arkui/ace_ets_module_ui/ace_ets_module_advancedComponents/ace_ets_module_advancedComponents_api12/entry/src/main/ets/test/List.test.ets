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

import composeListItemIconType from './composeListItem/composeListItemIconType.test.ets';
import composeListItemOperateItemArrow from './composeListItem/composeListItemOperateItemArrow.test.ets';
import composeListItemOperateItemButton from './composeListItem/composeListItemOperateItemButton.test.ets';
import composeListItemOperateItemCheckbox from './composeListItem/composeListItemOperateItemCheckbox.test.ets';
import composeListItemOperateItemImage from './composeListItem/composeListItemOperateItemImage.test.ets';
import composeListItemOperateItemRadio from './composeListItem/composeListItemOperateItemRadio.test.ets';
import composeListItemOperateItemSubIcon from './composeListItem/composeListItemOperateItemSubIcon.test.ets';
import composeListItemOperateItemSwitch from './composeListItem/composeListItemOperateItemSwitch.test.ets';
import composeListItemPageTest from './composeListItem/composeListItemPageTest.test.ets';
import exceptionPromptTest from './exceptionPrompt/exceptionPromptTest.test.ets';
import exceptionPromptTestTwo from './exceptionPrompt/exceptionPromptTestTwo.test.ets';
import filterTest from './filter/filterTest.test.ets';
import filterTestTwo from './filter/filterTestTwo.test.ets';
import gridObjectSortComponentTest from './gridObjectSortComponent/gridObjectSortComponentTest.test.ets';
import progressButtonTest from './progressButton/progressButtonTest.test.ets';
import selectTitleBarTest from './selectTitleBar/selectTitleBarTest.test.ets';
import swipeRefresherPageTest from './swipeRefresher/swipeRefresherPageTest.test.ets';
import tabTitleBarPageTest from './tabTitleBar/tabTitleBarPageTest.test.ets';
import toolBarItemState from './toolBar/toolBarItemState.test.ets';
import toolBarPageTest from './toolBar/toolBarPageTest.test.ets';
import treeViewNodeParamContainer from './treeView/treeViewNodeParamContainer.test.ets';
import alertDialogTest from './dialog/alertDialogTest.test.ets';
import confirmDialogTest from './dialog/confirmDialogTest.test.ets';
import customContentDialogTest from './dialog/customContentDialogTest.test.ets';
import selectDialogTest from './dialog/selectDialogTest.test.ets';
import tipsDialogTest from './dialog/tipsDialogTest.test.ets';
import editableTitleBarSafeAreaEdges from './editableTitleBar/editableTitleBarSafeAreaEdges.test.ets';
import editableTitleBarSafeAreaTypes from './editableTitleBar/editableTitleBarSafeAreaTypes.test.ets';
import subHeaderButton from './subHeader/subHeaderButton.test.ets';
import subHeaderIconGroup from './subHeader/subHeaderIconGroup.test.ets';
import subHeaderTextArrow from './subHeader/subHeaderTextArrow.test.ets';
import chipDirectionTest from './chip/chipDirection.test';
import counterDirectionTest from './counter/counterDirection.test';
import popupDirectionTest from './popup/popupDirectionTest.test';
import segmentButtonDirectionTest from './segmenButton/segmentbuttonDirection.test';

import FileButtonContinueToReceiveTest from './downloadFileButton/FileButtonContinueToReceiveTest.test.ets';
import FileButtonDownloadTest from './downloadFileButton/FileButtonDownloadTest.test.ets';
import FileButtonDownloadAndShareTest from './downloadFileButton/FileButtonDownloadAndShareTest.test.ets';
import FileButtonDownloadFileTest from './downloadFileButton/FileButtonDownloadFileTest.test.ets';
import FileButtonReceiveTest from './downloadFileButton/FileButtonReceiveTest.test.ets';
import FileButtonSaveTest from './downloadFileButton/FileButtonSaveTest.test.ets';
import FileButtonSaveFileTest from './downloadFileButton/FileButtonSaveFileTest.test.ets';
import FileButtonSaveImageTest from './downloadFileButton/FileButtonSaveImageTest.test.ets';


export default function testsuite() {
  chipDirectionTest();
  counterDirectionTest();
  popupDirectionTest();
  segmentButtonDirectionTest();
  composeListItemIconType();
  composeListItemOperateItemArrow();
  composeListItemOperateItemButton();
  composeListItemOperateItemCheckbox();
  composeListItemOperateItemImage();
  composeListItemOperateItemRadio();
  composeListItemOperateItemSubIcon();
  composeListItemOperateItemSwitch();
  composeListItemPageTest();
  exceptionPromptTest();
  exceptionPromptTestTwo();
  filterTest();
  filterTestTwo();
  gridObjectSortComponentTest();
  progressButtonTest();
  selectTitleBarTest();
  swipeRefresherPageTest();
  tabTitleBarPageTest();
  toolBarItemState();
  toolBarPageTest();
  treeViewNodeParamContainer();
  alertDialogTest();
  confirmDialogTest();
  customContentDialogTest();
  selectDialogTest();
  tipsDialogTest();
  editableTitleBarSafeAreaEdges();
  editableTitleBarSafeAreaTypes();
  subHeaderButton();
  subHeaderIconGroup();
  subHeaderTextArrow();

  FileButtonContinueToReceiveTest();
  FileButtonDownloadTest();
  FileButtonDownloadAndShareTest();
  FileButtonDownloadFileTest();
  FileButtonReceiveTest();
  FileButtonSaveTest();
  FileButtonSaveFileTest();
  FileButtonSaveImageTest();
}
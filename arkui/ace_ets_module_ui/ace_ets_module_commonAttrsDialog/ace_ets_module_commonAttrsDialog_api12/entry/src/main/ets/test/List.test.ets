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
import aboutToAppearFalse from './menuControlTest/bindContextMenuTest/aboutToAppearFalse.test'
import aboutToDisappearFalse from './menuControlTest/bindContextMenuTest/aboutToDisappearFalse.test'
import CloseContextMenu from './menuControlTest/bindContextMenuTest/CloseContextMenu.test'
import CloseEsc from './menuControlTest/bindContextMenuTest/CloseEsc.test'
import CloseFalse from './menuControlTest/bindContextMenuTest/CloseFalse.test'
import CloseMask from './menuControlTest/bindContextMenuTest/CloseMask.test'
import CloseMenu from './menuControlTest/bindContextMenuTest/CloseMenu.test'
import IsShowFalse from './menuControlTest/bindContextMenuTest/IsShowFalse.test'
import preview from './menuControlTest/bindContextMenuTest/preview.test'
import SheetMode from './bindSheetTest/SheetMode.test'
import springBack from './bindSheetTest/springBack.test'
import DetentsChange from './bindSheetTest/DetentsChange.test'
import SheetTransition from './bindSheetTest/SheetTransition.test'
import symbolIcon from './menuControlTest/symbolIcon.test'
import HoverScale_APITest from './CommonTest/MenuTest/Menu_APITest/HoverScale_APITest';
import ScrollSizeMode_APITest from './CommonTest/BindSheetTest/BindSheet_APITest/ScrollSizeMode_APITest';
import sliderInteractionModeTest from './slider/sliderInteractionModeTest.test'

export default function testsuite() {
  aboutToAppearFalse();
  aboutToDisappearFalse();
  CloseContextMenu();
  CloseEsc();
  CloseFalse();
  CloseMask();
  CloseMenu();
  IsShowFalse();
  preview();
  SheetMode()
  springBack()
  DetentsChange()
  SheetTransition()
  symbolIcon();
  HoverScale_APITest();
  ScrollSizeMode_APITest();
  sliderInteractionModeTest()
}
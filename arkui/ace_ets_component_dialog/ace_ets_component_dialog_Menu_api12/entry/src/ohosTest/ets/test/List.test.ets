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
import aboutToAppearFalse from './bindContextMenuTest/aboutToAppearFalse.test.ets'
import aboutToDisappearFalse from './bindContextMenuTest/aboutToDisappearFalse.test.ets'
import CloseContextMenu from './bindContextMenuTest/CloseContextMenu.test.ets'
import CloseEsc from './bindContextMenuTest/CloseEsc.test.ets'
import CloseFalse from './bindContextMenuTest/CloseFalse.test.ets'
import CloseMask from './bindContextMenuTest/CloseMask.test.ets'
import CloseMenu from './bindContextMenuTest/CloseMenu.test.ets'
import IsShowFalse from './bindContextMenuTest/IsShowFalse.test.ets'
import preview from './bindContextMenuTest/preview.test.ets'

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
}
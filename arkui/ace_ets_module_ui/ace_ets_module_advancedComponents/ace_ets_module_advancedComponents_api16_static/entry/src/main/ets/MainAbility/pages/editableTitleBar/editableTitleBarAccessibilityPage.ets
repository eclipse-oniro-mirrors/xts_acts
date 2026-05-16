'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { EditableLeftIconType, EditableTitleBar } from '@ohos.arkui.advanced.EditableTitleBar';
import promptAction from '@ohos.promptAction';
import {
  Entry,
  Column,
  Component,
  TextAlign,
  Text,
  Color,
  Row,
  ClickEvent,
  Stack,
  Alignment,
  Button,
  Alignment,
  Scroll,
  HorizontalAlign,
  Margin,
  Divider,
  Builder,
  $r,
  SafeAreaEdge
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct EditableTitleBarAccessibilityPage {
  build() {
    Row() {
      Column() {
        Divider().height(2).color(0xCCCCCC)
        EditableTitleBar({
          leftIconStyle: EditableLeftIconType.Cancel,
          title: '编辑页面',
          menuItems: [
            {
              value: $r('sys.media.ohos_ic_public_remove'),
              label: '取消',
              isEnabled: false,
              accessibilityText: '取消', //该项屏幕朗读播报文本为‘取消’
              accessibilityDescription: '单指双击即可取消', //该项屏幕朗读播报描述为'单指双击即可取消'
              accessibilityLevel: 'yes', //该项可被无障碍屏幕朗读聚焦
              defaultFocus: false,
              action: () => {
                this.getUIContext().getPromptAction().showToast({ message: 'show toast index 2' });
              }
            }
          ],
          options: {
            safeAreaEdges: [SafeAreaEdge.TOP]
          },
          onCancel: () => {
            this.getUIContext().getPromptAction().showToast({ message: 'on cancel' });
          },
          onSave: () => {
            this.getUIContext().getPromptAction().showToast({ message: 'on save' });
          }
        })
        Divider().height(2).color(0xCCCCCC)
      }.width('100%')
    }.height('100%')
  }
}
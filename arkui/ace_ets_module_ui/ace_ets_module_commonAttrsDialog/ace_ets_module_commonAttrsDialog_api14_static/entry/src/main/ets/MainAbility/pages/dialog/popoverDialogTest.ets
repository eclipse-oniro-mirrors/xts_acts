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
import events_emitter from '@ohos.events.emitter';
import {
  $r,
  $rawfile,
  AlertDialogParamWithButtons,
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  DismissDialogAction,
  DismissReason,
  DragEvent,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  HoverModeAreaType,
  Image,
  ItemAlign,
  Margin,
  Offset,
  ResourceStr,
  Scroll,
  Text,
  TextAlign,
  TextInput,
  TextInputOptions,
  AlertDialogButtonBaseOptions
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import testsuite from '../../../../src/test/List.test';
import { PopoverDialog, PopoverOptions } from '@ohos.arkui.advanced.Dialog'

@Entry
@Component
struct popoverDialogTest {
  @State close: string = ''
  @State isShow: boolean = false;

  @State popoverOptions: PopoverOptions = {
    builder: this.dialogBuilder
  } as PopoverOptions

  @Builder
  dialogBuilder() {
    this.getUIContext().showAlertDialog({
      message: '跟手弹出框',
      primaryButton: {
        value: '取消',
        action: () => {
          this.isShow = false;
        },
      } as AlertDialogButtonBaseOptions,
      secondaryButton: {
        value: '确认',
        action: () => {
          this.isShow = false;
          this.close = 'close'
        },
      } as AlertDialogButtonBaseOptions,

    } as AlertDialogParamWithButtons);
  }

  @Builder
  buttonBuilder() {
    Button('跟手弹窗目标组件')
      .id('btn')
      .onClick(() => {
        this.isShow = true;
      });
  }

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text(this.close).id('text')
      PopoverDialog({
        visible: this.isShow,
        popover: this.popoverOptions,
        targetBuilder: () => {
          this.buttonBuilder();
        },
      })
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}
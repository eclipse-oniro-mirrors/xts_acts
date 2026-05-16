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

import router from '@ohos.router';
import {
  Entry,
  Column,
  Component,
  Button,
  TransitionEdge,
  ClickEvent,
  Text,
  FlexDirection,
  ItemAlign,
  Divider,
  $r,
  TransitionEffect,
  $$,
  MenuItem,
  BlurStyleActivePolicy,
  AdaptiveColor,
  ThemeColorMode,
  MenuElement,
  Row,
  AlertDialogParamWithButtons,
  FlexOptions,
  ColumnOptions,
  RowOptions,
  Flex,
  Builder,
  MenuItemOptions,
  ResourceStr,
  Menu,
  BackgroundBlurStyleOptions,
  BlurStyle,
  Scroll,
  FontWeight,
  TextAlign,
  ForEach,
  ListItem,
  LocalizedBorderRadiuses,
  $$,
  SheetOptions,
  FlexAlign,
  CustomDialogController,
  TextInput,
  CustomDialogControllerOptions,
  ButtonType,
  Scroller,
  Color,
  Rectangle,
  ActionSheetOptions,
  ControlSize,
  DialogAlignment,
  TextInputController,
  Margin,
  BorderRadiuses
} from '@ohos.arkui.component'
import { State, Link, PropRef, Observed, ObjectLink, } from '@ohos.arkui.stateManagement'
import { UIContext, Router, KeyboardAvoidMode, PromptAction } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BuilderNode, FrameNode } from '@ohos.arkui.node';
import { ImmersiveMode } from '@ohos.promptAction';
import { LengthMetrics, ComponentContent } from '@ohos.arkui.node';
import { Callback, BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import promptAction from '@ohos.promptAction';


const TAG: string = 'OpenDialogTest';

@Entry
@Component
struct Index {
  private customDialogComponentId: int = 0
  @State private isEnableTransition: boolean = false;
  @State private isEnableDialogTransition: boolean = false;
  @State private isEnableMaskTransition: boolean = false;
  private onCancel: () => void = () => {
    try {
      this.getUIContext().getPromptAction().closeCustomDialog(this.customDialogComponentId);
    } catch (error: Error) {
      let message = error.message;
      let code = error.code;
      console.error(TAG, `closeCustomDialog error code is ${code}, message is ${message}`);
    }
  };
  private onConfirm: () => void = () => {
    try {
      this.getUIContext().getPromptAction().closeCustomDialog(this.customDialogComponentId);
    } catch (error: Error) {
      let message = error.message;
      let code = error.code;
      console.error(TAG, `closeCustomDialog error code is ${code}, message is ${message}`);
    }
  };
  private openDialog: () => void = () => {
    this.getUIContext()
      .getPromptAction()
      .openCustomDialog({
      builder: () => {
        this.customDialogComponent()
      },
        transition: this.isEnableTransition ? TransitionEffect.move(TransitionEdge.TOP)
          .animation({ duration: 3000 })
          .combine(TransitionEffect.OPACITY) : undefined,
        dialogTransition: this.isEnableDialogTransition ? TransitionEffect.rotate({
          x: 0,
          y: 0,
          z: 1,
          angle: 360
        })
          .animation({ duration: 3000 })
        .combine(TransitionEffect.OPACITY)
        // .combine(TransitionEffect.scale({ x: 0, y: 1.2 }))
          : undefined,
        maskTransition: this.isEnableMaskTransition ? TransitionEffect.move(TransitionEdge.TOP)
          .animation({ duration: 3000 })
          .combine(TransitionEffect.OPACITY)
        // .combine(TransitionEffect.scale({ x: 0, y: 1.2 }))
          : undefined
      } as promptAction.CustomDialogOptions)
      .then((dialogId: int) => {
        this.customDialogComponentId = dialogId;
      })
      .catch((error: Error) => {
        console.error(`openCustomDialog error code is ${error.code}, message is ${error.message}`);
      })
  };

  @Builder
  customDialogComponent(): void {
    Column() {
      Text('弹窗')
        .fontSize(30)
        .id('TextContent')
      Row({ space: 50 } as RowOptions) {
        Button('确认')
          .id('Confirm')
          .onClick((): void => {
            this.onConfirm();
          })
        Button('取消')
          .id('Cancel')
          .onClick((): void => {
            this.onCancel();
          })
      }
    }
    .height(200)
    .padding(5)
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .backgroundColor('#00FFFF')
  }

  build() {
    Column({ space: 20 } as ColumnOptions) {

      Button('OpenDialog')
        .width('50%')
        .id('OpenDialog')
        .onClick((): void => {
          this.openDialog();
        })

      Button(this.isEnableTransition ? 'CloseTransition' : 'isEnableTransition')
        .width('50%')
        .id('EnableTransition')
        .onClick((): void => {
          this.isEnableTransition = !this.isEnableTransition;
        })

      Button(this.isEnableDialogTransition ? 'CloseDialogTransition' : 'EnableDialogTransition')
        .width('50%')
        .id('EnableDialogTransition')
        .onClick((): void => {
          this.isEnableDialogTransition = !this.isEnableDialogTransition;
        })

      Button(this.isEnableMaskTransition ? 'CloseMaskTransition' : 'EnableMaskTransition')
        .width('50%')
        .id('EnableMaskTransition')
        .onClick((): void => {
          this.isEnableMaskTransition = !this.isEnableMaskTransition;
        })
    }
    .width('100%')
    .height('100%')
  }
}
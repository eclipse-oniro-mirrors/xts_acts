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
  ClickEvent,
  Text,FlexDirection,ItemAlign,Divider,$r,$$,MenuItem,BlurStyleActivePolicy,AdaptiveColor,ThemeColorMode,MenuElement,wrapBuilder,
  Row,AlertDialogParamWithButtons,FlexOptions,ColumnOptions,RowOptions,Flex,Builder,MenuItemOptions,ResourceStr,Menu,BackgroundBlurStyleOptions,BlurStyle,
  Scroll,FontWeight,TextAlign,ForEach,ListItem,LocalizedBorderRadiuses,$$,SheetOptions,FlexAlign,CustomDialogController,TextInput,CustomDialogControllerOptions,
  ButtonType,Scroller,Color,Rectangle,ActionSheetOptions,ControlSize,DialogAlignment,TextInputController,Margin,BorderRadiuses
} from '@ohos.arkui.component'
import { LevelMode } from '@ohos.promptAction';
import {
  State,
  Link,
  PropRef,
  Observed,
  ObjectLink,
} from '@ohos.arkui.stateManagement'
import { UIContext, Router,KeyboardAvoidMode,PromptAction } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BuilderNode,FrameNode } from '@ohos.arkui.node';
import { ImmersiveMode } from '@ohos.promptAction';
import { LengthMetrics,ComponentContent } from '@ohos.arkui.node';
import { Callback,BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import promptAction from '@ohos.promptAction';

class Params {
  private text: string = ''

  constructor(text: string) {
    this.text = text;
  }
}
@Builder
function buildText(param?: Params) {
  Column() {
    Text('popup').fontSize(24)
  }.width(100).height(50).padding(5)
}

@Entry
@Component
struct Index {
  @State closePopup: string = 'init'
  build() {
    Column() {
      Text(this.closePopup)
        .id('closePopup')
      Button('closePopup')
        .id('btn')
        .fontSize(20)
        .onClick(():void => {
          let context = this.getUIContext()
          const contentNode = new ComponentContent(context, wrapBuilder(buildText));
          const promptAction = context.getPromptAction();
          let uniqueId = this.getUniqueId();
          let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
          let targetId = frameNode?.getFirstChild()?.getUniqueId().toInt();
          promptAction.openPopup(contentNode, { id: targetId! }, {
            radius: 16,
            enableArrow: true
          })
          setTimeout(() => {
            promptAction.closePopup(contentNode)
              .then(() => {
                console.info('closePopup success');
                this.closePopup = 'closePopup'
              })
          }, 2000); //2秒后自动关闭
        })
    }
  }
}
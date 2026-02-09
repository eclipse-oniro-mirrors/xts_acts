'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { RouterParams } from '../../common/Utils';
import router from '@ohos.router'
import {
  Entry,
  Component,
  $r,
  Row,
  Column,
  ColumnOptions,
  Text,
  CommonMethod,
  applyStyles,
  Builder,
  Color,
  Menu,
  Stack,
  Toggle,
  CheckboxGroup,
  Checkbox,
  Radio,
  MenuItem,
  ToggleType,
  MenuItemOptions,
} from '@ohos.arkui.component';
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct StateStylesPageTwo {
  @StoragePropRef('_isSelect') _isSelect: boolean = true
  @State targetView: string = ''
  @State componentKey: string = ''

  onPageShow() {
    console.info('StateStylesPageTwo show called ')
    try {
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
      this.targetView = routerParamOptions.view.targetView
      this.componentKey = routerParamOptions.view.componentKey
    } catch (error) {
      console.log(' routerParamOptions error ' + error);
    }
  }

  @Builder
  myBuilder() {
    Column() {
      Text("bindSheet")
        .fontSize(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }

  selectedStyles(instance: CommonMethod) {
    instance.zIndex(2)
    instance.backgroundColor(Color.Blue)
  }

  normalStyles(instance: CommonMethod) {
    instance.zIndex(1)
    instance.backgroundColor(Color.Red)
  }

  commonStyle(instance: CommonMethod) {
    instance.key(this.componentKey)
    instance.stateStyles({
      normal: this.normalStyles,
      selected: this.selectedStyles
    })
  }

  build() {
    Row() {
      Stack() {
        if (this.targetView == 'Checkbox') {
          console.log('CheckboxCheckbox', this._isSelect)
          Checkbox().applyStyles(this.commonStyle).select(this._isSelect)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).applyStyles(this.commonStyle).selectAll(this._isSelect)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).applyStyles(this.commonStyle).checked(this._isSelect)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: this._isSelect }).applyStyles(this.commonStyle)
        } else if (this.targetView == 'MenuItem') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              .applyStyles(this.commonStyle).selected(this._isSelect)
          }
          // .backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }
      }
      // .backgroundColor(Color.Pink)
      .width('100%')
      .width('100%')
    }

    // .backgroundColor(Color.Yellow)
  }
}
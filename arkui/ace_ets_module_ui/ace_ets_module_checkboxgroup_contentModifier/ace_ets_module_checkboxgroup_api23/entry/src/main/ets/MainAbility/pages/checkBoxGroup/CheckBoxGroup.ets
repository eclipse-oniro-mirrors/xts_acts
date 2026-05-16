/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import {
  Entry,
  Component,
  Row,
  Column,
  ColumnOptions,
  CheckboxGroup,
  Checkbox,
  CheckboxGroupResult,
  CheckBoxGroupConfiguration,
  ContentModifier,
  WrappedBuilder,
  wrapBuilder,
  CustomBuilderT,
  Text,
  Shape,
  Path,
  Visibility,
  SelectStatus,
  Color,
  LineJoinStyle,
  Scroll,
  BarState,
  FlexAlign
} from '@ohos.arkui.component';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

export class MyCheckboxGroupStyle implements ContentModifier<CheckBoxGroupConfiguration> {
  public selectedColor: Color = Color.Black;
  public checkBoxGroupName: string = 'CheckboxGroup';

  constructor(selectedColor: Color) {
    this.selectedColor = selectedColor;
  }

  applyContent(): WrappedBuilder<CustomBuilderT<CheckBoxGroupConfiguration>> {
    return wrapBuilder(buildCheckBoxGroup);
  }
}

@Builder
function buildCheckBoxGroup(config: CheckBoxGroupConfiguration) {
  AppStorage.setOrCreate<string>('checkboxGroupCfgName', config.name);
  AppStorage.setOrCreate<number>('checkboxGroupCfgStatus', config.status);
  AppStorage.setOrCreate<boolean>('checkboxGroupCfgEnabled', config.enabled);
  let strokeColor: Color = Color.Red;
  let mod = config.contentModifier as MyCheckboxGroupStyle;
  if (mod && mod.selectedColor !== undefined) {
    strokeColor = mod.selectedColor;
  }
  Column({ space: 4 } as ColumnOptions) {
    Text(`name: ${config.name}`)
      .id('CheckboxgroupContentModifier01')
      .key('CheckboxgroupContentModifier01')
      .width('100%')
      .constraintSize({ minHeight: '5%', maxHeight: '12%' })
      .maxLines(2)
      .fontSize(14)
    Text(`status: ${config.status}`)
      .id('CheckboxgroupContentModifier02')
      .key('CheckboxgroupContentModifier02')
      .width('100%')
      .constraintSize({ minHeight: '5%', maxHeight: '12%' })
      .maxLines(2)
      .fontSize(14)
    Shape() {
      Path()
        .key('CheckboxgroupContentModifier_pentagon')
        .width('58%')
        .height('52%')
        .constraintSize({ minWidth: '40%', minHeight: '36%' })
        .commands('M100 0 L0 100 L50 200 L150 200 L200 100 Z')
        .fillOpacity(0)
        .strokeWidth(3)
        .onClick(() => {
          let selectAll: boolean =
            !(config.status === SelectStatus.All || config.status === SelectStatus.Part);
          config.triggerChange(selectAll);
          AppStorage.setOrCreate<boolean>('checkboxGroupTriggerChangeLast', selectAll);
        })
      Path()
        .key('CheckboxgroupContentModifier_triangle1')
        .width('10%')
        .height('9%')
        .constraintSize({ minWidth: '6%', minHeight: '5%' })
        .commands('M50 0 L100 100 L0 100 Z')
        .visibility(config.status === SelectStatus.All ? Visibility.Visible : Visibility.Hidden)
        .fill(Color.Red)
        .stroke(strokeColor)
        .margin({ left: '3%', top: '2%' })
      Path()
        .key('CheckboxgroupContentModifier_triangle2')
        .width('10%')
        .height('9%')
        .constraintSize({ minWidth: '6%', minHeight: '5%' })
        .commands('M50 0 L100 100 L0 100 Z')
        .visibility(config.status === SelectStatus.Part ? Visibility.Visible : Visibility.Hidden)
        .fill(Color.Yellow)
        .stroke(strokeColor)
        .margin({ left: '3%', top: '2%' })
    }
    .width('92%')
    .height('32%')
    .constraintSize({ minHeight: '22%', maxHeight: '42%' })
    .viewPort({
      x: 0,
      y: 0,
      width: 310,
      height: 310
    })
    .id('checkboxgroup_shape')
    .strokeLineJoin(LineJoinStyle.Miter)
    .strokeMiterLimit(5)
    .margin({ left: '3%' })
    .onClick(() => {
      let selectAll: boolean =
        !(config.status === SelectStatus.All || config.status === SelectStatus.Part);
      config.triggerChange(selectAll);
      AppStorage.setOrCreate<boolean>('checkboxGroupTriggerChangeLast', selectAll);
    })
  }
  .width('100%')
}

@Entry
@Component
struct CheckboxGroupIndex {
  @State myCheckboxGroupStyle: MyCheckboxGroupStyle = new MyCheckboxGroupStyle(Color.Red);
  @State select1: boolean = false;
  @State select2: boolean = false;

  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
      AppStorage.setOrCreate<boolean>('checkboxGroupContentModifierApplied', true);
    } catch (_e) {
      console.error('[ARKUI_NEW] CheckboxGroup aboutToAppear: ' + _e);
    }
  }

  build() {
    Scroll() {
      Column({ space: 0 } as ColumnOptions) {
        CheckboxGroup({ group: 'checkboxGroup' })
          .key('CheckboxgroupContentModifier_CheckboxGroup')
          .id('checkboxGroup')
          .width('100%')
          .constraintSize({ minHeight: '20%', maxHeight: '55%' })
          .contentModifier(this.myCheckboxGroupStyle)
          .onChange((itemName: CheckboxGroupResult) => {
            console.info('CheckboxGroup onChange: ' + JSON.stringify(itemName));
            AppStorage.setOrCreate<string>('checkboxGroupOnChangeNames', JSON.stringify(itemName.name));
            AppStorage.setOrCreate<number>('checkboxGroupOnChangeStatus', itemName.status.valueOf().toDouble());
          })

        Row() {
          Checkbox({ name: '复选框1', group: 'checkboxGroup' })
            .id('checkbox1')
            .select(this.select1)
            .onChange((value: boolean) => {
              console.info('复选框1 change to ' + value);
              this.select1 = value;
            })
          Text('复选框1')
            .width('72%')
            .constraintSize({ minHeight: '6%', maxHeight: '12%' })
            .maxLines(1)
            .fontSize(16)
        }
        .width('100%')
        .height('11%')
        .constraintSize({ minHeight: '8%', maxHeight: '15%' })
        .margin({ top: '2%' })
        .justifyContent(FlexAlign.Start)

        Row() {
          Checkbox({ name: '复选框2', group: 'checkboxGroup' })
            .id('checkbox2')
            .select(this.select2)
            .onChange((value: boolean) => {
              console.info('复选框2 change to ' + value);
              this.select2 = value;
            })
          Text('复选框2')
            .width('72%')
            .constraintSize({ minHeight: '6%', maxHeight: '12%' })
            .maxLines(1)
            .fontSize(16)
        }
        .width('100%')
        .height('11%')
        .constraintSize({ minHeight: '8%', maxHeight: '15%' })
        .margin({ top: '2%' })
        .justifyContent(FlexAlign.Start)
      }
      .width('100%')
      .constraintSize({ minHeight: '100%' })
      .padding({ top: '2%', bottom: '3%', left: '3%', right: '3%' })
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Auto)
  }
}

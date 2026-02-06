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
import { LengthMetrics } from '@ohos.arkui.node';
import {
  AttributeModifier,
  Builder,
  Color,
  Column,
  Component,
  DividerMode,
  DividerOptions,
  DividerStyleOptions,
  Entry,
  HorizontalAlign,
  Menu,
  MenuItem,
  MenuItemGroup,
  MenuItemOptions,
  OptionWidthMode,
  Scroll,
  Select,
  SelectAttribute,
  SelectOption,
  Text
} from '@ohos.arkui.component';
import { Link, State } from '@ohos.arkui.stateManagement';

class MySelectAttribute implements AttributeModifier<SelectAttribute> {
  applyNormalAttribute(instance: SelectAttribute): void {
    instance.dividerStyle({
      color: Color.Pink,
      strokeWidth: LengthMetrics.vp(10),
      mode: DividerMode.EMBEDDED_IN_MENU
    })
  }
}

@Entry
@Component
struct CaseSelect {
  @State array: SelectOption[] =
    [{ value: "选项一" } as SelectOption, { value: "选项二" } as SelectOption, { value: "选项三" } as SelectOption,
      { value: "选项四" } as SelectOption];
  @State array1: SelectOption[] =
    [{ value: "aa" } as SelectOption, { value: "bb" } as SelectOption, { value: "cc" } as SelectOption,
      { value: "dd" } as SelectOption];
  @State dividers: (DividerOptions | undefined)[] = [undefined, {} as DividerOptions, {
    strokeWidth: 20, color: Color.Yellow
  } as DividerOptions]
  @State dividerStyles: (DividerStyleOptions | undefined)[] = [undefined, {} as DividerStyleOptions | undefined, {
    strokeWidth: LengthMetrics.vp(20) as LengthMetrics, color: Color.Pink, mode: DividerMode.EMBEDDED_IN_MENU
  } as DividerStyleOptions | undefined]
  @State optionArray: (SelectOption[] | undefined)[] =
    [[{ value: "选项一" } as SelectOption, { value: "选项二" } as SelectOption, { value: "选项三" } as SelectOption,
      { value: "选项四" } as SelectOption],
      undefined,
      [{ value: "选项三" } as SelectOption, { value: "选项二" } as SelectOption, { value: "选项一" } as SelectOption,
        { value: "选项五" } as SelectOption, { value: "选项四" } as SelectOption],
      [{ value: "选项三" } as SelectOption, { value: "选项二" } as SelectOption, { value: "选项一" } as SelectOption,
        { value: "选项五" } as SelectOption, { value: "选项四" } as SelectOption]]
  @State index: number = 0;
  @State value: number = 0;
  @State modifier: MySelectAttribute = new MySelectAttribute()
  @State backColor: Color = Color.Yellow

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: "复制", labelInfo: "Ctrl+C" } as MenuItemOptions)
      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" } as MenuItemOptions)
      MenuItemGroup() {
        MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" } as MenuItemOptions)
        MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" } as MenuItemOptions)
      }

      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" } as MenuItemOptions)
      MenuItemGroup() {
        MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" } as MenuItemOptions)
        MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" } as MenuItemOptions)
      }

      MenuItemGroup() {
        MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" } as MenuItemOptions)
        MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" } as MenuItemOptions)
      }
    }.menuItemDivider({
      startMargin: LengthMetrics.vp(0),
      endMargin: LengthMetrics.vp(0),
      strokeWidth: LengthMetrics.vp(1),
    })
    .menuItemGroupDivider({
      startMargin: LengthMetrics.vp(0),
      endMargin: LengthMetrics.vp(0),
      strokeWidth: LengthMetrics.vp(1),
    })
  }

  build() {
    Scroll() {
      Column() {
        Text("深浅色测试")
        Select(this.array)
          .id("selectmode")
          .width(200)
          .dividerStyle({
            mode: DividerMode.FLOATING_ABOVE_MENU,
            color: '#d5d5d5',
            strokeWidth: LengthMetrics.vp(5)
          })
          .optionWidth(OptionWidthMode.FIT_TRIGGER)

        Text("分割线")
        Select(this.array1)
          .id("selectmode1")
          .width(200)
          .dividerStyle({
            color: '#d5d5d5',
            strokeWidth: LengthMetrics.vp(5),
            mode: DividerMode.EMBEDDED_IN_MENU
          })
          .optionWidth(OptionWidthMode.FIT_TRIGGER)

      }.width('100%')
      .alignItems(HorizontalAlign.Start)
    }
    .height('100%')
  }
}
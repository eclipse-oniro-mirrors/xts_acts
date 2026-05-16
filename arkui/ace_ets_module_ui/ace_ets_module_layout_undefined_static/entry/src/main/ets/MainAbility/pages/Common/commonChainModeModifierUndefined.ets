'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {  AttributeModifier,  CommonAttribute,  Entry,  Column,  Component,  Button,  Text,
  Row,  Color,  $r,  Margin,  ColumnOptions,  Flex,  Scroll,  Padding,  Position,  Builder,  Image,
  FlexDirection,  ItemAlign,  FlexAlign,  Alignment,  TextAlign,  TextOverflow,  RelativeContainer,
  VerticalAlign,  HorizontalAlign,  BarrierDirection,  ChainStyle,  Axis,  BarrierStyle,  AlignRuleOption,
  LocalizedAlignRuleOptions} from '@ohos.arkui.component';
import { State, Observed } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';


@Observed
export class MySelectModifier implements AttributeModifier<CommonAttribute> {
  public flag : boolean = true;
  applyNormalAttribute(instance: CommonAttribute): void {
    instance.chainMode(Axis.Horizontal, this.flag ? undefined : ChainStyle.SPREAD_INSIDE as ChainStyle)
  }
}

@Entry
@Component
struct chainMode {
  @State message: string = 'Hello World';
  @State modifier: MySelectModifier = new MySelectModifier()

  build() {
    Column() {
      Column() {
        Row() {
          Text('row4')
        }
        .justifyContent(FlexAlign.Center)
        .width(80)
        .height(80)
        .backgroundColor('#a3cf62')
        .alignRules({
          start: { anchor: '__container__', align: HorizontalAlign.Start },
          end: { anchor: 'row5', align: HorizontalAlign.Start },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        } as LocalizedAlignRuleOptions)
        .id('row4')
        .attributeModifier(this.modifier)
      }
        Column() {
          Button('flag is ' + this.modifier.flag).fontSize(20).id('changeButton')
            .onClick((e: ClickEvent) => {
              this.modifier.flag = !this.modifier.flag;
            })
        }
      }
    }
 }
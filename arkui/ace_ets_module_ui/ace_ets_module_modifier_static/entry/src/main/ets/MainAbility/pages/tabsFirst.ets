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
import { Entry,Builder,Component,Video,LayoutStyle,BarPosition,Resource,BarMode,$r,TabsAttribute,FlexAlign,Divider,Tabs,TabContent,TabsController,TextPicker,TextAreaController,PlaybackSpeed,$rawfile,Column,Margin,ColumnOptions,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
  PropRef
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { TabsModifier } from "@ohos.arkui.modifier";

class CustomModifier extends TabsModifier {
  applyNormalAttribute(instance: TabsAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChangeTabs() {
    this.barBackgroundColor('#FF122345')
  }
}

@Component
struct ModifierComponent {
  @PropRef customModifier!: CustomModifier
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  @Builder
  TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 } as Margin)
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }

  build() {
    Column(){
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChangeTabs();
      }).key("changeButton")

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }
        .tabBar(() => { this.TabBuilder(0, 'green') })

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }
        .tabBar(() => { this.TabBuilder(1, 'blue') })

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }
        .tabBar(() => { this.TabBuilder(2, 'yellow') })

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#E67C92')
        }
        .tabBar(() => { this.TabBuilder(3, 'pink') })
      }
    .key('tabsTest')
        .attributeModifier(this.customModifier as CustomModifier)
        .onChange((index: int) => {
          this.currentIndex = index
        })
        .width(200)
        .height(200)
    }
  }
}

@Entry
@Component
struct TestPage {

  @State customModifier: CustomModifier = new CustomModifier()
    .barGridAlign({ sm: -2, margin: 10, gutter: '15px' })
    .barBackgroundColor("rgb(255, 100, 255)")
    .barOverlap(true)
    .divider({ strokeWidth: 2, color: Color.Red, startMargin: 0, endMargin: 0 })
    .fadingEdge(true)
    .animationDuration(300)
    .barHeight("100vp")
    .barWidth("156vp")
    .scrollable(true)
    .barPosition(BarPosition.Start)
    .vertical(true)
    .barMode(BarMode.Scrollable, { margin: 0, nonScrollableLayoutStyle: LayoutStyle.ALWAYS_CENTER })

  @Builder
  modifierBuilder() {
    Column() {
      //这里是Modifier属性UI
      ModifierComponent({ customModifier: this.customModifier })
    }
  }

  build() {
    Column() {
      Row() {
        Column() {
          Text("Modifier")
            .fontSize("32fp")
            .margin({ top: 20, bottom: 20 } as Margin)
            .fontWeight(FontWeight.Bold)
          this.modifierBuilder()
        }
      }
      .width("100%")
        .justifyContent(FlexAlign.Center)

    }.width('100%')
      .height("100%")
  }
}
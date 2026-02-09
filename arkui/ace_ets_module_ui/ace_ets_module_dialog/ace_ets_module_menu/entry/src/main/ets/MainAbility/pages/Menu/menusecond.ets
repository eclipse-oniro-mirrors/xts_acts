/*
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
import hilog from '@ohos.hilog';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import { Want } from '@kit.AbilityKit';

@Entry
@Component
struct SecondIndex {
  @State select: boolean = true
  @State arrowOffset: number = 0
  @State backgroundColorValue: ResourceColor = '#f0f0f0'
  private iconStr: ResourceStr = $r("app.media.icon")

  @Builder
  ThreeLevelMenu() {
    Menu() {
      MenuItem({ content: "复制", labelInfo: "Ctrl+C" })
      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" })
    }
  }

  @Builder
  MyMenu(){
    Menu() {
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" }).selectIcon(true).selected(false)
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" }).selectIcon(true).selected(false)
      MenuItem({
        startIcon: this.iconStr,
        content: "菜单选项",
      }).selectIcon(true).selected(false)

      MenuItemGroup({ header: '小标题' }) {
        MenuItem({  startIcon: this.iconStr, content: "菜单选项" })
          .selectIcon(true)
          .selected(this.select)
          .onChange((selected) => {
            console.info("menuItem select" + selected);
          })
        MenuItem({
          startIcon: this.iconStr,
          content: "菜单选项",
        }).selectIcon(true).selected(false)
        MenuItem({
          startIcon: $r("app.media.icon"),
          content: "菜单选项",
        }).selectIcon(true).selected(false)
      }
    }
  }

   @Builder
  MyPreview(){
    Column() {
          Text('菜单preview builder')
            .border({width:5})
            .width(300)
    }
    Column() {
      Button('菜单preview builder')
        .backgroundColor(this.backgroundColorValue)
        .onClick(()=>{
          this.backgroundColorValue = Color.Red
        })
    }
    Column() {
      Image($r('app.media.icon'))
        .width(100)
        .height(100)
    }
  }

  build() {
    Column() {
      Text('bindMenu菜单')
      .key("Menu")
      .border({width:5})
      .width(200)
      .height(200)
      .margin(50)
      .fontSize(30)
      .bindMenu([
        {
          value: '菜单项',
          action: () => {
          }
        },
        {
          value: "菜单项",
          action: () => {
          },
          enabled: true
        },
        {
          value: "菜单项disabled",
          action: () => {
          },
          enabled: false
        }])
        Text('长按弹出悬浮菜单图片')
          .key("floatingMenuImage")
          .fontWeight(FontWeight.Bold)
          .fontSize(30)
          .padding({ top: 20 })
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, 
          {enableArrow: true,arrowOffset:this.arrowOffset,preview: MenuPreviewMode.IMAGE})
        Text('长按弹出悬浮菜单自定义')
          .key("floatingMenuBuilder")
          .fontWeight(FontWeight.Bold)
          .fontSize(30)
          .padding({ top: 20 })
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, 
          {enableArrow: true,arrowOffset:this.arrowOffset, preview:this.MyPreview.bind(this)})
    }.height('100%')
    .width('100%')
    .backgroundColor(this.backgroundColorValue)
  }
 }
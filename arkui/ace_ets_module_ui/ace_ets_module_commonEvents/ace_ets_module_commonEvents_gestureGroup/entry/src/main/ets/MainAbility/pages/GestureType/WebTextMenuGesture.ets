/*
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

import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  private iconStr: ResourceStr = $r('app.media.icon');

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
    }
  }

  @Builder
  MyPreview() {
    Column() {
      Image($r('app.media.icon'))
        .width('30%')
        .height('15%')
    }
  }
  build() {
    Column() {
      Web({ src: 'www.example.com', controller: this.controller })
        .backgroundColor(Color.Red)
        .width('30%')
        .height('15%')
        .id('web')
        .onGestureJudgeBegin((info, event)=>{
          if(info.type == GestureControl.GestureType.WEB_SCROLL_GESTURE){
            AppStorage.setOrCreate('WEB_SCROLL_GESTURE',GestureControl.GestureType.WEB_SCROLL_GESTURE)
          }
          return undefined
        })

      TextInput()
        .onGestureJudgeBegin((info, event)=>{
          if(info.type == GestureControl.GestureType.TEXT_FIELD_SELECT_GESTURE){
            AppStorage.setOrCreate('TEXT_FIELD_SELECT_GESTURE',GestureControl.GestureType.TEXT_FIELD_SELECT_GESTURE)
          }
          return undefined
        }).width('100%')
        .height('10%')
        .id('text')
      Image($r('app.media.icon'))
        .width('30%')
        .height('15%')
        .margin('5%')
        .id('image')
        .bindContextMenu(this.MyMenu, ResponseType.LongPress,
          {
            preview: this.MyPreview,
            previewAnimationOptions: {
              hoverScale: [1.0, 0.8],
              hoverScaleInterruption: true
            }
          })
        .onClick(() => {
          console.info('trigger onClick')
        })
        .onGestureJudgeBegin((info, event)=>{
          if(info.type == GestureControl.GestureType.CONTEXT_MENU_HOVER_GESTURE){
            AppStorage.setOrCreate('CONTEXT_MENU_HOVER_GESTURE',GestureControl.GestureType.CONTEXT_MENU_HOVER_GESTURE)
          }
          return undefined
        })
    }.height('100%').width('100%')
  }
}
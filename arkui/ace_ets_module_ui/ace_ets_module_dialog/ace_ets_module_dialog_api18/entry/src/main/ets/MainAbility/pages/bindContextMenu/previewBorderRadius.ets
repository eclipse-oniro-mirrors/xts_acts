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
@Entry
@Component
struct Index {
  private iconStr: ResourceStr = $r('app.media.app_icon')
  @State listData: number[] = [0, 0, 0]
  @State rad: Length | BorderRadiuses | LocalizedBorderRadiuses = 20
  @State txt1: string = ''
  @State hap2: Length | BorderRadiuses | LocalizedBorderRadiuses | undefined | null = undefined
  @State txt2: string = ''
  @State hap3: Length | BorderRadiuses | LocalizedBorderRadiuses | undefined | null = null
  @State txt3: string = ''

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
    }
  }

  build() {
    Column({ space: 50 }) {
      Column() {
        Button('20-preview')
          .id('menu_1')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress,
            {
              preview: MenuPreviewMode.IMAGE,
              previewBorderRadius: this.rad,
              onAppear: () => {
                this.txt1 = JSON.stringify(this.rad)
              },
              previewAnimationOptions: { scale: [0.8, 1.0] },
            })
          .id('menu_1')
          .backgroundColor('#ff3df2f5')
          .margin({top: '2%'})
        Text(this.txt1)
          .id('text1')
      }

      Column() {
        Button('null-preview')
          .id('menu_2')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress,
            {
              preview: MenuPreviewMode.IMAGE,
              previewBorderRadius: this.hap2,
              onAppear: () => {
                this.txt2 = (this.hap2 === undefined) ? '16' : JSON.stringify(this.hap2)
              },
              previewAnimationOptions: { scale: [0.8, 1.0] },
            })
          .backgroundColor('#ff3df2f5')
        Text('' + this.txt2)
          .id('text2')
      }

      Column() {
        Button('undefined-preview')
          .id('menu_3')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress,
            {
              preview: MenuPreviewMode.IMAGE,
              previewBorderRadius: this.hap3,
              onAppear: () => {
                this.txt3 = (this.hap3 === null) ? '16' : JSON.stringify(this.hap3)
              },
              previewAnimationOptions: { scale: [0.8, 1.0] },
            })
          .backgroundColor('#ff3df2f5')
        Text('' + this.txt3)
          .id('text3')
      }
    }.width('100%')
  }
}
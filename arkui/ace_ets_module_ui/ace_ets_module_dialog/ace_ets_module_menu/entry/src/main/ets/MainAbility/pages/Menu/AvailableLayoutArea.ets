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
 
// 菜单预览图
@Builder
export function PreviewBuilder() {
  Image($r('app.media.icon'))
    .width(200)
    .height(120)
}

@Entry
@Component
struct LayIndex {
  private iconStr: Resource = $r("app.media.icon")

  scroller:Scroller=new Scroller

  private placementArray: Array<Placement| undefined> = new Array<Placement| undefined>(
    undefined,
    Placement.Left, //1
    Placement.Right,
    Placement.Top, //3
    Placement.Bottom,
  )
  @State placementIndex: number = 0

  @State AvailableLayoutAreaArray: Array<AvailableLayoutArea | undefined> = new Array<AvailableLayoutArea | undefined>(
    AvailableLayoutArea.SAFE_AREA,
    undefined
  )
  @State AvailableLayoutAreaIndex: number = 0
  @State isShow1: boolean = false
  @State txt2: string = ''

  @Builder
  MyMenu1() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" }).id("menu")
      MenuItem({ content: "菜单选项" })
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
      MenuItem({ content: "菜单选项" })
    }
  }

  @Builder
  MyPreview() {
    Row()
      .width("50%")
      .height("50%")
      .backgroundColor(Color.Pink)

  }

  build() {
    Scroll(this.scroller) {
      Column(undefined) {
        Button("001、placement=" + this.placementArray[this.placementIndex] + ", index=" + this.placementIndex)
          .onClick((event: ClickEvent) => {
            if (this.placementIndex >= this.placementArray.length - 1) {
              this.placementIndex = 0;
            } else {
              this.placementIndex = this.placementIndex + 1;
            }
          })

        Button("005、availableLayoutArea=" + this.AvailableLayoutAreaArray[this.AvailableLayoutAreaIndex] + ", index=" +
        this.AvailableLayoutAreaIndex)
          .onClick((event: ClickEvent) => {
            if (this.AvailableLayoutAreaIndex >= this.AvailableLayoutAreaArray.length - 1) {
              this.AvailableLayoutAreaIndex = 0;
            } else {
              this.AvailableLayoutAreaIndex = this.AvailableLayoutAreaIndex + 1;
            }
          })

        Button("888、builder")
          .id("scale")
          .bindContextMenu(this.MyMenu1(), ResponseType.LongPress, {
            placement: this.placementArray[this.placementIndex],
            preview: this.MyPreview(),
            availableLayoutArea: this.AvailableLayoutAreaArray[this.AvailableLayoutAreaIndex],
            onDisappear:()=>{
            this.txt2 = JSON.stringify( this.AvailableLayoutAreaArray[this.AvailableLayoutAreaIndex])
            this.isShow1=false
          }
          })
        Text(this.txt2)
        .id('text2')

        Button("111、IMAGE")
          .bindContextMenu(this.MyMenu1(), ResponseType.LongPress, {
            placement: this.placementArray[this.placementIndex],
            preview: MenuPreviewMode.IMAGE,
            availableLayoutArea: this.AvailableLayoutAreaArray[this.AvailableLayoutAreaIndex],
          })
          .width("50%")
          .height("50%")
          .margin({top:400})
          .backgroundColor(Color.Pink)

      }
    }
    .width('100%')
  }
}

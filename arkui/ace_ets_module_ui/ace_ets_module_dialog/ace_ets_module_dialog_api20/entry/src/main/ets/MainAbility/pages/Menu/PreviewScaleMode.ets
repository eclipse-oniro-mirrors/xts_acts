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
struct Index {
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


  private widthArray: Array<Length | undefined> = new Array<Length | undefined>(
    "1000%",
    "50%",
    "80%",
    "100%"
  )
  @State widthIndex: number = 0


  private heightArray: Array<Length | undefined> = new Array<Length | undefined>(
    "10%",
    "80%",
    "100%",
    "1000%"
  )
  @State heightIndex: number = 0

  @State previewScaleModeArray: Array<PreviewScaleMode | undefined|null> = new Array<PreviewScaleMode | undefined|null>(
    PreviewScaleMode.AUTO,
    PreviewScaleMode.CONSTANT,
    PreviewScaleMode.MAINTAIN,
  )
  @State previewScaleModeIndex: number = 0

  @State AvailableLayoutAreaArray: Array<AvailableLayoutArea | undefined> = new Array<AvailableLayoutArea | undefined>(
    AvailableLayoutArea.SAFE_AREA,
    undefined
  )
  @State AvailableLayoutAreaIndex: number = 0

  @State arrayIndex: number = 0
  @State previewScaleModeArrayIndex: number = 0
  @State isShow1: boolean = false
  @State txt1: string = ''

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
      .width(this.widthArray[this.widthIndex])
      .height(this.heightArray[this.heightIndex])
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
          }).height('3%')
          .margin({top: '5%'})

        Button("002、width=" + this.widthArray[this.widthIndex] + ", index=" + this.widthIndex)
          .id("width").height('3%')
          .onClick((event: ClickEvent) => {
            if (this.widthIndex >= this.widthArray.length - 1) {
              this.widthIndex = 0;
            } else {
              this.widthIndex = this.widthIndex + 1;
            }
          })

        Button("003、height=" + this.heightArray[this.heightIndex] + ", index=" + this.heightIndex)
          .id("height").height('3%')
          .onClick((event: ClickEvent) => {
            if (this.heightIndex >= this.heightArray.length - 1) {
              this.heightIndex = 0;
            } else {
              this.heightIndex = this.heightIndex + 1;
            }
          })

        Button("004、previewScaleMode=" + this.previewScaleModeArray[this.previewScaleModeIndex] + ", index=" +
        this.previewScaleModeIndex)
          .id("previewScaleMode").height('3%')
          .onClick((event: ClickEvent) => {
            if (this.previewScaleModeIndex >= this.previewScaleModeArray.length - 1) {
              this.previewScaleModeIndex = 0;
            } else {
              this.previewScaleModeIndex = this.previewScaleModeIndex + 1;
            }
          })
        Button("005、availableLayoutArea=" + this.AvailableLayoutAreaArray[this.AvailableLayoutAreaIndex] + ", index=" +
        this.AvailableLayoutAreaIndex).height('3%')
          .onClick((event: ClickEvent) => {
            if (this.AvailableLayoutAreaIndex >= this.AvailableLayoutAreaArray.length - 1) {
              this.AvailableLayoutAreaIndex = 0;
            } else {
              this.AvailableLayoutAreaIndex = this.AvailableLayoutAreaIndex + 1;
            }
          })

        Button("888、builder")
          .id("scale").height('3%')
          .bindContextMenu(this.MyMenu1(), ResponseType.LongPress, {
            placement: this.placementArray[this.placementIndex],
            preview: this.MyPreview(),
            previewScaleMode: this.previewScaleModeArray[this.previewScaleModeIndex],
            availableLayoutArea: this.AvailableLayoutAreaArray[this.AvailableLayoutAreaIndex],
            onDisappear:()=>{
            this.txt1 = JSON.stringify( this.previewScaleModeArray[this.previewScaleModeIndex])
            this.isShow1=false
          }
          })
        Text(this.txt1)
        .id('text1')

        Button("111、IMAGE")
          .bindContextMenu(this.MyMenu1(), ResponseType.LongPress, {
            placement: this.placementArray[this.placementIndex],
            preview: MenuPreviewMode.IMAGE,
            previewScaleMode: this.previewScaleModeArray[this.previewScaleModeIndex],
            availableLayoutArea: this.AvailableLayoutAreaArray[this.AvailableLayoutAreaIndex],
          })
          .width(this.widthArray[this.widthIndex])
          .height(this.heightArray[this.heightIndex])
          .margin({top:400})
          .backgroundColor(Color.Pink)
      }
    }
    .width('100%')
  }
}

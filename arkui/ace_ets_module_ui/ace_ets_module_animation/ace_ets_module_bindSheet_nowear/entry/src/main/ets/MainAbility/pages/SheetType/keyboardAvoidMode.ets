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
struct SheetTransitionExample {
  @State isShow: boolean = false
  @State myHeight: number = 300;
  @State myWidth: number = 300;
  @State placement: Placement = Placement.Bottom;
  @State placementInfos: string[] = [
    "Left",
    "Right",
    "Top",
    "Bottom",
    "TopLeft",
    "TopRight",
    "BottomLeft",
    "BottomRight",
    "LeftTop",
    "LeftBottom",
    "RightTop",
    "RightBottom"
  ];
  @State preferType :SheetType | undefined = SheetType.POPUP;
  @State placementOnTarget: boolean |undefined = undefined;
  @State keyboardAvoidMode: SheetKeyboardAvoidMode = SheetKeyboardAvoidMode.POPUP_SHEET

  @Builder
  myBuilder() {
    Column() {
      Row({ space: 10 }) {
        Text(String(this.keyboardAvoidMode))
          .id('text')
        Button('close modal 1')
          .id('close')
          .onClick(()=>{
            this.isShow = false
          })
          .margin(10)
          .fontSize(20)
      }
      TextInput({placeholder:'input your word'})
        .id('ipt')

      Text("暮色漫过山脊时，风会变成透明的蝴蝶。\n" +
        "窗台上的茉莉在月光里褪去白昼的倦意，\n" +
        "露珠沿着叶脉滑落，像时光抖落的碎银。\n" +
        "远处的灯火次第亮起，如同被谁随手撒落的星子，\n" +
        "而你的影子正慢慢爬上墙，\n" +
        "与我的呼吸缠绕成同一片雾。\n" +
        "\n" +
        "溪水把黄昏揉进波纹，\n" +
        "苔痕在石阶上写下无人破译的诗。\n" +
        "当最后一缕霞光沉入云海，\n" +
        "所有未说出口的词语都化作萤火，\n" +
        "在夜的褶皱里，轻轻颤动。")

    }
    .width('100%')
  }


  build() {
    Column() {
      Column (){
        Row() {
          Button('-')
            .onClick(() => {
              this.placement--;
            })
          Text('placement: ' + this.placementInfos[this.placement])
          Button('+')
            .onClick(() => {
              this.placement++;
              if (this.placement > this.placementInfos.length) {
                this.placement = 0
              }
            })
        }

        Row({ space: 10 }) {
          Text("preferType : " )
          Select([
            { value: "side" },
            { value: "bottom" },
            { value: "center" },
            { value: "popup" },

          ]).
          selected(0).onSelect((index: number, value: string) => {
            switch (value) {
              case "side":
                this.preferType = SheetType.SIDE
                break;
              case "bottom":
                this.preferType = SheetType.BOTTOM
                break;
              case "center":
                this.preferType = SheetType.CENTER
                break;
              case "popup":
                this.preferType = SheetType.POPUP
                break;

            }
          })
        }

        Row({ space: 10 }) {
          Text("placementOnTarget : " )
          Select([
            { value: "undefined" },
            { value: "true" },
            { value: "false" }

          ]).
          selected(0).onSelect((index: number, value: string) => {
            switch (value) {
              case "undefined":
                this.placementOnTarget = undefined
                break;
              case "bottom":
                this.placementOnTarget = true
                break;
              case "center":
                this.placementOnTarget = false
                break;

            }
          })
        }

      }

      Button("openSheet")
        .id('popupButton')
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(), {
          preferType:this.preferType,
          title:{
            title:"title",
            subtitle:"subtitle"
          },
          height:700,
          width:400,
          placementOnTarget: this.placementOnTarget,
          keyboardAvoidMode: this.keyboardAvoidMode,
          placement: this.placement,

          onWillAppear: () => {
            console.log("BindSheet onWillAppear.")
          },
          onAppear: () => {
            console.log("BindSheet onAppear.")
          },
          onWillDisappear: () => {
            console.log("BindSheet onWillDisappear.")
          },
          onDisappear: () => {
            console.log("BindSheet onDisappear.")
          },
          onHeightDidChange: (height: number)=>{
            console.log("zhj height change:" + height);
          },
          onWidthDidChange: (width: number)=>{
            console.log("zhj width change:" + width);
          },
          onTypeDidChange: (type: SheetType) => {
            console.log("zhj type change:" + type);
          },
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}

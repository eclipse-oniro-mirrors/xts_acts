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
struct SheetTypeExample {
  @State isShowBottom: boolean = false
  @State isShowSide: boolean = false
  @State sheetHeight: number = 300;
  @State str: string = ''
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];

 @Builder
  sideBuilder() {
    Column() {
      Button("change side1")
        .margin(10)
        .fontSize(20)
        .id('side')

      Button("change side2")
        .margin(10)
        .fontSize(20)
    }
    .width('100%')
    .height('100%')
  }


  build() {
    Column({space:3}) {

      Button("半模态弹窗-Side")
        .id('sheetSide1')
        .onClick(() => {
          this.isShowSide = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShowSide, this.sideBuilder(), {
          title: { title: "SideSheet", subtitle: "有关闭按钮" },  
          backgroundColor: Color.Grey,
          preferType: SheetType.SIDE,  //窗口宽度大于600vp时支持
          showClose: true,  
          blurStyle: BlurStyle.Regular, 
          enableOutsideInteractive: false,
          onHeightDidChange: (height: number)=>{
            console.log("SideSheet height change:" + height)
          },
          onTypeDidChange: (data: SheetType) => {
            console.log("SideSheet type change:" + data)
          },
          onWillDismiss: ((DismissSheetAction: DismissSheetAction) => {
            if (DismissSheetAction.reason == DismissReason.SLIDE) {
              DismissSheetAction.dismiss(); //注册dismiss行为
              this.str = 'success'
            }
          }),
          onWillSpringBackWhenDismiss: ((SpringBackAction: SpringBackAction) => {
            //没有注册springBack，下拉半模态页面无回弹行为
            SpringBackAction.springBack();
          }),
        })
         Text(this.str).key('DismissReason')
    }
    .id('col')
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
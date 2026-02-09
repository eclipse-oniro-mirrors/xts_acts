/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct showInSubWindowBindSheet {
  @State mPreferType: SheetType | undefined = SheetType.CENTER
  @State showInSub: boolean | null | undefined = false
  @State avoidMode: SheetKeyboardAvoidMode = SheetKeyboardAvoidMode.TRANSLATE_AND_SCROLL
  @State isShow: boolean = false

  @Builder
  myBuilder() {
    Column() {
      Button('close bindSheet')
        .id('closeSheet')
        .onClick(() => {
          this.isShow = false
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column({ space: 10 }) {
      Button('Open BindSheet')
        .id('openSheet')
        .onClick(() => {
          this.isShow = true
        })
        .bindSheet($$this.isShow, this.myBuilder(), {
          mode: SheetMode.OVERLAY,
          height: SheetSize.LARGE,
          width: 300,
          enableOutsideInteractive: true,
          detents: [SheetSize.MEDIUM, SheetSize.LARGE, 200],
          showClose: true,
          preferType: this.mPreferType,
          title: { title: 'maintitle', subtitle: 'subtitle' },
          shadow: ShadowStyle.OUTER_DEFAULT_LG,
          borderColor: Color.Red,
          dragBar: true,
          maskColor: Color.Pink,
          keyboardAvoidMode: SheetKeyboardAvoidMode.TRANSLATE_AND_SCROLL,
          blurStyle: BlurStyle.Regular,
          showInSubWindow: this.showInSub,
          placement: Placement.Bottom,
          placementOnTarget: true,
          onHeightDidChange: ((height: number) => {
            console.log('TestTag:: height is' + height)
          }),
          onDetentsDidChange: ((height: number) => {
            console.log('TestTag:: detent is' + height)
          }),
          onTypeDidChange: ((height: number) => {
            console.log('TestTag:: type is' + height)
          }),
          onWidthDidChange: ((height: number) => {
            console.log('TestTag:: width is' + height)
          }),
          onDisappear: (() => {
            console.log('TestTag:: sheet goes to disappear')
            this.isShow = false
          })
        })
      Row({ space: 10 }) {
        Button('PreferType : POPUP')
          .id('popup')
          .height('8%')
          .backgroundColor(Color.Pink)
          .borderRadius(10)
          .onClick(() => {
            this.mPreferType = SheetType.POPUP
          })
      }

      Row({ space: 10 }) {
        Button('showInSubWindow : true')
          .id('showInSubWindowTrue')
          .height('8%')
          .backgroundColor(Color.Pink)
          .borderRadius(10)
          .onClick(() => {
            this.showInSub = true
          })
        Button('showInSubWindow : false')
          .id('showInSubWindowFalse')
          .height('8%')
          .backgroundColor(Color.Pink)
          .borderRadius(10)
          .onClick(() => {
            this.showInSub = false
          })
      }

      Row({ space: 10 }) {
        Button('showInSubWindow : null')
          .id('showInSubWindowNull')
          .height('8%')
          .backgroundColor(Color.Pink)
          .borderRadius(10)
          .onClick(() => {
            this.showInSub = null
          })
        Button('showInSubWindow : undefined')
          .id('showInSubWindowUnd')
          .height('8%')
          .backgroundColor(Color.Pink)

          .borderRadius(10)
          .onClick(() => {
            this.showInSub = undefined
          })
      }
    }
    .height('100%').width('100%')
  }
}
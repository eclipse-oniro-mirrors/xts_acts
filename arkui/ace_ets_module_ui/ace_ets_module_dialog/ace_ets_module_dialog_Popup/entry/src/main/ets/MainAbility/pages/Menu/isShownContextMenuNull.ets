/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct isShownBindContextMenuNullUndefined {
  @State isShown: boolean = false;
  @State isShown01: boolean = false;
  @State isShown02: boolean = false;
  @State isShown03: boolean = false;
  @State isShown1: boolean = false;
  @State isShown2: boolean = false;
  @State isShown3: boolean = false;
  @State isShown4: boolean = false;
  @State isShown5: boolean = false;
  @State isShown6: boolean = false;
  @State isShown7: boolean = false;
  @State isShown8: boolean = false;
  @State isShown9: boolean = false;
  @State isShown10: boolean = false;
  @State isShown11: boolean = false;
  @State isShown12: boolean = false;
  @State isShown13: boolean = false;
  @State isShown14: boolean = false;
  @State isShown15: boolean = false;

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '菜单1' }).id('isShownMenu_nullUn')
      MenuItem({ content: '菜单2' })
    }
  }

  build() {
    Column() {
      // ========== bindContextMenu isShown tests ==========
      Text('bindContextMenu')
      Row(){
        Button('null2')
          .id('isShownMenu_content_null')
          .onClick(()=>{
            this.isShown = true
          })
          .bindContextMenu(this.isShown!!, null)

        Button('undefined2')
          .id('isShownMenu_content_undefined')
          .onClick(()=>{
            this.isShown01 = true
          })
          .bindContextMenu(this.isShown01!!, undefined)
      }.height('10%')

      Row(){
        Button('null3')
          .id('isShownMenu_options_null')
          .onClick(()=>{
            this.isShown02 = true
          })
          .bindContextMenu(this.isShown02!!, this.MyMenu, null)

        Button('undefined3')
          .id('isShownMenu_options_undefined')
          .onClick(()=>{
            this.isShown03 = true
          })
          .bindContextMenu(this.isShown03!!, this.MyMenu, undefined)
      }.height('10%')

      Row(){
        Text('isShow1').margin({right:3})
          .id('isShownMenu_enum_1')
          .onClick(()=>{
            this.isShown1 = true
          })
          .bindContextMenu(this.isShown1!!, this.MyMenu, {
            enableArrow: false,
            preview: MenuPreviewMode.NONE,
            previewAnimationOptions: {
              hoverScaleInterruption: false
            },
            backgroundBlurStyle: BlurStyle.Regular,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE,
            },
            backgroundEffect: {
              radius: 60,
              adaptiveColor: AdaptiveColor.DEFAULT,
              policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE,
            },
            enableHoverMode: false,
            hapticFeedbackMode: HapticFeedbackMode.DISABLED,
            mask: { backgroundBlurStyle: BlurStyle.Regular },
            modalMode: ModalMode.AUTO,
            previewScaleMode: PreviewScaleMode.AUTO,
            availableLayoutArea: AvailableLayoutArea.SAFE_AREA,
            keyboardAvoidMode: MenuKeyboardAvoidMode.NONE,
          })

        Text('isShow2').margin({right:3})
          .id('isShownMenu_enum_2')
          .onClick(()=>{
            this.isShown2 = true
          })
          .bindContextMenu(this.isShown2!!, this.MyMenu, {
            enableArrow: true,
            preview: MenuPreviewMode.IMAGE,
            previewAnimationOptions: {
              hoverScaleInterruption: true
            },
            backgroundBlurStyle: BlurStyle.Thick,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
            },
            backgroundEffect: {
              radius: 60,
              adaptiveColor: AdaptiveColor.AVERAGE,
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
            },
            enableHoverMode: true,
            hapticFeedbackMode: HapticFeedbackMode.AUTO,
            mask: { backgroundBlurStyle: BlurStyle.Thick },
            modalMode: ModalMode.NONE,
            previewScaleMode: PreviewScaleMode.CONSTANT,
            availableLayoutArea: AvailableLayoutArea.SAFE_AREA,
            keyboardAvoidMode: MenuKeyboardAvoidMode.TRANSLATE_AND_RESIZE,
          })

        Text('isShow3')
          .id('isShownMenu_enum_3')
          .onClick(()=>{
            this.isShown3 = true
          })
          .bindContextMenu(this.isShown3!!, this.MyMenu, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_THIN,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
            },
            backgroundEffect: {
              radius: 60,
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
            },
            hapticFeedbackMode: HapticFeedbackMode.AUTO,
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_THIN },
            modalMode: ModalMode.TARGET_WINDOW,
            previewScaleMode: PreviewScaleMode.MAINTAIN
          })
      }.height('10%')

      Row(){
        Text('isShow4').margin({right:3})
          .id('isShownMenu_enum_4')
          .onClick(()=>{
            this.isShown4 = true
          })
          .bindContextMenu(this.isShown4!!, this.MyMenu, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_REGULAR,
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_REGULAR }
          })

        Text('isShow5').margin({right:3})
          .id('isShownMenu_enum_5')
          .onClick(()=>{
            this.isShown5 = true
          })
          .bindContextMenu(this.isShown5!!, this.MyMenu, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_THICK,
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_THICK }
          })

        Text('isShow6')
          .id('isShownMenu_enum_6')
          .onClick(()=>{
            this.isShown6 = true
          })
          .bindContextMenu(this.isShown6!!, this.MyMenu, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK,
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK }
          })
      }.height('10%')

      Row(){
        Text('isShow7').margin({right:3})
          .id('isShownMenu_enum_7')
          .onClick(()=>{
            this.isShown7 = true
          })
          .bindContextMenu(this.isShown7!!, this.MyMenu, {
            backgroundBlurStyle: BlurStyle.NONE,
            mask: { backgroundBlurStyle: BlurStyle.NONE }
          })

        Text('isShow8').margin({right:3})
          .id('isShownMenu_enum_8')
          .onClick(()=>{
            this.isShown8 = true
          })
          .bindContextMenu(this.isShown8!!, this.MyMenu, {
            backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THIN,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THIN }
          })

        Text('isShow9')
          .id('isShownMenu_enum_9')
          .onClick(()=>{
            this.isShown9 = true
          })
          .bindContextMenu(this.isShown9!!, this.MyMenu, {
            backgroundBlurStyle: BlurStyle.COMPONENT_THIN,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_THIN }
          })
      }.height('10%')

      Row(){
        Text('isShow10').margin({right:3})
          .id('isShownMenu_enum_10')
          .onClick(()=>{
            this.isShown10 = true
          })
          .bindContextMenu(this.isShown10!!, this.MyMenu, {
            backgroundBlurStyle: BlurStyle.COMPONENT_REGULAR,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_REGULAR }
          })

        Text('isShow11').margin({right:3})
          .id('isShownMenu_enum_11')
          .onClick(()=>{
            this.isShown11 = true
          })
          .bindContextMenu(this.isShown11!!, this.MyMenu, {
            backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_THICK }
          })

        Text('isShow12')
          .id('isShownMenu_enum_12')
          .onClick(()=>{
            this.isShown12 = true
          })
          .bindContextMenu(this.isShown12!!, this.MyMenu, {
            backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THICK,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THICK }
          })
      }.height('10%')

      Row(){
        Text('isShow13').margin({right:3})
          .id('isShownMenu_enum_13')
          .onClick(()=>{
            this.isShown13 = true
          })
          .bindContextMenu(this.isShown13!!, this.MyMenu, {
            mask: { backgroundBlurStyle: BlurStyle.Thin }
          })

        Text('isShow14').margin({right:3})
          .id('isShownMenu_enum_14')
          .onClick(()=>{
            this.isShown14 = true
          })
          .bindContextMenu(this.isShown14!!, this.MyMenu, {
            mask: true
          })

        Text('isShow15')
          .id('isShownMenu_enum_15')
          .onClick(()=>{
            this.isShown15 = true
          })
          .bindContextMenu(this.isShown15!!, this.MyMenu, {
            mask: false
          })
      }.height('10%')

    }.width('100%')
    .height('100%')
  }
}
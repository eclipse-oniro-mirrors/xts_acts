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
struct bindContextMenuNullUndefinedExample {

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '菜单1' }).id('bindContextMenu_nullUn')
      MenuItem({ content: '菜单2' })
    }
  }

  build() {
    Column() {
      // ========== bindContextMenu tests ==========
      Text('bindContextMenu')
      Row(){
        Button('null1')
          .id('bindContextMenu_content_null')
          .bindContextMenu(null)

        Button('undefined1')
          .id('bindContextMenu_content_undefined')
          .bindContextMenu(undefined)
      }.height('10%')

      Row(){
        Button('null2')
          .id('bindContextMenu_responseType_null')
          .bindContextMenu(this.MyMenu, null)

        Button('undefined2')
          .id('bindContextMenu_responseType_undefined')
          .bindContextMenu(this.MyMenu, undefined)
      }.height('10%')

      Row(){
        Button('null3')
          .id('bindContextMenu_options_null')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, null)

        Button('undefined3')
          .id('bindContextMenu_options_undefined')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, undefined)
      }.height('10%')

      Row(){
        Text('enum1').margin({right:3})
          .id('bindContextMenu_enum_1')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
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

        Text('enum2').margin({right:3})
          .id('bindContextMenu_enum_2')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
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

        Text('enum3')
          .id('bindContextMenu_enum_3')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
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
        Text('enum4').margin({right:3})
          .id('bindContextMenu_enum_4')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_REGULAR,
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_REGULAR }
          })

        Text('enum5').margin({right:3})
          .id('bindContextMenu_enum_5')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_THICK,
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_THICK }
          })

        Text('enum6')
          .id('bindContextMenu_enum_6')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK,
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK }
          })
      }.height('10%')

      Row(){
        Text('enum7').margin({right:3})
          .id('bindContextMenu_enum_7')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            backgroundBlurStyle: BlurStyle.NONE,
            mask: { backgroundBlurStyle: BlurStyle.NONE }
          })

        Text('enum8').margin({right:3})
          .id('bindContextMenu_enum_8')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THIN,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THIN }
          })

        Text('enum9')
          .id('bindContextMenu_enum_9')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            backgroundBlurStyle: BlurStyle.COMPONENT_THIN,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_THIN }
          })
      }.height('10%')

      Row(){
        Text('enum10').margin({right:3})
          .id('bindContextMenu_enum_10')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            backgroundBlurStyle: BlurStyle.COMPONENT_REGULAR,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_REGULAR }
          })

        Text('enum11').margin({right:3})
          .id('bindContextMenu_enum_11')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_THICK }
          })

        Text('enum12')
          .id('bindContextMenu_enum_12')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THICK,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THICK }
          })
      }.height('10%')

      Row(){
        Text('enum13').margin({right:3})
          .id('bindContextMenu_enum_13')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            mask: { backgroundBlurStyle: BlurStyle.Thin }
          })

        Text('enum14').margin({right:3})
          .id('bindContextMenu_enum_14')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            mask: true
          })

        Text('enum15')
          .id('bindContextMenu_enum_15')
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            mask: false
          })
      }.height('10%')

    }.width('100%')
    .height('100%')
  }
}
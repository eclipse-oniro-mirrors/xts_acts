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
struct bindContextMenuWithResponseNullUndefined {
  @State longPress: string = 'LONG_PRESS';

  @Builder
  MenuBuilderWithParam(type: ResponseType) {
    Column() {
      if (type === ResponseType.LongPress) {
        Menu() {
          MenuItem({ content: '菜单1' }).id('longTextId_withParam_un')
          MenuItem({ content: '菜单2' })
        }
      }
    }
  }

  build() {
    Column() {
      // ========== bindContextMenuWithResponse tests ==========
      Text('bindContextMenuWithResponse')
      Row(){
        Button('null1')
          .id('bindContextMenuWithResponse_content_null')
          .bindContextMenuWithResponse(null)

        Button('undefined1')
          .id('bindContextMenuWithResponse_content_undefined')
          .bindContextMenuWithResponse(undefined)
      }.height('10%')

      Row(){
        Button('null2')
          .id('bindContextMenuWithResponse_options_null')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, null)

        Button('undefined2')
          .id('bindContextMenuWithResponse_options_undefined')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, undefined)
      }.height('10%')

      Row(){
        Text('enum1').margin({right:3})
          .id('bindContextMenuWithResponse_enum_1')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
            enableArrow: false,
            preview: MenuPreviewMode.NONE,
            previewAnimationOptions: {
              hoverScaleInterruption: false
            },
            backgroundBlurStyle: BlurStyle.Thin,
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
            mask: false,
            modalMode: ModalMode.AUTO,
            previewScaleMode: PreviewScaleMode.AUTO,
            availableLayoutArea: AvailableLayoutArea.SAFE_AREA,
            keyboardAvoidMode: MenuKeyboardAvoidMode.NONE,
          })

        Text('enum2').margin({right:3})
          .id('bindContextMenuWithResponse_enum_2')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
            enableArrow: true,
            preview: MenuPreviewMode.IMAGE,
            previewAnimationOptions: {
              hoverScaleInterruption: true
            },
            backgroundBlurStyle: BlurStyle.Regular,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
            },
            backgroundEffect: {
              radius: 60,
              adaptiveColor: AdaptiveColor.AVERAGE,
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
            },
            enableHoverMode: true,
            hapticFeedbackMode: HapticFeedbackMode.ENABLED,
            mask: true,
            modalMode: ModalMode.NONE,
            previewScaleMode: PreviewScaleMode.CONSTANT,
            availableLayoutArea: AvailableLayoutArea.SAFE_AREA,
            keyboardAvoidMode: MenuKeyboardAvoidMode.TRANSLATE_AND_RESIZE,
          })

        Text('enum3')
          .id('bindContextMenuWithResponse_enum_3')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
            backgroundBlurStyle: BlurStyle.Thick,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
            },
            backgroundEffect: {
              radius: 60,
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
            },
            hapticFeedbackMode: HapticFeedbackMode.AUTO,
            mask: { backgroundBlurStyle: BlurStyle.Thick },
            modalMode: ModalMode.TARGET_WINDOW,
            previewScaleMode: PreviewScaleMode.MAINTAIN
          })
      }.height('10%')

      Row(){
        Text('enum4').margin({right:3})
          .id('bindContextMenuWithResponse_enum_4')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_THIN,
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_THIN },
          })

        Text('enum5').margin({right:3})
          .id('bindContextMenuWithResponse_enum_5')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_REGULAR,
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_REGULAR }
          })

        Text('enum6')
          .id('bindContextMenuWithResponse_enum_6')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_THICK,
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_THICK }
          })
      }.height('10%')

      Row(){
        Text('enum7').margin({right:3})
          .id('bindContextMenuWithResponse_enum_7')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
            backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK,
            mask: { backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK }
          })

        Text('enum8').margin({right:3})
          .id('bindContextMenuWithResponse_enum_8')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
            backgroundBlurStyle: BlurStyle.NONE,
            mask: { backgroundBlurStyle: BlurStyle.NONE }
          })

        Text('enum9')
          .id('bindContextMenuWithResponse_enum_9')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
            backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THIN,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THIN }
          })
      }.height('10%')

      Row(){
        Text('enum10').margin({right:3})
          .id('bindContextMenuWithResponse_enum_10')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
            backgroundBlurStyle: BlurStyle.COMPONENT_THIN,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_THIN }
          })

        Text('enum11').margin({right:3})
          .id('bindContextMenuWithResponse_enum_11')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
            backgroundBlurStyle: BlurStyle.COMPONENT_REGULAR,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_REGULAR }
          })

        Text('enum12')
          .id('bindContextMenuWithResponse_enum_12')
          .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
            backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
            mask: { backgroundBlurStyle: BlurStyle.COMPONENT_THICK }
          })
      }.height('10%')

      Text('enum13').height('10%')
        .id('bindContextMenuWithResponse_enum_13')
        .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
          backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THICK,
          mask: { backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THICK }
        })

    }.width('100%')
    .height('100%')
  }
}
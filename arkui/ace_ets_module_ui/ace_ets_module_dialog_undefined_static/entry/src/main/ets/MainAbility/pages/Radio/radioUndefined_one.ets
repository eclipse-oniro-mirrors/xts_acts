'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, Row, Radio, UIContext, $r, Placement, PopupOptions,
  PopupButton, DismissPopupAction, PopupStateChangeCallback, PopupStateChangeParam, KeyboardAvoidMode, DismissReason,
  CustomDialogController, CustomDialog, CustomDialogControllerOptions, TextInput, BlurStyle, BlurStyleActivePolicy, BackgroundBlurStyleOptions,
  Color, BackgroundEffectOptions, DismissDialogAction, RadioConfiguration, ResourceColor, WrappedBuilder,Circle, ContentModifier,
  wrapBuilder, Builder, LengthMetrics, DialogAlignment, BorderStyle, ButtonType, CustomPopupOptions,
  RatingConfiguration, Rating, Visibility, CircleOptions, StarStyleOptions, Margin
} from '@ohos.arkui.component';

import{State, Link } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'

type RadioBuilder = @Builder (config: RadioConfiguration) => void;

class MyRadioStyle implements ContentModifier<RadioConfiguration> {
  type: number = 0;
  selectedColor: ResourceColor = Color.Black;

  constructor(numberType: number, colorType: ResourceColor) {
    this.type = numberType;
    this.selectedColor = colorType;
  }

  applyContent(): WrappedBuilder<RadioBuilder> {
    return wrapBuilder(buildRadio);
  }
}

@Builder
function buildRadio(config: RadioConfiguration) {
  Row() {
    Circle({ width: 50, height: 50 })
      .stroke(Color.Black)
      .fill(config.checked ? (config.contentModifier as MyRadioStyle).selectedColor : Color.White)
    Button(config.checked ? 'off' : 'on')
      .width(100)
      .type(config.checked ? ButtonType.Capsule as ButtonType : ButtonType.Normal as ButtonType)
      .backgroundColor('#2787D9')
      .onClick(() => {
        if (config.checked) {
          config.triggerChange(false);
        } else {
          config.triggerChange(true);
        }
      })
    Text('test demo').id('text_1')
  }
}

@Entry
@Component
struct MyStateSample {
  @State public isUndefined: boolean = true;
  build() {
    Column() {
      Row() {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .contentModifier(this.isUndefined? new MyRadioStyle(1, '#004AAF') : undefined)
          .checked(false)
          .width(300)
          .height(100)
          .id('radio_1')
      }

      Row() {
        Button('btn : ' + this.isUndefined)
          .id('Radio_btn')
          .onClick((e: ClickEvent) => {
            this.isUndefined = !this.isUndefined
          })
      }
    }
  }
}
'use static'


import { Entry, Text, Column, Component, Button, ClickEvent, TextArea, TextInput, InputCounterOptions, Row, Scroll,
  AttributeModifier, TextAreaAttribute, TextInputAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyTextInputModifier implements AttributeModifier<TextInputAttribute> {
  public isUndefined: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isUndefined) {
      instance.showCounter(undefined);
    } else {
      instance.showCounter(true);
    }
  }
}


@Observed
class ThresholdPercentage implements AttributeModifier<TextInputAttribute> {
  public isUndefined: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isUndefined) {
      instance.showCounter(true,
        { thresholdPercentage: 50.0, highlightBorder: true } as InputCounterOptions)
    } else {
      instance.showCounter(true,
        { thresholdPercentage: undefined, highlightBorder: true } as InputCounterOptions)
    }
  }
}


@Observed
class HighlightBorder implements AttributeModifier<TextInputAttribute> {
  public isUndefined: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isUndefined) {
      instance.showCounter(true,
        { thresholdPercentage: 50.0, highlightBorder: false } as InputCounterOptions);
    } else {
      instance.showCounter(true,
        { thresholdPercentage: 50.0, highlightBorder: undefined } as InputCounterOptions);
    }
  }
}


@Entry
@Component
struct TextAreaShowCounterModifier {
  @State isShowCounterUndefined: boolean = false;
  @State textInputModifier: MyTextInputModifier = new MyTextInputModifier();
  @State textInputModifierThresholdPercentage: ThresholdPercentage = new ThresholdPercentage();
  @State textInputModifierHighlightBorder: HighlightBorder = new HighlightBorder();

  build() {
    Scroll() {
      Column() {
        Text('-----Modifier-----')
        Button('Modifier_change').id('TextAreaShowCounterModifierButton')
          .onClick((event: ClickEvent) => {
            this.textInputModifier.isUndefined = !this.textInputModifier.isUndefined;
            this.textInputModifierThresholdPercentage.isUndefined = 
            !this.textInputModifierThresholdPercentage.isUndefined;
            this.textInputModifierHighlightBorder.isUndefined = !this.textInputModifierHighlightBorder.isUndefined;
          })

        Column() {
          Text('---InputCounterOptions---')
          Text('---TextInput---')
          TextInput({ text: 'This is TextInput' })
            .key('TextAreaShowCounterModifier_001')
            .height(80)
            .width(400)
            .attributeModifier(this.textInputModifier)


          Column() {
            Text('---thresholdPercentage---')
            Text('---TextInput---')
            TextInput({ text: 'This is TextInput' })
              .key('TextAreaShowCounterModifier_002')
              .height(80)
              .width(400)
              .attributeModifier(this.textInputModifierThresholdPercentage)


            Column() {
              Text('---highlightBorder---')
              Text('---TextInput---')
              TextInput({ text: 'This is TextInput' })
                .key('TextAreaShowCounterModifier_003')
                .height(80)
                .width(400)
                .attributeModifier(this.textInputModifierHighlightBorder)

            }
          }.width('100%')
        }
      }
      }
  }
}
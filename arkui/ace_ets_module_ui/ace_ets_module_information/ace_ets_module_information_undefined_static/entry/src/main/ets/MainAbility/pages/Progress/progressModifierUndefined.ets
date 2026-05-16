'use static'
import {
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Path,
  Progress,
  Row,
  Text,
  ClickEvent,
  ProgressConfiguration,
  WrappedBuilder,
  Builder,
  ProgressStyleOptions,
  ContentModifier,
  wrapBuilder,
  ColumnOptions,
  Flex,
  FlexOptions,
  FlexAlign,
  Margin,
  ProgressType,
  ProgressAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

type ProgressBuilder = @Builder(config:ProgressConfiguration) => void;

export class MyProgressModifier implements ContentModifier<ProgressConfiguration> {
  public color: Color = Color.White

  constructor(color: Color) {
    this.color = color
  }

  applyContent(): WrappedBuilder<ProgressBuilder> {
    return wrapBuilder(myProgress)
  }
}

@Builder
function myProgress(config: ProgressConfiguration) {
  Column({ space: 30 } as ColumnOptions) {
    Text('Current progress is:' + config.value + '/' + config.total).fontSize(20).id('ProgressContentModifierM_total')
    Row() {
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Path()
          .width('30%')
          .height('30%')
          .commands('M108 0 L141 70 L218 78.3 L162 131 L175 205 L108 170 L41.2 205 L55 131 L1 78 L75 68 L108 0 Z')
          .fill(config.enabled && config.value >= 1 ? (config.contentModifier as MyProgressModifier).color :
            Color.White)
          .stroke(Color.Black)
          .strokeWidth(3)
        Path()
          .width('30%')
          .height('30%')
          .commands('M108 0 L141 70 L218 78.3 L162 131 L175 205 L108 170 L41.2 205 L55 131 L1 78 L75 68 L108 0 Z')
          .fill(config.enabled && config.value >= 2 ? (config.contentModifier as MyProgressModifier).color :
            Color.White)
          .stroke(Color.Black)
          .strokeWidth(3)
        Path()
          .width('30%')
          .height('30%')
          .commands('M108 0 L141 70 L218 78.3 L162 131 L175 205 L108 170 L41.2 205 L55 131 L1 78 L75 68 L108 0 Z')
          .fill(config.enabled && config.value >= 3 ? (config.contentModifier as MyProgressModifier).color :
            Color.White)
          .stroke(Color.Black)
          .strokeWidth(3)
      }.width('100%')
    }
  }.margin({ bottom: 100 } as Margin)
}

@Observed
export class MyModifier1 implements AttributeModifier<ProgressAttribute> {
  public colorValue: boolean = true;
  public privacySensitiveValue: boolean = true;
  public styleValue: boolean = true;
  public valueValue: boolean = true;
  public progressStyle: ProgressStyleOptions = {
    strokeWidth: 15,
    scaleCount: 15,
    scaleWidth: 5
  };

  applyNormalAttribute(instance: ProgressAttribute): void {
    instance
      .color(this.colorValue ? undefined : Color.Red)
      .privacySensitive(this.privacySensitiveValue ? undefined : true)
      .style(this.styleValue ? undefined : this.progressStyle)
      .value(this.valueValue ? undefined : 50.0)
  }
}

@Observed
export class MyModifier2 implements AttributeModifier<ProgressAttribute> {
  public contentModifierValue: boolean = true;
  public modifier: MyProgressModifier = new MyProgressModifier(Color.Red);
  public progressStyle: ProgressStyleOptions = {
    strokeWidth: 15,
    scaleCount: 15,
    scaleWidth: 5
  };

  applyNormalAttribute(instance: ProgressAttribute): void {
    instance
      .contentModifier(this.contentModifierValue ? undefined : this.modifier)
  }
}

@Entry
@Component
struct Index {
  @State myModifier1: MyModifier1 = new MyModifier1();
  @State myModifier2: MyModifier2 = new MyModifier2();

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Progress({ value: 0})
        .id('ProgressM_0')
      Progress({ value: 0.0 })
        .id('ProgressM_1')
        .attributeModifier(this.myModifier1)

      Progress({ value: 1, total: 3, type: ProgressType.Ring })
        .id('ProgressM_2')
        .attributeModifier(this.myModifier2)

      Column({ space: 5 } as ColumnOptions) {
        Button('' + this.myModifier1.colorValue)
          .id('ProgressM_colorValue')
          .onClick((e: ClickEvent) => {
            this.myModifier1.colorValue = !this.myModifier1.colorValue
          })
        Button('' + this.myModifier1.privacySensitiveValue)
          .id('ProgressM_privacySensitiveValue')
          .onClick((e: ClickEvent) => {
            this.myModifier1.privacySensitiveValue = !this.myModifier1.privacySensitiveValue
          })
        Button('' + this.myModifier1.styleValue)
          .id('ProgressM_styleValue')
          .onClick((e: ClickEvent) => {
            this.myModifier1.styleValue = !this.myModifier1.styleValue
          })
        Button('' + this.myModifier1.valueValue)
          .id('ProgressM_valueValue')
          .onClick((e: ClickEvent) => {
            this.myModifier1.valueValue = !this.myModifier1.valueValue
          })
        Button('' + this.myModifier2.contentModifierValue)
          .id('ProgressM_contentModifierValue')
          .onClick((e: ClickEvent) => {
            this.myModifier2.contentModifierValue = !this.myModifier2.contentModifierValue
          })

      }
    }
  }
}

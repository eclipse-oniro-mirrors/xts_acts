'use static'
import {
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Progress,
  Row,
  Text,
  ClickEvent,
  Path,
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
  ProgressType
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

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
    Text('Current progress is:' + config.value + '/' + config.total).fontSize(20).id('ProgressContentModifier_total')
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

@Entry
@Component
struct Index {
  @State colorValue: boolean = true;
  @State privacySensitiveValue: boolean = true;
  @State styleValue: boolean = true;
  @State valueValue: boolean = true;
  @State contentModifierValue: boolean = true;
  modifier: MyProgressModifier = new MyProgressModifier(Color.Red);
  progressStyle: ProgressStyleOptions = {
    strokeWidth: 15,
    scaleCount: 15,
    scaleWidth: 5
  };

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Progress({ value: 0})
        .id('Progress_0')
      Progress({ value: 0})
        .id('Progress_1')
        .color(this.colorValue ? undefined : Color.Red)
        .privacySensitive(this.privacySensitiveValue ? undefined : true)
        .style(this.styleValue ? undefined : this.progressStyle)
        .value(this.valueValue ? undefined : 50.0)

      Progress({ value: 1, total: 3, type: ProgressType.Ring })
        .id('Progress_2')
        .contentModifier(this.contentModifierValue ? undefined : this.modifier)

      Column({ space: 5 } as ColumnOptions) {
        Button('' + this.colorValue)
          .id('Progress_colorValue')
          .onClick((e: ClickEvent) => {
            this.colorValue = !this.colorValue
          })
        Button('' + this.privacySensitiveValue)
          .id('Progress_privacySensitiveValue')
          .onClick((e: ClickEvent) => {
            this.privacySensitiveValue = !this.privacySensitiveValue
          })
        Button('' + this.styleValue)
          .id('Progress_styleValue')
          .onClick((e: ClickEvent) => {
            this.styleValue = !this.styleValue
          })
        Button('' + this.valueValue)
          .id('Progress_valueValue')
          .onClick((e: ClickEvent) => {
            this.valueValue = !this.valueValue
          })
        Button('' + this.contentModifierValue)
          .id('Progress_contentModifierValue')
          .onClick((e: ClickEvent) => {
            this.contentModifierValue = !this.contentModifierValue
          })

      }
    }
  }
}

'use static'
import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  Scroll,
  Margin,
  Color,
  $r,
  Swiper,
  SwiperController,
  DotIndicator,
  ScrollState,
  SwiperAnimationEvent,
  TextAlign,
  Curve,
  SwiperContentWillScrollResult,
  SwiperAttribute,
  AttributeModifier,
  List,
  ForEach,
  Divider,
  OnSwiperAnimationStartCallback
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class SliderModifierTest0 implements AttributeModifier<SwiperAttribute>{
  public isUndefined: boolean = false;
  public index: int = 0;

  applyNormalAttribute(instance: SwiperAttribute):void{
    instance
      .onAnimationStart(this.isUndefined ? undefined : () => {
        console.info('qwe onAnimationStart 被执行')
        this.index += 1;
      } as OnSwiperAnimationStartCallback)
  }
}

@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController();
  @State modifier0:SliderModifierTest0 = new SliderModifierTest0()
  @State buttonText: string = 'false'
  @State index:int = 0;
  build() {
    Column() {
      Text(this.modifier0.index.toString()).id('swiper_onAnimationStart')
      Text('test modifier' )
      Button('isUndefined = ' + this.modifier0.isUndefined.toString())
        .onClick(() => {
          this.modifier0.isUndefined = !this.modifier0.isUndefined
        }).id('changeButton')
      Column() {
        Text('onAnimationStart').fontSize(20).margin(15).width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#AFEEEE')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        }).attributeModifier(this.modifier0)

        Divider().margin(10)

        // 2. 新增场景：onAnimationStart固定触发（打印索引）
        Text('onAnimationStart-固定触发(打印当前索引)')
          .fontSize(20)
          .margin(15)
          .width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#ff87CEFA')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        })
          .onAnimationStart((index: int) => {
            console.info("固定触发：开始滑动，当前索引为 " + index);
          } as OnSwiperAnimationStartCallback)
        Divider().margin(10)

        // 3. 新增场景：onAnimationStart默认值（不设置该属性）
        Text('onAnimationStart-默认值(不设置属性)')
          .fontSize(20)
          .margin(15)
          .width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#ff98FB98')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        })
      }
    }.width('100%')
  }
}
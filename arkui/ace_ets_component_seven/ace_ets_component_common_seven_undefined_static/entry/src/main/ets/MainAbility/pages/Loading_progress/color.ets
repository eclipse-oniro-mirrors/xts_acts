'use static';
import { Scroll,Scroller,ContentModifier,FontWeight,Gauge,TextAlign,TextOverflow,ForEach,wrapBuilder,Circle,Builder,Row,LoadingProgress,List,Gauge,ListItem,WrappedBuilder,ContentModifier,LoadingProgressConfiguration,ResourceColor, Color, QRCode, Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { UIContext } from '@ohos.arkui.UIContext'


// xxx.ets
@Entry
@Component
struct LoadingProgressExample {

  @State color_:ResourceColor | undefined = Color.Red


  build() {
    Column() {
      LoadingProgress()
        .color(this.color_)
        .layoutWeight(1)
        .id('TestLoading_progressColor')

      Button('Change').onClick(() => {
        this.color_ = undefined;
      })
        .id('changeButton')
    }.width('100%')
  }
}
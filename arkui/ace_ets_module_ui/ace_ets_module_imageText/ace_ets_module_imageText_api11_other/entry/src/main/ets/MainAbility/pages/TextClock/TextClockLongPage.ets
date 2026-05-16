/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct TextClockLongPage {
  @State accumulateTime: number = 0

  @State textShadow:string = '';
  @State fontFeature:string = '';

  @State visible: Visibility = Visibility.Visible

  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  // 导入对象
  controller: TextClockController = new TextClockController()
  scroller: Scroller = new Scroller()
  build() {
    Column(){
      List({scroller:this.scroller}){
        ListItem(){
          Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
            // 以12小时制显示东八区的系统时间，精确到秒。
            TextClock({ timeZoneOffset: -8, controller: this.controller })
              .textShadow({ radius: 2, color: Color.Black, offsetX: 2, offsetY: 2 })
              .fontFeature('\"ss01\" 1')
              .format('hh:mm')
              .onDateChange((value: number) => {
                this.accumulateTime = value
              })
              .key('textClock')
              .visibility(this.visible)
              .fontSize(20)
          }
          .width('100%')
          .height('10%')
        }
        ListItem(){
          Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
            // 以12小时制显示东八区的系统时间，精确到秒。
            TextClock({ timeZoneOffset: -8, controller: this.controller })
              .format('aa hh:mm:ss')
              .onDateChange((value: number) => {
                this.accumulateTime = value
              })
              .visibility(this.visible)
              .fontSize(20)
          }
          .width('100%')
          .height('10%')
        }
        ListItem(){
          Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }){
            Button("start")
              .onClick(() => {
                // 启动文本时钟
                let strJson = getInspectorByKey('textClock');
                this.textShadow = JSON.parse(strJson).$attrs.textShadow.slice(0,5)
                this.fontFeature = JSON.parse(strJson).$attrs.fontFeature
                this.controller.start()
              }).height('5%').fontSize(10).id('start')
            Button("stop")
              .onClick(() => {
                // 停止文本时钟
                this.controller.stop()
              }).height('5%').fontSize(10).id('stop')
            Button("show")
              .onClick(() => {
                // 显示控价
                this.visible = Visibility.Visible
              }).height('5%').fontSize(10).id('show')
            Button("hide")
              .onClick(() => {
                // 隐藏控件
                this.visible = Visibility.Hidden
              }).height('5%').fontSize(10).id('hide')
          }
          .width('100%')
        }
        ListItem(){
          Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }){
            Button('滚动到底部').onClick(()=>{
              this.scroller.scrollEdge(Edge.Bottom)
            }).height('5%').fontSize(10).id('TextClockLongBottom')
          }
        }
        ListItem(){
          Text('监控onDateChange事件：'+this.accumulateTime)
            .width("100%").textAlign(TextAlign.Center).id('accumulateTime1')
        }.height('10%')
        ListItem(){
          Text(this.textShadow+":"+this.fontFeature).width("100%").textAlign(TextAlign.Center)
        }.height('10%').id('textShadowOrFontFeature')
        ForEach(this.arr,(item:number) => {
          ListItem(){
            Text('ListItem'+item).width("100%").textAlign(TextAlign.Center)
          }.height('10%')
        },(item: string) => item)
        ListItem(){
          Text('监控onDateChange事件：'+this.accumulateTime)
            .width("100%").textAlign(TextAlign.Center).id('accumulateTime2')
        }.height('10%').margin({bottom:50})
      }
    }
  }
}
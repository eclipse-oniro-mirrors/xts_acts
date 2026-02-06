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

//单个手指、手势事件禁用
@Entry
@Component
struct gestureEnabled1 {
  @State value: string = 'Gesture enabled false'
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right })

  build() {
    Column() {
      Text('初始值').key("value")
        .onClick(() => {
          this.value = 'Gesture enabled false'
        })
      // 触发反馈
      Text(this.value).key('gestureText')
      List({space:20, initialIndex:0}){
        ListItem(){
          Text('TapGesture enabled_true').fontSize(15).key('gestureOnce')
            .gesture(
              TapGesture()
                .onAction((event: GestureEvent) => {
                  this.value = 'TapGesture单击 已触发'
                })
            ).enabled(true)
        }

        ListItem(){
          Text('TapGesture once').fontSize(15).key('gesture1')
            .gesture(
              TapGesture()
                .onAction((event: GestureEvent) => {
                  this.value = 'TapGesture单击 已触发'
                })
            ).enabled(false)
        }

        ListItem(){
          Text('TapGesture twice').fontSize(15).key('gesture2')
            .gesture(
              TapGesture({ count: 2 })
                .onAction((event: GestureEvent) => {
                  this.value = 'TapGesture双击 已触发'
                })
            ).enabled(false)
        }

        ListItem(){
          Text('LongPress').fontSize(15).key('gesture3')
            // 长按文本触发该手势事件
            .gesture(
              LongPressGesture({ repeat: true })
                // 由于repeat设置为true，长按动作存在时会连续触发，触发间隔为duration（默认值500ms）
                .onAction((event: GestureEvent) => {
                  if (event.repeat) {
                    this.value = 'LongPress onAction 已触发'
                  }
                })
                .onActionEnd(() => {
                  this.value = 'LongPress onActionEnd 已触发'
                })
                .onActionCancel(() => {
                  this.value = 'LongPress onActionCancel 已触发'
                })
            ).enabled(false)
        }

        ListItem(){
          Text('PanGesture').fontSize(15).id('gesture4')
            // 拖动文本触发该手势事件
            .gesture(
              PanGesture(this.panOption)
                .onActionStart((event: GestureEvent) => {
                  this.value = '拖动onActionStart 已触发'
                  console.info('Pan start')
                })
                .onActionUpdate((event: GestureEvent) => {
                  this.value = '拖动onActionUpdate 已触发'
                })
                .onActionEnd(() => {
                  this.value = '拖动onActionEnd 已触发'
                  console.info('Pan end')
                })
                .onActionCancel(() => {
                  this.value = '拖动onActionCancel 已触发'
                })
            ).enabled(false)
        }
      }
    }
    .height('90%')
    .width('100%')
  }
}




/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {MessageManager,Callback} from '../../common/MessageManager';

@Entry
@Component
struct Gauge3Example {
  @State startAngle:number = 0;
  @State endAngle:number = 0;
  @State colors:Array<[number,number]> = [[0x317AF7, 0.1], [0x5BA854, 0.2], [0xE08C3A, 0.3], [0x9C554B, 0.4]]
  @State strokeWidth:number = 0;
  @State value:number = 30;
  @State min:number = 0;
  @State max:number = 100;
  @State wth:number = 100;

  messageManager:MessageManager = new MessageManager()
  onPageShow() {
    console.info('Gauge onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'startAngle') {
          this.startAngle = message.value
      }
      if (message.name == 'endAngle') {
          this.endAngle = message.value
      }
      if (message.name == 'colors') {
          this.colors = message.value
      }
      if (message.name == 'strokeWidth') {
          this.strokeWidth = message.value
      }
      if (message.name == 'value') {
          this.value = message.value
      }
      if (message.name == 'min') {
          this.min = message.value
      }
      if (message.name == 'max') {
          this.max = message.value
      }
      if (message.name == 'wth') {
          this.wth = message.value
      }
    }
    this.messageManager.registerCallback(callback)

  }

  build() {
    Column({ space: 20 }) {
      // 使用默认的min和max为0-100，角度范围默认0-360，value值设置
      // 参数中设置当前值为75
      Gauge({ value: 75 })
        .width(200).height(200)
        .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])

      // 参数设置当前值为75，属性设置值为25，属性设置优先级高
      Gauge({ value: 75 })
        .value(25) // 属性和参数都设置时以参数为准
        .width(200).height(200)
        .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])

      // 210--150度环形图表
      Gauge({ value: this.value, min: this.min, max: this.max })
        .startAngle(this.startAngle)
        .endAngle(this.endAngle)
        .colors(this.colors)
        .strokeWidth(this.strokeWidth)
        .width(this.wth)
        .height(200).key('guage')
    }.width('100%').margin({ top: 5 })
  }
}
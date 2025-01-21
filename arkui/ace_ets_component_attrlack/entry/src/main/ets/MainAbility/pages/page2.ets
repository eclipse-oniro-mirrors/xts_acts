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

//在second页面中接收传递过来的参数
import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter';
import Log from '../common/Log.ets';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct Second {
  private content: string = "这是第二页"
  @State text: string = router.getParams()['text']
  @State data: number[] = router.getParams()['data']
  @State secondData : string = ''

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(`${this.content}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Text(this.text)
        .fontSize(30)
        .key("SingleDataText")
        .onClick(()=>{
          this.secondData = (this.data[1]).toString()
          try {
            var backData = {
              data: {
                "ArrayData": this.secondData
              }
            }
            let backEvent = {
              eventId: 102,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("page1 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("page1 emit action state err: " + JSON.stringify(err.message))
          }
        })
        .margin({top:20})
      Text('第一页传来的数值是' + '  ' + this.secondData)
        .fontSize(20)
        .margin({top:20})
        .backgroundColor('red')
    }
    .width('100%')
    .height('100%')
  }
}

/*
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

import common from '@ohos.app.ability.common';
import commonEventManager from '@ohos.commonEventManager';

let subscriber;

@Entry
@Component
struct Index {
  @State simpleList: Array<String> = []

  aboutToDisappear(){
    commonEventManager.unsubscribe(subscriber)
  }

  aboutToAppear(){
    this.simpleList.push('结果：')
    commonEventManager.createSubscriber({events: ['show_msg']}).then(data => {
      console.info("StartupTest index createSubscriber success")
      subscriber = data;
      commonEventManager.subscribe(subscriber, (err, data)=>{
        console.info("StartupTest show msg receive event, data = " + JSON.stringify(data))
        let msg:string = data.parameters.msg as string
        this.simpleList.push(msg)
      })
    })
  }

  build() {
    Column() {
      ForEach(this.simpleList, (item: string) => {
        Text(item)
          .fontSize('24px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '3px', right: '3px', bottom: '3px', left:'3px'})
          .margin({bottom:'5px'})
      }, (item: string) => item)
      
    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Start)
  }
}
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
import {MessageManager,Callback} from './../../../common/MessageManager';
@Entry
@Component
struct RelativeContainer_Vertical {
  @State addalign : VerticalAlign = VerticalAlign.Top
  messageManager:MessageManager = new MessageManager()
  onPageShow() {
    console.info('RelativeContainer_Vertical onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addalign') {
        this.addalign = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Row() {
      RelativeContainer() {
        Button("Button1").width(120).height(30)
          .alignRules({
            center:{anchor:"__container__",align:VerticalAlign.Center}
          })
          .key("RelativeContainer_Vertical_bt1")
          .id("RelativeContainer_Vertical_bt1").borderWidth(5).borderColor(Color.Black)

        Text("This is text").fontSize(20).padding(10)
          .alignRules({
            bottom:{anchor:"__container__",align:VerticalAlign.Bottom},
            top:{anchor:"RelativeContainer_Vertical_bt1",align:this.addalign},
            left:{anchor:"RelativeContainer_Vertical_bt1",align:HorizontalAlign.End}
          })
          .key("RelativeContainer_Vertical_tx2")
          .id("RelativeContainer_Vertical_tx2").borderWidth(2).borderColor(Color.Green)
          .height(30)
          .width(250)
      }
      .width(300).height(300)
      .border({width:2, color: "#6699FF"})
    }
    .height('100%')
  }
}
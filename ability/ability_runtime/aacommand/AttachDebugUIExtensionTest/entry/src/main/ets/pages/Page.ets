/*
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
struct Page {
  @State message: string = 'Hello World';
  private myProxy: UIExtensionProxy;

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)

        UIExtensionComponent({
          bundleName: 'com.acts.attachdebuguiextensiontest',
          abilityName: 'UIExtAbility'
        })
          .size({
            'width': '60%',
            'height': '60%'
          })
          .border({
            'width': 1,
            'color': Color.Gray
          })
          .margin(30)
      }
      .width('100%')
    }
    .height('100%')
  }
}
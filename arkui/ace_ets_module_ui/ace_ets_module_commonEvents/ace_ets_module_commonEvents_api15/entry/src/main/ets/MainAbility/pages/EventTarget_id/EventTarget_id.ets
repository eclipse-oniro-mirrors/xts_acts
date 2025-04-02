/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct EventTarget_id {
  @State text: string = '-1'

  build() {
    Column() {
      Column({ space: 50 }) {
        Button('Click_ID')
          .width(100)
          .height(40)
          .id('click_id')
          .onClick((event?: ClickEvent) => {
            if(event){
              this.text ='id:'+event.target.id;
            }
          }, 20)

        Button('Click_Key')
          .width(100)
          .height(40)
          .key('click_key')
          .onClick((event?: ClickEvent) => {
            if(event){
              this.text ='id:'+event.target.id;
            }
          }, 20)
      }.margin(20)

      Text(this.text).margin(15).id('text')
    }.width('100%')
  }
}
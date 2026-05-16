/**
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
export default struct SpanOnHoverTest {

  build() {
    Column() {
      Text(){
        Span('this is test OnHover span!')
          .onHover((isHover:boolean,event:HoverEvent)=>{
            console.log('span onHover isHover:'+isHover)
            console.log('span onHover event'+JSON.stringify(event))
            AppStorage.SetOrCreate('spanIsHover',isHover)
            AppStorage.SetOrCreate('spanOnHoverEvent',JSON.stringify(event))
          })

      }
      .textAlign(TextAlign.Center)
      .id('on_hover_span_id')
      .margin({top:20})
    }.height('100%').width('100%')
  }
}
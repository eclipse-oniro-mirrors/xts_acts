/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct onTouchInterceptTest {
  @State text: string = ''
  isPolygon(event: TouchEvent) {
    return true;
  }

  build(){
    Row(){
      Column(){
        Text(this.text)
          .key('onTouchInterceptText')
          .backgroundColor(Color.Blue)


      }
      .width(400)
      .height(700)
      .key('onTouchIntercept')
      .backgroundColor(Color.Pink)
      .backgroundBrightness({ rate: 0.5, lightUpDegree:0.5})
      .onClick(()=>{
        console.log("Column click");
      })
      // 调用onTouchIntercept修改该组件的HitTestMode属性
      .onTouchIntercept((event : TouchEvent) => {
        this.text = JSON.stringify(event)
        if (this.isPolygon(event)) {
          return HitTestMode.None
        }
        return HitTestMode.Default
      })
    }
    .width('100%')
  }
}
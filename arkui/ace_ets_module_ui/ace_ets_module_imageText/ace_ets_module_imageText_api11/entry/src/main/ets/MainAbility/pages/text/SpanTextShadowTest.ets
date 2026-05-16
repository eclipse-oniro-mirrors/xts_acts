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
struct SpanTextShadowTest {
  @State text:string = '这是测试阴影文本'
  @State shadowOptions1:ShadowOptions={radius:1,type:ShadowType.COLOR,color:Color.Blue,offsetX:10,offsetY:10,fill:true}
  @State shadowOptions2:ShadowOptions={radius:-1,type:ShadowType.BLUR,color:Color.Green,offsetX:-10,offsetY:-10,fill:false}
  build() {
    Column() {
      Text(){
        Span(this.text)
          .textShadow(this.shadowOptions1)
          .id('spanTextShadow1')
      }.height('10%')
      Text(){
        Span(this.text)
          .textShadow(this.shadowOptions2)
          .id('spanTextShadow2')
      }.height('10%')
      Text(){
        Span(this.text)
          .textShadow([this.shadowOptions1,this.shadowOptions2])
          .id('spanTextShadow3')
      }.height('10%')
    }.width('100%').height('100%')
  }
}
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
struct MaxLinesOptionsTest {

  @State testText:string = 'this\n'+
    'is\n'+
    'long\n'+
    'long\n'+
    'long\n'+
    'long\n'+
    'test text'
  build() {
    Column() {
      TextArea({text:this.testText})
        .maxLines(2,{overflowMode:MaxLinesMode.CLIP})
        .fontSize(10)
        .textOverflow(TextOverflow.Clip)
        .id('TextAreaMaxLinesModeCLIP')
      TextArea({text:this.testText})
        .maxLines(2,{overflowMode:MaxLinesMode.SCROLL})
        .fontSize(10)
        .textOverflow(TextOverflow.Clip)
        .id('TextAreaMaxLinesModeSCROLL')
      TextArea({text:this.testText})
        .maxLines(2)
        .fontSize(10)
        .textOverflow(TextOverflow.Clip)
        .id('TextAreaMaxLinesModeNoSet')
      TextArea({text:this.testText})
        .maxLines(2,{overflowMode:undefined})
        .fontSize(10)
        .textOverflow(TextOverflow.Clip)
        .id('TextAreaMaxLinesModeUndefined')
    }
  }
}
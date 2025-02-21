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


@Entry
@Component
struct ImageAnalyzer1 {
  @State startImageAnalyzerFlag: string = "Init";
  @State stopImageAnalyzerFlag: string = "Init";
  xComponentController: XComponentController = new XComponentController()  
  private config: ImageAnalyzerConfig = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT]
  }

  build() {
    Column() {
      Text(this.startImageAnalyzerFlag).id('startImageAnalyzer_text')
      Text(this.stopImageAnalyzerFlag).id('stopImageAnalyzer_text')
      Button('start').id('startImageAnalyzer_button')
        .width(80)
        .height(80)
        .onClick(() => {
          this.xComponentController.startImageAnalyzer(this.config)
            .then(() => {
              console.log("analysis complete")              
            })
            .catch(() => {
              console.log("error code: ")
            })
          this.startImageAnalyzerFlag = "startImageAnalyzer succ"
        })
      Button('stop').id('stopImageAnalyzer_button')
        .width(80)
        .height(80)
        .onClick(() => {
          this.xComponentController.stopImageAnalyzer()
          this.stopImageAnalyzerFlag = "stopImageAnalyzer succ"
        })
      XComponent({
        id: 'xcomponent',
        type: XComponentType.TEXTURE,
        controller: this.xComponentController
      })
        .enableAnalyzer(true)
        .width('640px')
        .height('480px')
    }
    .width("100%")
  }
}
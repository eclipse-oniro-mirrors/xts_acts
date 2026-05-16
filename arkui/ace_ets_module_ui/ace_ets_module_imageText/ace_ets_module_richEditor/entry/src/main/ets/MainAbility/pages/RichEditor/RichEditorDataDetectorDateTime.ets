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

/**
 * RichEditor DataDetector DATE_TIME Test Page
 * 测试RichEditor组件的TextDataDetectorType.DATE_TIME属性
 */
@Entry
@Component
struct RichEditorDataDetectorDateTime {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State enableDetector: boolean = true;

  build() {
    Column({ space: 10 }) {
      Text('RichEditor DataDetector DATE_TIME Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .height('5%')

      // 测试1: TextDataDetectorType.DATE_TIME配置测试
      RichEditor(this.options)
        .id('richEditor_dataDetector_dateTime')
        .key('key_richEditor_dataDetector_dateTime')
        .onReady(() => {
          this.controller.addTextSpan('会议时间：2025年12月25日下午3点',
            {
              style:
              {
                fontSize: 16
              }
            })
        })
        .copyOptions(CopyOptions.InApp)
        .enableDataDetector(this.enableDetector)
        .dataDetectorConfig({
          types: [TextDataDetectorType.DATE_TIME],
          onDetectResultUpdate: (result: string) => {
            console.info('[RichEditorDataDetectorDateTime] onDetectResultUpdate: ' + result);
          }
        })
        .height('10%')
        .borderWidth(1)
        .padding(10)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

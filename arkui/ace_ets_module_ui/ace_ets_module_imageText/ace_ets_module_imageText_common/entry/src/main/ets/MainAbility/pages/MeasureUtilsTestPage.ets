/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { MeasureUtils } from '@kit.ArkUI';

@Entry
@Component
struct MeasureUtilsTestPage {
  private measureUtils: MeasureUtils = this.getUIContext().getMeasureUtils();
  @State measureTextResult: string = '未测试';
  @State measureTextSizeResult: string = '未测试';
  @State getParagraphsResult: string = '未测试';

  build() {
    Scroll() {
      Column({ space: 2 }) {
        Text('MeasureUtils Test Page')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .height('3%')

        Row({ space: 1 }) {
          Button('measureText null')
            .id('button_measureText_null')
            .onClick(() => {
              try {
                let result = this.measureUtils.measureText(null);
                AppStorage.setOrCreate('measureText_null', result);
                this.measureTextResult = `measureText null 调用成功，返回值: ${result}`;
              } catch (error) {
                this.measureTextResult = `measureText null 抛出异常: ${error}`;
              }
            })

          Button('measureText undefined')
            .id('button_measureText_undefined')
            .onClick(() => {
              try {
                let result = this.measureUtils.measureText(undefined);
                AppStorage.setOrCreate('measureText_undefined', result);
                this.measureTextResult = `measureText undefined 调用成功，返回值: ${result}`;
              } catch (error) {
                this.measureTextResult = `measureText undefined 抛出异常: ${error}`;
              }
            })
        }.height('3%')

        Row({ space: 1 }) {
          Button('measureTextSize null')
            .id('button_measureTextSize_null')
            .onClick(() => {
              try {
                let result = this.measureUtils.measureTextSize(null);
                AppStorage.setOrCreate('measureTextSize_null_width', result.width);
                AppStorage.setOrCreate('measureTextSize_null_height', result.height);
                this.measureTextSizeResult = `measureTextSize null 调用成功，返回值: ${JSON.stringify(result)}`;
              } catch (error) {
                this.measureTextSizeResult = `measureTextSize null 抛出异常: ${error}`;
              }
            })

          Button('measureTextSize undefined')
            .id('button_measureTextSize_undefined')
            .onClick(() => {
              try {
                let result = this.measureUtils.measureTextSize(undefined);
                AppStorage.setOrCreate('measureTextSize_undefined_width', result.width);
                AppStorage.setOrCreate('measureTextSize_undefined_height', result.height);
                this.measureTextSizeResult = `measureTextSize undefined 调用成功，返回值: ${JSON.stringify(result)}`;
              } catch (error) {
                this.measureTextSizeResult = `measureTextSize undefined 抛出异常: ${error}`;
              }
            })
        }.height('3%')

        Row({ space: 1 }) {
          Button('getParagraphs styledString null')
            .id('button_getParagraphs_null')
            .onClick(() => {
              try {
                let result = this.measureUtils.getParagraphs(null);
                AppStorage.setOrCreate('getParagraphs_null', result.length);
                this.getParagraphsResult = `getParagraphs styledString null 调用成功，返回值: ${result.length} 个段落`;
              } catch (error) {
                this.getParagraphsResult = `getParagraphs styledString null 抛出异常: ${error}`;
              }
            })

          Button('getParagraphs styledString undefined')
            .id('button_getParagraphs_undefined')
            .onClick(() => {
              try {
                let result = this.measureUtils.getParagraphs(undefined);
                AppStorage.setOrCreate('getParagraphs_undefined', result.length);
                this.getParagraphsResult = `getParagraphs styledString undefined 调用成功，返回值: ${result.length} 个段落`;
              } catch (error) {
                this.getParagraphsResult = `getParagraphs styledString undefined 抛出异常: ${error}`;
              }
            })
        }.height('3%')

        Row({ space: 1 }) {
          Button('getParagraphs options null')
            .id('button_getParagraphs_options_null')
            .onClick(() => {
              try {
                let styledString = new StyledString('Hello World');
                let result = this.measureUtils.getParagraphs(styledString, null);
                AppStorage.setOrCreate('getParagraphs_options_null', result.length);
                this.getParagraphsResult = `getParagraphs options null 调用成功，返回值: ${result.length} 个段落`;
              } catch (error) {
                this.getParagraphsResult = `getParagraphs options null 抛出异常: ${error}`;
              }
            })

          Button('getParagraphs options undefined')
            .id('button_getParagraphs_options_undefined')
            .onClick(() => {
              try {
                let styledString = new StyledString('Hello World');
                let result = this.measureUtils.getParagraphs(styledString, undefined);
                AppStorage.setOrCreate('getParagraphs_options_undefined', result.length);
                this.getParagraphsResult = `getParagraphs options undefined 调用成功，返回值: ${result.length} 个段落`;
              } catch (error) {
                this.getParagraphsResult = `getParagraphs options undefined 抛出异常: ${error}`;
              }
            })
        }.height('3%')

        Button('正常测试').height('3%')
          .onClick(() => {
            try {
              let textWidth = this.measureUtils.measureText({
                textContent: 'Hello World',
                fontSize: '50px'
              });
              this.measureTextResult = `正常测试成功，宽度: ${textWidth}`;

              let textSize = this.measureUtils.measureTextSize({
                textContent: 'Hello World',
                fontSize: '50px'
              });
              this.measureTextSizeResult = `正常测试成功，宽: ${textSize.width}, 高: ${textSize.height}`;

              let styledString = new StyledString('Hello World');
              let paragraphs = this.measureUtils.getParagraphs(styledString);
              this.getParagraphsResult = `正常测试成功，${paragraphs.length} 个段落`;
            } catch (error) {
              this.measureTextResult = `正常测试失败: ${error}`;
            }
          })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}

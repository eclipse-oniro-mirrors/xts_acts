/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct RichEditorStabillity004 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {
          for (let index = 0; index < 100; index++) {
            this.controller.addTextSpan('test_abc123456789abc-hello-word',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
          }
        })
        .barState(BarState.Auto)
        .borderWidth(1)
        .borderColor(Color.Green)
        .width('100%')
        .height('30%')
        .id('RichEditorStabillity004')
    }
  }
}
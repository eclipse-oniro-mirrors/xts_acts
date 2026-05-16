/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import { MeasureUtils } from '@ohos.arkui.UIContext';
import pointer from '@ohos.multimodalInput.pointer';
import uiContext, { CursorController } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ContextIndex {
  @State uiContext: UIContext = this.getUIContext();
  @State uiContextMeasure: MeasureUtils = this.uiContext.getMeasureUtils();
  cursorCustom: CursorController = this.getUIContext().getCursorController();
  @State textWidth: number = this.uiContextMeasure.measureText({
    textContent: 'Hello word',
    fontSize: '50px'
  })

  build() {
    Column() {
      Text(`${this.textWidth}`).key('ContextIndex').margin('50')
      Text(`${JSON.stringify(this.cursorCustom)}`).key('ContextText')

    }
    .height('100%')
  }
}
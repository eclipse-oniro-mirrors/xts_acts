/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
struct ConvertPositionWithWindow {
  private uiContext: UIContext = this.getUIContext();
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text(this.message)
        .id('testNodeAb')
      Button('运行convertPositionToWindow')
        .id('btn_convertPositionToWindow_id')
        .height('10%')
        .onClick(() => {
          const nodeA = this.uiContext.getAttachedFrameNodeById('testNodeAb');

          try {
            nodeA?.convertPositionToWindow(null);
            console.info(`win6 convertPositionToWindow 1 `);
          } catch (e) {
            console.info(`win6 convertPositionToWindow 1 ` + e.code);
            AppStorage.SetOrCreate('ConvertPositionToWindowNull', e.code);
          }

          try {
            nodeA?.convertPositionToWindow(undefined);
            console.info(`win6 convertPositionToWindow 2 `);
          } catch (e) {
            console.info(`win6 convertPositionToWindow 2 ` + e.code);
            AppStorage.SetOrCreate('ConvertPositionToWindowUndefined', e.code);
          }
        })

      Button('运行convertPositionFromWindow')
        .id('btn_convertPositionFromWindow_id')
        .height('10%')
        .onClick(() => {
          const nodeA = this.uiContext.getAttachedFrameNodeById('testNodeAb');

          try {
            nodeA?.convertPositionFromWindow(null);
            console.info(`win6 convertPositionFromWindow 1 `);
          } catch (e) {
            console.info(`win6 convertPositionFromWindow 1 ` + e.code);
            AppStorage.SetOrCreate('ConvertPositionFromWindowNull', e.code);
          }

          try {
            nodeA?.convertPositionFromWindow(undefined);
            console.info(`win6 convertPositionFromWindow 2 `);
          } catch (e) {
            console.info(`win6 convertPositionFromWindow 2 ` + e.code);
            AppStorage.SetOrCreate('ConvertPositionFromWindowUndefined', e.code);
          }
        })

    }
    .width('100%')
    .height('100%')
  }
}
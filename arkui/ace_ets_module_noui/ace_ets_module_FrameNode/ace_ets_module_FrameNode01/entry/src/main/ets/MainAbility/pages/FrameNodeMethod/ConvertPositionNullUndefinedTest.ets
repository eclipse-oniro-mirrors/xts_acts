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
struct ConvertPositionNullIndex {
  private uiContext: UIContext = this.getUIContext();
  @State message: string = 'Hello World';
  @State nodeAOk: boolean = false;
  @State nodeBOK: boolean = false;

  build() {
    Column() {
      Text(this.message)
        .id('testNodeAa')
        .height('10%')
        .onAppear(() => {
          this.nodeAOk = true
        })
      Column() {
        Text('testNodeB')
          .id('testNodeBb')
          .onAppear(() => {
            this.nodeBOK = true
          })
      }.height('10%')

      Button('运行convertPosition测试')
        .id('convertPosition_null_id')
        .height('10%')
        .onClick(() => {
          const nodeA = this.uiContext.getAttachedFrameNodeById('testNodeAa');
          const nodeB = this.uiContext.getAttachedFrameNodeById('testNodeBb');

          try {
            nodeA?.convertPosition({ x: 30, y: 10 }, null);
            console.info(`win6 convertPosition 1 `);
          } catch (e) {
            console.info(`win6 convertPosition 1 ` + e.code);
            AppStorage.SetOrCreate('ConvertPositionPositionNull', e.code);
          }

          try {
            nodeA?.convertPosition({ x: 30, y: 10 }, undefined);
            console.info(`win6 convertPosition 2 `);
          } catch (e) {
            console.info(`win6 convertPosition 2 ` + e.code);
            AppStorage.SetOrCreate('ConvertPositionPositionUndefined', e.code);
          }

          try {
            nodeA?.convertPosition(null, nodeB);
            console.info(`win6 convertPosition 3 `);
          } catch (e) {
            console.info(`win6 convertPosition 3 ` + e.code);
            AppStorage.SetOrCreate('ConvertPositionTargetNodeNull', e.code);
          }

          try {
            nodeA?.convertPosition(undefined, nodeB);
            console.info(`win6 convertPosition 4 `);
          } catch (e) {
            console.info(`win6 convertPosition 4 ` + e.code);
            AppStorage.SetOrCreate('ConvertPositionTargetNodeUndefined', e.code);
          }
        })

    }
    .width('100%')
    .height('100%')
  }
}
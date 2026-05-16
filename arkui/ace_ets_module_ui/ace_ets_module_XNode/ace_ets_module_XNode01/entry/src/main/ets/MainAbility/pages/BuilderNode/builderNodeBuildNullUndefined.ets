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

import { BuilderNode, NodeContent } from '@kit.ArkUI';

interface ParamsInterface {
  text: string;
  func: Function;
}

@Entry
@Component
struct builderNodeBuildNullUndefined {
  @State str: string = 'hello';
  private content: NodeContent = new NodeContent();

  build() {
    Column({space:5}) {
      Column({space:5}) {
        Text(this.str).height(30).id('builderNodeBuildNullUndefinedText')
        Button('addBuilderNode')
          .onClick(() => {
            try {
              let buildNode = new BuilderNode<[ParamsInterface]>(this.getUIContext());
              buildNode.build(null,null);
              buildNode.build(undefined,undefined);
              buildNode.build(null,null,null);
              buildNode.build(undefined,undefined,undefined);
              buildNode.dispose();
            } catch (error) {
              console.info('error code is error')
            }
            this.str = 'buildNodeBuild'
          })
          .width(110)
          .height(30)
          .id('builderNodeBuildNullUndefined')
        ContentSlot(this.content)
      }
    }
    .width('100%')
    .height('100%')
  }
}
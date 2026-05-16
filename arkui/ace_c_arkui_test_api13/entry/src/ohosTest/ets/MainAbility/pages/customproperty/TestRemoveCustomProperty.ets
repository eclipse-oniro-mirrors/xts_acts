/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import render from 'libnativerender.so'
import { CommonView } from '../../componet/CommonView';
import { FrameNode } from '@kit.ArkUI';

@Entry
@Component
struct TestRemoveCustomProperty {
  PAGE_TAG: string = 'TestRemoveCustomProperty';
  @State customPropertyValue: string  = 'Hello World';

  build(){
    Column() {
      CommonView({
        pageTag: this.PAGE_TAG,
      }).onAppear(() => {
        render.testRemoveCustomProperty(this.PAGE_TAG);
      })
      Button('CustomProperty').key('buttonCustomProperty')
        .onClick(()=>{
          let uiContext:UIContext = this.getUIContext();
          if (uiContext) {
            const node2: FrameNode | null = uiContext.getFrameNodeById('columnA') || null
            if (node2) {
              const key = 'CustomValueA';
              const property = node2.getCustomProperty(key);
              this.customPropertyValue = JSON.stringify(property);
            }
          }
        }).margin({top:4})
      Text(this.customPropertyValue + '').key('customPropertyValue')
    }
  }
}

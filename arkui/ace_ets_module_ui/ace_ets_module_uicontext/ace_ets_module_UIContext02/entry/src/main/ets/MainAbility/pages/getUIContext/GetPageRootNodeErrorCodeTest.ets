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
import { UIContext } from '@kit.ArkUI';

@Entry
@Component
struct GetPageRootNodeErrorCodeIndex {
  build() {
    Column() {
      Button('getPageRootNode 120007')
        .id('btn_getPageRootNode_code')
        .height('5%')
        .onClick((e: ClickEvent) => {
          const uiContext2 = new UIContext();
          try{
            uiContext2.getPageRootNode();
          } catch (e) {
            console.log(`jerry uicontext2.getPageRootNode=${e.code}`);
            AppStorage.SetOrCreate('GetPageRootNodeErrorCodeValue', e.code);
          }
        })

      Button('getPageRootNode')
        .id('btn_getPageRootNode_id')
        .height('5%')
        .onClick((e: ClickEvent) => {
          let uiContext = this.getUIContext();
          if (uiContext) {
            AppStorage.SetOrCreate('GetPageRootNodeTypeValue',uiContext.getPageRootNode()?.getNodeType());
            console.info('jerry uiContext.getPageRootNode ' + JSON.stringify(uiContext.getPageRootNode()?.getNodeType()));
          }
        })

    }
    .height('100%')
  }
}
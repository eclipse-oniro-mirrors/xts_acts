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
import { UIContext, UIObserver } from '@kit.ArkUI';
import { uiObserver } from '@kit.ArkUI';

AppStorage.setOrCreate('RouterPageUpdatePage_callBackFuncOnCount', 0)

export function callBackFunc(info: uiObserver.RouterPageInfo) {
  console.info('RouterPage state updated, called by ' + `${info.name}`);
  if (info.name == 'MainAbility/pages/UIObserver/RouterPageUpdatePage'){
    let count: number | undefined = AppStorage.get('RouterPageUpdatePage_callBackFuncOnCount');
    count = Number(count) + 1;
    AppStorage.setOrCreate('RouterPageUpdatePage_callBackFuncOnCount', count)
  }
}

@Entry
@Component
struct RouterPageUpdatePage {

  aboutToAppear(): void {
    let observer:UIObserver = this.getUIContext().getUIObserver();
    observer.on('routerPageUpdate',callBackFunc);
  }

  build() {
    Column(){
      Row(){
        Button('Push').onClick(()=>{
          this.getUIContext().getRouter().pushUrl({
            url:'pages/index/index'
          })
        }).id('RouterPageUpdate_btn_push')
        Button('off observer').onClick(() => {
          let observer:UIObserver = this.getUIContext().getUIObserver();
          observer.off('routerPageUpdate',callBackFunc);
        }).id('RouterPageUpdate_btn_off')
      }.height(44).width('100%').margin({bottom:20})
    }.alignItems(HorizontalAlign.Center).width('100%')
  }
}
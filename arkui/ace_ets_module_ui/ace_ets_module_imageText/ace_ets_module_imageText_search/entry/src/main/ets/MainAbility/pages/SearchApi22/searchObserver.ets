/*
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

import { UIObserver, uiObserver } from '@kit.ArkUI';

@Entry
@Component
struct Page {
  observer: UIObserver = this.getUIContext().getUIObserver();
  @State globalOutput: string = '';
  @State localOutput: string = '';

  build() {
    Row(){
      Column(){
        Text('global:' + this.globalOutput).id('globalOutputSearch').fontSize(24).width('80%').height('5%')

        Text('local:' + this.localOutput).id('localOutputSearch').fontSize(24).width('80%').height('5%')

        Text('监听textChange开关按钮').fontSize(18).fontWeight(FontWeight.Bold).height('6%')

        Row(){
          Button('全局监听(开)')
            .id('全局监听(开)')
            .width('40%')
            .fontSize('20vp')
            .margin({ right: 10 })
            .onClick(()=>{
              this.observer.on('textChange', (info: uiObserver.TextChangeEventInfo)=>{
                console.info('[TEST INFO] [uiObserver] [textChange] [global] [id: ' + JSON.stringify(info.id) + '] [uniqueId: ' + JSON.stringify(info.uniqueId) + '] [content: ' + JSON.stringify(info.content) + ']');
                this.globalOutput = info.content;
              });
            })
          Button('全局监听(关)')
            .id('全局监听(关)')
            .width('40%')
            .fontSize('20vp')
            .margin({ left: 10 })
            .onClick(()=>{
              this.observer.off('textChange');
            })
        }.height('7%')

        Row(){
          Button('局部Search(开)')
            .id('局部Search(开)')
            .width('40%')
            .fontSize('20vp')
            .margin({ right: 10 })
            .onClick(()=>{
              this.observer.on('textChange', { id: 'search' }, (info: uiObserver.TextChangeEventInfo)=>{
                console.info('[TEST INFO] [uiObserver] [textChange] [Search] [id: ' + JSON.stringify(info.id) + '] [uniqueId: ' + JSON.stringify(info.uniqueId) + '] [content: ' + JSON.stringify(info.content) + ']');
                this.localOutput = info.content;
              });
            })
          Button('局部Search(关)')
            .id('局部Search(关)')
            .width('40%')
            .fontSize('20vp')
            .margin({ left: 10 })
            .onClick(()=>{
              this.observer.off('textChange', { id: 'search' });
            })
        }.height('7%')

        Text('Search').height('5%')
        Search({ value: '' })
          .id('search')
          .width('80%')
          .height('15%')
          .draggable(true)
          .onDragStart(()=>{})
          .cancelButton({ style: CancelButtonStyle.CONSTANT })
          .margin({ bottom: 10 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
/**
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

import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Custom {
  @State isShow: boolean = false;
  @State actionMenuText: string = '';
  @State disappearMenuText: string = '';
  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '菜单选项1' });
      MenuItem({ content: '菜单选项2' });
    }
  }

  build() {
    Column() {
      Text(this.actionMenuText).id('actionMenuText');
      Text(this.disappearMenuText).id('disappearMenuText');
      
      Row() {
        Button('弹窗')
          .id('showActionMenu')
          .onClick(() => {
            promptAction.showActionMenu({
              title: 'showActionMenu',
              buttons: [
                {
                  text: 'item1',
                  color: '#000000'
                },
              ],
              onWillAppear: () => {
                this.actionMenuText = this.actionMenuText + 'onWillAppear_';
              },
              onDidAppear: () => {
                this.actionMenuText = this.actionMenuText + 'onDidAppear';
              },
              onWillDisappear: () => {
                this.disappearMenuText = this.disappearMenuText + 'onWillDisappear_';
              },
              onDidDisappear: () => {
                this.disappearMenuText = this.disappearMenuText + 'onDidDisappear';
              },
            })
              .then(data => {
                console.info('showActionMenu success, click button: ' + data.index);
              })
              .catch((err: Error) => {
                console.info('showActionMenu error: ' + err);
              })
          })
      }
    }.backgroundColor('#f0f0f0')
      .width('100%')
      .height('100%')
  }
}
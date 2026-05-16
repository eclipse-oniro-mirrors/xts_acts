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

@Entry
@Component
struct Custom {
  @State isShow: boolean = false;
  @State appearText: string = '';
  @State disappearText: string = '';
  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '菜单选项1' });
      MenuItem({ content: '菜单选项2' });
    }
  }

  build() {
    Column() {
      Text('isShow menu')
        .bindContextMenu(this.isShow, this.MyMenu, {
          onWillAppear: () => {
            this.appearText = this.appearText + 'onWillAppear_';
          },
          onDidAppear: () => {
            this.appearText = this.appearText + 'onDidAppear';
          },
          onWillDisappear: () => {
            this.disappearText = this.disappearText + 'onWillDisappear_';
          },
          onDidDisappear: () => {
            this.disappearText = this.disappearText + 'onDidDisappear';
          },
        })
      Button('isShow')
        .id('showID')
        .onClick(() => {
          this.isShow = true
          setTimeout(() => {
            this.isShow = false;
          }, 2000);
        })
      Text(this.appearText).id('appearText1');
      Text(this.disappearText).id('disappearText1');
    }.backgroundColor('#f0f0f0')
      .width('100%')
      .height('100%')
  }
}
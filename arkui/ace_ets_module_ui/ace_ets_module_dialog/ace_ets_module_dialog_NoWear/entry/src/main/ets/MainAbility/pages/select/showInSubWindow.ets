/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
@Entry
@Component
struct SelectExample4 {
  @State countIndex: number = 0;
  @State countList: ( boolean | null | undefined)[] = [
    false,
    true,
    undefined,
    null,
  ]

  build() {
    Column() {
      Column(){
        Button('showInSubWindow数值切换' + this.countIndex)
          .id('showInSubWindowButton')
          .onClick(() => {
           this.countIndex = (this.countIndex + 1) % this.countList.length;
          })
      }
      Text($r('sys.string.ohos_id_expand_display'))
      .id('resource')
      Row(){
        Select([{ value: 'aaa', icon: $r('app.media.app_icon') },
          { value: 'bbb', icon: $r('app.media.app_icon') },
          { value: 'ccc', icon: $r('app.media.app_icon') },
          { value: 'ddd', icon: $r('app.media.app_icon') }])
          .key('select')
          .showInSubWindow(this.countList[this.countIndex])
      }
    }.width('100%')
  }
}
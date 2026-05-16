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
struct focusWrapModeList2 {
  build() {
    Column() {
      List() {
        ListItem() {
          Text('text1')
            .key('text1')
            .focusable(true)
            .tabIndex(1)
        }
        ListItem() {
          Text('text2')
            .key('text2')
            .focusable(false)
        }
        ListItem() {
          Text('text3')
            .key('text3')
            .focusable(true)
        }
        ListItem() {
          Text('text4')
            .key('text4')
            .focusable(true)
        }
      }
      .key('list5')
      .focusWrapMode(FocusWrapMode.DEFAULT)
      .lanes(2)
      .scrollBar(BarState.Off)
      .listDirection(Axis.Vertical)
    }
  }
}
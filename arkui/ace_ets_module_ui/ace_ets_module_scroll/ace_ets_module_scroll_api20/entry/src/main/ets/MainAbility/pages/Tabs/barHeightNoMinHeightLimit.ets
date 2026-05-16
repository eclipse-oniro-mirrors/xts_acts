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
struct TabContentHeightExample {
  @Builder
  tabBuilder() {
    Column() {
      Text('green')
    }
    .height('13vp')
  }

  build() {
    Column() {
      Tabs() {
        TabContent() {
          Column()
        }.tabBar(this.tabBuilder())
        .key('TabContent')
      }
      .key('Tabs')
      .barHeight('auto', true)

      Tabs() {
        TabContent() {
          Column()
        }.tabBar(this.tabBuilder())
        .key('TabContent2')
      }
      .key('Tabs2')
      .barHeight('auto', false)

      Tabs() {
        TabContent() {
          Column()
        }.tabBar(this.tabBuilder())
        .key('TabContent3')
      }
      .key('Tabs3')
      .barHeight('auto', undefined)

      Tabs() {
        TabContent() {
          Column()
        }.tabBar(this.tabBuilder())
        .key('TabContent4')
      }
      .key('Tabs4')
      .barHeight('auto', null)
    }
  }
}

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

@Component
export struct ListItemGroupView {
  @Link _position: Position;
  private componentKey: string = '';
  private parentWidth: number = 0;
  private parentHeight: number = 0;
  private parentComponentKey: string = '';
  private referenceComponentKey: string = '';
  private projects: string[] = ['item1', 'item2', 'item3']

  @Builder itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .padding(10)
  }

  @Builder itemFoot(num: number) {
    Text('total:' + num)
      .fontSize(16)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .padding(5)
  }

  @Builder content(project: string) {
    Text(project)
      .width('100%')
      .height(100)
      .fontSize(20)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xFFFFFF)
  }

  build() {
    List({ space: 20 }) {
      ListItemGroup({ header: this.itemHead('Group1'), footer: this.itemFoot(this.projects.length) }) {
        ForEach(this.projects, (project:string) => {
          ListItem() {
            this.content(project)
          }
        }, (item:number) => item.toString())
      }
      .borderRadius(20)
      .position(this._position)
      .key(this.componentKey)
      .divider({ strokeWidth: 1, color: Color.Blue })

      ListItemGroup({ header: this.itemHead('Group2'), footer: this.itemFoot(this.projects.length) }) {
        ForEach(this.projects, (project:string) => {
          ListItem() {
            this.content(project)
          }
        }, (item:number) => item.toString())
      }
      .borderRadius(20)
      .key(this.referenceComponentKey)
      .divider({ strokeWidth: 1, color: Color.Blue })
    }
    .width(this.parentWidth)
    .height(this.parentHeight)
    .key(this.parentComponentKey)
    .sticky(StickyStyle.Header | StickyStyle.Footer)
  }
}
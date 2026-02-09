/**
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
import { collections } from '@kit.ArkTS';
import { UIUtils } from '@kit.ArkUI';

@Sendable
class Info {
  public id: number = 0;

  constructor(id: number) {
    this.id = id;
  }
}

@Entry
@ComponentV2
struct makeObserved0040 {
  set: collections.Set<Info> = UIUtils.makeObserved(new collections.Set<Info>([new Info(10), new Info(20)]));

  build() {
    Column() {
      // 因为ForEach不支持迭代器，所以需要使用Array.from浅拷贝生成数组。
      // 但是浅拷贝生成的新的数组没有观察能力，为了ForEach组件在访问item的时候是可观察的数据，所以需要重新调用makeObserved。
      ForEach((UIUtils.makeObserved(Array.from(this.set.values()))), (item: Info, index: number) => {
        Text(`${item.id}`).onClick(() => {
          item.id++;
        }).id(`makeObserved0040text${index}`)
      }, (item: Info, index) => item.id + index.toString())
      Text(`${this.set.size}`).id('makeObserved0040clearText')
      // add
      Button('add').onClick(() => {
        this.set.add(new Info(30));
        console.log('size:' + this.set.size);
      }).id('makeObserved0040add')
      // delete
      Button('delete').onClick(() => {
        let iterator = this.set.keys();
        this.set.delete(iterator.next().value);
      }).id('makeObserved0040delete')
      // clear
      Button('clear').onClick(() => {
        this.set.clear();
      }).id('makeObserved0040clear')
    }
    .height('100%')
    .width('100%')
  }
}
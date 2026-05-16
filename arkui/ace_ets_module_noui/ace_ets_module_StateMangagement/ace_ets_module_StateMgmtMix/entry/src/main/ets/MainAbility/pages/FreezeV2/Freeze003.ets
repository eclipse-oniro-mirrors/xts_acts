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
// 003 changelog变更，父组件无冻结选项，子组件冻结，子组件冻结生效
import router from '@ohos.router';
import prompt from '@system.prompt';

@ObservedV2
export class Book {
  @Trace public name: string = '100';

  constructor(page: string) {
    this.name = page;
  }
}

@Entry
@ComponentV2
struct Page1 {
  build() {
    Column() {
      Child()
    }
  }
}

@ComponentV2({ freezeWhenInactive: true })
export struct Child {
  @Local bookTest: Book = new Book('A Midsummer Night’s Dream');
  @Local message: string = '';
  @Local logNum: number = 0;
  aboutToAppear(): void {
    AppStorage.setOrCreate<number>('logNumFreezeV2003', 0)
  }
  @Monitor('bookTest.name')
  onMessageChange(monitor: IMonitor) {
    this.logNum++;
    AppStorage.setOrCreate<number>('logNumFreezeV2003', this.logNum)
    this.message = `The book name change from ${monitor.value()?.before} to ${monitor.value()?.now}`
  }

  textUpdate(): number {
    console.log('The text is update');
    return 25;
  }

  build() {
    Column() {
      Text(`The book name is  ${this.bookTest.name}`).fontSize(this.textUpdate())
      Text(this.message).id('freezeV2003_menssage').height('5%')
      Button('go to next page').fontSize(9)
        .onClick(() => {
          router.pushUrl({ url: 'MainAbility/pages/FreezeV2/Freeze003Page' });
          setTimeout(() => {
            this.bookTest = new Book('Jane Austen oPride and Prejudice');
          }, 1000);
        })
        .id('FreezeV2ChildNextPage')
    }
  }
}
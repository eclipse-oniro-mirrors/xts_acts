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
@Entry
@ComponentV2
struct EventTest {
  @Local title: string = 'Titile One';
  @Local fontColor: Color = Color.Red;

  build() {
    Column() {
      EventChild({
        title: this.title,
        fontColor: this.fontColor,
        changeFactory: (type: number) => {
          if (type == 1) {
            this.title = 'Title One';
            this.fontColor = Color.Red;
          } else if (type == 2) {
            this.title = 'Title Two';
            this.fontColor = Color.Green;
          }
        }
      })
    }
  }
}

@ComponentV2
struct EventChild {
  @Param title: string = '';
  @Param fontColor: Color = Color.Black;
  @Event changeFactory: (x: number) => void = (x: number) => {
  };

  build() {
    Column() {
      Text(`${this.title}`).fontColor(this.fontColor).id('eventText')
      Button('change to Title Two')
        .onClick(() => {
          this.changeFactory(2);
        })
        .id('eventButton1')
      Button('change to Title One')
        .onClick(() => {
          this.changeFactory(1);
        })
        .id('eventButton2')
    }
  }
}
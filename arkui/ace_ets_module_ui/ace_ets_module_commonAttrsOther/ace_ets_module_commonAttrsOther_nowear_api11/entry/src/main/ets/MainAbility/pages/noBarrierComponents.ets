/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import web_webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct noBarrierComponents {
  scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1];
  @State Number: String[] = ['0', '1'];
  private arrayA: string[] = ['安'];
  private arrayB: string[] = ['卜', '白', '包', '毕', '丙'];
  private arrayC: string[] = ['曹', '成', '陈', '催'];
  private arrayL: string[] = ['刘', '李', '楼', '梁', '雷', '吕', '柳', '卢'];
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
  public valueArr: number[] = [10, 10];
  @State isLunar: boolean = false;
  private selectedDate: Date = new Date('2021-08-08');
  @State formId: number = 0;
  @State start: boolean = false;
  private fromStart: boolean = true;
  private step: number = 50;
  private loop: number = Infinity;
  private src: string = "Running Marquee starts rolling";
  @State passwords: Number[] = [];
  @State message: string = 'please input password!';
  private patternLockController: PatternLockController = new PatternLockController();
  private value1: string = 'hello world';
  @State rating: number = 3.5;
  @State target?: WindowAnimationTarget = undefined;
  @State data: string = '<h1 style="text-align: center;">h1标题</h1>';
  @State changeValue: string = '';
  @State submitValue: string = '';
  controller: SearchController = new SearchController();
  @State outSetValueOne: number = 40;
  @State isMilitaryTime: boolean = false;
  private selectedTime: Date = new Date('2022-07-22T08:00:00');
  controller1: web_webview.WebviewController = new web_webview.WebviewController();
  private surfaceId: string = '';
  xcomponentController: XComponentController = new XComponentController();

  build() {
    Scroll(this.scroller) {
      Column() {
        Select([{ value: 'aaa', icon: "/common/public_icon.svg" },
          { value: 'bbb', icon: "/common/public_icon.svg" },
          { value: 'ccc', icon: "/common/public_icon.svg" },
          { value: 'ddd', icon: "/common/public_icon.svg" }])
          .selected(2)
          .value('TTTTT')
          .font({ size: 16, weight: 500 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
          .key("Select")
          .accessibilityText("我是无障碍组件")
          .onSelect((index: number) => {
            console.info('Select:' + index)
          })

       
        Web({ src: $rawfile("index.html"), controller: this.controller1 })
          .key("Web")
          .accessibilityText("我是无障碍组件")
      }
    }
  }
}
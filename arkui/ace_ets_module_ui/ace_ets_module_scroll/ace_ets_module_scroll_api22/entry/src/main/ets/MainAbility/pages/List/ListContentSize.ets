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
struct ListExample {
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  scrollerForList: Scroller = new Scroller()
  errorScrollerForList: Scroller = new Scroller();
  @State textResult: string = 'Hello world';
  @State arrIndex: number = 10;
  @State errorCode: number = -1;
  @State contentWidth: number = -1;
  @State contentHeight: number = -1;
  build() {
    Column() {
      Button('GetContentSize')
        .id('GetContentSize')
        .width('20%')
        .height('10%')
        .onClick(()=> {
          this.contentWidth=this.scrollerForList.contentSize().width;
          this.contentHeight=this.scrollerForList.contentSize().height;
          try {
            this.errorCode=this.errorScrollerForList.contentSize().height;
          } catch (error) {
            this.textResult = (error as BusinessError).code + '';
            console.info('Get error code: %{public}s', JSON.stringify(this.textResult));
          }
        })
      List({ scroller: this.scrollerForList}) {//测试点：space
        ForEach(this.arr, (item: number, index?: number) => {
          ListItemGroup(){
            ListItem() {
                Text('' + item)
                  .width(200)
                  .height(100)
            }
          }
        }, (item: string) => item)
      }
      .width(200)
      .height('50%')
      Text(''+ this.contentWidth)
        .fontColor(Color.Red)
        .key('ListContentWidth')
      Text(''+ this.contentHeight)
        .fontColor(Color.Red)
        .key('ListContentHeight')
      Text('' + this.textResult)
        .fontColor(Color.Red)
        .key('contentHeightErrorInfo')
    }
  }
}
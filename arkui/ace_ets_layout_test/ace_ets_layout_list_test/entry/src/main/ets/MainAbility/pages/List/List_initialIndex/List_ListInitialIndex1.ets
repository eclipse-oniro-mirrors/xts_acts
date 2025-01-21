/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
struct List_ListInitialIndex1{
  @State arr: String[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
  @State testInitialIndex: number = 2;
  @State testLanes: number = 1;
  build(){
    Column({space:30}){
      List({space:20, initialIndex:this.testInitialIndex}){
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text('' + item)
              .width('100%').height('100%').backgroundColor(0xF5DEB3)
          }
          .width(100)
          .height(100)
          .key('List_ListInitialIndex1_'+ item)
        }, item => item)
      }
      .cachedCount(0)
      .width(300)
      .height(500)
      .listDirection(Axis.Vertical)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.On)
      .lanes(this.testLanes)
      .backgroundColor(0xAFEEEE)
      .key('List_ListInitialIndex1_Container01')
    }
    .width('100%')
    .height('100%')
  }
}
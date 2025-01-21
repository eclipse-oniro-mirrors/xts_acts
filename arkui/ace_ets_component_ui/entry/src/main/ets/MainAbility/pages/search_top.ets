/**
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
import {MessageManager,Callback} from '../utils/MessageManager';

@Entry
@Component
struct search_top {
  private arr:number[] = [0,1,2,3,4,5]
  scroll: Scroller = new Scroller()
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('search_top onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
  }

  build(){
    Row(){
      Column(){
        Scroll(this.scroll){
          Column(){
            Search({placeholder:'search位于滚动容器顶部'})
              .searchButton('SEARCH')
              .searchIcon({
                src: $r('app.media.icon')
              })
              .cancelButton({
                style:CancelButtonStyle.CONSTANT,
                icon:{
                  src: $r('app.media.icon')
                }
              })
              .width('90%')
              .height(40)
              .backgroundColor("#7ebfe76e")
              .placeholderColor(Color.Grey)
              .placeholderFont({size:14,weight:400})
              .caretStyle({width:2,color:Color.Orange})
              .textFont({size:14,weight:400})
              .selectionMenuHidden(false)
              .caretStyle({
                width: 10,
                color:'#007DFF'
              })
              .enableKeyboardOnFocus(false)
              .key('search_top_search_01')
              .margin(0)

            ForEach(this.arr,(item:number) => {
              Text(item.toString())
                .width('90%')
                .height(150)
                .backgroundColor(0xFFFFFF)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({top:10})
                .key('search_top_text_0' + item)
            })

          }.width('100%').key('search_top_Column_1')
        }.expandSafeArea([SafeAreaType.KEYBOARD])
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(10)
        .edgeEffect(EdgeEffect.None)
        .backgroundColor('#f9eff6')
      }
      .width('100%')
      .height(700)
    }
    .height('100%')
    .alignItems(VerticalAlign.Top)
  }

}
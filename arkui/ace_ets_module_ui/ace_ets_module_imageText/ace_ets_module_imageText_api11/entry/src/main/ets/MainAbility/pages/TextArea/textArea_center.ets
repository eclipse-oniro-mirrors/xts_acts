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
import { MessageManager, Callback } from '../../common/MessageManager';

@Entry
@Component
struct textArea_center {
  private arr:number[] = [0,1,2,3,4,5]
  @State height1:string = '60%'
  @State fontSize1:number = 17
  @State fontWeight1:number = 400
  controller: TextAreaController = new TextAreaController()
  scroll: Scroller = new Scroller()
  messageManager:MessageManager = new MessageManager()


  onPageShow() {
    console.info('textArea_center onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
  }

  build(){
    Column(){
      Scroll(this.scroll){
        Column(){
          Button('点击关闭键盘').width('90%')
            .height('33%')
            .borderRadius(15)
            .fontSize(16)
            .margin(0)
            .id('textArea_center_btn')
            .onClick(() =>{
              this.controller.stopEditing()
              this.scroll.scrollEdge(Edge.Top)
            })

          TextArea({
            controller: this.controller,
            text:'TextArea位于容器顶部;\n\n一个民族的复兴需要强大的物质力量，也需要强大的精神力量。党的十八大以来，以习近平同志为核心的党中央总揽全局，把宣传思想文化工作摆在重要位置，指引宣传思想文化事业在举旗定向、正本清源中取得历史性成就、发生历史性变革，在守正创新、开拓进取中展现新气象、迈向新征程'
            +'2023年6月，习近平总书记分别考察中国国家版本馆中央总馆和中国历史研究院、主持召开文化传承发展座谈会，深刻总结党的十八大以来在文化建设中提出的一系列新思想新观点新论断。这是新时代党领导文化建设实践经验的理论总结，为做好宣传思想文化工作指明了前进方向、提供了根本遵循。'
            +'十年前，党的十八大后首次全国宣传思想工作会议召开，习近平总书记发表重要讲话，指出意识形态工作是党的一项极端重要的工作，是为国家立心、为民族立魂的工作，并作出“两个巩固”的重要论述。'
            +'从全国宣传思想工作会议，到文艺工作座谈会、党的新闻舆论工作座谈会、网络安全和信息化工作座谈会、哲学社会科学工作座谈会、全国高校思想政治工作会议，再到中国文联、中国作协代表大会，习近平总书记多次发表重要讲话、作出重要指示，强调“要加强党对宣传思想工作的全面领导，旗帜鲜明坚持党管宣传、党管意识形态。”'
            +'文化自信是一个国家、一个民族发展中最基本、最深沉、最持久的力量。'
            +'新时代新征程，旅游发展面临新机遇新挑战。”在重要指示中，总书记既充分肯定改革开放特别是党的十八大以来旅游工作取得的显著成绩，又对加快建设旅游强国、推动旅游业高质量发展作出全面部署、提出明确要求。'
            +'快车道，意味着发展速度快：2012年到2021年，国内旅游收入年均增长约10.6%；2012年到2019年，国内出游人次实现翻番。我国已形成全球最大国内旅游市场，也是国际旅游最大客源国和主要目的地。'
          })
            .fontSize(this.fontSize1)
            .fontWeight(this.fontWeight1)
            .height(this.height1)
            .backgroundColor("#7ebfe76e")
            .enableKeyboardOnFocus(false)
            .key('textArea_center_textArea_01')
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
              .key('textArea_center_text_1' + item)
          })

        }.width('100%').key('textArea_center_column_01')

      }.expandSafeArea([SafeAreaType.KEYBOARD])
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .edgeEffect(EdgeEffect.None)
      .backgroundColor('#f9eff6')
    }
    .width('100%')
  }
}
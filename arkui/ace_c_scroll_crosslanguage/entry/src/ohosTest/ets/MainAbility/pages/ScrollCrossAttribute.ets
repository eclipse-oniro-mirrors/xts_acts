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
import { FrameNode, LengthMetrics, NodeController, typeNode } from '@kit.ArkUI'
import nativeNode from "libnativeNode.so";
class MyNodeController extends NodeController {
  scroller: Scroller = new Scroller()

  makeNode(uiContext: UIContext): FrameNode {
    const rootNode = typeNode.createNode(uiContext, 'Scroll');
    rootNode.attribute.id('typeNode').width(200).height(150).backgroundColor(Color.Red).scrollBarWidth(4).edgeEffect(EdgeEffect.None);

    let columnNode = typeNode.createNode(uiContext, 'Column');
    columnNode.attribute.width(100).height(800).backgroundColor(Color.Yellow);
    rootNode.appendChild(columnNode);

    rootNode.setCrossLanguageOptions({
      attributeSetting: true
    });
    return rootNode;
  }
}

@Entry
@Component
struct ScrollAttribute1 {
  private myNodeController: MyNodeController = new MyNodeController();
  private message: string = "no callback";
  private scroll_offset: number = 0;
  scroller: Scroller = new Scroller();
  build() {
    Column() {
      NodeContainer(this.myNodeController)
      //TS对Capi操作
      Column(){
        Row(){
          Button('clickCAPINode_width_cross').onClick(() => {
            const node = this.getUIContext().getFrameNodeById('capiNode');
            console.info('ZRJ isModifiable:' + node?.isModifiable());
            if (node) {
              console.info('ZRJ ScrollAttribute1 CAPINode is exist')
              const a = typeNode.getAttribute(node, 'Scroll');
              if (a != undefined) {
                console.info('ZRJ ScrollAttribute1 CAPINode scrollBarWidth 10')
                a.scrollBarWidth(100);
                a.edgeEffect(EdgeEffect.Spring,{alwaysEnabled:true})
                a.enableScrollInteraction(true)
                a.backgroundColor(Color.Black)
                a.scrollBar(BarState.On)
                a.enablePaging(true)
                a.onScrollStart(()=>{
                  this.message = "start callback"
                })
                a.width("30%")
              }
              console.info('ZRJ bindController CAPINode is exist:new Scroller')

              try {
                typeNode.bindController(node, this.scroller, 'Scroll')
                this.scroller.fling(-1000)
                console.info('ZRJ bindController CAPINode currentOffset:' + this.scroller.currentOffset().yOffset)
                this.scroll_offset = this.scroller.currentOffset().yOffset
              } catch (e) {
                console.error('ZRJ CAPINode error:' + e.code)
              }
            } else {
              console.info('ZRJ ScrollAttribute1 CAPINode is null')
            }
          })
            .id("clickCAPINode_width_cross")
            .size({width:"10%", height:"10%"})
          Button('clickCAPINode_width_nocross').onClick(() => {
            const node = this.getUIContext().getFrameNodeById('capiNodeFalse');
            console.info('ZRJ isModifiable:' + node?.isModifiable());
            if (node) {
              console.info('ZRJ ScrollAttribute1 CAPINode is exist')
              const a = typeNode.getAttribute(node, 'Scroll');
              if (a != undefined) {
                console.info('ZRJ ScrollAttribute1 CAPINode scrollBarWidth 10')
                a.scrollBarWidth(100);
                a.edgeEffect(EdgeEffect.Spring,{alwaysEnabled:true})
                a.enableScrollInteraction(true)
                a.scrollBar(BarState.Auto)
                a.backgroundColor(Color.Black)
                a.width("30%")
              }

              try {
                typeNode.bindController(node, this.scroller, 'Scroll')
                this.scroller.fling(-1000)
                console.info('ZRJ bindController CAPINode currentOffset:' + this.scroller.currentOffset().yOffset)
                this.scroll_offset = this.scroller.currentOffset().yOffset
              } catch (e) {
                console.error('ZRJ CAPINode error:' + e.code)
              }

              console.info('ZRJ bindController CAPINode is exist:new Scroller')
            } else {
              console.info('ZRJ ScrollAttribute1 CAPINode is null')
            }
          })
            .id("clickCAPINode_width_nocross")
            .size({width:"10%", height:"10%"})
          Button('clickCAPINode_enablePaging_un_cross').onClick(() => {
            const node = this.getUIContext().getFrameNodeById('capiNode');
            console.info('ZRJ isModifiable:' + node?.isModifiable());
            if (node) {
              console.info('ZRJ ScrollAttribute1 CAPINode is exist')
              const a = typeNode.getAttribute(node, 'Scroll');
              if (a != undefined) {
                console.info('ZRJ ScrollAttribute1 CAPINode scrollBarWidth 10')
                a.scrollBarWidth(100);
                a.edgeEffect(EdgeEffect.Spring,{alwaysEnabled:true})
                a.enableScrollInteraction(true)
                a.backgroundColor(Color.Black)
                a.scrollBar(BarState.Auto)
                a.enablePaging(undefined)
                a.width("30%")
              }
              console.info('ZRJ bindController CAPINode is exist:new Scroller')

              try {
                typeNode.bindController(node, this.scroller, 'Scroll')
                this.scroller.fling(-1000)
                console.info('ZRJ bindController CAPINode currentOffset:' + this.scroller.currentOffset().yOffset)
              } catch (e) {
                console.error('ZRJ CAPINode error:' + e.code)
              }
            } else {
              console.info('ZRJ ScrollAttribute1 CAPINode is null')
            }
          })
            .id("clickCAPINode_enablePaging_un_cross")
            .size({width:"10%", height:"10%"})
          Button('clickCAPINode_enableScrollInteraction_false_cross').onClick(() => {
            const node = this.getUIContext().getFrameNodeById('capiNode');
            console.info('ZRJ isModifiable:' + node?.isModifiable());
            if (node) {
              console.info('ZRJ ScrollAttribute1 CAPINode is exist')
              const a = typeNode.getAttribute(node, 'Scroll');
              if (a != undefined) {
                console.info('ZRJ ScrollAttribute1 CAPINode scrollBarWidth 10')
                a.scrollBarWidth(100);
                a.edgeEffect(EdgeEffect.Spring,{alwaysEnabled:true})
                a.enableScrollInteraction(false)
                a.backgroundColor(Color.Black)
                a.scrollBar(BarState.Auto)
                a.enablePaging(undefined)
                a.width("30%")
              }
              console.info('ZRJ bindController CAPINode is exist:new Scroller')

              try {
                typeNode.bindController(node, this.scroller, 'Scroll')
                this.scroller.fling(-1000)
                console.info('ZRJ bindController CAPINode currentOffset:' + this.scroller.currentOffset().yOffset)
              } catch (e) {
                console.error('ZRJ CAPINode error:' + e.code)
              }
            } else {
              console.info('ZRJ ScrollAttribute1 CAPINode is null')
            }
          })
            .id("clickCAPINode_enableScrollInteraction_false_cross")
            .size({width:"10%", height:"10%"})
        }
        Text(this.scroll_offset.toString())
          .size({width:"10%", height:"10%"})
          .id("scroller_currentOffset")
        Text(this.message)
          .size({width:"10%", height:"10%"})
          .id("callback_msg")

      }
      XComponent({
        id: 'xcomponentId',
        type: "node",
        libraryname: 'nativeNode'
      })
        .onAppear(() => {
          nativeNode.createNativeNode("xcomponentId");
        }).width("13%").height("15%")
        .id("xcomponent")
        .backgroundColor(Color.Yellow)

      XComponent({
        id: 'xcomponentId1',
        type: "node",
        libraryname: 'nativeNode'
      })
        .onAppear(() => {
          nativeNode.createNativeNodeFalse("xcomponentId1");
        }).width("13%").height("15%")
        .id("xcomponent1")
        .backgroundColor(Color.Yellow)

    }
    .padding({ left: 35, right: 35, top: 35 })
    .width("100%")
    .height("100%")
  }
}

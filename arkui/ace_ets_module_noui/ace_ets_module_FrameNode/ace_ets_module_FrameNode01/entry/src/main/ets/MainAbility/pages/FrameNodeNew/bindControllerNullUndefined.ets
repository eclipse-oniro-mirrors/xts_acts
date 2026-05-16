/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { typeNode, FrameNode, NodeController } from '@ohos.arkui.node';

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private uiContext: UIContext | null = null;
  private scroller: Scroller = new Scroller()
  private swiperController: SwiperController = new SwiperController()

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);

    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.size = { width: 200, height: 50 };
      rootRenderNode.backgroundColor = 0xff00ff00;
    }

   // ========== bindController Grid tests ==========
   //node null
    try {
      typeNode.bindController(null, this.scroller, 'Grid');
      console.log('win6 Grid null1: ' + ' bindControllerGridNull1 success.');
    } catch (err) {
      console.log('win6 Grid null1: ' + err.code);
      AppStorage.SetOrCreate('bindControllerGridNull1', err.code);
    }

    //node undefined
    try {
      typeNode.bindController(undefined, this.scroller, 'Grid');
      console.log('win6 Grid undefined1: ' + ' bindControllerGridUn1 success.');
    } catch (err) {
      console.log('win6 Grid undefined1: ' + err.code);
      AppStorage.SetOrCreate('bindControllerGridUn1', err.code);
    }

    //controller null
    try {
      let textNode = typeNode.createNode(this.uiContext, 'GridItem');
      typeNode.bindController(textNode, null, 'Grid');
      console.log('win6 Grid null2: ' + ' bindControllerGridNull2 success.');
    } catch (err) {
      console.log('win6 Grid null2: ' + err.code);
      AppStorage.SetOrCreate('bindControllerGridNull2', err.code);
    }

    //controller undefined
    try {
      let textNode = typeNode.createNode(this.uiContext, 'GridItem');
      typeNode.bindController(textNode, undefined, 'Grid');
      console.log('win6 Grid undefined2: ' + ' bindControllerGridUn2 success.');
    } catch (err) {
      console.log('win6 Grid undefined2: ' + err.code);
      AppStorage.SetOrCreate('bindControllerGridUn2', err.code);
    }

    // ========== bindController Scroll tests ==========
    //node null
    try {
      typeNode.bindController(null, this.scroller, 'Scroll');
      console.log('win6 Scroll null1: ' + ' bindControllerScrollNull1 success.');
    } catch (err) {
      console.log('win6 Scroll null1: ' + err.code);
      AppStorage.SetOrCreate('bindControllerScrollNull1', err.code);
    }

    //node undefined
    try {
      typeNode.bindController(undefined, this.scroller, 'Scroll');
      console.log('win6 Scroll undefined1: ' + ' bindControllerScrollUn1 success.');
    } catch (err) {
      console.log('win6 Scroll undefined1: ' + err.code);
      AppStorage.SetOrCreate('bindControllerScrollUn1', err.code);
    }

    //controller null
    try {
      let textNode = typeNode.createNode(this.uiContext, 'Text');
      typeNode.bindController(textNode, null, 'Scroll');
      console.log('win6 Scroll null2: ' + ' bindControllerScrollNull2 success.');
    } catch (err) {
      console.log('win6 Scroll null2: ' + err.code);
      AppStorage.SetOrCreate('bindControllerScrollNull2', err.code);
    }

    //controller undefined
    try {
      let textNode = typeNode.createNode(this.uiContext, 'Text');
      typeNode.bindController(textNode, undefined, 'Scroll');
      console.log('win6 Scroll undefined2: ' + ' bindControllerScrollUn2 success.');
    } catch (err) {
      console.log('win6 Scroll undefined2: ' + err.code);
      AppStorage.SetOrCreate('bindControllerScrollUn2', err.code);
    }

    // ========== bindController List tests ==========
    //node null
    try {
      typeNode.bindController(null, this.scroller, 'List');
      console.log('win6 List null1: ' + ' bindControllerListNull1 success.');
    } catch (err) {
      console.log('win6 List null1: ' + err.code);
      AppStorage.SetOrCreate('bindControllerListNull1', err.code);
    }

    //node undefined
    try {
      typeNode.bindController(undefined, this.scroller, 'List');
      console.log('win6 List undefined1: ' + ' bindControllerListUn1 success.');
    } catch (err) {
      console.log('win6 List undefined1: ' + err.code);
      AppStorage.SetOrCreate('bindControllerListUn1', err.code);
    }

    //controller null
    try {
      let textNode = typeNode.createNode(this.uiContext, 'ListItem');
      typeNode.bindController(textNode, null, 'List');
      console.log('win6 List null2: ' + ' bindControllerListNull2 success.');
    } catch (err) {
      console.log('win6 List null2: ' + err.code);
      AppStorage.SetOrCreate('bindControllerListNull2', err.code);
    }

    //controller undefined
    try {
      let textNode = typeNode.createNode(this.uiContext, 'ListItem');
      typeNode.bindController(textNode, undefined, 'List');
      console.log('win6 List undefined2: ' + ' bindControllerListUn2 success.');
    } catch (err) {
      console.log('win6 List undefined2: ' + err.code);
      AppStorage.SetOrCreate('bindControllerListUn2', err.code);
    }

    // ========== bindController WaterFlow tests ==========
    //node null
    try {
      typeNode.bindController(null, this.scroller, 'WaterFlow');
      console.log('win6 WaterFlow null1: ' + ' bindControllerWaterFlowNull1 success.');
    } catch (err) {
      console.log('win6 WaterFlow null1: ' + err.code);
      AppStorage.SetOrCreate('bindControllerWaterFlowNull1', err.code);
    }

    //node undefined
    try {
      typeNode.bindController(undefined, this.scroller, 'WaterFlow');
      console.log('win6 WaterFlow undefined1: ' + ' bindControllerWaterFlowUn1 success.');
    } catch (err) {
      console.log('win6 WaterFlow undefined1: ' + err.code);
      AppStorage.SetOrCreate('bindControllerWaterFlowUn1', err.code);
    }

    //controller null
    try {
      let textNode = typeNode.createNode(this.uiContext, 'FlowItem');
      typeNode.bindController(textNode, null, 'WaterFlow');
      console.log('win6 WaterFlow null2: ' + ' bindControllerWaterFlowNull2 success.');
    } catch (err) {
      console.log('win6 WaterFlow null2: ' + err.code);
      AppStorage.SetOrCreate('bindControllerWaterFlowNull2', err.code);
    }

    //controller undefined
    try {
      let textNode = typeNode.createNode(this.uiContext, 'FlowItem');
      typeNode.bindController(textNode, undefined, 'WaterFlow');
      console.log('win6 WaterFlow undefined2: ' + ' bindControllerWaterFlowUn2 success.');
    } catch (err) {
      console.log('win6 WaterFlow undefined2: ' + err.code);
      AppStorage.SetOrCreate('bindControllerWaterFlowUn2', err.code);
    }

    // ========== bindController Swiper tests ==========
    //node null
    try {
      typeNode.bindController(null, this.swiperController, 'Swiper');
      console.log('win6 Swiper null1: ' + ' bindControllerSwiperNull1 success.');
    } catch (err) {
      console.log('win6 Swiper null1: ' + err.code);
      AppStorage.SetOrCreate('bindControllerSwiperNull1', err.code);
    }

    //node undefined
    try {
      typeNode.bindController(undefined, this.swiperController, 'Swiper');
      console.log('win6 Swiper undefined1: ' + ' bindControllerSwiperUn1 success.');
    } catch (err) {
      console.log('win6 Swiper undefined1: ' + err.code);
      AppStorage.SetOrCreate('bindControllerSwiperUn1', err.code);
    }

    //controller null
    try {
      let textNode = typeNode.createNode(this.uiContext, 'Text');
      typeNode.bindController(textNode, null, 'Swiper');
      console.log('win6 Swiper null2: ' + ' bindControllerSwiperNull2 success.');
    } catch (err) {
      console.log('win6 Swiper null2: ' + err.code);
      AppStorage.SetOrCreate('bindControllerSwiperNull2', err.code);
    }

    //controller undefined
    try {
      let textNode = typeNode.createNode(this.uiContext, 'Text');
      typeNode.bindController(textNode, undefined, 'Swiper');
      console.log('win6 Swiper undefined2: ' + ' bindControllerSwiperUn2 success.');
    } catch (err) {
      console.log('win6 Swiper undefined2: ' + err.code);
      AppStorage.SetOrCreate('bindControllerSwiperUn2', err.code);
    }

    return this.rootNode;
  }
}

@Entry
@Component
struct bindControllerScrollNullIndex {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      NodeContainer(this.myNodeController)
    }
    .width('100%')
    .height('100%')
  }
}
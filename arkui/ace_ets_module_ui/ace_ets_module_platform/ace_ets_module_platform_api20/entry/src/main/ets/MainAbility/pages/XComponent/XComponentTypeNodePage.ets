/*
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
import nativeNode from 'libnativerender.so'
import { FrameNode, NodeController, typeNode, NodeContent } from '@kit.ArkUI'

class MyXComponentController extends XComponentController{

  onSurfaceCreated(surfaceId: string): void {
    console.log(` onSurfaceCreated surfaceId: ${surfaceId}`)
  }
  onSurfaceChanged(surfaceId: string, rect: SurfaceRect): void {
    console.log(` nSurfaceChanged surfaceId: ${surfaceId}, rect: ${JSON.stringify(rect)}}`)
  }
  onSurfaceDestroyed(surfaceId: string): void {
    console.log(` onSurfaceDestroyed surfaceId: ${surfaceId}`)
  }
}

class MyNodeController extends NodeController {
  public xComponentController: XComponentController = new MyXComponentController();
  public root: FrameNode | null = null;
  public xNode: typeNode.XComponent | null = null;

  makeNode(uiContext: UIContext): FrameNode {
    this.root = new FrameNode(uiContext);

    let options: XComponentOptions = {
      type: XComponentType.SURFACE,
      controller: this.xComponentController
    };

    let xc = typeNode.createNode(uiContext, 'XComponent', options);

    xc.initialize({
      id: 'xcp',
      type: XComponentType.SURFACE,
      controller: this.xComponentController,
      libraryname: 'libnativeNode.so'
    })
      .enableSecure(true)
      .enableAnalyzer(true)

    xc.attribute.id('XComponentCrossLanguage_typeNode').width(200).height(200).backgroundColor(Color.Blue);
    this.xComponentController.setXComponentSurfaceSize({surfaceWidth: 50, surfaceHeight: 50})
    this.xComponentController.setXComponentSurfaceRect({surfaceWidth: 150, surfaceHeight: 150})

    xc.setCrossLanguageOptions({
      attributeSetting: true
    });

    this.root.appendChild(xc)
    this.xNode = xc;

    return this.root;
  }
}

@Entry
@Component
struct XComponentTypeNodePage {
  scroller: Scroller = new Scroller();
  swiperController: SwiperController = new SwiperController()
  @State myNodeController: MyNodeController = new MyNodeController();

  aboutToDisappear(): void {
    this.myNodeController.xNode?.disposeTree()
    this.myNodeController.xNode?.dispose()
  }

  build() {
    Column() {
      Button('TS侧修改xc组件属性').onClick(() => {
        const node = this.getUIContext().getFrameNodeById('XComponentCrossLanguage_typeNode');
        console.info('ZRJ isModifiable:' + node?.isModifiable());
        if (node) {
          console.info('ZRJ XComponent TypeNode is exist')
          const a = typeNode.getAttribute(node, 'XComponent');
          if (a != undefined) {
            console.info('ZRJ XComponent TypeNode background Green')
            a.backgroundColor(Color.Green)
            a.size({width: 200, height: 200})
            a.enableSecure(false)
            a.enableAnalyzer(true)
            this.myNodeController.xComponentController.setXComponentSurfaceRect({offsetX:10,offsetY:10,surfaceWidth: 200, surfaceHeight: 200})
          }
        } else {
          console.info('ZRJ XComponent TypeNode is null')
        }
      }).controlSize(ControlSize.SMALL).key('XComponentTypeNodePage_Btn_TS')

      Button('C侧修改xc组件属性').onClick(() => {
        nativeNode.crossLanguageSetXComponentAttribute('XComponentCrossLanguage_typeNode');
      }).controlSize(ControlSize.SMALL).key('XComponentTypeNodePage_Btn_C')

      Button('undefined').onClick(() => {
        const attrs = typeNode.getAttribute(undefined, 'XComponent');
        AppStorage.SetOrCreate('XComponentTypeNodePage', attrs);
      }).controlSize(ControlSize.SMALL).key('XComponentTypeNodePage_Btn_undefined')

      NodeContainer(this.myNodeController)
    }
    .padding({ left: 35, right: 35, top: 35 })
    .width('100%')
    .height('100%')
  }
}

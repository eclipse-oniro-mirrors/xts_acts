/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { NodeController, FrameNode, typeNode } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  public node: FrameNode | null = null;
  public imageNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute.width('100%').height('100%');

    let image = typeNode.createNode(uiContext, 'Image');
    image.initialize($r('app.media.icon')).width('100%').height('100%').autoResize(true);
    this.imageNode = image;

    this.node.appendChild(image);
    return this.node;
  }
}

@Entry
@Component
struct GetWithUniqueIdNullAndUndefined {
  @State result: string = 'Init';
  private myNodeController: MyNodeController = new MyNodeController();
  uiContext: UIContext = this.getUIContext();

  build() {
    Column() {
      Text('ComponentSnapshot GetWithUniqueId Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.result)
        .id('resultText')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      NodeContainer(this.myNodeController)
        .width('20%')
        .height('10%')
        .id('targetNode')

      Scroll() {
        Column() {
          Button('getWithUniqueId uniqueId null').id('btnUniqueIdNull').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await this.uiContext.getComponentSnapshot().getWithUniqueId(null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('getWithUniqueId uniqueId undefined')
            .id('btnUniqueIdUndefined')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot().getWithUniqueId(undefined);
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId options null').id('btnOptionsNull').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await this.uiContext.getComponentSnapshot()
                .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(), null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('getWithUniqueId options undefined')
            .id('btnOptionsUndefined')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(), undefined);
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId wait true').id('btnWaitTrue').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await this.uiContext.getComponentSnapshot()
                .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(), { waitUntilRenderFinished: true });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('getWithUniqueId wait false').id('btnWaitFalse').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await this.uiContext.getComponentSnapshot()
                .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(), { waitUntilRenderFinished: false });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('getWithUniqueId colorSpace UNKNOWN')
            .id('btnColorSpace0')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { colorMode: { colorSpace: 0, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId colorSpace ADOBE_RGB_1998')
            .id('btnColorSpace1')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { colorMode: { colorSpace: 1, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId colorSpace DCI_P3')
            .id('btnColorSpace2')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { colorMode: { colorSpace: 2, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId colorSpace DISPLAY_P3')
            .id('btnColorSpace3')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { colorMode: { colorSpace: 3, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId colorSpace SRGB')
            .id('btnColorSpace4')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { colorMode: { colorSpace: 4, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId colorMode isAuto true')
            .id('btnColorModeIsAutoTrue')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { colorMode: { colorSpace: 4, isAuto: true } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId colorMode isAuto false')
            .id('btnColorModeIsAutoFalse')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { colorMode: { colorSpace: 4, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId dynamicRangeMode HIGH')
            .id('btnDrHIGH')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { dynamicRangeMode: { dynamicRangeMode: 0, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId dynamicRangeMode CONSTRAINT')
            .id('btnDrCONSTRAINT')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { dynamicRangeMode: { dynamicRangeMode: 1, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId dynamicRangeMode STANDARD')
            .id('btnDrSTANDARD')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { dynamicRangeMode: { dynamicRangeMode: 2, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId dynamicRangeMode isAuto true')
            .id('btnDrIsAutoTrue')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { dynamicRangeMode: { dynamicRangeMode: 2, isAuto: true } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId dynamicRangeMode isAuto false')
            .id('btnDrIsAutoFalse')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { dynamicRangeMode: { dynamicRangeMode: 2, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId colorSpace ADOBE_RGB_1998_LIMIT')
            .id('btnColorSpace13')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { colorMode: { colorSpace: 13, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId colorSpace DISPLAY_P3_LIMIT')
            .id('btnColorSpace14')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { colorMode: { colorSpace: 14, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('getWithUniqueId colorSpace SRGB_LIMIT')
            .id('btnColorSpace15')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await this.uiContext.getComponentSnapshot()
                  .getWithUniqueId(this.myNodeController.imageNode?.getUniqueId(),
                    { colorMode: { colorSpace: 15, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
        }
        .width('100%')
      }
      .width('100%')
      .height('60%')
      .id('btnScroll')
    }
    .width('100%')
    .height('100%')
  }
}

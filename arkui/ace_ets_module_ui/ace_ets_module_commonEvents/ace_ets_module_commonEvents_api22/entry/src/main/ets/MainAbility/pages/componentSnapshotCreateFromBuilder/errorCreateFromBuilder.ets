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
import { ComponentContent, componentSnapshot } from '@kit.ArkUI'
import { image } from '@kit.ImageKit'

class Params {
  text: string | undefined | null = "";

  constructor(text: string | undefined | null) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  ReusableChildComponent({ text: params.text })
}

@Component
struct ReusableChildComponent {
  @Prop text: string | undefined | null = "";

  aboutToReuse(params: Record<string, object>) {
    console.info(`ReusableChildComponent Reusable ${JSON.stringify(params)}`);
  }

  aboutToRecycle(): void {
    console.info("ReusableChildComponent aboutToRecycle " + this.text);
  }

  build() {
    Column() {
      Image("https://copyright.bdstatic.com/vcg/creative/1434d89b9eca5356a80fc06124ef6c50.jpg")
      // .fontWeight(FontWeight.Bold)
        .margin({ bottom: 36 })
        .width('100%')
        .height('100%')
    }.backgroundColor('#FFF0F0F0')
  }
}

@Builder
function buildText2(params: Params) {
  ReusableChildComponent2({ text: params.text })
}

@Component
struct ReusableChildComponent2 {
  @Prop text: string | undefined | null = "";

  aboutToReuse(params: Record<string, object>) {
    console.info(`ReusableChildComponent Reusable ${JSON.stringify(params)}`);
  }

  aboutToRecycle(): void {
    console.info("ReusableChildComponent aboutToRecycle " + this.text);
  }

  build() {
    Column() {
      Text(this.text)
        .fontSize(90)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 36 })
        .width(0)
        .height(0)
    }.backgroundColor('#FFF0F0F0')
  }
}

@Entry
@Component
struct ErrorOffscreenSnapshotExample {
  @State pixmap: image.PixelMap | undefined = undefined
  @State time: (number | null | undefined)[] = [0, -1]
  @State timeIndex: number = 0

  @Builder
  nullBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Image("https://copyright.bdstatic.com/vcg/creative/1434d89b9eca5356a80fc06124ef6c50.jpg")
        .height('10%')
        .width('100%')
        .syncLoad(true)
    }
    .width('100%')
  }

  @Builder
  nullBuilder2() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Image("https://copyright.bdstatic.com/vcg/creative/1434d89b9eca5356a80fc06124ef6c50.jpg")
        .height(0)
        .width(0)
        .syncLoad(true)
    }
    .width(0)
    .height(0)
  }

  build() {
    Column() {
      Button("createFromBuilder-callback-401").onClick(() => {
        try {
          componentSnapshot.createFromBuilder(undefined, ((pix) => {
          }))
        } catch (e) {
          AppStorage.setOrCreate('code', e.code)
          console.log(`startDataLoading errorCode: ${e.code}, errorMessage: ${e.message}`);
        }

      }).width('100%').height('5%').id('createFromBuilder-callback-401')

      Button("createFromBuilder-callback-100001").onClick(() => {
        componentSnapshot.createFromBuilder(() => {
          this.nullBuilder2()
          // true
        },
          (error: Error, pixmap: image.PixelMap) => {
            if (error) {
              console.log("XXX: error: " + JSON.stringify(error))
              AppStorage.setOrCreate('code', error)
              return;
            }
          }, 200, false, { scale: 5, waitUntilRenderFinished: false }
        )
      }).width('100%').height('5%').id('createFromBuilder-callback-100001')

      Button("createFromBuilder-callback-160001").onClick(() => {
        componentSnapshot.createFromBuilder(() => {
          this.nullBuilder()
        },
          (error: Error, pixmap: image.PixelMap) => {
            if (error) {
              console.log("XXX: error: " + JSON.stringify(error))
              AppStorage.setOrCreate('code', error)
              return;
            }
          }, 200, true, { scale: 5, waitUntilRenderFinished: true }
        )
      }).width('100%').height('5%').id('createFromBuilder-callback-160001')

      Button("createFromBuilder-promise-401").onClick(() => {
        try {
          componentSnapshot.createFromBuilder(undefined)
            .then()
        } catch (e) {
          console.log(`startDataLoading errorCode: ${e.code}, errorMessage: ${e.message}`);
          AppStorage.setOrCreate('code', e.code)
        }

      }).width('100%').height('5%').id('createFromBuilder-promise-401')

      Button("createFromBuilder-promise-100001").onClick(() => {
        componentSnapshot
          .createFromBuilder(() => {
            // true
            this.nullBuilder2()
          }, 200, false, { scale: 5, waitUntilRenderFinished: false })
          .then((pixmap: image.PixelMap) => {
          })
          .catch((err: Error) => {
            console.log("XXX: error is createFromBuilder promise " + err)
            AppStorage.setOrCreate('code', err)
          })
        console.log("XXX: componentSnapshot.createFromBuilder promise after")
      }).width('100%').height('5%').id('createFromBuilder-promise-100001')

      Button("createFromBuilder-promise-160001").onClick(() => {
        componentSnapshot
          .createFromBuilder(() => {
            // true
            this.nullBuilder()
          }, 200, true, { scale: 5, waitUntilRenderFinished: true })
          .then((pixmap: image.PixelMap) => {
          })
          .catch((err: Error) => {
            console.log("XXX: error is createFromBuilder promise " + err)
            AppStorage.setOrCreate('code', err)
          })
        console.log("XXX: componentSnapshot.createFromBuilder promise after")
      }).width('100%').height('5%').id('createFromBuilder-promise-160001')

      Button("UIContext-createFromBuilder-callback-401").onClick(() => {
        try {
          this.getUIContext().getComponentSnapshot().createFromBuilder(undefined, ((pix) => {
          }))
        } catch (e) {
          console.log(`startDataLoading errorCode: ${e.code}, errorMessage: ${e.message}`);
          AppStorage.setOrCreate('code', e.code)
        }

      }).width('100%').height('5%').id('UIContext-createFromBuilder-callback-401')

      Button("UIContext-createFromBuilder-callback-100001").onClick(() => {
        this.getUIContext().getComponentSnapshot().createFromBuilder(() => {
          this.nullBuilder2()
        },
          (error: Error, pixmap: image.PixelMap) => {
            if (error) {
              console.log("XXX: error: " + error)
              AppStorage.setOrCreate('code', error)
              return;
            }
          }, 200, false, { scale: 5, waitUntilRenderFinished: false }
        )
      }).width('100%').height('5%').id('UIContext-createFromBuilder-callback-100001')

      Button("UIContext-createFromBuilder-callback-160001").onClick(() => {
        this.getUIContext().getComponentSnapshot().createFromBuilder(() => {
          this.nullBuilder()
        },
          (error: Error, pixmap: image.PixelMap) => {
            if (error) {
              console.log("XXX: error: " + error)
              AppStorage.setOrCreate('code', error)
              return;
            }
          }, 0, true, { scale: 5, waitUntilRenderFinished: true }
        )
      }).width('100%').height('5%').id('UIContext-createFromBuilder-callback-160001')

      Button("UIContext-createFromBuilder-promise-401").onClick(() => {
        try {
          this.getUIContext().getComponentSnapshot().createFromBuilder(undefined)
            .then()
        } catch (e) {
          console.log(`startDataLoading errorCode: ${e.code}, errorMessage: ${e.message}`);
          AppStorage.setOrCreate('code', e.code)
        }

      }).width('100%').height('5%').id('UIContext-createFromBuilder-promise-401')

      Button("UIContext-createFromBuilder-promise-100001").onClick(() => {
        this.getUIContext()
          .getComponentSnapshot()
          .createFromBuilder(() => {
            // true
            this.nullBuilder2()
          }, 200, false, { scale: 5, waitUntilRenderFinished: false })
          .then((pixmap: image.PixelMap) => {
          })
          .catch((err: Error) => {
            console.log("XXX: error is createFromBuilder promise " + err)
            AppStorage.setOrCreate('code', err)
          })
        console.log("XXX: componentSnapshot.createFromBuilder promise after")
      }).width('100%').height('5%').id('UIContext-createFromBuilder-promise-100001')

      Button("UIContext-createFromBuilder-promise-160001").onClick(() => {
        this.getUIContext()
          .getComponentSnapshot()
          .createFromBuilder(() => {
            // true
            this.nullBuilder()
          }, 200, true, { scale: 5, waitUntilRenderFinished: true })
          .then((pixmap: image.PixelMap) => {
          })
          .catch((err: Error) => {
            console.log("XXX: error is createFromBuilder promise " + err)
            AppStorage.setOrCreate('code', err)
          })
        console.log("XXX: componentSnapshot.createFromBuilder promise after")
      }).width('100%').height('5%').id('UIContext-createFromBuilder-promise-160001')

      Button("UIContext-createFromComponent-401").onClick(() => {
        this.getUIContext()
          .getComponentSnapshot()
          .createFromComponent(undefined)
          .then((pixmap: image.PixelMap) => {
          })
          .catch((err: Error) => {
            console.log("XXX: error is createFromBuilder promise " + JSON.parse(JSON.stringify(err)).code)
            AppStorage.setOrCreate('code', JSON.parse(JSON.stringify(err)).code)
          })
        console.log("XXX: componentSnapshot.createFromBuilder promise after")

      }).width('100%').height('5%').id('UIContext-createFromComponent-401')

      Button("UIContext-createFromComponent-100001").onClick(() => {
        let uiContext = this.getUIContext();
        let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText2), new Params('hello'));
        this.getUIContext()
          .getComponentSnapshot()
          .createFromComponent(contentNode
            , 320, true, { scale: 2, waitUntilRenderFinished: true })
          .then((pixmap: image.PixelMap) => {
            this.pixmap = pixmap;
          })
          .catch((err: Error) => {
            console.log("error: " + err);
            AppStorage.setOrCreate('code', err)
          })
        console.log("XXX: componentSnapshot.createFromBuilder promise after")
      }).width('100%').height('5%').id('UIContext-createFromComponent-100001')

      Button("UIContext-createFromComponent-160001").onClick(() => {
        let uiContext = this.getUIContext();
        let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params('hello'));
        this.getUIContext()
          .getComponentSnapshot()
          .createFromComponent(
            // true
            contentNode
            , 200, true, { scale: 5, waitUntilRenderFinished: true })
          .then((pixmap: image.PixelMap) => {
          })
          .catch((err: Error) => {
            console.log("XXX: error is createFromBuilder promise " + err)
            AppStorage.setOrCreate('code', err)
          })
        console.log("XXX: componentSnapshot.createFromBuilder promise after")
      }).width('100%').height('5%').id('UIContext-createFromComponent-160001')
    }.width('100%').margin({ left: 10, top: 5, bottom: 5 }).height('90%')
  }
}